;;; setup-multi-edit --- setup multiple cursor editing

;;; Commentary:

;;; Code:

;;---------------------------------------------------------------
;; Another multiple location editing tool. Much cleaner interface
;; than Multiple cursors C-;
;; https://github.com/victorhge/iedit/blob/master/iedit.el
;;---------------------------------------------------------------
(install-package-if-missing 'iedit)
(add-to-list 'load-path (locate-package-dir 'iedit))
(require 'iedit)

(global-set-key (kbd "C-:") '(lambda () (interactive) (progn (iedit-toggle-selection) (iedit-next-occurrence))))

(global-set-key (kbd "C->") '(lambda ()
			       (interactive)
			       (if (bound-and-true-p iedit-mode)
				   (progn (iedit-expand-down-to-occurrence))
				 (iedit-mode)
				 (iedit-restrict-current-line))))

(global-set-key (kbd "C-<") '(lambda ()
			       (interactive)
			       (if (bound-and-true-p iedit-mode)
				   (progn (iedit-expand-up-to-occurrence))
				 (iedit-mode)
				 (iedit-restrict-current-line))))

(defun iedit-keybindings ()
  (define-prefix-command 'iedit-pref)
  (global-set-key (kbd "C-c i") 'iedit-pref)
  (define-key iedit-pref (kbd "i") 'iedit-mode)
  (define-key iedit-pref (kbd "u") 'iedit-upcase-occurrences)
  (define-key iedit-pref (kbd "l") 'iedit-downcase-occurrences)
  (define-key iedit-pref (kbd "s") 'iedit-replace-occurrences)
  (define-key iedit-pref (kbd "b") 'iedit-blank-occurrences)
  (define-key iedit-pref (kbd "k") 'iedit-delete-occurrences)
  (define-key iedit-pref (kbd "m") 'iedit-number-occurrences)
  (define-key iedit-pref (kbd "n") 'iedit-next-occurrence)
  (define-key iedit-pref (kbd "p") 'iedit-prev-occurrence)
  ;;(define-key iedit-pref (kbd "t") 'iedit-toggle-buffering)
  (define-key iedit-pref (kbd "a") 'iedit-goto-first-occurrence)
  (define-key iedit-pref (kbd "z") 'iedit-goto-last-occurrence)
  (define-key iedit-pref (kbd "t") 'iedit-toggle-case-sensitive)
  (define-key iedit-pref (kbd "g") 'iedit-apply-global-modification)
  (define-key iedit-pref (kbd "f") 'iedit-restrict-function)
  (define-key iedit-pref (kbd "r") 'iedit-restrict-region)
  (define-key iedit-pref (kbd "c") 'iedit-restrict-current-line)
  (define-key iedit-pref (kbd "u") 'iedit-expand-up-a-line)
  (define-key iedit-pref (kbd "d") 'iedit-expand-down-a-line) )

(iedit-keybindings)

;; ;;---------------------------------------------------------------
;; ;; CUA-MODE is somewhat similar to multiple cursors,
;; ;; This mode allows fancy rectangualr selection/editing tools, including incremental
;; ;; insertion of integers on multiple rows (M-n or supposedly M-i, but later doesn't work)
;; ;;---------------------------------------------------------------
;; (cua-mode t)
;; (setq cua-auto-tabify-rectangles t)
;; ;;(setq cua-keep-region-after-copy t)
;; (setq cua-enable-cua-keys nil)
;; ;;(setq cua-highlight-region-shift-only t)
;; ;;(setq cua-toggle-set-mark nil)

;;TooSlow;; ;;---------------------------------------------------------------
;;TooSlow;; ;; Multiple cursors mode, buggy experimental, promising
;;TooSlow;; ;;---------------------------------------------------------------
;;TooSlow;; (install-package-if-missing 'multiple-cursors)
;;TooSlow;; (add-to-list 'load-path (locate-package-dir 'multiple-cursors))
;;TooSlow;; (require 'multiple-cursors)
;;TooSlow;;
;;TooSlow;; ;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;TooSlow;; ;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;TooSlow;; ;;(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
;;TooSlow;; ;;(global-set-key (kbd "C-c C-<") 'mc/mark-pop)
;;TooSlow;;
;;TooSlow;; (defun mult-cur-keys ()
;;TooSlow;;   (define-prefix-command 'mult-cur)
;;TooSlow;;   (global-set-key (kbd "C-c m") 'mult-cur)
;;TooSlow;;
;;TooSlow;;   ;; mark one more occurence
;;TooSlow;;   (define-key mult-cur (kbd "n") 'mc/mark-next-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "w n") 'mc/mark-next-word-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "s n") 'mc/mark-next-symbol-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "p") 'mc/mark-previous-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "w p") 'mc/mark-previous-word-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "s p") 'mc/mark-previous-symbol-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "k") 'mc/mark-more-like-this-extended)
;;TooSlow;;   (define-key mult-cur (kbd "c") 'mc/add-cursor-on-click)
;;TooSlow;;   (define-key mult-cur (kbd "m p") 'mc/mark-pop)
;;TooSlow;;
;;TooSlow;;   ;; Juggle with cursors
;;TooSlow;;   (define-key mult-cur (kbd "u n") 'mc/unmark-next-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "u p") 'mc/unmark-previous-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "j n") 'mc/skip-to-next-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "j p") 'mc/skip-to-previous-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "m e") 'mc/mark-next-like-this-extended)
;;TooSlow;;
;;TooSlow;;   ;; mark many occurrences
;;TooSlow;;   (define-key mult-cur (kbd "e l") 'mc/edit-lines)
;;TooSlow;;   (define-key mult-cur (kbd "e b") 'mc/edit-beginnings-of-lines)
;;TooSlow;;   (define-key mult-cur (kbd "e e") 'mc/edit-ends-of-lines)
;;TooSlow;;   (define-key mult-cur (kbd "a .") 'mc/mark-all-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "a w") 'mc/mark-all-words-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "a s") 'mc/mark-all-symbols-like-this)
;;TooSlow;;   (define-key mult-cur (kbd "a r") 'mc/mark-all-in-region)
;;TooSlow;;   (define-key mult-cur (kbd "a f") 'mc/mark-all-like-this-in-defun)
;;TooSlow;;   (define-key mult-cur (kbd "f a") 'mc/mark-all-words-like-this-in-defun)
;;TooSlow;;   (define-key mult-cur (kbd "f s") 'mc/mark-all-symbols-like-this-in-defun)
;;TooSlow;;   (define-key mult-cur (kbd "d") 'mc/mark-all-dwim)
;;TooSlow;;
;;TooSlow;;   ;; special
;;TooSlow;;   (define-key mult-cur (kbd "b") 'set-rectangular-region-anchor)
;;TooSlow;;   (define-key mult-cur (kbd "t") 'mc/mark-sgml-tag-pair)
;;TooSlow;;   (define-key mult-cur (kbd "i") 'mc/insert-numbers)
;;TooSlow;;   (define-key mult-cur (kbd "o") 'mc/sort-regions)
;;TooSlow;;   (define-key mult-cur (kbd "r") 'mc/reverse-regions) )
;;TooSlow;;
;;TooSlow;; (mult-cur-keys)

(message " -- Done setting up multi-edit")
(provide 'setup-multi-edit)
