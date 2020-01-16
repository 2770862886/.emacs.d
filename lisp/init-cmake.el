;;; init-cmake.el --- cmake editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'cmake-mode)

(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

(provide 'init-cmake)
;;; init-cmake.el ends here
