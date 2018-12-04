# :diamond_shape_with_a_dot_inside: vim-fmap :diamond_shape_with_a_dot_inside:

This vim plugin takes a way for mappping `f` of Vim :laughing:

![sample](sample.gif)

For example, with this preference

```vim
augroup VimFmap
    autocmd!
    autocmd VimEnter * FNoreMap pb (
    autocmd VimEnter * FNoreMap pe )
augroup END

nmap <leader>f <Plug>(fmap-forward-f)
```

If your cursor is above of `^`

```
b a a ) a
  ^
```

You can move the cursor to `)` with the `<leader>fpb` key :sunny:

```
b a a ) a
      ^
```

`F`, `t`, and `T` can be used on the same way.

Also if you want to leave on the way,
`<Esc>`, `<C-[>`, and `<C-c>` helps with you.

# :gift: How to install this :gift:

Please add the following line into your .vimrc

With dein.vim

```vim
call dein#add('aiya001/vim-fmap')
```

With dein.vim and .toml

```vim
[[plugins]]
repo = 'aiya000/vim-fmap'
```

or

```vim
[[plugins]]
repo = 'aiya000/vim-fmap'
on_map = [
    '<Plug>(fmap-forward-f)',
    '<Plug>(fmap-backward-f)',
    '<Plug>(fmap-forward-t)',
    '<Plug>(fmap-backward-t)',
]
on_cmd = 'FNoreMap'
```

# Plans

- the `target` for characters
    - `['(', '（']` of `let g:fmap_default_mappings = [{ 'target': ['(', '（'], 'strokes': ['pb'] }]`
    - ^ shots the first of `(` and `（`
- augroup FmapShotPre, FmapShotPost
