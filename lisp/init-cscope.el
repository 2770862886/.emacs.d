;(setq cscope-do-not-update-database t)
(require 'ascope)

;; * Keybindings:
;;
;; All keybindings use the "C-c s" prefix, but are usable only while
;; editing a source file, or in the cscope results buffer:
;;
;;      C-c s s         Find symbol.
;;      C-c s d         Find global definition.
;;      C-c s g         Find global definition (alternate binding).
;;      C-c s G         Find global definition without prompting.
;;      C-c s c         Find functions calling a function.
;;      C-c s C         Find called functions (list functions called
;;                      from a function).
;;      C-c s t         Find text string.
;;      C-c s e         Find egrep pattern.
;;      C-c s f         Find a file.
;;      C-c s i         Find files #including a file.
;;
;; These pertain to navigation through the search results:
;;
;;      C-c s b         Display *cscope* buffer.
;;      C-c s B         Auto display *cscope* buffer toggle.
;;      C-c s n         Next symbol.
;;      C-c s N         Next file.
;;      C-c s p         Previous symbol.
;;      C-c s P         Previous file.
;;      C-c s u         Pop mark.
;;
;; These pertain to setting and unsetting the variable,
;; `cscope-initial-directory', (location searched for the cscope database directory):
;;
;;      C-c s a         Set initial directory.
;;      C-c s A         Unset initial directory.
;;
;; These pertain to cscope database maintenance:
;;
;;      C-c s L         Create list of files to index.
;;      C-c s I         Create list and index.
;;      C-c s E         Edit list of files to index.
;;      C-c s W         Locate this buffer's cscope directory
;;                      ("W" --> "where").
;;      C-c s S         Locate this buffer's cscope directory.
;;                      (alternate binding: "S" --> "show").
;;      C-c s T         Locate this buffer's cscope directory.
;;                      (alternate binding: "T" --> "tell").
;;      C-c s D         Dired this buffer's directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ascope
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Usage:
;; load this script using (require 'ascope.el) in you .emacs
;; M-x ascope-init load the cscope database.
;; This command must be issue prior to issue any other command below, the directory feed to this
;; command must be the directory include the cscope.out file
;;
;; M-x ascope-find-global-definition
;; M-x ascope-find-this-symbol
;; M-x ascope-find-this-text-string
;; M-x ascope-find-functions-calling-this-function
;; M-x ascope-find-called-functions
;; M-x ascope-find-files-including-file
;; M-x ascope-all-symbol-assignments
;; M-x ascope-clear-overlay-arrow
;; M-x ascope-pop-mark

;;run next commands in the search result buffer (*Result)
;;ascope-next-symbol this command is bind to key "n"
;;ascope-prev-symbol this command is bind to key "p"
;;ascope-select-entry-other-window-delete-window this command is bind to key "enter"

(global-set-key (kbd "C-c s l") 'ascope-init)
(global-set-key (kbd "C-c s g") 'ascope-find-global-definition)
(global-set-key (kbd "C-c s s") 'ascope-find-this-symbol)
(global-set-key (kbd "C-c s t") 'ascope-find-this-text-string)
(global-set-key (kbd "C-c s c") 'ascope-find-functions-calling-this-function)
(global-set-key (kbd "C-c s i") 'ascope-find-files-including-file)
(global-set-key (kbd "C-c s a") 'ascope-all-symbol-assignments)
(global-set-key (kbd "C-c s x") 'ascope-clear-overlay-arrow)
(global-set-key (kbd "C-c s p") 'ascope-pop-mark)

(provide 'init-cscope)
