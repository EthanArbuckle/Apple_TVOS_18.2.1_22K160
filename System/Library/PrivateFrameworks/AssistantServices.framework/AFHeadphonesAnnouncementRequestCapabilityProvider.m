@interface AFHeadphonesAnnouncementRequestCapabilityProvider
+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (id)provider;
+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (int64_t)platform;
- (AFSiriAudioRoute)currentAnnouncementRoute;
- (id)_getCurrentAnnouncementRoute;
- (id)_headphonesMonitor;
- (id)_init;
- (id)_settingsConnection;
- (id)currentlyRoutedHeadphonesBTAddress;
- (id)currentlyRoutedHeadphonesProductID;
- (unint64_t)lastKnownEligibleAnnouncementRequestTypes;
- (void)_fetchEligibleAnnouncementRequestTypesAndNotifyObservers;
- (void)_fetchInitialState;
- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3;
- (void)_notifyObserversOfEligibleAnnouncementRequestTypes:(unint64_t)a3;
- (void)_settingsConnectionDidDisconnect;
- (void)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)currentAudioRouteDidChange:(id)a3;
- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesAndNotifyObservers:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchLocalVoiceAssetAvailabilityWithCompletion:(id)a3;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)notifyObserversOfAvailableAnnouncementRequestTypes;
- (void)privateAudioSessionStateDidChange:(unint64_t)a3;
- (void)setCurrentAnnouncementRoute:(id)a3;
@end

@implementation AFHeadphonesAnnouncementRequestCapabilityProvider

- (id)_init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___AFHeadphonesAnnouncementRequestCapabilityProvider;
  v2 = -[AFHeadphonesAnnouncementRequestCapabilityProvider init](&v27, "init");
  if (!v2) {
    return v2;
  }
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("AFHeadphonesAnnouncementRequestCapabilityProvider", v4);

  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  dispatch_group_t v7 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFHeadphonesAnnouncementRequestCapabilityProvider _headphonesMonitor](v2, "_headphonesMonitor"));
  [v9 addDelegate:v2];

  v10 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AFBluetoothPairedDeviceInfoUpdated));
  v12 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v10,  "initWithName:options:queue:delegate:",  v11,  0LL,  v2->_queue,  v2);
  pairedInfoChangeObserver = v2->_pairedInfoChangeObserver;
  v2->_pairedInfoChangeObserver = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  v15 = (void *)qword_100577C08;
  uint64_t v31 = qword_100577C08;
  if (!qword_100577C08)
  {
    v16 = sub_1000C1A84();
    v15 = dlsym(v16, "BluetoothPairedStatusChangedNotification");
    v29[3] = (uint64_t)v15;
    qword_100577C08 = (uint64_t)v15;
  }

  _Block_object_dispose(&v28, 8);
  if (v15)
  {
    [v14 addObserver:v2 selector:"fetchEligibleAnnouncementRequestTypesAndNotifyObservers:" name:*v15 object:0];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    v18 = (void *)qword_100577C18;
    uint64_t v31 = qword_100577C18;
    if (!qword_100577C18)
    {
      v19 = sub_1000C1A84();
      v18 = dlsym(v19, "BluetoothFirstDeviceUnlockCompleted");
      v29[3] = (uint64_t)v18;
      qword_100577C18 = (uint64_t)v18;
    }

    _Block_object_dispose(&v28, 8);
    if (v18)
    {
      [v17 addObserver:v2 selector:"fetchEligibleAnnouncementRequestTypesAndNotifyObservers:" name:*v18 object:0];

      v20 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  @"AFSiriUserNotificationRequestCapabilityForceUpdate",  0LL,  v2->_queue,  v2);
      forcedUpdateObserver = v2->_forcedUpdateObserver;
      v2->_forcedUpdateObserver = v20;

      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      delegates = v2->_delegates;
      v2->_delegates = (NSHashTable *)v22;

      -[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchInitialState](v2, "_fetchInitialState");
      return v2;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getBluetoothFirstDeviceUnlockCompleted(void)"));
    objc_msgSend( v25,  "handleFailureInFunction:file:lineNumber:description:",  v26,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  54,  @"%s",  dlerror());
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getBluetoothPairedStatusChangedNotification(void)"));
    objc_msgSend( v25,  "handleFailureInFunction:file:lineNumber:description:",  v26,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  53,  @"%s",  dlerror());
  }

  __break(1u);
  return result;
}

- (void)_fetchInitialState
{
  if (AFDeviceSupportsSpokenMessages(self, a2))
  {
    dispatch_group_enter((dispatch_group_t)self->_group);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C1A54;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(queue, block);
  }

- (void)fetchLocalVoiceAssetAvailabilityWithCompletion:(id)a3
{
}

- (AFSiriAudioRoute)currentAnnouncementRoute
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000C1620;
  v16 = sub_1000C1630;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1A20;
  block[3] = &unk_1004FCDB0;
  block[4] = self;
  void block[5] = &v12;
  dispatch_sync(queue, block);
  v4 = (void *)v13[5];
  if (!v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( -[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute]( self,  "_getCurrentAnnouncementRoute"));
    v6 = (void *)v13[5];
    v13[5] = v5;

    dispatch_group_t v7 = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C1A40;
    v10[3] = &unk_1004FCDB0;
    v10[4] = self;
    v10[5] = &v12;
    dispatch_async(v7, v10);
    v4 = (void *)v13[5];
  }

  id v8 = v4;
  _Block_object_dispose(&v12, 8);

  return (AFSiriAudioRoute *)v8;
}

- (id)currentlyRoutedHeadphonesProductID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[AFHeadphonesAnnouncementRequestCapabilityProvider currentAnnouncementRoute]( self,  "currentAnnouncementRoute"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 productID]);
  id v4 = [v3 copy];

  return v4;
}

- (id)currentlyRoutedHeadphonesBTAddress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[AFHeadphonesAnnouncementRequestCapabilityProvider currentAnnouncementRoute]( self,  "currentAnnouncementRoute"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 btAddress]);
  id v4 = [v3 copy];

  return v4;
}

- (id)_getCurrentAnnouncementRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AFHeadphonesAnnouncementRequestCapabilityProvider _headphonesMonitor](self, "_headphonesMonitor"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentAudioRoute]);

  if ([v3 availableAnnouncementRequestTypes])
  {
    id v4 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      dispatch_group_t v7 = v4;
      id v8 = [v3 availableAnnouncementRequestTypes];
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 avscRouteDescription]);
      int v10 = 136315650;
      v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute]";
      __int16 v12 = 2048;
      id v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s capabilities: %lu for routeDescription: %@",  (uint8_t *)&v10,  0x20u);
    }

    id v5 = v3;
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute]( self,  "_getCurrentAnnouncementRoute"));
  -[AFHeadphonesAnnouncementRequestCapabilityProvider setCurrentAnnouncementRoute:]( self,  "setCurrentAnnouncementRoute:",  v5);
  v6 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v6;
    id v9 = [v5 availableAnnouncementRequestTypes];
    unint64_t lastKnownAvailableAnnouncementRequests = self->_lastKnownAvailableAnnouncementRequests;
    uint64_t Name = AFSiriAnnouncementPlatformGetName([v5 announcePlatformForRoute]);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v18 = 136315906;
    v19 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _updateAudioRouteAvailabilityAndBroadcast:]";
    __int16 v20 = 2048;
    id v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = lastKnownAvailableAnnouncementRequests;
    __int16 v24 = 2112;
    v25 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Available route capabilities: %lu, last known availability: %lu announcePlatformForRoute: %@",  (uint8_t *)&v18,  0x2Au);
  }

  if ([v5 availableAnnouncementRequestTypes] != (id)self->_lastKnownAvailableAnnouncementRequests)
  {
    dispatch_group_t v7 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      id v13 = v7;
      id v14 = [v5 availableAnnouncementRequestTypes];
      v15 = (void *)objc_claimAutoreleasedReturnValue([v5 avscRouteDescription]);
      uint64_t v16 = AFSiriAnnouncementPlatformGetName([v5 announcePlatformForRoute]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      int v18 = 136315906;
      v19 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _updateAudioRouteAvailabilityAndBroadcast:]";
      __int16 v20 = 2048;
      id v21 = v14;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v15;
      __int16 v24 = 2112;
      v25 = v17;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s updating available route capabilities: %lu for routeDescription: %@ announcePlatformForRoute: %@",  (uint8_t *)&v18,  0x2Au);
    }

    self->_unint64_t lastKnownAvailableAnnouncementRequests = (unint64_t)[v5 availableAnnouncementRequestTypes];
    if (v3) {
      -[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserversOfAvailableAnnouncementRequestTypes]( self,  "notifyObserversOfAvailableAnnouncementRequestTypes");
    }
  }
}

- (void)notifyObserversOfAvailableAnnouncementRequestTypes
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000C185C;
  v2[3] = &unk_1004FBBD0;
  v2[4] = self;
  -[AFHeadphonesAnnouncementRequestCapabilityProvider fetchAvailableAnnouncementRequestTypesWithCompletion:]( self,  "fetchAvailableAnnouncementRequestTypesWithCompletion:",  v2);
}

- (void)fetchEligibleAnnouncementRequestTypesAndNotifyObservers:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesAndNotifyObservers:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1854;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_fetchEligibleAnnouncementRequestTypesAndNotifyObservers
{
  BOOL v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_group_t v7 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchEligibleAnnouncementRequestTypesAndNotifyObservers]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  unint64_t lastKnownEligibleAnnouncementRequests = self->_lastKnownEligibleAnnouncementRequests;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C1714;
  v5[3] = &unk_1004F0238;
  v5[4] = self;
  v5[5] = lastKnownEligibleAnnouncementRequests;
  -[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesWithCompletion:]( self,  "fetchEligibleAnnouncementRequestTypesWithCompletion:",  v5);
}

- (void)_notifyObserversOfEligibleAnnouncementRequestTypes:(unint64_t)a3
{
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _notifyObserversOfEligibleAnnouncementRequestTypes:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Notifying observers, eligible announcement requests changed: %lu",  buf,  0x16u);
  }

  id v6 = -[NSHashTable copy](self->_delegates, "copy");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "provider:eligibleAnnouncementRequestTypesChanged:",  self,  a3,  (void)v12);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (id)_headphonesMonitor
{
  return +[AFSiriHeadphonesMonitor sharedMonitor](&OBJC_CLASS___AFSiriHeadphonesMonitor, "sharedMonitor");
}

- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  __int128 v13 = sub_1000C1620;
  __int128 v14 = sub_1000C1630;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[AFHeadphonesAnnouncementRequestCapabilityProvider _settingsConnection](self, "_settingsConnection"));
  id v5 = (void *)v11[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1638;
  v7[3] = &unk_1004F0260;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  id v9 = &v10;
  [v5 getPairedBluetoothDeviceInfoArrayWithCompletion:v7];

  _Block_object_dispose(&v10, 8);
}

- (void)privateAudioSessionStateDidChange:(unint64_t)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 136315394;
    id v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider privateAudioSessionStateDidChange:]";
    __int16 v12 = 2112;
    __int128 v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s headphonesPrivateSession: %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1618;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)currentAudioRouteDidChange:(id)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    id v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 description]);
    *(_DWORD *)buf = 136315394;
    id v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider currentAudioRouteDidChange:]";
    __int16 v12 = 2112;
    __int128 v13 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s current audio route did change: %@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C160C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  id v5 = (AFNotifyObserver *)a3;
  id v6 = v5;
  if (self->_forcedUpdateObserver == v5)
  {
    if (!self->_lastKnownEligibleAnnouncementRequests)
    {
      id v7 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v9 = 136315138;
        *(void *)&v9[4] = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserver:didReceiveNotificationWithToken:]";
        id v8 = "%s forced update observer re-fetching eligibility";
        goto LABEL_10;
      }

- (id)_settingsConnection
{
  if ((AFSupportsWirelessSplitter(self, a2) & 1) != 0)
  {
    settingsConnection = self->_settingsConnection;
    if (!settingsConnection)
    {
      id v4 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
      id v5 = self->_settingsConnection;
      self->_settingsConnection = v4;

      -[AFSettingsConnection _setDelegate:](self->_settingsConnection, "_setDelegate:", self);
      settingsConnection = self->_settingsConnection;
    }

    id v6 = settingsConnection;
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
  }

  return v6;
}

- (void)_settingsConnectionDidDisconnect
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1550;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1544;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unint64_t)lastKnownEligibleAnnouncementRequestTypes
{
  return self->_lastKnownEligibleAnnouncementRequests;
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  if ((AFDeviceSupportsSpokenMessages(v4, v5) & 1) != 0)
  {
    id v6 = dispatch_group_create();
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000LL;
    uint64_t v23 = 0LL;
    dispatch_group_enter(v6);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C10D8;
    block[3] = &unk_1004FBE80;
    block[4] = self;
    p___int128 buf = &buf;
    id v8 = v6;
    __int16 v19 = v8;
    dispatch_async(queue, block);
    dispatch_group_enter(v8);
    id v9 = (dispatch_queue_s *)self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000C1158;
    v16[3] = &unk_1004FD968;
    v16[4] = self;
    id v17 = v8;
    uint64_t v10 = v8;
    dispatch_async(v9, v16);
    id v11 = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C11C8;
    v13[3] = &unk_1004FAFF0;
    id v15 = &buf;
    v13[4] = self;
    id v14 = v4;
    dispatch_group_notify(v10, v11, v13);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    __int16 v12 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementReque"
                                      "stTypesWithCompletion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Announcements not supported on device",  (uint8_t *)&buf,  0xCu);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C0C58;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setCurrentAnnouncementRoute:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)provider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C2698;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_100577BF8 != -1) {
    dispatch_once(&qword_100577BF8, block);
  }
  return (id)qword_100577C00;
}

+ (int64_t)platform
{
  return 1LL;
}

+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  switch(a3)
  {
    case 1LL:
      sub_1000C23AC();
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v37 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));

      return v6;
    case 2LL:
      uint64_t v29 = 0LL;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      id v8 = (id *)qword_100577C30;
      uint64_t v32 = qword_100577C30;
      if (!qword_100577C30)
      {
        id v9 = sub_1000C24A0();
        id v8 = (id *)dlsym(v9, "INReadAnnouncementIntentIdentifier");
        v30[3] = (uint64_t)v8;
        qword_100577C30 = (uint64_t)v8;
      }

      _Block_object_dispose(&v29, 8);
      if (v8)
      {
        id v36 = *v8;
        id v10 = v36;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));

        return v11;
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINReadAnnouncementIntentIdentifier(void)"));
      objc_msgSend( v23,  "handleFailureInFunction:file:lineNumber:description:",  v24,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  35,  @"%s",  dlerror());

      goto LABEL_23;
    case 3LL:
      return &__NSArray0__struct;
    case 4LL:
      sub_1000C25A4();
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v35 = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));

      return v14;
    case 5LL:
      uint64_t v29 = 0LL;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      id v15 = (id *)qword_100577C40;
      uint64_t v32 = qword_100577C40;
      if (!qword_100577C40)
      {
        uint64_t v16 = sub_1000C24A0();
        id v15 = (id *)dlsym(v16, "INPlayVoicemailIntentIdentifier");
        v30[3] = (uint64_t)v15;
        qword_100577C40 = (uint64_t)v15;
      }

      _Block_object_dispose(&v29, 8);
      if (v15)
      {
        id v34 = *v15;
        id v17 = v34;
        int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));

        return v18;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINPlayVoicemailIntentIdentifier(void)"));
      objc_msgSend( v25,  "handleFailureInFunction:file:lineNumber:description:",  v26,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  37,  @"%s",  dlerror());

      goto LABEL_23;
    case 6LL:
      uint64_t v29 = 0LL;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      __int16 v19 = (id *)qword_100577C48;
      uint64_t v32 = qword_100577C48;
      if (!qword_100577C48)
      {
        unint64_t v20 = sub_1000C24A0();
        __int16 v19 = (id *)dlsym(v20, "INJoinCallIntentIdentifier");
        v30[3] = (uint64_t)v19;
        qword_100577C48 = (uint64_t)v19;
      }

      _Block_object_dispose(&v29, 8);
      if (!v19)
      {
        objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINJoinCallIntentIdentifier(void)"));
        objc_msgSend( v27,  "handleFailureInFunction:file:lineNumber:description:",  v28,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  38,  @"%s",  dlerror());

LABEL_23:
        __break(1u);
      }

      id v33 = *v19;
      id v21 = v33;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));

      id result = v22;
      break;
    default:
      return 0LL;
  }

  return result;
}

+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  if (AFSiriUserNotificationAnnouncementTypeGetIsValid(a3, a2))
  {
    switch(a3)
    {
      case 1LL:
        sub_1000C23AC();
        id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        uint64_t v32 = v7;
        uint64_t v25 = 0LL;
        v26 = &v25;
        uint64_t v27 = 0x2020000000LL;
        id v8 = (id *)qword_100577C50;
        uint64_t v28 = qword_100577C50;
        if (!qword_100577C50)
        {
          id v9 = sub_1000C24A0();
          id v8 = (id *)dlsym(v9, "INSendMessageIntentIdentifier");
          v26[3] = (uint64_t)v8;
          qword_100577C50 = (uint64_t)v8;
        }

        _Block_object_dispose(&v25, 8);
        if (!v8)
        {
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINSendMessageIntentIdentifier(void)"));
          objc_msgSend( v19,  "handleFailureInFunction:file:lineNumber:description:",  v20,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  34,  @"%s",  dlerror());

LABEL_21:
          __break(1u);
        }

        id v33 = *v8;
        id v10 = v33;
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 2LL));

        break;
      case 2LL:
      case 3LL:
      case 5LL:
      case 6LL:
        uint64_t v4 = &__NSArray0__struct;
        return v4;
      case 4LL:
        sub_1000C25A4();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v31 = v12;
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));

        return v4;
      case 7LL:
        uint64_t v25 = 0LL;
        v26 = &v25;
        uint64_t v27 = 0x2020000000LL;
        __int128 v13 = (id *)qword_100577C58;
        uint64_t v28 = qword_100577C58;
        if (!qword_100577C58)
        {
          id v14 = sub_1000C24A0();
          __int128 v13 = (id *)dlsym(v14, "INAnswerCallIntentIdentifier");
          v26[3] = (uint64_t)v13;
          qword_100577C58 = (uint64_t)v13;
        }

        _Block_object_dispose(&v25, 8);
        if (v13)
        {
          id v15 = *v13;
          uint64_t v25 = 0LL;
          v26 = &v25;
          uint64_t v27 = 0x2020000000LL;
          uint64_t v16 = (id *)qword_100577C60;
          uint64_t v28 = qword_100577C60;
          id v29 = v15;
          if (!qword_100577C60)
          {
            id v17 = sub_1000C24A0();
            uint64_t v16 = (id *)dlsym(v17, "INHangUpCallIntentIdentifier");
            v26[3] = (uint64_t)v16;
            qword_100577C60 = (uint64_t)v16;
          }

          _Block_object_dispose(&v25, 8);
          if (v16)
          {
            id v30 = *v16;
            id v18 = v30;
            uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  2LL));

            return v4;
          }

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINHangUpCallIntentIdentifier(void)"));
          objc_msgSend( v23,  "handleFailureInFunction:file:lineNumber:description:",  v24,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  40,  @"%s",  dlerror());
        }

        else
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINAnswerCallIntentIdentifier(void)"));
          objc_msgSend( v21,  "handleFailureInFunction:file:lineNumber:description:",  v22,  @"AFHeadphonesAnnouncementRequestCapabilityProvider.m",  39,  @"%s",  dlerror());
        }

        goto LABEL_21;
      default:
        goto LABEL_4;
    }
  }

  else
  {
LABEL_4:
    uint64_t v4 = 0LL;
  }

  return v4;
}

@end