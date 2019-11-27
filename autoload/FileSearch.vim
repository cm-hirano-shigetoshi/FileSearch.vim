scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:fzfyml = "fzfyml run"
let s:yaml = expand('<sfile>:p:h') . "/FileSearch.yml"
let s:temp = tempname()

function! FileSearch#FileSearch()
    let out = system("tput cnorm > /dev/tty; " . s:fzfyml . " " . s:yaml . " 2>/dev/tty")
    if strlen(out) > 0
        let out = out[:-2]
        execute("args " . out)
    endif
    redraw!
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

