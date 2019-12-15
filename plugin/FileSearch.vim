scriptencoding utf-8
if exists('g:load_FileSearch')
    finish
endif
let g:load_FileSearch = 1

let s:save_cpo = &cpo
set cpo&vim

"nnoremap <silent> <Plug>(FileSearch) :<C-u>call FileSearch#FileSearch()<CR>
nnoremap <silent> <S-Tab> :<C-u>call FileSearch#FileSearch("")<CR>
nnoremap <silent> gf :<C-u>call FileSearch#gf()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
