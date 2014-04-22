
(deftheme arjen "The arjen transplant theme")

(let ((class '((class color) (min-colors 0)))
      ;; arjen palette
      ;; colors with +x are lighter, colors with -x are darker
      (arjen-fg           "white")
      (arjen-bg-1       "#040404")
      (arjen-bg         "#080808")
      (arjen-bg+1       "#202020")
      (arjen-bg+2       "#4F4F4F")
      (arjen-red+1      "#dca3a3")
      (arjen-red        "#cc9393")
      (arjen-red-1      "#bc8383")
      (arjen-red-2      "#ac7373")
      (arjen-red-3      "#9c6363")
      (arjen-red-4      "#8c5353")
      (arjen-orange     "#dfaf8f")
      (arjen-yellow     "#f0dfaf")
      (arjen-yellow-1   "#e0cf9f")
      (arjen-yellow-2   "#d0bf8f")
      (arjen-green-1    "#5f7f5f")
      (arjen-green      "#7f9f7f")
      (arjen-green+1    "#8fb28f")
      (arjen-green+2    "#9fc59f")
      (arjen-green+3    "#afd8af")
      (arjen-green+4    "#bfebbf")
      (arjen-green+5    "#28FE13")
      (arjen-cyan       "#93e0e3")
      (arjen-blue+1     "#94bff3")
      (arjen-blue       "#8cd0d3")
      (arjen-blue-1     "#7cb8bb")
      (arjen-blue-2     "#6ca0a3")
      (arjen-blue-3     "#5c888b")
      (arjen-blue-4     "#4c7073")
      (arjen-blue-5     "#366060")
	  (arjen-magenta    "#dc8cc3"))

  (custom-theme-set-faces
   'arjen
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,arjen-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,arjen-yellow-2 :underline t :weight normal))))

   ;; basic coloring
   `(default ((t (:foreground ,arjen-fg :background ,arjen-bg ))))
   `(cursor ((t (:foreground "yellow" :background "white"))))
   `(escape-glyph ((t (:foreground ,arjen-yellow :bold t))))
   `(fringe ((t (:foreground ,arjen-fg :background ,arjen-bg+1))))
   `(header-line ((t (:foreground ,arjen-yellow
                      :background ,arjen-bg-1
                      :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background "darkolivegreen"))))

   `(region ((t (:background "blue"))))
   `(right-margin ((t (nil))))
   `(secondary-selection ((t (:background "darkslateblue"))))
   `(text-cursor ((t (:background "yellow" :foreground "black"))))

   ;; mode line
   `(mode-line ((t (:foreground "white"
                    :background "DarkRed"
                    :box (:line-width 1 :style released-button)))))
;;   `(modeline-buffer-id ((t (:background "DarkRed" :foreground "white"))))
   `(mode-line-inactive ((t (:foreground "white"
                             :background "grey30"
                             :box (:line-width 1 :style released-button)))))

   ;;; grep
   `(grep-context-face ((t (:foreground ,arjen-fg))))
   `(grep-error-face ((t (:foreground ,arjen-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,arjen-blue))))
   `(grep-match-face ((t (:foreground ,arjen-orange :weight bold))))
   `(match ((t (:foreground ,arjen-orange :background ,arjen-bg-1 :weight bold))))

   ;; faces used by isearch
   `(isearch ((t (:foreground ,arjen-green+5 :background ,arjen-bg-1))))
   `(isearch-fail ((t (:foreground ,arjen-fg :background ,arjen-red-4))))
   `(lazy-highlight ((t (:foreground ,arjen-yellow :background ,arjen-bg+2))))

   ;; show-paren
   `(show-paren-match ((t (:foreground ,arjen-green+5 :background ,arjen-bg :weight bold))))
   `(show-paren-mismatch ((t (:foreground ,arjen-green :background ,arjen-bg :weight bold))))

   ;; eshell
;   `(eshell-prompt-face ((t (:foreground ,arjen-green+5))))
;   `(eshell-ls-archive-face ((t (:bold t :foreground "IndianRed"))))
;   `(eshell-ls-backup-face ((t (:foreground "Grey"))))
;   `(eshell-ls-clutter-face ((t (:foreground "DimGray"))))
;   `(eshell-ls-directory-face ((t (:bold t :foreground "MediumSlateBlue"))))
;   `(eshell-ls-executable-face ((t (:foreground "Coral"))))
;   `(eshell-ls-missing-face ((t (:foreground "black"))))
;   `(eshell-ls-picture-face ((t (:foreground "Violet"))))
;   `(eshell-ls-product-face ((t (:foreground "sandybrown"))))
;   `(eshell-ls-readonly-face ((t (:foreground "Aquamarine"))))
;   `(eshell-ls-special-face ((t (:foreground "Gold"))))
;   `(eshell-ls-symlink-face ((t (:foreground "White"))))
;   `(eshell-ls-unreadable-face ((t (:foreground "DimGray"))))

   `(eshell-prompt ((t (:foreground ,arjen-green+5 :weight bold))))
   `(eshell-ls-archive ((t (:foreground "IndianRed" :weight bold))))
   `(eshell-ls-backup ((t (:foreground "Grey"))))
   `(eshell-ls-clutter ((t (:foreground "DimGray"))))
   `(eshell-ls-directory ((t (:foreground ,arjen-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,arjen-red+1 :weight bold))))
   `(eshell-ls-missing-face ((t (:foreground "black"))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning))))
   `(eshell-ls-product ((t (:inherit font-lock-doc))))
   `(eshell-ls-readonly-face ((t (:foreground "Aquamarine"))))
   `(eshell-ls-special ((t (:foreground ,arjen-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,arjen-cyan :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,arjen-fg))))

   ;; tabbar
   `(tabbar-button ((t (:foreground ,arjen-bg :background ,arjen-bg))))
   `(tabbar-selected ((t (:foreground ,arjen-fg
                          :background ,arjen-bg
                          :box (:line-width 1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,arjen-fg
                            :background ,arjen-bg+1
                            :box (:line-width 1 :style released-button)))))

   `(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
   `(font-lock-comment-face ((t (:foreground ,arjen-red-4))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,arjen-red-3))))
   `(font-lock-constant-face ((t (:foreground "Aquamarine"))))
   `(font-lock-doc-face ((t (:foreground ,arjen-red-3))))
   `(font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
   `(font-lock-function-name-face ((t (:foreground ,arjen-blue+1))))
   `(font-lock-keyword-face ((t (:foreground ,arjen-blue-4))))
   `(font-lock-negation-char-face ((t (:foreground ,arjen-blue-5))))
   `(font-lock-preprocessor-face ((t (:foreground ,arjen-blue-4))))
   `(font-lock-reference-face ((t (:foreground "SlateBlue"))))
   `(font-lock-string-face ((t (:foreground "Orange"))))
   `(font-lock-type-face ((t (:foreground ,arjen-blue-3))))
   `(font-lock-variable-name-face ((t (:foreground "darkseagreen"))))
   `(font-lock-warning-face ((t (:bold t :foreground "Pink"))))
   `(font-lock-reference-face ((t (:foreground ,arjen-blue-3))))
   `(c-annotation-face ((t (:inherit font-lock-constant-face)))))

 ;;; custom theme variables
  (custom-theme-set-variables
   'arjen
   `(ansi-color-names-vector [,arjen-bg ,arjen-red ,arjen-green ,arjen-yellow
                              ,arjen-blue ,arjen-magenta ,arjen-cyan ,arjen-fg])
   `(ansi-term-color-vector [,arjen-bg ,arjen-red ,arjen-green ,arjen-yellow
                             ,arjen-blue ,arjen-magenta ,arjen-cyan ,arjen-fg])
   ;; fill-column-indicator
   `(fci-rule-color ,arjen-bg+2)))

;; autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'arjen)
