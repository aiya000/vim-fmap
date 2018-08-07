scriptencoding utf-8

if exists('g:loaded_fmap')
    finish
endif
let g:loaded_fmap = v:true

let g:fmap_default_mappings = [
    \ { 'strokes': ['pb'], 'target': '(' },
    \ { 'strokes': ['pe'], 'target': ')' },
    \ { 'strokes': ['Pb'], 'target': '{' },
    \ { 'strokes': ['Pe'], 'target': '}' },
    \ { 'strokes': ['kb'], 'target': '[' },
    \ { 'strokes': ['ke'], 'target': ']' },
    \ { 'strokes': ['Kb'], 'target': '<' },
    \ { 'strokes': ['Ke'], 'target': '>' },
\ ]

lockvar! g:fmap_default_mappings

let g:fmap_mappings = get(g:, 'fmap_mappings', copy(g:fmap_default_mappings))

let g:fmap_use_default_keymappings = get(g:, 'fmap_use_default_keymappings', v:true)

nmap <silent> <Plug>(fmap-forward-f) :<C-u>call fmap#shot('f')<CR>
nmap <silent> <Plug>(fmap-backward-f) :<C-u>call fmap#shot('F')<CR>
nmap <silent> <Plug>(fmap-forward-t) :<C-u>call fmap#shot('t')<CR>
nmap <silent> <Plug>(fmap-backward-t) :<C-u>call fmap#shot('T')<CR>

if g:fmap_use_default_keymappings
    nmap <localleader>f <Plug>(fmap-forward-f)
    nmap <localleader>F <Plug>(fmap-backward-f)
    nmap <localleader>t <Plug>(fmap-forward-t)
    nmap <localleader>T <Plug>(fmap-backward-t)
endif

command! -bar -nargs=+ FNoreMap call fmap#fnoremap(<f-args>)
