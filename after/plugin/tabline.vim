if exists("g:loaded_my_tabline")
    finish
endif

let g:loaded_my_tabline = 1

function! MyTabLine()
    let result = ''
    for i in range(tabpagenr('$'))
        let tab     = i + 1
        let winnr   = tabpagewinnr(tab)
        let winlen  = tabpagewinnr(tab, '$')
        let buflist = tabpagebuflist(tab)
        let bufnr   = buflist[winnr - 1]
        let bufname = fnamemodify(bufname(bufnr), ':p:~:.')

        " tab color
        let result .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')

        " tab label
        " let result .= ' ' . tab . ':'
        let result .= ' '

        " filename
        if (bufname != '')
            let fnames = split(bufname, '/')
            let flen = len(fnames)
            let fname = fnames[flen - 1]
            let result .= fname
        else
            let result .= '[No Name]'
        endif

        " buflist modified
        for winindex in range(winlen)
            if getbufvar(buflist[winindex], "&modified")
                let result .= (buflist[winindex] == bufnr ? '[+]' : '[~]')
                break
            endif
        endfor

        let result .= ' '
    endfor
    let result .= '%T%#TabLineFill#%='
    return result
endfunction

set tabline=%!MyTabLine()
