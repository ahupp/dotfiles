(setq local-elisp-dir (expand-file-name "~/dotfiles/elisp/"))
(add-to-list 'load-path local-elisp-dir)

(server-start)
(blink-cursor-mode nil)
(line-number-mode t)
(transient-mark-mode t)
(global-font-lock-mode t)

(setq inhibit-startup-message t)
(setq save-abbrevs 'silently)
(setq visible-bell t)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)
(setq require-final-newline t)
(setq font-lock-maximum-decoration t)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

(defun make-backup-file-name (file)
  (make-temp-file (file-name-nondirectory file)))

;; From stevey
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

