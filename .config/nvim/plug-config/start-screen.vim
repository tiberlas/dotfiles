let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          "\ { 'type': 'files',     'header': ['   Files']            },
          "\ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Pinned']      },
          \ { 'type': 'dir',       'header': ['   Current Project '. getcwd()] },
          \ ]

let g:startify_bookmarks = [
            \ { 'n': '~/.config/nvim/readme.md' },
            \ { 'k': '~/.config/kitty/kitty.conf' },
            \ { 'a': '~/.config/awesome/rc.lua' },
            \ { 'i': '~/Documents/INSTRUCTIONS' },
            \ { 't': '~/Documents/Tutorials' },
            \ { 'z': '~/.zshrc' },
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ '                  _           ',
        \ '       _ ____   _(#)_ __ ___  ',
        \ '      |#`# \ \ / /#|#`##`###\ ',
        \ '      |#| |#\ V /|#|#| |#| |#|',
        \ '      |#| |#|\_/ |#|#| |#| |#|',
        \ '          by ttiberius        ',
        \]

