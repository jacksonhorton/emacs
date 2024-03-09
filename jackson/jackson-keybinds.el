;;;;;;;;;;;;;;;;;;;;
;;
;; Custom keybinds
;;
;;;;;;;;;;;;;;;;;;;;;

;; Keybind for M-x replace-string
(defun replace-string-interactive (string-to-replace replace-string)
  (interactive "sstring-to-replace: \nsreplace-string: " )
  ;;(message "string-to-replace: %s    replace-string: %s" string-to-replace replace-string)
  (replace-string-in-region string-to-replace replace-string))
(keymap-global-set "M-r" 'replace-string-interactive)
(keymap-global-set "M-S-r" 'replace-string)

