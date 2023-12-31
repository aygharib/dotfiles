# cheatsheet
This is a quick reference sheet for my keybindings

`<leader>` is defined as SPACEBAR
`<C>` is defined as CONTROL

## General keybinds
```
```

## Plugins
### Commment
```
gcc - line comment
gbc - block comment
gcO - add comment on line above
gco - add comment on line below
gcA - add comment at end of line
```

### LSP
```
<leader>e - open diagnostics window
[d - go to previous in diagnostics window
]d - go to next in diagnostics window
<leader>q - show diagnostics list

gD - show declaration
gd - show definition
K - show hover info
gi - show implementation
<C-k> - signature help
<leader>D - type definition
<leader>ca - show code actions
gr - show references
```

### Neo-Tree
```
// Default (https://github.com/nvim-neo-tree/neo-tree.nvim)
P - toggle preview
<Esc> - close preview
l - focus preview
S - open split
s - open vsplit
t - open new tab
A - add directory
d - delete
r - rename
y - copy to clipboard
p - paste from clipboard
q - close window
<Backspace> - navigate up
. - set root
H - toggle hidden files
/ - fuzzy_finder

// Custom
<leader>fe - open file explorer tree (file-explorer)
<leader>bf - open buffer float
```

### Telescope
```
<leader>ff - fuzzy-find files in project (fuzzy-find)
<leader>rg - ripgrep for text in all files in project (rip-grep)
```

### None-LS
```
<leader>fa - auto-format file (format all)
```
