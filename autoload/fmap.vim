let s:V = vital#fmap#new()

let s:List = s:V.import('Data.List')
let s:Optional = s:V.import('Data.Optional')

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

" Gets a user's input as a key "stroke"
function! fmap#input_a_stroke() abort
  let key_stack = ''
  while !s:is_a_mapping(key_stack)
    let char = nr2char(getchar())
    if s:List.has(g:fmap_escape_keys, char) " if an escape key is input
      return s:Optional.none()
    endif
    let key_stack .= char
  endwhile
  return s:Optional.new(key_stack)
endfunction

" Makes a key for `nmap <silent>`.
" `direction` expects to be 'f', 'F', 't', or 'T'.
function! fmap#shot(maybe_stroke, direction) abort
  if s:Optional.empty(a:maybe_stroke)
    return ''
  endif
  let stroke = s:Optional.get(a:maybe_stroke)

  let mapping = s:List.find(g:fmap_mappings, v:null, { mapping ->
    \ s:List.has(mapping['strokes'], stroke)
  \ })
  if mapping is v:null
    throw printf(
      \ 'The mapping of `%s` is invalid, ' .
      \ 'please confirm your g:fmap_mappings.',
      \ stroke)
  endif

  let direction
    \ = a:direction ==# 'f' ? 'f'
    \ : a:direction ==# 'F' ? 'F'
    \ : a:direction ==# 't' ? 't'
    \ : a:direction ==# 'T' ? 'T'
    \ : execute(printf('throw "`%s` is unknown direction"', a:direction))
  return direction . mapping.target
endfunction
