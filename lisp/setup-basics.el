;;; Package -- setup basic

;;; Commentary:

;;; Code:
(setq user-mail-address "atomssa@ipno.in2p3.fr")

;; disable C-x C-c from exiting emacs
;; Will help avoid accidentally killing buffers
;; With helm-mode, no noed to ofen kill emacs
;; Also encourages keeping windows as long as possible
;; (global-unset-key (kbd "C-x C-c"))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable fugly text on scratch buffer
(setq initial-scratch-message "")

;; Disable transient mode, it SUCKS!
(setq transient-mark-mode nil)

;; Disable creation of backup files
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

;; Highlighting options
(setq search-highlight t)
(setq query-replace-highlight t)
(setq mouse-sel-retain-highlight t)

;; enable showing column number in modline
(setq column-number-mode t)

;; Turn off mouse interface early in startup to avoid momentary display
;; ffoundp man: This function returns t if the symbol has an object in
;; its function cell, nil otherwise. It does not check that the object
;; is a legitimate function.
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) -sort of need this
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; enable scroll-left
;; :TODO: what does this acheive?
(put 'scroll-left 'disabled nil)

;; Enable narrowing to page and region
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; modify text size
;;(global-set-key (kbd "C-+") 'text-scale-increase)
;;(global-set-key (kbd "C--") 'text-scale-decrease)

;; Go-to-line-number
(global-set-key (kbd "\C-xg") 'goto-line)

;; Shortcut to repeat recorded macro
(global-set-key [f5] 'call-last-kbd-macro)

;; Show magit status
;; :TODO: belongs in magit settings
(global-set-key [f6] 'magit-status)

;; Blocks added by the customize interface are move to a separate file
;; http://stackoverflow.com/questions/5052088/what-is-custom-set-variables-and-faces-in-my-emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; set aspell as default spell checker
(add-to-list 'exec-path "/usr/local/bin")
(setq ispell-program-name "aspell")

;;;; enable flyspell in text-mode and flyspell-prog in prog-mode
;; incompatible with auto-complete without (ac-flyspell-workaround)
;; call after setting up auto-complete
(add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode) ;; incompatible with iedit, which is much more useful

;;;; Ingore mouse events inside emacs. Go full metal on it
;;;; Use Alt-arrow key chord to move around buffers and minibuffer
;;(defun no-op () (interactive) ())
;;(global-set-key (kbd "<mouse-1>") 'no-op)
;;(global-set-key (kbd "<down-mouse-1>") 'no-op)
;;(global-set-key (kbd "<up-mouse-1>") 'no-op)
;;(global-set-key (kbd "<drag-mouse-1>") 'no-op)
;;(global-set-key (kbd "<double-mouse-1>") 'no-op)
;;(global-set-key (kbd "<triple-mouse-1>") 'no-op)
;;(global-set-key (kbd "<wheel-up>") 'no-op)
;;(global-set-key (kbd "<wheel-down>") 'no-op)

;; narrowing and widening - with alternate keys for
;; displaced shortcuts
(global-set-key (kbd "s-n") 'narrow-to-region)
(global-set-key (kbd "s-w") 'widen)
(global-set-key (kbd "s-p") 'narrow-to-page)
(global-set-key (kbd "s-f") 'narrow-to-defun)

(global-set-key (kbd "C-c f") 'make-frame)
(global-set-key (kbd "C-c w") 'delete-frame)
(global-set-key (kbd "C-x n") 'ns-next-frame)
(global-set-key (kbd "C-x p") 'ns-prev-frame)

(global-set-key (kbd "C-c e a") 'first-error)
(global-set-key (kbd "C-c e n") 'next-error)
(global-set-key (kbd "C-c e p") 'previous-error)

;; Show line numbers on all buffers
(global-linum-mode)

;; yank pop forward and backward
(defun yank-pop-bidirectional (arg)
  "Enables yanking from the kill ring in reverse order when
used with shift"
  (interactive "p")
  (yank-pop (- arg)))
(global-set-key [(meta Y)] 'yank-pop-bidirectional)

;; Better navigation of camelCase words for all programming modes
(add-hook 'prog-mode-hook (lambda() (subword-mode 1)))
;; need these for subword mode to work with forward- and backward-word
(global-set-key (kbd "C-<right>") 'forward-word)
;; need these for subword mode to work with forward- and backward-word
(global-set-key (kbd "C-<left>") 'backward-word)

(defun smooth-scroll (step-by steps)
  (while steps
    (scroll-up step-by)
    ;;(sit-for (* 1 (car steps)))
    (sit-for (car steps))
    (setq steps (cdr steps))))
(setq mss-step+ 2)
(setq mss-step- (* -1 mss-step+))
(setq mss-seq '(0.01 0.01 0.02 0.02 0.02 0.02 0.02 0.01 0.005 0.005))
(global-set-key (kbd "M-<down>") '(lambda () (interactive) (smooth-scroll mss-step+ mss-seq)))
(global-set-key (kbd "M-<up>") '(lambda () (interactive) (smooth-scroll mss-step- mss-seq)))
(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll mss-step+ mss-seq)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll mss-step- mss-seq)))

(global-set-key (kbd "s-i") 'indent-region) ;; cooler than opening a line

;; needs debugging. Main objective was to jump to next line after indenting
;; or indent
;; TODO: accept prefix argument how many lines to indent and pass it on to the
;; appropriate indent function
(defun indent-dwim ()
  "Indent a line and go to the next line or indent all lines in
region when in transient mode.  Do the right thing depending on
context.."
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (progn
      (indent-for-tab-command)
      (forward-line)
      (back-to-indentation))))
(global-set-key (kbd "s-i") 'indent-dwim)

;; Random scrolling improvement suggestions from the web that don't work here
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;;(setq mouse-wheel-progressive-speed t) ;; don't accelerate scrolling
;;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;;;;(setq scroll-step 1) ;; keyboard scroll one line at a time
;;(setq scroll-step           1         scroll-conservatively 10000)
;;(setq scroll-step 1)
;;(setq scroll-conservatively 10000)
;;(setq auto-window-vscroll nil)

(message " -- Done setting up basics")
(provide 'setup-basics)
;;; setup-basics.el ends here
