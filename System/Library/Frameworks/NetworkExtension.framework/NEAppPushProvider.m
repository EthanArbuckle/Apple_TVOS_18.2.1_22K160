@interface NEAppPushProvider
- (NEAppPushProvider)init;
- (NSDictionary)providerConfiguration;
- (void)reportIncomingCallWithUserInfo:(NSDictionary *)userInfo;
- (void)reportPushToTalkMessageWithUserInfo:(NSDictionary *)userInfo;
- (void)setProviderConfiguration:(id)a3;
- (void)stopWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEAppPushProvider

- (void)stopWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
}

- (void)reportIncomingCallWithUserInfo:(NSDictionary *)userInfo
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v4 = userInfo;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@: reporting incoming call", (uint8_t *)&v7, 0xCu);
  }
  v6 = -[NEProvider context](self, "context");
  [v6 reportIncomingCall:v4];
}

- (void)reportPushToTalkMessageWithUserInfo:(NSDictionary *)userInfo
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v4 = userInfo;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "%@: reporting PushToTalk message",  (uint8_t *)&v7,  0xCu);
  }
  v6 = -[NEProvider context](self, "context");
  [v6 reportPushToTalkMessage:v4];
}

- (NEAppPushProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEAppPushProvider;
  return -[NEProvider init](&v3, sel_init);
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProviderConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end