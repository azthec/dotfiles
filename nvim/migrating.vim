
" Finding files - Search down in to subfolders
set path+=**

""" After plugin configurations

" Make sure theres always an empty line at the bottom of files
" https://old.reddit.com/r/vim/comments/4vku72/how_do_i_set_up_vim_so_a_new_line_is_added_to_the/d5z8v1j/?context=3
" autocmd BufWritePre * if (getline('$') !~ "^\s*$") | call append(line('$'), "") | endif

" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" """ NERDTree

" " Don't open two nerdtrees when opening a folder
" "let g:NERDTreeHijackNetrw = 1
" "au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]

" " NERDTree Track open buffer
" " https://stackoverflow.com/a/42154947

" " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Ignore nerdtree for development folders
" " let g:NERDTreeIgnore = ['^.metals$']
" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" " Open mirrored nerdtree in every new tab
" " autocmd BufWinEnter * NERDTreeMirror
" " With fix for autocmd https://vi.stackexchange.com/a/38537
" autocmd BufWinEnter * if getcmdwintype() == '' && &buftype != 'quickfix' | silent! NERDTreeMirror | endif

" " Don't name tabs NerdTree, stolen from tabline
" function! Tabline()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     let tab = i + 1
"     let buflist = tabpagebuflist(tab)
"     let bufignore = ['nerdtree', 'tagbar', 'codi', 'help']
"     for b in buflist
"       let buftype = getbufvar(b, "&filetype")
"       if index(bufignore, buftype)==-1 "index returns -1 if the item is not contained in the list
"         let bufnr = b
"         break
"       elseif b==buflist[-1]
"         let bufnr = b
"       endif
"     endfor
"     let bufname = bufname(bufnr)
"     let bufmodified = getbufvar(bufnr, "&mod")
"     let s .= '%' . tab . 'T'
"     let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
"     let s .= ' ' . tab .':'
"     let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')
"     if bufmodified
"       let s .= '[+] '
"     endif
"   endfor
"   let s .= '%#TabLineFill#'
"   return s
" endfunction
" set tabline=%!Tabline()

" " Autoclose nerdtree if last on tab
" autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif

" " Workaround for https://vi.stackexchange.com/a/39693
" let g:NERDTreeMinimalMenu=1

" " Setup max textwidth for markdown files
" au BufRead,BufNewFile *.md setlocal textwidth=100

" " Set working directory to file on entering vim
" autocmd VimEnter * lcd %:p:h

" " Define a function to execute NERDTreeCWD
" function! ExecuteNERDTreeCWD()
"     NERDTreeCWD
" endfunction

" " Listen for the VimwikiIndex command and execute NERDTreeCWD afterwards
" augroup AutoExecuteNERDTree
"     autocmd!
"     autocmd User VimwikiIndex :call ExecuteNERDTreeCWD()
" augroup END

" Prepopulate vimwiki diary log entries with template
au BufNewFile ~/Documents/Armadiki/wiki/diary/*.md
  \ call append(0,[
  \ "# " . split(expand('%:r'),'/')[-1], "",
  \ "## Dailies", "",
  \ "- [ ] Decluttering",
  \ "- [ ] Music",
  \ "- [ ] Dutch",
  \ "- [ ] Maestry", "",
  \ "## Goals",  "",
  \ "## Tasks",  "",
  \ "## Blocked",  "",
  \ "## Done",  "",
  \ "## Backlog",  "",
  \ "## Todo",  "",
  \ "## Tickets",  "",
  \ "## Notes", "(eg reflections, wins, progress)"])

