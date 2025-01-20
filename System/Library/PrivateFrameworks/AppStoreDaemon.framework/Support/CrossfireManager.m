@interface CrossfireManager
- (CrossfireManager)init;
- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4;
- (void)_handleAnalyticsUsageSwitchChange:(id)a3;
- (void)decorateMetricsEvent:(id)a3 context:(id)a4;
@end

@implementation CrossfireManager

- (CrossfireManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CrossfireManager;
  v2 = -[AppUsageBaseManager init](&v24, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.CrossfireManager.callout", v4);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appstored.CrossfireManager.dispatch", v8);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v9;

    v2->_BOOL collectingMetrics = sub_10027356C((uint64_t)&OBJC_CLASS___Restrictions);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[AMSDevice buildVersion](&OBJC_CLASS___AMSDevice, "buildVersion"));
    osBuild = v2->_osBuild;
    v2->_osBuild = (NSString *)v11;

    v13 = sub_10022D2A0((__CFString *)v2);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    platform = v2->_platform;
    v2->_platform = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v17 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned __int8 v19 = [v18 isHRNMode];

    if ((v19 & 1) == 0) {
      [v16 addObserver:v2 selector:"_handleAnalyticsUsageSwitchChange:" name:MCEffectiveSettingsChangedNotification object:0];
    }
    uint64_t v20 = ASDLogHandleForCategory(3LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL collectingMetrics = v2->_collectingMetrics;
      *(_DWORD *)buf = 67109120;
      BOOL v26 = collectingMetrics;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[Crossfire] Initialized with initial analytics switch: %d",  buf,  8u);
    }
  }

  return v2;
}

- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  dispatch_queue_attr_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v8 = sub_10022CE24(self, v4, v6);
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ([v9 count])
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = sub_10022BEF4(self, *(void **)(*((void *)&v19 + 1) + 8LL * (void)v14), v4, v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          -[NSMutableArray addObject:](v7, "addObject:", v16, (void)v19);

          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }
  }

  id v17 = -[NSMutableArray copy](v7, "copy", (void)v19);

  return v17;
}

- (void)decorateMetricsEvent:(id)a3 context:(id)a4
{
  id v10 = (id *)a3;
  id v6 = a4;
  osBuild = self->_osBuild;
  if (osBuild) {
    sub_1002FB7F8(v10, osBuild);
  }
  platform = self->_platform;
  if (platform) {
    sub_1002FB85C(v10, platform);
  }
  [v10 setAnonymous:1];
  if (v6)
  {
    sub_1002FBA58(v10, v6[15]);
    uint64_t v9 = v6[11];
  }

  else
  {
    sub_1002FBA58(v10, 0LL);
    uint64_t v9 = 0LL;
  }

  sub_1002FB9F0(v10, v9);
  sub_1002FBAC0(v10, 1LL);
}

- (void)_handleAnalyticsUsageSwitchChange:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A8028;
  block[3] = &unk_1003E9880;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end