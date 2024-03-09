;;;;;;;;;;;;;;;;;
;;             ;;
;;  TEMPLATES  ;;
;;             ;;
;;;;;;;;;;;;;;;;;

(defun main ()
  "Insert main.cpp template at cursor point."
  (interactive)
  (insert "\n#include <iostream>\n\nusing namespace std;\n\nint main() {\n  \n  \n  return 0;\n}\n")
  (backward-char 18)
  )

(defun guard ()
  "Insert header guards into the header file"
  (interactive)
  (setq file_name (split-string (buffer-file-name) "/"))
  (setq file_name (car (last file_name)))
  (setq file_name (upcase file_name))
  (setq file_name (replace-regexp-in-string "\\." "_" file_name))
  (insert "#ifndef ")
  (insert file_name)
  (insert "\n#define ")
  (insert file_name)
  (insert "\n\n")
  (setq current(point))
  (goto-char (point-max))
  (insert "\n#endif //")
  (insert file_name)
  (goto-char current))
