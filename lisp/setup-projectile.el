(install-package-if-missing 'projectile)
(add-to-list 'load-path (locate-package-dir 'projectile))

(require 'projectile)

(projectile-global-mode)

;; use helm as copletion system for projectile
(setq projectile-completion-system 'helm)

;; (setq projectile-enable-caching t) ;; option seems to disable using git for project indexing

(message " -- Done setting up projectile")
(provide 'setup-projectile)
