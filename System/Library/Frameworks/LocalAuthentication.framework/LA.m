@interface LA
@end

@implementation LA

void __LA_LOG_laabio_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LocalAuthentication", "laabio");
  v1 = (void *)LA_LOG_laabio_log;
  LA_LOG_laabio_log = (uint64_t)v0;
}

void __LA_LOG_block_invoke()
{
  uint64_t v0 = LALogForCategory();
  v1 = (void *)LA_LOG_log;
  LA_LOG_log = v0;
}

void __LA_LOG_INTERACTIVE_block_invoke()
{
  uint64_t v0 = LALogForCategory();
  v1 = (void *)LA_LOG_INTERACTIVE_log;
  LA_LOG_INTERACTIVE_log = v0;
}

  ;
}

void __LA_LOG_block_invoke_0()
{
  uint64_t v0 = LALogForCategory();
  v1 = (void *)LA_LOG_log_0;
  LA_LOG_log_0 = v0;
}

void __LA_LOG_coreauthd_client_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LocalAuthentication", "coreauthd_client");
  v1 = (void *)LA_LOG_coreauthd_client_log;
  LA_LOG_coreauthd_client_log = (uint64_t)v0;
}

@end