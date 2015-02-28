;; make sure it is installed before setup
(install-package-if-missing 'helm)
(add-to-list 'load-path (locate-package-dir 'helm))

(require 'helm)

;; must set before helm-config,  otherwise helm use default
;; prefix "C-x c", which is inconvenient because you can
;; accidentially pressed "C-x C-c"
(setq helm-command-prefix-key "C-c h")
;;(global-unset-key "\C-m")
;;(setq helm-command-prefix-key "\C-m")

(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(setq
 helm-google-suggest-use-curl-p t
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-quick-update t ; do not display invisible candidates
 helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
 helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

 ;; you can customize helm-do-grep to execute ack-grep
 ;; helm-grep-default-command "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
 ;; helm-grep-default-recurse-command "ack-grep -H --smart-case --no-group --no-color %e %p %f"
 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                     '(picture-mode artist-mode))
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0	 ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t		; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
 )

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h g") 'helm-do-grep)
(global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)
(global-set-key (kbd "C-c h C-c g") 'helm-google-suggest)
(global-set-key (kbd "C-c h x") 'helm-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

(global-set-key (kbd "C-f") 'helm-semantic-or-imenu) ;; much cooler than moving forward by a char
;;(eval-after-load 'prog-mode
;;  '(define-key prog-mode-map (kbd "C-s") 'helm-semantic-or-imenu))
;;(eval-after-load 'prog-mode
;;  '(define-key prog-mode-map (kbd "C-S-s") 'isearch-forward))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;;------------------------------------------
;; aparently better than plain ol descbinds
;;------------------------------------------
(install-package-if-missing 'helm-descbinds)
(add-to-list 'load-path (locate-package-dir 'helm-descbinds))
(require 'helm-descbinds)
(helm-descbinds-mode)
(global-set-key (kbd "C-c h d") 'helm-descbinds)
;; This mode hijacks describe-bindings built in function
;; Theres no way to run built in function... WTF?

;; add semantic mode?
(semantic-mode 1)

(helm-mode)

(provide 'setup-helm)
