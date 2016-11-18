;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

;; load Org-mode from source when the ORG_HOME environment variable is set

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8
    neotree
    magit
    markdown-mode))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)



;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi-setup-venv)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; Global configuration settings
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; Hotkeys
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'ansi-term)

;; PYTHON
;; --------------------------------------
(elpy-enable)
(elpy-use-ipython)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; --------------------------------------
;; MARKDOWN
;; --------------------------------------
(autoload 'gfm-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdt$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown$" . gfm-mode) auto-mode-alist))



;; TERMINAL
;; -------------------------------------

;; -------------------------------------
;; DEVOPS
;; -------------------------------------
(define-key global-map (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-x C-b") 'bs-show)

(when (getenv "ORG_HOME")
  (let ((org-lisp-dir (expand-file-name "lisp" (getenv "ORG_HOME"))))
    (when (file-directory-p org-lisp-dir)
      (add-to-list 'load-path org-lisp-dir)

      (require 'org))))


;; load the starter kit from the `after-init-hook' so all packages are loaded
(add-hook 'after-init-hook
 `(lambda ()
    ;; remember this directory
    (setq starter-kit-dir
          ,(file-name-directory (or load-file-name (buffer-file-name))))
    ;; only load org-mode later if we didn't load it just now
    ,(unless (and (getenv "ORG_HOME")
                  (file-directory-p (expand-file-name "lisp"
                                                      (getenv "ORG_HOME"))))
       '(require 'org))
    ;; load up the starter kit
    (org-babel-load-file (expand-file-name "starter-kit.org" starter-kit-dir))))


;;; ANSI-TERM
    (defun term/shell (program &optional new-buffer-name)
      "Start a terminal-emulator in a new buffer.

    With a prefix argument, it prompts the user for the shell
    executable.

    If there is already existing buffer with the same name, switch to
    that buffer, otherwise it creates new buffer.

    Like `shell', it loads `~/.emacs_SHELLNAME' if exists, or
    `~/.emacs.d/init_SHELLNAME.sh'.

    The shell file name (sans directories) is used to make a symbol
    name such as `explicit-bash-args'.  If that symbol is a variable,
    its value is used as a list of arguments when invoking the
    shell."
      (interactive (let ((default-prog (or explicit-shell-file-name
                                           (getenv "ESHELL")
                                           shell-file-name
                                           (getenv "SHELL")
                                           "/bin/sh")))
                     (list (if (or (null default-prog)
                                   current-prefix-arg)
                               (read-from-minibuffer "Run program: " default-prog)
                             default-prog))))

      ;; Pick the name of the new buffer.
      (setq term-ansi-buffer-name
            (if new-buffer-name
                new-buffer-name
              (if term-ansi-buffer-base-name
                  (if (eq term-ansi-buffer-base-name t)
                      (file-name-nondirectory program)
                    term-ansi-buffer-base-name)
                "shell/term")))

      (setq term-ansi-buffer-name (concat "*" term-ansi-buffer-name "*"))

      ;; In order to have more than one term active at a time
      ;; I'd like to have the term names have the *term-ansi-term<?>* form,
      ;; for now they have the *term-ansi-term*<?> form but we'll see...
      (when current-prefix-arg
        (setq term-ansi-buffer-name 
              (generate-new-buffer-name term-ansi-buffer-name)))

      (let* ((name (file-name-nondirectory program))
             (startfile (concat "~/.emacs_" name))
             (xargs-name (intern-soft (concat "explicit-" name "-args"))))
        (unless (file-exists-p startfile)
          (setq startfile (concat user-emacs-directory "init_" name ".sh")))

        (setq term-ansi-buffer-name
              (apply 'term-ansi-make-term term-ansi-buffer-name program
                     (if (file-exists-p startfile) startfile)
                     (if (and xargs-name (boundp xargs-name))
                         ;; `term' does need readline support.
                         (remove "--noediting" (symbol-value xargs-name))
                       '("-i")))))

      (set-buffer term-ansi-buffer-name)
      (term-mode)
      (term-line-mode)                      ; (term-char-mode) if you want

      ;; I wanna have find-file on C-x C-f -mm
      ;; your mileage may definitely vary, maybe it's better to put this in your
      ;; .emacs ...

      (term-set-escape-char ?\C-x)

      (switch-to-buffer term-ansi-buffer-name))

    (global-set-key "\C-cd" 'term/shell)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
