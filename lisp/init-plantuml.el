;;; init-plantuml.el --- initialize plantuml-mode
;;; Commentary:
;;; must load this file after orgmode
;;;
;;; Code:

(require-package 'plantuml-mode)
;; Enable plantuml-mode for PlantUML files
;; (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/bin/plantuml.jar"))

(setq plantuml-jar-path
      (expand-file-name "~/.emacs.d/bin/plantuml.jar"))

;; #+BEGIN_SRC plantuml
;; <hit C-c ' here to open a plantuml-mode buffer>
;; #+END_SRC

(with-eval-after-load 'flycheck
  (require-package 'flycheck-plantuml)
  (flycheck-plantuml-setup))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
