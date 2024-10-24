(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode nil)
(delete-selection-mode 1)
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

(setq ido-create-new-buffer 'always)
(setq-default confirm-nonexistent-file-or-buffer nil)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'treesit)
(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
 	      (c++-mode . c++-ts-mode)))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (projectile-mode 1))

(use-package company
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)))

(use-package catppuccin-theme
  :ensure t
  :config
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin :no-confirm))

(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-hook 'LaTeX-mode-hook #'yas-minor-mode))

(use-package clang-format
  :ensure t
  :bind (("C-S-i" . clang-format-buffer))
  :config
  (setq clang-format-fallback-style "llvm"))

;; (use-package company
;;   :ensure t)

(use-package flycheck
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package pdf-tools
  :ensure t)

(use-package org-noter
  :ensure t)

(defun my-turn-off-line-numbers ()
  "Disable line numbering in the current buffer."
  (display-line-numbers-mode -1))

(add-hook 'pdf-view-mode-hook #'my-turn-off-line-numbers)

(setq read-process-output-max (* 4 1024 1024))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gc-cons-threshold 100000000)
 '(package-selected-packages
   '(flycheck company company-mode org-noter pdf-tools clang-format magit yasnippet catppuccin-theme catppuccin multiple-cursors which-key projectile smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
