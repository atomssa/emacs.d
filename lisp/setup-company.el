(install-package-if-missing 'company)
(add-to-list 'load-path (locate-package-dir 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

;;(setq company-backends '(company-elisp company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-ropemacs company-cmake company-capf (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-files company-dabbrev))

;;(setq company-backends '(company-files company-dabbrev))

(global-set-key (kbd "C-<return>") 'company-complete)

;; (dolist (hook (list
;;                'emacs-lisp-mode-hook
;;                'lisp-mode-hook
;;                'lisp-interaction-mode-hook
;;                'scheme-mode-hook
;;                'c-mode-hook
;;                'c++-mode-hook
;;                'java-mode-hook
;;                'haskell-mode-hook
;;                'asm-mode-hook
;;                'emms-tag-editor-mode-hook
;;                'sh-mode-hook
;;                ))
;;   (add-hook hook 'company-mode))

(provide 'setup-company)
