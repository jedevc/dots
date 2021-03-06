function! myspacevim#before() abort
    set timeoutlen=400
    set ignorecase
    set smartcase

    let g:tex_conceal=""

    " indent marker (spaces are handled in layers)
    set list lcs=tab:\┊\ " (the space is important)

    call SpaceVim#plugins#tasks#reg_provider(funcref('s:make_tasks'))
endfunction

function! myspacevim#after() abort
endfunction

function! s:make_tasks() abort
    if filereadable('Makefile')
        let subcmd = filter(readfile('Makefile', ''), "v:val=~#'^.PHONY'")
        if !empty(subcmd)
            let commands = split(subcmd[0])[1:]
            let conf = {}
            for cmd in commands
                call extend(conf, {
                            \ cmd : {
                            \ 'command': 'make',
                            \ 'args' : [cmd],
                            \ 'isDetected' : 1,
                            \ 'detectedName' : 'make:'
                            \ }
                            \ })
            endfor
            return conf
        else
            return {}
        endif
    else
        return {}
    endif
endfunction

