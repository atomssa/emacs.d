(install-package-if-missing 'cider)
(add-to-list 'load-path (locate-package-dir 'cider))

(require 'cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(provide 'setup-cider)
