@interface LegacyAudioController
+ (LegacyAudioController)sharedInstance;
- (LegacyAudioController)init;
- (NSArray)activeAccessories;
- (NSArray)matchingAccessoriesList;
- (NSArray)matchingBSDNotificationsList;
- (NSArray)matchingDASActivityList;
- (id)accessorySeen:(id)a3;
- (id)cachedActiveFirmwareAccessories;
- (id)loadMatchingAccessoriesList;
- (id)loadMatchingBSDNotificationsList;
- (id)loadMatchingDASActivityList;
- (void)addActiveAccessory:(id)a3;
- (void)addActiveFirmwareAnalytics:(id)a3;
- (void)dasActivityReceived:(id)a3;
- (void)removeAccessorySeen:(id)a3;
- (void)removeActiveAccessory:(id)a3;
- (void)sendActiveFirmwareAnalyticsEvent;
- (void)setCachedActiveFirmwareAccessories:(id)a3;
@end

@implementation LegacyAudioController

+ (LegacyAudioController)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CAC0;
  block[3] = &unk_10002D738;
  block[4] = a1;
  if (qword_10003DEC0 != -1) {
    dispatch_once(&qword_10003DEC0, block);
  }
  return (LegacyAudioController *)(id)qword_10003DEB8;
}

- (LegacyAudioController)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LegacyAudioController;
  v2 = -[LegacyAudioController init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    internalActiveAccessories = v2->_internalActiveAccessories;
    v2->_internalActiveAccessories = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    internalAccessoriesSeen = v2->_internalAccessoriesSeen;
    v2->_internalAccessoriesSeen = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[LegacyAudioController loadMatchingAccessoriesList](v2, "loadMatchingAccessoriesList"));
    matchingAccessoriesList = v2->_matchingAccessoriesList;
    v2->_matchingAccessoriesList = (NSArray *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[LegacyAudioController loadMatchingBSDNotificationsList](v2, "loadMatchingBSDNotificationsList"));
    matchingBSDNotificationsList = v2->_matchingBSDNotificationsList;
    v2->_matchingBSDNotificationsList = (NSArray *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[LegacyAudioController loadMatchingDASActivityList](v2, "loadMatchingDASActivityList"));
    matchingDASActivityList = v2->_matchingDASActivityList;
    v2->_matchingDASActivityList = (NSArray *)v11;

    v13 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.UARPUpdaterServiceLegacyAudioDatabase");
    database = v2->_database;
    v2->_database = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.legacyAudioController.queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;
  }

  return v2;
}

- (id)accessorySeen:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  dispatch_queue_t v15 = sub_10000CCB8;
  v16 = sub_10000CCC8;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CCD0;
  block[3] = &unk_10002D7A0;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeAccessorySeen:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CE84;
  block[3] = &unk_10002D598;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)addActiveAccessory:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CF0C;
  block[3] = &unk_10002D598;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)removeActiveAccessory:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CFB8;
  block[3] = &unk_10002D598;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NSArray)activeAccessories
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10000CCB8;
  id v10 = sub_10000CCC8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000D078;
  v5[3] = &unk_10002D7C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)dasActivityReceived:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D138;
  block[3] = &unk_10002D598;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)addActiveFirmwareAnalytics:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D214;
  block[3] = &unk_10002D598;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)loadMatchingAccessoriesList
{
  v2 = (void *)MGCopyAnswer(@"InternalBuild", 0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Use Alternate Accessory List from %@",  (uint8_t *)&v9,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"MobileAccessoryUpdaterProperties"]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loaded Alternate Accessory List from %@",  (uint8_t *)&v9,  0xCu);
  }

  if (!v5)
  {
LABEL_7:
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForInfoDictionaryKey:@"MobileAccessoryUpdaterProperties"]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loaded Native iAUP Accessory List",  (uint8_t *)&v9,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"MatchingDevices"]);

  return v7;
}

- (id)loadMatchingBSDNotificationsList
{
  id v3 = @"com.apple.corespeech.voicetriggerassetchange";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (id)loadMatchingDASActivityList
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject(v2);
  id v4 = [[UARPServiceUpdaterDASMatchingRule alloc] initWithIdentifier:@"PeriodicLaunchActivity" matchingDictionary:v3];
  id v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

- (id)cachedActiveFirmwareAccessories
{
  xpc_object_t v2 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_database,  "objectForKey:",  @"activeFirmwareAccessories"));
  if (!v2) {
    xpc_object_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return v2;
}

- (void)setCachedActiveFirmwareAccessories:(id)a3
{
}

- (void)sendActiveFirmwareAnalyticsEvent
{
  xpc_object_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_database, "objectForKey:"));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v26 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    id v7 = &AMAuthInstallApCreatePersonalizedResponse_ptr;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v8);
        id v10 = v7[72];
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___LegacyAudioAccessory);
        id v28 = 0LL;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 unarchivedObjectOfClass:v11 fromData:v9 error:&v28]);
        id v13 = v28;
        if (v12)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 activeFirmwareVersion]);

          if (v14)
          {
            dispatch_queue_t v15 = objc_alloc_init(&OBJC_CLASS___UARPActiveFirmwareAnalyticsEvent);
            v16 = (void *)objc_claimAutoreleasedReturnValue([v12 modelName]);
            -[UARPActiveFirmwareAnalyticsEvent setModelName:](v15, "setModelName:", v16);

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 activeFirmwareVersion]);
            -[UARPActiveFirmwareAnalyticsEvent setActiveFirmwareVersion:](v15, "setActiveFirmwareVersion:", v17);

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[UARPActiveFirmwareAnalyticsEvent modelName](v15, "modelName"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[UARPActiveFirmwareAnalyticsEvent activeFirmwareVersion](v15, "activeFirmwareVersion"));
              *(_DWORD *)buf = 136315650;
              v34 = "-[LegacyAudioController sendActiveFirmwareAnalyticsEvent]";
              __int16 v35 = 2112;
              v36 = v18;
              __int16 v37 = 2112;
              v38 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: sending active Firmware Event for %@, %@",  buf,  0x20u);

              id v7 = &AMAuthInstallApCreatePersonalizedResponse_ptr;
            }

            -[UARPActiveFirmwareAnalyticsEvent send](v15, "send");
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue([v12 activeANCVersion]);

          if (v20)
          {
            v21 = objc_alloc_init(&OBJC_CLASS___UARPActiveFirmwareAnalyticsEvent);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v12 modelName]);
            -[UARPActiveFirmwareAnalyticsEvent setModelName:](v21, "setModelName:", v22);

            v23 = (void *)objc_claimAutoreleasedReturnValue([v12 activeANCVersion]);
            -[UARPActiveFirmwareAnalyticsEvent setActiveFirmwareVersion:](v21, "setActiveFirmwareVersion:", v23);

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[UARPActiveFirmwareAnalyticsEvent modelName](v21, "modelName"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[UARPActiveFirmwareAnalyticsEvent activeFirmwareVersion](v21, "activeFirmwareVersion"));
              *(_DWORD *)buf = 136315650;
              v34 = "-[LegacyAudioController sendActiveFirmwareAnalyticsEvent]";
              __int16 v35 = 2112;
              v36 = v24;
              __int16 v37 = 2112;
              v38 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: sending active ANC Firmware Event for %@, %@",  buf,  0x20u);

              id v7 = &AMAuthInstallApCreatePersonalizedResponse_ptr;
            }

            -[UARPActiveFirmwareAnalyticsEvent send](v21, "send");
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100017B24(v39, (uint64_t)v13, &v40);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }

    while (v5);
  }

  -[NSUserDefaults removeObjectForKey:](self->_database, "removeObjectForKey:", @"activeFirmwareAccessories");
}

- (NSArray)matchingAccessoriesList
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSArray)matchingBSDNotificationsList
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSArray)matchingDASActivityList
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end