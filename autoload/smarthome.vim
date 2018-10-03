" Adapted from:
" https://vim.fandom.com/wiki/SmartHome_and_SmartEnd_over_wrapped_lines
"
" Home moves to the beginning of lines
function smarthome#SmartHome(mode)
    let curcol = col('.')
    " Gravitate towards beginning for wrapped lines
    if curcol > indent('.') + 2
        call cursor(0, curcol - 1)
    endif
    if curcol == 1 || curcol > indent('.') + 1
        if &wrap
            normal! g^
        else
            normal! ^
        endif
    else
        if &wrap
            normal! g0
        else
            normal! 0
        endif
    endif
    if a:mode ==? 'v'
        normal! msgv`s
    endif
    return ''
endfunction

" Adapted from:
" https://vim.fandom.com/wiki/SmartHome_and_SmartEnd_over_wrapped_lines
"
" End moves to the end of lines
function smarthome#SmartEnd(mode)
    let curcol = col('.')
    let lastcol = a:mode ==? 'i' ? col('$') : col('$') - 1

    " Gravitate towards ending for wrapped lines
    if curcol < lastcol - 1
        call cursor(0, curcol + 1)
    endif
    if curcol < lastcol
        if &wrap
            normal! g$
        else
            normal! $
        endif
    else
        normal! g_
    endif

    " Correct edit mode cursor position, put after current character
    if a:mode ==? 'i'
        call cursor(0, col('.') + 1)
    endif
    if a:mode ==? 'v'
        normal! msgv`s
    endif
    return ''
endfunction
