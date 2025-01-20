@interface AnalyticsRecordingOperation
- (AnalyticsRecordingOperation)initWithMetricsEvents:(id)a3;
- (NSString)appBundleId;
- (NSString)eventTopicOverride;
- (void)run;
- (void)setAppBundleId:(id)a3;
- (void)setEventTopicOverride:(id)a3;
@end

@implementation AnalyticsRecordingOperation

- (AnalyticsRecordingOperation)initWithMetricsEvents:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AnalyticsRecordingOperation;
  v6 = -[AnalyticsRecordingOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_events, a3);
  }

  return v7;
}

- (void)run
{
  if (!-[NSArray count](self->_events, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v4) {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v5 = [v4 shouldLog];
    else {
      LODWORD(v6) = v5;
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v6 = v6;
    }
    else {
      v6 &= 2u;
    }
    if ((_DWORD)v6)
    {
      int v108 = 138412290;
      id v109 = (id)objc_opt_class(self);
      id v8 = v109;
      objc_super v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%@ no events to report",  &v108,  12);

      if (!v9)
      {
LABEL_16:

        -[AnalyticsRecordingOperation setSuccess:](self, "setSuccess:", 1LL);
        return;
      }

      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
      free(v9);
      SSFileLog(v4, @"%@");
    }

    goto LABEL_16;
  }

  if (-[NSString length](self->_eventTopicOverride, "length")) {
    eventTopicOverride = (__CFString *)self->_eventTopicOverride;
  }
  else {
    eventTopicOverride = @"xp_its_main";
  }
  v84 = eventTopicOverride;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 activeAccount]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSVCookieStorage sharedStorage](&OBJC_CLASS___SSVCookieStorage, "sharedStorage"));
  v81 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allCookiesForAccount:v11]);

  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v100 objects:v107 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v101;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v101 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
        unsigned int v20 = [v19 isEqualToString:@"xp_ci"];

        if (v20)
        {
          id v15 = (id)objc_claimAutoreleasedReturnValue([v18 value]);
          goto LABEL_28;
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v100 objects:v107 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

- (NSString)eventTopicOverride
{
  return self->_eventTopicOverride;
}

- (void)setEventTopicOverride:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end