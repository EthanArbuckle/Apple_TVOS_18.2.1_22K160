@interface NPUserEventAgent
+ (id)sharedAgent;
- (BOOL)captiveOutage;
- (BOOL)captiveOutageWaitingForUserActivity;
- (BOOL)configFetchOnNetworkChange;
- (BOOL)directPathProbeOnNetworkChange;
- (BOOL)isObservingPath;
- (BOOL)proxyPathProbeOnNetworkChange;
- (BOOL)subscriptionCheckOnNetworkChange;
- (BOOL)tokenFetchOnNetworkChange;
- (NSData)nonwifiNetworkSignature;
- (NSData)wifiNetworkSignature;
- (NSDate)configurationFetchDate;
- (NSDate)directPathProbeDate;
- (NSDate)odohAuthOutageRestoreDate;
- (NSDate)odohRestoreDate;
- (NSDate)proxyPathProbeDate;
- (NSDate)proxyRestoreDate;
- (NSDate)resurrectionDate;
- (NSDate)subscriptionCheckDate;
- (NSDate)tokenFetchDate;
- (NSDate)tokenIssuanceRestrictedUntilDate;
- (NSTimer)configurationFetchTimer;
- (NSTimer)directPathProbeTimer;
- (NSTimer)locationMonitorTimer;
- (NSTimer)odohAuthOutageRestoreTimer;
- (NSTimer)odohRestoreTimer;
- (NSTimer)proxyPathProbeTimer;
- (NSTimer)proxyRestoreTimer;
- (NSTimer)resurrectionTimer;
- (NSTimer)subscriptionCheckTimer;
- (NSTimer)tokenFetchTimer;
- (NSTimer)tokenIssuanceRestrictedUntilTimer;
- (__SCDynamicStore)dynamicStore;
- (unint64_t)eventToken;
- (unint64_t)userActivityNotificationHandle;
- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)provider;
- (void)registerForCaptivePluginListChangedNotification;
- (void)registerForDynamicStoreChanges;
- (void)registerForUserActivityNotifications;
- (void)setCaptiveOutage:(BOOL)a3;
- (void)setCaptiveOutageWaitingForUserActivity:(BOOL)a3;
- (void)setConfigFetchOnNetworkChange:(BOOL)a3;
- (void)setConfigurationFetchDate:(id)a3;
- (void)setConfigurationFetchInterval:(int64_t)a3;
- (void)setConfigurationFetchTimer:(id)a3;
- (void)setDirectPathProbeDate:(id)a3;
- (void)setDirectPathProbeInterval:(int64_t)a3;
- (void)setDirectPathProbeOnNetworkChange:(BOOL)a3;
- (void)setDirectPathProbeTimer:(id)a3;
- (void)setDynamicStore:(__SCDynamicStore *)a3;
- (void)setEventToken:(unint64_t)a3;
- (void)setIsObservingPath:(BOOL)a3;
- (void)setLocationMonitorInterval:(double)a3;
- (void)setLocationMonitorTimer:(id)a3;
- (void)setNonwifiNetworkSignature:(id)a3;
- (void)setODoHAuthOutageRestoreInterval:(int64_t)a3;
- (void)setODoHRestoreInterval:(int64_t)a3;
- (void)setOdohAuthOutageRestoreDate:(id)a3;
- (void)setOdohAuthOutageRestoreTimer:(id)a3;
- (void)setOdohRestoreDate:(id)a3;
- (void)setOdohRestoreTimer:(id)a3;
- (void)setProvider:(void *)a3;
- (void)setProxyPathProbeDate:(id)a3;
- (void)setProxyPathProbeInterval:(int64_t)a3;
- (void)setProxyPathProbeOnNetworkChange:(BOOL)a3;
- (void)setProxyPathProbeTimer:(id)a3;
- (void)setProxyRestoreDate:(id)a3;
- (void)setProxyRestoreInterval:(int64_t)a3;
- (void)setProxyRestoreTimer:(id)a3;
- (void)setResurrectionDate:(id)a3;
- (void)setResurrectionInterval:(int64_t)a3;
- (void)setResurrectionTimer:(id)a3;
- (void)setSubscriptionCheckDate:(id)a3;
- (void)setSubscriptionCheckInterval:(int64_t)a3;
- (void)setSubscriptionCheckOnNetworkChange:(BOOL)a3;
- (void)setSubscriptionCheckTimer:(id)a3;
- (void)setTokenFetchDate:(id)a3;
- (void)setTokenFetchInterval:(int64_t)a3;
- (void)setTokenFetchOnNetworkChange:(BOOL)a3;
- (void)setTokenFetchTimer:(id)a3;
- (void)setTokenIssuanceRestrictedUntilDate:(id)a3;
- (void)setTokenIssuanceRestrictedUntilInterval:(int64_t)a3;
- (void)setTokenIssuanceRestrictedUntilTimer:(id)a3;
- (void)setUserActivityNotificationHandle:(unint64_t)a3;
- (void)setWifiNetworkSignature:(id)a3;
- (void)unregisterForUserActivityNotifications;
- (void)unwatchForPathChanges;
- (void)watchForPathChanges;
@end

@implementation NPUserEventAgent

+ (id)sharedAgent
{
  if (qword_17E60 != -1) {
    dispatch_once(&qword_17E60, &stru_14A00);
  }
  return (id)qword_17E58;
}

- (void)setResurrectionInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent resurrectionTimer](self, "resurrectionTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent resurrectionTimer](self, "resurrectionTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setResurrectionTimer:](self, "setResurrectionTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setResurrectionDate:](self, "setResurrectionDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setResurrectionDate:](self, "setResurrectionDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent resurrectionDate](self, "resurrectionDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent resurrectionDate](self, "resurrectionDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14A40,  0.0);
      -[NPUserEventAgent setResurrectionTimer:](self, "setResurrectionTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent resurrectionTimer](self, "resurrectionTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent resurrectionTimer](self, "resurrectionTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BED4();
        }
      }
    }
  }

- (void)setConfigurationFetchInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent configurationFetchTimer](self, "configurationFetchTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent configurationFetchTimer](self, "configurationFetchTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setConfigurationFetchTimer:](self, "setConfigurationFetchTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setConfigurationFetchDate:](self, "setConfigurationFetchDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setConfigurationFetchDate:](self, "setConfigurationFetchDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent configurationFetchDate](self, "configurationFetchDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent configurationFetchDate](self, "configurationFetchDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14A60,  0.0);
      -[NPUserEventAgent setConfigurationFetchTimer:](self, "setConfigurationFetchTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent configurationFetchTimer](self, "configurationFetchTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent configurationFetchTimer](self, "configurationFetchTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BF00();
        }
      }
    }
  }

- (void)setTokenFetchInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenFetchTimer](self, "tokenFetchTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenFetchTimer](self, "tokenFetchTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setTokenFetchTimer:](self, "setTokenFetchTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setTokenFetchDate:](self, "setTokenFetchDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setTokenFetchDate:](self, "setTokenFetchDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenFetchDate](self, "tokenFetchDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenFetchDate](self, "tokenFetchDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14A80,  0.0);
      -[NPUserEventAgent setTokenFetchTimer:](self, "setTokenFetchTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenFetchTimer](self, "tokenFetchTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenFetchTimer](self, "tokenFetchTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BF2C();
        }
      }
    }
  }

- (void)setTokenIssuanceRestrictedUntilInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenIssuanceRestrictedUntilTimer](self, "tokenIssuanceRestrictedUntilTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenIssuanceRestrictedUntilTimer](self, "tokenIssuanceRestrictedUntilTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setTokenIssuanceRestrictedUntilTimer:](self, "setTokenIssuanceRestrictedUntilTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setTokenIssuanceRestrictedUntilDate:](self, "setTokenIssuanceRestrictedUntilDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setTokenIssuanceRestrictedUntilDate:](self, "setTokenIssuanceRestrictedUntilDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14AA0,  0.0);
      -[NPUserEventAgent setTokenIssuanceRestrictedUntilTimer:](self, "setTokenIssuanceRestrictedUntilTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenIssuanceRestrictedUntilTimer](self, "tokenIssuanceRestrictedUntilTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent tokenIssuanceRestrictedUntilTimer](self, "tokenIssuanceRestrictedUntilTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BF58();
        }
      }
    }
  }

- (void)setSubscriptionCheckInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent subscriptionCheckTimer](self, "subscriptionCheckTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent subscriptionCheckTimer](self, "subscriptionCheckTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setSubscriptionCheckTimer:](self, "setSubscriptionCheckTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setSubscriptionCheckDate:](self, "setSubscriptionCheckDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setSubscriptionCheckDate:](self, "setSubscriptionCheckDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent subscriptionCheckDate](self, "subscriptionCheckDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent subscriptionCheckDate](self, "subscriptionCheckDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14AC0,  0.0);
      -[NPUserEventAgent setSubscriptionCheckTimer:](self, "setSubscriptionCheckTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent subscriptionCheckTimer](self, "subscriptionCheckTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent subscriptionCheckTimer](self, "subscriptionCheckTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BF84();
        }
      }
    }
  }

- (void)setProxyRestoreInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyRestoreTimer](self, "proxyRestoreTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyRestoreTimer](self, "proxyRestoreTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setProxyRestoreTimer:](self, "setProxyRestoreTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setProxyRestoreDate:](self, "setProxyRestoreDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setProxyRestoreDate:](self, "setProxyRestoreDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyRestoreDate](self, "proxyRestoreDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyRestoreDate](self, "proxyRestoreDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14AE0,  0.0);
      -[NPUserEventAgent setProxyRestoreTimer:](self, "setProxyRestoreTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyRestoreTimer](self, "proxyRestoreTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyRestoreTimer](self, "proxyRestoreTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BFB0();
        }
      }
    }
  }

- (void)setODoHRestoreInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohRestoreTimer](self, "odohRestoreTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohRestoreTimer](self, "odohRestoreTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setOdohRestoreTimer:](self, "setOdohRestoreTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setOdohRestoreDate:](self, "setOdohRestoreDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setOdohRestoreDate:](self, "setOdohRestoreDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohRestoreDate](self, "odohRestoreDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohRestoreDate](self, "odohRestoreDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14B00,  0.0);
      -[NPUserEventAgent setOdohRestoreTimer:](self, "setOdohRestoreTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohRestoreTimer](self, "odohRestoreTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohRestoreTimer](self, "odohRestoreTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_BFDC();
        }
      }
    }
  }

- (void)setODoHAuthOutageRestoreInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohAuthOutageRestoreTimer](self, "odohAuthOutageRestoreTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohAuthOutageRestoreTimer](self, "odohAuthOutageRestoreTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setOdohAuthOutageRestoreTimer:](self, "setOdohAuthOutageRestoreTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setOdohAuthOutageRestoreDate:](self, "setOdohAuthOutageRestoreDate:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setOdohAuthOutageRestoreDate:](self, "setOdohAuthOutageRestoreDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohAuthOutageRestoreDate](self, "odohAuthOutageRestoreDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohAuthOutageRestoreDate](self, "odohAuthOutageRestoreDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14B20,  0.0);
      -[NPUserEventAgent setOdohAuthOutageRestoreTimer:](self, "setOdohAuthOutageRestoreTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohAuthOutageRestoreTimer](self, "odohAuthOutageRestoreTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent odohAuthOutageRestoreTimer](self, "odohAuthOutageRestoreTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_C008();
        }
      }
    }
  }

- (void)setProxyPathProbeInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyPathProbeTimer](self, "proxyPathProbeTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyPathProbeTimer](self, "proxyPathProbeTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setProxyPathProbeTimer:](self, "setProxyPathProbeTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setProxyPathProbeTimer:](self, "setProxyPathProbeTimer:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setProxyPathProbeDate:](self, "setProxyPathProbeDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyPathProbeDate](self, "proxyPathProbeDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyPathProbeDate](self, "proxyPathProbeDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14B40,  0.0);
      -[NPUserEventAgent setProxyPathProbeTimer:](self, "setProxyPathProbeTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyPathProbeTimer](self, "proxyPathProbeTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent proxyPathProbeTimer](self, "proxyPathProbeTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_C034();
        }
      }
    }
  }

- (void)setDirectPathProbeInterval:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent directPathProbeTimer](self, "directPathProbeTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent directPathProbeTimer](self, "directPathProbeTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setDirectPathProbeTimer:](self, "setDirectPathProbeTimer:", 0LL);
  }

  if (a3 < 1)
  {
    -[NPUserEventAgent setDirectPathProbeTimer:](self, "setDirectPathProbeTimer:", 0LL);
  }

  else
  {
    v7 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)a3);
    -[NPUserEventAgent setDirectPathProbeDate:](self, "setDirectPathProbeDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent directPathProbeDate](self, "directPathProbeDate"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSTimer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent directPathProbeDate](self, "directPathProbeDate"));
      v13 = -[NSTimer initWithFireDate:interval:repeats:block:]( v11,  "initWithFireDate:interval:repeats:block:",  v12,  0LL,  &stru_14B60,  0.0);
      -[NPUserEventAgent setDirectPathProbeTimer:](self, "setDirectPathProbeTimer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent directPathProbeTimer](self, "directPathProbeTimer"));
      if (v14)
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent directPathProbeTimer](self, "directPathProbeTimer"));
        [v18 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }

      else
      {
        id v16 = nplog_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_C060();
        }
      }
    }
  }

- (void)setLocationMonitorInterval:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent locationMonitorTimer](self, "locationMonitorTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent locationMonitorTimer](self, "locationMonitorTimer"));
    [v6 invalidate];

    -[NPUserEventAgent setLocationMonitorTimer:](self, "setLocationMonitorTimer:", 0LL);
  }

  if (a3 >= 300.0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_9E9C;
    v12[3] = &unk_14B88;
    v12[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  0LL,  v12,  a3));
    -[NPUserEventAgent setLocationMonitorTimer:](self, "setLocationMonitorTimer:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent locationMonitorTimer](self, "locationMonitorTimer"));
    if (v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent locationMonitorTimer](self, "locationMonitorTimer"));
      [v9 addTimer:v10 forMode:NSDefaultRunLoopMode];
    }

    else
    {
      id v11 = nplog_obj();
      double v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_C08C();
      }
    }
  }

- (void)watchForPathChanges
{
  if (!-[NPUserEventAgent isObservingPath](self, "isObservingPath"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
    [v3 addObserver:self forKeyPath:@"path" options:0 context:0];

    -[NPUserEventAgent setIsObservingPath:](self, "setIsObservingPath:", 1LL);
  }

- (void)unwatchForPathChanges
{
  if (-[NPUserEventAgent isObservingPath](self, "isObservingPath"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
    [v3 removeObserver:self forKeyPath:@"path"];

    -[NPUserEventAgent setIsObservingPath:](self, "setIsObservingPath:", 0LL);
  }

- (void)registerForCaptivePluginListChangedNotification
{
  if (qword_17E68 != -1) {
    dispatch_once(&qword_17E68, &stru_14BA8);
  }
}

- (void)registerForUserActivityNotifications
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_A1C4;
  block[3] = &unk_14930;
  block[4] = self;
  if (qword_17E70 != -1) {
    dispatch_once(&qword_17E70, block);
  }
}

- (void)unregisterForUserActivityNotifications
{
  if (-[NPUserEventAgent userActivityNotificationHandle](self, "userActivityNotificationHandle")) {
    IOPMUnregisterNotification(-[NPUserEventAgent userActivityNotificationHandle](self, "userActivityNotificationHandle"));
  }
}

- (void)registerForDynamicStoreChanges
{
  if (!-[NPUserEventAgent dynamicStore](self, "dynamicStore"))
  {
    -[NPUserEventAgent setDynamicStore:]( self,  "setDynamicStore:",  SCDynamicStoreCreate( kCFAllocatorDefault,  @"networkserviceproxy event agent",  (SCDynamicStoreCallBack)sub_A52C,  0LL));
    if (-[NPUserEventAgent dynamicStore](self, "dynamicStore"))
    {
      v3 = -[NPUserEventAgent dynamicStore](self, "dynamicStore");
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      LODWORD(v3) = SCDynamicStoreSetDispatchQueue(v3, v5);

      if ((_DWORD)v3)
      {
        CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetPvD);
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(NetworkServiceEntity);
        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  kSCCompAnyRegex,  0LL);
        double v9 = (void *)objc_claimAutoreleasedReturnValue(NetworkInterfaceEntity);
        v14[0] = v9;
        v14[1] = v7;
        if (!SCDynamicStoreSetNotificationKeys( -[NPUserEventAgent dynamicStore](self, "dynamicStore"),  0LL,  (CFArrayRef)+[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v14,  2LL)))
        {
          id v10 = nplog_obj();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_C234();
          }
        }
      }

      else
      {
        id v13 = nplog_obj();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_C1C4();
        }
      }
    }

    else
    {
      id v12 = nplog_obj();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_C154();
      }
    }
  }

- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  double v9 = self;
  objc_sync_enter(v9);
  if (a3 == 1 && v8)
  {
    -[NPUserEventAgent setEventToken:](v9, "setEventToken:", a4);
    int int64 = xpc_dictionary_get_int64(v8, "PID");
    if (int64)
    {
      id v11 = nplog_obj();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v50) = 67109120;
        DWORD1(v50) = int64;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Got pid %d", (uint8_t *)&v50, 8u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
      [v13 launchOwner];
    }

    if (xpc_dictionary_get_int64(v8, "ResurrectionDate")) {
      -[NPUserEventAgent setResurrectionInterval:]( v9,  "setResurrectionInterval:",  xpc_dictionary_get_int64(v8, "ResurrectionDate"));
    }
    if (xpc_dictionary_get_int64(v8, "ConfigFetchDate")) {
      -[NPUserEventAgent setConfigurationFetchInterval:]( v9,  "setConfigurationFetchInterval:",  xpc_dictionary_get_int64(v8, "ConfigFetchDate"));
    }
    if (!xpc_dictionary_get_int64(v8, "ConfigFetchOnNetworkChange"))
    {
LABEL_19:
      if (xpc_dictionary_get_double(v8, "LocationMonitorTimeInterval") != 0.0) {
        -[NPUserEventAgent setLocationMonitorInterval:]( v9,  "setLocationMonitorInterval:",  xpc_dictionary_get_double(v8, "LocationMonitorTimeInterval"));
      }
      if (xpc_dictionary_get_int64(v8, "TokenFetchDate")) {
        -[NPUserEventAgent setTokenFetchInterval:]( v9,  "setTokenFetchInterval:",  xpc_dictionary_get_int64(v8, "TokenFetchDate"));
      }
      if (!xpc_dictionary_get_int64(v8, "TokenFetchOnNetworkChange"))
      {
LABEL_31:
        if (xpc_dictionary_get_int64(v8, "TokenIssuanceRestrictedUntilDate")) {
          -[NPUserEventAgent setTokenIssuanceRestrictedUntilInterval:]( v9,  "setTokenIssuanceRestrictedUntilInterval:",  xpc_dictionary_get_int64(v8, "TokenIssuanceRestrictedUntilDate"));
        }
        if (!xpc_dictionary_get_int64(v8, "SubscriptionCheckOnNetworkChange"))
        {
LABEL_41:
          if (xpc_dictionary_get_int64(v8, "SubscriptionCheckDate")) {
            -[NPUserEventAgent setSubscriptionCheckInterval:]( v9,  "setSubscriptionCheckInterval:",  xpc_dictionary_get_int64(v8, "SubscriptionCheckDate"));
          }
          if (xpc_dictionary_get_int64(v8, "ProxyRestoreDate")) {
            -[NPUserEventAgent setProxyRestoreInterval:]( v9,  "setProxyRestoreInterval:",  xpc_dictionary_get_int64(v8, "ProxyRestoreDate"));
          }
          if (xpc_dictionary_get_int64(v8, "ODoHRestoreDate")) {
            -[NPUserEventAgent setODoHRestoreInterval:]( v9,  "setODoHRestoreInterval:",  xpc_dictionary_get_int64(v8, "ODoHRestoreDate"));
          }
          if (xpc_dictionary_get_int64(v8, "odohAuthRestoreDate")) {
            -[NPUserEventAgent setODoHAuthOutageRestoreInterval:]( v9,  "setODoHAuthOutageRestoreInterval:",  xpc_dictionary_get_int64(v8, "odohAuthRestoreDate"));
          }
          if (xpc_dictionary_get_int64(v8, "ProxyPathProber")) {
            -[NPUserEventAgent setProxyPathProbeInterval:]( v9,  "setProxyPathProbeInterval:",  xpc_dictionary_get_int64(v8, "ProxyPathProber"));
          }
          if (!xpc_dictionary_get_int64(v8, "ProxyPathProbeOnNetworkChange"))
          {
LABEL_59:
            if (xpc_dictionary_get_int64(v8, "DirectPathProber")) {
              -[NPUserEventAgent setDirectPathProbeInterval:]( v9,  "setDirectPathProbeInterval:",  xpc_dictionary_get_int64(v8, "DirectPathProber"));
            }
            if (!xpc_dictionary_get_int64(v8, "DirectPathProbeOnNetworkChange"))
            {
LABEL_69:
              int64_t v39 = xpc_dictionary_get_int64(v8, "CaptiveOutage");
              if (v39 == 1)
              {
                id v40 = nplog_obj();
                v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v50) = 136315138;
                  *(void *)((char *)&v50 + 4) = "CaptiveOutage";
                  v42 = "[%s] changed to true";
LABEL_75:
                  _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v50, 0xCu);
                }
              }

              else
              {
                id v43 = nplog_obj();
                v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v50) = 136315138;
                  *(void *)((char *)&v50 + 4) = "CaptiveOutage";
                  v42 = "[%s] changed to false";
                  goto LABEL_75;
                }
              }

              -[NPUserEventAgent setCaptiveOutage:](v9, "setCaptiveOutage:", v39 == 1);
LABEL_77:
              if (!xpc_dictionary_get_int64(v8, "CaptiveOutageWaitingForUserActivity"))
              {
LABEL_85:
                -[NPUserEventAgent registerForCaptivePluginListChangedNotification]( v9,  "registerForCaptivePluginListChangedNotification",  v50);
                -[NPUserEventAgent registerForDynamicStoreChanges](v9, "registerForDynamicStoreChanges");
                -[NPUserEventAgent registerForUserActivityNotifications](v9, "registerForUserActivityNotifications");
                v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
                [v49 setReceivedEventToken:1];

                goto LABEL_86;
              }

              int64_t v44 = xpc_dictionary_get_int64(v8, "CaptiveOutageWaitingForUserActivity");
              if (v44 == 1)
              {
                id v45 = nplog_obj();
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v50) = 136315138;
                  *(void *)((char *)&v50 + 4) = "CaptiveOutageWaitingForUserActivity";
                  v47 = "[%s] changed to true";
LABEL_83:
                  _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, v47, (uint8_t *)&v50, 0xCu);
                }
              }

              else
              {
                id v48 = nplog_obj();
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v50) = 136315138;
                  *(void *)((char *)&v50 + 4) = "CaptiveOutageWaitingForUserActivity";
                  v47 = "[%s] changed to false";
                  goto LABEL_83;
                }
              }

              -[NPUserEventAgent setCaptiveOutageWaitingForUserActivity:]( v9,  "setCaptiveOutageWaitingForUserActivity:",  v44 == 1);
              goto LABEL_85;
            }

            int64_t v34 = xpc_dictionary_get_int64(v8, "DirectPathProbeOnNetworkChange");
            if (v34 == 1)
            {
              id v35 = nplog_obj();
              v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v50) = 0;
                v37 = "Got direct path probe on network change";
LABEL_67:
                _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v50, 2u);
              }
            }

            else
            {
              id v38 = nplog_obj();
              v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v50) = 0;
                v37 = "Reset direct path on network change";
                goto LABEL_67;
              }
            }

            -[NPUserEventAgent setDirectPathProbeOnNetworkChange:](v9, "setDirectPathProbeOnNetworkChange:", v34 == 1);
            goto LABEL_69;
          }

          int64_t v29 = xpc_dictionary_get_int64(v8, "ProxyPathProbeOnNetworkChange");
          if (v29 == 1)
          {
            id v30 = nplog_obj();
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v50) = 0;
              v32 = "Got proxy path probe on network change";
LABEL_57:
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v50, 2u);
            }
          }

          else
          {
            id v33 = nplog_obj();
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v50) = 0;
              v32 = "Reset proxy path probe on network change";
              goto LABEL_57;
            }
          }

          -[NPUserEventAgent setProxyPathProbeOnNetworkChange:](v9, "setProxyPathProbeOnNetworkChange:", v29 == 1);
          goto LABEL_59;
        }

        int64_t v24 = xpc_dictionary_get_int64(v8, "SubscriptionCheckOnNetworkChange");
        if (v24 == 1)
        {
          id v25 = nplog_obj();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v50) = 0;
            v27 = "Got subscription check on network change";
LABEL_39:
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v50, 2u);
          }
        }

        else
        {
          id v28 = nplog_obj();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v50) = 0;
            v27 = "Reset token fetch on network change";
            goto LABEL_39;
          }
        }

        -[NPUserEventAgent setSubscriptionCheckOnNetworkChange:](v9, "setSubscriptionCheckOnNetworkChange:", v24 == 1);
        goto LABEL_41;
      }

      int64_t v19 = xpc_dictionary_get_int64(v8, "TokenFetchOnNetworkChange");
      if (v19 == 1)
      {
        id v20 = nplog_obj();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v50) = 0;
          v22 = "Got token fetch on network change";
LABEL_29:
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v50, 2u);
        }
      }

      else
      {
        id v23 = nplog_obj();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v50) = 0;
          v22 = "Reset token fetch on network change";
          goto LABEL_29;
        }
      }

      -[NPUserEventAgent setTokenFetchOnNetworkChange:](v9, "setTokenFetchOnNetworkChange:", v19 == 1);
      goto LABEL_31;
    }

    int64_t v14 = xpc_dictionary_get_int64(v8, "ConfigFetchOnNetworkChange");
    if (v14 == 1)
    {
      id v15 = nplog_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        v17 = "Got config fetch on network change";
LABEL_17:
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v50, 2u);
      }
    }

    else
    {
      id v18 = nplog_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        v17 = "Reset config fetch on network change";
        goto LABEL_17;
      }
    }

    -[NPUserEventAgent setConfigFetchOnNetworkChange:](v9, "setConfigFetchOnNetworkChange:", v14 == 1);
    goto LABEL_19;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v62 = v11;
  if ([v10 isEqualToString:@"path"])
  {
    id v13 = self;
    objc_sync_enter(v13);
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    id v16 = (char *)[v15 status];

    if (v16 != (_BYTE *)&dword_0 + 1)
    {
      -[NPUserEventAgent setWifiNetworkSignature:](v13, "setWifiNetworkSignature:", 0LL);
LABEL_47:
      objc_sync_exit(v13);

      goto LABEL_48;
    }

    if (-[NPUserEventAgent configFetchOnNetworkChange](v13, "configFetchOnNetworkChange"))
    {
      id v17 = nplog_obj();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Triggering configuration fetch on network change", buf, 2u);
      }

      -[NPUserEventAgent setConfigFetchOnNetworkChange:](v13, "setConfigFetchOnNetworkChange:", 0LL);
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
      [v19 launchOwner];
    }

    if (-[NPUserEventAgent tokenFetchOnNetworkChange](v13, "tokenFetchOnNetworkChange"))
    {
      id v20 = nplog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Triggering token fetch on network change", buf, 2u);
      }

      -[NPUserEventAgent setTokenFetchOnNetworkChange:](v13, "setTokenFetchOnNetworkChange:", 0LL);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
      [v22 launchOwner];
    }

    if (-[NPUserEventAgent subscriptionCheckOnNetworkChange](v13, "subscriptionCheckOnNetworkChange"))
    {
      id v23 = nplog_obj();
      int64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Triggering subscription check on network change", buf, 2u);
      }

      -[NPUserEventAgent setSubscriptionCheckOnNetworkChange:](v13, "setSubscriptionCheckOnNetworkChange:", 0LL);
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
      [v25 launchOwner];
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 interface]);
    BOOL v29 = [v28 type] == (char *)&dword_0 + 1;

    if (v29)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 path]);
      id v32 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:]( &OBJC_CLASS___NPUtilities,  "copyCurrentNetworkCharacteristicsForPath:",  v31);

      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"Signature"]);
      uint64_t v34 = (uint64_t)(id)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent wifiNetworkSignature](v13, "wifiNetworkSignature"));
      unint64_t v35 = v33;
      v36 = (void *)v35;
      if (!(v35 | v34) || v35 && v34 && [(id)v34 isEqual:v35])
      {
      }

      else
      {

        id v37 = nplog_obj();
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "WiFi signature changed", buf, 2u);
        }

        -[NPUserEventAgent setWifiNetworkSignature:](v13, "setWifiNetworkSignature:", v36);
        uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
        [(id)v34 launchOwner];
      }
    }

    else
    {
      -[NPUserEventAgent setWifiNetworkSignature:](v13, "setWifiNetworkSignature:", 0LL);
    }

    int64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 interface]);
    if ([v41 type] == (char *)&dword_0 + 2)
    {
    }

    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 path]);
      int64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 interface]);
      BOOL v45 = [v44 type] == (char *)&dword_0 + 3;

      if (!v45)
      {
        -[NPUserEventAgent setNonwifiNetworkSignature:](v13, "setNonwifiNetworkSignature:", 0LL);
        goto LABEL_47;
      }
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 path]);
    id v48 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:]( &OBJC_CLASS___NPUtilities,  "copyCurrentNetworkCharacteristicsForPath:",  v47);

    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"Signature"]);
    uint64_t v50 = (uint64_t)(id)objc_claimAutoreleasedReturnValue(-[NPUserEventAgent nonwifiNetworkSignature](v13, "nonwifiNetworkSignature"));
    unint64_t v51 = v49;
    v52 = (void *)v51;
    if (!(v51 | v50) || v51 && v50 && [(id)v50 isEqual:v51])
    {
    }

    else
    {

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v53 path]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 interface]);
      v56 = (char *)[v55 type];

      id v57 = nplog_obj();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = "Ethernet";
        if (v56 == (_BYTE *)&dword_0 + 2) {
          v59 = "Cellular";
        }
        *(_DWORD *)buf = 136315138;
        v65 = v59;
        _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "%s signature changed", buf, 0xCu);
      }

      -[NPUserEventAgent setNonwifiNetworkSignature:](v13, "setNonwifiNetworkSignature:", v52);
      if (!-[NPUserEventAgent captiveOutage](v13, "captiveOutage")) {
        goto LABEL_45;
      }
      id v60 = nplog_obj();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "captive outage is true, launching NSP", buf, 2u);
      }

      uint64_t v50 = objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
      [(id)v50 launchOwner];
    }

LABEL_45:
    goto LABEL_47;
  }

  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___NPUserEventAgent;
  -[NPUserEventAgent observeValueForKeyPath:ofObject:change:context:]( &v63,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_48:
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

- (NSDate)resurrectionDate
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setResurrectionDate:(id)a3
{
}

- (NSDate)configurationFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConfigurationFetchDate:(id)a3
{
}

- (NSDate)tokenFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTokenFetchDate:(id)a3
{
}

- (NSDate)tokenIssuanceRestrictedUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTokenIssuanceRestrictedUntilDate:(id)a3
{
}

- (NSDate)subscriptionCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSubscriptionCheckDate:(id)a3
{
}

- (NSDate)proxyRestoreDate
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setProxyRestoreDate:(id)a3
{
}

- (NSDate)odohRestoreDate
{
  return (NSDate *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOdohRestoreDate:(id)a3
{
}

- (NSDate)odohAuthOutageRestoreDate
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOdohAuthOutageRestoreDate:(id)a3
{
}

- (NSDate)proxyPathProbeDate
{
  return (NSDate *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setProxyPathProbeDate:(id)a3
{
}

- (NSDate)directPathProbeDate
{
  return (NSDate *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDirectPathProbeDate:(id)a3
{
}

- (unint64_t)eventToken
{
  return self->_eventToken;
}

- (void)setEventToken:(unint64_t)a3
{
  self->_eventToken = a3;
}

- (NSTimer)resurrectionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setResurrectionTimer:(id)a3
{
}

- (NSTimer)configurationFetchTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setConfigurationFetchTimer:(id)a3
{
}

- (NSTimer)locationMonitorTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setLocationMonitorTimer:(id)a3
{
}

- (NSTimer)tokenFetchTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setTokenFetchTimer:(id)a3
{
}

- (BOOL)configFetchOnNetworkChange
{
  return self->_configFetchOnNetworkChange;
}

- (void)setConfigFetchOnNetworkChange:(BOOL)a3
{
  self->_configFetchOnNetworkChange = a3;
}

- (BOOL)tokenFetchOnNetworkChange
{
  return self->_tokenFetchOnNetworkChange;
}

- (void)setTokenFetchOnNetworkChange:(BOOL)a3
{
  self->_tokenFetchOnNetworkChange = a3;
}

- (BOOL)subscriptionCheckOnNetworkChange
{
  return self->_subscriptionCheckOnNetworkChange;
}

- (void)setSubscriptionCheckOnNetworkChange:(BOOL)a3
{
  self->_subscriptionCheckOnNetworkChange = a3;
}

- (BOOL)proxyPathProbeOnNetworkChange
{
  return self->_proxyPathProbeOnNetworkChange;
}

- (void)setProxyPathProbeOnNetworkChange:(BOOL)a3
{
  self->_proxyPathProbeOnNetworkChange = a3;
}

- (BOOL)directPathProbeOnNetworkChange
{
  return self->_directPathProbeOnNetworkChange;
}

- (void)setDirectPathProbeOnNetworkChange:(BOOL)a3
{
  self->_directPathProbeOnNetworkChange = a3;
}

- (BOOL)isObservingPath
{
  return self->_isObservingPath;
}

- (void)setIsObservingPath:(BOOL)a3
{
  self->_isObservingPath = a3;
}

- (NSTimer)tokenIssuanceRestrictedUntilTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setTokenIssuanceRestrictedUntilTimer:(id)a3
{
}

- (NSTimer)subscriptionCheckTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSubscriptionCheckTimer:(id)a3
{
}

- (NSTimer)proxyRestoreTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setProxyRestoreTimer:(id)a3
{
}

- (NSTimer)odohRestoreTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setOdohRestoreTimer:(id)a3
{
}

- (NSTimer)odohAuthOutageRestoreTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setOdohAuthOutageRestoreTimer:(id)a3
{
}

- (NSTimer)proxyPathProbeTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setProxyPathProbeTimer:(id)a3
{
}

- (NSTimer)directPathProbeTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setDirectPathProbeTimer:(id)a3
{
}

- (__SCDynamicStore)dynamicStore
{
  return self->_dynamicStore;
}

- (void)setDynamicStore:(__SCDynamicStore *)a3
{
  self->_dynamicStore = a3;
}

- (NSData)wifiNetworkSignature
{
  return (NSData *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setWifiNetworkSignature:(id)a3
{
}

- (NSData)nonwifiNetworkSignature
{
  return (NSData *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setNonwifiNetworkSignature:(id)a3
{
}

- (BOOL)captiveOutage
{
  return self->_captiveOutage;
}

- (void)setCaptiveOutage:(BOOL)a3
{
  self->_captiveOutage = a3;
}

- (BOOL)captiveOutageWaitingForUserActivity
{
  return self->_captiveOutageWaitingForUserActivity;
}

- (void)setCaptiveOutageWaitingForUserActivity:(BOOL)a3
{
  self->_captiveOutageWaitingForUserActivity = a3;
}

- (unint64_t)userActivityNotificationHandle
{
  return self->_userActivityNotificationHandle;
}

- (void)setUserActivityNotificationHandle:(unint64_t)a3
{
  self->_userActivityNotificationHandle = a3;
}

- (void).cxx_destruct
{
}

@end