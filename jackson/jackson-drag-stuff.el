;; install
(unless (package-installed-p 'drag-stuff)
  (package-refresh-contents)
  (package-install 'drag-stuff))

;; require
(eval-when-compile
(require 'drag-stuff))

;; enables drag stuff and sets keybinds
(drag-stuff-mode t)
(global-set-key (kbd "C-S-<up>") 'drag-stuff-up)
(global-set-key (kbd "C-S-<down>") 'drag-stuff-down)


;;; if i wanted to use M/Esc-<up>/<down>
;; (define-key input-decode-map "\e\eOA" [(meta up)])
;; (define-key input-decode-map "\e\eOB" [(meta down)])
;; (global-set-key [(meta up)] 'drag-stuff-up)
;; (global-set-key [(meta down)] 'drag-stuff-down)
