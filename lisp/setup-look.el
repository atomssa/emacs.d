(install-package-if-missing 'monokai-theme)
(add-to-list 'custom-theme-load-path (locate-package-dir 'monokai-theme))
(load-theme 'monokai t)

;;(install-package-if-missing 'solarized-theme)
;;(add-to-list 'custom-theme-load-path (locate-package-dir 'solarized-theme))
;;(load-theme 'solarized-dark)

;; Set default window size if in graphics mode
(if (window-system)
    (progn
      (set-frame-height (selected-frame) 50)
      (set-frame-width (selected-frame) 180)))

;; The font height is closely related
(set-face-attribute 'default nil :height 150)

;; install modes that are not available by default, if not already there
(install-package-if-missing 'cmake-mode)

(provide 'setup-look)
