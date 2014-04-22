(require 'go-mode-load)
(require 'go-autocomplete)

(add-hook 'go-mode-hook
          (lambda ()
            (linum-mode 1)
            (flymake-mode 1)
            (auto-complete-mode 1)
            (add-to-list 'ac-sources 'ac-source-go)
            (call-process "gocode" nil nil nil "-s")))

;; helper functions
(defun go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

(defun go-fmt-buffer ()
  "run gofmt on current buffer"
  (interactive)
  (if buffer-ready-only
          (progn
                (ding)
                (message "Buffer is read only"))
          (let ((p (line-number-at-pos))
                        (filename (buffer-file-name))
                        (old-max-mini-window-height max-mini-window-height))
                (show-all)
                (if (get-buffer "*Go Reformat Errors*")
                        (kill-buffer "*Go Reformat Error*")))
          (setq max-mini-window-height 1)
          (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
                  (progn
                        (erase-buffer)
                        (insert-buffer-substring "*Go Reformat Output*")
                        (goto-char (point-min))
                        (forward-line (1- p)))
                (while-current-buffer "*Go Reformat Errors*"
                (progn
                  (goto-char (point-min))
                  (while (re-search-forward "<standard input>" nil t)
                        (replace-match filename))
                  (goto-char (point-min))
                  (compilation-mode))))
          (setq max-mini-window-height old-max-mini-window-height)
          (delete-windows-on "*Go Reformat Output*")))

(defun go-fix-buffer ()
  "run gofix on current buffer"
  (interactive)
  (show-all)
  (shell-command-on-region (point-min) (point-max) "go tool fix -deff"))

(provide 'init-golang)
