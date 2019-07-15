;;; init-term.el --- initialize and setup multi-term mode
;;; Commentary:
;;; Code:
(require-package 'multi-term)

(setq multi-term-buffer-name "term"
      multi-term-program "/bin/zsh"
      multi-term-program-switches "--login")

(defun toggle-term-mode ()
  "Toggle term mode (line <--> char."
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(defun init-term-settings ()
  "Normally we maintain a margin of N lines between the curosr and edge of the window, but in term mode.the cursor should always be at the bottom of the window."
  (setq-local scroll-margin 0)
  (setq-local scroll-conservatively 0)
  (setq-local scroll-step 1)
  (setq multi-term-dedicated-window-height 80)
  (setq multi-term-dedicated-select-after-open-p t)
  (setq multi-term-dedicated-close-back-to-open-buffer-p t)
  ;; term-char
  (define-key term-raw-map (kbd "C-c C-s") 'multi-term-dedicated-select)
  (define-key term-raw-map (kbd "C-c C-o") 'multi-term-prev)
  (define-key term-raw-map (kbd "C-c C-n") 'multi-term-next)
  (define-key term-raw-map (kbd "C-c C-j") 'toggle-term-mode)
  (define-key term-raw-map (kbd "C-c C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-p") 'term-send-up)
  (define-key term-raw-map (kbd "C-n") 'term-send-down)

  ;; term-line
  (define-key term-mode-map (kbd "C-c C-o") 'multi-term-prev)
  (define-key term-mode-map (kbd "C-c C-n") 'multi-term-next)
  (define-key term-mode-map (kbd "C-c C-j") 'toggle-term-mode))

(add-hook 'term-mode-hook 'init-term-settings)
(add-hook 'term-mode-hook (lambda () (setq-local yas-dont-activate t)))

(global-set-key (kbd "C-c t") 'multi-term)
(global-set-key (kbd "C-c C-t") 'multi-term-dedicated-open)

(provide 'init-term)
;;; init-term.el ends here
