;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              ;;
;;    LSP and other stuff :)    ;;
;;                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Jackson Horton

;; Specifies lsp packages required
(setq lsp-package-list '(lsp-mode rust-mode dap-mode which-key haskell-mode))
;; Installs missing
(dolist (package lsp-package-list)
  (unless (package-installed-p package)
    (package-install package)))




;; Set deferred hook (should auto pick up language and run correct hook)
(add-hook 'prog-mode-hook 'lsp-deferred)
;; Less chatty for unsupported modes
(setq lsp-warn-no-matched-clients nil)

;; use packages
;; optionally if you want to use debugger
(use-package dap-mode)
;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(add-to-list 'load-path (expand-file-name "lib/lsp-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lib/lsp-mode/clients" user-emacs-directory))




;;;
;;; This section sets custom compile commands to fit your use based on what hook is active
;;;

(require 'compile)
;; C compile
(add-hook 'c-mode-hook
     (lambda ()
       (unless (file-exists-p "Makefile")
	 (set (make-local-variable 'compile-command)
	      (let ((file (file-name-nondirectory buffer-file-name)))
		(format "%s -c -o %s.o %s %s %s"
                        (or (getenv "CC") "gcc")
                        (file-name-sans-extension file)
                        (or (getenv "CPPFLAGS") "-DDEBUG=9")
                        (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
			file))))))
;; Cpp compile
(add-hook 'c++-mode-hook
     (lambda ()
       (unless (file-exists-p "Makefile")
	 (set (make-local-variable 'compile-command)
	      (let ((file (file-name-nondirectory buffer-file-name)))
		(format "%s -c -o %s.o %s %s"
                        (or (getenv "CC") "g++")
                        (file-name-sans-extension file)
                        (or (getenv "CPPFLAGS") "-Wall -Wextra")
			file))))))
;; Rust compile AND run
;(add-hook 'rust-mode-hook
					;          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook
	  (use-package rust-mode))
(add-hook 'rust-mode-hook
     (lambda ()
       (set (make-local-variable 'compile-command)
	    (let ((file (file-name-nondirectory buffer-file-name)))
	      (format "%s %s"
                      (or (getenv "CC") "cargo")
                      (or (getenv "RUSTFLAGS") "run")
		      file)))))

;; Haskell hook
(add-hook 'haskell-mode-hook
	  (use-package haskell-mode))
(add-hook 'haskell-mode-hook
     (lambda ()
       (set (make-local-variable 'compile-command)
	    (let ((file (file-name-nondirectory buffer-file-name)))
	      (format "ghc -o %s %s"
		      (file-name-sans-extension file)
		      file)))))


