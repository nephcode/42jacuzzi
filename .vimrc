" ================================
"   Config Vim spéciale 42
"   Respect Norminette indentation
" ================================

" ---- Indentation ----
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set autoindent
set smartindent

" ---- Visuels ----
syntax on
mouse=a
set list
set listchars=tab:→\ ,trail:·
set colorcolumn=80

" ---- Historique / Undo ----
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
