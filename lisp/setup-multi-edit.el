;;---------------------------------------------------------------
;; Multiple cursors mode, buggy experimental, promising
;;---------------------------------------------------------------
;;(when (window-system)

(install-package-if-missing 'multiple-cursors)
(add-to-list 'load-path (locate-package-dir 'multiple-cursors))
(require 'multiple-cursors)

(defun mult-cur-keys ()
  (define-prefix-command 'mult-cur)
  (global-set-key (kbd "C-c m") 'mult-cur)

  ;; mark one more occurence
  (define-key mult-cur (kbd "n") 'mc/mark-next-like-this)
  (define-key mult-cur (kbd "w n") 'mc/mark-next-word-like-this)
  (define-key mult-cur (kbd "s n") 'mc/mark-next-symbol-like-this)
  (define-key mult-cur (kbd "p") 'mc/mark-previous-like-this)
  (define-key mult-cur (kbd "w p") 'mc/mark-previous-word-like-this)
  (define-key mult-cur (kbd "s p") 'mc/mark-previous-symbol-like-this)
  (define-key mult-cur (kbd "k") 'mc/mark-more-like-this-extended)
  (define-key mult-cur (kbd "c") 'mc/add-cursor-on-click)
  (define-key mult-cur (kbd "m p") 'mc/mark-pop)

  ;; Juggle with cursors
  (define-key mult-cur (kbd "u n") 'mc/unmark-next-like-this)
  (define-key mult-cur (kbd "u p") 'mc/unmark-previous-like-this)
  (define-key mult-cur (kbd "j n") 'mc/skip-to-next-like-this)
  (define-key mult-cur (kbd "j p") 'mc/skip-to-previous-like-this)
  (define-key mult-cur (kbd "m e") 'mc/mark-next-like-this-extended)

  ;; mark many occurrences
  (define-key mult-cur (kbd "e l") 'mc/edit-lines)
  (define-key mult-cur (kbd "e b") 'mc/edit-beginnings-of-lines)
  (define-key mult-cur (kbd "e e") 'mc/edit-ends-of-lines)
  (define-key mult-cur (kbd "a .") 'mc/mark-all-like-this)
  (define-key mult-cur (kbd "a w") 'mc/mark-all-words-like-this)
  (define-key mult-cur (kbd "a s") 'mc/mark-all-symbols-like-this)
  (define-key mult-cur (kbd "a r") 'mc/mark-all-in-region)
  (define-key mult-cur (kbd "a f") 'mc/mark-all-like-this-in-defun)
  (define-key mult-cur (kbd "f a") 'mc/mark-all-words-like-this-in-defun)
  (define-key mult-cur (kbd "f s") 'mc/mark-all-symbols-like-this-in-defun)
  (define-key mult-cur (kbd "d") 'mc/mark-all-dwim)

  ;; special
  (define-key mult-cur (kbd "b") 'set-rectangular-region-anchor)
  (define-key mult-cur (kbd "t") 'mc/mark-sgml-tag-pair)
  (define-key mult-cur (kbd "i") 'mc/insert-numbers)
  (define-key mult-cur (kbd "o") 'mc/sort-regions)
  (define-key mult-cur (kbd "r") 'mc/reverse-regions) )

(mult-cur-keys)
;;)

;;---------------------------------------------------------------
;; Another multiple location editing tool. Much cleaner interface
;; than Multiple cursors C-;
;; https://github.com/victorhge/iedit/blob/master/iedit.el
;;---------------------------------------------------------------
(install-package-if-missing 'iedit)
(add-to-list 'load-path (locate-package-dir 'iedit))
(require 'iedit)

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

(provide 'setup-multi-edit)
