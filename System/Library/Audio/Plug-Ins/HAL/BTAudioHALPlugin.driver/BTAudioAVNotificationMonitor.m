@interface BTAudioAVNotificationMonitor
+ (id)sharedInstance;
- (BOOL)isBluetoothRoute;
- (BOOL)isRouteAvailable;
- (BOOL)isVolumeUpdateToAccessoryRequired:(id)a3;
- (BTAudioAVNotificationMonitor)init;
- (MXSystemController)systemController;
- (NSMutableSet)deviceList;
- (NSNumber)isPersonalizedVolumeUpdate;
- (NSNumber)processManualVolumeUpdates;
- (NSString)currentActiveVolumeAudioCategory;
- (NSString)currentDeviceUID;
- (NSString)nowPlayingBundleID;
- (NSString)reasonForManualVolumeUpdate;
- (OS_dispatch_queue)manualVolumeUpdatesQueue;
- (OS_dispatch_queue)mediaAVNotificationQueue;
- (id).cxx_construct;
- (id)getPersonalizedVolumeDevice:(id)a3;
- (void)choosePickableRoute;
- (void)dealloc;
- (void)nowPlayingAppChanged:(id)a3;
- (void)personalizedVolumeEnabled:(BOOL)a3;
- (void)processManualVolumeUpdates:(BOOL)a3;
- (void)refreshNowPlayingAppBundleID;
- (void)registerNowPlayingListener:(unsigned int)a3;
- (void)registerPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4;
- (void)registerVolumeChangedListener:(unsigned int)a3;
- (void)sendManualVolumeUpdate:(unsigned __int8)a3;
- (void)setCurrentActiveVolumeAudioCategory:(id)a3;
- (void)setCurrentDeviceUID:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setIsPersonalizedVolumeUpdate:(id)a3;
- (void)setManualVolumeUpdatesQueue:(id)a3;
- (void)setMediaAVNotificationQueue:(id)a3;
- (void)setNowPlayingBundleID:(id)a3;
- (void)setProcessManualVolumeUpdates:(id)a3;
- (void)setReasonForManualVolumeUpdate:(id)a3;
- (void)setSystemController:(id)a3;
- (void)unRegisterNowPlayingListener:(unsigned int)a3;
- (void)unRegisterPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4;
- (void)unregisterRouteChangeListener;
- (void)unregisterVolumeChangedListener:(unsigned int)a3;
- (void)updateVolumeDelta:(float)a3 uid:(__CFString *)a4;
- (void)updateVolumeForCategories:(float)a3 telephoneVolume:(float)a4 voiceCommandVolume:(float)a5 uid:(__CFString *)a6 rampUpDuration:(float)a7 rampDownDuration:(float)a8;
@end

@implementation BTAudioAVNotificationMonitor

+ (id)sharedInstance
{
  v4[0] = 0LL;
  v4[1] = 0LL;
  sub_52B28((uint64_t)v4, (uint64_t)&unk_959E0);
  v2 = (BTAudioAVNotificationMonitor *)qword_95A20;
  if (!qword_95A20)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___BTAudioAVNotificationMonitor);
    qword_95A20 = (uint64_t)v2;
  }

  sub_52C5C(v4);
  return v2;
}

- (BTAudioAVNotificationMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTAudioAVNotificationMonitor;
  v2 = -[BTAudioAVNotificationMonitor init](&v6, "init");
  if (v2)
  {
    v2->_mediaAVNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.BTAudioHALPlugin.BTAudioAVNotificationMonitor.MainQueue",  0LL);
    v2->_manualVolumeUpdatesQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.BTAudioHALPlugin.BTAudioAVNotificationMonitor.Manau alVolumeUpdatesQueue",  0LL);
    v2->_systemController = -[MXSystemController initWithPID:]( objc_alloc(&OBJC_CLASS___MXSystemController),  "initWithPID:",  getpid());
    mediaAVNotificationQueue = (dispatch_queue_s *)v2->_mediaAVNotificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_165FC;
    block[3] = &unk_81BE0;
    block[4] = v2;
    dispatch_async(mediaAVNotificationQueue, block);
  }

  return v2;
}

- (void)dealloc
{
  if (self->_systemController)
  {
    uint64_t NotificationCenter = CMSessionGetNotificationCenter(self);
    FigNotificationCenterRemoveWeakListener( NotificationCenter,  self,  sub_168D0,  kMXSystemControllerNotification_NowPlayingAppDidChange,  self->_systemController);
    uint64_t v4 = _os_feature_enabled_impl("BluetoothFeatures", "PersonalizedVolumeV2");
    if ((_DWORD)v4)
    {
      uint64_t v5 = CMSessionGetNotificationCenter(v4);
      FigNotificationCenterRemoveWeakListener( v5,  self,  sub_168D0,  kMXSystemControllerNotification_PickableRoutesDidChange,  self->_systemController);
    }

    -[BTAudioAVNotificationMonitor unregisterRouteChangeListener](self, "unregisterRouteChangeListener");

    self->_systemController = 0LL;
  }

  objc_super v6 = (os_log_s *)qword_959D8;
  if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: dealloc", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BTAudioAVNotificationMonitor;
  -[BTAudioAVNotificationMonitor dealloc](&v7, "dealloc");
}

- (void)registerVolumeChangedListener:(unsigned int)a3
{
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_16ED4;
  v4[3] = &unk_81EB0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(mediaAVNotificationQueue, v4);
}

- (void)unregisterVolumeChangedListener:(unsigned int)a3
{
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_17028;
  v4[3] = &unk_81EB0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(mediaAVNotificationQueue, v4);
}

- (void)choosePickableRoute
{
  id location = 0LL;
  objc_initWeak(&location, self->_systemController);
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_17198;
  block[3] = &unk_81ED8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(mediaAVNotificationQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)registerPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4
{
  manualVolumeUpdatesQueue = (dispatch_queue_s *)self->_manualVolumeUpdatesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_17414;
  block[3] = &unk_81F00;
  block[4] = a4;
  void block[5] = self;
  unsigned int v6 = a3;
  dispatch_async(manualVolumeUpdatesQueue, block);
}

- (id)getPersonalizedVolumeDevice:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:]( self->_btAudioDeviceDict,  "objectForKey:",  objc_msgSend(objc_msgSend(a3, "componentsSeparatedByString:", @"-"), "firstObject"));

    return v4;
  }

  else
  {
    unsigned int v6 = (os_log_s *)qword_959D8;
    if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_ERROR)) {
      sub_5A614(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 0LL;
  }

- (void)unRegisterPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4
{
  manualVolumeUpdatesQueue = (dispatch_queue_s *)self->_manualVolumeUpdatesQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_17630;
  v5[3] = &unk_81BB8;
  v5[4] = a4;
  v5[5] = self;
  dispatch_async(manualVolumeUpdatesQueue, v5);
}

- (void)personalizedVolumeEnabled:(BOOL)a3
{
  self->_personalizedVolumeEnabled = a3;
}

- (BOOL)isBluetoothRoute
{
  if (self->_currentDeviceUID)
  {
    btAudioDeviceDict = self->_btAudioDeviceDict;
    if (btAudioDeviceDict) {
      LOBYTE(btAudioDeviceDict) = -[NSMutableDictionary objectForKey:](btAudioDeviceDict, "objectForKey:") != 0LL;
    }
  }

  else
  {
    LOBYTE(btAudioDeviceDict) = 0;
  }

  return (char)btAudioDeviceDict;
}

- (void)setCurrentActiveVolumeAudioCategory:(id)a3
{
  self->_currentActiveVolumeAudioCategory = (NSString *)a3;
}

- (void)processManualVolumeUpdates:(BOOL)a3
{
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_17800;
  v4[3] = &unk_81F28;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mediaAVNotificationQueue, v4);
}

- (void)sendManualVolumeUpdate:(unsigned __int8)a3
{
  isPersonalizedVolumeUpdate = self->_isPersonalizedVolumeUpdate;
  currentDeviceUID = self->_currentDeviceUID;
  currentActiveVolumeAudioCategory = self->_currentActiveVolumeAudioCategory;
  v13[0] = @"CurrentAudioCategory";
  v13[1] = @"IsPersonalizedVolumeUpdate";
  v14[0] = currentActiveVolumeAudioCategory;
  v14[1] = isPersonalizedVolumeUpdate;
  v13[2] = @"ManualVolumeUpdate";
  v14[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3);
  v14[3] = &off_855E8;
  v13[3] = @"RampInProgress";
  v13[4] = @"PersonalizedVolumeEnabled";
  uint64_t v7 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_personalizedVolumeEnabled);
  nowPlayingBundleID = (const __CFString *)self->_nowPlayingBundleID;
  if (!nowPlayingBundleID) {
    nowPlayingBundleID = &stru_84880;
  }
  v14[4] = v7;
  v14[5] = nowPlayingBundleID;
  v13[5] = @"BundleID";
  v13[6] = @"ReasonForManualUpdate";
  v14[6] = self->_reasonForManualVolumeUpdate;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  7LL);
  uint64_t v10 = currentDeviceUID;
  manualVolumeUpdatesQueue = (dispatch_queue_s *)self->_manualVolumeUpdatesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_179F8;
  block[3] = &unk_81F50;
  block[4] = self;
  void block[5] = currentDeviceUID;
  void block[6] = v9;
  block[7] = isPersonalizedVolumeUpdate;
  dispatch_async(manualVolumeUpdatesQueue, block);
}

- (void)registerNowPlayingListener:(unsigned int)a3
{
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_17AB0;
  v4[3] = &unk_81EB0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(mediaAVNotificationQueue, v4);
}

- (void)updateVolumeDelta:(float)a3 uid:(__CFString *)a4
{
  id location = 0LL;
  objc_initWeak(&location, self->_systemController);
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_17C80;
  block[3] = &unk_81F78;
  objc_copyWeak(v9, &location);
  float v10 = a3;
  v9[1] = a4;
  block[4] = self;
  dispatch_async(mediaAVNotificationQueue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)updateVolumeForCategories:(float)a3 telephoneVolume:(float)a4 voiceCommandVolume:(float)a5 uid:(__CFString *)a6 rampUpDuration:(float)a7 rampDownDuration:(float)a8
{
  id location = 0LL;
  objc_initWeak(&location, self->_systemController);
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_17F08;
  v16[3] = &unk_81FA0;
  objc_copyWeak(v17, &location);
  float v18 = a3;
  float v19 = a4;
  float v20 = a5;
  float v21 = a7;
  float v22 = a8;
  v17[1] = a6;
  dispatch_async(mediaAVNotificationQueue, v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)unRegisterNowPlayingListener:(unsigned int)a3
{
  mediaAVNotificationQueue = (dispatch_queue_s *)self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_18148;
  v4[3] = &unk_81EB0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(mediaAVNotificationQueue, v4);
}

- (void)nowPlayingAppChanged:(id)a3
{
  id v19 = 0LL;
  unsigned int v5 = (os_log_s *)qword_959D8;
  if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT))
  {
    nowPlayingBundleID = self->_nowPlayingBundleID;
    *(_DWORD *)buf = 138412546;
    float v22 = nowPlayingBundleID;
    __int16 v23 = 2112;
    id v24 = a3;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "BTAudioAVNotificationMonitor: via nowPlayingAppBundleID,  Now Playing App changed  %@ -> %@ ",  buf,  0x16u);
  }

  if (a3)
  {
    id v19 = a3;
  }

  else
  {
    uint64_t v7 = -[BTAudioAVNotificationMonitor systemController](self, "systemController");
    -[MXSystemController copyAttributeForKey:withValueOut:]( v7,  "copyAttributeForKey:withValueOut:",  kMXSystemControllerProperty_NowPlayingAppDisplayID,  &v19);
    uint64_t v8 = (os_log_s *)qword_959D8;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT);
    a3 = v19;
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      float v22 = (NSString *)v19;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "BTAudioAVNotificationMonitor: Bundle ID for Now Playing App was NULL. Querying directly. Value received %@",  buf,  0xCu);
      a3 = v19;
    }
  }

  -[BTAudioAVNotificationMonitor setNowPlayingBundleID:](self, "setNowPlayingBundleID:", a3);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  deviceList = self->_deviceList;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( deviceList,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(deviceList);
        }
        sub_3E36C( qword_962E8,  [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) unsignedIntValue]);
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( deviceList,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v12);
  }

- (void)refreshNowPlayingAppBundleID
{
  uint64_t v5 = 0LL;
  v3 = -[BTAudioAVNotificationMonitor systemController](self, "systemController");
  -[MXSystemController copyAttributeForKey:withValueOut:]( v3,  "copyAttributeForKey:withValueOut:",  kMXSystemControllerProperty_NowPlayingAppDisplayID,  &v5);
  id v4 = (os_log_s *)qword_959D8;
  if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAudioAVNotificationMonitor: Refresh Now playing Bundle ID %@",  buf,  0xCu);
  }

  if (v5) {
    -[BTAudioAVNotificationMonitor nowPlayingAppChanged:](self, "nowPlayingAppChanged:");
  }
}

- (BOOL)isRouteAvailable
{
  uint64_t v5 = 0LL;
  v2 = -[BTAudioAVNotificationMonitor systemController](self, "systemController");
  -[MXSystemController copyAttributeForKey:withValueOut:]( v2,  "copyAttributeForKey:withValueOut:",  kMXSystemControllerProperty_ActiveAudioRoute,  &v5);
  v3 = (os_log_s *)qword_959D8;
  if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: Refresh Route Info %@", buf, 0xCu);
  }

  return v5 != 0;
}

- (void)unregisterRouteChangeListener
{
  v3 = (os_log_s *)qword_959D8;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: Unregister Route listner", v6, 2u);
  }

  uint64_t NotificationCenter = CMSessionGetNotificationCenter(v4);
  FigNotificationCenterRemoveWeakListener( NotificationCenter,  self,  sub_168D0,  kMXSystemControllerNotification_ActiveAudioRouteDidChange,  self->_systemController);
}

- (BOOL)isVolumeUpdateToAccessoryRequired:(id)a3
{
  uint64_t v5 = (os_log_s *)qword_959D8;
  if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = -[NSMutableArray containsObject:](self->_sequenceArray, "containsObject:", a3);
    uint64_t v7 = "No";
    if (v6) {
      uint64_t v7 = "Yes";
    }
    int v12 = 138412546;
    id v13 = a3;
    __int16 v14 = 2080;
    __int128 v15 = v7;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "BTAudioAVNotificationMonitor: is sequenceNumber %@ in _sequenceArray %s",  (uint8_t *)&v12,  0x16u);
  }

  unsigned int v8 = -[NSMutableArray containsObject:](self->_sequenceArray, "containsObject:", a3);
  if (v8)
  {
    -[NSMutableArray removeObject:](self->_sequenceArray, "removeObject:", a3);
    BOOL v9 = (os_log_s *)qword_959D8;
    if (os_log_type_enabled((os_log_t)qword_959D8, OS_LOG_TYPE_DEFAULT))
    {
      sequenceArray = self->_sequenceArray;
      int v12 = 138412290;
      id v13 = sequenceArray;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "BTAudioAVNotificationMonitor: sequenceArray contents %@",  (uint8_t *)&v12,  0xCu);
    }
  }

  return v8 ^ 1;
}

- (NSString)nowPlayingBundleID
{
  return self->_nowPlayingBundleID;
}

- (void)setNowPlayingBundleID:(id)a3
{
}

- (MXSystemController)systemController
{
  return self->_systemController;
}

- (void)setSystemController:(id)a3
{
}

- (NSMutableSet)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (NSString)currentActiveVolumeAudioCategory
{
  return self->_currentActiveVolumeAudioCategory;
}

- (NSNumber)processManualVolumeUpdates
{
  return self->_processManualVolumeUpdates;
}

- (void)setProcessManualVolumeUpdates:(id)a3
{
}

- (NSNumber)isPersonalizedVolumeUpdate
{
  return self->_isPersonalizedVolumeUpdate;
}

- (void)setIsPersonalizedVolumeUpdate:(id)a3
{
}

- (OS_dispatch_queue)mediaAVNotificationQueue
{
  return self->_mediaAVNotificationQueue;
}

- (void)setMediaAVNotificationQueue:(id)a3
{
}

- (NSString)currentDeviceUID
{
  return self->_currentDeviceUID;
}

- (void)setCurrentDeviceUID:(id)a3
{
}

- (NSString)reasonForManualVolumeUpdate
{
  return self->_reasonForManualVolumeUpdate;
}

- (void)setReasonForManualVolumeUpdate:(id)a3
{
}

- (OS_dispatch_queue)manualVolumeUpdatesQueue
{
  return self->_manualVolumeUpdatesQueue;
}

- (void)setManualVolumeUpdatesQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end