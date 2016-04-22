(install-package-if-missing 'auctex)
(load "auctex.el" nil t t)

;; Why didn't i know about this before?
(setq reftex-plug-into-AUCTeX t)

;;(load "preview-latex.el" nil t t)
;;(require 'auto-complete-auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
;;(setq-default TeX-master nil)

;; The default value of this is (\\\( \\\) \\\[ \\\])
;; Nice intention (do not break line in the middle of inline equations)
;; but it has a terrible side effect: It breaks systematically on inline
;; equation ends even if it is not necessary. Setting it to nil will
;; remove this 'feature'
(setq LaTeX-fill-break-at-separators '())

(install-package-if-missing 'ac-math)
(add-to-list 'load-path (locate-package-dir 'ac-math))
(require 'ac-math) ; This is not needed when you install from MELPA
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

(defun guess-TeX-master (filename)
  "Guess the master file for FILENAME from currently open .tex files."
  (let ((candidate nil)
	(filename (file-name-nondirectory filename)))
    (save-excursion
      (dolist (buffer (buffer-list))
	(with-current-buffer buffer
	  (let ((name (buffer-name))
		(file buffer-file-name))
	    (if (and file (string-match "\\.tex$" file))
		(progn
		  (goto-char (point-min))
		  (if (re-search-forward (concat "\\\\input{" filename "}") nil t)
		      (setq candidate file))
		  (if (re-search-forward (concat "\\\\input{" (file-name-sans-extension filename) "}") nil t)
		      (setq candidate file))
		  (if (re-search-forward (concat "\\\\include{" filename "}") nil t)
		      (setq candidate file))
		  (if (re-search-forward (concat "\\\\include{" (file-name-sans-extension filename) "}") nil t)
		      (setq candidate file))))))))
    (if candidate
	(message "TeX master document: %s" (file-name-nondirectory candidate)))
    candidate))

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (progn
    (setq ac-sources
	  (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		  ac-sources))
    (setq TeX-master (guess-TeX-master (buffer-file-name)))
    (turn-on-reftex)
    (message "ac-sources modified by setup-auctex.el")
    (message "ac-sources: %s" ac-sources)))

(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("PdfLaTeX-SE" "pdflatex -shell-escape %s" TeX-run-command nil t :help "Run LaTex with -shell-escape (minted)") t))

(global-set-key (kbd "<f9>") 'TeX-command-master)
;;(global-set-key (kbd "<f9>") 'TeX-command-master)



(provide 'setup-auctex)
