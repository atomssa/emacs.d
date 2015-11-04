;;------------------------------------------------------------------------------
; This block is for iy-go-to-char
;;------------------------------------------------------------------------------
(install-package-if-missing 'iy-go-to-char)
(add-to-list 'load-path (locate-package-dir 'iy-go-to-char))
(require 'iy-go-to-char)
(define-key global-map "\M-n" 'iy-go-to-char)

;;;; don't like that autopair binds C-m
;;;;------------------------------------------------------------------------------
;;;; This block is for autopair (for braces, quotations etcetera )
;;;;------------------------------------------------------------------------------
;;(install-package-if-missing 'autopair)
;;(add-to-list 'load-path (locate-package-dir 'autopair))
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers
;;;; disable for minibuffer -- hoorai, it works
;;(add-hook 'minibuffer-setup-hook
;;	  (lambda()
;;	    (autopair-mode 0)))
;;(add-hook 'minibuffer-exit-hook
;;	  (lambda()
;;	    (autopair-mode 1)))

(install-package-if-missing 'smartparens)
(add-to-list 'load-path (locate-package-dir 'smartparens))
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)
;; -- smartparens is disabled in minibuffer (sensible) no need for disabling explicitly

;; better way to disable stuff selectively in minibuffer?: use minibufferp predicate
;;(defun auto-complete-mode-maybe ()
;;  "No maybe for you. Only AC!"
;;  (unless (minibufferp (current-buffer))
;;    (auto-complete-mode 1)))

;;(defun disable-in-minibuffer (mode)
;;  "Disable the mode given in argument in the minibuffer
;;and reenable on exit from minibuffer. Useful for stuff like paredit"
;;  (progn
;;    (add-hook 'minibuffer-setup-hook
;;	      (lambda()
;;		('mode 0)))
;;    (add-hook 'minibuffer-exit-hook
;;	      (lambda()
;;		('mode 1)))))
;;
;;(disable-in-minibuffer 'autopair-mode)

;;;;------------------------------------------------------------------------------
;;;; This block is for flex-autopair (for braces, quotations etcetera )
;;;;------------------------------------------------------------------------------
;;(install-package-if-missing 'flex-autopair)
;;(add-to-list 'load-path (locate-package-dir 'flex-autopair))
;;(add-to-list 'load-path "~/.emacs.d/elpa/flex-autopair-20120809.518")
;;(require 'flex-autopair)
;;(flex-autopair-mode 1)

;;---------------------------------------------------------------
;; Annoying arrows mode -- woth obnoxious visiaul bell
;;---------------------------------------------------------------
;;(install-package-if-missing 'annoying-arrows-mode)
;;(add-to-list 'load-path (locate-package-dir 'annoying-arrows-mode))
;;(require 'annoying-arrows-mode)
;;(global-annoying-arrows-mode)
;;;;(setq visible-bell 1)
;;(setq visible-bell nil)
;;;;(setq ring-bell-function `(lambda ()
;;;; 			    (set-face-background 'default "DodgerBlue")
;;;; 			    (set-face-background 'default "gray12")))
;;;; disable annoying arrows mode in buffer
;;;; disable for minibuffer -- hoorai, it works
;;(add-hook 'minibuffer-setup-hook
;;	  (lambda()
;;	    (annoying-arrows-mode 0)))
;;(add-hook 'minibuffer-exit-hook
;;	  (lambda()
;;	    (annoying-arrows-mode 1)))


(install-package-if-missing 'sr-speedbar)
(add-to-list 'load-path (locate-package-dir 'sr-speedbar))
(require 'sr-speedbar)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-x 5)
(setq sr-speedbar-width-console 5)
(setq sr-speedbar-max-width 5)
;;(setq sr-speedbar-delete-windows t)
;;(sr-speedbar-toggle)

(install-package-if-missing 'expand-region)
(add-to-list 'load-path (locate-package-dir 'expand-region))
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;;(global-set-key (kbd "C-+") 'er/contract-region)
(global-set-key (kbd "C--") 'er/contract-region)
(global-set-key (kbd "C-0") (lambda () (interactive) (er/contract-region 0)))
(global-set-key (kbd "C-9") 'er/mark-sentence)
(global-set-key (kbd "C-8") 'er/mark-paragraph)
(global-set-key (kbd "C-7") 'er/mark-symbol)

(pending-delete-mode t)


;; too aggressive for its own good
;; doesn't seem to work in c mode...
;;(install-package-if-missing 'aggressive-indent)
;;(add-to-list 'load-path (locate-package-dir 'aggressive-indent))
;;(global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(provide 'setup-light-packages)
