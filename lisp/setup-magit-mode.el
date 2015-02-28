;;---------------------
;; Magit
;;-------------------
(install-package-if-missing 'magit)
(add-to-list 'load-path (locate-package-dir 'magit))
(require 'magit)

(provide 'setup-magit-mode)
