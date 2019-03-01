scriptencoding utf-8

if exists('g:loaded_fmap')
  finish
endif
let g:loaded_fmap = v:true

let g:fmap_default_mappings = {
  \ 'pb': '(',
  \ 'pe': ')',
  \ 'Pb': '{',
  \ 'Pe': '}',
  \ 'kb': '[',
  \ 'ke': ']',
  \ 'Kb': '<',
  \ 'Ke': '>',
  \ '.': '。',
  \ ',': '、',
  \ '!': '！',
  \ '?': '？',
  \ "'a": 'あ',
  \ "'i": 'い',
  \ "'u": 'う',
  \ "'e": 'え',
  \ "'o": 'お',
  \ "'ka": 'か',
  \ "'ki": 'き',
  \ "'ku": 'く',
  \ "'ke": 'け',
  \ "'ko": 'こ',
  \ "'sa": 'さ',
  \ "'si": 'し',
  \ "'shi": 'し',
  \ "'su": 'す',
  \ "'se": 'せ',
  \ "'so": 'そ',
  \ "'ta": 'た',
  \ "'ti": 'ち',
  \ "'tu": 'つ',
  \ "'te": 'て',
  \ "'to": 'と',
  \ "'na": 'な',
  \ "'ni": 'に',
  \ "'nu": 'ぬ',
  \ "'ne": 'ね',
  \ "'no": 'の',
  \ "'ha": 'は',
  \ "'hi": 'ひ',
  \ "'hu": 'ふ',
  \ "'he": 'へ',
  \ "'ho": 'ほ',
  \ "'ma": 'ま',
  \ "'mi": 'み',
  \ "'mu": 'む',
  \ "'me": 'め',
  \ "'mo": 'も',
  \ "'ya": 'や',
  \ "'yu": 'ゆ',
  \ "'yo": 'よ',
  \ "'ra": 'ら',
  \ "'ri": 'り',
  \ "'ru": 'る',
  \ "'re": 'れ',
  \ "'ro": 'ろ',
  \ "'wa": 'わ',
  \ "'wo": 'を',
  \ "'nn": 'ん',
\ }

lockvar! g:fmap_default_mappings

let g:fmap_mappings = get(g:, 'fmap_mappings', copy(g:fmap_default_mappings))
let g:fmap_use_default_keymappings = get(g:, 'fmap_use_default_keymappings', v:true)
let g:fmap_escape_keys = get(g:, 'fmap_escape_keys', ['', ''])

nmap <expr> <Plug>(fmap-forward-f) fmap#shot(fmap#input_a_stroke(), 'f')
nmap <expr> <Plug>(fmap-backward-f) fmap#shot(fmap#input_a_stroke(), 'F')
nmap <expr> <Plug>(fmap-forward-t) fmap#shot(fmap#input_a_stroke(), 't')
nmap <expr> <Plug>(fmap-backward-t) fmap#shot(fmap#input_a_stroke(), 'T')

vmap <expr> <Plug>(fmap-forward-f) fmap#shot(fmap#input_a_stroke(), 'f')
vmap <expr> <Plug>(fmap-backward-f) fmap#shot(fmap#input_a_stroke(), 'F')
vmap <expr> <Plug>(fmap-forward-t) fmap#shot(fmap#input_a_stroke(), 't')
vmap <expr> <Plug>(fmap-backward-t) fmap#shot(fmap#input_a_stroke(), 'T')

omap <expr> <Plug>(fmap-forward-f) fmap#shot(fmap#input_a_stroke(), 'f')
omap <expr> <Plug>(fmap-backward-f) fmap#shot(fmap#input_a_stroke(), 'F')
omap <expr> <Plug>(fmap-forward-t) fmap#shot(fmap#input_a_stroke(), 't')
omap <expr> <Plug>(fmap-backward-t) fmap#shot(fmap#input_a_stroke(), 'T')

if g:fmap_use_default_keymappings
    nmap <localleader>f <Plug>(fmap-forward-f)
    nmap <localleader>F <Plug>(fmap-backward-f)
    nmap <localleader>t <Plug>(fmap-forward-t)
    nmap <localleader>T <Plug>(fmap-backward-t)

    vmap <localleader>f <Plug>(fmap-forward-f)
    vmap <localleader>F <Plug>(fmap-backward-f)
    vmap <localleader>t <Plug>(fmap-forward-t)
    vmap <localleader>T <Plug>(fmap-backward-t)

    omap <localleader>f <Plug>(fmap-forward-f)
    omap <localleader>F <Plug>(fmap-backward-f)
    omap <localleader>t <Plug>(fmap-forward-t)
    omap <localleader>T <Plug>(fmap-backward-t)
endif

command! -bar -nargs=+ FNoreMap call fmap#fnoremap(<f-args>)
