;;; init-golang --- configuration of golang mode
;;; Commentary:
;;;
;;; created by liangchao, last edit on 2018.8.3
;;;
;;; Code:

(eval-after-load "go-mode"
  '(progn
     (flycheck-declare-checker go-gofmt
                               "A Go syntax and style checker using the gofmt utility."
                               :command '("gofmt" source-inplace)
                               :error-patterns '(("^\\(?1:.*\\):\\(?2:[0-9]+\\):\\(?3:[0-9]+\\): \\(?4:.*\\)$" error))
                               :modes 'go-mode)
     (add-to-list 'flycheck-checkers 'go-gofmt)))

(add-hook 'go-mode-hook 'flycheck-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(provide 'init-golang)
;;; init-golang ends here
