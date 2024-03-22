let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1

" Autostart nerdtree
" autocmd VimEnter * NERDTree | wincmd p

" Quit vim when only nerdtree open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
" let g:plug_window = 'noautocmd vertical topleft new'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

