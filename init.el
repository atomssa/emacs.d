;;; init.el -- emacs init file
;;; Commentary:

;;; Code:
;; Add the ~/.emacs.d path to load-path
(setq emacs-init-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(setq dotfiles-dir (concat emacs-init-dir "lisp/"))
(add-to-list 'load-path dotfiles-dir)

(setq check-missing-packages t)

;; Setup the barebone basic stuff that doesn't require
;; any package installation
(require 'setup-basics)
(require 'setup-package-repo)
(require 'setup-look)  ;; Improve the look 'n feel

;; experimental!!
;; (require 'edit-server)
;; (edit-server-start)

;; Auto indent, trim white lines and stuff
(require 'setup-auto-indent)

;; Multi edit mode setting
(require 'setup-multi-edit)

;; install and setup light packages and packages that
;; don't require extensive setup
;; contains autopair, iy-go-to-char, annoying-arrows
(require 'setup-light-packages)

(require 'setup-auctex)

(require 'setup-modifs-over-commit)

;;(require 'setup-mail)

(require 'setup-yasnippet-mode)
;;(when (window-system)
;;  (require 'setup-yasnippet-mode))

(require 'setup-magit-mode)
(require 'setup-org-mode)

(require 'setup-projectile)
(require 'setup-helm)
(require 'setup-helm-gtags)
;;(when (window-system)
;;  ;;(require 'setup-ecb-mode)  ;; meh...
;;  ;;(require 'setup-tramp-mode)  ;; meh...
;;  ;; (require 'setup-ede-mode)
;;  (require 'setup-projectile)
;;  (require 'setup-helm)
;;  (require 'setup-helm-gtags))

;;(require 'rtags) ;; optional, must have rtags installed
;;(cmake-ide-setup)

;; setup cedet on its own
(require 'setup-cedet)

;; Auto completion with auto-complete
(require 'setup-auto-complete)
;; Auto completion with company-mode
;; (require 'setup-company)

(require 'setup-flycheck)

;; enviromnent specific setups
(require 'setup-c-mode)
(require 'setup-golang)
(require 'setup-rust)
(require 'setup-cider)
(require 'setup-web-mode)
(require 'setup-lisp-mode)
(require 'setup-android-dev)
(require 'setup-gdb)
(put 'downcase-region 'disabled nil)

(message "init.el Setup complete! wooohooo... ")

(provide 'init)
;;; init.el ends here
