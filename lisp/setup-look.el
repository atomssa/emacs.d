;;(install-package-if-missing 'monokai-theme)
;;(add-to-list 'custom-theme-load-path (locate-package-dir 'monokai-theme))
(load-theme 'monokai t)

;;(load-theme 'dark-krystal t)
;;(load-theme 'zenburn t)

;;(install-package-if-missing 'firecode-theme)
;;(add-to-list 'custom-theme-load-path (locate-package-dir 'firecode-theme))
;;(load-theme 'firecode t)

;;(install-package-if-missing 'solarized-theme)
;;(add-to-list 'custom-theme-load-path (locate-package-dir 'solarized-theme))
;;(load-theme 'solarized-dark)

;; Set default window size if in graphics mode
;;(if (window-system)
;;    (progn
;;      (set-frame-height (selected-frame) 55)
;;      (set-frame-width (selected-frame) 184)))
;;(set-frame-height (selected-frame) 55)
;;(set-frame-width (selected-frame) 184)
;;(add-to-list 'default-frame-alist '(height . 55))
;;(add-to-list 'default-frame-alist '(width . 184))
;;(set-frame-height 55)
;;(set-frame-width 184)

(defun setup-frame-size (the-frame)
  (if (display-graphic-p the-frame)
      (progn (set-frame-size the-frame 184 55)
	     (set-face-attribute 'default nil :height 150))))

(if (window-system) (setup-frame-size (selected-frame)))
(add-hook 'after-make-frame-functions 'setup-frame-size)

;; The font height is closely related

;; install modes that are not available by default, if not already there
(install-package-if-missing 'cmake-mode)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(message " -- Done setting up look-n-feel")
(provide 'setup-look)
