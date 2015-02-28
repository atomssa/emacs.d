;;(setq ext-v-full (concat "ext-" "apr13"))
;;(setq pandaroot-v (concat "pandaroot-" "scrut14"))

(setq pnd-dir (expand-file-name "~/panda/svn"))

(defun pnd-root-v-full (pnd-root-v) (format "pandaroot-%s" pnd-root-v))

(defun read-lines (file-path)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(defun test-var (var val)
  (if (not (string= (getenv var) val))
      (progn
	(message "ERROR: for %s\nEXPEC:$%s$\nFOUND:$%s$" var val (getenv var))
	())
    (progn (message "ALL OK for %s " var) t)))

(defun test-setenv (line)
  (if (string-match "^\s*export\s+\\(.*\\)=\"\\(.*\\)\"" line)
      (test-var (match-string 1 line) (match-string 2 line))
    t))

;; This function short-circuits. If a test fails, it stops there
;; and doesn't test subsequent functions
(defun test-setenv-list (set-env-list)
  (message "recur testing: %s " (car set-env-list))
  (if (not set-env-list)
      t
    (and (test-setenv (car set-env-list))
	 (test-setenv-list (cdr set-env-list)))))

(defun test-config-file (pnd-root-v)
  (let* ((build-dir (format "%s/%s/build" pnd-dir (pnd-root-v-full pnd-root-v)))
	 (config-file (format "%s/config.sh" build-dir)))
    (if (file-exists-p config-file)
	(if (test-setenv-list (read-lines config-file))
	    (message "Testing env against %s passes!" pnd-root-v)
	  (message "Testing env against %s fails" pnd-root-v))
	;;(progn
	;;  (mapcar 'test-setenv (read-lines config-file))
	;;  (message "Testing env against %s passes!" pnd-root-v))
      (message "config file: %s doesn't exist" config-file))))

(defun parse-setenv (line)
  (when (string-match "^\s*export\s+\\(.*\\)=\"\\(.*\\)\"" line)
    (setenv (match-string 1 line) (match-string 2 line))))

(defun parse-config-file (build-dir)
  (let* ((config-file (format "%s/config.sh" build-dir)))
    (if (file-exists-p config-file)
	(progn
	  (mapcar 'parse-setenv (read-lines config-file))
	  (message "done parsing env from %s" config-file))
      (message "config file: %s doesn't exist" config-file))))

(defun set-pnd-env (pnd-root-v)
  (interactive "Specify pandaroot version:")
  (let*
      ((build-dir (format "%s/%s/build" pnd-dir (pnd-root-v-full pnd-root-v))))
    (parse-config-file build-dir)))

;;(test-config-file "scrut14")
(set-pnd-env "scrut14")

(provide 'setup-pnd-root)
