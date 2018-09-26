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
    \ { 'strokes': ["'si', '-shi"], 'target': 'し'},
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
