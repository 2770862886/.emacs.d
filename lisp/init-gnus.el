;;; init-gnus.el --- initialize gnus package

;;; Commentary:
;;
;;; Code:

;; news.x-privat.org
;; nntp.aioe.org
;; gnus setup
(setq user-mail-address "albert.undead@gmail.com")
(setq user-full-name "albert.leung")

;; set email reader
(setq gnus-secondary-select-methods '((nnml "")))

;;
(setq mail-sources
      '((pop :server "pop.gmail.com" ;; 在这里设置 pop3 服务器
             :user "albert.undead@gmail.come" ;; 用户名
             :port "pop3"
             :password "Albert19830504"))) ;; 密码

(setq smtpmail-auth-credentials
      '(("smtp.gmail.com"           ;; SMTP 服务器
         25                         ;; 端口号
         "albert.undead@gmail.come" ;; 用户名
         "Albert19830504")))        ;; 密码

(setq smtpmail-default-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq message-send-mail-function 'smtpmail-send-it)

;; charset
(set-language-environment 'Chinese-GB)
(setq gnus-default-charset 'chinese-iso-8bit
      gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
      gnus-summary-show-article-charset-alist
      '((1 . cn-gb-2312)
        (2 . gb18030)
        (3 . chinese-iso-8bit)
        (4 . gbk)
        (5 . big5)
        (6 . utf-8))
      gnus-newsgroup-ignored-charsets
      '(unknown-8bit x-unknown iso-8859-1))

;; images
(auto-image-file-mode)
(setq mm-inline-large-images t)
;; (setq mm-attachment-override-types '("image/.*"))
;; (add-to-list 'mm-attachment-override-types "image/.*")

;; nntp setup
;; (setq gnus-select-method '(nntp "msnews.microsoft.com"))
(setq gnus-select-method '(nntp "news.newsfan.net"))
(setq gnus-read-active-file nil)

(provide 'init-gnus)

;;; init-gnus.el ends here
