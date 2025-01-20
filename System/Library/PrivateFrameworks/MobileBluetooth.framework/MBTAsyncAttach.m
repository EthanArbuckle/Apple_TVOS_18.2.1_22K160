@interface MBTAsyncAttach
@end

@implementation MBTAsyncAttach

uint64_t ___MBTAsyncAttach_block_invoke(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    ___MBTAsyncAttach_block_invoke_cold_1();
  }
  uint64_t result = _MBTSignalSessionEvent(*(void *)(a1 + 32), 0LL, 0LL);
  gSessionAttachTries = 0LL;
  return result;
}

void ___MBTAsyncAttach_block_invoke_cold_1()
{
}

@end