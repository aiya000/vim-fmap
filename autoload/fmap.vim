let s:List = vital#fmap#import('Data.List')

function! fmap#fnoremap(...) abort
    let stroke = a:1
    let target = a:2
    let old_mapping = s:List.find(g:fmap_mappings, v:null, { mapping ->
        \ mapping['target'] ==# target
    \ })

    " if `target` is not existent at g:fmap_mappings
    if old_mapping is v:null
        let new_mapping = { 'strokes': [stroke], 'target': target }
        call add(g:fmap_mappings, new_mapping)
        return
    endif

    call add(old_mapping.strokes, stroke)
endfunction

function! s:is_a_mapping(stroke) abort
    for mapping in g:fmap_mappings
        if s:List.has(mapping.strokes, a:stroke)
            return v:true
        endif
    endfor
    return v:false
endfunction

" `direction` expects to be 'f', 'F', 't', or 'T'
function! fmap#shot(direction) abort
    let key_stack = ''
    while !s:is_a_mapping(key_stack)
        let char = nr2char(getchar())
        if s:List.has(g:fmap_escape_keys, char) " if an escape key is input
            return
        endif
        let key_stack .= char
    endwhile

    let mapping = s:List.find(g:fmap_mappings, v:null, { mapping ->
        \ s:List.has(mapping['strokes'], key_stack)
    \ })
    if mapping is v:null
        throw 'The mapping of `' . key_stack '` is invalid.' .
            \ 'Please confirm your g:fmap_mappings.'
    endif

    let direction
        \ = a:direction ==# 'f' ? 'f'
        \ : a:direction ==# 'F' ? 'F'
        \ : a:direction ==# 't' ? 't'
        \ : a:direction ==# 'T' ? 'T'
        \ : execute(printf('throw "`%s` is unknown direction"', a:direction))
    execute 'normal!' (direction . mapping.target)
endfunction
