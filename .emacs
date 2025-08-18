(setq inhibit-startup-message nil)

(setq debug-on-error t)

(setq org-startup-truncated t)

(setq org-display-inline-images t)

(setq org-image-actual-width 700)

(setq org-startup-folded t)

(setq make-backup-files nil)

(setq dired-dwim-target t)

(setq auto-save-default nil)

(setq confirm-kill-emacs 'y-or-n-p)

(setq hyper-v_address "185.111.10.4")

(setq ring-bell-function 'ignore)

(setq display-time-day-and-date t)
(setq display-time-format "%Y-%m-%d (%a) %H:%M")




(defun insert-meeting-memo ()
  (interactive)
  (insert-file "d:/Users/MasaakiT/Documents/emacs/template/meeting_memo.org"))
(defun insert-belonging ()
  (interactive)
  (insert-file "d:/Users/MasaakiT/Documents/emacs/template/belongings.org"))

;; CMake List Mode from https://qiita.com/3valleys/items/21d30bff421b81d244ef
;;(require 'cmake-mode);; Add cmake listfile names to the mode list.
;;(setq auto-mode-alist
;;      (append
;;       '(("CMakeLists\\.txt\\'" . cmake-mode))
;;       '(("\\.cmake\\'" . cmake-mode))
;;       auto-mode-alist))

(with-eval-after-load "calender"
  (require 'moonrise)
  (define-key calender-mode-map "Ld" 'calender-moonrise-moonset)
  (define-key calender-mode-map "Lm" 'calender-moonrise-moonset-month))


(defun toppage ()
  (interactive)
  (find-file "~/Documents/emacs/template/TopPage.org")
;;  (setq org-startup-folded nofold)
  )
(global-set-key "\C-cg" `toppage)

(defun edit-network-device ()
  (interactive)
  (setq address (read-string "IPアドレスを入力してください: " "10.7.196.226"))
  (setq user (read-string "ユーザー名を入力してください: " "autera-admin"))
  (find-file (concat "/plink:" user "@" address "|sudo:" address ":"))
  )

(defun edit-bp-machine ()
  (interactive)
  (setq address (read-string "IPアドレスを入力してください: " "10.7.196.137"))
  (setq user (read-string "ユーザー名を入力してください: " "dspace"))
  (find-file (concat "/plink:" user "@" address "|sudo:" address ":/home/dspace/"))
  )

;;(defun edit-virtual-machine ()
;;  "Hyper-V上のUbuntu 20.04上のファイルにアクセスします"
;;  (interactive)
;;  (find-file "/plink:masaaki@172.22.188.195|sudo:172.22.188.195:/home/masaaki/"))
;;(defun edit-virtual-machine ()                                                   
;;  "Hyper-V上のUbuntu 20.04上のファイルにアクセスします"                          
;;  (interactive)                                                                  
;;  (find-file (concat "/plink:masaaki@" hyper-v_address "|sudo:" hyper-v_address ":/home/masaaki/Documents"))
;;  (set-frame-name "Hyper-V Edit Mode"))
;;
;;
;;(defun edit-demo-autera ()
;;  (interactive)
;;  (find-file "/plink:autera-admin@10.7.196.226|sudo:10.7.196.226:/home/autera-admin/")
;;  (princ "Demo Autera上のファイルにアクセスしています")
;;  (set-frame-name "Demo Autera Edit Mode"))
;;
;;(defun edit-demo-autera2 ()
;;  (interactive)
;;  (find-file "/plink:autera-admin@10.7.190.16|sudo:10.7.190.16:/home/autera-admin/")
;;  (princ "Demo Autera上のファイルにアクセスしています")
;;  (set-frame-name "Demo Autera Edit Mode"))

(setq linuxPC_address "192.168.10.106")
(defun linuxPC ()                                                                              
  "自宅のLinux PCにアクセスします"                                                     
  (interactive)                                                                                             
  (find-file (concat "/ssh:takedamasaaki@"linuxPC_address "|sudo:" linuxPC_address ":/home/takedamasaaki/Documents")))

(setq homePC_address "133.201.19.225")
(setq homePC_ssh-port "52976")
(defun homePC ()                                                                              
  "自宅のLinux PCにアクセスします"                                                     
  (interactive)                                                                                             
  (find-file (concat "/ssh:takedamasaaki@"homePC_address"#"homePC_ssh-port "|sudo:" homePC_address ":/home/takedamasaaki/Documents")))


(defun edit-diary ()
  (interactive)
  (setq file-name (format-time-string "%Y%m%d" (time-add (current-time)(* 60 24))))
  (setq this-year (format-time-string "%Y" (time-add (current-time)(* 60 24))))
  ;;  (setq path-name (concat "d:/Users/MasaakiT/Documents/emacs/Diary/" this-year "/" file-name ".org"))
  (setq path-name (concat "~/Documents/emacs/diary/" this-year "/" file-name ".org"))
  (find-file path-name))
(global-set-key "\C-ct" `edit-diary)


(add-to-list 'exec-path "c:/msys64/mingw64/bin")


(setq grep-host-defaults-alist nil)
(setq grep-template "lgrep <C> -n <R> <F> <N>")
(setq grep-find-template "find . <X> -type <F> -print0 | xargs -0 -e lgrep <C> -n <R> <N>")



(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

;;(split-window-horizontally)
;;(other-window 1)
;;(split-window-vertically)
;;(other-window 2)
;;(split-window-vertically)
;;
;;
;;
(load "saveplace")
(setq-default save-place t )
;;
;;
;;

;;
;;
;;
(setq org-export-latex-coding-system 'utf-8)
(setq org-export-latex-classes nil)
(add-to-list 'org-export-latex-classes
	     '("jsarticle"
	       "\\documentclass[a4j]{jsarticle}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       ))
;;
;;
;;



;;
;;
;;
;;(windmove-default-keybindings)
;;(setq windmove-wrap-around t)
;;(global-set-key (kbd "C-x <left>") 'windmove-left)
;;(global-set-key (kbd "C-x <right>") 'windmove-right)
;;(global-set-key (kbd "C-x <up>") 'windmove-up)
;;(global-set-key (kbd "C-x <down>") 'windmove-down)
;;
;;
;;

;;
;;
;;

;;
;;
;;

;;
;;sugasawa-san waza
;;
(defun my-split-window-horizontally-three-pane (arg)
  (interactive "p")
  (split-window-horizontally (/ (window-width) 3))
  (other-window 1)
  (split-window-horizontally)
  (other-window -1))
(define-key ctl-x-map "|" 'my-split-window-horizontally-three-pane)

;;(global-set-key [\C-tab] '(lambda () (interactive) (other-window (+ 1))))
;;(global-set-key [\C-S-tab] '(lambda () (interactive) (other-window (- 1))))
(global-set-key [\C-tab] '(lambda () (interactive) (other-frame (+ 1))))
(global-set-key [\C-S-tab] '(lambda () (interactive) (other-frame (- 1))))

(global-set-key "\M-p" '(lambda () (interactive) (move-to-window-line 0)))
(global-set-key "\M-m" '(lambda () (interactive) (move-to-window-line nil)))
(global-set-key "\M-l" '(lambda () (interactive) (move-to-window-line -1)))

(global-set-key "\M-g" '(lambda (x) (interactive "nLine: ") (goto-line x)))


(defun folder-manage-buffer ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally (/ (window-width) 3))
  (toppage))
(global-set-key "\C-cf" '(lambda () (interactive) (folder-manage-buffer)))
;;
;;
;;

(add-hook 'find-file-hooks 'view-mode)


(display-battery-mode 1)

(display-time-mode 1)

(require 'linum)
(global-linum-mode 1)

;;
;;
;;
(defun toggle-org-html-export-on-save ()
;;  (interactive)
  (if (memq after-save-hook 'org-html-expor-tto-htm)l
      (progn
	(remove-hook 'after-save-hook 'org-html-export-to-html t)
	(message "Disabled org html export on save for current buffer..."))
    (add-hook 'after-save-hook 'org-html-export-to-html nil t)
    (message "Enabled org html export on save for current buffer...")))

;;
;;
;;

;;
;;
;;
;(require 'grep)
;(setq grep-command-before-query "grep.exe -n keyword *.org")
;(defun grep-default-command ()
;  (if current-prefix-arg
;      (let ((grep-command-before-target
;	     (concat grep-command-before-query
;		     (shell-quote-argument (grep-tag-default)))))
;	(cons (if buffer-file-name
;		  (concat grep-command-before-target
;			  "*."
;			  (file-name-extension buffer-file-name))
;		(concat grep-command-before-target "."))
;	      (+ (length grep-command-before-target) 1)))
;	(car grep-command)))
;(setq grep-command (cons (concat grep-command-before-query ".")
;			 (+ (length grep-command-before-query) 1)))
;;
;;
;;


(global-set-key "\C-h" `delete-backward-char)

;;
;;
;;
(setq c-basic-offset 4)
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)
(defun my-c-c++-mode-init ()
  (setq c-default-style "linux")
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq c-tab-always-indent t)
  (setq c-auto-newline nil)
  ;;(setq c-hungry-delete-key t)
  (setq c-offsets-alist '((inline-open 0)
			  (defun-block-intro 4)
			  (substatement-open 0)
			  (substatement 4)
			  (statement-block-intro 4)
			  (statement-case-intro 4)
			  (case-label 4)
			  (inclass 4)
			  (inexpr-class 4)
			  )
	)
  (setq c-hanging-braces-alist '((inline-open before)
				 (inline-close before)
				 (substatement-open before after)
				 (class-open before after)
				 (class-close before)))
  (setq c-continued-statement-offset 0)
  (setq c-indent-level 4))

(defun insert-current-time()
  (interactive)
  (insert (format-time-string "%Y-%m-%d(%a) %H:%M:%S" (current-time))))
(define-key global-map "\C-cd" `insert-current-time)

;;
;;
;;

;;
;;
;;
(setq calender-intermonth-text
      '(propertize
	(format "%0d2"
		(car
		 (calendar-iso-from-absolute
		  (calendar-absolute-from-gregorian
		   (list month (- day (1- calendar-week-start-day)) year)))))
	'font-lock-face 'calendar-iso-week-face))

;;
;;
;;

;;(setq org-agenda-files
;;      '("D:/Users/MasaakiT/Document/emacs/Diary"
;;        ))
(define-key global-map "\C-ca" 'org-agenda)

;;
;;起動時にDiaryディレクトリのDiredを開く設定
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "k&r")
     (c++-mode . "k&r")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(custom-enabled-themes '(manoj-dark))
 '(initial-buffer-choice "~/Documents/emacs/template/TopPage.org")
;; '(initial-buffer-choice "D:\\Users\\MasaakiT\\Documents\\emacs\\TopPage.org")
 '(initial-frame-alist '((height . 35) (width . 120) (top . 150) (left . 150)))
 '(org-agenda-files "~/.agenda_files")
 '(package-selected-packages
   '(camera undo-tree pdf-tools ## company web-mode htmlize clipboard-collector buffer-expose org-modern org-tree-slide org-journal))
 '(warning-suppress-log-types
   '(((unlock-file))
     ((unlock-file))
     ((unlock-file))
     (auto-save)
     (org)
     (org)
     (org)
     (org)
     (org)))
 '(warning-suppress-types
   '(((unlock-file))
     ((unlock-file))
     (auto-save)
     (org)
     (org)
     (org)
     (org)
     (org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family #("ＭＳ 明朝" 0 5 (charset cp932-2-byte)) :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
(put 'downcase-region 'disabled nil)

(setq org-startup-indented t)
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-indent-indentation-per-level 4)

(require 'autoinsert)

;; テンプレートのディレクトリ
;;(setq auto-insert-directory "D:/Users/MasaakiT/Documents/emacs/template/")
(setq auto-insert-directory "~/Documents/emacs/template/")

;; 各ファイルによってテンプレートを切り替える
(setq auto-insert-alist
      ;; (nconc '(
      (append (list
	       ;;'("\\PPJ\\.org$" . ["project_template.org" my-template])
	       '("Internal.*.org$" . ["internal_template.org" my-template])
	       '("PPJ.*.org$" . ["project_template.org" my-template])
	       '("Education.*.org$" . ["Education_template.org" my-template])
	       '("DS-.*.org$" . ["support_template.org" my-template])
	       '("8dReport.*.org$" . ["support_template.org" my-template])
	       '("Support.*.org$" . ["support_template.org" my-template])
	       '("MonthReport.*.org$" . ["Diary_Month_template.org" my-template])
	       '("Manual.*.org$" . ["manual_template.org" my-template])
	       '(".*.org$" . ["Diary_template.org" my-template])
		;;("\\.h$"   . ["template.h" my-templatex])
               ) auto-insert-alist))
;;(require 'cl)

;; ここが腕の見せ所
(defvar template-replacements-alists
  '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ("%include-guard%"    . (lambda () (format "__SCHEME_%s__" (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))))))

(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
        (progn
          (goto-char (point-min))
          (replace-string (car c) (funcall (cdr c)) nil)))
    template-replacements-alists)
  (goto-char (point-max))
  (message "done."))
(add-hook 'find-file-not-found-hooks 'auto-insert)

(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;;(define-key global-map "\C-x\C-e" 'explorer)
;;(defun explorer (&optional path)
;;  "引数があればそのパスの、引数が省略されていれば現在のバッファのファイルを、explorerで開きます。"
;;  (interactive)
;;  ;; (setq path (expand-file-name (or path (buffer-name))))
;;  (setq path default-directory)
;;  (cond
;;    ((not (file-exists-p path))
;;     (message "path %s isn't exist" path))
;;    (t
;;     (let ((dos-path (replace-regexp-in-string "/" "\\\\" path)))
;;       (apply (function start-process)
;;              "explorer" nil "explorer.exe" (list (concat "/select," dos-path)))))))


(defun finder-current-dir-open()
  (interactive)
  (shell-command "open ."))
(defun finder-open()
  (interactive)
  (shell-command (concat "open" dirname)))
(global-set-key
 (kbd "C-x e") 'finder-current-dir-open)


;;(define-key global-map "\C-ce" 'file-explorer)
;;
;;(defun file-explorer (&optional filepath)
;;  "引数があればそのパスの、引数が省略されていれば現在のバッファのファイルを、explorerで開きます。"
;;  (interactive)
;;  (setq filepath (expand-file-name (or filepath (buffer-file-name))))
;;  ;;(setq path default-directory)
;;  (cond
;;    ((not (file-exists-p filepath))
;;     (message "path %s isn't exist" filepath))
;;    (t
;;     (let ((dos-path (replace-regexp-in-string "/" "\\\\" filepath)))
;;       (apply (function start-process)
;;              "explorer" nil "explorer.exe" (list (concat "/select," dos-path)))))))
;;
;;
;;
;;

;;(defun my-org-screenshot ()
;;  "Take a screenshot into a time stamped unique-named file in the
;;same directory as the org-buffer and insert a link to this file."
;;  (interactive)
;;  (setq filename
;;        (concat
;;         (make-temp-name
;;          (concat (buffer-file-name)
;;                  "_"
;;                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
;;  (shell-command "snippingtool /clip")
;;  (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('" filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
;;  (insert (concat "[[file:" filename "]]"))
;;  (org-display-inline-images))

(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (shell-command (concat "gnome-screenshot --area -f "  filename))
;;  (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('" filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
  (insert (concat "[[file:" filename "]]"))
  (org-display-inline-images))


(global-set-key "\C-cs" 'my-org-screenshot)



;;
;;
;;


;;
;;
;;

;;(eval-when-compile (require 'cl))

;;(defgroup org-bullets nil
;;  "Display bullets as UTF-8 characters"
;;  :group 'org-appearance)
;;
;;;; A nice collection of unicode bullets:
;;;; http://nadeausoftware.com/articles/2007/11/latency_friendly_customized_bullets_using_unicode_characters
;;(defcustom org-bullets-bullet-list
;;  '(;;; Large
;;    "◉"
;;    "○"
;;    "✸"
;;    "✿"
;;    ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
;;    ;;; Small
;;    ;; ► • ★ ▸
;;    )
;;  "This variable contains the list of bullets.
;;It can contain any number of symbols, which will be repeated."
;;  :group 'org-bullets
;;  :type '(repeat (string :tag "Bullet character")))
;;
;;(defcustom org-bullets-face-name nil
;;  "This variable allows the org-mode bullets face to be
;; overridden. If set to a name of a face, that face will be
;; used. Otherwise the face of the heading level will be used."
;;  :group 'org-bullets
;;  :type 'symbol)
;;
;;(defvar org-bullets-bullet-map
;;  '(keymap
;;    (mouse-1 . org-cycle)
;;    (mouse-2
;;     . (lambda (e)
;;         (interactive "e")
;;         (mouse-set-point e)
;;         (org-cycle))))
;;  "Mouse events for bullets.
;;Should this be undesirable, one can remove them with
;;\(setcdr org-bullets-bullet-map nil\)")
;;
;;(defun org-bullets-level-char (level)
;;  (string-to-char
;;   (nth (mod (1- level)
;;             (length org-bullets-bullet-list))
;;        org-bullets-bullet-list)))
;;
;;;;;###autoload
;;(define-minor-mode org-bullets-mode
;;    "UTF8 Bullets for org-mode"
;;  nil nil nil
;;  (let* (( keyword
;;           `(("^\\*+ "
;;              (0 (let* (( level (- (match-end 0) (match-beginning 0) 1))
;;                        ( is-inline-task
;;                          (and (boundp 'org-inlinetask-min-level)
;;                               (>= level org-inlinetask-min-level))))
;;                   (compose-region (- (match-end 0) 2)
;;                                   (- (match-end 0) 1)
;;                                   (org-bullets-level-char level))
;;                   (when is-inline-task
;;                     (compose-region (- (match-end 0) 3)
;;                                     (- (match-end 0) 2)
;;                                     (org-bullets-level-char level)))
;;                   (when (facep org-bullets-face-name)
;;                     (put-text-property (- (match-end 0)
;;                                           (if is-inline-task 3 2))
;;                                        (- (match-end 0) 1)
;;                                        'face
;;                                        org-bullets-face-name))
;;                   (put-text-property (match-beginning 0)
;;                                      (- (match-end 0) 2)
;;                                      'face (list :foreground
;;                                                  (face-attribute
;;                                                   'default :background)))
;;                   (put-text-property (match-beginning 0)
;;                                      (match-end 0)
;;                                      'keymap
;;                                      org-bullets-bullet-map)
;;                   nil))))))
;;    (if org-bullets-mode
;;        (progn
;;          (font-lock-add-keywords nil keyword)
;;          (font-lock-fontify-buffer))
;;      (save-excursion
;;        (goto-char (point-min))
;;        (font-lock-remove-keywords nil keyword)
;;        (while (re-search-forward "^\\*+ " nil t)
;;          (decompose-region (match-beginning 0) (match-end 0)))
;;        (font-lock-fontify-buffer))
;;      )))
;;
;;(provide 'org-bullets)

