@interface PurgeChangeHistoryService
+ (BOOL)purgeChangeHistoryWithError:(id *)a3;
+ (const)activityIdentifier;
+ (void)run;
@end

@implementation PurgeChangeHistoryService

+ (const)activityIdentifier
{
  return "com.apple.contactsd.PurgeChangeHistoryService";
}

+ (void)run
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs purgeHistory](&OBJC_CLASS___CNContactsDaemonLogs, "purgeHistory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [a1 activityIdentifier]));
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ is running to purge change history.",  buf,  0xCu);
  }

  id v10 = 0LL;
  unsigned int v5 = [a1 purgeChangeHistoryWithError:&v10];
  id v6 = v10;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs purgeHistory](&OBJC_CLASS___CNContactsDaemonLogs, "purgeHistory"));
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [a1 activityIdentifier]));
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ has finished purging change history.",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10000DDAC(a1, (uint64_t)v6, v8);
  }
}

+ (BOOL)purgeChangeHistoryWithError:(id *)a3
{
  return 1;
}

@end