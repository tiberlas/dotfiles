-------------------------------------------------------------------------------
-- KEYMAPS
-------------------------------------------------------------------------------

--spellunker
-- in spell dir you put correct words
-- Zl show suggestions
-- ZT toogle spell check (word highlight)
-- Zt toogle spell check (word highlight) only in current buffer
-- ZN go to next misspelled word
-- ZP go to previous misspelled word

-------------------------------------------------------------------------------
-- CONFIG IN VIM SCRIPT
-------------------------------------------------------------------------------

-- Enable spelunker.vim. (default: 1)
-- 1: enable
-- 0: disable
vim.g.enable_spelunker_vim = 1

-- Enable spelunker.vim on readonly files or buffer. (default: 0)
-- 1: enable
-- 0: disable
vim.g.enable_spelunker_vim_on_readonly = 0

-- Check spelling for words longer than set characters. (default: 4)
vim.g.spelunker_target_min_char_len = 4

-- Max amount of word suggestions. (default: 15)
vim.g.spelunker_max_suggest_words = 15

-- Max amount of highlighted words in buffer. (default: 100)
vim.g.spelunker_max_hi_words_each_buf = 100

-- Spellcheck type: (default: 1)
-- 1: File is checked for spelling mistakes when opening and saving. This
-- may take a bit of time on large files.
-- 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
-- depends on the setting of CursorHold `set updatetime=1000`.
vim.g.spelunker_check_type = 1

-- Highlight type: (default: 1)
-- 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
-- 2: Highlight only SpellBad.
-- FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
vim.g.spelunker_highlight_type = 1

-- Option to disable word checking.
-- Disable URI checking. (default: 0)
vim.g.spelunker_disable_uri_checking = 1

-- Disable email-like words checking. (default: 0)
vim.g.spelunker_disable_email_checking = 1

-- Disable account name checking, e.g. @foobar, foobar@. (default: 0)
-- NOTE: Spell checking is also disabled for JAVA annotations.
vim.g.spelunker_disable_account_name_checking = 1

-- Disable acronym checking. (default: 0)
vim.g.spelunker_disable_acronym_checking = 1

-- Disable checking words in backtick/backquote. (default: 0)
vim.g.spelunker_disable_backquoted_checking = 1

-- Disable default autogroup. (default: 0)
vim.g.spelunker_disable_auto_group = 1

-- Create own custom autogroup to enable spelunker.vim for specific filetypes.
vim.cmd([[
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()
  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END
]])

-- Override highlight group name of incorrectly spelled words. (default:
-- 'SpelunkerSpellBad')
vim.g.spelunker_spell_bad_group = 'SpelunkerSpellBad'

-- Override highlight group name of complex or compound words. (default:
-- 'SpelunkerComplexOrCompoundWord')
vim.g.spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

-- Override highlight setting.
vim.cmd([[highlight SpelunkerSpellBad cterm=bold ctermfg=247 gui=underline guifg=#9e9e9e]])
vim.cmd([[highlight SpelunkerComplexOrCompoundWord cterm=NONE ctermfg=247 gui=NONE guifg=NONE]])

