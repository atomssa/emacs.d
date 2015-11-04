;;; starter-kit-elpa.el --- Install a base set of packages automatically.
;;
;; Part of the Emacs Starter Kit
(require 'cl) ;; -why?

;;__________________________________________
(setq elpa-dir (concat emacs-init-dir "elpa/"))

;;_____________________________
;; Setup melpa to pull packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;_______________
(defun online? ()
  "See if we're online.

Windows does not have the network-interface-list function, so we
just have to assume it's online."
  ;; TODO how could this work on Windows?
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                         (member 'up (first (last (network-interface-info
                                                   (car iface)))))))
            (network-interface-list))
    t))

;;_________________________________________
(defun install-package-if-missing (package)
  "Install a package if it hasn't been installed and we're online
If the package archive info has not been downloaded already (locally
replaceted in elpa/archives directory) package installation fails.
To avoid this call list-packages if local archive info is unavailable"
  (interactive)
  (when (equal check-missing-packages t)
    (when (online?)
      (unless (or (member package package-activated-list)
		  (functionp package))
	(message "Installing %s" (symbol-name package))
	;; Insure that repo information have been downloaded before
	;; attempting install. Otherwise it bugs
	(if (file-exists-p (concat elpa-dir "archives"))
	    (package-install package)
	  (progn
	    (list-packages)
	    (kill-buffer "*Packages*")
	    (package-install package)))))))

;;______________________________________________________
;; TODO: Find a means to make it select the last one....
(defun locate-package-dir(package)
  "Locate the directory of a package from just its name

Helper func to locate directory where a package is installed from just its name
when the package is being initialized (without knowing the version number that
figures in the package directory name)
If there are multiple versions, it will pick the earliest one
call (locate-package-dir 'name) if name is the name of the package"
  (interactive)
  (message "Adding package dir to load path: %s " (symbol-name package))
  (let* ((wild (concat elpa-dir "/" (symbol-name package) "-*"))
	 (glob (file-expand-wildcards wild))
	 (dir (locate-file (concat (symbol-name package) "-pkg.el") glob)))
    (file-name-directory dir)))

(provide 'setup-package-repo)
