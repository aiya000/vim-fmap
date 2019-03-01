let s:V = vital#fmap#new()

let s:List = s:V.import('Data.List')

function! fmap#fnoremap(stroke, target) abort
  let g:fmap_mappings[a:stroke] = a:target
endfunction

function! s:is_a_mapping(stroke) abort
  return s:List.has(keys(g:fmap_mappings), a:stroke)
endfunction

" Gets a user's input as a key "stroke"
function! fmap#input_a_stroke() abort
  let key_stack = ''
  while !s:is_a_mapping(key_stack)
    let char = nr2char(getchar())
    if s:List.has(g:fmap_escape_keys, char) " if an escape key is input
      return v:null
    endif
    let key_stack .= char
  endwhile
  return key_stack
endfunction

" Makes a key stroke, like 'f、', 'F。', and 'T！'.
"
"   direction: 'f', 'F', 't', or 'T'.
function! fmap#shot(stroke, direction) abort
  if a:stroke is v:null
    return ''
  endif

  let mapping = get(g:fmap_mappings, a:stroke, v:null)
  if mapping is v:null
    throw printf('No `%s` found as a stroke. Please confirm your g:fmap_mappings.', a:stroke)
  endif

  let direction
    \ = a:direction ==# 'f' ? 'f'
    \ : a:direction ==# 'F' ? 'F'
    \ : a:direction ==# 't' ? 't'
    \ : a:direction ==# 'T' ? 'T'
    \ : execute(printf('throw "`%s` is unknown direction"', a:direction))
  return direction . mapping
endfunction
