;;;; this mode, typing enter triggers reindentation (http://emacsredux.com/)
;; --- seems redundant with binding "RET" to newline-and-indent
;;(electric-indent-mode +1)
;;;; Disable auto indent mode for editing shell scripts
;;(add-hook 'sh-mode-hook
;;          (lambda ()
;;            (set (make-local-variable 'electric-indent-functions)
;;                 (list (lambda (arg) 'no-indent)))))

;; automatically indent when press RET
;; TODO: what is the diff wrt electric-indent-mode?
(global-set-key (kbd "RET") 'newline-and-indent)
;; TODO: Way to disable for shell scripts if annoying? - bind "RET" to newline?

;; White space management:

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; Package: clean-aindent-mode (http://tuhdo.github.io/c-ide.html)
(install-package-if-missing 'clean-aindent-mode)
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;;;; Package: dtrt-indent (http://tuhdo.github.io/c-ide.html)
;; -- Not sure if this is a good idea
;;(install-package-if-missing clean-aindent-mode)
;;(require 'dtrt-indent)
;;(dtrt-indent-mode 1)

;; Package: ws-butler (http://tuhdo.github.io/c-ide.html)
;; -- redundant with delete-trailing-whitespace and only touches
;; -- edited lines. prefer the other option....
;; (install-package-if-missing 'ws-butler)
;; (require 'ws-butler)
;; (add-hook 'prog-mode-hook 'ws-butler-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(message " -- Done setting up auto-indent")
(provide 'setup-auto-indent)
