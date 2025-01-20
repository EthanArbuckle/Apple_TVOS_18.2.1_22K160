@interface UASharingAdvertiser
- (BOOL)_advertisePayload:(id)a3;
- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5;
- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5 sfAdvertiser:(id)a6;
- (BOOL)_updateAdvertisement;
- (BOOL)active;
- (BOOL)addSFActivityAdvertiser:(id)a3;
- (BOOL)advertiseItem:(id)a3 force:(BOOL)a4;
- (BOOL)advertising;
- (BOOL)okToSuspendAdvertising;
- (BOOL)pasteboardAvailible;
- (BOOL)pasteboardBitValue;
- (BOOL)pboardBitToAdvertise;
- (BOOL)peerDeviceCanAcceptNewerPayload:(id)a3;
- (BOOL)removeSFActivityAdvertiser:(id)a3;
- (BOOL)resume;
- (BOOL)scheduleAdvertisementUpdate;
- (BOOL)scheduleAdvertisementUpdate:(double)a3;
- (BOOL)shouldAdvertiseHandoff;
- (BOOL)shouldAdvertisePasteboard;
- (BOOL)suspend;
- (BOOL)userIsCurrent;
- (NSDate)beginTimeForNonActiveAdvertisement;
- (NSDate)dontAdvertiseAsCurrentUntil;
- (NSDate)lastAdvertismentTime;
- (NSDate)lastUserActiveTime;
- (NSMutableArray)advertisementTimes;
- (NSMutableDictionary)currentAdvertisedItemOtherAdvertisedItems;
- (NSSet)pairedDevices;
- (NSSet)sfActivityAdvertisers;
- (OS_dispatch_group)helpersDispatchGroup;
- (OS_dispatch_queue)dispatchQ;
- (PowerManagerIdleTracker)userIsCurrentIdleTracker;
- (SharingBTLEAdvertisementPayload)currentAdvertisementPayload;
- (SharingBTLEAdvertisementPayload)lastAdvertisementPayload;
- (UADispatchScheduler)nextScheduleUpdate;
- (UADispatchScheduler)periodicUpdate;
- (UASharingAdvertiser)initWithManager:(id)a3 advertiser:(id)a4;
- (UATimedPowerAssertions)preventIdleSleepAssertion;
- (UAUserActivityInfo)currentAdvertisedItem;
- (id)advertisableItems;
- (id)advertisingItems;
- (id)currentAdvertisedBytes;
- (id)dataForMoreAppSuggestions;
- (id)sfActivityAdvertiser;
- (id)statusString;
- (int64_t)lastAdvertisedGeneration;
- (unint64_t)changeAdvertisementThreadSpinCount;
- (void)_periodicIdleUpdate;
- (void)_refreshPairedSFPeerDevices;
- (void)_updatePairedDeviceCapabilities;
- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 command:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7;
- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 handoffCommand:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7;
- (void)activityAdvertiser:(id)a3 didSendPayloadForActivityIdentifier:(id)a4 toDevice:(id)a5 error:(id)a6;
- (void)activityAdvertiser:(id)a3 pairedDevicesChangedNotification:(id)a4;
- (void)advertisePayload:(id)a3 force:(BOOL)a4;
- (void)moveAdvertisementToNonActive;
- (void)removeAdvertisement;
- (void)removeIOPowerManagerUserIdleNotifications;
- (void)scheduleIOPowerManagerUserIdleNotifications;
- (void)setAdvertisableItems:(id)a3;
- (void)setAdvertisementTimes:(id)a3;
- (void)setBeginTimeForNonActiveAdvertisement:(id)a3;
- (void)setChangeAdvertisementThreadSpinCount:(unint64_t)a3;
- (void)setCurrentAdvertisedItem:(id)a3;
- (void)setCurrentAdvertisedItemOtherAdvertisedItems:(id)a3;
- (void)setCurrentAdvertisementPayload:(id)a3;
- (void)setDontAdvertiseAsCurrentUntil:(id)a3;
- (void)setLastAdvertisedGeneration:(int64_t)a3;
- (void)setLastAdvertisementPayload:(id)a3;
- (void)setLastAdvertismentTime:(id)a3;
- (void)setLastUserActiveTime:(id)a3;
- (void)setPairedDevices:(id)a3;
- (void)setPboardBitToAdvertise:(BOOL)a3;
- (void)setPreventIdleSleepAssertion:(id)a3;
- (void)setShouldAdvertiseAutoPullActivityList:(BOOL)a3;
- (void)setUserIsCurrent:(BOOL)a3;
- (void)setUserIsCurrentIdleTracker:(id)a3;
- (void)updateAdvertisingPowerAssertion:(double)a3;
@end

@implementation UASharingAdvertiser

- (UASharingAdvertiser)initWithManager:(id)a3 advertiser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___UASharingAdvertiser;
  v8 = -[UAAdvertiser initWithManager:name:](&v38, "initWithManager:name:", v6, @"SharingAdvertiser");
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("UASharingAdvertiser", 0LL);
    v10 = *(void **)(v8 + 97);
    *(void *)(v8 + 97) = v9;

    dispatch_group_t v11 = dispatch_group_create();
    v12 = *(void **)(v8 + 73);
    *(void *)(v8 + 73) = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v14 = *(void **)(v8 + 57);
    *(void *)(v8 + 57) = v13;

    [v8 addSFActivityAdvertiser:v7];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v16 = *(void **)(v8 + 49);
    *(void *)(v8 + 49) = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [v8 setAdvertisementTimes:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 dispatchQ]);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000622C8;
    v36[3] = &unk_1000BCCA8;
    v19 = v8;
    v37 = v19;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"sharingUpdate",  v18,  v36,  1.84467441e19));
    v21 = *(void **)(v19 + 105);
    *(void *)(v19 + 105) = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 dispatchQ]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000622D0;
    v34[3] = &unk_1000BCCA8;
    v23 = v19;
    v35 = v23;
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"advertisingPeriodic",  v22,  v34,  1.84467441e19));
    v25 = *(void **)(v23 + 113);
    *(void *)(v23 + 113) = v24;

    v23[65] = 1;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v23 manager]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 mainDispatchQ]);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000622D8;
    v32[3] = &unk_1000BCFA8;
    v28 = v23;
    v33 = v28;
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[PowerManagerIdleTracker idleTracker:queue:interval:block:]( &OBJC_CLASS___PowerManagerIdleTracker,  "idleTracker:queue:interval:block:",  @"AdvertiserCurrent",  v27,  v32,  8.0));
    v30 = *(void **)(v28 + 185);
    *(void *)(v28 + 185) = v29;

    v28[66] = 1;
    v28[67] = 1;
  }

  return (UASharingAdvertiser *)v8;
}

- (id)advertisableItems
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [*(id *)(&v2->super._shouldAdvertiseAutoPullActivityList + 1) copy];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)advertising
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)advertisingItems
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)setAdvertisableItems:(id)a3
{
  id v34 = a3;
  os_log_t v3 = sub_100039584(0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v34 description]);
    id v6 = sub_10005BF18(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "setAdvertisableItems:(%{public}@)", buf, 0xCu);
  }

  if (v34)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v34 firstObject]);
    BOOL v9 = v8 == 0LL;

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      if (-[UASharingAdvertiser shouldAdvertisePasteboard](self, "shouldAdvertisePasteboard"))
      {
        dispatch_group_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        unsigned int v12 = [v11 clipboardSharingEnabled];
      }

      else
      {
        unsigned int v12 = 0;
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v17 = v34;
      id v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v18)
      {
        char v19 = 0;
        unsigned __int8 v20 = 0;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
            uint64_t v24 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardActivityInfo);
            if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
            {
              if (v12) {
                [v10 addObject:v23];
              }
            }

            else if (!(v19 & 1 | (([v23 eligibleForHandoff] & 1) == 0)))
            {
              [v10 insertObject:v23 atIndex:0];
              if ((v20 & 1) != 0)
              {
                char v19 = 1;
                unsigned __int8 v20 = 1;
              }

              else
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue([v23 activityType]);
                unsigned __int8 v20 = [v25 isEqual:NSUserActivityTypeBrowsingWeb];

                char v19 = 1;
              }
            }
          }

          id v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }

        while (v18);

        if ((v20 & 1) != 0) {
          goto LABEL_29;
        }
      }

      else
      {
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisableItems](self, "advertisableItems"));
      unsigned __int8 v27 = [v10 isEqual:v26];

      if ((v27 & 1) != 0)
      {
LABEL_37:

        goto LABEL_38;
      }

- (id)currentAdvertisedBytes
{
  v2 = self;
  objc_sync_enter(v2);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](v2, "currentAdvertisementPayload"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](v2, "currentAdvertisementPayload"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
    id v6 = [v5 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  objc_sync_exit(v2);

  return v6;
}

- (void)updateAdvertisingPowerAssertion:(double)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser preventIdleSleepAssertion](v4, "preventIdleSleepAssertion"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser preventIdleSleepAssertion](v4, "preventIdleSleepAssertion"));
    [v6 updateTimeUntilAssertionRelease:a3];
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___UATimedPowerAssertions);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](v4, "currentAdvertisedItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v4, "manager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainDispatchQ]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100062B80;
    v12[3] = &unk_1000BCFA8;
    v12[4] = v4;
    dispatch_group_t v11 = -[UATimedPowerAssertions initWithName:delta:activityUUID:queue:runAtCompletion:]( v7,  "initWithName:delta:activityUUID:queue:runAtCompletion:",  @"BTLEAdvertisement",  v8,  v10,  v12,  a3);
    -[UASharingAdvertiser setPreventIdleSleepAssertion:](v4, "setPreventIdleSleepAssertion:", v11);
  }

  objc_sync_exit(v4);
}

- (void)advertisePayload:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](self, "dispatchQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062C98;
  block[3] = &unk_1000BDFB0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)_advertisePayload:(id)a3
{
  return -[UASharingAdvertiser _advertisePayload:force:name:](self, "_advertisePayload:force:name:", a3, 0LL, 0LL);
}

- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5 sfAdvertiser:(id)a6
{
  id v9 = a3;
  id v10 = (__CFString *)a5;
  id v11 = a6;
  unsigned int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](self, "dispatchQ"));
  dispatch_assert_queue_V2(v12);

  v25[0] = SFActivityAdvertiserOptionVersionKey;
  v25[1] = SFActivityAdvertiserOptionMinorVersionKey;
  v26[0] = &off_1000C4828;
  v26[1] = &off_1000C4828;
  v25[2] = SFActivityAdvertiserOptionFlagCopyPasteKey;
  uint64_t v13 = &__kCFBooleanFalse;
  v25[3] = @"name";
  v14 = @"-";
  if (v10) {
    v14 = v10;
  }
  v26[2] = v13;
  v26[3] = v14;
  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));
  if (v11)
  {
    os_log_t v16 = sub_100039584(0LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 time]);
      int v21 = 138412546;
      id v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "advertising %@, when = %@",  (uint8_t *)&v21,  0x16u);
    }

    if (v9) {
      char v19 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisementPayload]);
    }
    else {
      char v19 = 0LL;
    }
    [v11 advertiseAdvertisementPayload:v19 options:v15];
    if (v9) {
  }
    }

  return v11 != 0LL;
}

- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5
{
  BOOL v6 = a4;
  id v8 = (__CFString *)a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](self, "dispatchQ"));
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    if (v6
      || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString advertisementPayload](v8, "advertisementPayload")),
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload")),
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 advertisementPayload]),
          unsigned __int8 v14 = [v11 isEqual:v13],
          v13,
          v12,
          v11,
          (v14 & 1) == 0))
    {
      os_log_t v19 = sub_100039584(0LL);
      unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
        id v22 = (void *)v21;
        __int16 v23 = &stru_1000BE738;
        *(_DWORD *)buf = 138544130;
        v54 = v8;
        if (v6) {
          __int16 v23 = @" FORCE";
        }
        __int16 v55 = 2114;
        uint64_t v56 = v21;
        __int16 v57 = 2114;
        v58 = v23;
        __int16 v59 = 2112;
        id v60 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "ADVERTISING: %{public}@ (old=%{public}@)%{public}@ %@",  buf,  0x2Au);
      }

      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v37 minimumTimeForAnAdvertisementToLive];
      -[UASharingAdvertiser updateAdvertisingPowerAssertion:](self, "updateAdvertisingPowerAssertion:");

      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertisers](self, "sfActivityAdvertisers"));
      id v38 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
      id v39 = v38;
      if (v38)
      {
        uint64_t v40 = *(void *)v48;
        do
        {
          v41 = 0LL;
          do
          {
            if (*(void *)v48 != v40) {
              objc_enumerationMutation(v18);
            }
            -[UASharingAdvertiser _advertisePayload:force:name:sfAdvertiser:]( self,  "_advertisePayload:force:name:sfAdvertiser:",  v8,  v6,  v9,  *(void *)(*((void *)&v47 + 1) + 8LL * (void)v41));
            v41 = (char *)v41 + 1;
          }

          while (v39 != v41);
          id v39 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }

        while (v39);
      }

      -[UASharingAdvertiser setCurrentAdvertisementPayload:](self, "setCurrentAdvertisementPayload:", v8);
      os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[UASharingAdvertiser setLastAdvertismentTime:](self, "setLastAdvertismentTime:", v16);
      LOBYTE(v18) = 1;
    }

    else
    {
      os_log_t v15 = sub_100039584(0LL);
      os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
        *(_DWORD *)buf = 138543618;
        v54 = v8;
        __int16 v55 = 2114;
        uint64_t v56 = (uint64_t)v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "ADVERTISING: Matched current advertisement, so not updating(%{public}@ vs %{public}@)",  buf,  0x16u);
      }

      LOBYTE(v18) = 0;
    }

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString validUntil](v8, "validUntil"));
    [v36 timeIntervalSinceNow];
    -[UASharingAdvertiser scheduleAdvertisementUpdate:](self, "scheduleAdvertisementUpdate:");
LABEL_39:

    goto LABEL_40;
  }

  if (v6
    || (id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload")),
        v18,
        v18))
  {
    os_log_t v24 = sub_100039584(0LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = &stru_1000BE738;
      if (v6) {
        v26 = @"FORCE";
      }
      *(_DWORD *)buf = 138543362;
      v54 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "ADVERTISING: Changing advertisement to nil because it's been removed, %{public}@",  buf,  0xCu);
    }

    unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
    if (v27) {

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
    BOOL v29 = v28 == 0LL;

    if (!v29)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v30 minimumTimeToLiveAfterRemovingAdvertisement];
      -[UASharingAdvertiser updateAdvertisingPowerAssertion:](self, "updateAdvertisingPowerAssertion:");
    }

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertisers](self, "sfActivityAdvertisers", 0LL));
    id v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v31);
          }
          -[UASharingAdvertiser _advertisePayload:force:name:sfAdvertiser:]( self,  "_advertisePayload:force:name:sfAdvertiser:",  0LL,  1LL,  0LL,  *(void *)(*((void *)&v43 + 1) + 8LL * (void)i));
        }

        id v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }

      while (v32);
    }

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
    -[UASharingAdvertiser setLastAdvertisementPayload:](self, "setLastAdvertisementPayload:", v35);

    -[UASharingAdvertiser setCurrentAdvertisementPayload:](self, "setCurrentAdvertisementPayload:", 0LL);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[UASharingAdvertiser setLastAdvertismentTime:](self, "setLastAdvertismentTime:", v36);
    LOBYTE(v18) = 1;
    goto LABEL_39;
  }

- (BOOL)advertiseItem:(id)a3 force:(BOOL)a4
{
  v170 = (UAUserActivityInfo *)a3;
  v166 = self;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](self, "dispatchQ"));
  dispatch_assert_queue_V2(v5);

  v169 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v7 = [v6 multiHandoffEnabled];
  if (v170) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = v7;
  }
  int v164 = v8;
  if (v8 == 1)
  {
    unsigned int v9 = -[UAAdvertiser shouldAdvertiseAutoPullActivityList](v166, "shouldAdvertiseAutoPullActivityList");

    if (!v9) {
      goto LABEL_123;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v166, "manager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 advertiseableItems]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);

    os_log_t v13 = sub_100039584(0LL);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v176 = *(double *)&v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "itemToAdvertise is nil but we need to advertise an auto pull request, so choosing item %@ out of corner manager' s possible advertiseable items to advertise",  buf,  0xCu);
    }

    if (v12)
    {
      v170 =  -[UAUserActivityInfo initWithUserActivityInfo:]( objc_alloc(&OBJC_CLASS___UAUserActivityInfo),  "initWithUserActivityInfo:",  v12);
    }

    else
    {
      v170 = 0LL;
    }
  }

  else
  {
  }

  if (v170)
  {
    -[UASharingAdvertiser scheduleIOPowerManagerUserIdleNotifications]( v166,  "scheduleIOPowerManagerUserIdleNotifications");
    unsigned int v15 = -[UASharingAdvertiser userIsCurrent](v166, "userIsCurrent");
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo options](v170, "options"));
    unsigned int v160 = v15;
    id v168 = [v16 mutableCopy];

    if (!v168) {
      id v168 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    if (-[UASharingAdvertiser shouldAdvertisePasteboard](v166, "shouldAdvertisePasteboard"))
    {
      if (-[UASharingAdvertiser pasteboardAvailible](v166, "pasteboardAvailible"))
      {
        [v168 setObject:&__kCFBooleanTrue forKey:@"UAPasteboardAvailable"];
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[UASharingAdvertiser pasteboardBitValue](v166, "pasteboardBitValue")));
        [v168 setObject:v17 forKey:@"UAPasteboardVersionBit"];
      }

      else
      {
        [v168 removeObjectForKey:@"UAPasteboardAvailable"];
        [v168 removeObjectForKey:@"UAPasteboardVersionBit"];
      }
    }

    __int128 v173 = 0u;
    __int128 v174 = 0u;
    __int128 v171 = 0u;
    __int128 v172 = 0u;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v166, "manager"));
    os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 advertiseableItems]);
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);

    id v21 = [v20 countByEnumeratingWithState:&v171 objects:v187 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v172;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v172 != v22) {
            objc_enumerationMutation(v20);
          }
          os_log_t v24 = *(void **)(*((void *)&v171 + 1) + 8LL * (void)i);
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___UAUserActivityAdvertisableItem);
          if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v24 uuid]);
            unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](v170, "uuid"));
            if ([v26 isEqual:v27])
            {
            }

            else
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue([v24 when]);
              -[__CFString timeIntervalSinceDate:](v169, "timeIntervalSinceDate:", v28);
              BOOL v30 = v29 < 600.0;

              if (v30) {
                [v168 setObject:&__kCFBooleanTrue forKey:@"UAUserActivityAdvertiserHasMoreActivities"];
              }
            }
          }
        }

        id v21 = [v20 countByEnumeratingWithState:&v171 objects:v187 count:16];
      }

      while (v21);
    }

    os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( v166,  "beginTimeForNonActiveAdvertisement"));
    if (v31) {
      int v32 = 1;
    }
    else {
      int v32 = v164;
    }

    if (v32)
    {
      os_log_t v33 = sub_100039584(0LL);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v176 = *(double *)&v170;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "setting UAUserActivityItemIsNotActiveKey = 1 for item %@",  buf,  0xCu);
      }

      __int128 v35 = &__kCFBooleanTrue;
    }

    else
    {
      os_log_t v36 = sub_100039584(0LL);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v176 = *(double *)&v170;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "setting UAUserActivityItemIsNotActiveKey = 0 for item %@",  buf,  0xCu);
      }

      __int128 v35 = &__kCFBooleanFalse;
    }

    [v168 setObject:v35 forKey:@"UAUserActivityItemIsNotActiveKey"];
    uint64_t v37 = v160;
    if (-[UAAdvertiser shouldAdvertiseAutoPullActivityList](v166, "shouldAdvertiseAutoPullActivityList"))
    {
      os_log_t v38 = sub_100039584(0LL);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v176 = *(double *)&v170;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "setting UAUserActivityAutoPullActivitiesListKey = 1 for item %@",  buf,  0xCu);
      }

      [v168 setObject:&__kCFBooleanTrue forKey:UAUserActivityAutoPullActivitiesListKey];
      uint64_t v37 = v160;
    }

    -[UAUserActivityInfo setOptions:](v170, "setOptions:", v168);
    uint64_t v40 = objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload);
    if ((v37 & 1) != 0) {
      v41 = 0LL;
    }
    else {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastUserActiveTime](v166, "lastUserActiveTime"));
    }
    v165 = -[SharingBTLEAdvertisementPayload initWithItem:isCurrent:when:versionFlags:]( v40,  "initWithItem:isCurrent:when:versionFlags:",  v170,  v37,  v41,  5LL);
    if ((v37 & 1) == 0) {

    }
    if (a4) {
      goto LABEL_60;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](v166, "currentAdvertisedItem"));
    if (!v42) {
      goto LABEL_60;
    }
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](v166, "currentAdvertisedItem"));
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 uuid]);
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](v170, "uuid"));
    if ([v44 isEqual:v45])
    {
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](v166, "currentAdvertisementPayload"));
      if (v46)
      {
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](v166, "currentAdvertisementPayload"));
        if (-[SharingBTLEAdvertisementPayload isEqual:](v165, "isEqual:", v47))
        {
          unsigned int v48 = -[SharingBTLEAdvertisementPayload isCurrent](v165, "isCurrent");
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](v166, "currentAdvertisementPayload"));
          unsigned int v50 = [v49 isCurrent];

          if (((v48 ^ v50) & 1) == 0) {
            goto LABEL_122;
          }
LABEL_60:
          os_log_t v51 = sub_100039584(0LL);
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](v170, "uuid"));
            v54 = (void *)objc_claimAutoreleasedReturnValue([v53 UUIDString]);
            __int16 v55 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo logString](v170, "logString"));
            *(_DWORD *)buf = 138543619;
            double v176 = *(double *)&v54;
            __int16 v177 = 2113;
            v178 = v55;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "ADVERTISING: Advertising new item or updating user-idle time in previous advertisement, %{public}@/%{private}@",  buf,  0x16u);
          }

          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload advertisementPayload](v165, "advertisementPayload"));
          id v57 = sub_1000034D8(v56);
          v162 = (void *)objc_claimAutoreleasedReturnValue(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo activityType](v170, "activityType"));
          __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v170, "dynamicActivityType"));
          if (v59) {
            id v60 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v170, "dynamicActivityType"));
          }
          else {
            id v60 = &stru_1000BE738;
          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](v170, "uuid"));
          v62 = (void *)objc_claimAutoreleasedReturnValue([v61 UUIDString]);
          v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ADVERTISING:%@ %@ %@/ %@",  v162,  v58,  v60,  v62));
          +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v63);

          if (v59) {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](v166, "lastAdvertismentTime"));
          }
          if (v64)
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](v166, "lastAdvertismentTime"));
            [v65 timeIntervalSinceNow];
            BOOL v67 = v66 > 0.0;

            if (v67)
            {
              -[UASharingAdvertiser setLastAdvertismentTime:](v166, "setLastAdvertismentTime:", 0LL);
              os_log_t v68 = sub_100039584(0LL);
              v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "lastAdvertismentTime is in the future, this is wrong and is probably because the system clock has changed",  buf,  2u);
              }
            }
          }

          v70 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](v166, "lastAdvertismentTime"));
          if (v70)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            [v71 minimumIntervalBetweenAdvertisements];
            BOOL v73 = v72 > 0.0;

            if (v73)
            {
              v74 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](v166, "lastAdvertismentTime"));
              -[__CFString timeIntervalSinceDate:](v169, "timeIntervalSinceDate:", v74);
              double v76 = v75;

              if (v76 < 0.0)
              {
                os_log_t v77 = sub_100039584(0LL);
                v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  v79 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](v166, "lastAdvertismentTime"));
                  *(_DWORD *)buf = 138543618;
                  double v176 = *(double *)&v169;
                  __int16 v177 = 2114;
                  v178 = v79;
                  _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "ADVERTISING: Time since last advertisement seems to have gone backwards, now=%{public}@ last=%{public}@",  buf,  0x16u);
                }

                double v76 = 0.0;
              }

              v80 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
              [v80 minimumIntervalBetweenAdvertisements];
              BOOL v82 = v76 < v81;

              if (v82)
              {
                if (!-[UAUserActivityInfo eligibleToAlwaysAdvertise](v170, "eligibleToAlwaysAdvertise"))
                {
                  os_log_t v154 = sub_100039584(0LL);
                  v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
                  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
                  {
                    v156 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](v166, "lastAdvertismentTime"));
                    *(_DWORD *)buf = 134218498;
                    double v176 = v76;
                    __int16 v177 = 2114;
                    v178 = v169;
                    __int16 v179 = 2114;
                    v180 = v156;
                    _os_log_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_DEFAULT,  "ADVERTISING: Setting supressAdvertisementChange = YES because the client attempted to change adver tisement too quickly, %f since lastAdvertisementTime (now=%{public}@ last=%{public}@)",  buf,  0x20u);
                  }

                  v85 = (__CFString *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
                  -[__CFString minimumIntervalBetweenAdvertisements](v85, "minimumIntervalBetweenAdvertisements");
                  -[UASharingAdvertiser scheduleAdvertisementUpdate:](v166, "scheduleAdvertisementUpdate:", v157 - v76);
                  goto LABEL_119;
                }

                os_log_t v83 = sub_100039584(0LL);
                v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
                if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_INFO,  "ADVERTISING: Allowing application to change advertisement even though the interval is too short beca use .eligibleToAlwaysAdvertise = YES",  buf,  2u);
                }
              }
            }
          }

          v85 = (__CFString *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          -[__CFString maximumAdvertisementsTimeInterval](v85, "maximumAdvertisementsTimeInterval");
          if (v86 <= 0.0) {
            goto LABEL_95;
          }
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
          BOOL v88 = [v87 count] == 0;

          if (v88) {
            goto LABEL_96;
          }
          v89 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          [v89 maximumAdvertisementsTimeInterval];
          v85 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v169,  -v90));

          os_log_t v91 = sub_100039584(0LL);
          v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            v93 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            id v94 = [v93 count];
            v95 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            v96 = (void *)objc_claimAutoreleasedReturnValue([v95 description]);
            id v97 = sub_10005BF18(v96);
            v98 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v97);
            *(_DWORD *)buf = 134218242;
            double v176 = *(double *)&v94;
            __int16 v177 = 2114;
            v178 = v98;
            _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEBUG,  "ADVERTISING: self.advertisementTimes=%ld %{public}@",  buf,  0x16u);
          }

          while (1)
          {
            v99 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            if (![v99 count]) {
              break;
            }
            v100 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            v101 = (void *)objc_claimAutoreleasedReturnValue([v100 firstObject]);
            BOOL v102 = -[__CFString compare:](v85, "compare:", v101) == (id)-1LL;

            if (v102) {
              goto LABEL_94;
            }
            os_log_t v103 = sub_100039584(0LL);
            v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
            {
              v105 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
              v106 = (void *)objc_claimAutoreleasedReturnValue([v105 objectAtIndex:0]);
              *(_DWORD *)buf = 138543618;
              double v176 = *(double *)&v106;
              __int16 v177 = 2114;
              v178 = v85;
              _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEBUG,  "ADVERTISING: Removing first item, %{public}@, becaues it is earlier than %{public}@",  buf,  0x16u);
            }

            v107 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            [v107 removeObjectAtIndex:0];
          }

LABEL_94:
          v108 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
          id v109 = [v108 count];
          v110 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          BOOL v111 = v109 < [v110 maximumAdvertisementsPerTimeInterval];

          if (v111)
          {
LABEL_95:

LABEL_96:
            -[UASharingAdvertiser setCurrentAdvertisedItem:](v166, "setCurrentAdvertisedItem:", v170);
            -[UASharingAdvertiser setLastAdvertismentTime:](v166, "setLastAdvertismentTime:", v169);
            v112 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo provenance](v170, "provenance"));
            -[UASharingAdvertiser _advertisePayload:force:name:](v166, "_advertisePayload:force:name:", v165, 0LL, v112);

            v113 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            [v113 addObject:v169];

            v114 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo activityType](v170, "activityType"));
            unsigned int v115 = [v114 isEqual:NSUserActivityTypeBrowsingWeb];

            if (v115)
            {
              v116 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
              [v116 advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities];
              double v118 = v117;

              if (v118 > 0.0)
              {
                v119 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  v118));
                os_log_t v120 = sub_100039584(0LL);
                v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
                if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  double v176 = *(double *)&v165;
                  __int16 v177 = 2114;
                  v178 = v119;
                  _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEBUG,  "OLDWEB: Adding item %{private}@, date=%{public}@",  buf,  0x16u);
                }

                v122 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( v166,  "currentAdvertisedItemOtherAdvertisedItems"));
                BOOL v123 = v122 == 0LL;

                if (v123)
                {
                  v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                  -[UASharingAdvertiser setCurrentAdvertisedItemOtherAdvertisedItems:]( v166,  "setCurrentAdvertisedItemOtherAdvertisedItems:",  v124);
                }

                v125 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( v166,  "currentAdvertisedItemOtherAdvertisedItems"));
                [v125 setObject:v119 forKey:v165];

                v126 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](v166, "periodicUpdate"));
                [v126 scheduleAt:v119];
              }
            }

            v127 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](v166, "nextScheduleUpdate"));
            [v127 scheduleNext:248.0];

            os_log_t v128 = sub_100039584(0LL);
            v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              v130 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](v170, "uuid"));
              v167 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v130 UUIDString]);
              v163 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo activityType](v170, "activityType"));
              v131 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v170, "dynamicActivityType"));
              if (v131)
              {
                v58 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v170, "dynamicActivityType"));
                v132 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @":%@",  v58));
              }

              else
              {
                v132 = &stru_1000BE738;
              }

              id v133 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              v134 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo options](v170, "options"));
              v135 = (void *)objc_claimAutoreleasedReturnValue([v134 description]);
              v136 = v130;
              id v137 = sub_10005BF18(v135);
              id v138 = (id)objc_claimAutoreleasedReturnValue(v137);
              *(_DWORD *)buf = 138544643;
              double v176 = *(double *)&v165;
              __int16 v177 = 2114;
              v178 = v167;
              __int16 v179 = 2113;
              v180 = v163;
              __int16 v181 = 2113;
              v182 = v132;
              __int16 v183 = 2114;
              id v184 = v133;
              __int16 v185 = 2114;
              id v186 = v138;
              _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "ADVERTISING:%{public}@ %{public}@ type=%{private}@%{private}@ at %{public}@ opts=%{public}@",  buf,  0x3Eu);

              if (v131)
              {
              }
            }

- (BOOL)_updateAdvertisement
{
  os_log_t v3 = sub_100039584(0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_updateAdvertisement, entering.", buf, 2u);
  }

  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](self, "dispatchQ"));
  dispatch_assert_queue_V2(v5);

  dispatch_group_enter(*(dispatch_group_t *)&self->_shouldAdvertiseHandoff);
  -[UASharingAdvertiser setChangeAdvertisementThreadSpinCount:]( self,  "setChangeAdvertisementThreadSpinCount:",  (char *)-[UASharingAdvertiser changeAdvertisementThreadSpinCount](self, "changeAdvertisementThreadSpinCount") + 1);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  if ([v6 isBluetoothEnabled])
  {
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    unsigned __int8 v8 = [v7 shouldIgnoreBluetoothDisabled];

    if ((v8 & 1) == 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
      BOOL v19 = v18 == 0LL;

      os_log_t v20 = sub_100039584(0LL);
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v21 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (!v19)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Removing .currentAdvertisedItem because Bluetooth is not enabled.",  buf,  2u);
        }

        goto LABEL_32;
      }

      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "UPDATEADVERTISEMENT: called while bluetooth is disabled",  buf,  2u);
      }

      goto LABEL_28;
    }
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned int v10 = [v9 isBatterySaverModeEnabled];

  if (v10)
  {
    os_log_t v11 = sub_100039584(0LL);
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Not advertising because this device is in batterSaverModeEnabled == YES",  buf,  2u);
    }

- (void)moveAdvertisementToNonActive
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[UASharingAdvertiser setBeginTimeForNonActiveAdvertisement:](self, "setBeginTimeForNonActiveAdvertisement:");

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v4 lastActiveItemRemovalDelay];
  -[UASharingAdvertiser scheduleAdvertisementUpdate:](self, "scheduleAdvertisementUpdate:");
}

- (void)setBeginTimeForNonActiveAdvertisement:(id)a3
{
}

- (void)removeAdvertisement
{
  os_log_t v3 = sub_100039584(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
    *(_DWORD *)buf = 138477827;
    os_log_t v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "removeAdvertisement, currentAdvertisementPayload=%{private}@",  buf,  0xCu);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 advertisementPayload]);
  id v8 = sub_1000034D8(v7);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  unsigned int v13 = -[UACornerActionManagerHandler suspended](self, "suspended");
  BOOL v14 = "";
  if (v13) {
    BOOL v14 = " SUSPENDED";
  }
  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ADVERTISING:- (was %@/%@)%s",  v9,  v12,  v14));
  +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v15);

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
  -[UASharingAdvertiser advertisePayload:force:](self, "advertisePayload:force:", 0LL, v16 != 0);

  -[UASharingAdvertiser setCurrentAdvertisedItem:](self, "setCurrentAdvertisedItem:", 0LL);
  -[UASharingAdvertiser setCurrentAdvertisementPayload:](self, "setCurrentAdvertisementPayload:", 0LL);
  -[UASharingAdvertiser setLastAdvertismentTime:](self, "setLastAdvertismentTime:", 0LL);
  -[UASharingAdvertiser setCurrentAdvertisedItemOtherAdvertisedItems:]( self,  "setCurrentAdvertisedItemOtherAdvertisedItems:",  0LL);
  -[UASharingAdvertiser removeIOPowerManagerUserIdleNotifications](self, "removeIOPowerManagerUserIdleNotifications");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser preventIdleSleepAssertion](self, "preventIdleSleepAssertion"));
  LOBYTE(v16) = v17 == 0LL;

  if ((v16 & 1) == 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser preventIdleSleepAssertion](self, "preventIdleSleepAssertion"));
    [v18 releaseAssertion];

    -[UASharingAdvertiser setPreventIdleSleepAssertion:](self, "setPreventIdleSleepAssertion:", 0LL);
  }

- (void)_periodicIdleUpdate
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
    id v5 = [v4 count];

    if (v5)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);

      id obj = v8;
      id v9 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v9)
      {
        uint64_t v11 = *(void *)v27;
        *(void *)&__int128 v10 = 138478339LL;
        __int128 v24 = v10;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(obj);
            }
            unsigned int v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems",  v24));
            os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

            os_log_t v16 = sub_100039584(0LL);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543875;
              os_log_t v31 = v15;
              __int16 v32 = 2113;
              double v33 = v13;
              __int16 v34 = 2114;
              __int128 v35 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "OLDWEB: Checking expiration of %{public}@ of %{private}@, expireBefore=%{public}@",  buf,  0x20u);
            }

            [v15 timeIntervalSinceReferenceDate];
            double v19 = v18;
            [v6 timeIntervalSinceReferenceDate];
            if (v19 <= v20)
            {
              os_log_t v22 = sub_100039584(0LL);
              unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v24;
                os_log_t v31 = v13;
                __int16 v32 = 2114;
                double v33 = v6;
                __int16 v34 = 2114;
                __int128 v35 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "OLDWEB: Removing (old) NSUserActivityTypeBrowsingWeb item, %{private}@, because it is older than %{pub lic}@ (expired at %{public}@",  buf,  0x20u);
              }

              BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
              [v21 removeObjectForKey:v13];
            }

            else
            {
              BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
              [v21 scheduleAt:v15];
            }
          }

          id v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
        }

        while (v9);
      }
    }
  }

- (BOOL)peerDeviceCanAcceptNewerPayload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  char v26 = 0;
  if (!v3) {
    goto LABEL_13;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 productBuildVersion]);
  if (!v5) {
    goto LABEL_13;
  }
  id v6 = objc_claimAutoreleasedReturnValue([v4 productBuildVersion]);
  if (![v6 UTF8String])
  {

    goto LABEL_13;
  }

  id v7 = objc_claimAutoreleasedReturnValue([v4 productBuildVersion]);
  BOOL v8 = sscanf((const char *)[v7 UTF8String], "%ld%c%ld", &v28, &v26, &v27) == 3;

  if (!v8) {
    goto LABEL_13;
  }
  os_log_t v9 = sub_100039584(0LL);
  __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 productName]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 productVersion]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 productBuildVersion]);
    *(_DWORD *)buf = 138544642;
    BOOL v30 = v11;
    __int16 v31 = 2114;
    __int16 v32 = v12;
    __int16 v33 = 2114;
    __int16 v34 = v13;
    __int16 v35 = 2048;
    uint64_t v36 = v28;
    __int16 v37 = 1024;
    int v38 = v26;
    __int16 v39 = 2048;
    uint64_t v40 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "-- CHECKING %{public}@ version %{public}@, %{public}@ = %ld.%c.%ld",  buf,  0x3Au);
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 productName]);
  unsigned int v15 = [v14 isEqual:@"iPhone OS"];

  if (!v15)
  {
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v4 productName]);
    if (([v21 isEqual:@"macOS"] & 1) == 0)
    {
      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 productName]);
      if (![v22 isEqual:@"Mac OS X"])
      {
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v4 productName]);
        unsigned __int8 v25 = [v24 isEqual:@"OS X"];

        if ((v25 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }

LABEL_19:
    if (v28 > 15) {
      goto LABEL_13;
    }
    if (v28 != 15)
    {
LABEL_29:
      BOOL v19 = 0;
      goto LABEL_14;
    }

    BOOL v16 = v26 == 65;
    if (v26 <= 65)
    {
      uint64_t v17 = v27;
      uint64_t v18 = 39LL;
      goto LABEL_23;
    }

- (NSSet)sfActivityAdvertisers
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [*(id *)((char *)&v2->_advertisableItems + 1) copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)addSFActivityAdvertiser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    unsigned __int8 v6 = [*(id *)((char *)&v5->_advertisableItems + 1) containsObject:v4];
    if ((v6 & 1) == 0)
    {
      [*(id *)((char *)&v5->_advertisableItems + 1) addObject:v4];
      [v4 setDelegate:v5];
    }

    char v7 = v6 ^ 1;
    objc_sync_exit(v5);
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)removeSFActivityAdvertiser:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [*(id *)((char *)&v5->_advertisableItems + 1) containsObject:v4];
  if (v6)
  {
    [v4 setDelegate:0];
    [*(id *)((char *)&v5->_advertisableItems + 1) removeObject:v4];
  }

  objc_sync_exit(v5);

  return v6;
}

- (id)sfActivityAdvertiser
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertisers](self, "sfActivityAdvertisers", 0LL));
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
        unsigned int v6 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (objc_opt_class(&OBJC_CLASS___SFActivityAdvertiser))
        {
          uint64_t v7 = objc_opt_class(&OBJC_CLASS___SFActivityAdvertiser);
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

- (BOOL)shouldAdvertiseHandoff
{
  v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->_sfAdvertisers))
  {
    BYTE1(v2->_sfAdvertisers) = 0;
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](v2, "dispatchQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100066A68;
    block[3] = &unk_1000BCCA8;
    block[4] = v2;
    dispatch_async(v3, block);
  }

  char v4 = BYTE2(v2->_sfAdvertisers);
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)shouldAdvertisePasteboard
{
  v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->_sfAdvertisers))
  {
    BYTE1(v2->_sfAdvertisers) = 0;
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](v2, "dispatchQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100066B30;
    block[3] = &unk_1000BCCA8;
    block[4] = v2;
    dispatch_async(v3, block);
  }

  char v4 = BYTE3(v2->_sfAdvertisers);
  objc_sync_exit(v2);

  return v4;
}

- (void)_refreshPairedSFPeerDevices
{
  v2 = self;
  objc_sync_enter(v2);
  BYTE1(v2->_sfAdvertisers) = 0;
  objc_sync_exit(v2);
  __int128 v10 = v2;

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v3 = dispatch_group_create();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertisers](v2, "sfActivityAdvertisers"));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "fetchSFPeerDevicesWithCompletionHandler:") & 1) != 0)
        {
          dispatch_group_enter(v3);
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472LL;
          v12[2] = sub_100066D98;
          v12[3] = &unk_1000BDFD8;
          id v13 = v11;
          BOOL v14 = v3;
          [v8 fetchSFPeerDevicesWithCompletionHandler:v12];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  __int128 v9 = v10;
  objc_sync_enter(v9);
  -[UASharingAdvertiser setPairedDevices:](v9, "setPairedDevices:", v11);
  objc_sync_exit(v9);
}

- (void)_updatePairedDeviceCapabilities
{
  uint64_t v27 = self;
  objc_sync_enter(v27);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = *(id *)((char *)&v27->_helpersDispatchGroup + 1);
  int v2 = 0;
  int v3 = 0;
  id v4 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v6);
        if ((v3 & 1) != 0
          || ([*(id *)(*((void *)&v28 + 1) + 8 * (void)v6) isDefaultPairedDevice] & 1) != 0
          || sub_100067280(v7, @"macOS", 0x14u)
          || sub_100067280(v7, @"Mac OS X", 0xEu))
        {
          BOOL v8 = 1;
          if ((v2 & 1) != 0) {
            goto LABEL_13;
          }
        }

        else
        {
          BOOL v8 = sub_100067280(v7, @"iPhone OS", 0xCu);
          if ((v2 & 1) != 0) {
            goto LABEL_13;
          }
        }

        if (sub_100067280(v7, @"macOS", 0x14u) || sub_100067280(v7, @"Mac OS X", 0x10u))
        {
LABEL_13:
          BOOL v9 = 1;
          goto LABEL_14;
        }

        BOOL v9 = sub_100067280(v7, @"iPhone OS", 0xEu);
LABEL_14:
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c%c%c",  120LL,  114LL,  79LL,  83LL));
        BOOL v11 = sub_100067280(v7, @"visionOS", 0x14u) || sub_100067280(v7, v10, 0x14u);
        os_log_t v12 = sub_100039584(0LL);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        int v3 = v8 || v11;
        int v2 = v9 || v11;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          BOOL v14 = (const char *)[*(id *)((char *)&v27->_helpersDispatchGroup + 1) count];
          id v15 = sub_10006734C(*(void **)((char *)&v27->_helpersDispatchGroup + 1));
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
          __int128 v17 = (void *)v16;
          *(_DWORD *)buf = 134218754;
          __int128 v18 = "NO";
          if (v3) {
            BOOL v19 = "YES";
          }
          else {
            BOOL v19 = "NO";
          }
          __int16 v33 = v14;
          if (v2) {
            __int128 v18 = "YES";
          }
          __int16 v34 = 2114;
          uint64_t v35 = v16;
          __int16 v36 = 2082;
          __int16 v37 = v19;
          __int16 v38 = 2082;
          __int16 v39 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "PEERS: %ld/%{public}@, advertiseHandoff=%{public}s pastboard=%{public}s",  buf,  0x2Au);
        }

        if ((v3 & v2 & 1) != 0)
        {
          int v2 = 1;
          int v3 = 1;
          goto LABEL_33;
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v20 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      id v4 = v20;
    }

    while (v20);
  }

- (NSSet)pairedDevices
{
  int v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->_sfAdvertisers)) {
    -[UASharingAdvertiser _refreshPairedSFPeerDevices](v2, "_refreshPairedSFPeerDevices");
  }
  id v3 = [*(id *)((char *)&v2->_helpersDispatchGroup + 1) copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setPairedDevices:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v4 count];
    id v8 = sub_10006734C(v4);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 134218243;
    id v15 = v7;
    __int16 v16 = 2113;
    __int128 v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Setting pairedDevices=%ld/%{private}@",  buf,  0x16u);
  }

  __int128 v10 = self;
  objc_sync_enter(v10);
  BYTE1(v10->_sfAdvertisers) = 0;
  if (!v4
    || ([v4 isEqual:*(OS_dispatch_group **)((char *)&v10->_helpersDispatchGroup + 1)] & 1) == 0)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"PAIRED_DEVICES:Changed, now have %ld devices paired.",  [v4 count]));
    +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v11);

    if (v4) {
      id v12 = [v4 copy];
    }
    else {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    id v13 = v12;
    objc_storeStrong((id *)((char *)&v10->_helpersDispatchGroup + 1), v12);

    -[UASharingAdvertiser _updatePairedDeviceCapabilities](v10, "_updatePairedDeviceCapabilities");
  }

  objc_sync_exit(v10);
}

- (void)setShouldAdvertiseAutoPullActivityList:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v6 = [v5 multiHandoffEnabled];

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___UASharingAdvertiser;
    -[UAAdvertiser setShouldAdvertiseAutoPullActivityList:](&v8, "setShouldAdvertiseAutoPullActivityList:", v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    [v7 scheduleUpdatingAdvertisableItems];
  }

- (id)dataForMoreAppSuggestions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 advertiseableItems]);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if (-[UASharingAdvertiser userIsCurrent](self, "userIsCurrent"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser beginTimeForNonActiveAdvertisement](self, "beginTimeForNonActiveAdvertisement"));
    if (v7)
    {
    }

    else
    {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));

      if (v36)
      {
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v37 = v5;
        id v38 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v52;
          while (2)
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v52 != v39) {
                objc_enumerationMutation(v37);
              }
              v41 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
              BOOL v42 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
              unsigned int v43 = [v42 isEqual:v41];

              if (v43)
              {
                BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                [v41 setWhen:v44];

                goto LABEL_4;
              }
            }

            id v38 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }
      }
    }
  }

- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 command:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7
{
  id v74 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  id v15 = a7;
  os_log_t v16 = sub_100039584(0LL);
  unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    *(_DWORD *)buf = 138543875;
    id v79 = v12;
    __int16 v80 = 2114;
    double v81 = v13;
    __int16 v82 = 2113;
    os_log_t v83 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "[Sharing Advertiser] Payload request for ad: %{public}@, command: %{public}@, from: %{private}@",  buf,  0x20u);
  }

  BOOL v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", "pbpaste!", 8LL));
  if (!v13)
  {
    else {
      id v13 = 0LL;
    }
  }

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", "pbtypes!", 8LL));
  double v20 = v19;
  if (!v13)
  {
    else {
      id v13 = 0LL;
    }
  }

  id v21 = sub_1000034D8(v12);
  os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v14 uniqueID]);
  __int128 v24 = (void *)v23;
  unsigned __int8 v25 = @"-";
  if (v13) {
    unsigned __int8 v25 = v13;
  }
  char v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PAYLOAD_REQUESTED:%@, %@ from %@",  v22,  v25,  v23));
  +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v26);

  if (v13 && !-[__CFString isEqual:](v13, "isEqual:", @"HANDOFF"))
  {
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", @"handoff-more_items"))
    {
      os_log_t v27 = sub_100039584(0LL);
      os_log_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "activityPayloadForAdvertisementPayload: got handoff-more_items command",  buf,  2u);
      }

      id v29 = (id)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dataForMoreAppSuggestions](self, "dataForMoreAppSuggestions"));
      os_log_t v30 = sub_100039584(0LL);
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 description]);
        unsigned __int8 v33 = (__CFString *)[v29 length];
        *(_DWORD *)buf = 138412546;
        id v79 = v32;
        __int16 v80 = 2048;
        double v81 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "payload: %@ (%lu bytes long)", buf, 0x16u);
      }

      (*((void (**)(id, void, id, void))v15 + 2))(v15, 0LL, v29, 0LL);
      -[UASharingAdvertiser setShouldAdvertiseAutoPullActivityList:]( self,  "setShouldAdvertiseAutoPullActivityList:",  0LL);
      goto LABEL_44;
    }

    if (-[__CFString isEqualToString:](v13, "isEqualToString:", @"pbpaste"))
    {
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      unsigned int v35 = [v34 clipboardSharingEnabled];

      if (v35)
      {
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 pasteboardController]);
        BOOL v38 = v37 == 0LL;

        if (v38) {
          goto LABEL_45;
        }
        os_log_t v39 = sub_100039584(@"pasteboard-server");
        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
          BOOL v42 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 name]);
          *(_DWORD *)buf = 138543619;
          id v79 = v41;
          __int16 v80 = 2113;
          double v81 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[PBOARD] Paste Requested from remote %{public}@/%{private}@",  buf,  0x16u);
        }

        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v43 pasteboardController]);
        v70 = (void *)objc_claimAutoreleasedReturnValue([v44 uuid]);

        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 pasteboardController]);
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_100068BB0;
        v77[3] = &unk_1000BE020;
        __int128 v47 = v77;
        v77[5] = v15;
        id v29 = v70;
        v77[4] = v29;
        [v46 startServiceForPasteVersion:1 handler:v77];
        goto LABEL_40;
      }

- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 handoffCommand:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7
{
  id v199 = a3;
  v203 = (SharingBTLEAdvertisementPayload *)a4;
  v200 = (__CFString *)a5;
  id v201 = a6;
  id v202 = a7;
  os_log_t v12 = sub_100039584(0LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (v200) {
      id v14 = v200;
    }
    else {
      id v14 = @"-";
    }
    id v15 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v201 name]);
    double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v201 productVersion]));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v201 productBuildVersion]);
    *(_DWORD *)buf = 138544387;
    v217 = v203;
    __int16 v218 = 2114;
    v219 = v14;
    __int16 v220 = 2113;
    v221 = v15;
    __int16 v222 = 2114;
    double v223 = v16;
    __int16 v224 = 2114;
    id v225 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Advertising: advertiserData=%{public}@ command=%{public}@ peer=%{private}@ %{public}@/%{public}@",  buf,  0x34u);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned int v19 = [v18 activityAdvertisingAllowed];

  if (v19)
  {
    double v20 = sub_10005C3D4();
    id v21 = -[SharingBTLEAdvertisementPayload initWithAdvertisedBytes:]( objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload),  "initWithAdvertisedBytes:",  v203);
    __int128 v214 = 0u;
    __int128 v215 = 0u;
    __int128 v212 = 0u;
    __int128 v213 = 0u;
    os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 advertiseableItems]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);

    id v25 = [v24 countByEnumeratingWithState:&v212 objects:v229 count:16];
    if (!v25)
    {
      v204 = 0LL;
      goto LABEL_27;
    }

    v204 = 0LL;
    uint64_t v26 = *(void *)v213;
LABEL_9:
    uint64_t v27 = 0LL;
    while (1)
    {
      if (*(void *)v213 != v26) {
        objc_enumerationMutation(v24);
      }
      os_log_t v28 = *(void **)(*((void *)&v212 + 1) + 8 * v27);
      if (-[SharingBTLEAdvertisementPayload matchesItem:](v21, "matchesItem:", v28)) {
        break;
      }
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 activityType]);
      unsigned int v30 = [v29 isEqual:NSUserActivityTypeBrowsingWeb];

      if (v30)
      {
        __int128 v31 = v28;

        v204 = v31;
      }

      if (v25 == (id)++v27)
      {
        id v25 = [v24 countByEnumeratingWithState:&v212 objects:v229 count:16];
        if (v25) {
          goto LABEL_9;
        }
LABEL_27:

LABEL_28:
        os_log_t v41 = sub_100039584(0LL);
        BOOL v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v217 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "-- the advertisingPayload requested %{public}@ does not match any advertiseable item",  buf,  0xCu);
        }

        if (v204)
        {
          unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          os_log_t v44 = sub_100039584(0LL);
          __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
            __int128 v47 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v46 allKeys]);
            *(_DWORD *)buf = 138477827;
            v217 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "OLDWEB: Checking against previous advertised NSUSerActivityTypeBrowsingWeb items, %{private}@",  buf,  0xCu);
          }

          __int128 v210 = 0u;
          __int128 v211 = 0u;
          __int128 v208 = 0u;
          __int128 v209 = 0u;
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
          unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v48 allKeys]);

          id v50 = [v49 countByEnumeratingWithState:&v208 objects:v228 count:16];
          if (v50)
          {
            uint64_t v51 = *(void *)v209;
            while (2)
            {
              for (i = 0LL; i != v50; i = (char *)i + 1)
              {
                if (*(void *)v209 != v51) {
                  objc_enumerationMutation(v49);
                }
                os_log_t v53 = *(void **)(*((void *)&v208 + 1) + 8LL * (void)i);
                __int128 v54 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser currentAdvertisedItemOtherAdvertisedItems]( self,  "currentAdvertisedItemOtherAdvertisedItems"));
                __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKey:v53]);

                if (v55
                  && [v55 compare:v43] == (id)-1
                  && [v53 isEqualHashedPayloadBytes:v21])
                {
                  os_log_t v59 = sub_100039584(0LL);
                  unsigned int v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                  {
                    v197 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([0 activityType]);
                    v61 = (void *)objc_claimAutoreleasedReturnValue([0 uuid]);
                    v62 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v61 UUIDString]);
                    id v63 = sub_1000034D8(v203);
                    os_log_t v64 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue(v63);
                    unsigned int v65 = sub_1000758E0(v55);
                    double v66 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v65));
                    *(_DWORD *)buf = 138478595;
                    v217 = v197;
                    __int16 v218 = 2114;
                    v219 = v62;
                    __int16 v220 = 2114;
                    v221 = v64;
                    __int16 v222 = 2114;
                    double v223 = v66;
                    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "OLDWEB: the current advertised item, %{private}@/%{public}@, is a NSUserActivityTypeBrowsingWeb, a nd a previous advertisement %{public}@ from %{public}@ matches the requested payload.",  buf,  0x2Au);
                  }

                  unsigned int v35 = v204;
                  v204 = v35;
                  goto LABEL_51;
                }
              }

              id v50 = [v49 countByEnumeratingWithState:&v208 objects:v228 count:16];
              if (v50) {
                continue;
              }
              break;
            }
          }
        }

        unsigned int v56 = (SharingBTLEAdvertisementPayload *)_LSCreateHashedBytesForAdvertisingFromString( 3LL,  @"com.apple.fetchsamplepayload");
        if (_LSCompareHashedBytesFromAdvertisingStrings(v56, v203))
        {

          os_log_t v57 = sub_100039584(0LL);
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v217 = v203;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "RESPONDING: Unable to locate a userActivity for the payloadData %{public}@ so returning nil/nil and an err or as the payload for the requesting device.",  buf,  0xCu);
          }

          __int16 v34 = 0LL;
          dispatch_semaphore_t dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -107LL,  0LL));
          (*((void (**)(id, void, void))v202 + 2))(v202, 0LL, 0LL);
          unsigned int v56 = v204;
          v204 = v21;
        }

        else
        {
          double v90 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          if ((uint64_t)[v90 maximumActivityPayloadSizeInBytes] < 1)
          {
            dispatch_semaphore_t dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
          }

          else
          {
            os_log_t v91 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            dispatch_semaphore_t dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithCapacity:]( NSMutableData,  "dataWithCapacity:",  [v91 maximumActivityPayloadSizeInBytes]));
          }

          int v164 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          -[dispatch_semaphore_s increaseLengthBy:]( dsema,  "increaseLengthBy:",  [v164 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes]);

          v165 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          id v166 = [v165 debugValidateSampleResponseMaximumActivityPayloadSizeInBytes];
          v167 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          LODWORD(v166) = (uint64_t)v166 > (uint64_t)[v167 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes];

          if ((_DWORD)v166)
          {
            id v168 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            unsigned int v169 = [v168 debugValidateSampleResponseMaximumActivityPayloadSizeInBytes];
            v170 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            -[dispatch_semaphore_s increaseLengthBy:]( dsema,  "increaseLengthBy:",  arc4random_uniform(v169 - [v170 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes]));
          }

          dispatch_semaphore_t v171 = dsema;
          if (-[dispatch_semaphore_s length](dsema, "length"))
          {
            __int128 v172 = dsema;
            dispatch_semaphore_t v171 = dsema;
            arc4random_buf( -[dispatch_semaphore_s mutableBytes](v172, "mutableBytes"),  (size_t)-[dispatch_semaphore_s length](v172, "length"));
          }

          __int128 v173 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v171,  @"randomdata"));
          __int128 v174 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v173,  1LL,  0LL));

          v175 = objc_alloc(&OBJC_CLASS___UserActivityToBTLEPayload);
          double v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
          __int16 v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v178 = -[UserActivityToBTLEPayload init:title:date:userInfoPayload:teamID:activityType:]( v175,  "init:title:date:userInfoPayload:teamID:activityType:",  v176,  @"Sample",  v177,  v174,  @"NO-TEAM-ID",  @"com.apple.fetchsamplepayloadactivity");

          __int16 v179 = (void *)objc_claimAutoreleasedReturnValue([v178 encodeAsData]);
          os_log_t v180 = sub_100039584(0LL);
          __int16 v181 = (os_log_s *)objc_claimAutoreleasedReturnValue(v180);
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
          {
            v182 = (SharingBTLEAdvertisementPayload *)[v179 length];
            __int16 v183 = (__CFString *)objc_claimAutoreleasedReturnValue([v201 uniqueID]);
            *(_DWORD *)buf = 134218243;
            v217 = v182;
            __int16 v218 = 2113;
            v219 = v183;
            _os_log_impl( (void *)&_mh_execute_header,  v181,  OS_LOG_TYPE_DEFAULT,  "SAMPLEPAYLOAD: Sending %ld bytes to device %{private}@",  buf,  0x16u);
          }

          id v184 = (void *)objc_claimAutoreleasedReturnValue([v178 uniqueIdentifier]);
          (*((void (**)(id, void *, void *, void))v202 + 2))(v202, v184, v179, 0LL);

          __int16 v34 = v21;
LABEL_120:
        }

LABEL_122:
        goto LABEL_123;
      }
    }

    unsigned int v35 = v28;
    os_log_t v36 = sub_100039584(0LL);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      BOOL v38 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload activityType](v35, "activityType"));
      os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v35, "uuid"));
      uint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
      *(_DWORD *)buf = 138478339;
      v217 = v38;
      __int16 v218 = 2114;
      v219 = v40;
      __int16 v220 = 2114;
      v221 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "-- advertiseable item %{private}@/%{public}@ matches the advertisingPayload requested %{public}@, so using it.",  buf,  0x20u);
    }

    if (!v35) {
      goto LABEL_28;
    }
LABEL_51:
    dispatch_semaphore_t v194 = dispatch_semaphore_create(0LL);
    os_log_t v67 = sub_100039584(@"signposts");
    os_log_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    v69 = v68;
    if (v35 != (SharingBTLEAdvertisementPayload *)-1LL && os_signpost_enabled(v68))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v69,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v35,  "handoffFetch",  (const char *)&unk_1000ABCB9,  buf,  2u);
    }

    v205[0] = _NSConcreteStackBlock;
    v205[1] = 3221225472LL;
    v205[2] = sub_10006AAE0;
    v205[3] = &unk_1000BE048;
    __int16 v34 = v35;
    v206 = v34;
    dispatch_semaphore_t dsema = v194;
    dispatch_semaphore_t v207 = dsema;
    if (-[SharingBTLEAdvertisementPayload requestPayloadWithCompletionHandler:]( v34,  "requestPayloadWithCompletionHandler:",  v205))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v70 maximumTimeoutToWaitForClientProcessToUpdateActivityInformation];
      dispatch_time_t v72 = dispatch_time(0LL, (uint64_t)(v71 * 1000000000.0));
      double v73 = COERCE_DOUBLE(dispatch_semaphore_wait(dsema, v72));

      if (v73 != 0.0)
      {
        os_log_t v74 = sub_100039584(0LL);
        double v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          id v76 = sub_1000034D8(v203);
          uint64_t v77 = (SharingBTLEAdvertisementPayload *)(id)objc_claimAutoreleasedReturnValue(v76);
          v78 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload activityType](v34, "activityType"));
          id v79 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
          __int16 v80 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v79 UUIDString]);
          *(_DWORD *)buf = 138544131;
          v217 = v77;
          __int16 v218 = 2113;
          v219 = v78;
          __int16 v220 = 2114;
          v221 = v80;
          __int16 v222 = 2048;
          double v223 = v73;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_ERROR,  "Failure updating userActivity information from client application for activity %{public}@/%{private}@  %{pub lic}@, using (possibly stale) payload instead, status=%ld.",  buf,  0x2Au);
        }

        double v81 = (void *)objc_claimAutoreleasedReturnValue( -[SharingBTLEAdvertisementPayload payloadForIdentifier:]( v34,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
        if (v81
          || (double v81 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload webpageURL](v34, "webpageURL"))) != 0LL)
        {
        }

        else
        {
          __int16 v185 = (void *)objc_claimAutoreleasedReturnValue( -[SharingBTLEAdvertisementPayload payloadForIdentifier:]( v34,  "payloadForIdentifier:",  UAUserActivityStreamsPayload));
          BOOL v186 = v185 == 0LL;

          if (v186)
          {

            goto LABEL_116;
          }
        }
      }
    }

    if (v34)
    {
      v195 = (void *)objc_claimAutoreleasedReturnValue( -[SharingBTLEAdvertisementPayload payloadForIdentifier:]( v34,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
      __int16 v82 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      unsigned int v83 = [v82 debugForceNewPayloadEncoder];

      if (v83)
      {
        os_log_t v84 = sub_100039584(0LL);
        v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          double v86 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v201 name]);
          os_log_t v87 = (__CFString *)objc_claimAutoreleasedReturnValue([v201 productVersion]);
          BOOL v88 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v201 productBuildVersion]);
          *(_DWORD *)buf = 138478339;
          v217 = v86;
          __int16 v218 = 2114;
          v219 = v87;
          __int16 v220 = 2114;
          v221 = v88;
          _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_INFO,  "-- Forcing new payload encoder to peer %{private}@/%{public}@ %{public}@ because debugForceNewPayloadEncoder == YES",  buf,  0x20u);
        }
      }

      else
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        if ([v89 debugForceOldPayloadEncoder])
        {
        }

        else
        {
          unsigned __int8 v92 = -[UASharingAdvertiser peerDeviceCanAcceptNewerPayload:](self, "peerDeviceCanAcceptNewerPayload:", v201);

          if ((v92 & 1) != 0) {
            goto LABEL_74;
          }
        }

        BOOL v93 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityInfo encodedInfoToOldEncodedInfo:]( &OBJC_CLASS___UAUserActivityInfo,  "encodedInfoToOldEncodedInfo:",  v195));
        os_log_t v94 = sub_100039584(0LL);
        unsigned int v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
        {
          os_log_t v96 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v201 name]);
          id v97 = (__CFString *)objc_claimAutoreleasedReturnValue([v201 productName]);
          BOOL v98 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v201 productBuildVersion]);
          double v99 = COERCE_DOUBLE([v93 length]);
          id v100 = [v195 length];
          *(_DWORD *)buf = 138478851;
          v217 = v96;
          __int16 v218 = 2114;
          v219 = v97;
          __int16 v220 = 2114;
          v221 = v98;
          __int16 v222 = 2048;
          double v223 = v99;
          __int16 v224 = 2048;
          id v225 = v100;
          _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "-- Falling back to 'old' format of payload to support pre Blacktail era device, %{private}@/%{public}@ %{pub lic}@ (size=%ld vs %ld)",  buf,  0x34u);
        }

        v85 = (os_log_s *)v195;
        v195 = v93;
      }

LABEL_74:
      __int128 v101 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload encodedUserInfoError](v34, "encodedUserInfoError"));
      BOOL v102 = v101 == 0LL;

      if (v102)
      {
        v110 = objc_alloc(&OBJC_CLASS___UserActivityToBTLEPayload);
        BOOL v111 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
        v112 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
        unsigned __int8 v113 = [v112 dontSendActivityTitle];
        if ((v113 & 1) != 0) {
          v114 = &stru_1000BE738;
        }
        else {
          v114 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload title](v34, "title"));
        }
        unsigned int v115 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload teamIdentifier](v34, "teamIdentifier"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload activityType](v34, "activityType"));
        v198 = -[UserActivityToBTLEPayload init:title:date:userInfoPayload:teamID:activityType:]( v110,  "init:title:date:userInfoPayload:teamID:activityType:",  v111,  v114,  0LL,  v195,  v115,  v116);

        if ((v113 & 1) == 0) {
        uint64_t v117 = objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload webpageURL](v34, "webpageURL"));
        }
        -[UserActivityToBTLEPayload setWebpageURL:](v198, "setWebpageURL:", v117);

        double v118 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload persistentIdentifier](v34, "persistentIdentifier"));
        LOBYTE(v117) = v118 == 0LL;

        if ((v117 & 1) == 0)
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload persistentIdentifier](v34, "persistentIdentifier"));
          -[UserActivityToBTLEPayload addAdditionalItem:forKey:]( v198,  "addAdditionalItem:forKey:",  v119,  @"persistentID");
        }

        os_log_t v120 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload targetContentIdentifier](v34, "targetContentIdentifier"));
        BOOL v121 = v120 == 0LL;

        if (!v121)
        {
          os_log_t v122 = sub_100039584(0LL);
          BOOL v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            v124 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue( -[SharingBTLEAdvertisementPayload targetContentIdentifier]( v34,  "targetContentIdentifier"));
            *(_DWORD *)buf = 138739971;
            v217 = v124;
            _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_INFO,  "- Adding targetContentIdentifie=%{sensitive}@ to additionalItems payload",  buf,  0xCu);
          }

          v125 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload targetContentIdentifier](v34, "targetContentIdentifier"));
          -[UserActivityToBTLEPayload addAdditionalItem:forKey:]( v198,  "addAdditionalItem:forKey:",  v125,  @"targetContentID");
        }

        id v109 = (void *)objc_claimAutoreleasedReturnValue( -[SharingBTLEAdvertisementPayload payloadForIdentifier:]( v34,  "payloadForIdentifier:",  UAUserActivityStreamsPayload));
        -[UserActivityToBTLEPayload setStreamsData:](v198, "setStreamsData:", v109);
      }

      else
      {
        os_log_t v103 = sub_100039584(0LL);
        v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          id v105 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
          __int16 v106 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v105 UUIDString]);
          id v107 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload encodedUserInfoError](v34, "encodedUserInfoError"));
          *(_DWORD *)buf = 138543618;
          v217 = v106;
          __int16 v218 = 2114;
          v219 = v107;
          _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "-- ENCODING error from client instead of payload, %{public}@ / %{public}@",  buf,  0x16u);
        }

        v108 = objc_alloc(&OBJC_CLASS___UserActivityToBTLEPayload);
        id v109 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload encodedUserInfoError](v34, "encodedUserInfoError"));
        v198 = -[UserActivityToBTLEPayload initWithNSError:](v108, "initWithNSError:", v109);
      }

      v126 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload encodeAsData](v198, "encodeAsData"));
      if (!v126) {
        goto LABEL_103;
      }
      v127 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      if ((uint64_t)[v127 maximumActivityPayloadSizeInBytes] <= 0)
      {
      }

      else
      {
        id v128 = [v126 length];
        v129 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
        LODWORD(v128) = v128 > [v129 maximumActivityPayloadSizeInBytes];

        if ((_DWORD)v128)
        {
          os_log_t v130 = sub_100039584(0LL);
          v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            v132 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
            id v133 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v132 UUIDString]);
            v134 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload logString](v34, "logString"));
            v135 = (SharingBTLEAdvertisementPayload *)[v126 length];
            v136 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            double v137 = COERCE_DOUBLE([v136 maximumActivityPayloadSizeInBytes]);
            *(_DWORD *)buf = 138544131;
            v217 = v133;
            __int16 v218 = 2113;
            v219 = v134;
            __int16 v220 = 2048;
            v221 = v135;
            __int16 v222 = 2048;
            double v223 = v137;
            _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "** The payload for user activity item %{public}@/%{private}@ was %ld bytes, larger than the maximum %ld, a nd so this user activity cannot be sent to the requesting device.",  buf,  0x2Au);
          }

          id v138 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v126 length]));
          os_log_t v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v138,  @"EncodedPayloadSize",  0LL));
          v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -110LL,  v139));

          v141 = -[UserActivityToBTLEPayload initWithNSError:]( objc_alloc(&OBJC_CLASS___UserActivityToBTLEPayload),  "initWithNSError:",  v140);
          uint64_t v142 = objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload encodeAsData](v141, "encodeAsData"));

          v126 = (void *)v142;
          goto LABEL_102;
        }
      }

      v140 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      if ([v140 activityPayloadWarningSizeInBytes])
      {
        v143 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
        id v144 = [v143 activityPayloadWarningSizeInBytes];
        LODWORD(v144) = v144 < [v126 length];

        if (!(_DWORD)v144)
        {
LABEL_103:
          os_log_t v152 = sub_100039584(0LL);
          double v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
          if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
          {
            id v154 = sub_1000034D8(v203);
            v155 = (SharingBTLEAdvertisementPayload *)(id)objc_claimAutoreleasedReturnValue(v154);
            v156 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
            double v157 = (__CFString *)objc_claimAutoreleasedReturnValue([v156 UUIDString]);
            os_log_t v158 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue( -[SharingBTLEAdvertisementPayload activityType]( v34,  "activityType"));
            double v159 = sub_10005C3D4();
            id v160 = [v126 length];
            id v161 = sub_10005BD28(v126, 40LL);
            v162 = (void *)objc_claimAutoreleasedReturnValue(v161);
            *(_DWORD *)buf = 138544643;
            v217 = v155;
            __int16 v218 = 2114;
            v219 = v157;
            __int16 v220 = 2114;
            v221 = v158;
            __int16 v222 = 2048;
            double v223 = v159 - v20;
            __int16 v224 = 2048;
            id v225 = v160;
            __int16 v226 = 2113;
            v227 = v162;
            _os_log_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_DEFAULT,  "PAYLOAD:Responding to SFAdvertiser with data for advertisement %{public}@ activity %{public}@ type=%{publi c}@, fetchTime=%g data=%ld/%{private}@",  buf,  0x3Eu);
          }

          v163 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
          (*((void (**)(id, void *, void *, void))v202 + 2))(v202, v163, v126, 0LL);

LABEL_119:
          __int128 v174 = v206;
          unsigned int v56 = v204;
          v204 = v21;
          goto LABEL_120;
        }

        os_log_t v145 = sub_100039584(0LL);
        v140 = (void *)objc_claimAutoreleasedReturnValue(v145);
        if (os_log_type_enabled((os_log_t)v140, OS_LOG_TYPE_DEFAULT))
        {
          v146 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload uuid](v34, "uuid"));
          v147 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v146 UUIDString]);
          v148 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload logString](v34, "logString"));
          v149 = (SharingBTLEAdvertisementPayload *)[v126 length];
          double v150 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          double v151 = COERCE_DOUBLE([v150 activityPayloadWarningSizeInBytes]);
          *(_DWORD *)buf = 138544131;
          v217 = v147;
          __int16 v218 = 2113;
          v219 = v148;
          __int16 v220 = 2048;
          v221 = v149;
          __int16 v222 = 2048;
          double v223 = v151;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v140,  OS_LOG_TYPE_DEFAULT,  "*** The payload for the user activity item %{public}@/%{private}@ is %ld bytes, larger than the recommended maximum %ld, which may cause slow transfers.",  buf,  0x2Au);
        }
      }

      v141 = v198;
LABEL_102:

      v198 = v141;
      goto LABEL_103;
    }

- (void)activityAdvertiser:(id)a3 didSendPayloadForActivityIdentifier:(id)a4 toDevice:(id)a5 error:(id)a6
{
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "User activity %{public}@ was resumed on another device, so inform (if desired) the author of the activity on this device",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned __int8 v12 = [v11 activityAdvertisingAllowed];

  if ((v12 & 1) == 0)
  {
    os_log_t v20 = sub_100039584(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failing because self.activityAdvertisingAllowed == NO, ignoring notification.",  buf,  2u);
    }

- (void)activityAdvertiser:(id)a3 pairedDevicesChangedNotification:(id)a4
{
  id v5 = a4;
  os_log_t v6 = sub_100039584(0LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    id v9 = sub_10006734C(v5);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 134218243;
    id v16 = v8;
    __int16 v17 = 2113;
    uint64_t v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "PAIRED DEVICES CHANGED: Now is %ld/%{private}@",  buf,  0x16u);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser dispatchQ](self, "dispatchQ"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006B0F8;
  v13[3] = &unk_1000BCD38;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  dispatch_async(v11, v13);
}

- (BOOL)scheduleAdvertisementUpdate:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](self, "nextScheduleUpdate"));
  unsigned __int8 v5 = [v4 scheduleNext:a3];

  return v5;
}

- (BOOL)scheduleAdvertisementUpdate
{
  return -[UASharingAdvertiser scheduleAdvertisementUpdate:](self, "scheduleAdvertisementUpdate:", 0.0);
}

- (BOOL)okToSuspendAdvertising
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UASharingAdvertiser;
  unsigned __int8 v3 = -[UAAdvertiser okToSuspendAdvertising](&v8, "okToSuspendAdvertising");
  id v4 = self;
  objc_sync_enter(v4);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](v4, "currentAdvertisedItem"));
  unsigned __int8 v6 = [v5 eligibleToAlwaysAdvertise];

  objc_sync_exit(v4);
  return v3 & ~v6;
}

- (BOOL)active
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UASharingAdvertiser;
  if (!-[UACornerActionManagerHandler active](&v5, "active")) {
    return 0;
  }
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned __int8 v3 = [v2 activityBTLESharingEnabled];

  return v3;
}

- (BOOL)suspend
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UASharingAdvertiser;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v7, "suspend");
  if (v3)
  {
    -[UASharingAdvertiser setUserIsCurrent:](self, "setUserIsCurrent:", 0LL);
    -[UASharingAdvertiser removeAdvertisement](self, "removeAdvertisement");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](self, "nextScheduleUpdate"));
    [v4 suspend];

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
    [v5 suspend];
  }

  return v3;
}

- (BOOL)resume
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UASharingAdvertiser;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v10, "resume");
  if (v3)
  {
    -[UASharingAdvertiser advertisePayload:force:](self, "advertisePayload:force:", 0LL, 0LL);
    BYTE1(self->_sfAdvertisers) = 1;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](self, "nextScheduleUpdate"));
    [v4 reset];

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](self, "nextScheduleUpdate"));
    [v5 resume];

    -[UASharingAdvertiser scheduleAdvertisementUpdate](self, "scheduleAdvertisementUpdate");
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
    [v6 resume];

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
    [v7 reset];

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
    [v8 scheduleNext:0.1];
  }

  return v3;
}

- (BOOL)userIsCurrent
{
  int v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE4(v2->_sfAdvertisers);
  objc_sync_exit(v2);

  return v3;
}

- (void)setUserIsCurrent:(BOOL)a3
{
  int v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (BYTE4(obj->_sfAdvertisers) != v3)
  {
    BYTE4(obj->_sfAdvertisers) = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](obj, "currentAdvertisementPayload"));

    if (v4 || v3) {
      -[UASharingAdvertiser scheduleAdvertisementUpdate](obj, "scheduleAdvertisementUpdate");
    }
  }

  objc_sync_exit(obj);
}

- (void)scheduleIOPowerManagerUserIdleNotifications
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser userIsCurrentIdleTracker](self, "userIsCurrentIdleTracker"));
  [v2 setEnabled:1];
}

- (void)removeIOPowerManagerUserIdleNotifications
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser userIsCurrentIdleTracker](self, "userIsCurrentIdleTracker"));
  [v2 setEnabled:0];
}

- (BOOL)pasteboardAvailible
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  LODWORD(v4) = [v3 clipboardSharingEnabled];

  if ((_DWORD)v4)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisableItems](self, "advertisableItems", 0LL));
    id v4 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v5);
          }
          objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          uint64_t v9 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardActivityInfo);
          if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
          {
            objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v8 pasteboardTypes]);
            LOBYTE(v4) = [v10 count] != 0;

            goto LABEL_12;
          }
        }

        id v4 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

- (BOOL)pasteboardBitValue
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisableItems](self, "advertisableItems", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_super v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardActivityInfo);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          id v9 = [v7 generation];
          if (v9 != (id)-[UASharingAdvertiser lastAdvertisedGeneration](self, "lastAdvertisedGeneration"))
          {
            -[UASharingAdvertiser setLastAdvertisedGeneration:](self, "setLastAdvertisedGeneration:", v9);
            -[UASharingAdvertiser setPboardBitToAdvertise:]( self,  "setPboardBitToAdvertise:",  -[UASharingAdvertiser pboardBitToAdvertise](self, "pboardBitToAdvertise") ^ 1);
          }

          goto LABEL_12;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)statusString
{
  os_log_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Sharing.framework Advertiser:"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertiser](self, "sfActivityAdvertiser"));

  if (!v3) {
    [v64 appendString:@"(No SFActivityAdvertiser) "];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned __int8 v5 = [v4 isBluetoothEnabled];

  if ((v5 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    unsigned int v10 = [v9 shouldIgnoreBluetoothDisabled];

    if (v10) {
      uint64_t v8 = @" ** Bluetooth is disabled but IgnoreBluetoothDisabled is set, so the activity will be advertised. **";
    }
    else {
      uint64_t v8 = @" ** Bluetooth is disabled so no activity will be advertised. **";
    }
    goto LABEL_9;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned __int8 v7 = [v6 isBatterySaverModeEnabled];

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = @" ** LowPowerMode is enabled so no activity will be advertised. **";
LABEL_9:
    [v64 appendString:v8];
    goto LABEL_10;
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  unsigned __int8 v26 = [v25 activityAdvertisingAllowed];

  if ((v26 & 1) == 0)
  {
    uint64_t v8 = @" ** Activity advertising is disabled on this device. **";
    goto LABEL_9;
  }

  if (-[UACornerActionManagerHandler suspended](self, "suspended"))
  {
    uint64_t v8 = @"** SUSPENDED:";
    goto LABEL_9;
  }

- (OS_dispatch_group)helpersDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 73LL, 1);
}

- (UAUserActivityInfo)currentAdvertisedItem
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 89LL, 1);
}

- (void)setCurrentAdvertisedItem:(id)a3
{
}

- (OS_dispatch_queue)dispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 97LL, 1);
}

- (UADispatchScheduler)nextScheduleUpdate
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 105LL, 1);
}

- (UADispatchScheduler)periodicUpdate
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 113LL, 1);
}

- (NSDate)dontAdvertiseAsCurrentUntil
{
  return (NSDate *)objc_getProperty(self, a2, 121LL, 1);
}

- (void)setDontAdvertiseAsCurrentUntil:(id)a3
{
}

- (SharingBTLEAdvertisementPayload)currentAdvertisementPayload
{
  return (SharingBTLEAdvertisementPayload *)objc_getProperty(self, a2, 129LL, 1);
}

- (void)setCurrentAdvertisementPayload:(id)a3
{
}

- (NSDate)lastAdvertismentTime
{
  return (NSDate *)objc_getProperty(self, a2, 137LL, 1);
}

- (void)setLastAdvertismentTime:(id)a3
{
}

- (SharingBTLEAdvertisementPayload)lastAdvertisementPayload
{
  return (SharingBTLEAdvertisementPayload *)objc_getProperty(self, a2, 145LL, 1);
}

- (void)setLastAdvertisementPayload:(id)a3
{
}

- (NSMutableDictionary)currentAdvertisedItemOtherAdvertisedItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 153LL, 1);
}

- (void)setCurrentAdvertisedItemOtherAdvertisedItems:(id)a3
{
}

- (NSMutableArray)advertisementTimes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 161LL, 1);
}

- (void)setAdvertisementTimes:(id)a3
{
}

- (unint64_t)changeAdvertisementThreadSpinCount
{
  return *(unint64_t *)((char *)&self->_advertisementTimes + 1);
}

- (void)setChangeAdvertisementThreadSpinCount:(unint64_t)a3
{
  *(NSMutableArray **)((char *)&self->_advertisementTimes + 1) = (NSMutableArray *)a3;
}

- (UATimedPowerAssertions)preventIdleSleepAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 177LL, 1);
}

- (void)setPreventIdleSleepAssertion:(id)a3
{
}

- (PowerManagerIdleTracker)userIsCurrentIdleTracker
{
  return (PowerManagerIdleTracker *)objc_getProperty(self, a2, 185LL, 1);
}

- (void)setUserIsCurrentIdleTracker:(id)a3
{
}

- (NSDate)lastUserActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 193LL, 1);
}

- (void)setLastUserActiveTime:(id)a3
{
}

- (int64_t)lastAdvertisedGeneration
{
  return *(int64_t *)((char *)&self->_lastUserActiveTime + 1);
}

- (void)setLastAdvertisedGeneration:(int64_t)a3
{
  *(NSDate **)((char *)&self->_lastUserActiveTime + 1) = (NSDate *)a3;
}

- (BOOL)pboardBitToAdvertise
{
  return BYTE5(self->_sfAdvertisers) & 1;
}

- (void)setPboardBitToAdvertise:(BOOL)a3
{
  BYTE5(self->_sfAdvertisers) = a3;
}

- (NSDate)beginTimeForNonActiveAdvertisement
{
  return *(NSDate **)((char *)&self->_lastAdvertisedGeneration + 1);
}

- (void).cxx_destruct
{
}

@end