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

command! ToggleLineLengthHighlight call ToggleLineLengthHighlight()
command! GoMiddleOfLine call GoMiddleOfLine()

