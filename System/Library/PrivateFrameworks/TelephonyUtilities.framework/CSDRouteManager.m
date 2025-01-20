@interface CSDRouteManager
+ (CSDRouteManager)sharedInstance;
- (BOOL)_isAnyAudioDevicePreferred;
- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch;
- (BOOL)hasInEarRouteInTipiWithCompanionWatch;
- (BOOL)isAnyBluetoothHeadphoneRouteAvailableForAnyCall;
- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3 forCall:(id)a4;
- (BOOL)isAnyVehicleRouteAvailableForAnyCall;
- (BOOL)isAnyVehicleRouteAvailableForCall:(id)a3;
- (BOOL)isCarModeActive;
- (BOOL)isCarPlayDeviceConnected;
- (BOOL)isCarPlayRouteAvailable;
- (BOOL)isEligibleRouteAvailable;
- (BOOL)isEligibleRouteAvailableForCall:(id)a3;
- (CSDRouteManager)init;
- (NSDictionary)audioRouteCollections;
- (OS_dispatch_queue)queue;
- (id)_audioRouteCollectionForCall:(id)a3;
- (id)preferredAndActiveRouteForCall:(id)a3;
- (id)preferredRouteForCall:(id)a3;
- (void)_initializeAudioRouteCollections;
- (void)_initializeAutomaticCarDNDStatusIfNecessary;
- (void)_postNotificationName:(id)a3;
- (void)_updateCarPlayDeviceConnected;
- (void)_updatePickableRoutes;
- (void)audioDeviceControllerDeviceListChanged:(id)a3;
- (void)carPlayIsConnectedChanged:(id)a3;
- (void)dealloc;
- (void)mediaServicesWereResetNotification:(id)a3;
- (void)pickableRoutesDidChangeNotification:(id)a3;
- (void)preferredExternalRouteDidChangeNotification:(id)a3;
- (void)setAudioRouteCollections:(id)a3;
- (void)setCarPlayDeviceConnected:(BOOL)a3;
@end

@implementation CSDRouteManager

+ (CSDRouteManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C7FE0;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044D008 != -1) {
    dispatch_once(&qword_10044D008, block);
  }
  return (CSDRouteManager *)(id)qword_10044D000;
}

- (CSDRouteManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDRouteManager;
  v2 = -[CSDRouteManager init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.routemanager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioDeviceController]);
    [v6 addDelegate:v2];

    v7 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C80EC;
    block[3] = &unk_1003D7730;
    v10 = v2;
    dispatch_async(v7, block);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRouteManager;
  -[CSDRouteManager dealloc](&v4, "dealloc");
}

- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000C84B8;
  v12[3] = &unk_1003D9808;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (id)preferredRouteForCall:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000C8610;
  uint64_t v16 = sub_1000C8620;
  id v17 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8628;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  objc_super v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)isEligibleRouteAvailable
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C873C;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C8938;
  v5[3] = &unk_1003D9288;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasInEarRouteInTipiWithCompanionWatch
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C8B10;
  v5[3] = &unk_1003D9288;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isEligibleRouteAvailableForCall:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8D10;
  block[3] = &unk_1003D9650;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)preferredAndActiveRouteForCall:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000C8610;
  uint64_t v16 = sub_1000C8620;
  id v17 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8E9C;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)isAnyVehicleRouteAvailableForCall:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8FD8;
  block[3] = &unk_1003D9238;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)isAnyBluetoothHeadphoneRouteAvailableForAnyCall
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C90FC;
  v5[3] = &unk_1003D9288;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isCarPlayRouteAvailable
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C92D8;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isAnyVehicleRouteAvailableForAnyCall
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C93C4;
  v5[3] = &unk_1003D9288;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isCarModeActive
{
  return 0;
}

- (void)pickableRoutesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C960C;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)preferredExternalRouteDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9734;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)carPlayIsConnectedChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9884;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)mediaServicesWereResetNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C99D4;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)audioDeviceControllerDeviceListChanged:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9A78;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_postNotificationName:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:v4 object:0];
}

- (void)_updatePickableRoutes
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager audioRouteCollections](self, "audioRouteCollections", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned __int8 v8 = 0;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        if ((v8 & 1) != 0) {
          unsigned __int8 v8 = 1;
        }
        else {
          unsigned __int8 v8 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)i) updatePickableRoutes];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);

    if ((v8 & 1) != 0) {
      -[CSDRouteManager _postNotificationName:]( self,  "_postNotificationName:",  @"CSDRouteManagerRoutesChangedNotification");
    }
  }

  else
  {
  }

- (id)_audioRouteCollectionForCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___TUAudioRouteCollectionKey);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 audioCategory]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 audioMode]);
  id v9 = [v6 initWithCategory:v7 mode:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager audioRouteCollections](self, "audioRouteCollections"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

  if (!v11)
  {
    id v12 = sub_1001704C4();
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager audioRouteCollections](self, "audioRouteCollections"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 audioCategory]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 audioMode]);
      int v18 = 138413058;
      char v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] No audio route collection found in audioRouteCollections: %@ for audio category %@ and audio mode %@ for call %@",  (uint8_t *)&v18,  0x2Au);
    }
  }

  return v11;
}

- (BOOL)_isAnyAudioDevicePreferred
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioDeviceController]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = (os_log_s *)[v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (os_log_s *)((char *)i + 1))
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 isPreferredDevice])
        {
          id v10 = sub_1001704C4();
          id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v17 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Found preferred AVAudioDevice: %@",  buf,  0xCu);
          }

          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }

      id v6 = (os_log_s *)[v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_initializeAudioRouteCollections
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (!qword_10044D018)
  {
    id v4 = (void **)CUTWeakLinkSymbol("kMXSessionAudioCategory_PlayAndRecord_NoBluetooth", @"MediaExperience");
    if (v4) {
      id v5 = *v4;
    }
    else {
      id v5 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044D018, v5);
  }

  if (!qword_10044D020)
  {
    id v6 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_RemoteVoiceChat", @"MediaExperience");
    if (v6) {
      uint64_t v7 = *v6;
    }
    else {
      uint64_t v7 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044D020, v7);
  }

  id v8 = objc_alloc(&OBJC_CLASS___TUAudioRouteCollectionKey);
  id v9 = [v8 initWithCategory:qword_10044D018 mode:qword_10044D020];
  [v3 addObject:v9];

  if (+[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling"))
  {
    id v10 = [[TUAudioRouteCollectionKey alloc] initWithCategory:@"PhoneCall" mode:0];
    [v3 addObject:v10];
  }

  if (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeAudioCalls"))
  {
    if (!qword_10044D028)
    {
      __int128 v11 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_VoiceChat", @"MediaExperience");
      if (v11) {
        __int128 v12 = *v11;
      }
      else {
        __int128 v12 = 0LL;
      }
      objc_storeStrong((id *)&qword_10044D028, v12);
    }

    id v13 = objc_alloc(&OBJC_CLASS___TUAudioRouteCollectionKey);
    id v14 = [v13 initWithCategory:qword_10044D018 mode:qword_10044D028];
    [v3 addObject:v14];
  }

  if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeVideoCalls"))
  {
    if (!qword_10044D030)
    {
      __int128 v15 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_VideoChat", @"MediaExperience");
      if (v15) {
        uint64_t v16 = *v15;
      }
      else {
        uint64_t v16 = 0LL;
      }
      objc_storeStrong((id *)&qword_10044D030, v16);
    }

    id v17 = objc_alloc(&OBJC_CLASS___TUAudioRouteCollectionKey);
    id v18 = [v17 initWithCategory:qword_10044D018 mode:qword_10044D030];
    [v3 addObject:v18];
  }

  char v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v20 = v3;
  id v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      __int16 v24 = 0LL;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v24);
        v26 = objc_alloc(&OBJC_CLASS___CSDAudioRouteCollection);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 category]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v25 mode]);
        v29 = -[CSDAudioRouteCollection initWithCategory:mode:routeManager:]( v26,  "initWithCategory:mode:routeManager:",  v27,  v28,  self);

        [v19 setObject:v29 forKeyedSubscript:v25];
        __int16 v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v22);
  }

  -[CSDRouteManager setAudioRouteCollections:](self, "setAudioRouteCollections:", v19);
}

- (void)_initializeAutomaticCarDNDStatusIfNecessary
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v2);
}

- (void)_updateCarPlayDeviceConnected
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRouteManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updating isCarPlayDeviceConnected to %d",  (uint8_t *)v6,  8u);
  }

  -[CSDRouteManager setCarPlayDeviceConnected:](self, "setCarPlayDeviceConnected:", 0LL);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDictionary)audioRouteCollections
{
  return self->_audioRouteCollections;
}

- (void)setAudioRouteCollections:(id)a3
{
}

- (BOOL)isCarPlayDeviceConnected
{
  return self->_carPlayDeviceConnected;
}

- (void)setCarPlayDeviceConnected:(BOOL)a3
{
  self->_carPlayDeviceConnected = a3;
}

- (void).cxx_destruct
{
}

@end