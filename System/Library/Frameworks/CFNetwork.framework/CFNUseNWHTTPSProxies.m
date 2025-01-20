@interface CFNUseNWHTTPSProxies
@end

@implementation CFNUseNWHTTPSProxies

void ____CFNUseNWHTTPSProxies_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v0 = getenv("CFN_USE_NW_HTTPS_PROXY");
  if (!v0) {
    goto LABEL_9;
  }
  v1 = v0;
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1) {
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4739);
  }
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    __CFNUseNWHTTPSProxies::useNWHTTPSProxy = strcmp(v1, "0") != 0;
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v2 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = __CFNUseNWHTTPSProxies::useNWHTTPSProxy;
      v3 = "NW Proxies override %d via env";
LABEL_19:
      _os_log_impl(&dword_18298D000, v2, OS_LOG_TYPE_INFO, v3, buf, 8u);
    }
  }

  else
  {
LABEL_9:
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"CFNetworkNWHTTPSProxyOverride",  @"Apple Global Domain",  &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      __CFNUseNWHTTPSProxies::useNWHTTPSProxy = AppIntegerValue == 1;
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v2 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v7 = __CFNUseNWHTTPSProxies::useNWHTTPSProxy;
        v3 = "NW Proxies override %d via preference";
        goto LABEL_19;
      }
    }

    else if (_os_feature_enabled_impl())
    {
      __CFNUseNWHTTPSProxies::useNWHTTPSProxy = 1;
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v2 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v7 = __CFNUseNWHTTPSProxies::useNWHTTPSProxy;
        v3 = "NW Proxies override %d via os_feature";
        goto LABEL_19;
      }
    }
  }

@end