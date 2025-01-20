@interface CFNetworkCopySystemProxySettings
@end

@implementation CFNetworkCopySystemProxySettings

uint64_t ___CFNetworkCopySystemProxySettings_block_invoke()
{
  v0 = (int *)operator new(8uLL);
  v0[1] = 0;
  int *v0 = 0;
  notify_register_check("com.apple.system.config.network_change", v0);
  notify_register_check("com.apple.system.config.proxy_change", v0 + 1);
  notify_check(*v0, &check);
  uint64_t result = notify_check(v0[1], &check);
  _CFNetworkCopySystemProxySettings::configWatcher = (uint64_t)v0;
  return result;
}

@end