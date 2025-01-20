@interface PDPrivacyKeyMonitor
- (BOOL)isMonitoring;
- (PDPrivacyKeyMonitor)init;
- (PDPrivacyKeyMonitor)initWithNotificationStreamManager:(id)a3;
- (id)_keysForEntry:(id)a3;
- (id)createCurrentNotificationRegistrationState;
- (void)_checkEntriesForNewKeys;
- (void)_entryDidTimeout:(id)a3;
- (void)_updateNotificationMonitoring;
- (void)_waitForKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 timeout:(double)a5 newKey:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)waitForKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)waitForKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)waitForNewKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)waitForNewKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation PDPrivacyKeyMonitor

- (PDPrivacyKeyMonitor)init
{
  return 0LL;
}

- (PDPrivacyKeyMonitor)initWithNotificationStreamManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDPrivacyKeyMonitor;
  v6 = -[PDPrivacyKeyMonitor init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationStreamManager, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___PKDAManager);
    daManager = v7->_daManager;
    v7->_daManager = v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    entries = v7->_entries;
    v7->_entries = v10;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_isRegisteredForNotifications) {
    -[PDNotificationStreamManager unregisterConsumer:](self->_notificationStreamManager, "unregisterConsumer:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPrivacyKeyMonitor;
  -[PDPrivacyKeyMonitor dealloc](&v3, "dealloc");
}

- (BOOL)isMonitoring
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_entries, "count") != 0LL;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)waitForNewKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)waitForNewKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)waitForKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)waitForKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)_waitForKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 timeout:(double)a5 newKey:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  v15 = objc_alloc_init(&OBJC_CLASS___PDPrivacyKeyMonitorEntry);
  -[PDPrivacyKeyMonitorEntry setGroupIdentifier:](v15, "setGroupIdentifier:", v12);
  -[PDPrivacyKeyMonitorEntry setPublicKeyIdentifier:](v15, "setPublicKeyIdentifier:", v13);
  -[PDPrivacyKeyMonitorEntry setTimeout:](v15, "setTimeout:", a5);
  -[PDPrivacyKeyMonitorEntry setCompletion:](v15, "setCompletion:", v14);
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "PDPrivacyKeyMonitor: Begining monitoring for %@",  buf,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDPrivacyKeyMonitor _keysForEntry:](self, "_keysForEntry:", v15));
  v19 = v18;
  if (a6 || ![v18 count])
  {
    -[PDPrivacyKeyMonitorEntry setExistingKeys:](v15, "setExistingKeys:", v19);
    -[NSMutableArray addObject:](self->_entries, "addObject:", v15);
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak((id *)buf, self);
    dispatch_time_t v20 = dispatch_time(0LL, (uint64_t)(a5 * 1000000000.0));
    id v21 = PDDefaultQueue();
    v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    v25 = sub_100384860;
    v26 = &unk_1006393A0;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v15;
    dispatch_after(v20, v22, &v23);

    -[PDPrivacyKeyMonitor _updateNotificationMonitoring](self, "_updateNotificationMonitoring", v23, v24, v25, v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v14[2](v14, 1LL);
  }
}

- (void)_updateNotificationMonitoring
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_entries, "count"))
  {
    if (!self->_isRegisteredForNotifications)
    {
      self->_isRegisteredForNotifications = 1;
      os_unfair_lock_unlock(p_lock);
      -[PDNotificationStreamManager registerConsumer:](self->_notificationStreamManager, "registerConsumer:", self);
      return;
    }
  }

  else if (self->_isRegisteredForNotifications)
  {
    self->_isRegisteredForNotifications = 0;
    os_unfair_lock_unlock(p_lock);
    -[PDNotificationStreamManager unregisterConsumer:](self->_notificationStreamManager, "unregisterConsumer:", self);
    return;
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)_keysForEntry:(id)a3
{
  return 0LL;
}

- (void)_checkEntriesForNewKeys
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[NSMutableArray copy](self->_entries, "copy");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPrivacyKeyMonitor _keysForEntry:](self, "_keysForEntry:", v9, lock));
        id v11 = [v10 count];
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 existingKeys]);
        id v13 = [v12 count];

        if (v11 > v13)
        {
          -[NSMutableArray removeObjectIdenticalTo:](self->_entries, "removeObjectIdenticalTo:", v9);
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(lock);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v14 = v3;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v35,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
        uint64_t Object = PKLogFacilityTypeGetObject(22LL);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PDPrivacyKeyMonitor: Receive new key for %@",  buf,  0xCu);
        }

        v22 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v19 completion]);
        v22[2](v22, 1LL);
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v35,  16LL);
    }

    while (v16);
  }

  -[PDPrivacyKeyMonitor _updateNotificationMonitoring](self, "_updateNotificationMonitoring");
}

- (void)_entryDidTimeout:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDPrivacyKeyMonitor: did timeout for %@",  (uint8_t *)&v9,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  id v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_entries, "indexOfObjectIdenticalTo:", v4);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_entries, "removeObjectAtIndex:", v7);
    os_unfair_lock_unlock(&self->_lock);
    v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completion]);
    v8[2](v8, 0LL);
  }

  -[PDPrivacyKeyMonitor _updateNotificationMonitoring](self, "_updateNotificationMonitoring");
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  objc_super v3 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"com.apple.private.seserviced.sesprivacykey",  0LL);
  -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v3,  0LL);

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  if (PKEqualObjects(a3, @"com.apple.private.seserviced.sesprivacykey"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PDPrivacyKeyMonitor: did receiver key update notification",  v8,  2u);
    }

    -[PDPrivacyKeyMonitor _checkEntriesForNewKeys](self, "_checkEntriesForNewKeys");
  }

- (void).cxx_destruct
{
}

@end