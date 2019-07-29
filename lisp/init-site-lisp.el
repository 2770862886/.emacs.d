;;; init-site-lisp.el --- Support elisp manually installed in the site-lisp dir -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Set load path

(eval-when-compile (require 'cl))
(defun sanityinc/add-subdirs-to-load-path (parent-dir)
  "Adds every non-hidden subdir of PARENT-DIR to `load-path'."
  (let* ((default-directory parent-dir))
    (progn
      (setq load-path
            (append
             (remove-if-not
              (lambda (dir) (file-directory-p dir))
              (directory-files (expand-file-name parent-dir) t "^[^\\.]"))
             load-path)))))

(sanityinc/add-subdirs-to-load-path
 (expand-file-name "site-lisp/" user-emacs-directory))

;;; Utilities for grabbing upstream libs

(defun site-lisp-dir-for (name)
  (expand-file-name (format "site-lisp/%s" name) user-emacs-directory))

(defun site-lisp-library-el-path (name)
  (expand-file-name (format "%s.el" name) (site-lisp-dir-for name)))

(defun download-site-lisp-module (name url)
  (let ((dir (site-lisp-dir-for name)))
    (message "Downloading %s from %s" name url)
    (unless (file-directory-p dir)
      (make-directory dir t))
    (add-to-list 'load-path dir)
    (let ((el-file (site-lisp-library-el-path name)))
      (url-copy-file url el-file t nil)
      el-file)))

(defun ensure-lib-from-url (name url)
  (unless (site-lisp-library-loadable-p name)
    (byte-compile-file (download-site-lisp-module name url))))

(defun site-lisp-library-loadable-p (name)
  "Return whether or not the library `name' can be loaded from a
source file under ~/.emacs.d/site-lisp/name/"
  (let ((f (locate-library (symbol-name name))))
    (and f (string-prefix-p (file-name-as-directory (site-lisp-dir-for name)) f))))

(require 'dired-single)
;;; #### init dired-single config
;;; by liangchao, 2018.3.1
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's loaded."
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (lambda nil (interactive) (dired-single-buffer ".."))))

(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))
;;; ####

(require 'recent-jump)
(setq recent-jump-threshold 4)
(setq recent-jump-ring-length 10)
(global-unset-key [M-left])
(global-unset-key [M-right])
(global-set-key (kbd "M-<left>") 'recent-jump-jump-backward)
(global-set-key (kbd "M-<right>") 'recent-jump-jump-forward)
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

;;; #### add google c code style
;;; by liangchao, 2018.3.1
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;; ####

;;; #### add cscope config
;;; by liangchao, 2018.3.28
(require 'xcscope)
;;; ####

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
