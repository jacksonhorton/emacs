;;;;;;;;;;;
;;
;; Switch-window has a mvborder function that lets me resize windows
;;
;; Installs package
(unless (package-installed-p 'switch-window)
  (package-refresh-contents)
  (package-install 'switch-window))

;; Require package
(eval-when-compile
  (require 'switch-window))


;;switch-window keybinds
(global-set-key (kbd "C-S-<left>") 'switch-window-mvborder-left)
(global-set-key (kbd "C-S-<right>") 'switch-window-mvborder-right)
