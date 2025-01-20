@interface PBProfilesAnalyticsController
+ (id)_appsEventWithApplicationInfos:(id)a3;
+ (id)_usersStateEventWithProfileStoreSnapshot:(id)a3;
+ (void)sendDailyAnalyticsEventsWithProfileStoreSnapshot:(id)a3;
- (PBProfilesAnalyticsController)initWithPowerManager:(id)a3;
- (id)_lastSystemWakeDate;
- (id)_userSwitchEventWithClientBundleIdentifier:(id)a3;
- (void)_resetLastSystemWakeDate;
- (void)_updateLastSystemWakeDate;
- (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4;
- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4;
- (void)sendSwitchProfileEventWithClientBundleIdentifier:(id)a3;
@end

@implementation PBProfilesAnalyticsController

- (PBProfilesAnalyticsController)initWithPowerManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBProfilesAnalyticsController;
  v6 = -[PBProfilesAnalyticsController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    lock_lastSystemWakeDate = v7->_lock_lastSystemWakeDate;
    v7->_lock_lastSystemWakeDate = (NSDate *)v8;

    objc_storeStrong((id *)&v7->_powerManager, a3);
    -[PBPowerManager addObserver:](v7->_powerManager, "addObserver:", v7);
  }

  return v7;
}

+ (void)sendDailyAnalyticsEventsWithProfileStoreSnapshot:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _usersStateEventWithProfileStoreSnapshot:a3]);
  TVCSUserProfilesAnalyticsSendEvent();
  id v5 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppInfoController enabledAndVisibleAppsFilter]( &OBJC_CLASS___PBAppInfoController,  "enabledAndVisibleAppsFilter"));
  uint64_t v8 = -[PBAppInfoController initWithInfoStore:filter:delegate:](v5, "initWithInfoStore:filter:delegate:", v6, v7, 0LL);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](v8, "appInfos"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bs_compactMap:", &stru_1003D4BA8));

  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _appsEventWithApplicationInfos:v11]);
  TVCSUserProfilesAnalyticsSendEvent();
}

- (void)sendSwitchProfileEventWithClientBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TVCSUserProfilesAnalyticsUserSwitchEvent);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfilesAnalyticsController _lastSystemWakeDate](self, "_lastSystemWakeDate"));
  [v5 setLastSystemWakeDate:v6];

  [v5 setClientBundleIdentifier:v4];
  TVCSUserProfilesAnalyticsSendEvent(v5);
}

+ (id)_usersStateEventWithProfileStoreSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___TVCSUserProfilesAnalyticsUsersStateEvent);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 profiles]);
  v28 = v4;
  objc_msgSend(v4, "setUsersCount:", objc_msgSend(v5, "count"));
  v29 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 secondaryProfiles]);
  id v27 = [v6 count];

  v7 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 iCloudAltDSID]);
        if (v17) {
          ++v13;
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 iTunesAltDSID]);
        if (v18)
        {
          ++v12;
          v19 = (void *)objc_claimAutoreleasedReturnValue([v16 iTunesAltDSID]);
          -[NSCountedSet addObject:](v7, "addObject:", v19);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v16 gameCenterAltDSID]);
        if (v20) {
          ++v11;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v10);
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  [v28 setGuestUsersCount:v27];
  [v28 setUsersWithiCloudAccountCount:v13];
  [v28 setUsersWithiTunesAccountCount:v12];
  [v28 setUsersWithGameCenterAccountCount:v11];
  [v28 setHomeUsersCount:0];
  [v28 setHomeUsersWithiCloudAccountCount:0];
  [v28 setHomeUsersWithGameCenterAccountCount:0];
  [v28 setHaveHomeUsers:0];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v21 = v7;
  id v22 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    while (2)
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        if (-[NSCountedSet countForObject:]( v21,  "countForObject:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)j)) >= 2)
        {
          [v28 setHaveSharediTunesAccounts:1];
          goto LABEL_26;
        }
      }

      id v23 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
      if (v23) {
        continue;
      }
      break;
    }
  }

+ (id)_appsEventWithApplicationInfos:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___TVCSUserProfilesAnalyticsAppsEvent);
  objc_msgSend(v4, "setAppCount:", objc_msgSend(v3, "count"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v9 += objc_msgSend(v12, "hasRunAsCurrentUserEntitlement", (void)v14);
        v8 += [v12 hasGetCurrentUserEntitlement];
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
  }

  [v4 setRunAsCurrentUserAppCount:v9];
  [v4 setGetCurrentUserAppCount:v8];

  return v4;
}

- (id)_userSwitchEventWithClientBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TVCSUserProfilesAnalyticsUserSwitchEvent);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfilesAnalyticsController _lastSystemWakeDate](self, "_lastSystemWakeDate"));
  [v5 setLastSystemWakeDate:v6];

  [v5 setClientBundleIdentifier:v4];
  return v5;
}

- (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4
{
}

- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4
{
}

- (void)_resetLastSystemWakeDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSystemWakeDate = self->_lock_lastSystemWakeDate;
  self->_lock_lastSystemWakeDate = 0LL;

  os_unfair_lock_unlock(p_lock);
}

- (void)_updateLastSystemWakeDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  lock_lastSystemWakeDate = self->_lock_lastSystemWakeDate;
  self->_lock_lastSystemWakeDate = v4;

  os_unfair_lock_unlock(p_lock);
}

- (id)_lastSystemWakeDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_lastSystemWakeDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
}

@end