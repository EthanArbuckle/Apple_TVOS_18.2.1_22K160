@interface OcelotManager
- (OcelotManager)init;
- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4;
- (void)_handleNetworkStateDidChangeNotification:(id)a3;
- (void)_handleRepairBundleIDNotification:(id)a3;
- (void)decorateMetricsEvent:(id)a3 context:(id)a4;
@end

@implementation OcelotManager

- (OcelotManager)init
{
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___OcelotManager;
  v2 = -[AppUsageBaseManager init](&v55, "init");
  if (v2)
  {
    id v3 = sub_10019DC98((uint64_t)&OBJC_CLASS___AccountEventCoordinator);
    v2->_appStoreCacheUpdatedNotificationToken = -1;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appstored.OcelotManager.background", v5);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstored.OcelotManager.callout", v9);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.appstored.OcelotManager.dispatch", v13);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.appstored.OcelotManager.distNotification", v17);
    distNotificationQueue = v2->_distNotificationQueue;
    v2->_distNotificationQueue = (OS_dispatch_queue *)v18;

    id v20 = sub_10022D1B4((uint64_t)v2);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    hardwareFamily = v2->_hardwareFamily;
    v2->_hardwareFamily = (NSString *)v21;

    id v23 = sub_10022D27C(v2);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    hardwareModel = v2->_hardwareModel;
    v2->_hardwareModel = (NSString *)v24;

    v26 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v26;

    v28 = sub_10022D2E4((__CFString *)v2);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    os = v2->_os;
    v2->_os = (NSString *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[AMSDevice buildVersion](&OBJC_CLASS___AMSDevice, "buildVersion"));
    osBuild = v2->_osBuild;
    v2->_osBuild = (NSString *)v31;

    dispatch_queue_attr_t v33 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v33);
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.appstored.OcelotManager.sbsync", v34);
    sbsyncQueue = v2->_sbsyncQueue;
    v2->_sbsyncQueue = (OS_dispatch_queue *)v35;

    v37 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v37;

    dispatch_queue_attr_t v39 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v40 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v39);
    dispatch_queue_t v41 = dispatch_queue_create("com.apple.appstored.OcelotManager.topApps", v40);
    topAppsQueue = v2->_topAppsQueue;
    v2->_topAppsQueue = (OS_dispatch_queue *)v41;

    dispatch_queue_attr_t v43 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v43);
    dispatch_queue_t v45 = dispatch_queue_create("com.apple.appstored.OcelotManager.upsell", v44);
    upsellQueue = v2->_upsellQueue;
    v2->_upsellQueue = (OS_dispatch_queue *)v45;

    id v47 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    unsigned __int8 v49 = [v48 isHRNMode];

    if ((v49 & 1) == 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v50 addObserver:v2 selector:"_handleRepairBundleIDNotification:" name:@"com.apple.appstored.ASDRepairBundleID" object:0];

      v51 = (dispatch_queue_s *)v2->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002A44F4;
      block[3] = &unk_1003E9880;
      v54 = v2;
      dispatch_async(v51, block);
    }
  }

  return v2;
}

- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4
{
  unsigned int v4 = a3;
  dispatch_queue_t v6 = a4;
  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v8 = sub_10022CE24(self, v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ([v9 count])
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v28 = v9;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      uint64_t v29 = self;
      v30 = v7;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v13);
          uint64_t v15 = ASDLogHandleForCategory(3LL);
          dispatch_queue_attr_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            if (v6) {
              v17 = (void *)v6[9];
            }
            else {
              v17 = 0LL;
            }
            id v18 = v17;
            id v19 = sub_1001ABC24(v14);
            id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            uint64_t v21 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, v4);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            *(_DWORD *)buf = 138412802;
            id v37 = v18;
            __int16 v38 = 2114;
            dispatch_queue_attr_t v39 = v20;
            __int16 v40 = 2114;
            dispatch_queue_t v41 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] Adding event for app with type: %{public}@",  buf,  0x20u);

            self = v29;
            v7 = v30;
          }

          id v23 = sub_10022BEF4(self, v14, v4, v6);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          -[NSMutableArray addObject:](v7, "addObject:", v24);

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v25 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
        id v11 = v25;
      }

      while (v25);
    }

    v9 = v28;
  }

  id v26 = -[NSMutableArray copy](v7, "copy");

  return v26;
}

- (void)decorateMetricsEvent:(id)a3 context:(id)a4
{
  dispatch_queue_t v6 = (id *)a3;
  v7 = (id *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

  v141 = v9;
  v142 = v6;
  sub_1002FB084(v6, v9);
  if (v7)
  {
    id v10 = v7[4];
    BOOL v11 = v10 == (id)3 || v10 == (id)7;
    if (v11)
    {
      [v6 setAnonymous:1];
      CFPropertyListRef v12 = sub_1002F93E4((uint64_t)&OBJC_CLASS___AppDefaultsManager);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }

    else
    {
      if (v10 != (id)4) {
        goto LABEL_12;
      }
      CFPropertyListRef v14 = sub_1002F9434((uint64_t)&OBJC_CLASS___AppDefaultsManager);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    uint64_t v15 = v13;
    if (v13)
    {
      sub_1002FB730(v6, v13);
    }
  }

- (void)_handleNetworkStateDidChangeNotification:(id)a3
{
  id v4 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = [v5 isConnected];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v8 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 removeObserver:self name:@"NetworkStateDidChangeNotification" object:v9];

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002ACCE8;
    block[3] = &unk_1003E9880;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_handleRepairBundleIDNotification:(id)a3
{
  id v4 = a3;
  distNotificationQueue = (dispatch_queue_s *)self->_distNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002AD160;
  block[3] = &unk_1003E9880;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(distNotificationQueue, block);
}

- (void).cxx_destruct
{
}

@end