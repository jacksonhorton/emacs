;;;;;;;;;;;;;;;;;;;;;;;;
;;                    ;;
;;       THEMES       ;;
;;                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; M-x customize-themes

;; Install Kaolin Themes
(unless (package-installed-p 'kaolin-themes)
  (package-refresh-contents)
  (package-install 'kaolin-themes))

;; Load Kaolin Aurora
(eval-when-compile
  (require 'kaolin-themes))
(load-theme 'kaolin-aurora t)


;; other theme i like but don't use rn
;(use-package timu-macos-theme  :ensure t  :config  (load-theme 'timu-macos t))
