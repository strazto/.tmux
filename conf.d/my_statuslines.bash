
_decode_unicode_escapes() {
  printf '%s' "$*" | perl -CS -pe 's/(\\u([0-9A-Fa-f]{1,4})|\\U([0-9A-Fa-f]{1,8}))/chr(hex($2.$3))/eg' 2>/dev/null
}


tmux_conf_theme_left_separator_main='\uE0B0'  # /!\ you don't need to install Powerline
tmux_conf_theme_left_separator_sub='\uE0B1'   #   you only need fonts patched with
tmux_conf_theme_right_separator_main='\uE0B2' #   Powerline symbols or the standalone
tmux_conf_theme_right_separator_sub='\uE0B3'  #   PowerlineSymbols.otf font, see README.md

_ms="$tmux_conf_left_separator_main"
_ss="$tmux_conf_theme_left_separator_sub"

# Status format_1
# (Line 2) 
# This will display a list of panes, their dims, in cute colors
_status_format_1 () {
  cols_1='#[fg=black#,bg=#00afff]'
  cols_2="#[bg=black#,fg=#00afff]"

  out = "#[align=centre]#{P:#{?pane_active,${ms}${cols_1},$cols_2}#{pane_index}[#{pane_width}x#{pane_height}]}#[default] "
  
  out = _decode_unicode_escapes "$out"
  echo $out
}

tmux set -g status-format[1] "$(_status_format_1)"

# status_left=$(echo "$status_left" | sed 's%#{circled_session_name}%#(cut -c3- ~/.tmux/apply.conf | sh -s _circled #S)%g')

#"$@"
