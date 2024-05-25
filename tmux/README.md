# cheatsheet
This is a quick reference sheet for my keybindings

## Sessions
`tmux` - creates new session
`tmux ls` - lists out all sessions
`tmux new -s [session_name]` - creates named tmux session
`tmux kill-session -t [session_name]` - kills specified session
`exit` - disconnects from tmux session
`tmux a`, `tmux attach` - attach to last session
`tmux a -t [session_name]`, `tmux attach -t [session_name]` - attach to specified session

## Keyboard Shortcuts
`<leader>` is defined as Control+S

List all shortcuts - `<leader>+?`
Split panes vertically - `<leader>+%`
Split panes horizontally - `<leader>+"`
Move to right pane - `<leader>-L`
Move to left pane - `<leader>-H`
Move to top pane - `<leader>-K`
Move to bottom pane - `<leader>-J`
Change size of pane - `<Control>+L` `Control+H`
