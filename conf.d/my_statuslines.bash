source ~/.tmux/style.conf

_decode_unicode_escapes() {
  printf '%s' "$*" | perl -CS -pe 's/(\\u([0-9A-Fa-f]{1,4})|\\U([0-9A-Fa-f]{1,8}))/chr(hex($2.$3))/eg' 2>/dev/null
}


tmux_conf_theme_left_separator_main='\uE0B0'  # /!\ you don't need to install Powerline
tmux_conf_theme_left_separator_sub='\uE0B1'   #   you only need fonts patched with
tmux_conf_theme_right_separator_main='\uE0B2' #   Powerline symbols or the standalone
tmux_conf_theme_right_separator_sub='\uE0B3'  #   PowerlineSymbols.otf font, see README.md

_ms="$tmux_conf_theme_left_separator_main"
_ss="$tmux_conf_theme_left_separator_sub"



# Status format_1
# (Line 2) 
# This will display a list of panes, their dims, in cute colors
_status_format_1 () {
  col_active="${tmux_conf_theme_pane_active_border}"
  col_off="${tmux_conf_theme_pane_border}"

  active_main="#[fg=black#,bg=$col_active]"
  active_flip="#[fg=$col_active#,bg=black]"
  
  off_main="#[fg=black#,bg=$col_off]"
  off_main="#[reverse]"
  off_flip="#[fg=$col_off,bg=black]"
  off_flip="#[default]"

  head_sep="#{?pane_active,${active_main},${off_main}}${_ms} "
  tail_sep="#{?pane_active,${active_flip},${off_flip}}${_ms} "
  out="#[align=centre]#{P:#[default]${head_sep}#{pane_index}${_ss} #{pane_width}x#{pane_height}${tail_sep}#[default]}"
  
  echo "$out"
}

_status_format_2 () {
  :; 
}


_set_statuses() {
  tmux set -g status-format[1] "$(_decode_unicode_escapes "$(_status_format_1)")"
}

_get_path() {
  :;
}

"$@"
