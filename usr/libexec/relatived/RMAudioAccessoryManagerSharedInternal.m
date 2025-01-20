@interface RMAudioAccessoryManagerSharedInternal
+ (id)sharedInternal;
- (BOOL)isDeviceMotionActive;
- (BOOL)isTempestActive;
- (BOOL)motionActivityActive;
- (BOOL)requested50HzHeadphoneMotion;
- (BOOL)shouldActivateActivityUpdates;
- (BOOL)shouldActivateDeviceMotionUpdates;
- (BOOL)shouldActivateStatusUpdates;
- (BOOL)statusUpdatesActive;
- (CMAudioAccessoryManager)audioAccessoryManager;
- (NSHashTable)managers;
- (NSString)activeAudioRouteDeviceID;
- (NSUserDefaults)cmDefaults;
- (RMAudioAccessoryManagerSharedInternal)init;
- (double)lastActivityPrintTime;
- (double)lastActivitySampleTime;
- (double)lastDMPrintTime;
- (double)lastDMSampleTime;
- (int64_t)lastDeviceStatus;
- (unint64_t)activitySampleRate;
- (unint64_t)activitySamplesPerSecond;
- (unint64_t)dmSampleRate;
- (unint64_t)dmSamplesPerSecond;
- (void)onActiveAudioRouteChanged:(id)a3;
- (void)postAudioRouteChangeCompleted;
- (void)setActiveAudioRouteDeviceID:(id)a3;
- (void)setActivitySampleRate:(unint64_t)a3;
- (void)setActivitySamplesPerSecond:(unint64_t)a3;
- (void)setAudioAccessoryManager:(id)a3;
- (void)setCmDefaults:(id)a3;
- (void)setDeviceMotionActive:(BOOL)a3;
- (void)setDmSampleRate:(unint64_t)a3;
- (void)setDmSamplesPerSecond:(unint64_t)a3;
- (void)setLastActivityPrintTime:(double)a3;
- (void)setLastActivitySampleTime:(double)a3;
- (void)setLastDMPrintTime:(double)a3;
- (void)setLastDMSampleTime:(double)a3;
- (void)setLastDeviceStatus:(int64_t)a3;
- (void)setManagers:(id)a3;
- (void)setMotionActivityActive:(BOOL)a3;
- (void)setRequested50HzHeadphoneMotion:(BOOL)a3;
- (void)setStatusUpdatesActive:(BOOL)a3;
- (void)setTempestActive:(BOOL)a3;
- (void)startActivityUpdates;
- (void)startDeviceMotionUpdates;
- (void)startMonitoringActiveAudioRoute;
- (void)startOrStopActivityUpdates;
- (void)startOrStopDeviceMotionUpdates;
- (void)startOrStopStatusUpdates;
- (void)startStatusUpdates;
- (void)stopActivityUpdates;
- (void)stopDeviceMotionUpdates;
- (void)stopStatusUpdates;
- (void)updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:(BOOL)a3;
@end

@implementation RMAudioAccessoryManagerSharedInternal

+ (id)sharedInternal
{
  if (qword_100023C48 != -1) {
    dispatch_once(&qword_100023C48, &stru_10001CA50);
  }
  return (id)qword_100023C40;
}

- (RMAudioAccessoryManagerSharedInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RMAudioAccessoryManagerSharedInternal;
  v2 = -[RMAudioAccessoryManagerSharedInternal init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    -[RMAudioAccessoryManagerSharedInternal setManagers:](v2, "setManagers:", v3);

    v4 = objc_opt_new(&OBJC_CLASS___CMAudioAccessoryManager);
    -[RMAudioAccessoryManagerSharedInternal setAudioAccessoryManager:](v2, "setAudioAccessoryManager:", v4);

    -[RMAudioAccessoryManagerSharedInternal setDeviceMotionActive:](v2, "setDeviceMotionActive:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setLastDeviceStatus:](v2, "setLastDeviceStatus:", 1LL);
    -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:](v2, "setStatusUpdatesActive:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:](v2, "setMotionActivityActive:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setTempestActive:](v2, "setTempestActive:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setActiveAudioRouteDeviceID:](v2, "setActiveAudioRouteDeviceID:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal startMonitoringActiveAudioRoute](v2, "startMonitoringActiveAudioRoute");
    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.CoreMotion");
    -[RMAudioAccessoryManagerSharedInternal setCmDefaults:](v2, "setCmDefaults:", v5);
  }

  return v2;
}

- (BOOL)shouldActivateStatusUpdates
{
  if (+[CMAudioAccessoryManager _isAvailable](&OBJC_CLASS___CMAudioAccessoryManager, "_isAvailable"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal managers](self, "managers", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) deviceMotionStatusHandler]);

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }

        id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

- (void)startOrStopStatusUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal shouldActivateStatusUpdates](self, "shouldActivateStatusUpdates")) {
    -[RMAudioAccessoryManagerSharedInternal startStatusUpdates](self, "startStatusUpdates");
  }
  else {
    -[RMAudioAccessoryManagerSharedInternal stopStatusUpdates](self, "stopStatusUpdates");
  }
}

- (void)startStatusUpdates
{
  if (!-[RMAudioAccessoryManagerSharedInternal statusUpdatesActive](self, "statusUpdatesActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    uint64_t v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472LL;
    objc_super v7 = sub_1000098D4;
    v8 = &unk_10001CA78;
    objc_copyWeak(&v9, &location);
    [v3 _startAudioAccessoryDeviceMotionStatusUpdatesToQueue:v4 withHandler:&v5];

    -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:]( self,  "setStatusUpdatesActive:",  1LL,  v5,  v6,  v7,  v8);
    objc_destroyWeak(&v9);
  }

  objc_destroyWeak(&location);
}

- (void)stopStatusUpdates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
  [v3 _stopAudioAccessoryDeviceMotionStatusUpdates];

  -[RMAudioAccessoryManagerSharedInternal setLastDeviceStatus:](self, "setLastDeviceStatus:", 1LL);
  -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:](self, "setStatusUpdatesActive:", 0LL);
}

- (BOOL)shouldActivateDeviceMotionUpdates
{
  if (+[CMAudioAccessoryManager _isAvailable](&OBJC_CLASS___CMAudioAccessoryManager, "_isAvailable"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal managers](self, "managers", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) deviceMotionHandler]);

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }

        id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

- (void)startOrStopDeviceMotionUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal shouldActivateDeviceMotionUpdates]( self,  "shouldActivateDeviceMotionUpdates"))
  {
    -[RMAudioAccessoryManagerSharedInternal startDeviceMotionUpdates](self, "startDeviceMotionUpdates");
  }

  else
  {
    -[RMAudioAccessoryManagerSharedInternal stopDeviceMotionUpdates](self, "stopDeviceMotionUpdates");
  }

- (void)startDeviceMotionUpdates
{
  if (!-[RMAudioAccessoryManagerSharedInternal isDeviceMotionActive](self, "isDeviceMotionActive"))
  {
    -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:]( self,  "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:",  -[RMAudioAccessoryManagerSharedInternal isTempestActive](self, "isTempestActive"));
    -[RMAudioAccessoryManagerSharedInternal setLastDMSampleTime:](self, "setLastDMSampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastDMPrintTime:](self, "setLastDMPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setDmSamplesPerSecond:](self, "setDmSamplesPerSecond:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal cmDefaults](self, "cmDefaults"));
    -[RMAudioAccessoryManagerSharedInternal setRequested50HzHeadphoneMotion:]( self,  "setRequested50HzHeadphoneMotion:",  [v3 BOOLForKey:@"CMHeadphoneMotionManagerEnable50HzUpdateInterval"]);

    if (-[RMAudioAccessoryManagerSharedInternal requested50HzHeadphoneMotion](self, "requested50HzHeadphoneMotion"))
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CAE8);
      }
      id v4 = (os_log_s *)qword_100023978;
      double v5 = 0.02;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[RMAudioAccessoryManager] Headphone Motion API set to 50Hz for user study.",  (uint8_t *)buf,  2u);
      }
    }

    else
    {
      double v5 = 0.04;
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    [v6 _setAudioAccessoryDeviceMotionUpdateInterval:v5];

    objc_initWeak(buf, self);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100009E20;
    v9[3] = &unk_10001CAA0;
    objc_copyWeak(&v10, buf);
    [v7 _startAudioAccessoryDeviceMotionUpdatesToQueue:v8 lowLatencyMode:1 withHandler:v9];

    -[RMAudioAccessoryManagerSharedInternal setDeviceMotionActive:](self, "setDeviceMotionActive:", 1LL);
    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }

- (void)stopDeviceMotionUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal isDeviceMotionActive](self, "isDeviceMotionActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    [v3 _stopAudioAccessoryDeviceMotionUpdates];

    -[RMAudioAccessoryManagerSharedInternal setDeviceMotionActive:](self, "setDeviceMotionActive:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setLastDMSampleTime:](self, "setLastDMSampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastDMPrintTime:](self, "setLastDMPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setDmSamplesPerSecond:](self, "setDmSamplesPerSecond:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setRequested50HzHeadphoneMotion:]( self,  "setRequested50HzHeadphoneMotion:",  0LL);
    -[RMAudioAccessoryManagerSharedInternal startOrStopStatusUpdates](self, "startOrStopStatusUpdates");
  }

- (BOOL)shouldActivateActivityUpdates
{
  if (+[CMAudioAccessoryManager _isAvailable](&OBJC_CLASS___CMAudioAccessoryManager, "_isAvailable"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal managers](self, "managers", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) activityHandler]);

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }

        id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

- (void)startOrStopActivityUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal shouldActivateActivityUpdates](self, "shouldActivateActivityUpdates")) {
    -[RMAudioAccessoryManagerSharedInternal startActivityUpdates](self, "startActivityUpdates");
  }
  else {
    -[RMAudioAccessoryManagerSharedInternal stopActivityUpdates](self, "stopActivityUpdates");
  }
}

- (void)startActivityUpdates
{
  if (!-[RMAudioAccessoryManagerSharedInternal motionActivityActive](self, "motionActivityActive"))
  {
    -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:]( self,  "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:",  -[RMAudioAccessoryManagerSharedInternal isTempestActive](self, "isTempestActive"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    [v3 _setAudioAccessoryActivityUpdateInterval:0.2];

    -[RMAudioAccessoryManagerSharedInternal setLastActivitySampleTime:](self, "setLastActivitySampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastActivityPrintTime:](self, "setLastActivityPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setActivitySamplesPerSecond:](self, "setActivitySamplesPerSecond:", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMHeadphoneActivityManager sharedInstance]( &OBJC_CLASS___RMHeadphoneActivityManager,  "sharedInstance"));
    unsigned int v5 = [v4 mslLoggingEnabled];

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMHeadphoneActivityManager sharedInstance]( &OBJC_CLASS___RMHeadphoneActivityManager,  "sharedInstance"));
      [v6 startMslLogging];
    }

    objc_initWeak(&location, self);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    __int128 v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    __int128 v11 = sub_10000A4B8;
    __int128 v12 = &unk_10001CAC8;
    objc_copyWeak(&v13, &location);
    [v7 _startAudioAccessoryActivityUpdatesToQueue:v8 withHandler:&v9];

    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:]( self,  "setMotionActivityActive:",  1LL,  v9,  v10,  v11,  v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

- (void)stopActivityUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal motionActivityActive](self, "motionActivityActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    [v3 _stopAudioAccessoryActivityUpdates];

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMHeadphoneActivityManager sharedInstance]( &OBJC_CLASS___RMHeadphoneActivityManager,  "sharedInstance"));
    [v4 stopMslLogging];

    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:](self, "setMotionActivityActive:", 0LL);
    -[RMAudioAccessoryManagerSharedInternal setLastActivitySampleTime:](self, "setLastActivitySampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastActivityPrintTime:](self, "setLastActivityPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setActivitySamplesPerSecond:](self, "setActivitySamplesPerSecond:", 0LL);
  }

- (void)setTempestActive:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_tempestActive = a3;
  if (-[RMAudioAccessoryManagerSharedInternal isTempestActive](obj, "isTempestActive")) {
    -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:]( obj,  "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:",  1LL);
  }
  objc_sync_exit(obj);
}

- (void)startMonitoringActiveAudioRoute
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemAudioContext](&OBJC_CLASS___AVOutputContext, "sharedSystemAudioContext"));
  id v4 = (void *)qword_100023C50;
  qword_100023C50 = v3;

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"onActiveAudioRouteChanged:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"onActiveAudioRouteChanged:" name:AVOutputContextOutputDevicesDidChangeNotification object:0];
}

- (void)onActiveAudioRouteChanged:(id)a3
{
  id v4 = a3;
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CAE8);
  }
  unsigned int v5 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[RMAudioAccessoryManager] Active audio route changed",  v6,  2u);
  }

  -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:]( self,  "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:",  0LL);
}

- (void)updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if ((+[CMAudioAccessoryManager _isAvailable](&OBJC_CLASS___CMAudioAccessoryManager, "_isAvailable") & 1) != 0)
  {
    -[RMAudioAccessoryManagerSharedInternal setActiveAudioRouteDeviceID:](obj, "setActiveAudioRouteDeviceID:", 0LL);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVOutputContext sharedSystemAudioContext]( &OBJC_CLASS___AVOutputContext,  "sharedSystemAudioContext"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDevices]);

    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      while (2)
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          __int128 v9 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v8);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
          unsigned __int8 v11 = [v10 containsString:@"Speaker"];

          if ((v11 & 1) == 0)
          {
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 modelID]);
            unsigned __int8 v14 = +[CMAudioAccessoryManager _selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:]( &OBJC_CLASS___CMAudioAccessoryManager,  "_selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:",  v12,  v13);

            if ((v14 & 1) != 0)
            {
              if (qword_100023970 != -1) {
                dispatch_once(&qword_100023970, &stru_10001CAE8);
              }
              v22 = (os_log_s *)(id)qword_100023978;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
                v24 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v9 modelID]);
                *(_DWORD *)buf = 138543875;
                v33 = v23;
                __int16 v34 = 2113;
                v35 = v24;
                __int16 v36 = 2113;
                v37 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[RMAudioAccessoryManager] relatived sucessfully selected active audio route for device %{public}@ ID % {private}@ model %{private}@",  buf,  0x20u);
              }

              v26 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
              -[RMAudioAccessoryManagerSharedInternal setActiveAudioRouteDeviceID:]( obj,  "setActiveAudioRouteDeviceID:",  v26);

              -[RMAudioAccessoryManagerSharedInternal postAudioRouteChangeCompleted]( obj,  "postAudioRouteChangeCompleted");
              goto LABEL_27;
            }

            if (+[RMPlatformInfo isInternalBuild](&OBJC_CLASS___RMPlatformInfo, "isInternalBuild") && v3)
            {
              if (qword_100023970 != -1) {
                dispatch_once(&qword_100023970, &stru_10001CAE8);
              }
              v15 = (os_log_s *)(id)qword_100023978;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
                v17 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
                v18 = (void *)objc_claimAutoreleasedReturnValue([v9 modelID]);
                *(_DWORD *)buf = 138543875;
                v33 = v16;
                __int16 v34 = 2113;
                v35 = v17;
                __int16 v36 = 2113;
                v37 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "[RMAudioAccessoryManager] relatived failed to select active audio route for device %{public}@ ID %{pri vate}@ model %{private}@",  buf,  0x20u);
              }
            }

            else
            {
              if (qword_100023970 != -1) {
                dispatch_once(&qword_100023970, &stru_10001CAE8);
              }
              v15 = (os_log_s *)(id)qword_100023978;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
                v20 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
                v21 = (void *)objc_claimAutoreleasedReturnValue([v9 modelID]);
                *(_DWORD *)buf = 138543875;
                v33 = v19;
                __int16 v34 = 2113;
                v35 = v20;
                __int16 v36 = 2113;
                v37 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[RMAudioAccessoryManager] relatived failed to select active audio route for device %{public}@ ID %{pri vate}@ model %{private}@",  buf,  0x20u);
              }
            }
          }

          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    +[CMAudioAccessoryManager _selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:]( &OBJC_CLASS___CMAudioAccessoryManager,  "_selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:",  0LL,  0LL);
    -[RMAudioAccessoryManagerSharedInternal postAudioRouteChangeCompleted](obj, "postAudioRouteChangeCompleted");
  }

- (void)postAudioRouteChangeCompleted
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal activeAudioRouteDeviceID](self, "activeAudioRouteDeviceID"));

  if (v3)
  {
    uint64_t v7 = @"RMAudioDeviceChangeCompletedRouteIDKey";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal activeAudioRouteDeviceID](self, "activeAudioRouteDeviceID"));
    v8 = v4;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  else
  {
    unsigned int v5 = &__NSDictionary0__struct;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"RMAudioDeviceChangeCompletedNotification" object:0 userInfo:v5];
}

- (NSHashTable)managers
{
  return self->_managers;
}

- (void)setManagers:(id)a3
{
}

- (CMAudioAccessoryManager)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
}

- (BOOL)isDeviceMotionActive
{
  return self->_deviceMotionActive;
}

- (void)setDeviceMotionActive:(BOOL)a3
{
  self->_deviceMotionActive = a3;
}

- (BOOL)statusUpdatesActive
{
  return self->_statusUpdatesActive;
}

- (void)setStatusUpdatesActive:(BOOL)a3
{
  self->_statusUpdatesActive = a3;
}

- (int64_t)lastDeviceStatus
{
  return self->_lastDeviceStatus;
}

- (void)setLastDeviceStatus:(int64_t)a3
{
  self->_lastDeviceStatus = a3;
}

- (BOOL)motionActivityActive
{
  return self->_motionActivityActive;
}

- (void)setMotionActivityActive:(BOOL)a3
{
  self->_motionActivityActive = a3;
}

- (BOOL)isTempestActive
{
  return self->_tempestActive;
}

- (NSString)activeAudioRouteDeviceID
{
  return self->_activeAudioRouteDeviceID;
}

- (void)setActiveAudioRouteDeviceID:(id)a3
{
}

- (unint64_t)dmSamplesPerSecond
{
  return self->_dmSamplesPerSecond;
}

- (void)setDmSamplesPerSecond:(unint64_t)a3
{
  self->_dmSamplesPerSecond = a3;
}

- (unint64_t)dmSampleRate
{
  return self->_dmSampleRate;
}

- (void)setDmSampleRate:(unint64_t)a3
{
  self->_dmSampleRate = a3;
}

- (double)lastDMSampleTime
{
  return self->_lastDMSampleTime;
}

- (void)setLastDMSampleTime:(double)a3
{
  self->_lastDMSampleTime = a3;
}

- (double)lastDMPrintTime
{
  return self->_lastDMPrintTime;
}

- (void)setLastDMPrintTime:(double)a3
{
  self->_lastDMPrintTime = a3;
}

- (unint64_t)activitySamplesPerSecond
{
  return self->_activitySamplesPerSecond;
}

- (void)setActivitySamplesPerSecond:(unint64_t)a3
{
  self->_activitySamplesPerSecond = a3;
}

- (unint64_t)activitySampleRate
{
  return self->_activitySampleRate;
}

- (void)setActivitySampleRate:(unint64_t)a3
{
  self->_activitySampleRate = a3;
}

- (double)lastActivitySampleTime
{
  return self->_lastActivitySampleTime;
}

- (void)setLastActivitySampleTime:(double)a3
{
  self->_lastActivitySampleTime = a3;
}

- (double)lastActivityPrintTime
{
  return self->_lastActivityPrintTime;
}

- (void)setLastActivityPrintTime:(double)a3
{
  self->_lastActivityPrintTime = a3;
}

- (BOOL)requested50HzHeadphoneMotion
{
  return self->_requested50HzHeadphoneMotion;
}

- (void)setRequested50HzHeadphoneMotion:(BOOL)a3
{
  self->_requested50HzHeadphoneMotion = a3;
}

- (NSUserDefaults)cmDefaults
{
  return self->_cmDefaults;
}

- (void)setCmDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end