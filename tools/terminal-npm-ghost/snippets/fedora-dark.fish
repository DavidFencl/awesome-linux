# awesome-linux — fish colors tuned for Fedora / Adwaita Dark
# Less rainbow, quieter ghost text, one blue accent.
# Loaded from conf.d; safe to re-source.

# Core text
set -U fish_color_normal            c0bfbc
set -U fish_color_command           78aeed
set -U fish_color_keyword           78aeed
set -U fish_color_quote             e5a50a
set -U fish_color_redirection       c0bfbc
set -U fish_color_end               c0bfbc
set -U fish_color_error             e01b24 --bold
set -U fish_color_param             deddda
set -U fish_color_option            9a9996
set -U fish_color_comment           9a9996
set -U fish_color_operator          c0bfbc
set -U fish_color_escape            62a0ea
set -U fish_color_autosuggestion    77767b
set -U fish_color_valid_path        --underline
set -U fish_color_cancel            e01b24

# Selection / search
set -U fish_color_selection         --background=3d3846
set -U fish_color_search_match      --background=1c71d8
set -U fish_color_history_current   --bold

# Pager (Tab completion menu)
set -U fish_pager_color_prefix      78aeed --bold
set -U fish_pager_color_completion  c0bfbc
set -U fish_pager_color_description 9a9996
set -U fish_pager_color_progress    78aeed --background=242424
set -U fish_pager_color_selected_background --background=3584e4
set -U fish_pager_color_selected_prefix    ffffff --bold
set -U fish_pager_color_selected_completion ffffff
set -U fish_pager_color_selected_description e0e0e0

# Prompt bits (if using default prompt)
set -U fish_color_cwd               78aeed
set -U fish_color_cwd_root          e01b24
set -U fish_color_user              8ff0a4
set -U fish_color_host              c0bfbc
set -U fish_color_host_remote       e5a50a
set -U fish_color_status            e01b24
