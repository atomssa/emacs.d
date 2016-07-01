(install-package-if-missing 'go-mode)
;;(add-to-list 'load-path (locate-package-dir 'go-mode))
;;(require 'go-mode)

(install-package-if-missing 'go-autocomplete)
;;(add-to-list 'load-path (locate-package-dir 'go-autocomplete))
;;(require 'go-autocomplete)

(install-package-if-missing 'go-snippets)
;;(add-to-list 'load-path (locate-package-dir 'go-snippets))
;;(require 'go-snippets)

(message " -- Done setting up golang")
(provide 'setup-golang)
