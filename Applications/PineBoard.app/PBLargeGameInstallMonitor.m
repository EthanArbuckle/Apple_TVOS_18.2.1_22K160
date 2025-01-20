@interface PBLargeGameInstallMonitor
- (BOOL)isActivated;
- (NSMutableDictionary)gameInstallItems;
- (OS_dispatch_queue_serial)queue;
- (PBAppInfoController)appInfoController;
- (PBBulletinService)bulletinService;
- (PBLargeGameInstallMonitor)init;
- (double)_largeGameInstallTimeThreshold;
- (void)_activate;
- (void)_handleGameAppInfoControllerUpdate:(id)a3;
- (void)_postLargeGameInstalledBulletinWithAppInfo:(id)a3;
- (void)activate;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)setActivated:(BOOL)a3;
- (void)setAppInfoController:(id)a3;
@end

@implementation PBLargeGameInstallMonitor

- (PBLargeGameInstallMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBLargeGameInstallMonitor;
  v2 = -[PBLargeGameInstallMonitor init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PBLargeGameInstallMonitor.queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue_serial *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    gameInstallItems = v2->_gameInstallItems;
    v2->_gameInstallItems = v5;
  }

  return v2;
}

- (void)activate
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3814;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  id v5 = a4;
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A38C4;
  v8[3] = &unk_1003CFEB8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "message", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeStringForKey:", @"PBLargeGameInstallMonitorBulletinKeyBundleIdentifier"));

  id v8 = sub_1000A3A60();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = PBSBulletinDismissalReasonDescription(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v15 = 138543618;
    v16 = v11;
    __int16 v17 = 2114;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Large game install bulletin has been dismissed. reason=%{public}@, bundleIndentifier=%{public}@",  (uint8_t *)&v15,  0x16u);
  }

  if (a5 == 1 && v7)
  {
    id v12 = sub_1000A3A60();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Launching game due to bulletin activation. bundleIndentifier=%{public}@",  (uint8_t *)&v15,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    [v14 openApplication:v7 launchURL:0 options:0 suspended:0 completion:0];
  }
}

- (void)_activate
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (!-[PBLargeGameInstallMonitor isActivated](self, "isActivated"))
  {
    id v4 = sub_1000A3A60();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating gaming intent monitor", v9, 2u);
    }

    -[PBLargeGameInstallMonitor setActivated:](self, "setActivated:", 1LL);
    v6 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    id v8 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v6,  "initWithInfoStore:filter:delegate:",  v7,  &stru_1003D4AD8,  self);

    -[PBLargeGameInstallMonitor setAppInfoController:](self, "setAppInfoController:", v8);
  }

- (PBBulletinService)bulletinService
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  bulletinService = self->_bulletinService;
  if (!bulletinService)
  {
    id v5 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
    v6 = self->_bulletinService;
    self->_bulletinService = v5;

    -[PBBulletinService setDelegate:](self->_bulletinService, "setDelegate:", self);
    bulletinService = self->_bulletinService;
  }

  return bulletinService;
}

- (void)_handleGameAppInfoControllerUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000A3A60();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10027A0F8((uint64_t)v4, v7);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v52 = v4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 removedAppInfos]);
  id v9 = [v8 countByEnumeratingWithState:&v63 objects:v77 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v64 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
        id v15 = sub_1000A3A60();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedName]);
          *(_DWORD *)buf = 138543618;
          v68 = v14;
          __int16 v69 = 2114;
          v70 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Detected game removal. bundleIdentifier=%{public}@, name=%{public}@",  buf,  0x16u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor gameInstallItems](self, "gameInstallItems"));
        [v18 removeObjectForKey:v14];
      }

      id v10 = [v8 countByEnumeratingWithState:&v63 objects:v77 count:16];
    }

    while (v10);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v52 addedAppInfos]);
  id v20 = [v19 countByEnumeratingWithState:&v59 objects:v76 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
        if ([v24 isPlaceholder])
        {
          id v26 = sub_1000A3A60();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedName]);
            *(_DWORD *)buf = 138543618;
            v68 = v25;
            __int16 v69 = 2114;
            v70 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Detected starting game install. bundleIdentifier=%{public}@, name=%{public}@",  buf,  0x16u);
          }

          v29 = -[_PBAppInstallItem initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____PBAppInstallItem),  "initWithBundleIdentifier:",  v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor gameInstallItems](self, "gameInstallItems"));
          [v30 setObject:v29 forKey:v25];
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v59 objects:v76 count:16];
    }

    while (v21);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v31 = v52;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v52 oldToNewUpdatedAppInfos]);
  id v54 = [v32 countByEnumeratingWithState:&v55 objects:v75 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v56;
    *(void *)&__int128 v33 = 138544130LL;
    __int128 v50 = v33;
    v51 = self;
    do
    {
      for (k = 0LL; k != v54; k = (char *)k + 1)
      {
        if (*(void *)v56 != v53) {
          objc_enumerationMutation(v32);
        }
        uint64_t v35 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)k);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "oldToNewUpdatedAppInfos", v50));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v35]);

        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 bundleIdentifier]);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor gameInstallItems](self, "gameInstallItems"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:v38]);
        if (([v37 isPlaceholder] & 1) == 0 && v40)
        {
          [v39 removeObjectForKey:v38];
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          v42 = (void *)objc_claimAutoreleasedReturnValue([v40 installStartDate]);
          [v41 timeIntervalSinceDate:v42];
          double v44 = v43;

          -[PBLargeGameInstallMonitor _largeGameInstallTimeThreshold](self, "_largeGameInstallTimeThreshold");
          double v46 = v45;
          id v47 = sub_1000A3A60();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedName]);
            *(_DWORD *)buf = v50;
            v68 = v38;
            __int16 v69 = 2114;
            v70 = v49;
            __int16 v71 = 2048;
            double v72 = v44;
            __int16 v73 = 1024;
            BOOL v74 = v44 > v46;
            self = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Detected completed game install. bundleIdentifier=%{public}@, name=%{public}@, installTime=%.2fs, isLargeGame=%{BOOL}d",  buf,  0x26u);

            v31 = v52;
          }

          if (v44 > v46) {
            -[PBLargeGameInstallMonitor _postLargeGameInstalledBulletinWithAppInfo:]( self,  "_postLargeGameInstalledBulletinWithAppInfo:",  v37);
          }
        }
      }

      id v54 = [v32 countByEnumeratingWithState:&v55 objects:v75 count:16];
    }

    while (v54);
  }
}

- (double)_largeGameInstallTimeThreshold
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "pb_largeGameInstallTimeThreshold");
  double v4 = v3;

  int IsZero = BSFloatIsZero(v4);
  double result = 300.0;
  if (!IsZero) {
    return v4;
  }
  return result;
}

- (void)_postLargeGameInstalledBulletinWithAppInfo:(id)a3
{
  id v4 = a3;
  v42 = self;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = sub_1001C3008(@"LargeGameInstallBulletinMessageFormat", v8, @"GamingIntent");
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  double v44 = (void *)v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v11));

  double v43 = (void *)v12;
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, PBSSystemBulletinMessageKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v14 = sub_1001C3008(@"LargeGameInstallBulletinTitle", v13, @"GamingIntent");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v15, PBSSystemBulletinTitleKey);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
  unsigned int v17 = [v16 isArcadeApplication];
  v18 = (id *)&PBSSystemBulletinImageIDArcade;
  if (!v17) {
    v18 = (id *)&PBSSystemBulletinImageIDAppStore;
  }
  id v19 = *v18;

  v41 = v19;
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v19, PBSSystemBulletinImageIDKey);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v21 = sub_1001C3008(@"LargeGameInstallBulletinFooterFormat", v20, @"GamingIntent");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[PBBluetoothObserver sharedInstance](&OBJC_CLASS___PBBluetoothObserver, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 connectedDevices]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bs_filter:", &stru_1003D4A70));

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
  v27 = v26;
  if (v26)
  {
    id v28 = [v26 vendorIdentifier];
    if (v28 == (id)1118)
    {
      v29 = (id *)&PBSSystemBulletinTextImageIDXboxButton;
    }

    else if (v28 == (id)1356)
    {
      v29 = (id *)&PBSSystemBulletinTextImageIDPlayStationButton;
    }

    else
    {
      v29 = (id *)&PBSSystemBulletinTextImageIDHomeButton;
    }
  }

  else
  {
    v29 = (id *)&PBSSystemBulletinTextImageIDTVButton;
  }

  id v30 = *v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v30));
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v31, PBSSystemBulletinFooterMessageKey);
  -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &off_1003FDA40,  PBSSystemBulletinActivationActionKey);
  -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  v6,  @"PBLargeGameInstallMonitorBulletinKeyBundleIdentifier");
  v32 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setMessage:](v32, "setMessage:", v7);
  -[PBSBulletin setViewControllerClassName:]( v32,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v32, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  id v33 = sub_1000A3A60();
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v25;
    uint64_t v35 = v22;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
    *(_DWORD *)buf = 138543618;
    v49 = v36;
    __int16 v50 = 2114;
    v51 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Posting large game bulletin. name=%{public}@, bundleIdentifier=%{public}@",  buf,  0x16u);

    uint64_t v22 = v35;
    v25 = v40;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBLargeGameInstallMonitor bulletinService](v42, "bulletinService"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000A46BC;
  v45[3] = &unk_1003D4A98;
  id v46 = v4;
  id v47 = v6;
  id v38 = v6;
  id v39 = v4;
  [v37 presentBulletin:v32 withCompletion:v45];
}

- (OS_dispatch_queue_serial)queue
{
  return self->_queue;
}

- (NSMutableDictionary)gameInstallItems
{
  return self->_gameInstallItems;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (void)setAppInfoController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end