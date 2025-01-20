@interface NSMoribundCache
@end

@implementation NSMoribundCache

void __NSMoribundCache_invalidAccess_block_invoke()
{
  v0 = (os_log_s *)_CFFoundationRuntimeIssuesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __NSMoribundCache_invalidAccess_block_invoke_cold_1(v0);
  }
}

void __NSMoribundCache_invalidAccess_block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_FAULT,  "Attempting to interact with NSCache instance that is being deallocated. Break on NSMoribundCache_invalidAccess to debug.",  v1,  2u);
}

@end