@interface CKKSNotifyPostNotifier
+ (void)post:(id)a3;
@end

@implementation CKKSNotifyPostNotifier

+ (void)post:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_1001CF4C0(@"ckks", 0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "posting notification %@",  (uint8_t *)&v6,  0xCu);
    }

    notify_post((const char *)[v3 UTF8String]);
  }
}

@end