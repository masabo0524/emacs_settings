;;; org-setup.el --- Basic Org mode setup -*- lexical-binding: t; -*-

;; ========================================
;; Basic directory settings
;; ========================================
(setq org-directory (expand-file-name "~/org"))
(setq org-default-notes-file (expand-file-name "inbox.org" org-directory))

;; agenda対象
(setq org-agenda-files
      (list
       (expand-file-name "inbox.org" org-directory)
       (expand-file-name "tasks.org" org-directory)
       (expand-file-name "diary.org" org-directory)
       (expand-file-name "projects" org-directory)))

;; ========================================
;; TODO keywords
;; ========================================
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; DONEになった時刻を記録
(setq org-log-done 'time)

;; ========================================
;; Archive settings
;; ========================================
;; 例:
;; tasks.org の項目を archive/tasks.org_archive に送る
(setq org-archive-location
      (expand-file-name "archive/%s_archive::" org-directory))

;; ========================================
;; Capture templates
;; ========================================
(setq org-capture-templates
      `(("t" "Todo" entry
         (file ,(expand-file-name "inbox.org" org-directory))
         "* TODO %?\n  %U\n")

        ("n" "Note" entry
         (file ,(expand-file-name "inbox.org" org-directory))
         "* %?\n  %U\n")

        ("d" "Diary" entry
         (file+datetree ,(expand-file-name "diary.org" org-directory))
         "* %?\n  %U\n")

        ("p" "Project task" entry
         (file ,(expand-file-name "tasks.org" org-directory))
         "* TODO %?\n  %U\n")))

;; ========================================
;; Useful Org settings
;; ========================================
;; インデント表示を見やすくする
(setq org-startup-indented t)

;; 見出しを開いた状態で始める
(setq org-startup-folded 'content)

;; リンクをそのまま見やすく表示
(setq org-descriptive-links t)

;; 画像をインライン表示
(setq org-startup-with-inline-images t)

;; TABで見出しをきれいに扱いやすくする
(setq org-cycle-separator-lines 1)

;; ========================================
;; Key bindings
;; ========================================
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; ========================================
;; Helper function: create org directories/files
;; ========================================
(defun my/org-ensure-base-files ()
  "Create basic Org directories and files if they do not exist."
  (interactive)
  (let* ((base org-directory)
         (projects-dir (expand-file-name "projects" base))
         (archive-dir (expand-file-name "archive" base))
         (files (list
                 (expand-file-name "inbox.org" base)
                 (expand-file-name "tasks.org" base)
                 (expand-file-name "diary.org" base))))
    ;; directories
    (dolist (dir (list base projects-dir archive-dir))
      (unless (file-directory-p dir)
        (make-directory dir t)))
    ;; files
    (dolist (file files)
      (unless (file-exists-p file)
        (with-temp-buffer
          (insert (format "#+TITLE: %s\n\n"
                          (file-name-base file)))
          (write-file file))))
    (message "Org base files and directories are ready.")))

;; 必要なら Emacs 起動後に M-x my/org-ensure-base-files を実行
;; 自動で作りたい場合は、次の1行を有効化してください。
;; (my/org-ensure-base-files)

(provide 'org-setup)
;;; org-setup.el ends here
