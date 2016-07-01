;;------------------------------------------------------------------------------
;;popup.el necessary?
;;------------------------------------------------------------------------------
;; (install-package-if-missing 'popup)
;; (add-to-list 'load-path (locate-package-dir 'popup))

;;------------------------------------------------------------------------------
;;auto-complete
;;------------------------------------------------------------------------------
(install-package-if-missing 'auto-complete)
(add-to-list 'load-path (locate-package-dir 'auto-complete))
(global-auto-complete-mode t)
;;(auto-complete-mode t)

(require 'auto-complete-config)

;;(setq ac-auto-start 1)
;;(setq ac-auto-show-menu 0.05)

;; Alex Ott's suggestion to make ac work well with CEDET
;; http://stackoverflow.com/questions/13218664/setting-up-autocomplete-to-work-with-semantic
(setq ac-auto-start 3)
(setq ac-auto-show-menu t)

(add-to-list 'ac-dictionary-directories (concat (locate-package-dir 'auto-complete) "dict"))
(setq ac-comphist-file (expand-file-name "~/.emacs.d/ac-comphist.dat"))

(ac-config-default)

(ac-flyspell-workaround)

;;--------------------------------------------------------------------
;; default gtags implementation sucks (gets stuck on shell execution)
;; culprit file is auto-complete-config.el from auto-complete package
;; ------ DEFAULT -------
;; (defun ac-gtags-candidate ()
;;   (ignore-errors
;;     (split-string (shell-command-to-string (format "global -ciq %s" ac-prefix)) "\n")))
;; ------
;; this is troublesome for some prefixes
;; For this reason if gtags completion is wished, advisable to limit
;; global call to at-least 4 chars gtag prefix completion is amazing
;; fast for less than 4 tags. This is my hack. Needs to be compiled
;; ------ MY HACK -------
;; (defun ac-gtags-candidate ()
;;   (ignore-errors
;;     (if (> (length ac-prefix) 3)
;; 	(split-string (shell-command-to-string (format "global -cq %s" ac-prefix)) "\n"))))
;; ------
;; This way, get to enjoy global gtag based completion but only after a
;; reasonable number of prefix chars has been collected instead of yanking
;; gtags completely which would have solved the issue of getting stuck
;; Check this again in Java editing mode
;; TODO:
;;  Make the min number of chars required before firing gtag a parameter
;;  and eventually send a pull request to developpers
;;--------------------------------------------------------------------

(message "ac-sources: %s" ac-sources)

(message " -- Done setting up auto-complete")
(provide 'setup-auto-complete)
