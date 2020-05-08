;;; init-lsp.el --- Support for lsp-mode and relate configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package hydra :ensure t)

(use-package lsp-ivy
  :ensure t
  :config
  (defun netrom/lsp-ivy-workspace-symbol-at-point ()
    (interactive)
    (let ((current-prefix-arg t))
      (call-interactively #'lsp-ivy-workspace-symbol)))
  (defun netrom/lsp-ivy-global-workspace-symbol-at-point ()
    (interactive)
    (let ((current-prefix-arg t))
      (call-interactively #'lsp-ivy-global-workspace-symbol))))

(use-package lsp-mode
  :hook ((web-mode . lsp)
         (js-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp)
         (lua-mode . lsp))
  :config
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))
  (setq lsp-prefer-flymake nil) ;; Prefer using lsp-ui (flycheck) over flymake.
  (setq netrom--general-lsp-hydra-heads
        '(;; Xref
          ("d" xref-find-definitions "Definitions" :column "Xref")
          ("D" xref-find-definitions-other-window "-> other win")
          ("r" xref-find-references "References")
          ("s" netrom/lsp-ivy-workspace-symbol-at-point "ivy search")
          ("S" netrom/lsp-ivy-global-workspace-symbol-at-point "ivy global search")

          ;; Peek
          ("C-d" lsp-ui-peek-find-definitions "Definitions" :column "Peek")
          ("C-r" lsp-ui-peek-find-references "References")
          ("C-i" lsp-ui-peek-find-implementation "Implementation")

          ;; LSP
          ("p" lsp-describe-thing-at-point "Describe at point" :column "LSP")
          ("C-a" lsp-execute-code-action "Execute code action")
          ("R" lsp-rename "Rename")
          ("t" lsp-goto-type-definition "Type definition")
          ("i" lsp-goto-implementation "Implementation")
          ("f" helm-imenu "Filter funcs/classes (Helm)")
          ("C-c" lsp-describe-session "Describe session")
          ;; Flycheck
          ("l" lsp-ui-flycheck-list "List errs/warns/notes" :column "Flycheck"))

        netrom--misc-lsp-hydra-heads
        '(;; Misc
          ("q" nil "Cancel" :column "Misc")
          ("b" pop-tag-mark "Back")))
  ;; Create general hydra.
  (eval `(defhydra netrom/lsp-hydra (:color blue :hint nil)
           ,@(append
              netrom--general-lsp-hydra-heads
              netrom--misc-lsp-hydra-heads)))
  (add-hook 'lsp-mode-hook
            (lambda () (local-set-key (kbd "C-c C-j") 'netrom/lsp-hydra/body))))

;; optionally
(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  :config

  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(setq company-minimum-prefix-length 1
      company-idle-delay 0.2) ;; default is 0.2

;; (use-package lsp-lua-emmy
;;   :demand
;;   :ensure nil
;;   :load-path "~/.emacs.d/bin/"
;;   :config
;;   (setq lsp-lua-emmy-jar-path (expand-file-name "EmmyLua-LS-all.jar" user-emacs-directory)))

(defun set-company-backends-for-lua ()
  "Set lua company backend."
  (setq-local company-backends '(
                                 (
                                  company-lsp
                                  company-lua
                                  company-keywords
                                  company-gtags
                                  company-yasnippet)
                                 company-capf
                                 company-dabbrev-code
                                 company-files)))

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :hook (lua-mode . set-company-backends-for-lua)
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil))

(provide 'init-lsp)
;;; init-lsp.el ends here
