;;; init-plantuml.el --- initialize plantuml-mode
;;; Commentary:
;;; must load this file after orgmode
;;;
;;; Code:

(use-package plantuml-mode
  :ensure t
  :config
  ;; Enable plantuml-mode for PlantUML files
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  ;; Sample jar configuration
  (setq plantuml-jar-path "~/.emacs.d/bin/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-output-type "png")
  (with-eval-after-load 'flycheck
    (require-package 'flycheck-plantuml)
    (flycheck-plantuml-setup)))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
