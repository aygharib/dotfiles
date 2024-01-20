# cheatsheet
This is a quick reference sheet for my keybindings

`<leader>` is defined as SPACEBAR
`<C>` is defined as CONTROL

## General keybinds
```
% - go to matching brace
zz - center
H - go to top of screen
M - go to mid of screen
L - go to bot of screen
{ - go to previous open
} - go to next open
<C-w> - switch window using arrow key
<C-o> - go to previous location
<C-i> - go to next location
gg - go to top of file
G - go to bottom of file
$ - go to end of line
0 - to to start of line
w - move forward one word
e - move forward one word
b - move backward one word
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

### Clangd-extensions
```
<leader>fs - switch between source and header
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

### vim-markdown
```
zR - opens all folds
zM - closes all folds
za - open a fold your cursor is on
zc - close a fold your cursor is on
zA - open a fold your cursor is on recursively
zC - close a fold your cursor is on recursively
zr - reduces fold level throughout the buffer
zm - increases fold level throughout the buffer
:Toc - see table of contents
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
