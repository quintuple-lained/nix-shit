;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(server-start)

(setq user-full-name "Liv Freja"
      user-mail-address "freja.wegert@proton.me")


;; -- looksies ----------------------------------------------------------------
(setq doom-font (font-spec :family "Source Code Pro" :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Source Sans 3" :size 14 :weight 'regular)
      doom-serif-font (font-spec :family "Vollkorn" :size 14 :weight 'regular)
      ;doom-theme 'doom-henna
      display-line-numbers-type nil
      doom-theme 'doom-rose-pine-moon)

;; (use-package! timu-spacegrey-theme
;;   :config
;;   (setq doom-theme 'timu-spacegrey)
;;   (customize-set-variable 'timu-spacegrey-scale-org-document-title t)
;;   (customize-set-variable 'timu-spacegrey-scale-org-document-info t)
;;   (customize-set-variable 'timu-spacegrey-scale-org-level-1 t)
;;   (customize-set-variable 'timu-spacegrey-scale-org-level-2 t)
;;   (customize-set-variable 'timu-spacegrey-scale-org-level-3 t)
;;   (customize-set-variable 'timu-spacegrey-mode-line-border t))


;; trying to make emacs a bit more responsive
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(setq inhibit-compacting-font-caches t)

;; -- org ---------------------------------------------------------------------
(add-to-list '+word-wrap-text-modes 'org-mode)
;(add-hook! 'org-mode-hook #'+word-wrap-mode)

;;(setq org-superstar-headline-bullets-list '("❉" "❈" "❊"))
(setq org-superstar-headline-bullets-list '("·"))
(setq org-hide-emphasis-markers t)

;; you don't need to include all of them you can pick and mix
(plist-put! +ligatures-extra-symbols
  ;; org
  :name          "»"
  :src_block     "»"
  :src_block_end "«"
  :quote         "“"
  :quote_end     "”"
  ;; Functional
  :lambda        "λ"
  :def           "ƒ"
  :composition   "∘"
  :map           "↦"
  ;; Types
  :null          "∅"
  :true          "𝕋"
  :false         "𝔽"
  ;; Flow
  :not           "￢"
  :in            "∈"
  :not-in        "∉"
  :and           "∧"
  :or            "∨")

(setq org-roam-directory "/home/freja/Documents/org-roam"
      org-roam-db-location (concat org-roam-directory "/.org-roam.db")
      org-directory "/home/freja/Documents/org")

(org-roam-db-autosync-mode)

(setq org-roam-capture-templates
      '(("m" "main" plain "%?"
         :if-new (file+head "main/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnrarrowed t)
        ("s" "study" plain "%?"
         :if-new (file+head "study/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("sl" "lecture" plain "%?"
         :if-new (file+head "study/lectures/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("a" "article" plain "%?"
         :if-new (file+head "articles/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n#+filetags: :article:draft:\n")
         :immediate-finish t
         :unnarrowed t)))
         
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-open-on-start nil
        org-roam-ui-update-on-save t))

(after! org-present
  (add-hook! org-present-mode-hook
            (lambda ()
              (org-present-big)
              (org-display-inline-images)
              (org-present-hide-cursor)
              (org-present-read-only)))
  (add-hook! org-present-quit-hook
            (lambda ()
              (org-present-small)
              (org-remove-inline-images)
              (org-present-show-cursor)
              (org-present-read-write))))

;; -- evil --------------------------------------------------------------------
(map! :n "." #'nil)
(map! :n ".." #'evil-repeat)
(map! :n ";" #'evil-ex)
(map! :leader :n "w" #'evil-write)

;; -- language stuff ----------------------------------------------------------
(setq fcitx-remote-command "fcitx5-remote")

(setq parinfer-rust-preferred-mode "indent") ;; fuck smart lol

(setq rustic-format-on-save t
      rustic-format-trigger 'on-save
      rustic-format-display-method 'ignore)

(add-to-list 'auto-mode-alist '("\\.cs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.keymap\\'" . dts-mode))

(setq +tree-sitter-hl-enabled-modes t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
