@interface SSVSubscriptionEntitlementsCoordinator
+ (id)_cachedSubscriptionEntitlementsDictionary;
+ (id)_cachedSubscriptionEntitlementsPath;
+ (id)cachedSubscriptionEntitlementsExpired:(BOOL *)a3;
+ (void)_notifyClientsOfChangedSubscriptionEntitlements;
+ (void)_setCachedSubscriptionEntitlementsDictionary:(id)a3;
+ (void)markCachedSubscriptionEntitlementsAsExpired;
+ (void)setCachedSubscriptionEntitlements:(id)a3;
@end

@implementation SSVSubscriptionEntitlementsCoordinator

+ (id)cachedSubscriptionEntitlementsExpired:(BOOL *)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _cachedSubscriptionEntitlementsDictionary]);
  objc_sync_exit(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLBagForContext:v6]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"fsEntitlementsRefreshIntervalInSeconds"]);
  [v9 doubleValue];
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kCacheTimestampKey]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingTimeInterval:v11]);

  v14 = &ACSLocateCachingServer_ptr;
  if (!v13
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
        id v16 = [v13 compare:v15],
        v15,
        v16 != (id)1))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      int v39 = 138412290;
      id v40 = (id)objc_opt_class(v4);
      v21 = a3;
      v22 = v8;
      v23 = v6;
      id v24 = v40;
      v25 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%@: Cached subscription entitlements have expired.",  &v39,  12);

      v6 = v23;
      v8 = v22;
      a3 = v21;
      v14 = &ACSLocateCachingServer_ptr;

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
        free(v25);
        v37 = v26;
        SSFileLog(v17, @"%@");
      }
    }

    else
    {
    }

    if (a3) {
      *a3 = 1;
    }
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[459], "sharedDaemonConfig", v37));
  if (!v27) {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v14[459] sharedConfig]);
  }
  unsigned int v28 = [v27 shouldLog];
  else {
    unsigned int v29 = v28;
  }
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = v29 & 2;
  }
  if (!(_DWORD)v31) {
    goto LABEL_28;
  }
  v32 = (void *)objc_opt_class(v4);
  int v39 = 138412290;
  id v40 = v32;
  id v33 = v32;
  LODWORD(v38) = 12;
  v34 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Returning cached subscription entitlements.",  &v39,  v38);

  if (v34)
  {
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
    free(v34);
    SSFileLog(v27, @"%@");
LABEL_28:
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[SSVSubscriptionEntitlements _parseJSONDictionary:]( &OBJC_CLASS___SSVSubscriptionEntitlements,  "_parseJSONDictionary:",  v5));
  return v35;
}

+ (void)markCachedSubscriptionEntitlementsAsExpired
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v13 = 138412290;
    id v14 = (id)objc_opt_class(a1);
    id v7 = v14;
    v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%@: Marking the cached subscription entitlements as expired.",  &v13,  12);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
      free(v8);
      SSFileLog(v3, @"%@");
    }
  }

  else
  {
  }

  id v10 = a1;
  objc_sync_enter(v10);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _cachedSubscriptionEntitlementsDictionary]);
  id v12 = [v11 mutableCopy];

  if (v12)
  {
    [v12 removeObjectForKey:kCacheTimestampKey];
    [v10 _setCachedSubscriptionEntitlementsDictionary:v12];
  }

  objc_sync_exit(v10);
  [v10 _notifyClientsOfChangedSubscriptionEntitlements];
}

+ (void)setCachedSubscriptionEntitlements:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v5) {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v6 = [v5 shouldLog];
    else {
      LODWORD(v7) = v6;
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v7;
    }
    else {
      v7 &= 2u;
    }
    if ((_DWORD)v7)
    {
      int v23 = 138412290;
      id v24 = (id)objc_opt_class(a1);
      id v9 = v24;
      id v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%@: Caching subscription entitlements.",  &v23,  12);

      if (v10)
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
        free(v10);
        SSFileLog(v5, @"%@");
      }
    }

    else
    {
    }

    id v12 = [v4 mutableCopy];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v12 setObject:v20 forKeyedSubscript:kCacheTimestampKey];

    id v21 = a1;
    objc_sync_enter(v21);
    [v21 _setCachedSubscriptionEntitlementsDictionary:v12];
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([a1 _cachedSubscriptionEntitlementsPath]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v23 = 138412290;
      id v24 = (id)objc_opt_class(a1);
      id v17 = v24;
      unsigned int v18 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Clearing cached subscription entitlements.",  &v23,  12);

      if (v18)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
        free(v18);
        SSFileLog(v13, @"%@");
      }
    }

    else
    {
    }

    objc_sync_enter(a1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v22 removeItemAtPath:v12 error:0];
  }

  objc_sync_exit(a1);

  [a1 _notifyClientsOfChangedSubscriptionEntitlements];
}

+ (id)_cachedSubscriptionEntitlementsDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _cachedSubscriptionEntitlementsPath]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  if (!v4)
  {
    id v15 = 0LL;
    goto LABEL_22;
  }

  id v17 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  &v17));
  id v6 = v17;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      double v11 = (void *)objc_opt_class(a1);
      int v18 = 138412546;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      id v12 = v11;
      int v13 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Failed to read the subscription entitlements from disk. %@",  &v18,  22);

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_15;
  }

+ (id)_cachedSubscriptionEntitlementsPath
{
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  v17[0] = v5;
  v17[1] = @"com.apple.itunesstored";
  v17[2] = @"SubscriptionEntitlements_v2.plist";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));
  if (!v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v15 = 138412290;
      id v16 = (id)objc_opt_class(a1);
      id v12 = v16;
      int v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Unable to determine the path of the cached subscription entitlements.",  &v15,  12);

      if (!v13)
      {
LABEL_14:

        goto LABEL_15;
      }

      double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_14;
  }

+ (void)_notifyClientsOfChangedSubscriptionEntitlements
{
}

+ (void)_setCachedSubscriptionEntitlementsDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _cachedSubscriptionEntitlementsPath]);
  if ([v5 length])
  {
    id v16 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v16));
    id v7 = v16;
    if (!v7)
    {
LABEL_16:
      objc_msgSend(v6, "writeToFile:atomically:", v5, 1, v15);

      goto LABEL_17;
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      id v12 = (void *)objc_opt_class(a1);
      int v17 = 138412546;
      int v18 = v12;
      __int16 v19 = 2112;
      id v20 = v7;
      id v13 = v12;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Failed to write the subscription entitlements to disk. %@",  &v17,  22);

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }

      double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      int v15 = v11;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_15;
  }

@end