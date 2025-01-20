@interface UACornerActionManager
+ (id)cornerActionManager;
+ (id)sharedActivityManagerServer;
- (ActivityManagerDebuggingManager)debugManager;
- (BOOL)activityAdvertisingAllowed;
- (BOOL)activityReceivingAllowed;
- (BOOL)advertisingSuspended;
- (BOOL)deviceUILocked;
- (BOOL)fetchMoreAppSuggestions;
- (BOOL)haveBestAppChangeNotificationClients;
- (BOOL)isBacklightOn;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)isBluetoothEnabled;
- (BOOL)isMirroringActive;
- (BOOL)isSharingModeBlockingReceiving;
- (BOOL)pingMode;
- (BOOL)receivingSuspended;
- (BOOL)scheduleBestAppDetermination;
- (BOOL)scheduleBestAppDetermination:(double)a3;
- (BOOL)screenDimmed;
- (BOOL)shouldItemBeAdvertised:(id)a3;
- (BOOL)suspended;
- (BOOL)systemHasSuspendedAdvertisements;
- (BOOL)systemHasSuspendedScanning;
- (BOOL)systemIsIdle;
- (BOOL)userActive;
- (BOOL)weAreAdvertisingAnItem;
- (BOOL)weAreAdvertisingAtLeastOneItem;
- (FBSDisplayLayoutMonitor)mirroringMonitor;
- (NSArray)itemsBeingAdvertised;
- (NSDate)holdPowerAssertionUntil;
- (NSDate)lastTimePayloadWasRequestedForAdvertisedItem;
- (NSDate)pingStart;
- (NSObject)bluetoothStatusCallbackIdentifier;
- (NSSet)activeDevicesIdentifiers;
- (NSSet)advertisers;
- (NSSet)allHandlers;
- (NSSet)clients;
- (NSSet)handlers;
- (NSSet)notifiers;
- (NSSet)receivers;
- (NSTimer)pongTimer;
- (NSUUID)uuid;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)mainDispatchQ;
- (OS_dispatch_semaphore)pongSem;
- (OS_dispatch_source)holdPowerAssertionSourceTimer;
- (PowerManagerIdleTracker)userIdleTracker;
- (UABluetoothStatus)bluetoothStatus;
- (UACornerActionManager)init;
- (UADispatchScheduler)nextScheduleBestAppDeterminationScheduler;
- (UADispatchScheduler)nextUpdateAdvertisedItemsScheduler;
- (UADispatchScheduler)nextUserIdleDeterminationScheduler;
- (UAPingController)pingController;
- (UASharedPasteboardClientController)pasteboardController;
- (UATimedPowerAssertions)deviceUILockedPowerAssertion;
- (UATimedPowerAssertions)screenDimmedPowerAssertion;
- (UATimedPowerAssertions)userInactivePowerAssertion;
- (UAUserActivityInfo)debugCornerItem;
- (UAUserActivityInfo)pinnedUserActivityInfoItem;
- (double)avgPingTime;
- (id)activeAdvertiseableItemsUUIDs;
- (id)advertiseableItems;
- (id)bestCornerItem;
- (id)bestCornerItem:(id)a3;
- (id)cornerActionItemForUUID:(id)a3;
- (id)cornerActionItems;
- (id)debuggingInfo;
- (id)dictionaryForAdvertisableItem:(id)a3;
- (id)dictionaryForCornerActionItem:(id)a3;
- (id)dynamicUserActivitiesString;
- (id)shortStatusString;
- (id)statusString;
- (id)uaAdvertisableItemsInOrder;
- (id)uaAdvertisableItemsInOrder:(BOOL)a3;
- (int)backlightLevelToken;
- (int)systemPreferenceChangedToken;
- (int)uiLockStatusToken;
- (unsigned)holdPowerAssertion;
- (void)_checkIfBestApplicationChangedThread;
- (void)_determineItemToAdvertiseForHandoffThread;
- (void)_determineWhenSystemGoesIdleThread;
- (void)addActivityNotifier:(id)a3;
- (void)addAdvertiser:(id)a3;
- (void)addClient:(id)a3;
- (void)addHandler:(id)a3;
- (void)addReceiver:(id)a3;
- (void)checkIfBestCornerItemChanged:(double)a3;
- (void)dealloc;
- (void)processWasRemoved;
- (void)removeActivityNotifier:(id)a3;
- (void)removeAdvertiser:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeHandler:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)resume;
- (void)resumeListeningForBluetooth;
- (void)scheduleUpdatingAdvertisableItems;
- (void)scheduleUpdatingAdvertisableItems:(double)a3;
- (void)setAdvertisingSuspended:(BOOL)a3;
- (void)setAvgPingTime:(double)a3;
- (void)setBacklightLevelToken:(int)a3;
- (void)setBacklightOn:(BOOL)a3;
- (void)setBluetoothStatus:(id)a3;
- (void)setBluetoothStatusCallbackIdentifier:(id)a3;
- (void)setDebugCornerItem:(id)a3;
- (void)setDeviceUILocked:(BOOL)a3;
- (void)setDeviceUILockedPowerAssertion:(id)a3;
- (void)setHoldPowerAssertion:(unsigned int)a3;
- (void)setHoldPowerAssertionSourceTimer:(id)a3;
- (void)setHoldPowerAssertionUntil:(id)a3;
- (void)setIsMirroringActive:(BOOL)a3;
- (void)setLastTimePayloadWasRequestedForAdvertisedItem:(id)a3;
- (void)setMainDispatchQ:(id)a3;
- (void)setMirroringMonitor:(id)a3;
- (void)setPasteboardController:(id)a3;
- (void)setPingController:(id)a3;
- (void)setPingMode:(BOOL)a3;
- (void)setPingStart:(id)a3;
- (void)setPinnedUserActivityInfoItem:(id)a3;
- (void)setPongSem:(id)a3;
- (void)setPongTimer:(id)a3;
- (void)setReceivingSuspended:(BOOL)a3;
- (void)setScreenDimmed:(BOOL)a3;
- (void)setScreenDimmedPowerAssertion:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSystemHasSuspendedAdvertisements:(BOOL)a3;
- (void)setSystemHasSuspendedScanning:(BOOL)a3;
- (void)setSystemIsIdle:(BOOL)a3;
- (void)setSystemPreferenceChangedToken:(int)a3;
- (void)setUiLockStatusToken:(int)a3;
- (void)setUserActive:(BOOL)a3;
- (void)setUserIdleTracker:(id)a3;
- (void)setUserInactivePowerAssertion:(id)a3;
- (void)suspend;
- (void)suspendListeningForBluetooth;
- (void)terminate;
- (void)triggerAll;
- (void)triggerUserIdleDetermination;
- (void)triggerUserIdleDetermination:(double)a3;
- (void)updateScreenDimStateState:(BOOL)a3;
- (void)updateUIDeviceLockedState:(BOOL)a3;
- (void)updateUserActiveState:(BOOL)a3;
- (void)userActivityItemsChanged;
@end

@implementation UACornerActionManager

+ (id)cornerActionManager
{
  return objc_alloc_init(&OBJC_CLASS___UACornerActionManager);
}

+ (id)sharedActivityManagerServer
{
  if (qword_1000DE288 != -1) {
    dispatch_once(&qword_1000DE288, &stru_1000BCF80);
  }
  return (id)qword_1000DE290;
}

- (UACornerActionManager)init
{
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___UACornerActionManager;
  v2 = -[UACornerActionManager init](&v64, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("cornerActionManagerQ", 0LL);
    [v2 setMainDispatchQ:v3];

    v4 = -[ActivityManagerDebuggingManager initWithManager:]( objc_alloc(&OBJC_CLASS___ActivityManagerDebuggingManager),  "initWithManager:",  v2);
    v5 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue([v2 debugManager]);
    [v6 resume];

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v8 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v7;

    v2[8] = 1;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v10 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v9;

    v11 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0LL;

    dispatch_group_t v12 = dispatch_group_create();
    v13 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v15 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v17 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v19 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v21 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v23 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v22;

    *(_WORD *)(v2 + 121) = 0;
    *((_DWORD *)v2 + 25) = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v2 mainDispatchQ]);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_10001804C;
    v62[3] = &unk_1000BCCA8;
    v25 = v2;
    v63 = v25;
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"idleDetermination",  v24,  v62,  0.0));
    v27 = (void *)*((void *)v25 + 27);
    *((void *)v25 + 27) = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 mainDispatchQ]);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100018054;
    v60[3] = &unk_1000BCCA8;
    v29 = v25;
    v61 = v29;
    uint64_t v30 = objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"updateAdvertisedItems",  v28,  v60,  0.0));
    v31 = (void *)*((void *)v29 + 28);
    *((void *)v29 + 28) = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue([v29 mainDispatchQ]);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10001805C;
    v58[3] = &unk_1000BCCA8;
    v33 = v29;
    v59 = v33;
    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"bestApp",  v32,  v58,  0.0));
    v35 = (void *)*((void *)v33 + 29);
    *((void *)v33 + 29) = v34;

    int v36 = MKBGetDeviceLockState(0LL);
    int v37 = v36;
    if ((v36 - 1) < 2)
    {
      os_log_t v41 = sub_100039584(0LL);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "-- Setting device lock to YES since MobileKeyBag() is locked or locking.",  buf,  2u);
      }

      uint64_t v42 = 1LL;
      goto LABEL_14;
    }

    if (v36)
    {
      if (v36 != 3)
      {
        os_log_t v44 = sub_100039584(0LL);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v66 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "*** Unexpected result from MKBGetDeviceLockState(), %d, so device is assumed to be locked.",  buf,  8u);
        }

        goto LABEL_18;
      }

      os_log_t v38 = sub_100039584(0LL);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v40 = "-- Setting device lock to NO since MobileKeyBag() is disabled";
    }

    else
    {
      os_log_t v43 = sub_100039584(0LL);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
LABEL_13:
        uint64_t v42 = 0LL;
LABEL_14:

        [v33 setDeviceUILocked:v42];
LABEL_18:
        v33[130] = 0;
        *((void *)v33 + 38) = 0xC000000000000000LL;
        v46 = (void *)objc_claimAutoreleasedReturnValue([v33 mainDispatchQ]);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        [v47 userIdleInterval];
        double v49 = v48;
        v53 = _NSConcreteStackBlock;
        uint64_t v54 = 3221225472LL;
        v55 = sub_100018064;
        v56 = &unk_1000BCFA8;
        v50 = v33;
        v57 = v50;
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[PowerManagerIdleTracker idleTracker:queue:interval:block:]( &OBJC_CLASS___PowerManagerIdleTracker,  "idleTracker:queue:interval:block:",  @"SuspendAdvertisingIdleTracker",  v46,  &v53,  v49));
        objc_msgSend(v50, "setUserIdleTracker:", v51, v53, v54, v55, v56);

        return (UACornerActionManager *)v2;
      }

      *(_WORD *)buf = 0;
      v40 = "-- Setting device lock to NO since MobileKeyBag() is unlocked";
    }

    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, v40, buf, 2u);
    goto LABEL_13;
  }

  return (UACornerActionManager *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___UACornerActionManager;
  -[UACornerActionManager dealloc](&v2, "dealloc");
}

- (BOOL)weAreAdvertisingAnItem
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v6 active] && (objc_msgSend(v6, "advertising") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)advertiseableItems
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self, "clients"));
  id v3 = [v2 copy];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v3;
  id v5 = 0LL;
  id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items", (void)v14));
        __int128 v11 = v10;
        if (v9)
        {
          if (v5)
          {
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 setByAddingObjectsFromSet:v10]);

            id v5 = (id)v12;
          }

          else
          {
            id v5 = v10;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return v5;
}

- (BOOL)shouldItemBeAdvertised:(id)a3
{
  id v4 = a3;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self, "clients"));
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      id v19 = v5;
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UAUserActivityClientProcessesController);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          id v9 = v7;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userActivityClients]);
          id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v23;
            while (2)
            {
              for (j = 0LL; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v10);
                }
                __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
                unsigned __int8 v16 = [v14 isEqualToString:v15];

                if ((v16 & 1) != 0)
                {

                  BOOL v17 = 1;
                  goto LABEL_21;
                }
              }

              id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      BOOL v17 = 0;
    }

    while (v5);
  }

  else
  {
    BOOL v17 = 0;
  }

- (void)scheduleUpdatingAdvertisableItems
{
}

- (void)scheduleUpdatingAdvertisableItems:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManager nextUpdateAdvertisedItemsScheduler](self, "nextUpdateAdvertisedItemsScheduler"));
  [v4 scheduleNext:a3];
}

- (id)activeAdvertiseableItemsUUIDs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertiseableItems](self, "advertiseableItems", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v8 eligibleToAdvertise])
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
          [v3 addObject:v9];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  id v10 = [v3 copy];
  return v10;
}

- (id)uaAdvertisableItemsInOrder
{
  return -[UACornerActionManager uaAdvertisableItemsInOrder:](self, "uaAdvertisableItemsInOrder:", 0LL);
}

- (id)uaAdvertisableItemsInOrder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self, "clients"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_1000BCFE8]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v8)
  {
    id v10 = 0LL;
    id v9 = 0LL;
    BOOL v17 = v7;
LABEL_30:

    goto LABEL_31;
  }

  id v9 = 0LL;
  id v10 = 0LL;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v7);
      }
      __int128 v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eligibleAdvertiseableItemsInOrder", (void)v25));
      __int128 v15 = v14;
      if (v14 && [v14 count])
      {
        if (!v10) {
          id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        [v10 addObjectsFromArray:v15];
      }

      else if (v3)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 recentEligibleItemsInOrder:5.0]);

        __int128 v15 = v16;
        if (v16)
        {
          if ([v16 count])
          {
            if (!v9) {
              id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            }
            [v9 addObjectsFromArray:v16];
          }
        }
      }
    }

    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  }

  while (v8);

  if (v9 && [v9 count])
  {
    if (v10) {
      [v10 addObjectsFromArray:v9];
    }
    else {
      id v10 = v9;
    }
    goto LABEL_27;
  }

  if (v10)
  {
LABEL_27:
    if (![v10 count]) {
      goto LABEL_31;
    }
    os_log_t v18 = sub_100039584(0LL);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
      id v20 = sub_10005BF18(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v22 = [v10 count];
      *(_DWORD *)buf = 138478083;
      uint64_t v30 = v21;
      __int16 v31 = 2048;
      id v32 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEBUG,  "result=%{private}@/%ld items",  buf,  0x16u);
    }

    goto LABEL_30;
  }

- (void)userActivityItemsChanged
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));

  if (v3)
  {
    id v4 = self;
    objc_sync_enter(v4);
    os_log_t v5 = sub_100039584(0LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "-- signalling thread to determine what activity to advertise because one of our userActivityItems changed.",  v7,  2u);
    }

    -[UACornerActionManager scheduleUpdatingAdvertisableItems](v4, "scheduleUpdatingAdvertisableItems");
    objc_sync_exit(v4);
  }

- (BOOL)weAreAdvertisingAtLeastOneItem
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v2, "advertisers", 0LL));
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
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 active] && (objc_msgSend(v7, "advertising") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (NSArray)itemsBeingAdvertised
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSArray copy](v2->_itemsBeingAdvertised, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)_determineItemToAdvertiseForHandoffThread
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "DETERMINE: Determining list of items to be advertised thread starting up: ",  buf,  2u);
  }

  dispatch_group_enter((dispatch_group_t)self->_helpersDispatchGroup);
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v4 = -[UACornerActionManager screenDimmed](self, "screenDimmed");
  if (![v87 count])
  {
    if (v4)
    {
      os_log_t v5 = sub_100039584(0LL);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "DETERMINE: Checking for recentlyEligible items because the screen is dimmed (includeRecentItems == YES).",  buf,  2u);
      }
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager uaAdvertisableItemsInOrder:](self, "uaAdvertisableItemsInOrder:", v4));
    id v8 = v7;
    if (v7 && [v7 count])
    {
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v97 objects:v107 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v98;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v98 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)i);
            if (v13
              && [*(id *)(*((void *)&v97 + 1) + 8 * (void)i) eligibleForHandoff])
            {
              [v87 addObject:v13];
            }
          }

          id v10 = [v9 countByEnumeratingWithState:&v97 objects:v107 count:16];
        }

        while (v10);
      }
    }
  }

  if (!v87 || ![v87 count])
  {
    int v47 = 0;
    int v48 = 0;
    goto LABEL_63;
  }

  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  id v14 = [v87 copy];
  id obj = v14;
  id v15 = [v14 countByEnumeratingWithState:&v93 objects:v106 count:16];
  if (!v15)
  {
    LODWORD(v84) = 0;
    unsigned __int8 v85 = 0;
    goto LABEL_62;
  }

  LODWORD(v84) = 0;
  unsigned __int8 v85 = 0;
  uint64_t v17 = *(void *)v94;
  uint64_t v81 = _UAUserActivityContainsCloudDocsKey;
  uint64_t v80 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
  *(void *)&__int128 v16 = 138543619LL;
  __int128 v79 = v16;
  do
  {
    os_log_t v18 = 0LL;
    do
    {
      if (*(void *)v94 != v17) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)v18);
      if (v19 && [*(id *)(*((void *)&v93 + 1) + 8 * (void)v18) eligibleForHandoff])
      {
        if ((v85 & 1) != 0) {
          unsigned __int8 v85 = 1;
        }
        else {
          unsigned __int8 v85 = [v19 eligibleToAlwaysAdvertise];
        }
        id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "options", v79));
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 options]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v81]);
          if ([v22 BOOLValue])
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 options]);
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v80]);
            unsigned int v25 = [v24 BOOLValue];

            if (v25)
            {
              [v87 removeObject:v19];
              os_log_t v26 = sub_100039584(0LL);
              __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v19 uuid]);
                id v29 = (id)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v19 activityType]);
                *(_DWORD *)buf = v79;
                id v103 = v29;
                __int16 v104 = 2113;
                v105 = v30;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "DETERMINE: Since this activityItem's .userInfo, %{public}@ type=%{private}@, has unsynchronized cloud documents, we can't actually advertise this item.",  buf,  0x16u);
              }

              uint64_t v31 = objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
              [(id)v31 intervalToAskClientWithUnsynchronizedDocumentsToUpdate];
              double v33 = v32;

              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager lastTimePayloadWasRequestedForAdvertisedItem]( self,  "lastTimePayloadWasRequestedForAdvertisedItem"));
              LOBYTE(v31) = v34 == 0LL;

              double v35 = 3.40282347e38;
              if ((v31 & 1) == 0)
              {
                int v36 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager lastTimePayloadWasRequestedForAdvertisedItem]( self,  "lastTimePayloadWasRequestedForAdvertisedItem",  3.40282347e38));
                [v36 timeIntervalSinceNow];
                double v38 = v37;

                if (v38 > 0.0)
                {
                  -[UACornerActionManager setLastTimePayloadWasRequestedForAdvertisedItem:]( self,  "setLastTimePayloadWasRequestedForAdvertisedItem:",  0LL);
                  goto LABEL_57;
                }

                double v35 = -v38;
              }

              if (v35 <= v33)
              {
                double v33 = v33 - v35;
LABEL_57:
                -[UACornerActionManager scheduleUpdatingAdvertisableItems:]( self,  "scheduleUpdatingAdvertisableItems:",  v33);
              }

              else
              {
                uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                -[UACornerActionManager setLastTimePayloadWasRequestedForAdvertisedItem:]( self,  "setLastTimePayloadWasRequestedForAdvertisedItem:",  v42);

                os_log_t v43 = sub_100039584(@"signposts");
                os_log_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
                v45 = v44;
                if (v19 != (void *)-1LL && os_signpost_enabled(v44))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v45,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v19,  "handoffFetchSpeculative enableTelemetry=YES ",  (const char *)&unk_1000ABCB9,  buf,  2u);
                }

                v92[0] = _NSConcreteStackBlock;
                v92[1] = 3221225472LL;
                v92[2] = sub_100019B80;
                v92[3] = &unk_1000BD038;
                v92[4] = self;
                v92[5] = v19;
                *(double *)&v92[6] = v33;
                [v19 requestPayloadWithCompletionHandlerEvenIfClean:1 withCompletionHandler:v92];
              }

- (BOOL)activityAdvertisingAllowed
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v3 = [v2 activityAdvertisingAllowed];

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    LOBYTE(v3) = [v4 isActivityContinuationAllowed];
  }

  return v3;
}

- (BOOL)activityReceivingAllowed
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v3 = [v2 activityReceivingAllowed];

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    LOBYTE(v3) = [v4 isActivityContinuationAllowed];
  }

  return v3;
}

- (BOOL)isBluetoothEnabled
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatus](self, "bluetoothStatus"));
  unsigned __int8 v3 = [v2 poweredOn];

  return v3;
}

- (BOOL)isSharingModeBlockingReceiving
{
  return 0;
}

- (void)triggerUserIdleDetermination
{
}

- (void)triggerUserIdleDetermination:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManager nextUserIdleDeterminationScheduler](self, "nextUserIdleDeterminationScheduler"));
  [v4 scheduleNext:a3];
}

- (BOOL)advertisingSuspended
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  BOOL advertisingSuspended = v2->_advertisingSuspended;
  objc_sync_exit(v2);

  return advertisingSuspended;
}

- (void)setAdvertisingSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL advertisingSuspended = v3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v4, "advertisers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setSuspended:v3];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  if (!v3) {
    -[UACornerActionManager scheduleUpdatingAdvertisableItems](v4, "scheduleUpdatingAdvertisableItems");
  }
  objc_sync_exit(v4);
}

- (void)_determineWhenSystemGoesIdleThread
{
  os_log_t v3 = sub_100039584(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Determining idleDetermination, entering", buf, 2u);
  }

  dispatch_group_enter((dispatch_group_t)self->_helpersDispatchGroup);
  context = objc_autoreleasePoolPush();
  os_log_t v5 = self;
  objc_sync_enter(v5);
  os_log_t v6 = sub_100039584(0LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (-[UACornerActionManager screenDimmed](v5, "screenDimmed")) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    unsigned int v9 = -[UACornerActionManager deviceUILocked](v5, "deviceUILocked");
    unsigned int v10 = -[UACornerActionManager userActive](v5, "userActive");
    if (v9) {
      __int128 v11 = "yes";
    }
    else {
      __int128 v11 = "no";
    }
    *(_DWORD *)buf = 136315650;
    if (v10) {
      __int128 v12 = "yes";
    }
    else {
      __int128 v12 = "no";
    }
    v83 = (void *)v8;
    __int16 v84 = 2080;
    unsigned __int8 v85 = v11;
    __int16 v86 = 2080;
    v87 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "IDLE: screen dimmed: %s, deviceUILocked: %s, useractive: %s",  buf,  0x20u);
  }

  unsigned int v13 = -[UACornerActionManager activityAdvertisingAllowed](v5, "activityAdvertisingAllowed");
  unsigned int v14 = -[UACornerActionManager activityReceivingAllowed](v5, "activityReceivingAllowed");
  if (v13)
  {
    if (byte_1000DE2A0 || (int v15 = MKBDeviceUnlockedSinceBoot(), byte_1000DE2A0 = v15 != 0, v15))
    {
      int v16 = 0;
      goto LABEL_22;
    }

    os_log_t v17 = sub_100039584(0LL);
    os_log_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "IDLE: since the device hasn't been unlocked since boot, setting mustSuspendAdvertising = YES.",  buf,  2u);
    }
  }

  int v16 = 1;
LABEL_22:
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager itemsBeingAdvertised](v5, "itemsBeingAdvertised"));
  id v20 = [v19 countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v78;
    while (2)
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v78 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
        if ([v23 alwaysPick])
        {
          os_log_t v25 = sub_100039584(0LL);
          os_log_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v23 uuid]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
            *(_DWORD *)buf = 138543362;
            v83 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "IDLE: Setting preventAdvertisingSuspensionBecauseOfAlwaysPickItem = YES for item %{public}@",  buf,  0xCu);
          }

          int v24 = 1;
          goto LABEL_34;
        }
      }

      id v20 = [v19 countByEnumeratingWithState:&v77 objects:v90 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  int v24 = 0;
LABEL_34:

  int v29 = v13 ^ 1;
  if (!-[UACornerActionManager userActive](v5, "userActive")
    && !-[UACornerActionManager isMirroringActive](v5, "isMirroringActive"))
  {
    if (!-[UACornerActionManager weAreAdvertisingAtLeastOneItem](v5, "weAreAdvertisingAtLeastOneItem"))
    {
      os_log_t v30 = sub_100039584(0LL);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting self.userIsInactivePowerAssertion == nil because there are no items being advertised and the user is not active",  buf,  2u);
      }

      -[UACornerActionManager setUserInactivePowerAssertion:](v5, "setUserInactivePowerAssertion:", 0LL);
    }

    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager userInactivePowerAssertion](v5, "userInactivePowerAssertion"));
    BOOL v33 = v32 == 0LL;

    if (v33)
    {
      os_log_t v34 = sub_100039584(0LL);
      double v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting shouldSuspendAdvertising == YES because userInactivePowerAssertion == nil and the user is not active",  buf,  2u);
      }

      int v29 = 1;
    }
  }

  int v36 = v14 ^ 1;
  if (-[UACornerActionManager screenDimmed](v5, "screenDimmed")
    && !-[UACornerActionManager isMirroringActive](v5, "isMirroringActive"))
  {
    if (!-[UACornerActionManager weAreAdvertisingAtLeastOneItem](v5, "weAreAdvertisingAtLeastOneItem"))
    {
      os_log_t v47 = sub_100039584(0LL);
      int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting self.screenDimmedPowerAssertion == nil because there are no items being advertised and the screen is dimmed",  buf,  2u);
      }

      -[UACornerActionManager setScreenDimmedPowerAssertion:](v5, "setScreenDimmedPowerAssertion:", 0LL);
    }

    double v49 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager screenDimmedPowerAssertion](v5, "screenDimmedPowerAssertion"));
    BOOL v50 = v49 == 0LL;

    if (v50)
    {
      os_log_t v68 = sub_100039584(0LL);
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting shouldSuspendAdvertising == YES because self.screenDimmedPowerAssertion == nil and the screen is dimmed",  buf,  2u);
      }

      int v37 = 0;
      int v38 = 1;
      int v29 = 1;
    }

    else
    {
      int v37 = 1;
      int v38 = 1;
    }
  }

  else
  {
    int v37 = 0;
    int v38 = v14 ^ 1;
  }

  if (!-[UACornerActionManager deviceUILocked](v5, "deviceUILocked")
    || (v39 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager deviceUILockedPowerAssertion](v5, "deviceUILockedPowerAssertion")),
        BOOL v40 = v39 == 0LL,
        v39,
        !v40))
  {
    if ((v16 & 1) != 0) {
      goto LABEL_50;
    }
LABEL_69:
    if (((v37 | v29 ^ 1) & 1) != 0)
    {
      if (!v29) {
        goto LABEL_86;
      }
    }

    else
    {
      unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager deviceUILockedPowerAssertion](v5, "deviceUILockedPowerAssertion"));
      if (v53) {
        char v54 = 1;
      }
      else {
        char v54 = v24;
      }

      if ((v54 & 1) == 0)
      {
        if (!v29) {
          goto LABEL_86;
        }
        if (!-[UACornerActionManager weAreAdvertisingAtLeastOneItem](v5, "weAreAdvertisingAtLeastOneItem"))
        {
          int v29 = 1;
          goto LABEL_86;
        }

        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v5, "advertisers"));
        id v64 = [v63 countByEnumeratingWithState:&v73 objects:v81 count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v74;
          while (2)
          {
            for (j = 0LL; j != v64; j = (char *)j + 1)
            {
              if (*(void *)v74 != v65) {
                objc_enumerationMutation(v63);
              }
              v67 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
              if ([v67 active]
                && [v67 advertising]
                && ([v67 okToSuspendAdvertising] & 1) == 0)
              {
                os_log_t v70 = sub_100039584(0LL);
                unsigned int v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v83 = v67;
                  _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting systemShouldNotBeAdvertising=NO because advertiser %{public}@ always wants to be advertised.",  buf,  0xCu);
                }

                int v29 = 0;
                goto LABEL_113;
              }
            }

            id v64 = [v63 countByEnumeratingWithState:&v73 objects:v81 count:16];
            if (v64) {
              continue;
            }
            break;
          }
        }

        int v29 = 1;
LABEL_113:

        goto LABEL_50;
      }
    }

    os_log_t v55 = sub_100039584(0LL);
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = objc_claimAutoreleasedReturnValue(-[UACornerActionManager deviceUILockedPowerAssertion](v5, "deviceUILockedPowerAssertion"));
      v57 = (void *)v56;
      v58 = "";
      v59 = "dimmed ";
      if (!v37) {
        v59 = "";
      }
      v60 = "uilock ";
      if (!v56) {
        v60 = "";
      }
      *(_DWORD *)buf = 136315906;
      v83 = (void *)v59;
      __int16 v84 = 2080;
      unsigned __int8 v85 = "";
      __int16 v86 = 2080;
      v87 = v60;
      if (v24) {
        v58 = "alwaysPick ";
      }
      __int16 v88 = 2080;
      __int128 v89 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting shouldSuspendAdvertising to NO because one or more of our assertions still exists. (%s%s%s%s)",  buf,  0x2Au);
    }

    int v29 = 0;
    goto LABEL_85;
  }

  os_log_t v51 = sub_100039584(0LL);
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting shouldSuspendAdvertising == YES because the device is locked and our power assertion has expired.",  buf,  2u);
  }

  int v29 = 1;
  if ((v16 & 1) == 0) {
    goto LABEL_69;
  }
LABEL_50:
  if (v16 && (v29 & 1) == 0)
  {
    os_log_t v41 = sub_100039584(0LL);
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      if (-[UACornerActionManager activityAdvertisingAllowed](v5, "activityAdvertisingAllowed")) {
        os_log_t v43 = @"(activityAdvertisingAllowed = NO) ";
      }
      else {
        os_log_t v43 = &stru_1000BE738;
      }
      os_log_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      unsigned int v45 = [v44 activityAdvertisingAllowed];
      id v46 = @"(disabled in System Preferences) ";
      if (!v45) {
        id v46 = &stru_1000BE738;
      }
      *(_DWORD *)buf = 138412546;
      v83 = (void *)v43;
      __int16 v84 = 2112;
      unsigned __int8 v85 = (const char *)v46;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "IDLE: Setting shouldSuspendAdvertising = YES because mustSuspendAdvertising == YES %@%@",  buf,  0x16u);
    }

    int v29 = 1;
LABEL_85:
  }

- (BOOL)systemHasSuspendedAdvertisements
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  BOOL systemHasSuspendedAdvertisements = v2->_systemHasSuspendedAdvertisements;
  objc_sync_exit(v2);

  return systemHasSuspendedAdvertisements;
}

- (void)setSystemHasSuspendedAdvertisements:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_systemHasSuspendedAdvertisements != v3)
  {
    v4->_BOOL systemHasSuspendedAdvertisements = v3;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v4, "advertisers"));
    id obj = v5;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8);
          unsigned int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](v4, "mainDispatchQ"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10001AE08;
          block[3] = &unk_1000BD060;
          BOOL v13 = v3;
          block[4] = v9;
          dispatch_async(v10, block);

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        os_log_t v5 = obj;
        id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v6);
    }

    if (!v3) {
      -[UACornerActionManager scheduleUpdatingAdvertisableItems](v4, "scheduleUpdatingAdvertisableItems");
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)systemHasSuspendedScanning
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  BOOL systemHasSuspendedScanning = v2->_systemHasSuspendedScanning;
  objc_sync_exit(v2);

  return systemHasSuspendedScanning;
}

- (void)setSystemHasSuspendedScanning:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL systemHasSuspendedScanning = a3;
  if (a3)
  {
    os_log_t v5 = 0LL;
  }

  else
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    if (!-[UACornerActionManager deviceUILocked](v4, "deviceUILocked")
      && !-[UACornerActionManager screenDimmed](v4, "screenDimmed"))
    {
      [v5 addObject:off_1000DD898];
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](v4, "notifiers"));
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if ([v10 active])
          {
            if (([v10 suspended] & 1) == 0)
            {
              [v5 addObject:off_1000DD890];
              if ([v10 requiresBoosted])
              {
                [v5 addObject:off_1000DD8A0];
                goto LABEL_18;
              }
            }
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)cornerActionItems
{
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debugCornerItem](self, "debugCornerItem"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debugCornerItem](self, "debugCornerItem"));
    [v18 addObject:v4];
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](self, "receivers"));
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ([v8 active])
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 receivedItems]);
          if (v9)
          {
            [v18 addObjectsFromArray:v9];
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            id v10 = v9;
            id v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v21;
              do
              {
                for (j = 0LL; j != v11; j = (char *)j + 1)
                {
                  if (*(void *)v21 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)j);
                  uint64_t v15 = objc_opt_class(&OBJC_CLASS___SharingBTLESuggestedItem);
                  objc_opt_isKindOfClass(v14, v15);
                }

                id v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
              }

              while (v11);
            }
          }
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v5);
  }

  if ([v18 count]) {
    id v16 = [v18 copy];
  }
  else {
    id v16 = 0LL;
  }

  return v16;
}

- (id)cornerActionItemForUUID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager cornerActionItems](self, "cornerActionItems", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)bestCornerItem
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager cornerActionItems](self, "cornerActionItems"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 anyObject]);

  return v3;
}

- (id)bestCornerItem:(id)a3
{
  return 0LL;
}

- (void)setDebugCornerItem:(id)a3
{
  id v5 = (UAUserActivityInfo *)a3;
  if (self->_debugCornerItem != v5)
  {
    objc_storeStrong((id *)&self->_debugCornerItem, a3);
    -[UACornerActionManager scheduleBestAppDetermination](self, "scheduleBestAppDetermination");
  }
}

- (UAUserActivityInfo)debugCornerItem
{
  return self->_debugCornerItem;
}

- (void)checkIfBestCornerItemChanged:(double)a3
{
  if (-[UACornerActionManager haveBestAppChangeNotificationClients](self, "haveBestAppChangeNotificationClients", a3))
  {
    os_log_t v4 = sub_100039584(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  " -- there are listening clients, so firing the check-and-update-BestApplication thread.",  v6,  2u);
    }

    -[UACornerActionManager scheduleBestAppDetermination](self, "scheduleBestAppDetermination");
  }

- (BOOL)scheduleBestAppDetermination
{
  return -[UACornerActionManager scheduleBestAppDetermination:](self, "scheduleBestAppDetermination:", 0.0);
}

- (BOOL)scheduleBestAppDetermination:(double)a3
{
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( self,  "nextScheduleBestAppDeterminationScheduler"));
  unsigned __int8 v5 = [v4 scheduleNext:a3];

  return v5;
}

- (void)_checkIfBestApplicationChangedThread
{
  os_log_t v3 = sub_100039584(0LL);
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Creating loop to check-for-and-update BestApplication",  buf,  2u);
  }

  dispatch_group_enter((dispatch_group_t)self->_helpersDispatchGroup);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager cornerActionItems](self, "cornerActionItems"));
  os_log_t v6 = sub_100039584(0LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    id v9 = sub_10005BF18(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138477827;
    __int128 v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Candidate bestAppSuggestions: %{private}@",  buf,  0xCu);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](self, "notifiers", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        __int128 v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
      }

      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v16 cornerActionItemTimeout];
  -[UACornerActionManager scheduleBestAppDetermination:](self, "scheduleBestAppDetermination:");

  dispatch_group_leave((dispatch_group_t)self->_helpersDispatchGroup);
}

- (BOOL)haveBestAppChangeNotificationClients
{
  os_log_t v2 = self;
  os_log_t v3 = self->_notifiers;
  objc_sync_enter(v3);
  LOBYTE(v2) = -[NSMutableSet count](v2->_notifiers, "count") != 0LL;
  objc_sync_exit(v3);

  return (char)v2;
}

- (BOOL)fetchMoreAppSuggestions
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v4 = [v3 multiHandoffEnabled];

  if (v4)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](self, "receivers", 0LL));
    unsigned int v4 = 0;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          v4 |= [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) fetchMoreAppSuggestions];
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v6);
    }
  }

  return v4 & 1;
}

- (void)processWasRemoved
{
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      unsigned __int8 v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) setShouldAdvertiseAutoPullActivityList:1];
        unsigned __int8 v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }

    while (v3);
  }
}

- (void)triggerAll
{
}

- (void)suspendListeningForBluetooth
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatusCallbackIdentifier](self, "bluetoothStatusCallbackIdentifier"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatus](self, "bluetoothStatus"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatusCallbackIdentifier](self, "bluetoothStatusCallbackIdentifier"));
    [v4 unregisterCallback:v5];

    -[UACornerActionManager setBluetoothStatusCallbackIdentifier:](self, "setBluetoothStatusCallbackIdentifier:", 0LL);
  }

- (void)resumeListeningForBluetooth
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatus](self, "bluetoothStatus"));

  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UABluetoothStatus sharedInstance](&OBJC_CLASS___UABluetoothStatus, "sharedInstance"));
    -[UACornerActionManager setBluetoothStatus:](self, "setBluetoothStatus:", v4);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatusCallbackIdentifier](self, "bluetoothStatusCallbackIdentifier"));

  if (!v5)
  {
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager bluetoothStatus](self, "bluetoothStatus"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001BED0;
    v8[3] = &unk_1000BD088;
    v8[4] = self;
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 registerCallback:v8]);
    -[UACornerActionManager setBluetoothStatusCallbackIdentifier:](self, "setBluetoothStatusCallbackIdentifier:", v7);
  }

- (BOOL)suspended
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_suspended != v3)
  {
    obj->_BOOL suspended = v3;
    if (v3) {
      -[UACornerActionManager suspend](obj, "suspend");
    }
    else {
      -[UACornerActionManager resume](obj, "resume");
    }
  }

  objc_sync_exit(obj);
}

- (void)suspend
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  os_log_t v3 = sub_100039584(0LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (v2->_suspended) {
      unsigned __int8 v5 = @"YES";
    }
    else {
      unsigned __int8 v5 = @"NO";
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "CornerActionManger:  suspend(was BOOL suspended = %{public}@)",  (uint8_t *)&buf,  0xCu);
  }

  if (!v2->_suspended)
  {
    getpid();
    v2->_BOOL suspended = 1;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v2, "advertisers"));
    id v7 = [v6 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v50;
      *(void *)&__int128 v8 = 138543362LL;
      __int128 v35 = v8;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v50 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          os_log_t v12 = sub_100039584(0LL);
          __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = v35;
            *(void *)((char *)&buf + 4) = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "*** Suspending advertiser %{public}@",  (uint8_t *)&buf,  0xCu);
          }

          [v11 suspend];
        }

        id v7 = [v6 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }

      while (v7);
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUpdateAdvertisedItemsScheduler]( v2,  "nextUpdateAdvertisedItemsScheduler"));
    [v14 suspend];

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](v2, "clients"));
    id v16 = [v15 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v46;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * (void)j), "suspend", v35);
        }

        id v16 = [v15 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }

      while (v16);
    }

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUserIdleDeterminationScheduler]( v2,  "nextUserIdleDeterminationScheduler"));
    [v19 suspend];

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](v2, "notifiers"));
    id v21 = [v20 countByEnumeratingWithState:&v41 objects:v57 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v42;
      do
      {
        for (k = 0LL; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)k), "suspend", v35);
        }

        id v21 = [v20 countByEnumeratingWithState:&v41 objects:v57 count:16];
      }

      while (v21);
    }

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( v2,  "nextScheduleBestAppDeterminationScheduler"));
    [v24 suspend];

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager handlers](v2, "handlers"));
    id v26 = [v25 countByEnumeratingWithState:&v37 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v38;
      do
      {
        for (m = 0LL; m != v26; m = (char *)m + 1)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)m), "suspend", v35);
        }

        id v26 = [v25 countByEnumeratingWithState:&v37 objects:v56 count:16];
      }

      while (v26);
    }
  }

  if (v2->_managedSettingsChangedNotificationToken)
  {
    os_log_t v29 = sub_100039584(0LL);
    os_log_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "--- Cancelling MCEffectiveSettingsChangedNotification notification.",  (uint8_t *)&buf,  2u);
    }

    notify_cancel(v2->_managedSettingsChangedNotificationToken);
    v2->_managedSettingsChangedNotificationToken = 0;
  }

  if (-[UACornerActionManager systemPreferenceChangedToken](v2, "systemPreferenceChangedToken", v35)) {
    notify_suspend(-[UACornerActionManager systemPreferenceChangedToken](v2, "systemPreferenceChangedToken"));
  }
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v31 removeObserver:v2 name:@"com.apple.screensaver.didstart" object:0];
  [v31 removeObserver:v2 name:@"com.apple.screensaver.didstop" object:0];
  notify_cancel(-[UACornerActionManager uiLockStatusToken](v2, "uiLockStatusToken"));
  uint64_t v32 = SBSEventObserverStopObservingAllEvents(-[UACornerActionManager setUiLockStatusToken:](v2, "setUiLockStatusToken:", 0LL));
  if (!byte_1000DE2A0)
  {
    int v33 = MKBDeviceUnlockedSinceBoot(v32);
    byte_1000DE2A0 = v33 != 0;
    if (!v33)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v54 = 0x2020000000LL;
      v55[0] = 0;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10001C6C4;
      handler[3] = &unk_1000BD0B0;
      handler[4] = v2;
      handler[5] = &buf;
      notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, v55, &_dispatch_main_q, handler);
      _Block_object_dispose(&buf, 8);
    }
  }

  -[UACornerActionManager suspendListeningForBluetooth](v2, "suspendListeningForBluetooth");
  os_log_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager userIdleTracker](v2, "userIdleTracker"));
  [v34 setEnabled:0];

  objc_sync_exit(v2);
  dispatch_group_wait((dispatch_group_t)v2->_helpersDispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)resume
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  os_log_t v3 = sub_100039584(0LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CornerActionManger:  resume", buf, 2u);
  }

  if (v2->_suspended)
  {
    getpid();
    v2->_BOOL suspended = 0;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager handlers](v2, "handlers"));
    id v6 = [v5 countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v81;
      do
      {
        __int128 v8 = 0LL;
        do
        {
          if (*(void *)v81 != v7) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v80 + 1) + 8 * (void)v8) resume];
          __int128 v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v80 objects:v89 count:16];
      }

      while (v6);
    }

    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v2, "advertisers"));
    id v10 = [v9 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v77;
      *(void *)&__int128 v11 = 138543362LL;
      __int128 v56 = v11;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v77 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v13);
          os_log_t v15 = sub_100039584(0LL);
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = v56;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "*** Resuming advertiser %{public}@",  buf,  0xCu);
          }

          [v14 resume];
          __int128 v13 = (char *)v13 + 1;
        }

        while (v10 != v13);
        id v10 = [v9 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }

      while (v10);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUpdateAdvertisedItemsScheduler]( v2,  "nextUpdateAdvertisedItemsScheduler"));
    [v17 resume];

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUpdateAdvertisedItemsScheduler]( v2,  "nextUpdateAdvertisedItemsScheduler"));
    [v18 scheduleNext:0.1];

    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](v2, "receivers"));
    id v20 = [v19 countByEnumeratingWithState:&v72 objects:v86 count:16];
    if (v20)
    {
      uint64_t v22 = *(void *)v73;
      *(void *)&__int128 v21 = 138543362LL;
      __int128 v56 = v21;
      do
      {
        __int128 v23 = 0LL;
        do
        {
          if (*(void *)v73 != v22) {
            objc_enumerationMutation(v19);
          }
          __int128 v24 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)v23);
          os_log_t v25 = sub_100039584(0LL);
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = v56;
            *(void *)&uint8_t buf[4] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "*** Resuming receiver %{public}@",  buf,  0xCu);
          }

          [v24 resume];
          __int128 v23 = (char *)v23 + 1;
        }

        while (v20 != v23);
        id v20 = [v19 countByEnumeratingWithState:&v72 objects:v86 count:16];
      }

      while (v20);
    }

    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](v2, "clients"));
    id v28 = [v27 countByEnumeratingWithState:&v68 objects:v85 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v69;
      do
      {
        os_log_t v30 = 0LL;
        do
        {
          if (*(void *)v69 != v29) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * (void)v30), "resume", v56);
          os_log_t v30 = (char *)v30 + 1;
        }

        while (v28 != v30);
        id v28 = [v27 countByEnumeratingWithState:&v68 objects:v85 count:16];
      }

      while (v28);
    }

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](v2, "notifiers"));
    id v32 = [v31 countByEnumeratingWithState:&v64 objects:v84 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v65;
      do
      {
        os_log_t v34 = 0LL;
        do
        {
          if (*(void *)v65 != v33) {
            objc_enumerationMutation(v31);
          }
          objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * (void)v34), "resume", v56);
          os_log_t v34 = (char *)v34 + 1;
        }

        while (v32 != v34);
        id v32 = [v31 countByEnumeratingWithState:&v64 objects:v84 count:16];
      }

      while (v32);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_10001D180,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    if (!-[UACornerActionManager systemPreferenceChangedToken](v2, "systemPreferenceChangedToken"))
    {
      int v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](v2, "mainDispatchQ"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10001D1E0;
      handler[3] = &unk_1000BD0D8;
      handler[4] = v2;
      notify_register_dispatch( UAUserActivityManagerActivityContinuationIsEnabledChangedNotification,  &v2->_systemPreferenceChangedToken,  v36,  handler);
    }

    notify_resume(-[UACornerActionManager systemPreferenceChangedToken](v2, "systemPreferenceChangedToken", v56));
    int out_token = 0;
    __int128 v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](v2, "mainDispatchQ"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_10001D254;
    v61[3] = &unk_1000BD0D8;
    v61[4] = v2;
    notify_register_dispatch(kSBSLockStateNotifyKey, &out_token, v37, v61);

    -[UACornerActionManager setUiLockStatusToken:](v2, "setUiLockStatusToken:", out_token);
    if (!-[UACornerActionManager backlightLevelToken](v2, "backlightLevelToken"))
    {
      __int128 v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](v2, "mainDispatchQ"));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_10001D2E4;
      v60[3] = &unk_1000BD0D8;
      void v60[4] = v2;
      notify_register_dispatch("com.apple.backboardd.backlight.changed", &v2->_backlightLevelToken, v38, v60);

      *(void *)__int128 buf = 0LL;
      notify_get_state(-[UACornerActionManager backlightLevelToken](v2, "backlightLevelToken"), (uint64_t *)buf);
      v2->_backlightOn = *(void *)buf != 0LL;
    }

    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitorConfiguration configurationForContinuityDisplay]( &OBJC_CLASS___FBSDisplayLayoutMonitorConfiguration,  "configurationForContinuityDisplay"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10001D430;
    v59[3] = &unk_1000BD100;
    v59[4] = v2;
    [v39 setTransitionHandler:v59];
    os_log_t v40 = sub_100039584(0LL);
    __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Installed Mirroring Monitor", buf, 2u);
    }

    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitor monitorWithConfiguration:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "monitorWithConfiguration:",  v39));
    mirroringMonitor = v2->_mirroringMonitor;
    v2->_mirroringMonitor = (FBSDisplayLayoutMonitor *)v42;

    if (!v2->_managedSettingsChangedNotificationToken)
    {
      __int128 v44 = (const char *)[MCEffectiveSettingsChangedNotification cStringUsingEncoding:4];
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      __int128 v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472LL;
      v58[2] = sub_10001D5FC;
      v58[3] = &unk_1000BD0D8;
      void v58[4] = v2;
      notify_register_dispatch(v44, &v2->_managedSettingsChangedNotificationToken, v46, v58);
    }

    -[UACornerActionManager resumeListeningForBluetooth](v2, "resumeListeningForBluetooth");
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager userIdleTracker](v2, "userIdleTracker"));
    [v47 setEnabled:1];

    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( v2,  "nextScheduleBestAppDeterminationScheduler"));
    [v48 reset];

    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( v2,  "nextScheduleBestAppDeterminationScheduler"));
    [v49 resume];

    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( v2,  "nextScheduleBestAppDeterminationScheduler"));
    [v50 scheduleNext:0.1];

    -[UACornerActionManager setSystemHasSuspendedAdvertisements:](v2, "setSystemHasSuspendedAdvertisements:", 1LL);
    -[UACornerActionManager setSystemHasSuspendedAdvertisements:](v2, "setSystemHasSuspendedAdvertisements:", 0LL);
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUserIdleDeterminationScheduler]( v2,  "nextUserIdleDeterminationScheduler"));
    [v51 reset];

    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUserIdleDeterminationScheduler]( v2,  "nextUserIdleDeterminationScheduler"));
    [v52 resume];

    unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUserIdleDeterminationScheduler]( v2,  "nextUserIdleDeterminationScheduler"));
    [v53 scheduleNext:0.1];

    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager userIdleTracker](v2, "userIdleTracker"));
    [v54 setEnabled:1];
  }

  objc_sync_exit(v2);

  os_log_t v55 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](v2, "mainDispatchQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D734;
  block[3] = &unk_1000BCCA8;
  block[4] = v2;
  dispatch_async(v55, block);
}

- (void)terminate
{
}

- (BOOL)userActive
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  BOOL userActive = v2->_userActive;
  objc_sync_exit(v2);

  return userActive;
}

- (void)setUserActive:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL userActive = a3;
  objc_sync_exit(obj);
}

- (void)updateUserActiveState:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      __int128 v8 = @"YES";
    }
    else {
      __int128 v8 = @"NO";
    }
    if (self->_userActive) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)__int128 buf = 138543618;
    id v28 = v8;
    __int16 v29 = 2114;
    os_log_t v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "setUserIsActive: %{public}@ (was %{public}@)",  buf,  0x16u);
  }

  if (-[UACornerActionManager userActive](self, "userActive") != v3)
  {
    self->_BOOL userActive = v3;
    os_log_t v9 = sub_100039584(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v11)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "userInactivePowerAssertion, setting to NO, so removing power assertion & triggering idle determination.",  buf,  2u);
      }

      -[UACornerActionManager setUserInactivePowerAssertion:](self, "setUserInactivePowerAssertion:", 0LL);
      -[UACornerActionManager triggerUserIdleDetermination](self, "triggerUserIdleDetermination");
      -[UACornerActionManager scheduleUpdatingAdvertisableItems](self, "scheduleUpdatingAdvertisableItems");
    }

    else
    {
      if (v11)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "setUserIsActive, setting to NO, so creating assertion if warranted.",  buf,  2u);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self, "clients"));
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v14 userIdleRemovalDelay];
      double v16 = v15;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v17 userIdleRemovalDelay];
      double v19 = sub_10001DB4C(v12, v13, v16, v18);

      os_log_t v20 = sub_100039584(0LL);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v19 <= 0.0)
      {
        if (v22)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "setUserIsActive, no need for assertion, triggering updateAdvertisableItems",  buf,  2u);
        }

        -[UACornerActionManager setUserInactivePowerAssertion:](self, "setUserInactivePowerAssertion:", 0LL);
        -[UACornerActionManager scheduleUpdatingAdvertisableItems](self, "scheduleUpdatingAdvertisableItems");
      }

      else
      {
        if (v22)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "setUserIsActive, creating assertion because we are advertising something",  buf,  2u);
        }

        __int128 v23 = objc_alloc(&OBJC_CLASS___UATimedPowerAssertions);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](self, "mainDispatchQ"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_10001DE58;
        v26[3] = &unk_1000BCFA8;
        v26[4] = self;
        os_log_t v25 = -[UATimedPowerAssertions initWithName:delta:activityUUID:queue:runAtCompletion:]( v23,  "initWithName:delta:activityUUID:queue:runAtCompletion:",  @"userInactivePowerAssertion",  0LL,  v24,  v26,  v19);
        -[UACornerActionManager setUserInactivePowerAssertion:](self, "setUserInactivePowerAssertion:", v25);
      }
    }
  }

- (void)updateScreenDimStateState:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      __int128 v8 = @"YES";
    }
    else {
      __int128 v8 = @"NO";
    }
    if (self->_screenDimmed) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)__int128 buf = 138543618;
    os_log_t v30 = v8;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "updateScreenDimState: %{public}@ (was %{public}@)",  buf,  0x16u);
  }

  if (-[UACornerActionManager screenDimmed](self, "screenDimmed") != v3)
  {
    self->_screenDimmed = v3;
    os_log_t v9 = "active";
    if (v3) {
      os_log_t v9 = "DIMMED";
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"SCREEN: %s", v9));
    +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v10);

    os_log_t v11 = sub_100039584(0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v13)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "updateScreenDimmedState, setting to YES, so creating assertion if needed.",  buf,  2u);
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self, "clients"));
      double v16 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v16 screenDimDelayBeforeRemovingAdvertisements];
      double v18 = v17;
      double v19 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v19 screenDimDelayBeforeRemovingPasteboardAdvertisement];
      double v21 = sub_10001DB4C(v14, v15, v18, v20);

      os_log_t v22 = sub_100039584(0LL);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (v21 <= 0.0)
      {
        if (v24)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "updateScreenDimmedState, no need for assertion, triggering state updates",  buf,  2u);
        }

        -[UACornerActionManager triggerUserIdleDetermination](self, "triggerUserIdleDetermination");
        -[UACornerActionManager scheduleUpdatingAdvertisableItems](self, "scheduleUpdatingAdvertisableItems");
      }

      else
      {
        if (v24)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "updateScreenDimmedState, creating assertion",  buf,  2u);
        }

        os_log_t v25 = objc_alloc(&OBJC_CLASS___UATimedPowerAssertions);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](self, "mainDispatchQ"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10001E2FC;
        v28[3] = &unk_1000BCFA8;
        v28[4] = self;
        uint64_t v27 = -[UATimedPowerAssertions initWithName:delta:activityUUID:queue:runAtCompletion:]( v25,  "initWithName:delta:activityUUID:queue:runAtCompletion:",  @"screenDimmedPowerAssertion",  0LL,  v26,  v28,  v21);
        -[UACornerActionManager setScreenDimmedPowerAssertion:](self, "setScreenDimmedPowerAssertion:", v27);
      }
    }

    else
    {
      if (v13)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState, setting to NO, so removing power assertion & triggering idle determination.",  buf,  2u);
      }

      -[UACornerActionManager setScreenDimmedPowerAssertion:](self, "setScreenDimmedPowerAssertion:", 0LL);
      -[UACornerActionManager triggerUserIdleDetermination](self, "triggerUserIdleDetermination");
      -[UACornerActionManager scheduleUpdatingAdvertisableItems](self, "scheduleUpdatingAdvertisableItems");
    }
  }

- (void)updateUIDeviceLockedState:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      __int128 v8 = @"YES";
    }
    else {
      __int128 v8 = @"NO";
    }
    if (self->_deviceUILocked) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)__int128 buf = 138543618;
    double v30 = *(double *)&v8;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState: %{public}@ (was %{public}@)",  buf,  0x16u);
  }

  if (-[UACornerActionManager deviceUILocked](self, "deviceUILocked") != v3)
  {
    self->_deviceUILocked = v3;
    os_log_t v9 = "unlocked";
    if (v3) {
      os_log_t v9 = "LOCKED";
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DEVICELOCK: %s",  v9));
    +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v10);

    os_log_t v11 = sub_100039584(0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v13)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState, setting to YES, so creating assertion if we have an advertisement.",  buf,  2u);
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self, "clients"));
      double v16 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v16 deviceLockDelayBeforeRemovingHandoffAdvertisement];
      double v18 = v17;
      double v19 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v19 deviceLockDelayBeforeRemovingPasteboardAdvertisement];
      double v21 = sub_10001DB4C(v14, v15, v18, v20);

      os_log_t v22 = sub_100039584(0LL);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (v21 <= 0.0)
      {
        if (v24)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState, no need for assertion, triggering state updates",  buf,  2u);
        }

        -[UACornerActionManager triggerUserIdleDetermination](self, "triggerUserIdleDetermination");
        -[UACornerActionManager scheduleUpdatingAdvertisableItems](self, "scheduleUpdatingAdvertisableItems");
      }

      else
      {
        if (v24)
        {
          *(_DWORD *)__int128 buf = 134217984;
          double v30 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Creating power assertion of %g seconds, to keep advertisement alive.",  buf,  0xCu);
        }

        os_log_t v25 = objc_alloc(&OBJC_CLASS___UATimedPowerAssertions);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](self, "mainDispatchQ"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10001E7A4;
        v28[3] = &unk_1000BCFA8;
        v28[4] = self;
        uint64_t v27 = -[UATimedPowerAssertions initWithName:delta:activityUUID:queue:runAtCompletion:]( v25,  "initWithName:delta:activityUUID:queue:runAtCompletion:",  @"deviceUILockAssertion",  0LL,  v26,  v28,  v21);
        -[UACornerActionManager setDeviceUILockedPowerAssertion:](self, "setDeviceUILockedPowerAssertion:", v27);
      }
    }

    else
    {
      if (v13)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState, device is unlocked, so removing power assertion & triggering advertising & idle determination.",  buf,  2u);
      }

      -[UACornerActionManager setDeviceUILockedPowerAssertion:](self, "setDeviceUILockedPowerAssertion:", 0LL);
      -[UACornerActionManager triggerAll](self, "triggerAll");
    }
  }

- (id)dictionaryForAdvertisableItem:(id)a3
{
  return 0LL;
}

- (id)dictionaryForCornerActionItem:(id)a3
{
  return 0LL;
}

- (id)debuggingInfo
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v4 = -[UACornerActionManager weAreAdvertisingAnItem](self, "weAreAdvertisingAnItem");
  if (v4)
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager uaAdvertisableItemsInOrder](self, "uaAdvertisableItemsInOrder"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager dictionaryForAdvertisableItem:](self, "dictionaryForAdvertisableItem:", v6));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v7,  @"kLSUserActivityDebuggingInfoCurrentAdvertisedItem");

    id v8 = sub_1000034D8(0LL);
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v9,  @"kLSUserActivityDebuggingInfoLastAdvertisedBytes");
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v10,  @"kLSUserActivityDebuggingInfoAdvertising");

  id v11 = -[NSMutableDictionary copy](v3, "copy");
  return v11;
}

- (id)dynamicUserActivitiesString
{
  os_log_t v2 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  uint64_t v3 = kUADynamicUserActivitesPreferences;
  BOOL v4 = -[NSUserDefaults initWithSuiteName:](v2, "initWithSuiteName:", kUADynamicUserActivitesPreferences);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v4, "objectForKey:", kUADynamicUserActivitiesKey));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Dynamic User Activities: (domain=%@) %@",  v3,  v5));

  return v6;
}

- (id)shortStatusString
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  pid_t v4 = getpid();
  uid_t v5 = geteuid();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 timeIntervalSinceDate:self->_creationTime];
  id v8 = sub_100075B60(v7);
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSDate);
  if (qword_1000DE2E8 != -1) {
    dispatch_once(&qword_1000DE2E8, &stru_1000BD240);
  }
  [v3 appendFormat:@"Manager status: pid=%lld, uid=%lld, uptime=%@ %@ (Version %s, built %s %s %s)\n", v4, v5, v9, v10, byte_1000DE2A1, "Nov 10 2024", "02:01:12", ""];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
  if ([v32 count])
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingComparator:&stru_1000BD140]);

    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v13);
          }
          double v17 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          if ([v17 advertising])
          {
            double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 statusString]);
            sub_10001EFAC(v3, v18, @"ADVERTISING:", @"  ");
          }
        }

        id v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }

      while (v14);
    }
  }

  else
  {
    objc_msgSend( v3,  "appendString:",  @"*** No UAAdvertisers defined at present, so no advertising is taking place.\n\n");
  }

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](self, "receivers"));
  if ((unint64_t)[v19 count] < 2)
  {
    objc_msgSend(v3, "appendString:", @"No UAReceivers defined at present, so no activities will be received.\n");
  }

  else
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int16 v31 = v19;
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sortedArrayUsingComparator:&stru_1000BD160]);

    id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v34;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v21);
          }
          os_log_t v25 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 receivedItems]);
          BOOL v27 = [v26 count] == 0;

          if (!v27)
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 statusString]);
            sub_10001EFAC(v3, v28, @"RECEIVING:", @"  ");
          }
        }

        id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }

      while (v22);
    }

    double v19 = v31;
  }

  id v29 = [v3 copy];

  return v29;
}

- (id)statusString
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debugManager](self, "debugManager"));
  [v2 currentPerfTime];
  double v4 = v3;

  id v156 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  pid_t v5 = getpid();
  uid_t v6 = geteuid();
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = self;
  [v7 timeIntervalSinceDate:self->_creationTime];
  id v10 = sub_100075B60(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSDate);
  id v13 = sub_100075B60(v4 - *(double *)&qword_1000DE298);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (qword_1000DE2E8 != -1) {
    dispatch_once(&qword_1000DE2E8, &stru_1000BD240);
  }
  [v156 appendFormat:@"Manager status: pid=%lld, uid=%lld, uptime=%@ %@ runtime=%@ (Version %s, built %s %s %s)\n", v5, v6, v11, v12, v14, byte_1000DE2A1, "Nov 10 2024", "02:01:12", ""];

  v146 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
  if ([v146 count])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
    id v16 = [v15 count];
    if (-[UACornerActionManager advertisingSuspended](self, "advertisingSuspended")) {
      double v17 = @"(SUSPENDED)";
    }
    else {
      double v17 = &stru_1000BE738;
    }
    double v18 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUpdateAdvertisedItemsScheduler]( self,  "nextUpdateAdvertisedItemsScheduler"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 nextRunTimeString]);
    [v156 appendFormat:@"### ADVERTISERS (%ld total) %@ nextCheck=%@\n", v16, v17, v19];

    __int128 v195 = 0u;
    __int128 v196 = 0u;
    __int128 v193 = 0u;
    __int128 v194 = 0u;
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sortedArrayUsingComparator:&stru_1000BD180]);

    id v23 = [v22 countByEnumeratingWithState:&v193 objects:v206 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v194;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v194 != v24) {
            objc_enumerationMutation(v22);
          }
          id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v193 + 1) + 8 * (void)i) statusString]);
          sub_10001EFAC(v156, v26, @" +", @"  ");
        }

        id v23 = [v22 countByEnumeratingWithState:&v193 objects:v206 count:16];
      }

      while (v23);
    }

    BOOL v27 = @"\n";
    id v8 = self;
  }

  else
  {
    BOOL v27 = @"*** No UAAdvertisers defined at present, so no advertising is taking place.\n\n";
  }

  [v156 appendString:v27];
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](v8, "receivers"));
  if ((unint64_t)[v148 count] >= 2)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](v8, "receivers"));
    objc_msgSend(v156, "appendFormat:", @"### RECEIVERS (%ld total)\n", objc_msgSend(v28, "count"));

    __int128 v191 = 0u;
    __int128 v192 = 0u;
    __int128 v189 = 0u;
    __int128 v190 = 0u;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v148 allObjects]);
    double v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sortedArrayUsingComparator:&stru_1000BD1A0]);

    id v31 = [v30 countByEnumeratingWithState:&v189 objects:v205 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v190;
      do
      {
        for (j = 0LL; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v190 != v32) {
            objc_enumerationMutation(v30);
          }
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v189 + 1) + 8 * (void)j) statusString]);
          sub_10001EFAC(v156, v34, @" +", @"  ");
        }

        id v31 = [v30 countByEnumeratingWithState:&v189 objects:v205 count:16];
      }

      while (v31);
    }

    goto LABEL_27;
  }

  if ([v148 count] == (id)1)
  {
    double v30 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](v8, "receivers"));
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v30 anyObject]);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 statusString]);
    sub_10001EFAC(v156, v36, @" +", @"  ");

LABEL_27:
    id v8 = self;
    goto LABEL_29;
  }

  objc_msgSend(v156, "appendString:", @"No UAReceivers defined at present, so no activities will be received.\n");
LABEL_29:
  uint64_t v37 = objc_claimAutoreleasedReturnValue(+[SharingBTLESuggestedItem statusString](&OBJC_CLASS___SharingBTLESuggestedItem, "statusString"));
  v145 = (void *)v37;
  if (v37) {
    [v156 appendString:v37];
  }
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertiseableItems](v8, "advertiseableItems"));
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 allObjects]);
  v149 = (void *)objc_claimAutoreleasedReturnValue([v39 sortedArrayUsingComparator:&stru_1000BD1C0]);

  __int128 v40 = self;
  if ([v149 count])
  {
    [v156 appendString:@"\n### AdvertiseableItems(that might be broadcast to other machines/remind me later)\n"];
    v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v187 = 0u;
    __int128 v188 = 0u;
    __int128 v185 = 0u;
    __int128 v186 = 0u;
    id obj = v149;
    id v41 = [obj countByEnumeratingWithState:&v185 objects:v204 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v186;
      do
      {
        for (k = 0LL; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v186 != v42) {
            objc_enumerationMutation(obj);
          }
          __int128 v44 = *(void **)(*((void *)&v185 + 1) + 8LL * (void)k);
          if (sub_10005C3C4((uint64_t)[v44 type]))
          {
            __int128 v183 = 0u;
            __int128 v184 = 0u;
            __int128 v181 = 0u;
            __int128 v182 = 0u;
            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](self, "advertisers"));
            id v46 = [v45 countByEnumeratingWithState:&v181 objects:v203 count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v182;
              while (2)
              {
                for (m = 0LL; m != v46; m = (char *)m + 1)
                {
                  if (*(void *)v182 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  __int128 v49 = *(void **)(*((void *)&v181 + 1) + 8LL * (void)m);
                  if ([v49 active])
                  {
                    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 advertisingItems]);
                    unsigned __int8 v51 = [v50 containsObject:v44];

                    if ((v51 & 1) != 0)
                    {
                      int v52 = 1;
                      goto LABEL_49;
                    }
                  }
                }

                id v46 = [v45 countByEnumeratingWithState:&v181 objects:v203 count:16];
                if (v46) {
                  continue;
                }
                break;
              }
            }

            int v52 = 0;
LABEL_49:

            unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v44 options]);
            uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( [v53 objectForKeyedSubscript:@"UAUserActivityAdvertiserHasMoreActivities"]);
            unsigned int v55 = [v54 BOOLValue];

            uint64_t v56 = objc_claimAutoreleasedReturnValue([v44 statusString]);
            v57 = (void *)v56;
            v58 = &stru_1000BE738;
            v59 = @"(more items available) ";
            if (!v55) {
              v59 = &stru_1000BE738;
            }
            if (v52) {
              v58 = @"(advertised) ";
            }
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"- %@%@%@\n",  v58,  v59,  v56));

            if ((v52 & 1) != 0) {
              id v61 = 0LL;
            }
            else {
              id v61 = [v151 count];
            }
            [v151 insertObject:v60 atIndex:v61];
          }
        }

        id v41 = [obj countByEnumeratingWithState:&v185 objects:v204 count:16];
      }

      while (v41);
    }

    __int128 v179 = 0u;
    __int128 v180 = 0u;
    __int128 v177 = 0u;
    __int128 v178 = 0u;
    id obja = v151;
    id v62 = [obja countByEnumeratingWithState:&v177 objects:v202 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v178;
      do
      {
        for (n = 0LL; n != v62; n = (char *)n + 1)
        {
          if (*(void *)v178 != v63) {
            objc_enumerationMutation(obja);
          }
          [v156 appendString:*(void *)(*((void *)&v177 + 1) + 8 * (void)n)];
        }

        id v62 = [obja countByEnumeratingWithState:&v177 objects:v202 count:16];
      }

      while (v62);
    }

    __int128 v40 = self;
  }

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager cornerActionItems](v40, "cornerActionItems"));
  if ([v147 count])
  {
    [v156 appendString:@"\nCornerActionItems (potential items to appear on this device as resumable from other devices)\n"];
    __int128 v175 = 0u;
    __int128 v176 = 0u;
    __int128 v173 = 0u;
    __int128 v174 = 0u;
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v147 allObjects]);
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v65 sortedArrayUsingComparator:&stru_1000BD1E0]);

    id v67 = [v66 countByEnumeratingWithState:&v173 objects:v201 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v174;
      do
      {
        for (ii = 0LL; ii != v67; ii = (char *)ii + 1)
        {
          if (*(void *)v174 != v68) {
            objc_enumerationMutation(v66);
          }
          __int128 v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v173 + 1) + 8 * (void)ii) statusString]);
          __int128 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"- %@\n",  v70));
          [v156 appendString:v71];
        }

        id v67 = [v66 countByEnumeratingWithState:&v173 objects:v201 count:16];
      }

      while (v67);
    }

    __int128 v40 = self;
  }

  __int128 v72 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager pinnedUserActivityInfoItem](v40, "pinnedUserActivityInfoItem"));
  BOOL v73 = v72 == 0LL;

  if (!v73)
  {
    [v156 appendString:@"\nPinned Activity Info\n"];
    __int128 v74 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager pinnedUserActivityInfoItem](self, "pinnedUserActivityInfoItem"));
    __int128 v75 = (void *)objc_claimAutoreleasedReturnValue([v74 description]);
    __int128 v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"- %@\n", v75));
    [v156 appendString:v76];
  }

  __int128 v77 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](self, "notifiers"));
  BOOL v78 = [v77 count] == 0;

  __int128 v79 = self;
  if (!v78)
  {
    __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](self, "notifiers"));
    id v81 = [v80 count];
    __int128 v82 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( self,  "nextScheduleBestAppDeterminationScheduler"));
    __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v82 nextRunTimeString]);
    [v156 appendFormat:@"\n### NOTIFIERS (%ld total) nextCheck=%@\n", v81, v83];

    __int128 v171 = 0u;
    __int128 v172 = 0u;
    __int128 v169 = 0u;
    __int128 v170 = 0u;
    __int16 v84 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager notifiers](self, "notifiers"));
    unsigned __int8 v85 = (void *)objc_claimAutoreleasedReturnValue([v84 allObjects]);
    __int16 v86 = (void *)objc_claimAutoreleasedReturnValue([v85 sortedArrayUsingComparator:&stru_1000BD200]);

    id v87 = [v86 countByEnumeratingWithState:&v169 objects:v200 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v170;
      do
      {
        for (jj = 0LL; jj != v87; jj = (char *)jj + 1)
        {
          if (*(void *)v170 != v88) {
            objc_enumerationMutation(v86);
          }
          __int128 v90 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v169 + 1) + 8 * (void)jj) statusString]);
          sub_10001EFAC(v156, v90, @" + ", @"   ");
        }

        id v87 = [v86 countByEnumeratingWithState:&v169 objects:v200 count:16];
      }

      while (v87);
    }

    [v156 appendString:@"\n"];
    __int128 v79 = self;
  }

  __int128 v167 = 0u;
  __int128 v168 = 0u;
  __int128 v165 = 0u;
  __int128 v166 = 0u;
  __int128 v91 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](v79, "clients"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v91 allObjects]);
  __int128 v93 = (void *)objc_claimAutoreleasedReturnValue([v92 sortedArrayUsingComparator:&stru_1000BD220]);

  id v94 = [v93 countByEnumeratingWithState:&v165 objects:v199 count:16];
  if (v94)
  {
    uint64_t v95 = *(void *)v166;
    do
    {
      for (kk = 0LL; kk != v94; kk = (char *)kk + 1)
      {
        if (*(void *)v166 != v95) {
          objc_enumerationMutation(v93);
        }
        __int128 v97 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v165 + 1) + 8 * (void)kk) statusString]);
        if (v97) {
          [v156 appendString:v97];
        }
      }

      id v94 = [v93 countByEnumeratingWithState:&v165 objects:v199 count:16];
    }

    while (v94);
  }

  __int128 v98 = self;
  id objb = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManager handlers](self, "handlers"));
  if ([objb count])
  {
    objc_msgSend(v156, "appendFormat:", @"\n### HANDLERS: (%ld total)\n", objc_msgSend(objb, "count"));
    __int128 v163 = 0u;
    __int128 v164 = 0u;
    __int128 v161 = 0u;
    __int128 v162 = 0u;
    id v99 = objb;
    id v100 = [v99 countByEnumeratingWithState:&v161 objects:v198 count:16];
    if (v100)
    {
      uint64_t v101 = *(void *)v162;
      do
      {
        for (mm = 0LL; mm != v100; mm = (char *)mm + 1)
        {
          if (*(void *)v162 != v101) {
            objc_enumerationMutation(v99);
          }
          id v103 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v161 + 1) + 8 * (void)mm) statusString]);
          if (v103) {
            sub_10001EFAC(v156, v103, @"-", 0LL);
          }
        }

        id v100 = [v99 countByEnumeratingWithState:&v161 objects:v198 count:16];
      }

      while (v100);
    }

    __int128 v98 = self;
  }

  v143 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager userIdleTracker](v98, "userIdleTracker"));
  else {
    __int16 v104 = " userIdle";
  }
  if (-[UACornerActionManager systemHasSuspendedAdvertisements](v98, "systemHasSuspendedAdvertisements")) {
    v105 = "YES";
  }
  else {
    v105 = "NO";
  }
  unsigned int v106 = -[UACornerActionManager screenDimmed](v98, "screenDimmed");
  v107 = " dimmed:YES";
  if (!v106) {
    v107 = "";
  }
  v144 = v107;
  unsigned int v108 = -[UACornerActionManager deviceUILocked](v98, "deviceUILocked");
  v109 = " locked:YES";
  if (!v108) {
    v109 = "";
  }
  v142 = v109;
  v141 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUpdateAdvertisedItemsScheduler]( v98,  "nextUpdateAdvertisedItemsScheduler"));
  id v110 = [v141 runCount];
  v140 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUpdateAdvertisedItemsScheduler]( v98,  "nextUpdateAdvertisedItemsScheduler"));
  v111 = sub_100075AC8((unint64_t)[v140 nextTime]);
  v152 = (void *)objc_claimAutoreleasedReturnValue(v111);
  v139 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUserIdleDeterminationScheduler]( v98,  "nextUserIdleDeterminationScheduler"));
  id v112 = [v139 runCount];
  v113 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextUserIdleDeterminationScheduler]( v98,  "nextUserIdleDeterminationScheduler"));
  v114 = sub_100075AC8((unint64_t)[v113 nextTime]);
  v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  v116 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( v98,  "nextScheduleBestAppDeterminationScheduler"));
  v117 = v104;
  id v118 = [v116 runCount];
  v119 = (void *)objc_claimAutoreleasedReturnValue( -[UACornerActionManager nextScheduleBestAppDeterminationScheduler]( self,  "nextScheduleBestAppDeterminationScheduler"));
  v120 = sub_100075AC8((unint64_t)[v119 nextTime]);
  v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
  [v156 appendFormat:@"\nIdle determination:%s suspended=%s%s%s%s pick=%ld/%@ idle=%ld/%@ bestApp=%ld/%@\n", v117, v105, v144, v142, "", v110, v152, v112, v115, v118, v121];

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debugManager](self, "debugManager"));
  v123 = (void *)objc_claimAutoreleasedReturnValue([v122 perfSummaryString]);

  if (v123) {
    [v156 appendFormat:@"PERF:%@\n", v123];
  }
  uint64_t v124 = objc_claimAutoreleasedReturnValue(+[UATimedPowerAssertions statusString](&OBJC_CLASS___UATimedPowerAssertions, "statusString"));
  v125 = (void *)v124;
  if (v124) {
    [v156 appendFormat:@"%@\n", v124];
  }
  [v156 appendString:@"\n"];
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  id v126 = (id)objc_claimAutoreleasedReturnValue( +[ActivityManagerDebuggingManager actionStrs:maximumInternal:clear:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "actionStrs:maximumInternal:clear:",  5LL,  0LL,  30.0));
  id v127 = [v126 countByEnumeratingWithState:&v157 objects:v197 count:16];
  if (v127)
  {
    uint64_t v128 = *(void *)v158;
    do
    {
      for (nn = 0LL; nn != v127; nn = (char *)nn + 1)
      {
        if (*(void *)v158 != v128) {
          objc_enumerationMutation(v126);
        }
        [v156 appendFormat:@" - %@\n", *(void *)(*((void *)&v157 + 1) + 8 * (void)nn)];
      }

      id v127 = [v126 countByEnumeratingWithState:&v157 objects:v197 count:16];
    }

    while (v127);
  }

  v130 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  v131 = (void *)objc_claimAutoreleasedReturnValue([v130 statusString]);
  [v156 appendString:v131];

  v132 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager pasteboardController](self, "pasteboardController"));
  v133 = (void *)objc_claimAutoreleasedReturnValue([v132 localPBStatus]);
  [v156 appendFormat:@"\n%@\n", v133];

  v134 = NSTemporaryDirectory();
  v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
  [v156 appendFormat:@"NSTemporaryDirectory=%@\n", v135];

  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debugManager](self, "debugManager"));
  [v136 currentPerfTime];
  *(double *)&qword_1000DE298 = v137 - v4 + *(double *)&qword_1000DE298;

  return v156;
}

- (NSSet)advertisers
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_advertisers, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addAdvertiser:(id)a3
{
  id v4 = a3;
  pid_t v5 = self;
  objc_sync_enter(v5);
  if ((-[NSMutableSet containsObject:](v5->_advertisers, "containsObject:", v4) & 1) == 0)
  {
    os_log_t v6 = sub_100039584(0LL);
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "addAdvertiser(%{public}@)",  (uint8_t *)&v9,  0xCu);
    }

    -[NSMutableSet addObject:](v5->_advertisers, "addObject:", v4);
    uint64_t v8 = -[UACornerActionManager suspended](v5, "suspended")
      || -[UACornerActionManager advertisingSuspended](v5, "advertisingSuspended");
    [v4 setSuspended:v8];
    -[UACornerActionManager scheduleUpdatingAdvertisableItems](v5, "scheduleUpdatingAdvertisableItems");
  }

  objc_sync_exit(v5);
}

- (void)removeAdvertiser:(id)a3
{
  id v4 = a3;
  pid_t v5 = self;
  objc_sync_enter(v5);
  if (v4 && -[NSMutableSet containsObject:](v5->_advertisers, "containsObject:", v4))
  {
    os_log_t v6 = sub_100039584(0LL);
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "removeAdvertiser(%{public}@)",  (uint8_t *)&v8,  0xCu);
    }

    -[NSMutableSet removeObject:](v5->_advertisers, "removeObject:", v4);
    -[UACornerActionManager scheduleUpdatingAdvertisableItems](v5, "scheduleUpdatingAdvertisableItems");
  }

  objc_sync_exit(v5);
}

- (NSSet)receivers
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_receivers, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addReceiver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((-[NSMutableSet containsObject:](v4->_receivers, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableSet addObject:](v4->_receivers, "addObject:", v6);
    uint64_t v5 = v4->_suspended || -[UACornerActionManager receivingSuspended](v4, "receivingSuspended");
    [v6 setSuspended:v5];
  }

  objc_sync_exit(v4);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](v5->_receivers, "removeObject:", v6);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (NSSet)clients
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_clients, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((-[NSMutableSet containsObject:](v4->_clients, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableSet addObject:](v4->_clients, "addObject:", v5);
    objc_msgSend(v5, "setSuspended:", -[UACornerActionManager suspended](v4, "suspended"));
    -[UACornerActionManager scheduleUpdatingAdvertisableItems](v4, "scheduleUpdatingAdvertisableItems");
  }

  objc_sync_exit(v4);
}

- (void)removeClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5 && -[NSMutableSet containsObject:](v4->_clients, "containsObject:", v5))
  {
    -[NSMutableSet removeObject:](v4->_clients, "removeObject:", v5);
    -[UACornerActionManager scheduleUpdatingAdvertisableItems](v4, "scheduleUpdatingAdvertisableItems");
  }

  objc_sync_exit(v4);
}

- (NSSet)notifiers
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_notifiers, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addActivityNotifier:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](v4->_notifiers, "addObject:", v5);
  objc_msgSend(v5, "setSuspended:", -[UACornerActionManager suspended](v4, "suspended"));
  -[UACornerActionManager triggerUserIdleDetermination](v4, "triggerUserIdleDetermination");
  objc_sync_exit(v4);
}

- (void)removeActivityNotifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](v5->_notifiers, "removeObject:", v6);
    -[UACornerActionManager triggerUserIdleDetermination](v5, "triggerUserIdleDetermination");
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (NSSet)handlers
{
  os_log_t v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_handlers, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addHandler:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](v4->_handlers, "addObject:", v5);
  objc_msgSend(v5, "setSuspended:", -[UACornerActionManager suspended](v4, "suspended"));
  objc_sync_exit(v4);
}

- (void)removeHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](v5->_handlers, "removeObject:", v6);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (NSSet)allHandlers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = self;
  objc_sync_enter(v4);
  [v3 unionSet:v4->_advertisers];
  [v3 unionSet:v4->_receivers];
  [v3 unionSet:v4->_clients];
  [v3 unionSet:v4->_notifiers];
  [v3 unionSet:v4->_handlers];
  objc_sync_exit(v4);

  id v5 = [v3 copy];
  return (NSSet *)v5;
}

- (BOOL)isBacklightOn
{
  return self->_backlightOn;
}

- (void)setBacklightOn:(BOOL)a3
{
  self->_backlightOn = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 152LL, 1);
}

- (NSSet)activeDevicesIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 160LL, 1);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 168LL, 1);
}

- (BOOL)isBatterySaverModeEnabled
{
  return self->_batterySaverModeEnabled;
}

- (ActivityManagerDebuggingManager)debugManager
{
  return (ActivityManagerDebuggingManager *)objc_getProperty(self, a2, 176LL, 1);
}

- (UAUserActivityInfo)pinnedUserActivityInfoItem
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setPinnedUserActivityInfoItem:(id)a3
{
}

- (BOOL)receivingSuspended
{
  return self->_receivingSuspended;
}

- (void)setReceivingSuspended:(BOOL)a3
{
  self->_receivingSuspended = a3;
}

- (UASharedPasteboardClientController)pasteboardController
{
  return (UASharedPasteboardClientController *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setPasteboardController:(id)a3
{
}

- (UAPingController)pingController
{
  return (UAPingController *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setPingController:(id)a3
{
}

- (OS_dispatch_queue)mainDispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setMainDispatchQ:(id)a3
{
}

- (UADispatchScheduler)nextUserIdleDeterminationScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 216LL, 1);
}

- (UADispatchScheduler)nextUpdateAdvertisedItemsScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 224LL, 1);
}

- (UADispatchScheduler)nextScheduleBestAppDeterminationScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 232LL, 1);
}

- (BOOL)deviceUILocked
{
  return self->_deviceUILocked;
}

- (void)setDeviceUILocked:(BOOL)a3
{
  self->_deviceUILocked = a3;
}

- (UATimedPowerAssertions)deviceUILockedPowerAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setDeviceUILockedPowerAssertion:(id)a3
{
}

- (BOOL)screenDimmed
{
  return self->_screenDimmed;
}

- (void)setScreenDimmed:(BOOL)a3
{
  self->_screenDimmed = a3;
}

- (UATimedPowerAssertions)screenDimmedPowerAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setScreenDimmedPowerAssertion:(id)a3
{
}

- (int)backlightLevelToken
{
  return self->_backlightLevelToken;
}

- (void)setBacklightLevelToken:(int)a3
{
  self->_backlightLevelToken = a3;
}

- (NSDate)holdPowerAssertionUntil
{
  return (NSDate *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setHoldPowerAssertionUntil:(id)a3
{
}

- (OS_dispatch_source)holdPowerAssertionSourceTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setHoldPowerAssertionSourceTimer:(id)a3
{
}

- (unsigned)holdPowerAssertion
{
  return self->_holdPowerAssertion;
}

- (void)setHoldPowerAssertion:(unsigned int)a3
{
  self->_holdPowerAssertion = a3;
}

- (PowerManagerIdleTracker)userIdleTracker
{
  return (PowerManagerIdleTracker *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setUserIdleTracker:(id)a3
{
}

- (UATimedPowerAssertions)userInactivePowerAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setUserInactivePowerAssertion:(id)a3
{
}

- (BOOL)systemIsIdle
{
  return self->_systemIsIdle;
}

- (void)setSystemIsIdle:(BOOL)a3
{
  self->_systemIsIdle = a3;
}

- (NSDate)lastTimePayloadWasRequestedForAdvertisedItem
{
  return (NSDate *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setLastTimePayloadWasRequestedForAdvertisedItem:(id)a3
{
}

- (int)systemPreferenceChangedToken
{
  return self->_systemPreferenceChangedToken;
}

- (void)setSystemPreferenceChangedToken:(int)a3
{
  self->_systemPreferenceChangedToken = a3;
}

- (int)uiLockStatusToken
{
  return self->_uiLockStatusToken;
}

- (void)setUiLockStatusToken:(int)a3
{
  self->_uiLockStatusToken = a3;
}

- (FBSDisplayLayoutMonitor)mirroringMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setMirroringMonitor:(id)a3
{
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (void)setIsMirroringActive:(BOOL)a3
{
  self->_isMirroringActive = a3;
}

- (BOOL)pingMode
{
  return self->_pingMode;
}

- (void)setPingMode:(BOOL)a3
{
  self->_pingMode = a3;
}

- (double)avgPingTime
{
  return self->_avgPingTime;
}

- (void)setAvgPingTime:(double)a3
{
  self->_avgPingTime = a3;
}

- (NSDate)pingStart
{
  return (NSDate *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setPingStart:(id)a3
{
}

- (OS_dispatch_semaphore)pongSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setPongSem:(id)a3
{
}

- (NSTimer)pongTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setPongTimer:(id)a3
{
}

- (UABluetoothStatus)bluetoothStatus
{
  return (UABluetoothStatus *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setBluetoothStatus:(id)a3
{
}

- (NSObject)bluetoothStatusCallbackIdentifier
{
  return objc_getProperty(self, a2, 344LL, 1);
}

- (void)setBluetoothStatusCallbackIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end