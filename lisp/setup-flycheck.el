;;; setup-flycheck -- setup flycheck mode

;;; Commentary:
;; Package-Requires: ((dash "2.12.1"))

;;; Code:
(install-package-if-missing 'flycheck)
(add-to-list 'load-path (locate-package-dir 'flycheck))

(install-package-if-missing 'helm-flycheck)
(add-to-list 'load-path (locate-package-dir 'helm-flycheck))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; for first, next, and previous error use the emacs shortcuts C-c e [a,n,p,z]
(global-set-key (kbd "C-c e l") 'helm-flycheck)
(global-set-key (kbd "<f8>") 'helm-flycheck)

(require 'helm-flycheck)

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c e h") 'helm-flycheck))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; to remove free var warning add this at the end
;; ;; Local Variables:
;; ;; byte-compile-warnings: (not free-vars)
;; ;; End:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq cpp-inc-path '("."
;;		     "/Users/tujuba/panda/svn/mar15p3/install/include/root"
;;		     "/usr/local/include"
;;		     "/Library/Developer/CommandLineTools/usr/lib/clang/7.0.0/include"
;;		     "/Library/Developer/CommandLineTools/usr/include/c++/v1"
;;		     "/usr/include"
;;		     "/System/Library/Frameworks"
;;		     "/Library/Frameworks"))
;; the above is output from the following shell command
;; # echo "" | gcc -xc - -v -E
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The following funciton extracts the include pathes list automatically
;;(require 'cl-seq)
;;(mapcar
;; '(lambda (line) (second (split-string line " ")))
;; (remove-if-not
;;  '(lambda (line) (string-match "^ /" line))
;;  (split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; these work if cl-seq is not available
;;(defun my-filter (condp lst)
;;  (delq nil
;;	(mapcar (lambda (x) (and (funcall condp x) x)) lst)))
;;(mapcar
;; '(lambda (line) (second (split-string line " ")))
;; (my-filter
;;  '(lambda (line) (string-match "^ /" line))
;;  (split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yet another way to do it using dash.el that provides -filter, -remove --
;;(mapcar
;; #'(lambda (line) (second (split-string line " ")))
;; (-filter
;;  #'(lambda (line) (string-match "^ /" line))
;;  (split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n")))
;; or even better:
;;(--map (second (split-string it " "))
;;       (--filter (string-match "^ /" it)
;;	   (split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(require 'cl)
;;(setq cpp-inc-path
;;      (mapcar
;;       #'(lambda (line) (second (split-string line " ")))
;;       (remove-if-not
;;	#'(lambda (line) (string-match "^ /" line))
;;	(split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n"))))
;;(add-to-list 'cpp-inc-path "/Users/tujuba/panda/svn/mar15p3/install/include/root")
;;(add-to-list 'cpp-inc-path ".")

;; to link all pandaroot .h files into the include path
;; find ${PWD} -type f -not -path '*/\.*' -not -path '*build*' -not -path '*macro*' -not -path '*tutorials*' -not -path 'include' \( \( -name '*.h' -o -name '*.hh' \) ! -name '*LinkDef.*' \) -exec ln -sf {} include/ \;

(defun cpp-sys-inc-path()
  (--map (second (split-string it " "))
	 (--filter (string-match "^ /" it)
		   (split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n"))))

(defun pnd-inc-dirs(ext-version pnd-root-version)
  (let* ((pnd-base (format "/Users/tujuba/panda/svn/%s/" ext-version))
	 (pnd-extern-inc-base (concat pnd-base "install/include"))
	 (fair-inc (list (concat pnd-base "FairRoot/install/include")))
	 (pnd-root-base (concat pnd-base (format "pandaroot/%s/" pnd-root-version)))
	 (pnd-root-inc-dirs
	  (split-string
	   (shell-command-to-string
	    (format "find %s -type d -not -path '*/\.*' -not -path '*build*' -not -path '*macro*' -not -path '*tutorials*'" pnd-root-base)) "\n"))
	 (pnd-extern-inc-dirs
	  (split-string
	   (shell-command-to-string
	    (format "find %s -type d -not -path '*boost*'" pnd-extern-inc-base)) "\n")))
    (append pnd-extern-inc-dirs pnd-root-inc-dirs fair-inc)))

(defun pnd-extern-inc-dirs (ext-version)
  (let* ((pnd-base (format "/Users/tujuba/panda/svn/%s/" ext-version))
	 (pnd-extern-inc-base (concat pnd-base "install/include")))
    (split-string
     (shell-command-to-string
      (format "find %s -maxdepth 1 -type d -not -path '*boost*'" pnd-extern-inc-base)) "\n")))

;;(message "%s" (pnd-extern-inc-dirs "mar15p3"))


(defun pnd-and-cpp-sys-inc-path()
  (append '(".") (cpp-sys-inc-path) (pnd-inc-dirs "mar15p3" "jan16")))

(defun root-and-cpp-sys-inc-path()
  (append '("."
	    "/Users/tujuba/panda/svn/mar15p3/FairRoot/install/include/"
	    "/Users/tujuba/panda/svn/mar15p3/pandaroot/jan16/include") (pnd-extern-inc-dirs "mar15p3") (cpp-sys-inc-path)))

;;(message "%s" (root-and-cpp-sys-inc-path))

;	    "/Users/tujuba/panda/svn/mar15p3/install/include/root"
;	    "/Users/tujuba/panda/svn/mar15p3/install/include/"


;;(message "%s" (pnd-and-cpp-sys-inc-path))

;;(defun cpp-inc-path()
;;  (append (--map (second (split-string it " "))
;;		 (--filter (string-match "^ /" it)
;;			   (split-string (shell-command-to-string (format "echo \"\" | gcc -xc - -v -E")) "\n")))
;;	  '("." "~/panda/svn/mar15p3/install/include")))

(add-hook
 'c++-mode-hook
 (lambda ()
   (progn
     (setq flycheck-clang-language-standard "c++11")
     (setq flycheck-clang-include-path (root-and-cpp-sys-inc-path))
     ;;(setq flycheck-clang-includes (pnd-inc-dirs "mar15p3" "jan16"))
     (setq flycheck-cppcheck-include-path (root-and-cpp-sys-inc-path)))))

;;(message "c++-include-path: %s" (root-and-cpp-sys-inc-path))
;;(message "pnd-include-path: %s" (pnd-inc-dirs "mar15p3" "jan16"))

;; to enforce c++-mode for .h file add a .dir-locals.el file in root dir of project containing
;; ((c-mode . ((mode . c++))))

;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

;;(setq flycheck-gcc-include-path cpp-inc-path)
;;(setq flycheck-clang-include-path cpp-inc-path)
;;(setq flycheck-cppcheck-include-path cpp-inc-path)

;;(setq flycheck-clang-args '("-std=c++11"))
;;(setq flycheck-clang-args ())
;;(setq flycheck-gcc-args '("-std=c++11"))
;;(setq flycheck-gcc-args ())

;;(setq flycheck-clang-language-standard '("c++11"))
;;(setq flycheck-clang-language-standard ())
;;(setq flycheck-gcc-language-standard '("c++11"))
;;(setq flycheck-gcc-language-standard ())
;;(setq flycheck-cppcheck-standards '("c++11"))
;;(setq flycheck-cppcheck-standards ())

;;(setq flycheck-clang-standard-library '("libc++))
;;(setq flycheck-clang-standard-library ())

(message " -- Done setting up flycheck")
(provide 'setup-flycheck)
;;; setup-flycheck.el ends here
