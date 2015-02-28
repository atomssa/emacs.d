
;; Slime requires installation
;;---------------------------------------------------------------
;; Setup slime setup
;;---------------------------------------------------------------
;;(require 'slime-settings)

;; - paredit needs install
(install-package-if-missing 'paredit)
(add-to-list 'load-path (locate-package-dir 'paredit))

;;-----------------------------------------------------------------
;; clojure modes
;;-----------------------------------------------------------------
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;(setq nrepl-hide-special-buffers t)
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000) ; the default is 500
;;tmp;; ;; paredit to work with clojure-mode
;;tmp;; (defun turn-on-paredit () (paredit-mode 1))
;;tmp;; (add-hook 'clojure-mode-hook 'turn-on-paredit)
;;tmp;; ;; nrepl.el enable eldoc in clojure buffers
;;tmp;; (add-hook 'nrepl-interaction-mode-hook
;;tmp;;   'nrepl-turn-on-eldoc-mode)
;;tmp;; ;; C-c C-z to switch to *nrepl* buffer
;;tmp;; (add-to-list 'same-window-buffer-names "*nrepl*")
;;tmp;; ;; Stop the error buffer from popping up while working in the REPL buffer:
;;tmp;; (setq nrepl-popup-stacktraces nil)


(provide 'setup-lisp-mode)
