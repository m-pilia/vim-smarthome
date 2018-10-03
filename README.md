# Smart Home and End keys for vim

This plugin bundles the [Vim Tip 1061](https://vim.fandom.com/wiki/SmartHome_and_SmartEnd_over_wrapped_lines) from Gerald Lai.

It provides two functions that can be bound to Home and End keys to smartly
move to the beginning and end of lines. Calling `SmartHome` will move to the
first non-whitespace character (like `^`), unless the cursor is already on the
first non-whitespace character or before it, in that case it will move to the
beginning of the line (like `0`). `SmartEnd` behaves symmetrically to move to
the end of the line.

The functions behave nicely in presence of wrapped lines. The first call will
move to the beginning/end of the wrapped line, and a subsequent call will move
to the previous/next wrapped line.

The functions work in normal, insert, and visual mode. They can be bound to the
<kbd>Home</kbd> and <kbd>End</kbd> keys with:

```vim
nmap <silent><Home> :call smarthome#SmartHome('n')<cr>
nmap <silent><End> :call smarthome#SmartEnd('n')<cr>
imap <silent><Home> <C-r>=smarthome#SmartHome('i')<cr>
imap <silent><End> <C-r>=smarthome#SmartEnd('i')<cr>
vmap <silent><Home> <Esc>:call smarthome#SmartHome('v')<cr>
vmap <silent><End> <Esc>:call smarthome#SmartEnd('v')<cr>
```

# License
Same as [Vim Tips](https://vim.fandom.com/wiki/Vim_Tips_Wiki).
