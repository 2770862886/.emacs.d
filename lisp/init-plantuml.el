;;; init-plantuml.el --- initialize plantuml-mode
;;; Commentary:
;;; must load this file after orgmode
;;;
;;; Code:

(use-package plantuml-mode
  :ensure t
  :mode "\\.plantuml$"
  :config
  ;; Sample jar configuration
  (setq plantuml-jar-path "~/.emacs.d/bin/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-output-type "png"))

(use-package flycheck-plantuml
  :ensure t
  :requires plantuml-mode
  :config
  (flycheck-plantuml-setup))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
