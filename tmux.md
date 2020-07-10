
content of `~/.tmux.confa`

```zsh
bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."
set-option -g allow-rename off


# ----------------------
# Window/Panes operation
# -----------------------
bind | split-window -h
bind - split-window -v

# mouse mode (commented lines for old versions of tmux)
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

#split pane
bind \ split-window -h
bind - split-window -v

#prefix+jkhl
bind-key -r j resize-pane -D 5
bind-key -r k resize-pane -U 5
bind-key -r h resize-pane -L 5
bind-key -r l resize-pane -R 5

# Use Alt-arrow keys to switch panes
#bind -n M-Left select-pane -L
#bind -n M-Right select-pane -R
#bind -n M-Up select-pane -U
#bind -n M-Down select-pane -D
bind -r L select-pane -L
bind -r H select-pane -R
bind -r K select-pane -U
bind -r J select-pane -D
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

set -s escape-time 0


# prefix+p/n to switch windows
# -----------------------


#set -g mouse on
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection;
bind-key -T copy-mode-vi V send-keys -X select-line;
bind-key -T copy-mode-vi y send-keys -X copy-selection;


set -g prefix C-a
unbind-key C-b
bind-key C-a send-prefix


# ----------------------
# Status Bar
# -----------------------
set-option -g status on                # turn the status bar on
set -g status-interval 5               # set update frequencey (default 15 seconds)
set -g status-justify centre           # center window list for clarity
#set-option -g status-position bottom    # position the status bar at top of screen

# visual notification of activity in other windows
setw -g monitor-activity on
set -g visual-activity on

# set color for status bar
set-option -g status-bg colour235 #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr dim

# set window list colors - red for active and cyan for inactive
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg colour236

set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg colour236
set-window-option -g window-status-current-attr bright

# show host name and session name on left side of status bar
set -g status-left-length 85
set -g status-left "#[fg=brightblue]#S:#[fg=colour198]#h"

# show session name, window & pane number, date and time on right side of status bar
set -g status-right-length 60
#set -g status-right "#[fg=blue]#S/#I/#P #[fg=yellow]: %d %b %Y #[fg=green]: %l:%M %p : #(date -u | awk '{print $4}') :"


# divider color
set -g pane-border-fg default
set -g pane-active-border-fg blue
set -g pane-active-border-bg default

set -g default-terminal "screen-256color"

```