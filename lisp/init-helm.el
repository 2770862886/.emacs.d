;;; helm-mode.el --- initialize helm mode

;;; Commentary:
;;
;;; Code:
(require-package 'helm)

(helm-mode 1)

(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(provide 'init-helm)

;;; init-helm.el ends here
