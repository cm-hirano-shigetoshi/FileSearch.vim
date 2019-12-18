scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:fzfyml = "fzfyml run"
let s:yaml = expand('<sfile>:p:h') . "/FileSearch.yml"
let s:temp = tempname()

function! FileSearch#gf()
    if expand('<cfile>') == ''
        call FileSearch#FileSearch("")
    else
        if glob(expand('<cfile>')) != ''
            call execute('edit! ' . glob(expand('<cfile>')))
        else
            let file_name = expand('<cfile>')
            call FileSearch#FileSearch(file_name)
        endif
    endif
endfunction

function! FileSearch#FileSearch(file)
    let out = system("tput cnorm > /dev/tty; " . s:fzfyml . " " . s:yaml . " '" . a:file . "' 2>/dev/tty")
    if strlen(out) > 0
        let out = out[:-2]
        execute("args " . out)
    endif
    redraw!
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

