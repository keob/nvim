if exists("g:loaded_my_terminal")
    finish
endif

let g:loaded_my_terminal = 1

function! s:small_terminal() abort
    new
    wincmd J
    call nvim_win_set_height(0, 12)
    set winfixheight
    setlocal nonumber
    setlocal norelativenumber
    setlocal nospell
    term
endfunction

nnoremap <silent> <leader>st :call <SID>small_terminal()<CR>
