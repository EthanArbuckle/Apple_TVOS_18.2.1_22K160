@interface CBStackAccessoryMonitorBTStack
- (CBStackAccessoryMonitorBTStack)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)audioAccessoryEventHandler;
- (id)audioAccessoryInfoChangedHandler;
- (id)getAudioAccessoryDeviceArray;
- (id)invalidationHandler;
- (void)_accessoryContextMessageData:(id)a3 device:(id)a4;
- (void)_accessoryConversationDetectMessageData:(id)a3 device:(id)a4;
- (void)_accessoryPMEConfigData:(id)a3 device:(id)a4;
- (void)_invalidated;
- (void)_updateAudioAccessoryDeviceInfo:(void *)a3 flags:(unint64_t)a4;
- (void)_updateConnectedAudioAccessories;
- (void)activate;
- (void)invalidate;
- (void)localDeviceEvent:(int)a3;
- (void)setAudioAccessoryEventHandler:(id)a3;
- (void)setAudioAccessoryInfoChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)updateAccessoryInfo;
@end

@implementation CBStackAccessoryMonitorBTStack

- (CBStackAccessoryMonitorBTStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBStackAccessoryMonitorBTStack;
  v2 = -[CBStackAccessoryMonitorBTStack init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)getAudioAccessoryDeviceArray
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100077624;
  v11 = sub_100077634;
  id v12 = 0LL;
  v2 = self;
  objc_sync_enter(v2);
  accessoryDeviceInfoMap = v2->_accessoryDeviceInfoMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007763C;
  v6[3] = &unk_100881518;
  v6[4] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accessoryDeviceInfoMap,  "enumerateKeysAndObjectsUsingBlock:",  v6);
  objc_sync_exit(v2);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)activate
{
  if (!self->_audioAccessoryEventHandler)
  {
    FatalErrorF("CBStackAccessoryMonitor: No audioAccessoryEventHandler", a2);
    goto LABEL_15;
  }

  if (!self->_audioAccessoryInfoChangedHandler)
  {
LABEL_15:
    FatalErrorF("CBStackAccessoryMonitor: No audioAccessoryInfoChangedHandler", a2);
    goto LABEL_16;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_16:
    FatalErrorF("CBStackAccessoryMonitor: No dispatchQueue", a2);
    goto LABEL_17;
  }

  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_invalidateCalled)
  {
LABEL_17:
    uint64_t v6 = FatalErrorF("CBStackAccessoryMonitor: Activate after invalidate", v4);
    sub_100077828(v6, v7);
    return;
  }

  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9EE8);
    v5 = (void *)qword_1008D9EF0;
    if (!qword_1008D9EF0)
    {
      v5 = operator new(0x28uLL);
      void *v5 = off_1008815B0;
      v5[1] = off_100881638;
      v5[2] = &off_100881668;
      v5[3] = 0LL;
      *((_BYTE *)v5 + 32) = 0;
      qword_1008D9EF0 = (uint64_t)v5;
    }

    sub_100077828((uint64_t)v5, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9EE8);
    self->_addedMonitor = 1;
  }

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1008D67F0 <= 30
      && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 30LL)))
    {
      LogPrintF_safe(&dword_1008D67F0, "-[CBStackAccessoryMonitorBTStack invalidate]", 30LL, "Invalidate");
    }

    if (self->_addedMonitor)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9EE8);
      if (qword_1008D9EF0) {
        sub_100077A7C(qword_1008D9EF0, self);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9EE8);
      self->_addedMonitor = 0;
    }

    -[CBStackAccessoryMonitorBTStack _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id audioAccessoryEventHandler = self->_audioAccessoryEventHandler;
    self->_id audioAccessoryEventHandler = 0LL;

    id audioAccessoryInfoChangedHandler = self->_audioAccessoryInfoChangedHandler;
    self->_id audioAccessoryInfoChangedHandler = 0LL;

    uint64_t v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v6) {
      v6[2]();
    }
    self->_invalidateDone = 1;
    if (dword_1008D67F0 <= 30
      && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 30LL)))
    {
      LogPrintF_safe(&dword_1008D67F0, "-[CBStackAccessoryMonitorBTStack _invalidated]", 30LL, "Invalidated");
    }
  }

- (void)localDeviceEvent:(int)a3
{
  if (a3 == 5 && self->_addedMonitor)
  {
    if (dword_1008D67F0 <= 30
      && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 30LL)))
    {
      LogPrintF_safe( &dword_1008D67F0,  "-[CBStackAccessoryMonitorBTStack localDeviceEvent:]",  30LL,  "Connection status changed");
    }

    -[CBStackAccessoryMonitorBTStack updateAccessoryInfo](self, "updateAccessoryInfo");
  }

- (void)_accessoryContextMessageData:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 4LL, v9, v6);
  }
}

- (void)_accessoryConversationDetectMessageData:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 2LL, v9, v6);
  }
}

- (void)_accessoryPMEConfigData:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 5LL, v9, v6);
  }
}

- (void)updateAccessoryInfo
{
  if (self->_addedMonitor)
  {
    v2 = self;
    objc_sync_enter(v2);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( v2->_accessoryDeviceInfoMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_100881558);
    objc_sync_exit(v2);

    -[CBStackAccessoryMonitorBTStack _updateConnectedAudioAccessories](v2, "_updateConnectedAudioAccessories");
    v3 = v2;
    objc_sync_enter(v3);
    accessoryDeviceInfoMap = v2->_accessoryDeviceInfoMap;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10007821C;
    v17[3] = &unk_100881580;
    v17[4] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accessoryDeviceInfoMap,  "enumerateKeysAndObjectsUsingBlock:",  v17);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_accessoryDeviceInfoMap, "allKeys"));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_accessoryDeviceInfoMap,  "objectForKeyedSubscript:",  v9));
          if (([v10 discoveryFlags] & 0x200000) == 0)
          {
            v11 = v3;
            objc_sync_enter(v11);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_accessoryDeviceInfoMap,  "setObject:forKeyedSubscript:",  0LL,  v9);
            objc_sync_exit(v11);

            if (dword_1008D67F0 <= 30
              && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 30LL)))
            {
              id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
              LogPrintF_safe( &dword_1008D67F0,  "-[CBStackAccessoryMonitorBTStack updateAccessoryInfo]",  30LL,  "Removed Audio Accessory Device: %@",  v12);
            }
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v6);
    }

    objc_sync_exit(v3);
  }

- (void)_updateConnectedAudioAccessories
{
  v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_100881670);
  }
  int v3 = sub_10040A790((uint64_t)off_1008D5EF8, (void **)&v8);
  if (v3
    && dword_1008D67F0 <= 90
    && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 90LL)))
  {
    uint64_t v4 = CUPrintErrorCode((v3 + 310000));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    LogPrintF_safe( &dword_1008D67F0,  "-[CBStackAccessoryMonitorBTStack _updateConnectedAudioAccessories]",  90LL,  "### GetConnectedDevices failed: %@",  v5);
  }

  id v6 = v8;
  uint64_t v7 = v9;
  if (v8 != v9)
  {
    do
      -[CBStackAccessoryMonitorBTStack _updateAudioAccessoryDeviceInfo:flags:]( self,  "_updateAudioAccessoryDeviceInfo:flags:",  *v6++,  0x200000LL);
    while (v6 != v7);
    id v6 = v8;
  }

  if (v6)
  {
    uint64_t v9 = v6;
    operator delete(v6);
  }

- (void)_updateAudioAccessoryDeviceInfo:(void *)a3 flags:(unint64_t)a4
{
  id v16 = 0LL;
  uint64_t v7 = -[CBDevice initWithBTStackDevice:error:]( objc_alloc(&OBJC_CLASS___CBDevice),  "initWithBTStackDevice:error:",  a3,  &v16);
  id v8 = v16;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](v7, "identifier"));
    uint64_t v10 = self;
    objc_sync_enter(v10);
    v11 = (AudioAccessoryDeviceInfo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v10->_accessoryDeviceInfoMap,  "objectForKeyedSubscript:",  v9));
    if (!v11)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___AudioAccessoryDeviceInfo);
      -[AudioAccessoryDeviceInfo setIdentifier:](v11, "setIdentifier:", v9);
      accessoryDeviceInfoMap = v10->_accessoryDeviceInfoMap;
      if (!accessoryDeviceInfoMap)
      {
        __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v14 = v10->_accessoryDeviceInfoMap;
        v10->_accessoryDeviceInfoMap = v13;

        accessoryDeviceInfoMap = v10->_accessoryDeviceInfoMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( accessoryDeviceInfoMap,  "setObject:forKeyedSubscript:",  v11,  v9);
    }

    -[AudioAccessoryDeviceInfo setChangeFlags:]( v11,  "setChangeFlags:",  -[AudioAccessoryDeviceInfo changeFlags](v11, "changeFlags") | -[AudioAccessoryDeviceInfo updateWithClassicDevice:]( v11,  "updateWithClassicDevice:",  a3));
    -[AudioAccessoryDeviceInfo setDiscoveryFlags:]( v11,  "setDiscoveryFlags:",  -[AudioAccessoryDeviceInfo discoveryFlags](v11, "discoveryFlags") | a4);

    objc_sync_exit(v10);
    goto LABEL_7;
  }

  if (dword_1008D67F0 <= 90 && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 90LL)))
  {
    uint64_t v15 = CUPrintNSError(v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe( &dword_1008D67F0,  "-[CBStackAccessoryMonitorBTStack _updateAudioAccessoryDeviceInfo:flags:]",  90LL,  "### AudioAccessoryDeviceInfo init device failed: %@",  v9);
LABEL_7:
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)audioAccessoryEventHandler
{
  return self->_audioAccessoryEventHandler;
}

- (void)setAudioAccessoryEventHandler:(id)a3
{
}

- (id)audioAccessoryInfoChangedHandler
{
  return self->_audioAccessoryInfoChangedHandler;
}

- (void)setAudioAccessoryInfoChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end