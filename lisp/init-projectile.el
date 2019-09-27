;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  ;; (setq-default projectile-mode-line-prefix " Proj")
  (setq projectile-mode-line "Proj")

  (after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  (maybe-require-package 'ibuffer-projectile))


;; #### Change keymap prefix
;; by liangchao 2018.9.12
;; (setq projectile-keymap-prefix (kbd "C-c C-p"))
;; ####

(provide 'init-projectile)
;;; init-projectile.el ends here
