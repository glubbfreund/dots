(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(global-display-line-numbers-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Nerd Font Mono" :foundry "UKWN" :slant normal :weight regular :height 128 :width normal)))))

;; My configurations
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(defun ter ()
  (interactive)
  (term "/usr/bin/zsh"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
