;; some hooks for c++

;;---------------------------------------------------------------
;; Hide ifdef blocks in c++ ability to add ifdef tags to list
;; C-c @ h  -hide   everything that processor doesn't see according to master list
;; C-c @ s  -show   undo hide
;; C-c @ d  -define   a VAR into the master list
;; C-c @ u  -undefine   a VAR from the master list
;;---------------------------------------------------------------
(add-hook 'c-mode-common-hook
	  (lambda()
	    (hide-ifdef-mode t)
	    (setq hide-ifdef-lines t)
	    ;; (hide-ifdef-toggle-shadowing)
	    (setq hide-ifdef-read-only t)))

;;---------------------------------------------------------------
;; Enable code hide show with some key bindings
;; This one is an awesome tool, but there is no good visual
;; indication that code has been folded at a given location
;; (just an ellipsis after the begining of folded code)
;; An even better solution would be to put a downward poiting
;; arrow on the line number-body separator bar (need to create
;; one if there is none), also one can indicate the same downward
;; pointing arrow with different fill style to indicate that
;; there is foldable stuff at a given line. How about coding that
;; after QM?
;;---------------------------------------------------------------
(add-hook 'c-mode-common-hook
	  (lambda()
	    (local-set-key (kbd "C-c <right>") 'hs-show-block)
	    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
	    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
	    (local-set-key (kbd "C-c <down>")  'hs-show-all)
	    (hs-minor-mode t)))

(provide 'setup-c-mode)
