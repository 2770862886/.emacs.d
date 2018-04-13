(when (maybe-require-package 'markdown-mode)
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

(provide 'init-markdown)
