@interface SECKEY
@end

@implementation SECKEY

void ___SECKEY_LOG_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log;
  _SECKEY_LOG_log = (uint64_t)v0;
}

void ___SECKEY_LOG_block_invoke_8664()
{
  os_log_t v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_8663;
  _SECKEY_LOG_log_8663 = (uint64_t)v0;
}

void ___SECKEY_LOG_block_invoke_9797()
{
  os_log_t v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_9796;
  _SECKEY_LOG_log_9796 = (uint64_t)v0;
}

void ___SECKEY_LOG_block_invoke_10418()
{
  os_log_t v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_10416;
  _SECKEY_LOG_log_10416 = (uint64_t)v0;
}

@end