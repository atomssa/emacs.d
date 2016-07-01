;; Org is built in no need to install, just setup

;;------------------------------------------------------------------------------
;; Org mode customizations, might make sense to keep this separate
;;------------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-support-shift-select t)

;; Example of how to set a key to give a command accessible through agenda dispatcher
;; The following will define the key C-c a f as a shortcut for creating a sparse tree matching the string ‘emacs’.
(setq org-agenda-custom-commands '(("e" occur-tree "emacs")))
(setq org-log-into-drawer 'LOGBOOK)

;; To save the clock history across Emacs sessions, use
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; disable electric-indent in org?
(add-hook 'org-mode-hook
          (lambda ()
            (set (make-local-variable 'electric-indent-functions)
                 (list (lambda (arg) 'no-indent)))))

;; better visualisation
(setq org-hide-leading-stars t)

;; PRetty org: From http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html
(setq org-hide-emphasis-markers t)
;; Unicode circle for stars
(font-lock-add-keywords
 'org-mode
 '(("^ +\\([-*]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; bullets yeah
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Enalbe using latex symbols (causes issues with auto-complete in latex-mode)
;;(org-toggle-pretty-entities)

;; enable speed commands
(setq org-use-speed-commands t)
;; use org-speed-commands-user to customize speed commands: Like my hjkl
(setq org-speed-commands-user
      '(("j" . (org-speed-move-safe 'outline-next-visible-heading))
	("k" . (org-speed-move-safe 'outline-previous-visible-heading))
	("J" . (org-speed-move-safe 'org-forward-heading-same-level))
	("K" . (org-speed-move-safe 'org-backward-heading-same-level))
	(">" . org-next-block)
	("<" . org-previous-block)
	("g" . org-goto)
	("r" . (org-refile t))
	("M" . org-shiftmetadown)
	("l" . org-metaright)
	("h" . org-metaleft)
	("L" . org-shiftmetaright)
	("H" . org-shiftmetaleft)
	("b" . show-branches)
	("B" . show-children)
	("x" . org-cut-subtree)
	("y" . org-paste-subtree)
	("d" . org-deadline)
	("s" . org-schedule)
	("N" . org-narrow-to-subtree)))

(require 'org-next-prev-tidy)

;; TODO -> DONE transition timestamp and note
;;(setq org-log-done 'time) ;; for timestamp only
(setq org-log-done 'note)

(setq org-directory "/Users/tujuba/Dropbox/org")

;; org-mobile settings...
(setq org-mobile-inbox-for-pull "/Users/tujuba/Dropbox/org/mobileorg_inbox.org")
(setq org-mobile-directory "/Users/tujuba/Dropbox/MobileOrg")

(setq org-default-notes-file (concat org-directory "/captures.org"))
(global-set-key "\C-cc" 'org-capture)

;; no want edit hidden parts
(setq org-catch-invisible-edits 'error)

(setq org-agenda-files '("~/Dropbox/org"))

;; (org-mobile-push)

;; Set the default mode of the scratch buffer to Org
(setq initial-major-mode 'org-mode)

(message " -- Done setting up org-mode")
(provide 'setup-org-mode)
