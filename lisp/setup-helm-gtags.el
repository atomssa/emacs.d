;; make sure it is installed before setting up
(install-package-if-missing 'helm-gtags)
(add-to-list 'load-path (locate-package-dir 'helm-gtags))

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-suggested-key-mapping t
 helm-gtags-prefix-key "\C-cg" )

(require 'helm-gtags)

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)
;; Enable helm-gtags-mode in Eshell for the same reason as above
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; key bindings
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-find-symbol)
(define-key helm-gtags-mode-map (kbd "C-c g t") 'helm-gtags-show-stack)
(define-key helm-gtags-mode-map (kbd "C-c g f") 'helm-gtags-find-files)
(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "C-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "C-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-/") 'helm-gtags-find-rtag)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(provide 'setup-helm-gtags)
