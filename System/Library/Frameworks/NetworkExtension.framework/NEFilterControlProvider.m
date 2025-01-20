@interface NEFilterControlProvider
- (NSDictionary)URLAppendStringMap;
- (NSDictionary)remediationMap;
- (void)handleNewFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler;
- (void)handleRemediationForFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler;
- (void)notifyRulesChanged;
- (void)setRemediationMap:(NSDictionary *)remediationMap;
- (void)setURLAppendStringMap:(NSDictionary *)URLAppendStringMap;
@end

@implementation NEFilterControlProvider

- (void)handleNewFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v6 = flow;
  v7 = completionHandler;
  ne_log_obj();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@: Handle new flow: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0LL);
}

- (void)handleRemediationForFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v6 = flow;
  v7 = completionHandler;
  ne_log_obj();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@: Handle remediation for flow: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0LL);
}

- (void)notifyRulesChanged
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: Notify rules changed", (uint8_t *)&v5, 0xCu);
  }
  v4 = -[NEProvider context](self, "context");
  [v4 notifyRulesChanged];
}

- (NSDictionary)remediationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRemediationMap:(NSDictionary *)remediationMap
{
}

- (NSDictionary)URLAppendStringMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setURLAppendStringMap:(NSDictionary *)URLAppendStringMap
{
}

- (void).cxx_destruct
{
}

@end