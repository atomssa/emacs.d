(install-package-if-missing 'wanderlust)

(add-to-list 'load-path (locate-package-dir 'wanderlust))
(add-to-list 'load-path (locate-package-dir 'w3m))
(add-to-list 'load-path (locate-package-dir 'semi))
(add-to-list 'load-path (locate-package-dir 'bbdb))

;;(add-to-list 'load-path (concat emacs-init-dir "/elpa/wanderlust-20151005.530/"))
;;(add-to-list 'load-path (concat emacs-init-dir "/elpa/semi-20150525.419/"))
;;(require 'wanderlust)

(autoload 'wl "wl" "Wanderlust" t)



(provide 'setup-mail)
