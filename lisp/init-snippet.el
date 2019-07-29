;;; init-snippet.el --- snippet
;;; Commentary:
;;; Code:

(require-package 'yasnippet)

(setq yas-snippet-dirs
      '(yas-installed-snippets-dir      ;; the default collection
        "~/.emacs.d/snippets"))         ;; personal snippets

(yas-global-mode 1)

(require 'popup)

(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  "Used for snippet popup.  PROMPT,  CHOICES,  DISPLAY-FN."
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

(require-package 'yankpad)

(use-package yankpad
  :init
  (setq yankpad-file "~/.emacs.d/org/yankpad.org")
  (bind-keys :prefix-map yankmap
             :prefix "C-c y"
             ("c" . yankpad-set-category)
             ("e" . yankpad-edit)
             ("i" . yankpad-insert)
             ("m" . yankpad-map)
             ("r" . yankpad-reload)
             ("x" . yankpad-expand)))

(provide 'init-snippet)
;;; init-snippet ends here
