@interface CFPrefsProcessPathRequiresDirectMode
@end

@implementation CFPrefsProcessPathRequiresDirectMode

void ___CFPrefsProcessPathRequiresDirectMode_block_invoke()
{
  v0 = _CFProcessPath();
  int v1 = _CFPrefsProcessPathRequiresDirectMode_onBlacklist;
  if (!v0) {
    goto LABEL_7;
  }
  if (!_CFPrefsProcessPathRequiresDirectMode_onBlacklist)
  {
    v2 = v0;
    unint64_t v3 = 0LL;
    do
    {
      size_t v4 = strlen(off_1899EDEF8[v3]);
      int v5 = strncmp(off_1899EDEF8[v3], v2, v4);
      if (v3 > 8) {
        break;
      }
      ++v3;
    }

    while (v5);
    int v1 = v5 == 0;
    _CFPrefsProcessPathRequiresDirectMode_onBlacklist = v5 == 0;
LABEL_7:
    if (!v1) {
      return;
    }
  }

  v6 = (os_log_s *)_CFPrefsClientLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    ___CFPrefsProcessPathRequiresDirectMode_block_invoke_cold_1(v6);
  }
}

void ___CFPrefsProcessPathRequiresDirectMode_block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_DEBUG,  "NSUserDefaults/CFPreferences is doing direct file access for this process",  v1,  2u);
  OUTLINED_FUNCTION_2_16();
}

@end