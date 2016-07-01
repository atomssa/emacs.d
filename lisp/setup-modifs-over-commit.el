;;------------------------------------------------
;; https://github.com/syohex/emacs-git-gutter
;;------------------------------------------------
(install-package-if-missing 'git-gutter)
(add-to-list 'load-path (locate-package-dir 'git-gutter))
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

(define-prefix-command 'moc-prefix)
(global-set-key (kbd "C-g") 'moc-prefix)
;; Jump to next/previous hunk
;;(define-key moc-prefix (kbd "h n") 'git-gutter:next-hunk)
;;(define-key moc-prefix (kbd "h p") 'git-gutter:previous-hunk)
(define-key moc-prefix (kbd "n") 'git-gutter:next-hunk)
(define-key moc-prefix (kbd "p") 'git-gutter:previous-hunk)
(define-key moc-prefix (kbd "u") 'git-gutter:update-all-windows)

(custom-set-variables
 '(git-gutter:lighter " GG")
 ;;'(git-gutter:window-width 2)  ;; constant width for fancy mdoif signs
 ;;'(git-gutter:modified-sign "☁ ")  ;; fancy modif sign
 ;;'(git-gutter:added-sign "☀ ")  ;; fancy modif sign
 ;;'(git-gutter:deleted-sign "☂ ")  ;; fancy modif sign
 ;;'(git-gutter:unchanged-sign " ") ;; show unchanged lines, set color with git-gutter:unchanged bg face
 '(git-gutter:verbosity 0)) ;; Set message verbosity level (0-4)
;;(set-face-background 'git-gutter:unchanged "yellow")

;;;;------------------------------------------------
;;;; git-gutter-fringe
;;;;------------------------------------------------
;;(install-package-if-missing 'git-gutter-fringe)
;;(add-to-list 'load-path (locate-package-dir 'git-gutter-fringe))
;;(require 'git-gutter-fringe)
;;(global-git-gutter-mode t)

;;;;------------------------------------------------
;;;; yet another commit diff mode
;;;;------------------------------------------------
;;(install-package-if-missing 'diff-hl)
;;(add-to-list 'load-path (locate-package-dir 'diff-hl))
;;(global-diff-hl-mode)
;;;; Only in `prog-mode' buffers, with `vc-dir' integration:
;;;;(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
;;;;(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(message " -- Done setting up git-gutter")
(provide 'setup-modifs-over-commit)
