(global-font-lock-mode t)
;; Disable the menu bar, tool bar, and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'gruvbox-dark-soft t)
;; other theme names wombat, tango-dark

;; Turn off the startup message
(setq inhibit-startup-message t)


;; Enable relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Enable column number mode
(column-number-mode)

;; Enable matching parentheses
(show-paren-mode)

;; Set default font size
(set-face-attribute 'default nil :height 120)

;; full window on start
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(overwrite-mode -1)  ; Disable overwrite mode permanently

(add-hook 'after-init-hook 'global-company-mode)


;; Go packages
;; Initialize package system
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Install go-mode if not already
(unless (package-installed-p 'go-mode)
  (package-refresh-contents)
  (package-install 'go-mode))

;; Associate .go files with go-mode
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Enable syntax highlighting globally
(global-font-lock-mode t)

;; installed packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(go-mode gruvbox-theme company magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
