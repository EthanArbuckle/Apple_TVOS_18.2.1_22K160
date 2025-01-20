@interface SDActivityController
- (BOOL)restart;
- (BOOL)shouldStart;
- (IDSService)activityService;
- (NSArray)allPeerBTIdentifiers;
- (NSString)appleID;
- (SDActivityController)init;
- (id)idsDeviceFromBTIdentifier:(id)a3;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActivityService:(id)a3;
- (void)setAllPeerBTIdentifiers:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setShouldStart:(BOOL)a3;
@end

@implementation SDActivityController

- (SDActivityController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDActivityController;
  v2 = -[SDXPCDaemon init](&v6, "init");
  if (v2)
  {
    v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.activity");
    activityService = v2->_activityService;
    v2->_activityService = v3;

    -[IDSService addDelegate:queue:](v2->_activityService, "addDelegate:queue:", v2, &_dispatch_main_q);
  }

  return v2;
}

- (BOOL)restart
{
  return 0;
}

- (id)idsDeviceFromBTIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nsuuid]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSString)appleID
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityController activityService](self, "activityService", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accounts]);

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 loginID]);

        if (v8)
        {
          id v4 = (id)objc_claimAutoreleasedReturnValue([v7 loginID]);
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)shouldStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v4 = [v3 isActivityContinuationAllowed];

  if ((v4 & 1) == 0)
  {
    uint64_t v15 = handoff_log(v5, v6);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Handoff is disabled in settings on this device",  buf,  2u);
    }

    BOOL v16 = 0;
    goto LABEL_27;
  }

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ((-[os_log_s deviceWasUnlockedOnce](v7, "deviceWasUnlockedOnce") & 1) != 0
    || (id v8 = -[os_log_s deviceUIUnlocked](v7, "deviceUIUnlocked"), (v8 & 1) != 0))
  {
    id v10 = -[os_log_s alwaysSendPayload](v7, "alwaysSendPayload");
    if ((_DWORD)v10)
    {
      uint64_t v12 = handoff_log(v10, v11);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      __int128 v14 = "Real Handoff is disabled since alwaysSendPayload is enabled";
    }

    else
    {
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices", 0LL));
      id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v29;
        while (2)
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v13);
            }
            v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
            if ([v21 supportsHandoff])
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v21 nsuuid]);

              if (v22)
              {
                BOOL v16 = 1;
                goto LABEL_26;
              }
            }
          }

          id v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v25 = handoff_log(v23, v24);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      __int128 v14 = "Failed to find any valid cloud paired devices";
    }
  }

  else
  {
    uint64_t v26 = handoff_log(v8, v9);
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    __int128 v14 = "Handoff is disabled until first unlock has occurred";
  }

  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
LABEL_24:
  BOOL v16 = 0;
LABEL_26:

LABEL_27:
  return v16;
}

- (NSArray)allPeerBTIdentifiers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nsuuid]);
        else {
          BOOL v11 = 1;
        }
        if (!v11) {
          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  uint64_t v7 = handoff_log(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKeyPath:@"@unionOfObjects.uniqueIDOverride"]);
    uint64_t v10 = SFCompactStringFromCollection(v9);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v13 = 138412290;
    __int128 v14 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "List of Activity Continuation devices changed %@",  (uint8_t *)&v13,  0xCu);
  }

  -[SDActivityController activityServiceDevicesChanged:](self, "activityServiceDevicesChanged:", v5);
  if ([v5 count])
  {
    -[SDActivityController restart](self, "restart");
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
    [v12 deleteAllEncryptionAndDecryptionKeys];
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = handoff_log(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000581AC(v6, v10);
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v7 devices]);
  -[SDActivityController nearbyServiceDevicesChanged:](self, "nearbyServiceDevicesChanged:", v11);
}

- (IDSService)activityService
{
  return self->_activityService;
}

- (void)setActivityService:(id)a3
{
}

- (void)setShouldStart:(BOOL)a3
{
  self->_shouldStart = a3;
}

- (void)setAllPeerBTIdentifiers:(id)a3
{
}

- (void)setAppleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end