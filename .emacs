(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(package-selected-packages '(magit typescript-mode go-mode gruber-darker-theme)))

;; line numbers, relative please
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; set font, different names for win/linux
(defun font-exists-p (font) (if (null (x-list-fonts font)) nil t))
(when (window-system)
  (cond ((font-exists-p "Iosevka NFM") (set-frame-font "Iosevka NFM:spacing=100:size=20" nil t))
    ((font-exists-p "Iosevka Nerd Font") (set-frame-font "Iosevka Nerd Font:spacing=100:size=20" nil t))))

;; remove not used features
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil
      use-dialog-box nil
	  inhibit-startup-message 1
	  initial-scratch-message nil
	  auto-save-default nil
      ring-bell-function 'ignore)

;; Add Melpa repository
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; custom command to open term with zsh without asking (and eshell on windows)
(defun ter ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (if (eq system-type 'gnu/linux)(term "/usr/bin/zsh"))
  (if (eq system-type 'windows-nt)(eshell)))

;; automatically kill term buffer if process exits
(defun my-term-handle-exit (&optional process-name msg)
  (message "%s | %s" process-name msg)
  (kill-buffer (current-buffer)))
(advice-add 'term-handle-exit :after 'my-term-handle-exit)

;; Resizing the window to my needs
(if (window-system)
(setq default-frame-alist
        (append '((width . 150) (height . 30) (top . 120) (left . 185))
                default-frame-alist)))

;; SAVE what is entered into minibuffer prompts
;; use M-n for next and M-p for previous
(setq history-length 25)
(savehist-mode 1)

;; Save last file position
(save-place-mode 1)

;; Enable Ido mode
(ido-mode 1)
(ido-everywhere 1)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Set tab-width 
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Autorun eglot
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; show battery state in status line and prevent startup message
(display-battery-mode 1)
(defun display-startup-echo-area-message () (message ""))

;; Gives me git changes in the status line
(defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
  (setq ad-return-value
    (concat ad-return-value
            (let ((plus-minus (vc-git--run-command-string
                               file "diff" "--numstat" "--")))
              (and plus-minus
                   (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t" plus-minus)
                   (format " +%s-%s" (match-string 1 plus-minus) (match-string 2 plus-minus)))))))

