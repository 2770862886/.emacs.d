;;; init-js.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'tide)

(defun setup-tide-mode ()
  "Setup tide mode manully."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (company-mode +1)
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

(use-package tide
  :ensure t
  :config
  (progn
    (company-mode +1)
    (setq company-tooltip-align-annotation t)
    (add-hook 'typescript-mode-hook #'setup-tide-mode)
    (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))))

;; full list of supported format options:
;; https://github.com/Microsoft/TypeScript/blob/v3.3.1/src/server/protocol.ts#L2858-L2890
(setq tide-format-options
      '(
        :indentSize 4
        :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
        :insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces nil
        :placeOpenBraceOnNewLineForFunctions nil
        :noUnusedLocals t))

(require-package 'json-mode)

(use-package json-mode
  :ensure t
  :config
  (progn
    (flycheck-add-mode 'json-jsonlint 'json-mode)
    (add-hook 'json-mode-hook 'flycheck-mode)
    (setq js-indent-level 4)
    (add-to-list 'auto-mode-alist '("\\.json" . json-mode))))

(use-package web-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.js" . web-mode))
    ;; this magic incantation fixes highlighting of jsx syntax
    (setq web-mode-content-types-alist
          '(("jsx" . "\\.js[x]?\\'")))
    (add-hook 'web-mode-hook
              (lambda ()
                (setq web-mode-code-indent-offset 4)
                (when (string-equal "tsx" (file-name-extension buffer-file-name))
                  (setup-tide-mode))
                (when (string-equal "jsx" (file-name-extension buffer-file-name))
                  (setup-tide-mode))
                (when (string-equal "js" (file-name-extension buffer-file-name))
                  (progn
                    (setup-tide-mode)
                    (with-eval-after-load 'flycheck
                      (flycheck-add-mode 'typescript-tslint 'web-mode)
                      (flycheck-add-mode 'javascript-tide 'web-mode))))))
    ))

(provide 'init-js)
;;; init-js.el ends here
