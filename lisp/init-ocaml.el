;;; File Name: init-ocaml.el
;;;
;;; Last modified time
;;; Time-stamp: <liangchao 03/04/2014 18:44:33>
;;;
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require-package 'tuareg)

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(provide 'init-ocaml)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
