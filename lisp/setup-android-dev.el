
;;  ;; Android development mode
;;  (add-to-list 'load-path "~/.emacs.d/extensions/android-mode")
;;  (require 'android-mode)
;;  (setq android-mode-sdk-dir "~/android-sdk-linux/")
;;  (add-hook 'gud-mode-hook
;;  	  (lambda ()
;;              (add-to-list 'gud-jdb-classpath "~/android-sdk-linux/platforms/android-16/android.jar")
;;              ))

(message " -- Done setting up android-dev")
(provide 'setup-android-dev)
