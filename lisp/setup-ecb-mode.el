;;------------------------------------------------------------------------------
;;  ECB, Emacs Code Browser
;;------------------------------------------------------------------------------
(install-package-if-missing 'ecb)
(add-to-list 'load-path (locate-package-dir 'ecb))

(add-to-list 'load-path "~/.emacs.d/extensions/ecb")
(require 'ecb)
;;(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)

(setq ecb-options-version "2.40")
(setq ecb-windows-width 0.18)

(ecb-activate)

(provide 'setup-ecb-mode)
