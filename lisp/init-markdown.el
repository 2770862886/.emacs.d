(when (maybe-require-package 'markdown-mode)
  (after-load 'whitespace-cleanup-mode
    (push 'markdown-mode whitespace-cleanup-mode-ignore-modes)))

;; #### make pandoc enabled
;; by liangchao 2018.4.10
(when (executable-find "pandoc")
  (require-package 'pandoc-mode)
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (custom-set-variables '(markdown-command "/usr/local/bin/pandoc")))
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
;; #####

(provide 'init-markdown)
