@interface NSPDNSProxy
- (NSPDNSProxy)init;
- (void)dealloc;
@end

@implementation NSPDNSProxy

- (NSPDNSProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSPDNSProxy;
  v2 = -[NSPDNSProxy init](&v12, "init");
  v6 = v2;
  if (v2)
  {
    v7 = v2;
  }

  else
  {
    uint64_t v9 = nplog_obj(0LL, v3, v4, v5);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPDNSProxy;
  -[NSPDNSProxy dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end