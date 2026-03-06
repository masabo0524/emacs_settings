(require 'package)

;; ===================================
;; for Org mode settings
;; ===================================
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'org-setup)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu". "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("/home/takedamasaaki/org/inbox.org"))
 '(package-selected-packages
   '(multiple-cursors gptel lsp-mode magit-stats magit orderless vertico projectile mkdown markdown-mode gh-md markdown-preview-mode tree-mode yaml-mode pdf-tools cmake-mode ztree company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ========================================
;; Basic UI settings
;; ========================================
;; 行番号を常に表示
(global-display-line-numbers-mode t)

;; 列番号も表示
(column-number-mode t)

;; ========================================
;; revert-buffer 設定
;; ========================================
;; 外部でファイルが変更されたら自動で更新
(global-auto-revert-mode t)

;; revert-buffer を yes/no なしで実行
(setq revert-without-query '(".*"))

;; キーバインド設定
(global-set-key (kbd "C-c r") 'revert-buffer)

;; ========================================
;; Ctrl + Tab でバッファ切り替え
;; ========================================
(global-set-key (kbd "<C-tab>") 'next-buffer)

;; ========================================
;; windowの切り替え Shift + arrow
;; ========================================
(windmove-default-keybindings)

;; ========================================
;; 見た目改善 menu, tool bar非表示
;; ========================================
(menu-bar-mode -1)
(tool-bar-mode -1)

;; ========================================
;; 縦３分割
;; ======================================== 
(defun my-split-window-horizontally-three-pane (arg)
  (interactive "p")
  (split-window-horizontally (/ (window-width) 3))
  (other-window 1)
  (split-window-horizontally)
  (other-window -1))
(define-key ctl-x-map "|" 'my-split-window-horizontally-three-pane)

;; ========================================
;; 自動的にカッコをつける
;; ========================================
(electric-pair-mode t)

;; ========================================
;; 補完モード
;; ========================================
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

(require 'company)
(global-company-mode 1)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

;; ========================================
;; プロジェクトごと開く
;; ========================================
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
