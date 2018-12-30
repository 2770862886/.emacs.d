;;; init-python.el --- initialization setup for python
;;; Commentary:
;;; Author:
;;; Code:
(require-package 'elpy)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq pyvenv-virtualenvwrapper-python "/usr/local/bin/python3")
(setq elpy-rpc-backend-python-command "jedi")

(elpy-enable)

;; enable autopep8 formatting on save
(require-package 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (elpy-use-ipython)

;;(require-package 'ein)
;;(require-package 'ein-notebook)
;;(require-package 'ein-subpackages)

(provide 'init-python)
;;; init-python.el ends here
