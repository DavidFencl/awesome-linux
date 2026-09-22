# awesome-linux — ble.sh faces for Fedora / Adwaita Dark
# Source after ble.sh is loaded (from .blerc or conf snippet).

# Quiet line editing / regions
ble-face -s region                 'fg=255,bg=60'
ble-face -s region_match           'fg=255,bg=25'
ble-face -s region_insert          'fg=33,bg=255'
ble-face -s disabled               'fg=244'
ble-face -s overwrite_mode         'fg=16,bg=75'
ble-face -s vbell                  'reverse'
ble-face -s vbell_erase            'bg=236'
ble-face -s prompt_status_line     'fg=252,bg=238'

# Syntax — muted, one blue accent, soft amber strings, soft red errors
ble-face -s syntax_default         none
ble-face -s syntax_command         'fg=75'            # Adwaita-ish blue
ble-face -s syntax_quoted          'fg=178'           # soft amber
ble-face -s syntax_quotation       'fg=178'
ble-face -s syntax_escape          'fg=110'
ble-face -s syntax_expr            'fg=110'
ble-face -s syntax_error           'fg=167'           # soft red, no loud bg
ble-face -s syntax_varname         'fg=180'
ble-face -s syntax_delimiter       none
ble-face -s syntax_param_expansion 'fg=146'
ble-face -s syntax_history_expansion 'fg=180,bg=236'
ble-face -s syntax_function_name   'fg=75'
ble-face -s syntax_comment         'fg=244'
ble-face -s syntax_glob            'fg=180'
ble-face -s syntax_brace           'fg=246'
ble-face -s syntax_tilde           'fg=110'
ble-face -s syntax_document        'fg=244'
ble-face -s syntax_document_begin  'fg=244'

# Commands — keep builtins calm (not bright red)
ble-face -s command_builtin_dot    'fg=167'
ble-face -s command_builtin        'fg=167'
ble-face -s command_alias          'fg=75'
ble-face -s command_function       'fg=75'
ble-face -s command_file           'fg=252'
ble-face -s command_keyword        'fg=110'
ble-face -s command_jobs           'fg=110'
ble-face -s command_directory      'fg=75,underline'
ble-face -s filename_directory     'fg=75,underline'
ble-face -s filename_executable    'fg=114'
ble-face -s filename_link          'fg=110,underline'
ble-face -s filename_orphan        'fg=167'
ble-face -s filename_setuid        'fg=178'
ble-face -s filename_other         none
ble-face -s filename_warning       'fg=178'
ble-face -s filename_ls_colors     none

# Ghost / auto-complete suggestion (dim gray)
ble-face -s auto_complete          'fg=244'
ble-face -s auto_complete_inset    'fg=244'
ble-face -s menu_complete_match    'fg=75'
ble-face -s menu_complete_selected 'fg=255,bg=25'
ble-face -s menu_desc_match        'fg=244'
ble-face -s menu_desc_selected     'fg=252,bg=25'
