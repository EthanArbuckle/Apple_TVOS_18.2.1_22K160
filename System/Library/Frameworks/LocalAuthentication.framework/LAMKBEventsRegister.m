@interface LAMKBEventsRegister
@end

@implementation LAMKBEventsRegister

uint64_t ___LAMKBEventsRegister_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    v9 = "_LAMKBEventsRegister_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl(&dword_186EAF000, v6, OS_LOG_TYPE_INFO, "%s:callback(type=%d, handle_state=%@", (uint8_t *)&v8, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end