
;; ;;-----------------------------------------------------------------
;; ;; According to the author, this is the most awesome thing since sliced bread
;; ;; when it comes to web editing: http://web-mode.org/
;; ;; Alternatives: multi-web-mode, mmm-mode, etcetera : http://emacswiki.org/emacs/MultipleModes
;; ;;-----------------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs.d/extensions/web-mode/")
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (defun web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 2))
;; (add-hook 'web-mode-hook  'web-mode-hook)
;; (add-to-list 'web-mode-snippets '("mydiv" "<div>" "</div>"))

(provide 'setup-web-mode)
