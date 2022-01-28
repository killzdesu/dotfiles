" Gui mode
"
if has('gui_running') || exists('GuiFont') || exists('g:gonvim_running')
  " set guifont=consolas:h11
  " set guifont=Consolas\ NF:h11
  set guifont=FiraCode\ NF:h10.5
  set mouse=a
  set novisualbell
  " set lines=28
  " set columns=90
  set ttyfast
  set showmode
  set showcmd
  set laststatus=2
else
  set t_Co=256
  if has('termguicolor')
    set termguicolors
  endif

  " sets foreground color (ANSI, true-color mode)
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  " sets background color (ANSI, true-color mode)
  let &t_8b = "\e[48;2;%lu;%lu;%lum"

endif

