;; tramp is built in, no need to install, just setup
;;------------------------------------------------------------------------------
;; TRAMP - the most awesome thing since sliced bread? http://www.emacswiki.org/emacs/TrampMode
;; With fuse-fs remote mounting over ssh, tramp somewhat less useful
;;------------------------------------------------------------------------------
;;(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(require 'tramp)
;;(add-to-list 'tramp-restricted-shell-hosts-alist "\\`rssh\\.rhic\\.bnl\\.domain\\'")
;;(add-to-list 'tramp-default-proxies-alist '("rcas2069" nil "tujuba@rssh.rhic.bnl.gov" ) );
(add-to-list 'tramp-default-proxies-alist
             '("\\`rcas2069\\'"
               nil
               "/ssh:%u@rssh.rhic.bnl.gov:"))
(setq tramp-default-method "ssh")
(setq tramp-verbose 4)
(setq debug-on-error t)
;;(setq debug-on-signal t)
(setq tramp-prompt-pattern "^[^>$][>$] *")
;;(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

(provide 'setup-tramp-mode)
