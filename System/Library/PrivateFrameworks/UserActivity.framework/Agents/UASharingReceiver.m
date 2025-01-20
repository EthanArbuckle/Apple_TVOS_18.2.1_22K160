@interface UASharingReceiver
- (BOOL)_addItem:(id)a3 scheduleUpdates:(BOOL)a4;
- (BOOL)active;
- (BOOL)addItem:(id)a3 scheduleUpdates:(BOOL)a4;
- (BOOL)addSFActivityScanner:(id)a3;
- (BOOL)fetchMoreAppSuggestions;
- (BOOL)forceScanning;
- (BOOL)receiving;
- (BOOL)removeItem:(id)a3;
- (BOOL)removeSFActivityScanner:(id)a3;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (NSSet)activeDevices;
- (NSSet)sfActivityScanners;
- (NSTimer)remotePboardTimer;
- (SFPeerDevice)lastSeenPasteboardDevice;
- (UADispatchScheduler)periodicCleanup;
- (UASharingReceiver)initWithManager:(id)a3;
- (id)receivedItems;
- (id)sfActivityScanner;
- (id)sharingBTLESuggestedItemForAdvertisementPayload:(id)a3 forDevice:(id)a4;
- (id)statusString;
- (int64_t)lastSeenPasteboardVersionBit;
- (void)activityScanner:(id)a3 foundDeviceWithDevice:(id)a4;
- (void)activityScanner:(id)a3 lostDeviceWithDevice:(id)a4;
- (void)activityScanner:(id)a3 receivedAdvertisement:(id)a4;
- (void)addNewItemsFromPayloads:(id)a3 device:(id)a4 scanner:(id)a5 force:(BOOL)a6;
- (void)clearRemotePasteboardAvailable:(id)a3;
- (void)fetchMoreAppSuggestionsFromDevice:(id)a3;
- (void)foundDevice:(id)a3;
- (void)lostDevice:(id)a3;
- (void)lostDeviceWithUUID:(id)a3;
- (void)periodicCleanupFunc;
- (void)receiveAdvertisement:(id)a3 scanner:(id)a4;
- (void)removeAllFromDevice:(id)a3;
- (void)setForceScanning:(BOOL)a3;
- (void)setLastSeenPasteboardDevice:(id)a3;
- (void)setLastSeenPasteboardVersionBit:(int64_t)a3;
- (void)setRemotePboardTimer:(id)a3;
- (void)setScanningForTypes:(id)a3;
@end

@implementation UASharingReceiver

- (UASharingReceiver)initWithManager:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___UASharingReceiver;
  v3 = -[UAReceiver initWithManager:name:](&v20, "initWithManager:name:", a3, @"SharingReceiver");
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    sfActivityScanners = v3->_sfActivityScanners;
    v3->_sfActivityScanners = (NSMutableSet *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activeDevices = v3->_activeDevices;
    v3->_activeDevices = (NSMutableSet *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    receivedItems = v3->_receivedItems;
    v3->_receivedItems = (NSMutableSet *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    recentlyLostDeviceIDs = v3->_recentlyLostDeviceIDs;
    v3->_recentlyLostDeviceIDs = (NSMutableSet *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v3, "manager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mainDispatchQ]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100042A0C;
    v18[3] = &unk_1000BCC58;
    v14 = v3;
    v19 = v14;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"SharingReceiverPeriodic",  v13,  v18,  0.0));
    periodicCleanup = v14->_periodicCleanup;
    v14->_periodicCleanup = (UADispatchScheduler *)v15;
  }

  return v3;
}

- (BOOL)receiving
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[NSMutableSet count](v2->_receivedItems, "count") != 0LL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setScanningForTypes:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v8 = sub_10005BF18(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "setScanningForTypes:%{public}@", buf, 0xCu);
  }

  if (v4
    || (uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UAReceiver scanningForTypes](self, "scanningForTypes")),
        !-[os_log_s count](v6, "count")))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAReceiver scanningForTypes](self, "scanningForTypes"));
    unsigned __int8 v11 = [v4 isEqual:v10];

    if (v4)
    {
      if ((v11 & 1) != 0) {
        goto LABEL_37;
      }
      goto LABEL_12;
    }

    if ((v11 & 1) != 0)
    {
      id v4 = 0LL;
      goto LABEL_37;
    }
  }

  else
  {
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));

  id v4 = (id)v12;
LABEL_12:
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___UASharingReceiver;
  -[UAReceiver setScanningForTypes:](&v31, "setScanningForTypes:", v4);
  else {
    v13 = "";
  }
  else {
    v14 = "";
  }
  if ([v4 count]) {
    uint64_t v15 = "";
  }
  else {
    uint64_t v15 = "-";
  }
  unsigned int v16 = -[UACornerActionManagerHandler suspended](self, "suspended");
  v17 = " SUSPENDED";
  if (!v16) {
    v17 = "";
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCANNING:%s%s%s%s",  v13,  v14,  v15,  v17));
  +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v18);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanners](self, "sfActivityScanners"));
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if (-[UACornerActionManagerHandler suspended](self, "suspended"))
        {
          sub_100042D98(v24, 0LL);
        }

        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
          else {
            v26 = 0LL;
          }
          sub_100042D98(v24, v26);
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v21);
  }

LABEL_37:
}

- (id)receivedItems
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v2->_receivedItems, "allObjects"));
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)activeDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_activeDevices, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)active
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UASharingReceiver;
  if (!-[UACornerActionManagerHandler active](&v5, "active")) {
    return 0;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned __int8 v3 = [v2 activityBTLESharingEnabled];

  return v3;
}

- (NSSet)sfActivityScanners
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_sfActivityScanners, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)addSFActivityScanner:(id)a3
{
  id v5 = a3;
  os_log_t v6 = sub_100039584(0LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "UASharingReceiver, adding activity scanner %{public}@.",  (uint8_t *)&v15,  0xCu);
  }

  if (v5)
  {
    id v8 = self;
    objc_sync_enter(v8);
    unsigned __int8 v9 = -[NSMutableSet containsObject:](v8->_sfActivityScanners, "containsObject:", v5);
    if ((v9 & 1) == 0)
    {
      -[NSMutableSet addObject:](v8->_sfActivityScanners, "addObject:", v5);
      unsigned __int8 v10 = -[UACornerActionManagerHandler suspended](v8, "suspended");
      if ((v10 & 1) != 0)
      {
        int v11 = 0;
        uint64_t v12 = 0LL;
      }

      else
      {
        id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
        if ([v3 activityReceivingAllowed])
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAReceiver scanningForTypes](v8, "scanningForTypes"));
          int v11 = 1;
        }

        else
        {
          int v11 = 0;
          uint64_t v12 = 0LL;
        }
      }

      sub_100042D98(v5, v12);
      if (v11) {

      }
      if ((v10 & 1) == 0) {
    }
      }

    objc_sync_exit(v8);

    char v13 = v9 ^ 1;
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)removeSFActivityScanner:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "UASharingReceiver, removing activity scanner %{public}@.",  (uint8_t *)&v10,  0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  unsigned int v8 = -[NSMutableSet containsObject:](v7->_sfActivityScanners, "containsObject:", v4);
  if (v8)
  {
    sub_100042D98(v4, 0LL);
    -[NSMutableSet removeObject:](v7->_sfActivityScanners, "removeObject:", v4);
  }

  objc_sync_exit(v7);

  return v8;
}

- (id)sfActivityScanner
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanners](self, "sfActivityScanners", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        os_log_t v6 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (objc_opt_class(&OBJC_CLASS___SFActivityScanner))
        {
          uint64_t v7 = objc_opt_class(&OBJC_CLASS___SFActivityScanner);
          if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
          {
            id v3 = v6;
            goto LABEL_12;
          }
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)suspend
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UASharingReceiver;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v18, "suspend");
  if (v3)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanners](self, "sfActivityScanners"));
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          __int128 v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          os_log_t v10 = sub_100039584(0LL);
          __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v20 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "UASharingReceiver, suspending activity scanner %{public}@.",  buf,  0xCu);
          }

          sub_100042D98(v9, 0LL);
        }

        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }

      while (v6);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver periodicCleanup](self, "periodicCleanup"));
    [v12 suspend];
  }

  return v3;
}

- (BOOL)resume
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___UASharingReceiver;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v19, "resume");
  if (v3)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanners](self, "sfActivityScanners"));
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          __int128 v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          os_log_t v10 = sub_100039584(0LL);
          __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v21 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "UASharingReceiver, resuming activity scanner %{public}@.",  buf,  0xCu);
          }

          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAReceiver scanningForTypes](self, "scanningForTypes"));
          sub_100042D98(v9, v12);
        }

        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }

      while (v6);
    }

    char v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver periodicCleanup](self, "periodicCleanup"));
    [v13 resume];
  }

  return v3;
}

- (void)activityScanner:(id)a3 foundDeviceWithDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)buf = 138478083;
    __int128 v17 = v10;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "foundDevice, deviceIdentifier=%{private}@ scanner=%{public}@",  buf,  0x16u);
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  __int128 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 mainDispatchQ]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100043944;
  v14[3] = &unk_1000BDC88;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

- (void)foundDevice:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    *(_DWORD *)buf = 138477827;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "foundDevice, deviceIdentifier=%{private}@",  buf,  0xCu);
  }

  if (v4)
  {
    os_log_t v8 = self;
    objc_sync_enter(v8);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](v8, "activeDevices"));
    unsigned __int8 v10 = [v9 containsObject:v4];

    if ((v10 & 1) != 0)
    {
      recentlyLostDeviceIDs = v8->_recentlyLostDeviceIDs;
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      LODWORD(recentlyLostDeviceIDs) = -[NSMutableSet containsObject:]( recentlyLostDeviceIDs,  "containsObject:",  v12);

      if ((_DWORD)recentlyLostDeviceIDs)
      {
        id v13 = v8->_recentlyLostDeviceIDs;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
        -[NSMutableSet removeObject:](v13, "removeObject:", v14);
      }
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      unsigned int v17 = [v4 isDefaultPairedDevice];
      __int16 v18 = "";
      if (v17) {
        __int16 v18 = " defaultPaired";
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCANNING:Found device %@ %@%s",  v15,  v16,  v18));
      +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v19);

      -[NSMutableSet addObject:](v8->_activeDevices, "addObject:", v4);
    }

    objc_sync_exit(v8);
  }
}

- (void)activityScanner:(id)a3 lostDeviceWithDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)buf = 138478083;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "lostDevice, deviceIdentifier=%{private}@ scanner=%{public}@",  buf,  0x16u);
  }

  recentlyLostDeviceIDs = self->_recentlyLostDeviceIDs;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
  -[NSMutableSet addObject:](recentlyLostDeviceIDs, "addObject:", v12);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100043CF8;
  v15[3] = &unk_1000BDCB0;
  id v16 = v7;
  unsigned int v17 = self;
  id v13 = v7;
  id v14 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v15,  5.0);
}

- (void)lostDevice:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    *(_DWORD *)buf = 138477827;
    v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "lostDevice, deviceIdentifier=%{private}@",  buf,  0xCu);
  }

  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  if (v8)
  {
    __int128 v9 = self;
    objc_sync_enter(v9);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    unsigned int v12 = [v4 isDefaultPairedDevice];
    id v13 = "";
    if (v12) {
      id v13 = " defaultPaired";
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCANNING:Lost device %@ %@%s",  v10,  v11,  v13));
    +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v14);

    -[NSMutableSet removeObject:](v9->_activeDevices, "removeObject:", v4);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    -[UASharingReceiver removeAllFromDevice:](v9, "removeAllFromDevice:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    if ([v16 ignoreLostDevice])
    {
    }

    else
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver lastSeenPasteboardDevice](v9, "lastSeenPasteboardDevice"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueID]);
      unsigned int v20 = [v17 isEqualToString:v19];

      if (v20)
      {
        -[UASharingReceiver setLastSeenPasteboardDevice:](v9, "setLastSeenPasteboardDevice:", 0LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v9, "manager"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pasteboardController]);
        [v22 setRemotePasteboardAvalibility:0 withDataRequester:0];

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
        [v23 submitRemotePasteboardBecameUnavailable:1];

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver remotePboardTimer](v9, "remotePboardTimer"));
        [v24 invalidate];

        -[UASharingReceiver setRemotePboardTimer:](v9, "setRemotePboardTimer:", 0LL);
      }
    }

    objc_sync_exit(v9);
  }
}

- (void)lostDeviceWithUUID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
        unsigned int v12 = [v11 isEqual:v4];

        if (v12) {
          -[UASharingReceiver lostDevice:](self, "lostDevice:", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }
}

- (BOOL)_addItem:(id)a3 scheduleUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    BOOL v34 = 0;
    goto LABEL_26;
  }

  BOOL v39 = v4;
  obj = self;
  objc_sync_enter(obj);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDevice]);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v9]);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  unsigned __int8 v10 = obj->_receivedItems;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v44,  v56,  16LL);
  if (!v11)
  {

    v43 = 0LL;
LABEL_22:
    -[NSMutableSet addObject:](obj->_receivedItems, "addObject:", v6);
    BOOL v34 = 1;
    goto LABEL_23;
  }

  v43 = 0LL;
  char v41 = 0;
  uint64_t v12 = *(void *)v45;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v45 != v12) {
        objc_enumerationMutation(v10);
      }
      __int128 v14 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
      unsigned int v17 = [v15 isEqual:v16];

      if (v17)
      {
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 removeAfter]);
        [v14 setRemoveAfter:v18];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 when]);
        [v14 setWhen:v19];

        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v6 currentUntilDate]);
        [v14 setCurrentUntilDate:v20];

        objc_msgSend(v14, "setActive:", objc_msgSend(v6, "active"));
        char v41 = 1;
      }

      else
      {
        [v14 resignCurrent];
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 peerDevice]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingString:v23]);

        if ([v24 isEqualToString:v42])
        {
          id v25 = v14;

          v43 = v25;
        }
      }
    }

    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v44,  v56,  16LL);
  }

  while (v11);

  if (v43)
  {
    os_log_t v26 = sub_100039584(0LL);
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v43 uuid]);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
      id v30 = (id)objc_claimAutoreleasedReturnValue([v6 statusString]);
      objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v6 statusString]);
      *(_DWORD *)buf = 138544131;
      v49 = v29;
      __int16 v50 = 2113;
      id v51 = v30;
      __int16 v52 = 2114;
      v53 = v32;
      __int16 v54 = 2113;
      v55 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "removing item %{public}@/%{private}@ because another item (%{public}@/%{private}@) with the same bundleID and de viceID is being added",  buf,  0x2Au);
    }

    -[NSMutableSet removeObject:](obj->_receivedItems, "removeObject:", v43);
  }

  if ((v41 & 1) == 0) {
    goto LABEL_22;
  }
  BOOL v34 = 0;
LABEL_23:
  if (v39)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](obj, "manager"));
    [v35 scheduleBestAppDetermination];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver periodicCleanup](obj, "periodicCleanup"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 removeAfter]);
    [v36 scheduleAt:v37];
  }

  objc_sync_exit(obj);
LABEL_26:

  return v34;
}

- (BOOL)addItem:(id)a3 scheduleUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 activityType]);
  unsigned int v9 = [v8 isEqualToString:UAUserActivityTypeNowPlaying];

  if (v9)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100044880;
    v14[3] = &unk_1000BDD00;
    __int128 v15 = v7;
    __int128 v16 = self;
    BOOL v17 = v4;
    MRMediaRemoteGetActiveOrigin(v11, v14);

    BOOL v12 = 0;
    id v7 = v15;
  }

  else
  {
    BOOL v12 = -[UASharingReceiver _addItem:scheduleUpdates:](self, "_addItem:scheduleUpdates:", v7, v4);
  }

  return v12;
}

- (BOOL)removeItem:(id)a3
{
  id v4 = a3;
  os_log_t v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = -[NSMutableSet containsObject:](v5->_receivedItems, "containsObject:", v4);
  if (v6)
  {
    -[NSMutableSet removeObject:](v5->_receivedItems, "removeObject:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v5, "manager"));
    [v7 scheduleBestAppDetermination];
  }

  objc_sync_exit(v5);

  return v6;
}

- (void)removeAllFromDevice:(id)a3
{
  id v49 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver receivedItems](v4, "receivedItems"));
  id v6 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  p_isa = (id *)&v4->super.super.super.isa;
  if (!v6)
  {

    objc_sync_exit(v4);
    goto LABEL_28;
  }

  char v9 = 0;
  uint64_t v48 = *(void *)v51;
  *(void *)&__int128 v7 = 138543618LL;
  __int128 v46 = v7;
  id obj = v5;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v51 != v48) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peerDevice", v46));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
      unsigned int v14 = [v13 isEqual:v49];

      if (v14)
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        if (([v11 isPayloadRequested] & 1) == 0
          && ![v11 isPayloadAvailable])
        {
          goto LABEL_11;
        }

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 removeAfter]);
        if (!v16) {
          goto LABEL_11;
        }
        [v15 timeIntervalSinceReferenceDate];
        double v18 = v17;
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 removeAfter]);
        [v19 timeIntervalSinceReferenceDate];
        BOOL v21 = v18 > v20;

        if (!v21)
        {
          os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 currentUntilDate]);
          if (!v26
            || ([v15 timeIntervalSinceReferenceDate],
                double v28 = v27,
                __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v11 currentUntilDate]),
                [v29 timeIntervalSinceReferenceDate],
                BOOL v31 = v28 > v30,
                v29,
                v26,
                !v31))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v15,  -1.0));
            [v11 setCurrentUntilDate:v32];
          }

          uint64_t v33 = objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
          [(id)v33 receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued];
          BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));

          [v34 timeIntervalSinceReferenceDate];
          double v36 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue([v11 removeAfter]);
          [v37 timeIntervalSinceReferenceDate];
          LOBYTE(v33) = v36 > v38;

          if ((v33 & 1) == 0) {
            [v11 setRemoveAfter:v34];
          }
          os_log_t v39 = sub_100039584(0LL);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            char v41 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v41 UUIDString]);
            v43 = (void *)objc_claimAutoreleasedReturnValue([v11 removeAfter]);
            *(_DWORD *)buf = v46;
            v55 = v42;
            __int16 v56 = 2114;
            id v57 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "Retaining %{public}@ in _receivedItems because it's .payloadRequested or .payloadAvailable, so that it rem ains available for a bit, until %{public}@.",  buf,  0x16u);
          }

          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([p_isa periodicCleanup]);
          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v11 removeAfter]);
          [v44 scheduleAt:v45];
        }

        else
        {
LABEL_11:
          os_log_t v22 = sub_100039584(0LL);
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
            *(_DWORD *)buf = 138543619;
            v55 = v25;
            __int16 v56 = 2113;
            id v57 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "REMOVING: %{public}@ because it's on device %{private}@",  buf,  0x16u);
          }

          [p_isa[8] removeObject:v11];
        }

        char v9 = 1;
      }
    }

    id v6 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  }

  while (v6);

  objc_sync_exit(p_isa);
  if ((v9 & 1) != 0)
  {
    p_isa = (id *)objc_claimAutoreleasedReturnValue([p_isa manager]);
    [p_isa scheduleBestAppDetermination];
LABEL_28:
  }
}

- (void)periodicCleanupFunc
{
  v2 = self;
  objc_sync_enter(v2);
  os_log_t v3 = sub_100039584(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "SharingBTLEReceiver: Running periodicCleanupFunc to check for received items whose .removeAfter has passed.",  buf,  2u);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver receivedItems](v2, "receivedItems"));
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v27;
    *(void *)&__int128 v7 = 138543618LL;
    __int128 v24 = v7;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "removeAfter", v24));
        if (v11
          && (BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v10 removeAfter]),
              [v12 timeIntervalSinceReferenceDate],
              double v14 = v13,
              [v25 timeIntervalSinceReferenceDate],
              BOOL v16 = v14 > v15,
              v12,
              v11,
              v16))
        {
          double v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver periodicCleanup](v2, "periodicCleanup"));
          double v18 = (void *)objc_claimAutoreleasedReturnValue([v10 removeAfter]);
          [v17 scheduleAt:v18];
        }

        else
        {
          os_log_t v19 = sub_100039584(0LL);
          double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
            os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v10 removeAfter]);
            *(_DWORD *)buf = v24;
            BOOL v31 = v22;
            __int16 v32 = 2114;
            uint64_t v33 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Removing %{public}@ from .receivedItems because .removeAfter, %{public}@ has expired.",  buf,  0x16u);
          }

          -[UASharingReceiver removeItem:](v2, "removeItem:", v10);
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v6);
  }

  objc_sync_exit(v2);
}

- (id)sharingBTLESuggestedItemForAdvertisementPayload:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[UASharingReceiver receivedItems](self, "receivedItems"));
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (v7)
        {
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 peerDevice]);
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
          unsigned int v15 = [v12 isEqual:v14];

          if (!v15) {
            continue;
          }
        }

        if (v6)
        {
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 advertisementPayload]);
          unsigned int v17 = [v6 isEqualHashedPayloadBytes:v16];

          if (!v17) {
            continue;
          }
        }

        id v8 = v11;
        goto LABEL_14;
      }

      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)activityScanner:(id)a3 receivedAdvertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "activityScanner:receivedAdvertisement: %{private}@,%{public}@)",  buf,  0x16u);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 mainDispatchQ]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045618;
  block[3] = &unk_1000BCE78;
  block[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v11, block);
}

- (void)receiveAdvertisement:(id)a3 scanner:(id)a4
{
  id v295 = a3;
  id v292 = a4;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
    id v8 = sub_1000034D8(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v295 options]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    id v12 = sub_10005BF18(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
    *(_DWORD *)buf = 138544131;
    *(void *)v317 = v9;
    *(_WORD *)&v317[8] = 2114;
    *(void *)&v317[10] = v13;
    *(_WORD *)&v317[18] = 2113;
    *(void *)v318 = v15;
    *(_WORD *)&v318[8] = 2113;
    *(void *)v319 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Received Ad: %{public}@ opts=%{public}@ from %{private}@/%{private}@",  buf,  0x2Au);
  }

  if (!v295) {
    sub_100077260();
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
  if (!v18) {
    sub_100077288();
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned __int8 v20 = [v19 activityReceivingAllowed];

  if ((v20 & 1) != 0)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    unsigned int v22 = [v21 isSharingModeBlockingReceiving];

    if (v22)
    {
      os_log_t v23 = sub_100039584(0LL);
      oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
        id v25 = sub_1000034D8(v24);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueID]);
        *(_DWORD *)buf = 138543619;
        *(void *)v317 = v26;
        *(_WORD *)&v317[8] = 2113;
        *(void *)&v317[10] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "Ignoring received advertisement because we are currently in a sharing mode that disallows it, %{public}@ from %{private}@",  buf,  0x16u);
      }

      goto LABEL_47;
    }

    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices"));
    double v36 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
    int v37 = [v35 containsObject:v36];

    if ((v37 & 1) == 0)
    {
      os_log_t v38 = sub_100039584(0LL);
      os_log_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
        *(_DWORD *)buf = 138477827;
        *(void *)v317 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "SIMULATING foundDeviceForIdentifier: %{private}@",  buf,  0xCu);
      }

      char v41 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
      -[UASharingReceiver foundDevice:](self, "foundDevice:", v41);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 productBuildVersion]);
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 substringToIndex:3]);
    uint64_t v45 = (uint64_t)[v44 integerValue];

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue([v46 modelIdentifier]);

    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    if ([v47 multiHandoffEnabled])
    {
      unsigned __int8 v48 = -[os_log_s containsString:](oslog, "containsString:", @"Mac");
      if (v45 > 17) {
        unsigned __int8 v49 = v48;
      }
      else {
        unsigned __int8 v49 = 0;
      }
      if ((v49 & 1) != 0
        || ((unsigned __int8 v50 = -[os_log_s containsString:](oslog, "containsString:", @"iPhone"), v45 > 15)
          ? (unsigned __int8 v51 = v50)
          : (unsigned __int8 v51 = 0),
            (v51 & 1) != 0))
      {
        unsigned int v52 = 1;
      }

      else
      {
        unsigned int v52 = -[os_log_s containsString:](oslog, "containsString:", @"iPad") & (v45 > 15);
      }
    }

    else
    {
      unsigned int v52 = 0;
    }

    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
    if (!v53
      || (__int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]),
          BOOL v55 = sub_10005EF30(v54),
          v54,
          v53,
          v55))
    {
      os_log_t v56 = sub_100039584(0LL);
      id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "Received advertisement.advertisementPayload == nil",  buf,  2u);
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
      v296 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v58 uniqueID]);

      if (v52
        && (v59 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( UAUserActivityDefaults,  "sharedDefaults")),  unsigned int v60 = [v59 multiHandoffEnabled],  v59,  v60))
      {
        v61 = self;
        objc_sync_enter(v61);
        __int128 v311 = 0u;
        __int128 v312 = 0u;
        __int128 v313 = 0u;
        __int128 v314 = 0u;
        v62 = v61->_receivedItems;
        id v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v311,  v325,  16LL);
        if (v63)
        {
          uint64_t v64 = *(void *)v312;
          do
          {
            for (i = 0LL; i != v63; i = (char *)i + 1)
            {
              if (*(void *)v312 != v64) {
                objc_enumerationMutation(v62);
              }
              v66 = *(void **)(*((void *)&v311 + 1) + 8LL * (void)i);
              v67 = (void *)objc_claimAutoreleasedReturnValue([v66 peerDevice]);
              v68 = (void *)objc_claimAutoreleasedReturnValue([v67 uniqueID]);
              unsigned int v69 = [v68 isEqualToString:v296];

              if (v69) {
                [v66 setActive:0];
              }
            }

            id v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v311,  v325,  16LL);
          }

          while (v63);
        }

        objc_sync_exit(v61);
      }

      else
      {
        -[UASharingReceiver removeAllFromDevice:](self, "removeAllFromDevice:", v296);
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver lastSeenPasteboardDevice](self, "lastSeenPasteboardDevice"));
      v71 = (void *)objc_claimAutoreleasedReturnValue([v70 uniqueID]);
      v72 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
      v73 = (void *)objc_claimAutoreleasedReturnValue([v72 uniqueID]);
      unsigned int v74 = [v71 isEqualToString:v73];

      if (v74)
      {
        -[UASharingReceiver setLastSeenPasteboardDevice:](self, "setLastSeenPasteboardDevice:", 0LL);
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        v76 = (void *)objc_claimAutoreleasedReturnValue([v75 pasteboardController]);
        [v76 setRemotePasteboardAvalibility:0 withDataRequester:0];

        v77 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
        [v77 submitRemotePasteboardBecameUnavailable:3];

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver remotePboardTimer](self, "remotePboardTimer"));
        [v78 invalidate];

        -[UASharingReceiver setRemotePboardTimer:](self, "setRemotePboardTimer:", 0LL);
      }

      id v297 = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      [v297 scheduleBestAppDetermination];
      id v295 = 0LL;
LABEL_46:

      goto LABEL_47;
    }

    v296 = -[SharingBTLEAdvertisementPayload initWithSFActivityAdvertisement:]( objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload),  "initWithSFActivityAdvertisement:",  v295);
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload options](v296, "options"));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:@"UAPasteboardAvailable"]);
    if ([v80 BOOLValue])
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      unsigned int v82 = [v81 clipboardSharingEnabled];

      if (v82)
      {
        os_log_t v83 = sub_100039584(@"pasteboard-server");
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "[PBOARD] Received pboard available advertisement",  buf,  2u);
        }

        v85 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload options](v296, "options"));
        v86 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:@"UAPasteboardVersionBit"]);
        unsigned int v87 = [v86 BOOLValue];

        v88 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver lastSeenPasteboardDevice](self, "lastSeenPasteboardDevice"));
        v89 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
        LODWORD(v86) = [v88 isEqual:v89];

        os_log_t v90 = sub_100039584(@"pasteboard-server");
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        uint64_t v92 = v87;
        BOOL v93 = os_log_type_enabled(v91, OS_LOG_TYPE_INFO);
        if (!(_DWORD)v86)
        {
          if (v93)
          {
            *(_WORD *)buf = 0;
            v95 = "[PBOARD] Ad is from new device, notify client";
            goto LABEL_67;
          }

- (BOOL)fetchMoreAppSuggestions
{
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanner](self, "sfActivityScanner"));
  char v36 = 0;
  uint64_t v35 = 0LL;
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v35, 8LL));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v2 handoffPayloadRequestTimout];
  double v4 = v3;

  objc_initWeak(&location, self);
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices"));
    id v8 = [v7 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "issuing handoff-more_items command for %lu devices",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x2020000000LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices"));
  id v10 = [v9 count];

  id v34 = v10;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices"));
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_100047D9C;
        v22[3] = &unk_1000BDD78;
        p___int128 buf = &buf;
        objc_copyWeak(&v25, &location);
        v22[4] = v15;
        id v23 = v21;
        [v23 activityPayloadFromDevice:v15 forAdvertisementPayload:v20 command:@"handoff-more_items" timeout:(uint64_t)v4 withCompletionHandler:v22];

        objc_destroyWeak(&v25);
      }

      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v12);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices"));
  BOOL v17 = [v16 count] != 0;

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&location);

  return v17;
}

- (void)fetchMoreAppSuggestionsFromDevice:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanner](self, "sfActivityScanner"));
  char v22 = 0;
  uint64_t v21 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v21, 8LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v7 handoffPayloadRequestTimout];
  double v9 = v8;

  objc_initWeak(&location, self);
  os_log_t v10 = sub_100039584(0LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "issuing handoff-more_items command for device %@",  buf,  0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100048010;
  v14[3] = &unk_1000BDDA0;
  objc_copyWeak(&v17, &location);
  id v12 = v4;
  id v15 = v12;
  id v13 = v5;
  id v16 = v13;
  [v13 activityPayloadFromDevice:v12 forAdvertisementPayload:v6 command:@"handoff-more_items" timeout:(uint64_t)v9 withCompletionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)addNewItemsFromPayloads:(id)a3 device:(id)a4 scanner:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v42 = a3;
  id v10 = a4;
  id v46 = a5;
  char v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v42 getBytes:&v56 length:1];
  if ((unint64_t)[v42 length] >= 2)
  {
    unint64_t v11 = 1LL;
    do
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "subdataWithRange:", v11, v56));
      [v41 addObject:v12];

      v11 += v56;
    }

    while (v11 < (unint64_t)[v42 length]);
  }

  os_log_t v13 = sub_100039584(0LL);
  double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v41 count];
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    *(_DWORD *)__int128 buf = 134218242;
    id v60 = v15;
    __int16 v61 = 2112;
    v62 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "got back %lu items for handoff-more_items command from device %@",  buf,  0x16u);
  }

  if ([v41 count] || v6)
  {
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v17 = self;
    objc_sync_enter(v17);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obj = v17->_receivedItems;
    id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v52,  v58,  16LL);
    if (v18)
    {
      uint64_t v19 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          char v22 = (void *)objc_claimAutoreleasedReturnValue([v21 peerDevice]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
          unsigned int v25 = [v23 isEqualToString:v24];

          if (v25)
          {
            if ([v21 active])
            {
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);
              BOOL v27 = v26 == 0LL;

              if (!v27)
              {
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);
                [v47 addObject:v28];
              }
            }
          }

          else
          {
            [v43 addObject:v21];
          }
        }

        id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v52,  v58,  16LL);
      }

      while (v18);
    }

    objc_storeStrong((id *)&v17->_receivedItems, v43);
    objc_sync_exit(v17);

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id obja = v41;
    id v29 = [obja countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v29)
    {
      double v30 = 0LL;
      uint64_t v31 = *(void *)v49;
      do
      {
        __int16 v32 = 0LL;
        uint64_t v33 = v30;
        do
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(obja);
          }
          id v34 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithPayload:device:options:optionBits:scanner:receiver:]( &OBJC_CLASS___SharingBTLESuggestedItem,  "cornerActionBTLEItemWithPayload:device:options:optionBits:scanner:receiver:",  *(void *)(*((void *)&v48 + 1) + 8LL * (void)v32),  v10,  &__NSDictionary0__struct,  sub_10005EECC(*(void **)(*((void *)&v48 + 1) + 8LL * (void)v32)),  v46,  v17);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          char v36 = (void *)objc_claimAutoreleasedReturnValue([v35 bundleIdentifier]);
          objc_msgSend(v35, "setActive:", objc_msgSend(v47, "containsObject:", v36));

          int v37 = (void *)objc_claimAutoreleasedReturnValue([v35 when]);
          BOOL v38 = [v33 compare:v37] == (id)1;

          if (v38)
          {
            os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue([v33 dateByAddingTimeInterval:1.0]);
            [v35 setWhen:v39];
          }

          double v30 = (void *)objc_claimAutoreleasedReturnValue([v35 when]);

          -[UASharingReceiver addItem:scheduleUpdates:](v17, "addItem:scheduleUpdates:", v35, 0LL);
          __int16 v32 = (char *)v32 + 1;
          uint64_t v33 = v30;
        }

        while (v29 != v32);
        id v29 = [obja countByEnumeratingWithState:&v48 objects:v57 count:16];
      }

      while (v29);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v17, "manager"));
    [v40 scheduleBestAppDetermination];
  }
}

- (id)statusString
{
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  unsigned int v3 = -[UACornerActionManagerHandler suspended](self, "suspended");
  id v4 = "SUSPENDED";
  if (!v3) {
    id v4 = "";
  }
  v77 = v4;
  if (-[UASharingReceiver active](self, "active")) {
    os_log_t v5 = "";
  }
  else {
    os_log_t v5 = "DISABLED";
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAReceiver scanningForTypes](self, "scanningForTypes"));
  else {
    id v7 = &stru_1000BE738;
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAReceiver scanningForTypes](self, "scanningForTypes"));
  else {
    double v9 = &stru_1000BE738;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanner](self, "sfActivityScanner"));
  if (v10) {
    unint64_t v11 = &stru_1000BE738;
  }
  else {
    unint64_t v11 = @"(NO SFActivityScanner) ";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned int v13 = [v12 isBluetoothEnabled];
  double v14 = @" (Bluetooth disabled)";
  if (v13) {
    double v14 = &stru_1000BE738;
  }
  id v60 = v7;
  id v15 = v75;
  [v75 appendFormat:@"SharingBTLE receiver %s%s%@%@ %@%@", v77, v5, v60, v9, v11, v14];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanners](self, "sfActivityScanners"));
  id v17 = [v16 count];

  if (v17 != (id)1)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver sfActivityScanners](self, "sfActivityScanners"));
    objc_msgSend(v75, "appendFormat:", @"%ld scanners", objc_msgSend(v18, "count"));
  }

  [v75 appendString:@"\n"];
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  uint64_t v64 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[UASharingReceiver receivedItems](self, "receivedItems"));
  id v65 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v85;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v85 != v63) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(*((void *)&v84 + 1) + 8 * v19);
        uint64_t v21 = v20;
        uint64_t v74 = v19;
        if (v20
          && (char v22 = (void *)objc_claimAutoreleasedReturnValue([v20 scanner]), v22, v22))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 scanner]);
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___SFActivityScanner);
          char isKindOfClass = objc_opt_isKindOfClass(v23, v24);

          __int128 v26 = &stru_1000BE738;
          if ((isKindOfClass & 1) == 0)
          {
            BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v21 scanner]);
            uint64_t v28 = objc_opt_class(&OBJC_CLASS___UAMockActivityScanner);
            char v29 = objc_opt_isKindOfClass(v27, v28);

            if ((v29 & 1) != 0)
            {
              double v30 = (void *)objc_claimAutoreleasedReturnValue([v21 scanner]);
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 controller]);
              id v32 = [(id)objc_opt_class(v31) description];
              __int128 v26 = (const __CFString *)objc_claimAutoreleasedReturnValue(v32);
            }
          }
        }

        else
        {
          __int128 v26 = &stru_1000BE738;
        }

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v21 activityType]);
        v73 = (void *)objc_claimAutoreleasedReturnValue([v21 dynamicActivityType]);
        if (v73)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue([v21 dynamicActivityType]);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @":%@",  v68));
          v70 = v66;
        }

        else
        {
          v70 = &stru_1000BE738;
        }

        id v34 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);
        id v78 = (id)objc_claimAutoreleasedReturnValue([v35 UUIDString]);
        v72 = (void *)objc_claimAutoreleasedReturnValue([v21 advertisementPayload]);
        v76 = (void *)objc_claimAutoreleasedReturnValue([v72 description]);
        v71 = (void *)objc_claimAutoreleasedReturnValue([v21 peerDevice]);
        char v36 = (void *)objc_claimAutoreleasedReturnValue([v71 name]);
        int v37 = (void *)objc_claimAutoreleasedReturnValue([v21 when]);
        BOOL v38 = (void *)objc_claimAutoreleasedReturnValue([v21 removeAfter]);
        os_log_t v39 = (__CFString *)v26;
        if (v38)
        {
          unsigned int v69 = (void *)objc_claimAutoreleasedReturnValue([v21 removeAfter]);
          v40 = sub_1000758E0(v69);
          char v41 = (const __CFString *)objc_claimAutoreleasedReturnValue(v40);
          v67 = (__CFString *)v41;
        }

        else
        {
          char v41 = @"-";
        }

        else {
          id v42 = "";
        }
        unsigned int v43 = [v21 isPayloadAvailable];
        __int128 v44 = " (PayloadAv)";
        if (!v43) {
          __int128 v44 = "";
        }
        __int16 v61 = v42;
        id v15 = v75;
        [v75 appendFormat:@" - %@%@%@ app:%@ %@ data=%@, from %@ at %@ remove at %@%s%s\n", v39, v33, v70, v34, v78, v76, v36, v37, v41, v61, v44];
        if (v38)
        {
        }

        if (v73)
        {
        }

        uint64_t v19 = v74 + 1;
      }

      while (v65 != (id)(v74 + 1));
      id v65 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
    }

    while (v65);
  }

  [v15 appendFormat:@" ActiveDevices:"];
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v79 = (id)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](v64, "activeDevices"));
  id v45 = [v79 countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v81;
    do
    {
      for (i = 0LL; i != v46; i = (char *)i + 1)
      {
        if (*(void *)v81 != v47) {
          objc_enumerationMutation(v79);
        }
        __int128 v49 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 uniqueID]);
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver lastSeenPasteboardDevice](v64, "lastSeenPasteboardDevice"));
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 uniqueID]);
        unsigned int v53 = [v50 isEqualToString:v52];
        __int128 v54 = &stru_1000BE738;
        if (v53) {
          __int128 v54 = @", pb";
        }
        __int128 v55 = v54;

        unsigned __int8 v56 = (void *)objc_claimAutoreleasedReturnValue([v49 name]);
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v49 modelIdentifier]);
        id v15 = v75;
        [v75 appendFormat:@"(%@,%@%@)", v56, v57, v55];
      }

      id v46 = [v79 countByEnumeratingWithState:&v80 objects:v88 count:16];
    }

    while (v46);
  }

  [v15 appendString:@"\n"];
  id v58 = [v15 copy];

  return v58;
}

- (BOOL)terminate
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver periodicCleanup](self, "periodicCleanup"));
  [v3 reset];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver periodicCleanup](self, "periodicCleanup"));
  [v4 waitUntilComplete];

  return 1;
}

- (void)clearRemotePasteboardAvailable:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pasteboardController]);
  [v5 setRemotePasteboardAvalibility:0 withDataRequester:0];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  [v6 submitRemotePasteboardBecameUnavailable:2];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver remotePboardTimer](self, "remotePboardTimer"));
  [v7 invalidate];

  -[UASharingReceiver setRemotePboardTimer:](self, "setRemotePboardTimer:", 0LL);
}

- (BOOL)forceScanning
{
  return self->_forceScanning;
}

- (void)setForceScanning:(BOOL)a3
{
  self->_forceScanning = a3;
}

- (UADispatchScheduler)periodicCleanup
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 104LL, 1);
}

- (SFPeerDevice)lastSeenPasteboardDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setLastSeenPasteboardDevice:(id)a3
{
}

- (int64_t)lastSeenPasteboardVersionBit
{
  return self->_lastSeenPasteboardVersionBit;
}

- (void)setLastSeenPasteboardVersionBit:(int64_t)a3
{
  self->_lastSeenPasteboardVersionBit = a3;
}

- (NSTimer)remotePboardTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setRemotePboardTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end