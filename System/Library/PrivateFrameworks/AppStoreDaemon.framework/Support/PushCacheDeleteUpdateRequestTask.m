@interface PushCacheDeleteUpdateRequestTask
- (void)main;
@end

@implementation PushCacheDeleteUpdateRequestTask

- (void)main
{
  v3 = (NSError *)objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithName:]( &OBJC_CLASS___KeepAlive,  "keepAliveWithName:",  @"com.apple.PushCacheDeleteUpdateOperation"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = (id)objc_opt_class(self, v4);
    __int16 v15 = 2112;
    v16 = v3;
    id v5 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[%@]: Created transaction: %@",  (uint8_t *)&v13,  0x16u);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self, v6);
    id v8 = v7;
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v10 = error;
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%@]: Purgeable update request for client: %@",  (uint8_t *)&v13,  0x16u);
  }

  id v11 = sub_10021E048((uint64_t)&OBJC_CLASS___CacheDeleteCoordinator);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  sub_10021F684(v12);
  if (self) {
    LOBYTE(self->super.super._keepAlive) = 1;
  }
}

@end