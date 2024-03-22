;; -*- no-byte-compile: t; -*-

;; -- major modes -------------------------------------------------------------n
(package! dts-mode)

;; -- misc --------------------------------------------------------------------
;; (package! doom-snippets :ignore t)

;; -- org ---------------------------------------------------------------------
(package! emacsql-sqlite :built-in 'prefer)
(package! org-present)

(unpin! org-roam)
(package! org-roam-ui)

;; -- themes ------------------------------------------------------------------
(package! timu-spacegrey-theme)
