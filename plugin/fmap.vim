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
    \ { 'strokes': ['.'], 'target': '。'},
    \ { 'strokes': [','], 'target': '、'},
    \ { 'strokes': ['!'], 'target': '！'},
    \ { 'strokes': ['?'], 'target': '？'},
    \ { 'strokes': ["'a"], 'target': 'あ'},
    \ { 'strokes': ["'i"], 'target': 'い'},
    \ { 'strokes': ["'u"], 'target': 'う'},
    \ { 'strokes': ["'e"], 'target': 'え'},
    \ { 'strokes': ["'o"], 'target': 'お'},
    \ { 'strokes': ["'ka"], 'target': 'か'},
    \ { 'strokes': ["'ki"], 'target': 'き'},
    \ { 'strokes': ["'ku"], 'target': 'く'},
    \ { 'strokes': ["'ke"], 'target': 'け'},
    \ { 'strokes': ["'ko"], 'target': 'こ'},
    \ { 'strokes': ["'sa"], 'target': 'さ'},
    \ { 'strokes': ["'si", "'shi"], 'target': 'し'},
    \ { 'strokes': ["'su"], 'target': 'す'},
    \ { 'strokes': ["'se"], 'target': 'せ'},
    \ { 'strokes': ["'so"], 'target': 'そ'},
    \ { 'strokes': ["'ta"], 'target': 'た'},
    \ { 'strokes': ["'ti"], 'target': 'ち'},
    \ { 'strokes': ["'tu"], 'target': 'つ'},
    \ { 'strokes': ["'te"], 'target': 'て'},
    \ { 'strokes': ["'to"], 'target': 'と'},
    \ { 'strokes': ["'na"], 'target': 'な'},
    \ { 'strokes': ["'ni"], 'target': 'に'},
    \ { 'strokes': ["'nu"], 'target': 'ぬ'},
    \ { 'strokes': ["'ne"], 'target': 'ね'},
    \ { 'strokes': ["'no"], 'target': 'の'},
    \ { 'strokes': ["'ha"], 'target': 'は'},
    \ { 'strokes': ["'hi"], 'target': 'ひ'},
    \ { 'strokes': ["'hu"], 'target': 'ふ'},
    \ { 'strokes': ["'he"], 'target': 'へ'},
    \ { 'strokes': ["'ho"], 'target': 'ほ'},
    \ { 'strokes': ["'ma"], 'target': 'ま'},
    \ { 'strokes': ["'mi"], 'target': 'み'},
    \ { 'strokes': ["'mu"], 'target': 'む'},
    \ { 'strokes': ["'me"], 'target': 'め'},
    \ { 'strokes': ["'mo"], 'target': 'も'},
    \ { 'strokes': ["'ya"], 'target': 'や'},
    \ { 'strokes': ["'yu"], 'target': 'ゆ'},
    \ { 'strokes': ["'yo"], 'target': 'よ'},
    \ { 'strokes': ["'ra"], 'target': 'ら'},
    \ { 'strokes': ["'ri"], 'target': 'り'},
    \ { 'strokes': ["'ru"], 'target': 'る'},
    \ { 'strokes': ["'re"], 'target': 'れ'},
    \ { 'strokes': ["'ro"], 'target': 'ろ'},
    \ { 'strokes': ["'wa"], 'target': 'わ'},
    \ { 'strokes': ["'wo"], 'target': 'を'},
    \ { 'strokes': ["'nn"], 'target': 'ん'},
\ ]

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
