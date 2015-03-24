;;(install-package-if-missing 'acutex)
(load "auctex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
;;(setq-default TeX-master nil)

(install-package-if-missing 'ac-math)
(add-to-list 'load-path (locate-package-dir 'ac-math))
(require 'ac-math) ; This is not needed when you install from MELPA
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (progn
    (setq ac-sources
	  (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		  ac-sources))
    (message "ac-sources modified by setup-auctex.el")
    (message "ac-sources: %s" ac-sources)))
(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("PdfLaTeX-SE" "pdflatex -shell-escape %s" TeX-run-command nil t :help "Run LaTex with -shell-escape (minted)") t))


(provide 'setup-auctex)
