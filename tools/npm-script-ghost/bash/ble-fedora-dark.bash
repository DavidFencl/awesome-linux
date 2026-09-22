# awesome-linux — ble.sh faces for Fedora / Adwaita Dark
# Only sets faces that exist on this ble build; unknown names are skipped.

_awesome_ble_face() {
  # usage: _awesome_ble_face NAME SPEC
  local name="$1" spec="$2"
  ble-face -s "$name" "$spec" 2>/dev/null || true
}

# Quiet line editing / regions
_awesome_ble_face region                 'fg=255,bg=60'
_awesome_ble_face region_match           'fg=255,bg=25'
_awesome_ble_face region_insert          'fg=33,bg=255'
_awesome_ble_face disabled               'fg=244'
_awesome_ble_face overwrite_mode         'fg=16,bg=75'
_awesome_ble_face vbell                  'reverse'
_awesome_ble_face vbell_erase            'bg=236'
_awesome_ble_face prompt_status_line     'fg=252,bg=238'

# Syntax — muted, one blue accent, soft amber strings, soft red errors
_awesome_ble_face syntax_default         none
_awesome_ble_face syntax_command         'fg=75'
_awesome_ble_face syntax_quoted          'fg=178'
_awesome_ble_face syntax_quotation       'fg=178'
_awesome_ble_face syntax_escape          'fg=110'
_awesome_ble_face syntax_expr            'fg=110'
_awesome_ble_face syntax_error           'fg=167'
_awesome_ble_face syntax_varname         'fg=180'
_awesome_ble_face syntax_delimiter       none
_awesome_ble_face syntax_param_expansion 'fg=146'
_awesome_ble_face syntax_history_expansion 'fg=180,bg=236'
_awesome_ble_face syntax_function_name   'fg=75'
_awesome_ble_face syntax_comment         'fg=244'
_awesome_ble_face syntax_glob            'fg=180'
_awesome_ble_face syntax_brace           'fg=246'
_awesome_ble_face syntax_tilde           'fg=110'
_awesome_ble_face syntax_document        'fg=244'
_awesome_ble_face syntax_document_begin  'fg=244'

# Commands
_awesome_ble_face command_builtin_dot    'fg=167'
_awesome_ble_face command_builtin        'fg=167'
_awesome_ble_face command_alias          'fg=75'
_awesome_ble_face command_function       'fg=75'
_awesome_ble_face command_file           'fg=252'
_awesome_ble_face command_keyword        'fg=110'
_awesome_ble_face command_jobs           'fg=110'
_awesome_ble_face command_directory      'fg=75,underline'
_awesome_ble_face filename_directory     'fg=75,underline'
_awesome_ble_face filename_executable    'fg=114'
_awesome_ble_face filename_link          'fg=110,underline'
_awesome_ble_face filename_orphan        'fg=167'
_awesome_ble_face filename_setuid        'fg=178'
_awesome_ble_face filename_other         none
_awesome_ble_face filename_warning       'fg=178'
_awesome_ble_face filename_ls_colors     none

# Ghost / menus (names must exist on this ble version)
_awesome_ble_face auto_complete          'fg=244'
_awesome_ble_face menu_complete_match    'fg=75'
_awesome_ble_face menu_complete_selected 'fg=255,bg=25'
_awesome_ble_face menu_desc_default      'fg=244'
_awesome_ble_face menu_desc_quote        'fg=178'
_awesome_ble_face menu_desc_type         'fg=110'

unset -f _awesome_ble_face
