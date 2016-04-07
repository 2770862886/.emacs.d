
(defun eshell-mode-hook-func ()
  "initialize eshell env path"
  (let ((ANDROID_HOME "~/Android/Sdk/"))
  (setq eshell-path-env
        (concat (getenv "PATH") ":" (concat ANDROID_HOME "platform-tools/")))))

(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

;; #### enable eshell global hotkey
;; by liangchao, 2016.4.5
(global-set-key [f5] 'eshell)
;; ####

(provide 'init-eshell)
