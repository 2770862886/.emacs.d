;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
;; (setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
  (reapply-themes))

;; #### config custom themes
;; by liangchao, 2018.2.13
;;------------------------------------------------------------------------------
;; load custom theme path
;;------------------------------------------------------------------------------
(let ((basedir "~/.emacs.d/themes"))
  (dolist (f (directory-files basedir))
    (if (and (not (equal f ".."))
             (file-directory-p (concat basedir f)))
        (add-to-list 'custom-theme-load-path (concat basedir f))
      (add-to-list 'custom-theme-load-path basedir))))

(setq-default custom-enabled-themes '(zenburn))

(defun arjen ()
  "Active arjen color theme."
  (interactive)
  (setq custom-enabled-themes '(arjen))
  (reapply-themes))
;; ####

(provide 'init-themes)
;;; init-themes.el ends here
