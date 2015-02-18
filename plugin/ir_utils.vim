function! ToggleLineLengthHighlight()
    let l:toggle = 0
    let l:status = 'off'
    if exists("b:ir_line_length_highlight")
        let l:toggle = b:ir_line_length_highlight
    endif
    if l:toggle == 1
        exec 'match'
        let l:toggle = 0
    else
        exec 'match WarningMsg /\%'.b:textwidth.'v.*/'
        let l:status = 'on'
        let l:toggle = 1
    endif
    let b:ir_line_length_highlight = l:toggle

endfunction

function! GoMiddleOfLine()
    let line = getline('.')
    let whitespace = matchstr(line, '\v^[\ \t]+')
    let position = (len(line) - len(whitespace))/2 + len(whitespace)

    call cursor(0, position)

endfunction

function! CleanConfigUpdate()
    silent! g/^\s*$/d
    silent! %s/\*\*//g
    silent! %s/-\+//g
    silent! %s/\${CODE_ROOT}\S[a-zA-Z/_]*\/\([a-zA-Z0-9._]\+\)\.egg/\1/g
    silent! %s/\s\+$//g
    silent! g/^\s*[A-Z_]\+\s/normal J
    silent! g/^\s*[A-Z_]\+\s/normal O
    silent! %s/\s\{5\}//g
    silent! %y+
endfunction

command! ToggleLineLengthHighlight call ToggleLineLengthHighlight()
command! GoMiddleOfLine call GoMiddleOfLine()
command! CleanConfigUpdate call CleanConfigUpdate()
