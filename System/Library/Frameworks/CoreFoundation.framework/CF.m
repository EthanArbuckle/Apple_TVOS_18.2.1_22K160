@interface CF
@end

@implementation CF

void __CF_RUNLOOP_ASSERTIONS_block_invoke()
{
  v0 = (os_log_s *)_CFOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __CF_RUNLOOP_ASSERTIONS_block_invoke_cold_1(v0);
  }
}

void __CF_RUNLOOP_ASSERTIONS_block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_ERROR,  "Attempting to use the main runloop, but the main thread has exited. This message will only log once.",  v1,  2u);
}

@end