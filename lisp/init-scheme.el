;;; init-scheme --- use geiser, company-mode, paredit
;;; Commentary:
;;; Code:

(require-package 'geiser)

(setq scheme-program-name "racket")
(setq geiser-active-implementations '(racket))
(setq geiser-repl-history-filename "~/.emacs.d/geiser-history")
(setq geiser-repl-query-on-kill-p nil)

(provide 'init-scheme)
;;; init-scheme ends here
