;;-----------------------------------------------------------------------------------------
;; This block is for yasnippet (auto completion of structures based on snippets)
;; Somehow it seems incompatible with the auto-complete package. That's a shame
;; Seems like, since tab has same function in auto-complete and yasnippet/expand, one nees
;; some care in defining keybindings to tigger yasnippet expand
;;----------------------------------------------------------------------------------------
(install-package-if-missing 'yasnippet)
(add-to-list 'load-path (locate-package-dir 'yasnippet))
(require 'yasnippet)
(yas/global-mode 1)

;; yasnippet doesn't play well with term-mode
(add-hook 'term-mode-hook (lambda() (setq yas-dont-activate t)))

(provide 'setup-yasnippet-mode)
