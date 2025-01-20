@interface CSDDeviceLockStateObserver
- (BOOL)hasBeenUnlockedSinceBoot;
- (CSDDeviceLockStateObserver)initWithFirstUnlockObserver:(id)a3 whenUnlockedObserver:(id)a4 queue:(id)a5;
- (CSDDeviceLockStateObserver)initWithQueue:(id)a3;
- (NSMutableArray)firstUnlockCallbacks;
- (NSMutableArray)whenUnlockedCallbacks;
- (OS_dispatch_queue)queue;
- (TUNotifyObserver)firstUnlockObserver;
- (TUNotifyObserver)whenUnlockedObserver;
- (id)hasBeenUnlockedSinceBootBlock;
- (id)mobileKeyLockStateBlock;
- (int)mobileKeyLockState;
- (void)_handleDeviceFirstUnlockNotification;
- (void)_handleDeviceLockStatusNotification;
- (void)_refreshHasBeenUnlockedSinceBoot;
- (void)performBlockAfterFirstUnlock:(id)a3;
- (void)performBlockWhenUnlocked:(id)a3;
- (void)setFirstUnlockCallbacks:(id)a3;
- (void)setFirstUnlockObserver:(id)a3;
- (void)setHasBeenUnlockedSinceBoot:(BOOL)a3;
- (void)setHasBeenUnlockedSinceBootBlock:(id)a3;
- (void)setMobileKeyLockState:(int)a3;
- (void)setMobileKeyLockStateBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWhenUnlockedCallbacks:(id)a3;
- (void)setWhenUnlockedObserver:(id)a3;
@end

@implementation CSDDeviceLockStateObserver

- (CSDDeviceLockStateObserver)initWithFirstUnlockObserver:(id)a3 whenUnlockedObserver:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (dispatch_queue_s *)a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CSDDeviceLockStateObserver;
  v12 = -[CSDDeviceLockStateObserver init](&v25, "init");
  if (v12)
  {
    dispatch_assert_queue_V2(v11);
    objc_storeStrong((id *)&v12->_queue, a5);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    firstUnlockCallbacks = v12->_firstUnlockCallbacks;
    v12->_firstUnlockCallbacks = (NSMutableArray *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    whenUnlockedCallbacks = v12->_whenUnlockedCallbacks;
    v12->_whenUnlockedCallbacks = (NSMutableArray *)v15;

    id hasBeenUnlockedSinceBootBlock = v12->_hasBeenUnlockedSinceBootBlock;
    v12->_id hasBeenUnlockedSinceBootBlock = &stru_1003DADB8;

    id mobileKeyLockStateBlock = v12->_mobileKeyLockStateBlock;
    v12->_id mobileKeyLockStateBlock = &stru_1003DAE18;

    v12->_mobileKeyLockState = -1;
    objc_initWeak(&location, v12);
    objc_storeStrong((id *)&v12->_firstUnlockObserver, a3);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001363E4;
    v22[3] = &unk_1003D7DF0;
    objc_copyWeak(&v23, &location);
    -[TUNotifyObserver setCallback:](v12->_firstUnlockObserver, "setCallback:", v22);
    objc_storeStrong((id *)&v12->_whenUnlockedObserver, a4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100136410;
    v20[3] = &unk_1003D7DF0;
    objc_copyWeak(&v21, &location);
    -[TUNotifyObserver setCallback:](v12->_whenUnlockedObserver, "setCallback:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (CSDDeviceLockStateObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = -[TUNotifyObserver initWithNotificationName:queue:]( objc_alloc(&OBJC_CLASS___TUNotifyObserver),  "initWithNotificationName:queue:",  @"com.apple.mobile.keybagd.first_unlock",  v4);
  v6 = -[TUNotifyObserver initWithNotificationName:queue:]( objc_alloc(&OBJC_CLASS___TUNotifyObserver),  "initWithNotificationName:queue:",  @"com.apple.mobile.keybagd.lock_status",  v4);
  v7 = -[CSDDeviceLockStateObserver initWithFirstUnlockObserver:whenUnlockedObserver:queue:]( self,  "initWithFirstUnlockObserver:whenUnlockedObserver:queue:",  v5,  v6,  v4);

  return v7;
}

- (void)_refreshHasBeenUnlockedSinceBoot
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (!-[CSDDeviceLockStateObserver hasBeenUnlockedSinceBoot](self, "hasBeenUnlockedSinceBoot"))
  {
    id v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( -[CSDDeviceLockStateObserver hasBeenUnlockedSinceBootBlock]( self,  "hasBeenUnlockedSinceBootBlock"));
    uint64_t v5 = v4[2]();

    if ((_DWORD)v5 != -[CSDDeviceLockStateObserver hasBeenUnlockedSinceBoot](self, "hasBeenUnlockedSinceBoot"))
    {
      id v6 = sub_1001704C4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109376;
        v8[1] = -[CSDDeviceLockStateObserver hasBeenUnlockedSinceBoot](self, "hasBeenUnlockedSinceBoot");
        __int16 v9 = 1024;
        int v10 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "hasBeenUnlockedSinceBoot changing from %d to %d",  (uint8_t *)v8,  0xEu);
      }

      -[CSDDeviceLockStateObserver setHasBeenUnlockedSinceBoot:](self, "setHasBeenUnlockedSinceBoot:", v5);
    }
  }

- (void)_handleDeviceFirstUnlockNotification
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSDDeviceLockStateObserver _refreshHasBeenUnlockedSinceBoot](self, "_refreshHasBeenUnlockedSinceBoot");
  if (-[CSDDeviceLockStateObserver hasBeenUnlockedSinceBoot](self, "hasBeenUnlockedSinceBoot"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver firstUnlockObserver](self, "firstUnlockObserver"));
    [v4 endObserving];

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver firstUnlockCallbacks](self, "firstUnlockCallbacks", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        __int16 v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v9) + 16LL))();
          __int16 v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver firstUnlockCallbacks](self, "firstUnlockCallbacks"));
    [v10 removeAllObjects];
  }

- (void)_handleDeviceLockStatusNotification
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver mobileKeyLockStateBlock](self, "mobileKeyLockStateBlock"));
  uint64_t v5 = v4[2]();

  BOOL v6 = (_DWORD)v5 == 3 || (_DWORD)v5 == 0;
  if (v6
    && -[CSDDeviceLockStateObserver mobileKeyLockState](self, "mobileKeyLockState")
    && -[CSDDeviceLockStateObserver mobileKeyLockState](self, "mobileKeyLockState") != 3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedCallbacks](self, "whenUnlockedCallbacks"));
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = sub_1001704C4();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v24 = -[CSDDeviceLockStateObserver mobileKeyLockState](self, "mobileKeyLockState");
        __int16 v25 = 1024;
        int v26 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "mobileKeyLockState changing from %d to %d",  buf,  0xEu);
      }
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedObserver](self, "whenUnlockedObserver"));
    [v11 endObserving];

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedCallbacks](self, "whenUnlockedCallbacks", 0LL));
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8LL * (void)v16) + 16LL))();
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v14);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedCallbacks](self, "whenUnlockedCallbacks"));
    [v17 removeAllObjects];
  }

  -[CSDDeviceLockStateObserver setMobileKeyLockState:](self, "setMobileKeyLockState:", v5);
}

- (void)performBlockAfterFirstUnlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDDeviceLockStateObserver _refreshHasBeenUnlockedSinceBoot](self, "_refreshHasBeenUnlockedSinceBoot");
  unsigned int v6 = -[CSDDeviceLockStateObserver hasBeenUnlockedSinceBoot](self, "hasBeenUnlockedSinceBoot");
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Device has been unlocked since boot, so invoking block immediately",  buf,  2u);
    }

    v4[2](v4);
LABEL_12:

    return;
  }

  if (v9)
  {
    *(_WORD *)__int128 v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Device has not been unlocked since boot, so storing block to be performed upon first unlock after boot",  v20,  2u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver firstUnlockCallbacks](self, "firstUnlockCallbacks"));
  id v11 = [v4 copy];

  id v12 = objc_retainBlock(v11);
  [v10 addObject:v12];

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver firstUnlockObserver](self, "firstUnlockObserver"));
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver firstUnlockObserver](self, "firstUnlockObserver"));
    unsigned __int8 v16 = [v15 isObserving];

    if ((v16 & 1) == 0)
    {
      id v17 = sub_1001704C4();
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v19 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Device has not been unlocked-after-boot and is not yet observing device lock-after-boot changes, so begin to o bserve device unlock-after-boot changes",  v19,  2u);
      }

      id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[CSDDeviceLockStateObserver firstUnlockObserver]( self,  "firstUnlockObserver"));
      [v4 beginObserving];
      goto LABEL_12;
    }
  }

- (void)performBlockWhenUnlocked:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (-[CSDDeviceLockStateObserver mobileKeyLockState](self, "mobileKeyLockState") == -1)
  {
    unsigned int v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver mobileKeyLockStateBlock](self, "mobileKeyLockStateBlock"));
    -[CSDDeviceLockStateObserver setMobileKeyLockState:](self, "setMobileKeyLockState:", v6[2]());
  }

  if (-[CSDDeviceLockStateObserver mobileKeyLockState](self, "mobileKeyLockState")
    && -[CSDDeviceLockStateObserver mobileKeyLockState](self, "mobileKeyLockState") != 3)
  {
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding callback to perform on next unlock",  v22,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedCallbacks](self, "whenUnlockedCallbacks"));
    id v12 = [v4 copy];
    id v13 = objc_retainBlock(v12);
    [v11 addObject:v13];

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedObserver](self, "whenUnlockedObserver"));
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedObserver](self, "whenUnlockedObserver"));
      unsigned __int8 v17 = [v16 isObserving];

      if ((v17 & 1) == 0)
      {
        id v18 = sub_1001704C4();
        __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 v21 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Device is not yet observing device unlock changes, beginning to observe device unlock changes",  v21,  2u);
        }

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDeviceLockStateObserver whenUnlockedObserver](self, "whenUnlockedObserver"));
        [v20 beginObserving];
      }
    }
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Device unlocked, performing callback immediately",  buf,  2u);
    }

    v4[2](v4);
  }
}

- (id)hasBeenUnlockedSinceBootBlock
{
  return self->_hasBeenUnlockedSinceBootBlock;
}

- (void)setHasBeenUnlockedSinceBootBlock:(id)a3
{
}

- (id)mobileKeyLockStateBlock
{
  return self->_mobileKeyLockStateBlock;
}

- (void)setMobileKeyLockStateBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)firstUnlockCallbacks
{
  return self->_firstUnlockCallbacks;
}

- (void)setFirstUnlockCallbacks:(id)a3
{
}

- (NSMutableArray)whenUnlockedCallbacks
{
  return self->_whenUnlockedCallbacks;
}

- (void)setWhenUnlockedCallbacks:(id)a3
{
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  return self->_hasBeenUnlockedSinceBoot;
}

- (void)setHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_hasBeenUnlockedSinceBoot = a3;
}

- (int)mobileKeyLockState
{
  return self->_mobileKeyLockState;
}

- (void)setMobileKeyLockState:(int)a3
{
  self->_mobileKeyLockState = a3;
}

- (TUNotifyObserver)firstUnlockObserver
{
  return self->_firstUnlockObserver;
}

- (void)setFirstUnlockObserver:(id)a3
{
}

- (TUNotifyObserver)whenUnlockedObserver
{
  return self->_whenUnlockedObserver;
}

- (void)setWhenUnlockedObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end