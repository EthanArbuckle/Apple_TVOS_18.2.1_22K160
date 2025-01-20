@interface AMSBag
- (BOOL)asd_iTunesStoreMetricsIsEnabled;
@end

@implementation AMSBag

- (BOOL)asd_iTunesStoreMetricsIsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSBag BOOLForKey:](self, "BOOLForKey:", @"itunesstore-metrics-enabled"));
  id v13 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueWithError:&v13]);
  id v4 = v13;

  if (!v3)
  {
    if (!v4) {
      goto LABEL_18;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      unsigned int v8 = v7;
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v8 & 2;
    }
    if ((_DWORD)v10)
    {
      int v14 = 138412290;
      id v15 = v4;
      v11 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "Failed to fetch itunesstore-metrics-enabled bag value with error: %@",  &v14,  12);

      if (!v11)
      {
LABEL_17:

        goto LABEL_18;
      }

      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_17;
  }

  if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) == 0)
  {
LABEL_18:
    unsigned __int8 v5 = 0;
    goto LABEL_19;
  }

  unsigned __int8 v5 = [v3 BOOLValue];
LABEL_19:

  return v5;
}

@end