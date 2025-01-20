@interface RangingLimitSystemConfiguratorClient
- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
@end

@implementation RangingLimitSystemConfiguratorClient

- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  BOOL v5 = a3;
  v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromClass(a4);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v8;
    v10 = @"NO";
    if (v5) {
      v10 = @"YES";
    }
    int v11 = 138412546;
    v12 = v10;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#rlm,didUpdateResourceUsageLimitExceeded: %@, for: %@",  (uint8_t *)&v11,  0x16u);
  }
}

@end