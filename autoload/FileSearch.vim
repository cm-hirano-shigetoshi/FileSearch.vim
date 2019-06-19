scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:fzfer = "fzfer run"
let s:yaml = expand('<sfile>:p:h') . "/FileSearch.yml"
let s:temp = tempname()

function! FileSearch#FileSearch()
    let out = system("tput cnorm > /dev/tty; " . s:fzfer . " " . s:yaml . " 2>/dev/tty")
    execute("args " . out)
    redraw!
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

