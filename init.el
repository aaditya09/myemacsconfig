(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(setq warning-minimum-level :emergency)


(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		                        (not (gnutls-available-p))))
              (proto (if no-ssl "http" "https")))
    ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
      (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
        ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
	  (when (< emacs-major-version 24)
	        ;; For important compatibility libraries like cl-lib
		    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;;(eval-when-compile
;;  (require 'use-package))
;;(require 'base)
;;(require 'base-theme)
;;(require 'base-extensions)
;;(require 'base-functions)
;;(require 'base-global-keys)
;;(require 'lang-python)
;;(require 'lang-ruby)
;;(require 'lang-go)
;;(require 'lang-javascript)
;;(require 'lang-web)
;;(require 'lang-haskell)
;;(require 'lang-c)



(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(use-package saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" user-emacs-directory))

(use-package ido
             :config
             (ido-mode t)
             (setq ido-enable-flex-matching t))

;; Full path in frame title
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; Auto refresh buffers when edits occur outside emacs
(global-auto-revert-mode 1)

;; Also auto refresh Dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
;; Quickly copy/move file in Dired
(setq dired-dwim-target t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Auto-close brackets and double quotes
(electric-pair-mode 1)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Smooth Scroll:
(setq mouse-wheel-scroll-amount '(1 ((shift) .1))) ;; one line at a time

;; Scrol one line when hitting bottom of window
(setq scroll-conservatively 10000)

;; Change Cursor
(setq-default cursor-type 'box)
(blink-cursor-mode -1)

;; Remove alarm (bell) on scroll
(setq ring-bell-function 'ignore)

;; Set default tab width
(setq default-tab-width 4)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Word Wrap (t is no wrap, nil is wrap)
(setq-default truncate-lines nil)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Add parts of each file's directory to the buffer name if not unique
(use-package uniquify
             :config
             (setq uniquify-buffer-name-style 'forward))

;; eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; from 'better-defaults.el'
;; Allow clipboard from outside emacs
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)
(load-theme 'doom-challenger-deep t)

(setq eshell-prompt-function
(lambda ()
(concat
(propertize "┌─[" 'face `(:foreground "green"))
(propertize (user-login-name) 'face `(:foreground "red"))
(propertize "@" 'face `(:foreground "green"))
(propertize (system-name) 'face `(:foreground "orange"))
(propertize "]──[" 'face `(:foreground "green"))
(propertize (format-time-string "%H:%M" (current-time)) 'face `(:foreground "yellow"))
(propertize "]──[" 'face `(:foreground "green"))
(propertize (concat (eshell/pwd)) 'face `(:foreground "white"))
(propertize "]\n" 'face `(:foreground "green"))
(propertize "└─>" 'face `(:foreground "green"))
(propertize (if (= (user-uid) 0) " # " " $ ") 'face `(:foreground "green"))
)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nyan-mode t)
 '(package-selected-packages
   '(haskell-mode lsp-java neotree undo-tree smex crux expand-region avy ivy-hydra swiper counsel ivy web-mode json-mode flycheck google-this which-key projectile exec-path-from-shell company-anaconda company-go git-timemachine git-gutter magit helm-flycheck writegood-mode fzf nyan-mode dumb-jump use-package-ensure-system-package use-package-el-get use-package-chords use-package eshell-git-prompt esh-autosuggest gradle-mode egg gited eclim ace-window js2-mode doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((((class color) (min-colors 257)) (:foreground "#3d4551")) (((class color) (min-colors 256)) (:foreground "#2e2e2e")) (((class color) (min-colors 16)) (:foreground "brightblack"))))
 '(company-preview-common ((((class color) (min-colors 257)) (:background "#4C4B68" :foreground "#906cff")) (((class color) (min-colors 256)) (:background "#262626" :foreground "#a9a1e1")) (((class color) (min-colors 16)) (:background "brightblack" :foreground "brightmagenta"))))
 '(company-preview-search ((t (:inherit company-tooltip-search))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))
 '(company-scrollbar-fg ((((class color) (min-colors 257)) (:background "#906cff")) (((class color) (min-colors 256)) (:background "#a9a1e1")) (((class color) (min-colors 16)) (:background "brightmagenta"))))
 '(company-template-field ((t (:inherit match))))
 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-annotation ((((class color) (min-colors 257)) (:foreground "#906cff" :distant-foreground "#1b182c")) (((class color) (min-colors 256)) (:foreground "#a9a1e1" :distant-foreground "#1c1c1c")) (((class color) (min-colors 16)) (:foreground "brightmagenta" :distant-foreground nil))))
 '(company-tooltip-common ((((class color) (min-colors 257)) (:foreground "#906cff" :distant-foreground "#100e23" :weight bold)) (((class color) (min-colors 256)) (:foreground "#a9a1e1" :distant-foreground "black" :weight bold)) (((class color) (min-colors 16)) (:foreground "brightmagenta" :distant-foreground "black" :weight bold))))
 '(company-tooltip-mouse ((((class color) (min-colors 257)) (:background "#c991e1" :foreground "#1b182c" :distant-foreground "#cbe3e7")) (((class color) (min-colors 256)) (:background "#c678dd" :foreground "#1c1c1c" :distant-foreground "#2d2d2d")) (((class color) (min-colors 16)) (:background "magenta" :foreground nil :distant-foreground "white"))))
 '(company-tooltip-search ((((class color) (min-colors 257)) (:background "#906cff" :foreground "#1b182c" :distant-foreground "#cbe3e7" :weight bold)) (((class color) (min-colors 256)) (:background "#a9a1e1" :foreground "#1c1c1c" :distant-foreground "#2d2d2d" :weight bold)) (((class color) (min-colors 16)) (:background "brightmagenta" :foreground nil :distant-foreground "white" :weight bold))))
 '(company-tooltip-selection ((((class color) (min-colors 257)) (:background "#906cff" :weight bold)) (((class color) (min-colors 256)) (:background "#a9a1e1" :weight bold)) (((class color) (min-colors 16)) (:background "brightmagenta" :weight bold)))))


;; (require 'js-comint)
;; (setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main")
;; (add-hook 'js2-mode-hook '(lambda ()
;; 			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
;; 			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
;; 			    (local-set-key "\C-cb" 'js-send-buffer)
;; 			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
;; 			    (local-set-key "\C-cl" 'js-load-file-and-go)
;; 			    ))




;; (custom-set-faces
;;  ;; ...
;;  '(company-preview ((t (:background "black" :foreground "red"))))
;;  '(company-preview-common ((t (:foreground "red"))))
;;  '(company-preview-search ((t (:inherit company-preview))))
;;  '(company-scrollbar-bg ((t (:background "brightwhite"))))
;;  '(company-scrollbar-fg ((t (:background "red"))))
;;  '(company-template-field ((t (:background "magenta" :foreground "black"))))
;;  '(company-tooltip ((t (:background "brightwhite" :foreground "black"))))
;;  '(company-tooltip-annotation ((t (:background "brightwhite" :foreground "black"))))
;;  '(company-tooltip-annotation-selection ((t (:background "color-253"))))
;;  '(company-tooltip-common ((t (:background "brightwhite" :foreground "red"))))
;;  '(company-tooltip-common-selection ((t (:background "color-253" :foreground "red"))))
;;  '(company-tooltip-mouse ((t (:foreground "black"))))
;;  '(company-tooltip-search ((t (:background "brightwhite" :foreground "black"))))
;;  '(company-tooltip-selection ((t (:background "color-253" :foreground
;;  "black"))))
;;  ;; ...
;; )


;;(define-key eclim-mode-map (kbd "C-c C-c") 'eclim-problems-correct)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


(require 'eclim)
(add-hook 'java-mode-hook 'eclim-mode)

(require 'eclimd)

(require 'gradle-mode)
(add-hook 'java-mode-hook '(lambda() (gradle-mode 1)))


(require 'company)
(global-company-mode t)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

;;(define-key eclim-mode-map (kbd "C-c C-c") 'eclim-problems-correct)

(setq eclimd-autostart t)

(define-key eclim-mode-map (kbd "C-c C-c") 'eclim-problems-correct)


(require 'compile)

;; Add regexp to make compilation-mode understand maven2 errors
(setq compilation-error-regexp-alist
      (append (list
               '("\\[ERROR]\\ \\(\/.*\\):\\[\\([0-9]*\\),\\([0-9]*\\)]" 1 2 3))
              compilation-error-regexp-alist))

(define-key eclim-mode-map (kbd "C-c C-e m p") 'eclim-maven-lifecycle-phase-run)
(define-key eclim-mode-map (kbd "C-c C-e m r") 'eclim-maven-run)

(defvar eclim-maven-lifecycle-phases
  '("validate" "compile" "test" "package" "integration" "verify" "install" "deploy"))

(defun eclim--maven-lifecycle-phase-read ()
  (completing-read "Phase: " eclim-maven-lifecycle-phases))

(defun eclim--maven-pom-path ()
  (concat (eclim--project-dir) "/pom.xml "))

(defun eclim--maven-execute (command)
  (let ((default-directory (eclim--project-dir)))
    (compile (concat "mvn -f " (eclim--maven-pom-path) " " command))))

(provide 'eclim-maven)

(global-set-key [f5] 'my-recompile)

(defvar java-stack-trace-dir "src/")
    (defun java-stack-trace-regexp-to-filename ()
      "Generates a relative filename from java-stack-trace regexp match data."
      (concat java-stack-trace-dir
              (replace-regexp-in-string "\\." "/" (match-string 1))
              (match-string 2)))

    (add-to-list 'compilation-error-regexp-alist 'java-stack-trace)
    (add-to-list 'compilation-error-regexp-alist-alist
      '(java-stack-trace .
        ("^[[:space:]]*at \\(\\(?:[[:lower:]]+\\.\\)+\\)[^(]+(\\([[:alnum:]]+\\.java\\):\\([[:digit:]]+\\))"
         java-stack-trace-regexp-to-filename 3)))
;; Add color formatting to *compilation* buffer
(add-hook 'compilation-filter-hook
  (lambda () (ansi-color-apply-on-region (point-min) (point-max))))
(setq compilation-scroll-output t)

(setq dumb-jump-selector 'helm)
(setq dumb-jump-aggressive nil)

(use-package fzf
  :ensure t)

(global-set-key (kbd "C-c f") 'fzf)

(use-package dumb-jump
    :ensure t
    :diminish dumb-jump-mode
    :bind (("C-M-g" . dumb-jump-go)
           ("C-M-p" . dumb-jump-back)
           ("C-M-q" . dumb-jump-quick-look)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
    :ensure t
    :config
    (global-git-gutter-mode 't)
    :diminish git-gutter-mode)

(use-package git-timemachine
  :ensure t)

;; (use-package flycheck
;;     :ensure t
;;     :config
;;     (add-hook 'after-init-hook 'global-flycheck-mode)
;;    ;; (add-hook 'flycheck-mode-hook 'use-eslint-from-node-modules)
;;     (add-to-list 'flycheck-checkers 'proselint)
;;     (setq-default flycheck-highlighting-mode 'lines)
;;     ;; Define fringe indicator / warning levels
;;     (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
;;       (vector #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00011100
;;               #b00111110
;;               #b00111110
;;               #b00111110
;;               #b00011100
;;               #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00000000
;;               #b00000000))
;;     (flycheck-define-error-level 'error
;;       :severity 2
;;       :overlay-category 'flycheck-error-overlay
;;       :fringe-bitmap 'flycheck-fringe-bitmap-ball
;;       :fringe-face 'flycheck-fringe-error)
;;     (flycheck-define-error-level 'warning
;;       :severity 1
;;       :overlay-category 'flycheck-warning-overlay
;;       :fringe-bitmap 'flycheck-fringe-bitmap-ball
;;       :fringe-face 'flycheck-fringe-warning)
;;     (flycheck-define-error-level 'info
;;       :severity 0
;;       :overlay-category 'flycheck-info-overlay
;;       :fringe-bitmap 'flycheck-fringe-bitmap-ball
;;       :fringe-face 'flycheck-fringe-info))

;; (flycheck-define-checker proselint
;;     "A linter for prose."
;;     :command ("proselint" source-inplace)
;;     :error-patterns
;;     ((warning line-start (file-name) ":" line ":" column ": "
;;               (id (one-or-more (not (any " "))))
;;               (message (one-or-more not-newline)
;;                        (zero-or-more "\n" (any " ") (one-or-more not-newline)))
;;               line-end))
;;     :modes (text-mode markdown-mode gfm-mode org-mode))

(use-package company
    :ensure t
    :diminish
    :config
    (add-hook 'after-init-hook 'global-company-mode)

    (setq company-idle-delay t)

    (use-package company-go
      :ensure t
      :config
      (add-to-list 'company-backends 'company-go))

    (use-package company-anaconda
      :ensure t
      :config
      (add-to-list 'company-backends 'company-anaconda)))

(setq company-dabbrev-downcase nil)

(use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))

(use-package projectile
    :ensure t
    :config
    (projectile-mode))
(setq projectile-completion-system 'ivy)

(use-package nyan-mode
  :ensure t
  :config
  (nyan-start-animation))

(use-package which-key
    :ensure t
    :diminish which-key-mode
    :config
    (add-hook 'after-init-hook 'which-key-mode))

(use-package google-this
  :ensure t)

(use-package crux
  :ensure t
  :bind (("C-a" . crux-move-beginning-of-line)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package smex
  :ensure t)

(use-package counsel
    :ensure t
    :bind (("M-x" . counsel-M-x))
    :chords (("yy" . counsel-yank-pop)))

 (use-package ivy
      :ensure t
      :diminish ivy-mode
      :config
      (ivy-mode t))

(setq ivy-initial-inputs-alist nil)

(use-package use-package-chords
    :ensure t
    :config
    (key-chord-mode 1))


(use-package swiper
    :ensure t
    :bind (("M-s" . swiper)))

(use-package ivy-hydra
  :ensure t)


(defun jc/switch-to-previous-buffer ()
    "Switch to previously open buffer.Repeated invocations toggle between thealist most recently open buffers."
    (interactive)
    (switch-to-buffer (other-buffer (current-buffer) 1)))

(key-chord-define-global "JJ" 'jc/switch-to-previous-buffer)

(use-package undo-tree
    :ensure t
    :chords (("uu" . undo-tree-visualize))
    :diminish undo-tree-mode:
    :config
    (global-undo-tree-mode 1))

(use-package avy
    :ensure t
    :chords (("jj" . avy-goto-char-2)
             ("jl" . avy-goto-line)))

(use-package ace-window
    :ensure t
    :chords ("jk" . ace-window)
    :config
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package expand-region
    :ensure t
    :bind ("C-=" . er/expand-region))

 (use-package neotree
    :ensure t
    :config
    (global-set-key (kbd "C-c t") 'neotree-toggle))

(setq neo-smart-open t)

(setq neo-theme 'arrow)

;; (add-hook 'sql-interactive-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines t)))

(blink-cursor-mode 1)
(setq x-stretch-cursor t)

(setq org-reveal-root "file:///home/aaditya/git/reveal.js/reveal.js")
(require 'ox-reveal)
(setq Org-Reveal-root "file:///home/aaditya/git/reveal.js/reveal.js")
(setq Org-Reveal-title-slide nil)

(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))

;; (use-package ensime
;;   :ensure t
;;   :pin melpa-stable)
;; (add-to-list 'exec-path "/usr/local/bin")
;; (require 'lsp-java)
;; (add-hook 'java-mode-hook #'lsp-java-enable)

;; ;;set the projects that are going to be imported into the workspace.
;; (setq lsp-java--workspace-folders (list "/home/aaditya/projects/dedicatedservers/"
;;                                         "/home/aaditya/projects/osbll/"

;;                                         ))
;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

;; (require 'lsp-ui)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; (require 'cc-mode)

;; (condition-case nil
;;     (require 'use-package)
;;   (file-error
;;    (require 'package)
;;    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;    (package-initialize)
;;    (package-refresh-contents)
;;    (package-install 'use-package)
;;    (require 'use-package)))

;; (use-package lsp-mode
;;   :ensure t
;;   :init (setq lsp-inhibit-message t
;;               lsp-eldoc-render-all nil
;;               lsp-highlight-symbol-at-point nil))

;; (use-package company-lsp
;;   :after  company
;;   :ensure t
;;   :config
;;   (add-hook 'java-mode-hook (lambda () (push 'company-lsp company-backends)))
;;   (setq company-lsp-enable-snippet t
;;         company-lsp-cache-candidates t)
;; ;;  (push 'java-mode company-global-modes))

;; (use-package lsp-ui
;;   :ensure t
;;   :config
;;   (setq lsp-ui-sideline-enable t
;;         lsp-ui-sideline-show-symbol t
;;         lsp-ui-sideline-show-hover t
;;         lsp-ui-sideline-show-code-actions t
;;         lsp-ui-sideline-update-mode 'point))

;; (use-package lsp-java
;;   :ensure t
;;   :requires (lsp-ui-flycheck lsp-ui-sideline)
;;   :config
;;   (add-hook 'java-mode-hook  'lsp-java-enable)
;;   (add-hook 'java-mode-hook  'flycheck-mode)
;;   (add-hook 'java-mode-hook  'company-mode)
;;   (add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
;;   (add-hook 'java-mode-hook  'lsp-ui-sideline-mode)
;;   (setq lsp-java--workspace-folders (list (error " Specify your projects here"))))
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)
(provide 'init)
;;; init.el ends here
