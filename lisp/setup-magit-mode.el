;;-------------------
;; Magit
;;-------------------
(install-package-if-missing 'magit)
(add-to-list 'load-path (locate-package-dir 'magit))
(require 'magit)

;;(set-face-foreground 'magit-diff-add "green")
;;(set-face-foreground 'magit-diff-del "red")
;;(set-face-background 'magit-diff-add "#0c0c13")
;;(set-face-background 'magit-diff-del "#0c0c13")

;;(set-face-background 'magit-diff-add "#3f3f3f")
;;(set-face-background 'magit-diff-del "#3f3f3f")
;;(set-face-background 'magit-item-highlight "#3f3f3f")
;;(set-face-foreground 'magit-item-highlight "MediumSlateBlue")

(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'setup-magit-mode)
