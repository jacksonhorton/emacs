;;; Other required steps:
;; Install hunspell on macos:
;;   brew install hunspell

; list the packages you want
(setq package-list '(package use-package company crux))
; list the repositories containing them
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

; activate all the packages (in particular autoloads)
(package-initialize)
; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))




;;;; BACKUP script
(setq
backup-by-copying t ; don't clobber symlinks
backup-directory-alist
'(("." . "~/.saves")) ; don't litter my fs tree
delete-old-versions t
kept-new-versions 6
kept-old-versions 2
version-control t)





;; Load individual files

(load "~/.emacs.d/jackson/jackson-sw.el")
(load "~/.emacs.d/jackson/jackson-themes.el")
(load "~/.emacs.d/jackson/jackson-temps.el")
(load "~/.emacs.d/jackson/jackson-lsp.el")
(load "~/.emacs.d/jackson/jackson-drag-stuff.el")
(load "~/.emacs.d/jackson/jackson-keybinds.el")


;; lsp
;(add-hook 'c++-mode-common-hook )




;;gdb many windows???
(setq gdb-many-windows 1)

;; (windmove-default-keybindings)
(windmove-default-keybindings) 
(define-key global-map (kbd "S-<up>") 'windmove-up)
(define-key global-map (kbd "S-<down>") 'windmove-down)
(define-key global-map (kbd "S-<left>") 'windmove-left)
(define-key global-map (kbd "S-<right>") 'windmove-right)
(setq shift-select-mode nil)




;; Joshua T. Guerin
;; Syntax highlighting isn't enabled by default.
;Enable syntax highlighting in the current buffer
(global-font-lock-mode 1)

;Disable the welcome screen
(setq inhibit-startup-message t)
(menu-bar-mode -1)

;;;FOR FLYSPELL MODE
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;Force flyspell mode in certain modes
(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive arg.  For use in hooks."
  (interactive)
  (flyspell-mode 1))
;;;FOR FLYSPELL MODE
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;Use pdflatex to compile LaTeX documents.
(setq latex-run-command "pdflatex")


;;company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2




;; Custom set variables and faces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rustic kaolin-themes switch-window use-package crux company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
