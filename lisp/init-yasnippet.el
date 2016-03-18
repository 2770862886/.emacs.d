;;----------------------------------------------------------------------------
;; yassnippet
;;----------------------------------------------------------------------------
(require-package 'yasnippet)
;; (yas-global-mode 1)

;; open ac-dwin
;; (setq ac-dwim t)

(setq yas-snippet-dirs
      '(yas-installed-snippets-dir      ;; the default collection
        "~/.emacs.d/snippets"           ;; personal snippets
        ))

(yas-global-mode 1)

(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.")

(provide 'init-yasnippet)
