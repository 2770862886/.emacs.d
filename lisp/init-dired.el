(require-package 'dired+)

(setq diredp-hide-details-initially-flag nil)

(require 'dired-single)
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer "..")))))

     (if (boundp 'dired-mode-map)
         ;; we're good to go; just add our bindings
         (my-dired-init)
       ;; it's not loaded yet, so add our bindings to the load-hook
       (add-hook 'dired-load-hook 'my-dired-init))

(global-set-key (kbd "C-x d")  'joc-dired-magic-buffer)
(global-set-key (kbd "C-x C-d")  'joc-dired-magic-buffer)

(after-load 'dired
  (require 'dired+)
  (when (fboundp 'global-dired-hide-details-mode)
    (global-dired-hide-details-mode -1))
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map [mouse-2] 'dired-find-file))


(provide 'init-dired)
