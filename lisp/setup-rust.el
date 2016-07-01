(install-package-if-missing 'rust-mode)
(add-to-list 'load-path (locate-package-dir 'rust-mode))
;;(require 'go-mode)

(message " -- Done setting up rust")
(provide 'setup-rust)
