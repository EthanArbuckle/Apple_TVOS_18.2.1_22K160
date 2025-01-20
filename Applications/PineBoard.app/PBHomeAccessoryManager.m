@interface PBHomeAccessoryManager
+ (BOOL)_isAccessoryInDefaultRoom:(id)a3;
+ (BOOL)_isDeviceName:(id)a3 roomNameInAccessory:(id)a4;
+ (BOOL)_isDeviceNameAppleTV:(id)a3;
+ (id)sharedInstance;
- (BOOL)isOdeonConfigured;
- (HMMediaDestination)lastSeenMediaDestination;
- (NSHashTable)observers;
- (NSTimer)buddyHomeTheaterPreferencesCleanUpTimer;
- (OS_dispatch_queue)observerQueue;
- (PBHomeAccessoryManager)init;
- (TVCSAccessory)_accessory;
- (TVCSHome)_home;
- (TVSStateMachine)_homeOnboardingStateMachine;
- (TVSStateMachine)stateMachine;
- (double)_waitingForCloudDataTime;
- (id)_init;
- (int64_t)_homeConfigurationState;
- (void)_clearBuddySelectedHomeTheaterPreferences;
- (void)_configureLocalAccessory;
- (void)_disableARCIfNecessary;
- (void)_initializeStateMachine;
- (void)_moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4;
- (void)_moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4;
- (void)_notifyOdeonChangedIfNecessaryWithDestination:(id)a3;
- (void)_setAccessory:(id)a3;
- (void)_setHome:(id)a3;
- (void)_setHomeConfigurationState:(int64_t)a3;
- (void)_setWaitingForCloudDataTime:(double)a3;
- (void)_startBuddyHomeTheaterTimer;
- (void)addObserver:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setBuddyHomeTheaterPreferencesCleanUpTimer:(id)a3;
- (void)setLastSeenMediaDestination:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setupAssistantDidFinish;
@end

@implementation PBHomeAccessoryManager

+ (id)sharedInstance
{
  if (qword_100471320 != -1) {
    dispatch_once(&qword_100471320, &stru_1003DBB28);
  }
  return (id)qword_100471318;
}

- (PBHomeAccessoryManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Unimplemented",  @"-[PBHomeAccessoryManager init] not supported, use +sharedInstance instead",  0LL));
  objc_exception_throw(v2);
  return (PBHomeAccessoryManager *)-[PBHomeAccessoryManager _init](v3, v4);
}

- (id)_init
{
  uint64_t v3 = TVCSHomeLog(self);
  SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HK: init", (uint8_t *)buf, 2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBHomeAccessoryManager;
  v5 = -[PBHomeAccessoryManager init](&v18, "init");
  v6 = v5;
  if (v5)
  {
    -[PBHomeAccessoryManager _initializeStateMachine](v5, "_initializeStateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v7 addObserver:v6 forKeyPath:@"localAccessory" options:0 context:off_10046D7C8];
    [v7 addObserver:v6 forKeyPath:@"homeConfigurationState" options:5 context:&unk_100471328];
    [v7 reloadHomeConfiguration];
    objc_initWeak(buf, v6);
    v19 = @"UserAssignedDeviceName";
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
    v9 = &_dispatch_main_q;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001C61E4;
    v15[3] = &unk_1003DBB50;
    objc_copyWeak(&v16, buf);
    MGRegisterForUpdates(v8, 0LL, &_dispatch_main_q, v15);

    dispatch_queue_t v10 = dispatch_queue_create("PBHomeAccessoryManager.observerQueue", 0LL);
    observerQueue = v6->_observerQueue;
    v6->_observerQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v12;

    -[PBHomeAccessoryManager _clearBuddySelectedHomeTheaterPreferences](v6, "_clearBuddySelectedHomeTheaterPreferences");
    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }

  return v6;
}

- (void)_initializeStateMachine
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  SEL v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"CustomName",  0LL,  0LL);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  v9 = self->_stateMachine;
  uint64_t v11 = TVCSHomeLog(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[TVSStateMachine setLogObject:](v9, "setLogObject:", v12);

  v13 = self->_stateMachine;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001C6384;
  v18[3] = &unk_1003D1AD8;
  v18[4] = self;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v13,  "registerDefaultHandlerForEvent:withBlock:",  @"LocalAccessoryInfoDidUpdate",  v18);
  v14 = self->_stateMachine;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001C65A0;
  v17[3] = &unk_1003D1AD8;
  v17[4] = self;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v14,  "registerDefaultHandlerForEvent:withBlock:",  @"LockdownDeviceNameDidChange",  v17);
  v15 = self->_stateMachine;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001C68C4;
  v16[3] = &unk_1003D1AD8;
  v16[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"LocalAccessoryInfoDidUpdate",  @"CustomName",  v16);
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_10046D7C8 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localAccessory]);
    -[PBHomeAccessoryManager _setAccessory:](self, "_setAccessory:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBHomeAccessoryManager stateMachine](self, "stateMachine"));
    [v16 postEvent:@"LocalAccessoryInfoDidUpdate"];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSAccessory hmAccessory](self->_accessory, "hmAccessory"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 audioDestinationController]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 destination]);
    -[PBHomeAccessoryManager _notifyOdeonChangedIfNecessaryWithDestination:]( self,  "_notifyOdeonChangedIfNecessaryWithDestination:",  v19);
  }

  else if (a6 == &unk_10047132C)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBHomeAccessoryManager stateMachine](self, "stateMachine"));
    [v20 postEvent:@"LocalAccessoryInfoDidUpdate"];
  }

  else if (a6 == &unk_100471328)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
    id v22 = [v21 integerValue];

    -[PBHomeAccessoryManager _setHomeConfigurationState:](self, "_setHomeConfigurationState:", v22);
  }

  else
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___PBHomeAccessoryManager;
    -[PBHomeAccessoryManager observeValueForKeyPath:ofObject:change:context:]( &v23,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)setupAssistantDidFinish
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBHomeAccessoryManager _homeOnboardingStateMachine](self, "_homeOnboardingStateMachine"));
  [v2 postEvent:@"SetupAssistantDidFinish"];
}

- (BOOL)isOdeonConfigured
{
  return self->_lastSeenMediaDestination != 0LL;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = (dispatch_queue_s *)self->_observerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001C6F7C;
    v7[3] = &unk_1003CFEB8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(observerQueue, v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = (dispatch_queue_s *)self->_observerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001C7024;
    v7[3] = &unk_1003CFEB8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(observerQueue, v7);
  }
}

- (void)_setAccessory:(id)a3
{
  id v4 = (TVCSAccessory *)a3;
  -[TVCSAccessory removeObserver:forKeyPath:context:]( self->_accessory,  "removeObserver:forKeyPath:context:",  self,  @"name",  &unk_10047132C);
  accessory = self->_accessory;
  self->_accessory = v4;
  v6 = v4;

  -[TVCSAccessory addObserver:forKeyPath:options:context:]( self->_accessory,  "addObserver:forKeyPath:options:context:",  self,  @"name",  0LL,  &unk_10047132C);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSAccessory home](self->_accessory, "home"));

  -[PBHomeAccessoryManager _setHome:](self, "_setHome:", v7);
}

- (void)_setHome:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_home, a3);
  if (self->_home)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    objc_msgSend(v6, "pbs_setNeedsHomeKitAutoOnboarding:", 0);
  }
}

+ (BOOL)_isAccessoryInDefaultRoom:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 room]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hmRoom]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 home]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hmHome]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 roomForEntireHome]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);

  LOBYTE(v8) = [v6 isEqual:v10];
  return (char)v8;
}

+ (BOOL)_isDeviceName:(id)a3 roomNameInAccessory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 room]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  id v9 = [v5 caseInsensitiveCompare:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 home]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rooms]);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001C73AC;
    v23[3] = &unk_1003DBB78;
    id v12 = v5;
    id v24 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_objectsPassingTest:", v23));

    if ([v13 count])
    {
      BOOL v14 = 1;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHome suggestedRoomNames:](&OBJC_CLASS___TVCSHome, "suggestedRoomNames:", -1LL));
      objc_super v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      v20 = sub_1001C740C;
      v21 = &unk_1003DBBA0;
      id v22 = v12;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tvs_objectsPassingTest:", &v18));

      BOOL v14 = objc_msgSend(v16, "count", v18, v19, v20, v21) != 0;
    }
  }

  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

+ (BOOL)_isDeviceNameAppleTV:(id)a3
{
  uint64_t v3 = qword_100471338;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100471338, &stru_1003DBBC0);
  }
  id v5 = [v4 length];
  id v6 = objc_msgSend((id)qword_100471330, "numberOfMatchesInString:options:range:", v4, 0, 0, v5);

  return v6 != 0LL;
}

- (void)_setHomeConfigurationState:(int64_t)a3
{
  if (self->_homeConfigurationState != a3)
  {
    self->_int64_t homeConfigurationState = a3;
    uint64_t v4 = TVCSHomeLog(self);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = TVCSHomeConfigurationStateToString(self->_homeConfigurationState);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      *(_DWORD *)buf = 136315394;
      objc_super v23 = "-[PBHomeAccessoryManager _setHomeConfigurationState:]";
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Changing home configuration state. New state: %@",  buf,  0x16u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBHomeAccessoryManager _homeOnboardingStateMachine](self, "_homeOnboardingStateMachine"));
    [v8 postEvent:@"HomeConfigurationStateDidChange"];

    int64_t homeConfigurationState = self->_homeConfigurationState;
    if ((unint64_t)(homeConfigurationState - 2) >= 3)
    {
      if (homeConfigurationState == 5)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        unsigned __int8 v17 = [v16 BOOLForKey:@"HomeKitReadyAnalyticsReported"];

        if ((v17 & 1) == 0)
        {
          uint64_t v19 = TVCSHomeLog(v18);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            objc_super v23 = "-[PBHomeAccessoryManager _setHomeConfigurationState:]";
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s: Capturing current time for HomeKit ready analytics.",  buf,  0xCu);
          }

          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          -[PBHomeAccessoryManager _setWaitingForCloudDataTime:](self, "_setWaitingForCloudDataTime:");
        }
      }
    }

    else
    {
      -[PBHomeAccessoryManager _waitingForCloudDataTime](self, "_waitingForCloudDataTime");
      if (v10 != 0.0)
      {
        double v11 = v10;
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1001C77B0;
        v21[3] = &unk_1003D4ED8;
        *(double *)&v21[4] = v12 - v11;
        AnalyticsSendEventLazy(@"com.apple.appletv.devices.homekit.performance", v21);
        uint64_t v13 = TVCSHomeLog(-[PBHomeAccessoryManager _setWaitingForCloudDataTime:](self, "_setWaitingForCloudDataTime:", 0.0));
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          objc_super v23 = "-[PBHomeAccessoryManager _setHomeConfigurationState:]";
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s: Reported HomeKit ready analytics.",  buf,  0xCu);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v15 setBool:1 forKey:@"HomeKitReadyAnalyticsReported"];
      }
    }
  }

- (void)_configureLocalAccessory
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  uint64_t v4 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pbs_buddySelectedRoomName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allOwnedHomes]);
  uint64_t v8 = TVCSHomeLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[PBHomeAccessoryManager _configureLocalAccessory]";
    __int16 v35 = 2048;
    id v36 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Found %ld homes.", buf, 0x16u);
  }

  if ([v7 count])
  {
    if ([v7 count] == (id)1)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
      -[PBHomeAccessoryManager _moveOrAddLocalAccessoryToRoomWithName:inHome:]( self,  "_moveOrAddLocalAccessoryToRoomWithName:inHome:",  v6,  v10);
    }

    else
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pbs_buddySelectedHomeName"));

      if (v10)
      {
        __int16 v24 = self;
        v25 = v6;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v3 allOwnedHomes]);
        id v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v27;
LABEL_10:
          uint64_t v16 = 0LL;
          while (1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            unsigned __int8 v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
            unsigned __int8 v19 = [v18 isEqualToString:v10];

            if ((v19 & 1) != 0) {
              break;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
              if (v14) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }

          id v20 = v17;

          self = v24;
          uint64_t v6 = v25;
          uint64_t v4 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
          if (v20) {
            goto LABEL_19;
          }
        }

        else
        {
LABEL_16:

          self = v24;
          uint64_t v6 = v25;
          uint64_t v4 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
        }
      }

      id v20 = (id)objc_claimAutoreleasedReturnValue([v3 ownedCurrentHome]);
      if (v20)
      {
LABEL_19:
        -[PBHomeAccessoryManager _moveOrAddLocalAccessoryToRoomWithName:inHome:]( self,  "_moveOrAddLocalAccessoryToRoomWithName:inHome:",  v6,  v20);
      }

      else
      {
        uint64_t v21 = TVCSHomeLog(0LL);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10028EF58(v22);
        }

        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v4[503] sharedPineBoardServicesPreferences]);
        objc_msgSend(v23, "pbs_setNeedsHomeKitAutoOnboarding:", 0);

        id v20 = (id)objc_claimAutoreleasedReturnValue(-[PBHomeAccessoryManager _homeOnboardingStateMachine](self, "_homeOnboardingStateMachine"));
        [v20 postEvent:@"OnboardingFailure"];
      }
    }
  }

  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001C7BB8;
    v30[3] = &unk_1003DBBE8;
    v30[4] = self;
    id v31 = v6;
    [v3 createDefaultHomeWithCompletionHandler:v30];
  }
}

- (void)_moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rooms]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001C7DB0;
  v16[3] = &unk_1003DBB78;
  id v9 = v6;
  id v17 = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvs_objectsPassingTest:", v16));

  if ([v10 count])
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    -[PBHomeAccessoryManager _moveOrAddLocalAccessoryToRoom:inHome:]( self,  "_moveOrAddLocalAccessoryToRoom:inHome:",  v11,  v7);
  }

  else
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001C7E0C;
    v13[3] = &unk_1003DBC10;
    v13[4] = self;
    id v14 = v7;
    id v15 = v9;
    [v12 createRoomNamed:v15 inHome:v14 completionHandler:v13];
  }
}

- (void)_moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001C7F48;
  v9[3] = &unk_1003D1F08;
  v9[4] = self;
  [v8 moveOrAddLocalAccessoryToRoom:v7 inHome:v6 completionHandler:v9];
}

- (TVSStateMachine)_homeOnboardingStateMachine
{
  homeOnboardingStateMachine = self->_homeOnboardingStateMachine;
  if (!homeOnboardingStateMachine)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    if (objc_msgSend(v4, "pbs_needsHomeKitAutoOnboarding")
      && (id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection")),
          unsigned int v6 = [v5 isDeviceNameModificationAllowed],
          v5,
          v6))
    {
      int v7 = sub_1001C9BFC();
      uint64_t v8 = @"Idle";
      if (v7) {
        uint64_t v8 = @"SetupAssistant";
      }
      v30 = v8;
    }

    else
    {
      v30 = @"Finished";
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1001C8714;
    v44[3] = &unk_1003DBC38;
    id v9 = v4;
    id v45 = v9;
    double v10 = objc_retainBlock(v44);
    double v11 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:stateChangeHandler:",  @"HomeKitAutoOnboarding",  v30,  0LL,  0LL);
    double v12 = self->_homeOnboardingStateMachine;
    self->_homeOnboardingStateMachine = v11;

    id v13 = self->_homeOnboardingStateMachine;
    uint64_t v15 = TVCSHomeLog(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[TVSStateMachine setLogObject:](v13, "setLogObject:", v16);

    objc_initWeak(&location, self);
    id v17 = self->_homeOnboardingStateMachine;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1001C8794;
    v40[3] = &unk_1003DBC60;
    uint64_t v18 = v10;
    id v42 = v18;
    v40[4] = self;
    id v19 = v9;
    id v41 = v19;
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v17,  "registerHandlerForEvent:onState:withBlock:",  @"SetupAssistantDidFinish",  @"SetupAssistant",  v40);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( self->_homeOnboardingStateMachine,  "registerHandlerForEvent:onState:withBlock:",  @"BeginBrowsing",  @"Idle",  &stru_1003DBC80);
    id v20 = self->_homeOnboardingStateMachine;
    v47[0] = @"Idle";
    v47[1] = @"Browsing";
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1001C8834;
    v38[3] = &unk_1003D0990;
    objc_copyWeak(&v39, &location);
    -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v20,  "registerHandlerForEvent:onStates:withBlock:",  @"BeginOnboarding",  v21,  v38);

    id v22 = self->_homeOnboardingStateMachine;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1001C890C;
    v36[3] = &unk_1003D1AD8;
    id v23 = v19;
    id v37 = v23;
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v22,  "registerHandlerForEvent:onState:withBlock:",  @"OnboardingSuccess",  @"Onboarding",  v36);
    __int16 v24 = self->_homeOnboardingStateMachine;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001C8930;
    v35[3] = &unk_1003D1AD8;
    v35[4] = self;
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v24,  "registerHandlerForEvent:onState:withBlock:",  @"OnboardingFailure",  @"Onboarding",  v35);
    v25 = self->_homeOnboardingStateMachine;
    v46[0] = @"Idle";
    v46[1] = @"Browsing";
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1001C8950;
    v31[3] = &unk_1003DBCA8;
    __int128 v27 = v18;
    id v33 = v27;
    objc_copyWeak(&v34, &location);
    id v28 = v23;
    id v32 = v28;
    -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v25,  "registerHandlerForEvent:onStates:withBlock:",  @"HomeConfigurationStateDidChange",  v26,  v31);

    -[TVSStateMachine setShouldAcceptEvents:](self->_homeOnboardingStateMachine, "setShouldAcceptEvents:", 1LL);
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

    homeOnboardingStateMachine = self->_homeOnboardingStateMachine;
  }

  return homeOnboardingStateMachine;
}

- (void)_notifyOdeonChangedIfNecessaryWithDestination:(id)a3
{
  uint64_t v4 = (HMMediaDestination *)a3;
  lastSeenMediaDestination = self->_lastSeenMediaDestination;
  if (lastSeenMediaDestination) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4 != 0LL;
  }
  if (lastSeenMediaDestination) {
    BOOL v7 = v4 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (v6 || v7)
  {
    objc_initWeak(&location, self);
    observerQueue = (dispatch_queue_s *)self->_observerQueue;
    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    double v12 = sub_1001C8B50;
    id v13 = &unk_1003D96D0;
    objc_copyWeak(&v15, &location);
    uint64_t v14 = self;
    BOOL v16 = v6;
    dispatch_async(observerQueue, &v10);
    if (v7) {
      -[PBHomeAccessoryManager _disableARCIfNecessary](self, "_disableARCIfNecessary", v10, v11, v12, v13);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  id v9 = self->_lastSeenMediaDestination;
  self->_lastSeenMediaDestination = v4;
}

- (void)_disableARCIfNecessary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
  uint64_t v3 = (char *)[v2 eARCStatus] - 1;

  if ((unint64_t)v3 <= 2)
  {
    uint64_t v5 = TVCSHomeLog(v4);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PBHomeAccessoryManager: Attempting to disable eARC because Odeon was torn down",  v8,  2u);
    }

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
    [v7 enableEARC:0];
  }

- (void)_startBuddyHomeTheaterTimer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_clearBuddySelectedHomeTheaterPreferences",  0LL,  0LL,  120.0));
  -[PBHomeAccessoryManager setBuddyHomeTheaterPreferencesCleanUpTimer:]( self,  "setBuddyHomeTheaterPreferencesCleanUpTimer:",  v3);
}

- (void)_clearBuddySelectedHomeTheaterPreferences
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  objc_msgSend(v2, "pbs_setBuddySelectedHomeTheaterSpeakerIdentifier:", 0);
  objc_msgSend(v2, "pbs_setBuddySelectedHomeTheaterSpeakerType:", 0);
  objc_msgSend(v2, "pbs_setBuddySelectedHomeTheaterHomePodVariant:", 0);
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVCSHome)_home
{
  return self->_home;
}

- (TVCSAccessory)_accessory
{
  return self->_accessory;
}

- (int64_t)_homeConfigurationState
{
  return self->_homeConfigurationState;
}

- (double)_waitingForCloudDataTime
{
  return self->_waitingForiCloudDataTime;
}

- (void)_setWaitingForCloudDataTime:(double)a3
{
  self->_waitingForiCloudDataTime = a3;
}

- (HMMediaDestination)lastSeenMediaDestination
{
  return self->_lastSeenMediaDestination;
}

- (void)setLastSeenMediaDestination:(id)a3
{
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSTimer)buddyHomeTheaterPreferencesCleanUpTimer
{
  return self->_buddyHomeTheaterPreferencesCleanUpTimer;
}

- (void)setBuddyHomeTheaterPreferencesCleanUpTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end