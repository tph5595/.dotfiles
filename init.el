;;; package ---  summary
;;; Commentary:
;;; my init.el for Emacs
;;;Update packages list
(package-refresh-contents)
;;; Code:
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "Hack Nerd Font Mono")

(load-theme 'wombat)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Autocomplete
(electric-pair-mode 1)
(use-package irony
  :config
  (dolist (mode '(c++-mode-hook
		  c-mode-hook))
    (add-hook mode 'irony-mode)))
(add-hook 'irony-mode 'irony-cdb-autosetup-compile-options)

(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))
(add-hook 'after-init-hook 'global-company-mode)

(use-package company-irony
  :after (company)
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package company-anaconda
  :after (anaconda-mode company)
  :config (add-to-list 'company-backends 'company-anaconda))

;; End autocomplete

;; Syntax checker

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-irony
  :after flycheck
  :init (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package flycheck-pos-tip
  :after flycheck-irony
  :init (flycheck-pos-tip-mode t))

;; End syntax checker

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; (use-package solarized-theme
;;   :config
;;   (load-theme 'solarized-dark t))

(use-package gruvbox-theme)

(use-package ivy
  :init (ivy-mode t)
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill)))
;; (ivy-mode t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; LaTex pretty editing
(use-package tex
  :ensure auctex
)

;; Might need to run to get working: (pdf-tools-install)
(use-package pdf-tools)
(setq doc-view-conversion-refresh-interval 1)

(setq TeX-source-correlate-method (quote synctex))
   (setq TeX-source-correlate-mode t)
   (setq TeX-source-correlate-start-server t)
   (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
   (add-hook 'TeX-after-compilation-finished-functions
   #'TeX-revert-document-buffer)
(pdf-tools-install)

;; Python Setup
(setq python-shell-interpreter "ipython3")
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
'org-babel-load-languages
'((python . t)))

;; --------------------------------------------------------------------------------------
;; Path Share with emacs
(use-package exec-path-from-shell)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
;; --------------------------------------------------------------------------------------
;; GoLang setup
(use-package go-mode)
;; Set GOPATH
;; (setenv "GOPATH" "/Users/taylor/go")
;; Call gofmt on save
(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
;; (add-hook 'before-save-hook 'gofmt-before-save)
;; Set up custom state
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "C-c C-c") 'compile)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)
;; Autocomplete setup for Go
(use-package auto-complete)
(use-package go-autocomplete)
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
;; Error fix
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "GOPATH")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" default))
 '(package-selected-packages
   '(auctex company-anaconda helpful company-irony company company-mode irony gruvbox-theme ivy-rich which-key rainbow-delimiters evil-nerd-commenter evil-collection evil use-package ivy doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
