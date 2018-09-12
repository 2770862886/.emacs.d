(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (after-load 'projectile
    (setq-default
     projectile-mode-line
     '(:eval
       (if (file-remote-p default-directory)
           " Proj"
         (format " Proj[%s]" (projectile-project-name)))))))

;; #### Change keymap prefix
;; by liangchao 2018.9.12
(setq projectile-keymap-prefix (kbd "C-c C-p"))
;; ####

(provide 'init-projectile)
