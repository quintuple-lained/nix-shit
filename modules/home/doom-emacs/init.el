;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find information about all of Doom's
;;      modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c g k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c g d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       (chinese) ;+rime)

       :completion
       company                          ; the ultimate code completion backend
       ;ivy                              ; a search engine for love and life
       vertico

       :ui
       doom                   ; what makes DOOM look the way it does
       doom-dashboard         ; a nifty splash screen for Emacs
       doom-quit              ; DOOM quit-message prompts when you quit Emacs
       hl-todo                ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       (modeline +light)      ; snazzy, Atom-inspired modeline, plus AP
       ophints                ; highlight the region an operation acts on
       (popup +all)           ; tame sudden yet inevitable temporary windows
       unicode                ; extended unicode support for various languages
       (vc-gutter +pretty)    ; vcs diff in the fringe
       vi-tilde-fringe        ; fringe tildes to mark beyond EOB
       workspaces             ; tab emulation, persistence & separate workspaces
       (ligatures +extra)

       :editor
       (evil +everywhere)               ; come to the dark side, we have cookies
       fold                             ; (nigh) universal code folding
       (format +onsave)                 ; automated prettiness
       snippets          ; my elves. They type so I don't have to
       parinfer
       word-wrap


       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ;ibuffer           ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes

       :term
       eshell         ; simple shell REPL for Emacs

       :checkers
       ;;syntax              ; tasing you for every semicolon you forget
       ;;spell             ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       biblio
       direnv
       editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)       ; run code, run (also, repls)
       lookup                ; navigate your code and its documentation
       lsp
       magit                    ; a git porcelain for Emacs
       make                     ; run make tasks from Emacs
       rgb                              ; creating color strings
       taskrunner
       tree-sitter

       :lang
       beancount
       (cc -lsp)             ; C/C++/Obj-C madness
       data                     ; config/data formats
       ;;elixir            ; erlang done right
       emacs-lisp                       ; drown in parentheses
       json  ; At least it ain't XML
       markdown            ; writing docs for people to ignore
       (nix +tree-sitter)               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org +roam2 +pretty)           ; organize your plain life in plain text
       (rust +tree-sitter)           ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       sh     ; she sells {ba,z,fi}sh shells on the C xor
       yaml                             ; JSON, but readable


       :app
       ;;calendar
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       (default +bindings +smartparens))
