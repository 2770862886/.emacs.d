;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'json-mode)
(maybe-require-package 'js2-mode)
(maybe-require-package 'coffee-mode)
(maybe-require-package 'typescript-mode)
(maybe-require-package 'prettier-js)
;; ### Add js2-refactor
;; by liangchao, 2018.2.24
(maybe-require-package 'js2-refactor)
(maybe-require-package 'xref-js2)
;; ###


(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js-mode))

;; #### Change tab width to 4
;; by liangchao, 2016.3.17
(defconst preferred-javascript-indent-level 4)
;; ####

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order

(add-to-list 'auto-mode-alist '("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode))


;; js2-mode

;; Change some defaults: customize them to override

;; #### Change tab width to 4
;; by liangchao, 2016.3.17
(setq-default js2-basic-offset 4
              js2-bounce-indent-p t)
;; ####

(after-load 'js2-mode
  ;; Disable js2 mode's syntax error highlighting by default...
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer "flycheck")
  (defun sanityinc/enable-js2-checks-if-flycheck-inactive ()
    (unless (flycheck-get-checker-for-buffer)
      (setq-local js2-mode-show-parse-errors t)
      (setq-local js2-mode-show-strict-warnings t)))
  (add-hook 'js2-mode-hook 'sanityinc/enable-js2-checks-if-flycheck-inactive)

  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))

  (js2-imenu-extras-setup)
  (add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))
  ;; #### config js2-refactor mode
  ;; by liangchao, 2018.2.24
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
  ;; unbind it.
  (define-key js-mode-map (kbd "M-.") nil)
  (add-hook 'js2-mode-hook (lambda ()
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
;; ####

;; #### Remove uneccessary code
;; by liangchao, 2019.5.5
;; js-mode
;; (setq-default js-indent-level preferred-javascript-indent-level)
;; ####


(add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))



(when (and (executable-find "ag")
           (maybe-require-package 'xref-js2))
  (after-load 'js2-mode
    (define-key js2-mode-map (kbd "M-.") nil)
    (add-hook 'js2-mode-hook
              (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))))



;;; Coffeescript

(after-load 'coffee-mode
  (setq-default coffee-js-mode js2-mode
                coffee-tab-width js-indent-level))

(when (fboundp 'coffee-mode)
  (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode)))

;; ---------------------------------------------------------------------------
;; Run and interact with an inferior JS via js-comint.el
;; ---------------------------------------------------------------------------

(when (maybe-require-package 'js-comint)
  (setq js-comint-program-command "node")

  (defvar inferior-js-minor-mode-map (make-sparse-keymap))
  (define-key inferior-js-minor-mode-map "\C-x\C-e" 'js-send-last-sexp)
  (define-key inferior-js-minor-mode-map "\C-cb" 'js-send-buffer)

  (define-minor-mode inferior-js-keys-mode
    "Bindings for communicating with an inferior js interpreter."
    nil " InfJS" inferior-js-minor-mode-map)

  (dolist (hook '(js2-mode-hook js-mode-hook))
    (add-hook hook 'inferior-js-keys-mode)))

;; ---------------------------------------------------------------------------
;; Alternatively, use skewer-mode
;; ---------------------------------------------------------------------------

(when (maybe-require-package 'skewer-mode)
  (after-load 'skewer-mode
    (add-hook 'skewer-mode-hook
              (lambda () (inferior-js-keys-mode -1)))))



(when (maybe-require-package 'add-node-modules-path)
  (after-load 'typescript-mode
    (add-hook 'typescript-mode-hook 'add-node-modules-path))
  (after-load 'js2-mode
    (add-hook 'js2-mode-hook 'add-node-modules-path)))


(require-package 'tide)

(defun setup-tide-mode ()
  "Setup tide mode manully."
  (interactive)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (local-set-key (kbd "C-c C-t t") 'tide-restart-server)
  (local-set-key (kbd "C-c C-t l") 'tide-list-servers)
  (local-set-key (kbd "C-c C-t f") 'tide-fix)
  (local-set-key (kbd "C-c C-t F") 'tide-format)
  (local-set-key (kbd "C-c C-t e") 'tide-error-at-point)
  (local-set-key (kbd "C-c C-t E") 'tide-project-errors)
  (local-set-key (kbd "C-c C-t i") 'tide-documentation-at-point)
  (local-set-key (kbd "C-c C-t n") 'tide-rename-symbol)
  (local-set-key (kbd "C-c C-t o") 'tide-organize-imports)
  (local-set-key (kbd "C-c C-t r") 'tide-references)
  (local-set-key (kbd "C-c C-t R") 'tide-refactor))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

;; full list of supported format options:
;; https://github.com/Microsoft/TypeScript/blob/v3.3.1/src/server/protocol.ts#L2858-L2890
(setq tide-format-options
      '(
        :indentSize 4
        :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
        :insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces nil
        :placeOpenBraceOnNewLineForFunctions nil
        :noUnusedLocals t))

(provide 'init-javascript)
;;; init-javascript.el ends here
