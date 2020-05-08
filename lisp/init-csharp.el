;;; init-csharp.el --- Support for lsp and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package csharp-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

  (add-hook 'csharp-mode-hook #'company-mode)
  (add-hook 'csharp-mode-hook #'flycheck-mode))

(use-package omnisharp
  :ensure t
  :after company
  :config
  (add-hook 'csharp-mode-hook #'omnisharp-mode)
  (add-to-list 'company-backends 'company-omnisharp)
  )

(provide 'init-csharp)
;;; init-csharp.el ends here
