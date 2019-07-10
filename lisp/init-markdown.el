;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\.html\\'")
  (after-load 'whitespace-cleanup-mode
    (push 'markdown-mode whitespace-cleanup-mode-ignore-modes)))

;; #### make pandoc enabled
;; by liangchao 2018.4.10
(when (executable-find "pandoc")
  (require-package 'pandoc-mode)
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (setq markdown-command
        (concat
         "/usr/local/bin/pandoc"
         " --from=markdown --to=html"
         " --standalone --mathjax --highlight-style=pygments")))
;; ####

;; #### support gfm-mode for README.md
;; by liangchao 2018.4.11
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(setq markdown-list-indent-width 4)
(setq markdown-enable-prefix-prompts t)
;; #####

;; #### add new key binding
;; by liangchao 2018.10.7
(eval-after-load "markdown-mode" (lambda ()
                                   (global-set-key (kbd "C-c u") 'markdown-outline-up)
                                   (global-set-key (kbd "C-c n") 'markdown-outline-next)
                                   (global-set-key (kbd "C-c p") 'markdown-outline-previous)))
;; ####

;; #### custome header faces
;; by liangchao 2019.7.10
(custom-set-faces
 '(markdown-header-face-1 ((t (:foreground "#ff79c6"))))
 '(markdown-header-face-2 ((t (:foreground "#bd93f9"))))
 '(markdown-header-face-3 ((t (:foreground "#50fa7b"))))
 '(markdown-header-face-4 ((t (:foreground "#f1fa8c"))))
 '(markdown-header-face-5 ((t (:foreground "#8be9fd"))))
 '(markdown-header-face-6 ((t (:foreground "#ffb86c")))))
;; ####

(provide 'init-markdown)
;;; init-markdown.el ends here
