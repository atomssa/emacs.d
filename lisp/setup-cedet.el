(require 'cc-mode)
(require 'semantic)

;;(global-semanticdb-minor-mode 1)
;;(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-decoration-mode 1)
;;(global-semantic-idle-local-symbol-highlight-mode 1)
;;(global-semantic-idle-completions-mode 1)
;;(global-semantic-idle-breadcrumbs-mode 1)
;;;;(global-semantic-show-unmatched-syntax-mode 1)

(semantic-mode 1)

;;(require 'semantic/ia)
;;(require 'semantic/bovine/gcc)
;;(semanticdb-enable-gnu-global-databases 'c-mode)
;;(semanticdb-enable-gnu-global-databases 'c++-mode)

;;(defun my-cedet-hook ()
;;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;  ;;(local-set-key "." 'semantic-complete-analyze-inline-idle)
;;  ;;(local-set-key ">" 'semantic-complete-self-insert)
;;  ;;(local-set-key "." 'semantic-complete-analyze-inline)
;;  ;;(local-set-key "->" 'semantic-complete-analyze-inline-idle)
;;  ;;(setq semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-traditional)
;;  (local-set-key "\C-c;" 'semantic-ia-complete-tip)
;;  (local-set-key "\C-c RET" 'semantic-complete-analyze-inline)
;;  (local-set-key "\C-c/" 'semantic-complete-analyze-inline-idle)
;;  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
;;  ;;(add-to-list 'ac-sources 'ac-source-semantic)
;;  ;;(setq ac-sources '(ac-source-semantic))
;;  ;;(setq ac-sources '(ac-source-yasnippet ac-source-gtags ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers ac-source-semantic))
;;  ;; Failed attempt to use only ac-source-semantic after a . or ->
;;  ;;(add-to-list 'ac-omni-completion-sources (cons "\\." '(ac-source-semantic)))
;;  ;;(add-to-list 'ac-omni-completion-sources (cons "->" '(ac-source-semantic)))
;;  ;;(add-to-list 'ac-omni-completion-sources (cons "::" '(ac-source-semantic)))
;;  (setq ac-sources (append ac-sources '(ac-source-semantic)))
;;  )
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)

;;(setq-mode-local c-mode
;;                      semanticdb-find-default-throttle
;;                      '(project unloaded system recursive))
;;(require 'setup-panda-ede-project)

;;(semantic-add-system-include "/Users/tujuba/panda/svn/ext-apr13/tools/root/include" 'c++-mode)

(provide 'setup-cedet)
