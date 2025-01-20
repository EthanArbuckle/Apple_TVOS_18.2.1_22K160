@interface _DASDataProtectionMaster
+ (id)sharedInstance;
- (BOOL)deviceFormatedForContentProtection;
- (BOOL)deviceHasBeenUnlockedSinceBoot;
- (BOOL)deviceIsLocked;
- (BOOL)deviceIsPasswordConfigured;
- (BOOL)isDataAvailableFor:(id)a3;
- (BOOL)isDataAvailableForClassA;
- (BOOL)isDataAvailableForClassC;
- (BOOL)notifyEnabled;
- (NSMutableDictionary)availableState;
- (NSMutableDictionary)handlers;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)stateQueue;
- (_DASDataProtectionMaster)init;
- (id)registerStateChangeHandler:(id)a3;
- (int)notifyToken;
- (void)deregisterStateChangeHandler:(id)a3;
- (void)handleKeyBagLockNotification;
@end

@implementation _DASDataProtectionMaster

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026B00;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157610 != -1) {
    dispatch_once(&qword_100157610, block);
  }
  return (id)qword_100157608;
}

- (_DASDataProtectionMaster)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS____DASDataProtectionMaster;
  v2 = -[_DASDataProtectionMaster init](&v31, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.state", 0LL);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v3;

    v2->_deviceFormatedForContentProtection = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v7;

    v9 = v2->_availableState;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassA]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassA"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v10);

    v11 = v2->_availableState;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v12);

    v13 = v2->_availableState;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassD]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassD"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v14);

    int v15 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v15 != 0;
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_DASDataProtectionMaster isDataAvailableForClassA](v2, "isDataAvailableForClassA")));
      v17 = v2->_availableState;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassA]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassA"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_DASDataProtectionMaster isDataAvailableForClassC](v2, "isDataAvailableForClassC")));
      v20 = v2->_availableState;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

      v22 = v2->_availableState;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassD]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassD"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v23);

      dispatch_queue_t v24 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.notify", 0LL);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v24;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v26 = (dispatch_queue_s *)v2->_notifyQueue;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100026DF0;
      v28[3] = &unk_1001156F0;
      objc_copyWeak(&v29, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v26, v28);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return v2;
}

- (void)handleKeyBagLockNotification
{
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_100027120;
  v34[4] = sub_100027130;
  id v35 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  objc_super v31 = sub_100027120;
  v32 = sub_100027130;
  id v33 = 0LL;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027138;
  block[3] = &unk_100115718;
  block[4] = self;
  void block[5] = v34;
  block[6] = &v28;
  dispatch_sync(stateQueue, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v5 = (dispatch_queue_s *)self->_stateQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10002724C;
  v24[3] = &unk_1001154E8;
  v26 = v34;
  v24[4] = self;
  id v6 = v4;
  id v25 = v6;
  dispatch_sync(v5, v24);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * (void)v10)]);
        [v11 BOOLValue];

        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v12 = (id)v29[5];
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v36 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v17;
          do
          {
            int v15 = 0LL;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v12);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)v15) + 16LL))();
              int v15 = (char *)v15 + 1;
            }

            while (v13 != v15);
            id v13 = [v12 countByEnumeratingWithState:&v16 objects:v36 count:16];
          }

          while (v13);
        }

        v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v37 count:16];
    }

    while (v8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot(self, a2) != 0;
}

- (BOOL)deviceIsPasswordConfigured
{
  v2 = (const __CFBoolean *)MGCopyAnswer(@"PasswordConfigured", 0LL);
  CFBooleanRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 == kCFBooleanTrue;
}

- (BOOL)deviceIsLocked
{
  v2 = (const __CFBoolean *)MGCopyAnswer(@"PasswordProtected", 0LL);
  CFBooleanRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 == kCFBooleanTrue;
}

- (BOOL)isDataAvailableForClassC
{
  if (-[_DASDataProtectionMaster deviceHasBeenUnlockedSinceBoot](self, "deviceHasBeenUnlockedSinceBoot")) {
    return 1;
  }
  else {
    return !-[_DASDataProtectionMaster deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
  }
}

- (BOOL)isDataAvailableForClassA
{
  if (-[_DASDataProtectionMaster deviceIsLocked](self, "deviceIsLocked")) {
    return !-[_DASDataProtectionMaster deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
  }
  else {
    return 1;
  }
}

- (BOOL)isDataAvailableFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_deviceFormatedForContentProtection)
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    stateQueue = (dispatch_queue_s *)self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000275C0;
    block[3] = &unk_1001152D8;
    block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(stateQueue, block);
    BOOL v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)registerStateChangeHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    stateQueue = (dispatch_queue_s *)self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000276E8;
    block[3] = &unk_100115740;
    block[4] = self;
    id v7 = v5;
    id v12 = v7;
    id v13 = v4;
    dispatch_sync(stateQueue, block);
    id v8 = v13;
    id v9 = v7;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)deregisterStateChangeHandler:(id)a3
{
  id v4 = a3;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000277A8;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)deviceFormatedForContentProtection
{
  return self->_deviceFormatedForContentProtection;
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)availableState
{
  return self->_availableState;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (void).cxx_destruct
{
}

@end