(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(display-battery-mode t)
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(typescript-mode go-mode gruber-darker-theme))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Nerd Font" :foundry "UKWN" :slant normal :weight regular :height 143 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; My configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove not used features

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil
      use-dialog-box nil
	  inhibit-startup-message t
	  initial-scratch-message nil
	  auto-save-default nil
      ring-bell-function 'ignore)

;; Replace def message
(defun display-startup-echo-area-message ()
  (message ""))

;; custom command to open term with zsh without asking
(defun ter ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (term "/usr/bin/zsh"))

;; automatically kill term buffer if process exits
(defun my-term-handle-exit (&optional process-name msg)
  (message "%s | %s" process-name msg)
  (kill-buffer (current-buffer)))

(advice-add 'term-handle-exit :after 'my-term-handle-exit)

;; Make Emacs frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Enable recentf-mode shows recent files if using recentf-open-files
(recentf-mode 1)

;; Save what is entered into minibuffer prompts
;; use M-n for next and M-p for previous
(setq history-length 25)
(savehist-mode 1)

;; Save last file position
(save-place-mode 1)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Set tab-width 
(setq-default tab-width 4)

;; Autorun eglot
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
