@interface UABestAppSuggestionNotifier
- (BOOL)active;
- (BOOL)requiresBoosted;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (BOOL)wantsBestAppChangedNotifications;
- (NSArray)lastItemUUIDs;
- (NSArray)lastItemWhens;
- (NSMutableDictionary)possibleItems;
- (NSMutableDictionary)supressedUntil;
- (NSString)lastItemStr;
- (NSXPCConnection)connection;
- (UABestAppSuggestionNotifier)initWithManager:(id)a3 connection:(id)a4;
- (UADispatchScheduler)scheduler;
- (id)bestCornerItemsFromItems:(id)a3;
- (id)items;
- (id)statusString;
- (id)userActivityInfoForUUID:(id)a3;
- (void)doConnected;
- (void)doDetermineBestAppSuggestionWithCompletionHandler:(id)a3;
- (void)doDetermineBestAppSuggestions:(int64_t)a3 completionHandler:(id)a4;
- (void)doLaunchFollowUp:(id)a3 interactionType:(unint64_t)a4 cancelled:(BOOL)a5;
- (void)doQueueFetchOfPayloadForBestAppSuggestion:(id)a3 completionHandler:(id)a4;
- (void)doRegisterForBestAppChangeNotification;
- (void)doRemoveBestAppSuggestion:(id)a3 options:(id)a4;
- (void)doUnregisterForBestAppChangeNotification;
- (void)fetchAllNearbyAppSuggestions:(id)a3;
- (void)notifyBestAppsChanged:(id)a3 atTime:(id)a4;
- (void)setConnection:(id)a3;
- (void)setItems:(id)a3;
- (void)setLastItemStr:(id)a3;
- (void)setLastItemUUIDs:(id)a3;
- (void)setLastItemWhens:(id)a3;
- (void)setPossibleItems:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSupressedUntil:(id)a3;
- (void)setWantsBestAppChangedNotifications:(BOOL)a3;
- (void)update;
@end

@implementation UABestAppSuggestionNotifier

- (UABestAppSuggestionNotifier)initWithManager:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&v38[1], 0, sizeof(audit_token_t));
  }
  audit_token_t atoken = v38[1];
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  int v9 = proc_pidpath(pidp, buffer, 0x1000u);
  if (v9 < 1 || !buffer[0]) {
    goto LABEL_14;
  }
  while (!buffer[v9])
  {
    BOOL v10 = __OFSUB__(v9--, 1);
    if ((v9 < 0) ^ v10 | (v9 == 0))
    {
      int v9 = 0;
      break;
    }
  }

  uint64_t v11 = -1LL;
  do
  {
    int v12 = v9 - 1;
    ++v11;
    if (!v9) {
      break;
    }
    int v13 = buffer[v9--];
  }

  while (v13 != 47);
  v14 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &buffer[v12 + 2],  v11,  4LL);
  if (!v14)
  {
LABEL_14:
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v38, 0, 32);
    }
    audit_token_t atoken = v38[0];
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(PID:%ld)",  pidp));
  }

  if (v14) {
    v15 = v14;
  }
  else {
    v15 = @"BestApp";
  }
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionNotifier;
  v16 = -[UAActivityNotifier initWithManager:name:](&v37, "initWithManager:name:", v6, v15);
  v17 = v16;
  if (v16)
  {
    -[UABestAppSuggestionNotifier setConnection:](v16, "setConnection:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[UABestAppSuggestionNotifier setSupressedUntil:](v17, "setSupressedUntil:", v18);

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100007AEC;
    v35[3] = &unk_1000BCCA8;
    v21 = v17;
    v36 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UADispatchScheduler dispatchScheduler:frequency:queue:block:]( &OBJC_CLASS___UADispatchScheduler,  "dispatchScheduler:frequency:queue:block:",  @"bestApp",  v20,  v35,  0.0));
    -[UABestAppSuggestionNotifier setScheduler:](v21, "setScheduler:", v22);

    id v23 = sub_10003A790();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v8 setExportedInterface:v24];

    id v25 = sub_10003A87C();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    [v8 setRemoteObjectInterface:v26];

    [v8 setExportedObject:v21];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100007B1C;
    v33[3] = &unk_1000BCCA8;
    v27 = v21;
    v34 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](v27, "connection"));
    [v28 setInvalidationHandler:v33];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100007C44;
    v31[3] = &unk_1000BCCA8;
    id v32 = v8;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](v27, "connection"));
    [v29 setInterruptionHandler:v31];
  }

  return v17;
}

- (BOOL)wantsBestAppChangedNotifications
{
  return self->_wantsBestAppChangedNotifications;
}

- (void)setWantsBestAppChangedNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_wantsBestAppChangedNotifications != v3)
  {
    obj->_wantsBestAppChangedNotifications = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](obj, "manager"));
    [v5 triggerUserIdleDetermination];

    v4 = obj;
    if (v3)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](obj, "manager"));
      [v6 scheduleBestAppDetermination];

      v4 = obj;
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)requiresBoosted
{
  return 1;
}

- (id)items
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier possibleItems](self, "possibleItems"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  return v4;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v8 = sub_10005BF18(v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138477827;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "setItems(%{private}@)", buf, 0xCu);
  }

  BOOL v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[UABestAppSuggestionNotifier setPossibleItems:](v10, "setPossibleItems:", v11);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier possibleItems](v10, "possibleItems", (void)v21));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
        [v17 setObject:v16 forKeyedSubscript:v18];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier bestCornerItemsFromItems:](v10, "bestCornerItemsFromItems:", v12));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[UABestAppSuggestionNotifier notifyBestAppsChanged:atTime:](v10, "notifyBestAppsChanged:atTime:", v19, v20);

  objc_sync_exit(v10);
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier items](self, "items"));
    id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v27;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        unsigned __int8 v11 = [v4 isEqual:v10];

        if ((v11 & 1) != 0) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v12 = v9;

      if (v12) {
        goto LABEL_23;
      }
    }

    else
    {
LABEL_10:
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cornerActionItems]);

  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
        unsigned int v20 = [v4 isEqual:v19];

        if (v20)
        {
          id v12 = v18;
          goto LABEL_22;
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_22:

LABEL_23:
  return v12;
}

- (id)bestCornerItemsFromItems:(id)a3
{
  id v54 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v4 cornerActionItemTimeout];
  double v6 = v5;

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v6 <= 0.0) {
    v59 = 0LL;
  }
  else {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v6));
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = v54;
  id v7 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (!v7) {
    goto LABEL_35;
  }
  uint64_t v60 = *(void *)v63;
  v55 = self;
  do
  {
    id v61 = v7;
    for (i = 0LL; i != v61; i = (char *)i + 1)
    {
      if (*(void *)v63 != v60) {
        objc_enumerationMutation(obj);
      }
      int v9 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](self, "supressedUntil"));
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);

      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 hardSupressUntil]);
        if (v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 hardSupressUntil]);
          BOOL v15 = sub_10005B958(v58, v14);

          if (v15)
          {
            os_log_t v16 = sub_100039584(0LL);
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue([v9 activityType]);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
              id v20 = (id)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 hardSupressUntil]);
              __int128 v22 = sub_1000758E0(v21);
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              *(_DWORD *)buf = 138478595;
              v67 = v18;
              __int16 v68 = 2114;
              id v69 = v20;
              __int16 v70 = 2114;
              id v71 = v23;
              __int16 v72 = 2114;
              v73 = v58;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "BESTAPP: -- Ignoring supressed item, %{private}@ %{public}@ (until %{public}@, now=%{public}@)",  buf,  0x2Au);

              self = v55;
            }

- (void)notifyBestAppsChanged:(id)a3 atTime:(id)a4
{
  id v54 = a3;
  id v52 = a4;
  v53 = self;
  if (!-[UABestAppSuggestionNotifier wantsBestAppChangedNotifications](self, "wantsBestAppChangedNotifications")) {
    goto LABEL_35;
  }
  double v6 = (char *)[v54 count];
  if (!v54)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemUUIDs](self, "lastItemUUIDs"));
    if (!v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemWhens](self, "lastItemWhens"));
      unsigned int v17 = v8 == 0LL;
LABEL_21:

      goto LABEL_22;
    }

    goto LABEL_15;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemUUIDs](self, "lastItemUUIDs"));
  if (!v7)
  {
LABEL_16:
    unsigned int v17 = 0;
    goto LABEL_23;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemWhens](self, "lastItemWhens"));
  if (!v8)
  {
LABEL_15:
    unsigned int v17 = 0;
LABEL_22:

    goto LABEL_23;
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemUUIDs](self, "lastItemUUIDs"));
  if ([v9 count] != v6)
  {
LABEL_20:

    unsigned int v17 = 0;
    goto LABEL_21;
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemWhens](v53, "lastItemWhens"));
  unsigned __int8 v11 = (char *)[v10 count];

  if (v11 != v6) {
    goto LABEL_16;
  }
  if (v6)
  {
    id v12 = 0LL;
    while (1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndex:v12]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 when]);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemWhens](v53, "lastItemWhens"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v12]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemUUIDs](v53, "lastItemUUIDs"));
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v12]);
      unsigned int v17 = [v14 isEqual:v16];

      if (v17)
      {
        if (v6 - 1 != v12++) {
          continue;
        }
      }

      goto LABEL_23;
    }

    goto LABEL_20;
  }

  unsigned int v17 = 1;
LABEL_23:
  id v51 = (void *)objc_claimAutoreleasedReturnValue([v54 firstObject]);
  if (v17)
  {
    os_log_t v19 = sub_100039584(0LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v51 uuid]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
      id v23 = (id)objc_claimAutoreleasedReturnValue([v51 logString]);
      __int128 v24 = (char *)objc_claimAutoreleasedReturnValue([v51 when]);
      [v54 count];
      *(_DWORD *)buf = 138544131;
      v56 = v22;
      __int16 v57 = 2113;
      id v58 = v23;
      __int16 v59 = 2114;
      uint64_t v60 = v24;
      __int16 v61 = 2048;
      __int128 v62 = (char *)[v54 count] - 1;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Not notifying clients about new best app %{public}@/%{private}@ .when=%{public}@ (and %lu more best app options) because it matches last item.",  buf,  0x2Au);
    }
  }

  else
  {
    os_log_t v25 = sub_100039584(0LL);
    BOOL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue([v51 uuid]);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v51 debugDescription]);
      [v54 count];
      *(_DWORD *)buf = 138543875;
      v56 = v28;
      __int16 v57 = 2113;
      id v58 = v29;
      __int16 v59 = 2048;
      uint64_t v60 = (char *)[v54 count] - 1;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Notifying clients about new best app: %{public}@/%{private}@ (and %lu more best app options)",  buf,  0x20u);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](v53, "connection"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v30 remoteObjectProxy]);

    if (v54)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v6));
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v6));
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v6));
      if (v6)
      {
        for (i = 0LL; i != v6; ++i)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndex:i]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 uuid]);
          [v31 setObject:v36 atIndexedSubscript:i];

          BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v35 when]);
          [v32 setObject:v37 atIndexedSubscript:i];

          BOOL v38 = -[UAUserActivityInfo initWithUserActivityInfo:]( objc_alloc(&OBJC_CLASS___UAUserActivityInfo),  "initWithUserActivityInfo:",  v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v35 peerDevice]);
          v40 = (void *)objc_claimAutoreleasedReturnValue([v39 deviceType]);
          -[UAUserActivityInfo setPeerDeviceType:](v38, "setPeerDeviceType:", v40);

          [v33 setObject:v38 atIndexedSubscript:i];
        }
      }

      -[UABestAppSuggestionNotifier setLastItemUUIDs:](v53, "setLastItemUUIDs:", v31);
      -[UABestAppSuggestionNotifier setLastItemWhens:](v53, "setLastItemWhens:", v32);
      [v50 notifyBestAppsChanged:v33 when:v52 confidence:1.0];
      BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v51 bundleIdentifier]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v51 activityType]);
      os_log_t v42 = (void *)objc_claimAutoreleasedReturnValue([v51 uuid]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 UUIDString]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v51 peerDevice]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 name]);
      [v54 count];
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@ %@ %@ (and %lu more best app options)",  v41,  v49,  v43,  v45,  (char *)[v54 count] - 1));
      -[UABestAppSuggestionNotifier setLastItemStr:](v53, "setLastItemStr:", v46);

      BOOL v47 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
      os_log_t v48 = (void *)objc_claimAutoreleasedReturnValue([v51 wasContinuedInfo]);
      [v47 submitUserActivityWasSuggestedInfo:v48];

      id v20 = (os_log_s *)v50;
    }

    else
    {
      id v20 = (os_log_s *)v50;
      [v50 notifyBestAppsChanged:0 when:v52 confidence:0.0];
      -[UABestAppSuggestionNotifier setLastItemUUIDs:](v53, "setLastItemUUIDs:", 0LL);
      -[UABestAppSuggestionNotifier setLastItemWhens:](v53, "setLastItemWhens:", 0LL);
    }
  }

LABEL_35:
}

- (void)update
{
  v2 = self;
  objc_sync_enter(v2);
  __int16 v68 = v2;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v2, "supressedUntil"));
  id v4 = [v3 count];

  if (v4)
  {
    os_log_t v5 = sub_100039584(0LL);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v2, "supressedUntil"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
      id v9 = sub_10005BF18(v8);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138477827;
      __int16 v74 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "BESTAPP: supressedUntil=%{private}@", buf, 0xCu);
    }
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v2, "supressedUntil"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v11 allValues]);

  id v12 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v12)
  {
    uint64_t v67 = *(void *)v70;
    *(void *)&__int128 v13 = 138544642LL;
    __int128 v59 = v13;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v70 != v67) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
        os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier possibleItems](v68, "possibleItems", v59));
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 itemUUID]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

        if (!v18) {
          goto LABEL_30;
        }
        os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 hardSupressUntil]);
        if (v19)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 hardSupressUntil]);
          BOOL v21 = sub_10005B958(v20, v66);

          if (v21)
          {
            os_log_t v22 = sub_100039584(0LL);
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v15 itemUUID]);
              os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
              *(_DWORD *)buf = 138543362;
              __int16 v74 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Setting .hardSupressedUntil for %{public}@ to nil, because that time has passed.",  buf,  0xCu);
            }

            [v15 setHardSupressUntil:0];
          }
        }

        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v15 supressUntil]);
        BOOL v27 = v26 == 0LL;

        if (!v27)
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v15 supressUntil]);
          BOOL v29 = sub_10005B958(v28, v66);

          if (v29)
          {
            os_log_t v30 = sub_100039584(0LL);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              id v32 = (void *)objc_claimAutoreleasedReturnValue([v15 itemUUID]);
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 UUIDString]);
              *(_DWORD *)buf = 138543362;
              __int16 v74 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Setting .supressUntil for %{public}@ to nil, because that time has passed.",  buf,  0xCu);
            }

- (BOOL)active
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
  if (v3) {
    BOOL v4 = -[UABestAppSuggestionNotifier wantsBestAppChangedNotifications](self, "wantsBestAppChangedNotifications");
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)suspend
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionNotifier;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v7, "suspend");
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](self, "scheduler"));
    [v4 suspend];

    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
    [v5 suspend];
  }

  return v3;
}

- (BOOL)resume
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionNotifier;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v7, "resume");
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](self, "scheduler"));
    [v4 resume];

    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
    [v5 resume];
  }

  return v3;
}

- (BOOL)terminate
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionNotifier;
  BOOL v3 = -[UACornerActionManagerHandler terminate](&v6, "terminate");
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
    [v4 invalidate];
  }

  return v3;
}

- (id)statusString
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](self, "name"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
  os_log_t v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  audit_token_t atoken = v15;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  uint64_t v6 = pidp;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemStr](self, "lastItemStr"));
  if (v7) {
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier lastItemStr](self, "lastItemStr"));
  }
  else {
    uint64_t v8 = @"-";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](self, "scheduler"));
  BOOL v10 = sub_100075AC8((unint64_t)[v9 nextTime]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](self, "scheduler"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%ld:%@, next=%@/%lld",  v3,  v6,  v8,  v11,  [v12 runCount]));

  if (v7) {
  return v13;
  }
}

- (void)doConnected
{
  os_log_t v3 = sub_100039584(0LL);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
    uint64_t v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v7, 0, sizeof(v7));
    }
    audit_token_t atoken = v7;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    *(_DWORD *)buf = 67109120;
    pid_t v11 = pidp;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "doConnected, bestApp client connected. pid=%d",  buf,  8u);
  }
}

- (void)doDetermineBestAppSuggestionWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void *, double))a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cornerActionItems]);
  audit_token_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier bestCornerItemsFromItems:](self, "bestCornerItemsFromItems:", v6));

  if (v7)
  {
    os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    os_log_t v8 = sub_100039584(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v25 uuid]);
      pid_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      [v7 count];
      *(_DWORD *)buf = 138543875;
      BOOL v27 = v11;
      __int16 v28 = 2113;
      BOOL v29 = v25;
      __int16 v30 = 2048;
      v31 = (char *)[v7 count] - 1;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "doDetermineBestAppSuggestionWithCompletionHandler, bestApp=%{public}@/%{private}@ (and %lu more app suggestions)",  buf,  0x20u);
    }

    if (v4)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
      for (unint64_t i = 0; i < (unint64_t)[v7 count]; ++i)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:i]);
        audit_token_t v15 = -[UAUserActivityInfo initWithUserActivityInfo:]( objc_alloc(&OBJC_CLASS___UAUserActivityInfo),  "initWithUserActivityInfo:",  v14);
        os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 peerDevice]);
        char v17 = objc_opt_respondsToSelector(v16, "deviceType");

        if ((v17 & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v14 peerDevice]);
          os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceType]);
          -[UAUserActivityInfo setPeerDeviceType:](v15, "setPeerDeviceType:", v19);
        }

        [v12 setObject:v15 atIndexedSubscript:i];
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v4[2](v4, v12, v20, 1.0);

      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue([v25 wasContinuedInfo]);
      [v21 submitUserActivityWasSuggestedInfo:v22];
    }
  }

  else if (v4)
  {
    os_log_t v23 = sub_100039584(0LL);
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "doDetermineBestAppSuggestionWithCompletionHandler, bestItem = nil",  buf,  2u);
    }

    v4[2](v4, 0LL, 0LL, 0.0);
  }
}

- (void)fetchAllNearbyAppSuggestions:(id)a3
{
  os_log_t v5 = (void (**)(id, id))a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  v5[2](v5, [v4 fetchMoreAppSuggestions]);
}

- (void)doDetermineBestAppSuggestions:(int64_t)a3 completionHandler:(id)a4
{
  os_log_t v5 = (void (**)(id, void *, void))a4;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v5) {
    v5[2](v5, v4, 0LL);
  }
}

- (void)doRemoveBestAppSuggestion:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  os_log_t v7 = sub_100039584(0LL);
  os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v38 description]);
    id v11 = sub_10005BF18(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543618;
    id v40 = v9;
    __int16 v41 = 2114;
    os_log_t v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "uuid=%{public}@ options=%{public}@", buf, 0x16u);
  }

  if (v6)
  {
    __int128 v13 = self;
    objc_sync_enter(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier userActivityInfoForUUID:](v13, "userActivityInfoForUUID:", v6));
    if (v14)
    {
      audit_token_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v13, "supressedUntil"));
      os_log_t v16 = (UABestAppUserActivityInfoSuppressionRecord *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v6]);

      if (v16)
      {
        os_log_t v17 = sub_100039584(0LL);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord description](v16, "description"));
          *(_DWORD *)buf = 138543875;
          id v40 = v20;
          __int16 v41 = 2113;
          os_log_t v42 = v14;
          __int16 v43 = 2114;
          v44 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Updating existing supression record for item %{public}@/%{private}@, %{public}@",  buf,  0x20u);
        }
      }

      else
      {
        os_log_t v16 = objc_alloc_init(&OBJC_CLASS___UABestAppUserActivityInfoSuppressionRecord);
      }

      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      -[UABestAppUserActivityInfoSuppressionRecord setItemUUID:](v16, "setItemUUID:", v22);

      os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v23 cornerActionItemSupressionInterval];
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
      -[UABestAppUserActivityInfoSuppressionRecord setHardSupressUntil:](v16, "setHardSupressUntil:", v24);

      os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v25 bestAppSuggestionSupressionIntervalForUnchangingItem];
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
      -[UABestAppUserActivityInfoSuppressionRecord setSupressUntil:](v16, "setSupressUntil:", v26);

      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v14 lastInterestingTime]);
      -[UABestAppUserActivityInfoSuppressionRecord setLastInterestingTime:](v16, "setLastInterestingTime:", v27);

      os_log_t v28 = sub_100039584(0LL);
      BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v37 UUIDString]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord hardSupressUntil](v16, "hardSupressUntil"));
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord supressUntil](v16, "supressUntil"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v14 lastInterestingTime]);
        *(_DWORD *)buf = 138544643;
        id v40 = v30;
        __int16 v41 = 2113;
        os_log_t v42 = v14;
        __int16 v43 = 2114;
        v44 = v31;
        __int16 v45 = 2114;
        v46 = v32;
        __int16 v47 = 2114;
        BOOL v48 = v33;
        __int16 v49 = 2114;
        v50 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Setting supressedUntil for item %{public}@/%{private}@ item.when=%{public}@ to %{public}@/%{public}@ lastInterestingTime=%{public}@",  buf,  0x3Eu);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v13, "supressedUntil"));
      [v35 setObject:v16 forKey:v6];

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](v13, "scheduler"));
      [v36 scheduleNext:0.0];
    }

    objc_sync_exit(v13);
  }
}

- (void)doLaunchFollowUp:(id)a3 interactionType:(unint64_t)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 cornerActionItemForUUID:v8]);

    if (v10)
    {
      os_log_t v11 = sub_100039584(@"Diagnostic");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int128 v13 = @"No";
        *(_DWORD *)buf = 138478339;
        __int128 v70 = v10;
        if (v5) {
          __int128 v13 = @"Yes";
        }
        __int16 v71 = 2048;
        unint64_t v72 = a4;
        __int16 v73 = 2114;
        __int16 v74 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "doLaunchFollowUp cornerActionItem: %{private}@, interactionType: %lx, cancelled: %{public}@",  buf,  0x20u);
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
      BOOL v15 = v14 == 0LL;

      if (v15)
      {
        os_log_t v16 = sub_100039584(@"Diagnostic");
        os_log_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Empty wasContinuedInfo, creating it",  buf,  2u);
        }

        v18 = objc_alloc_init(&OBJC_CLASS___UAUserActivityAnalyticsInfo);
        -[__CFString setWasContinuedInfo:](v10, "setWasContinuedInfo:", v18);

        os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v10, "activityType"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v20 setActivityType:v19];

        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString bundleIdentifier](v10, "bundleIdentifier"));
        os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v22 setBundleIdentifier:v21];

        id v23 = -[__CFString type](v10, "type");
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v24 setSuggestedActionType:v23];

        os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v10, "uuid"));
        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v26 setUuid:v25];
      }

      os_log_t v27 = sub_100039584(@"Diagnostic");
      os_log_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        unsigned int v30 = [v29 scheduledForSubmission];
        v31 = @"No";
        if (v30) {
          v31 = @"Yes";
        }
        *(_DWORD *)buf = 138543362;
        __int128 v70 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "WasContinuedInfo scheduledForSubmission: %{public}@",  buf,  0xCu);
      }

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
      unsigned __int8 v33 = [v32 scheduledForSubmission];

      if ((v33 & 1) == 0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v34 setScheduledForSubmission:1];

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v35 setInteractionType:a4];

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
        [v36 setCancelled:v5];

        os_log_t v37 = sub_100039584(@"Diagnostic");
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v10, "uuid"));
          id v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString wasContinuedInfo](v10, "wasContinuedInfo"));
          *(_DWORD *)buf = 138543619;
          __int128 v70 = v40;
          __int16 v71 = 2113;
          unint64_t v72 = (unint64_t)v41;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "-- Scheduling messagetracer info for submission: %{public}@, %{private}@",  buf,  0x16u);
        }

        dispatch_time_t v42 = dispatch_time(0LL, 90000000000LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000B708;
        block[3] = &unk_1000BCCA8;
        __int128 v65 = v10;
        dispatch_after(v42, &_dispatch_main_q, block);
      }

      if (!v5 && -[__CFString type](v10, "type") == (id)10)
      {
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString bundleIdentifier](v10, "bundleIdentifier"));
        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString bundleIdentifier](v10, "bundleIdentifier"));
          BOOL v45 = [v44 caseInsensitiveCompare:@"com.apple.AppStore"] == 0;

          if (v45)
          {
            uint64_t v46 = objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v10, "webpageURL"));
            __int128 v59 = (void *)v46;
            if (v46)
            {
              __int16 v47 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v46,  1LL);
              if (v47)
              {
                __int128 v62 = 0u;
                __int128 v63 = 0u;
                __int128 v60 = 0u;
                __int128 v61 = 0u;
                id v58 = v47;
                BOOL v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v47, "queryItems"));
                id v49 = [v48 countByEnumeratingWithState:&v60 objects:v68 count:16];
                if (v49)
                {
                  uint64_t v50 = *(void *)v61;
                  do
                  {
                    for (unint64_t i = 0LL; i != v49; unint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v61 != v50) {
                        objc_enumerationMutation(v48);
                      }
                      BOOL v52 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
                      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 name]);
                      if ([v53 isEqual:@"ids"])
                      {
                        id v54 = (void *)objc_claimAutoreleasedReturnValue([v52 value]);
                        BOOL v55 = v54 == 0LL;

                        if (!v55)
                        {
                          uint64_t v66 = _UAUserActivityDidContinueToAppStoreApplicationIdentifierKey;
                          BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v52 value]);
                          uint64_t v67 = v56;
                          id v49 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));

                          goto LABEL_39;
                        }
                      }

                      else
                      {
                      }
                    }

                    id v49 = [v48 countByEnumeratingWithState:&v60 objects:v68 count:16];
                  }

                  while (v49);
                }

- (void)doRegisterForBestAppChangeNotification
{
  os_log_t v3 = sub_100039584(0LL);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
    id v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v7, 0, sizeof(v7));
    }
    audit_token_t atoken = v7;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    *(_DWORD *)buf = 134349056;
    uint64_t v11 = pidp;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "doRegisterForBestAppChangeNotification, clientPid=%{public}ld",  buf,  0xCu);
  }

  -[UABestAppSuggestionNotifier setWantsBestAppChangedNotifications:](self, "setWantsBestAppChangedNotifications:", 1LL);
}

- (void)doUnregisterForBestAppChangeNotification
{
  os_log_t v3 = sub_100039584(0LL);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier connection](self, "connection"));
    id v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v7, 0, sizeof(v7));
    }
    audit_token_t atoken = v7;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    *(_DWORD *)buf = 134349056;
    uint64_t v11 = pidp;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "doUnregisterForBestAppChangeNotification, clientPid=%{public}ld",  buf,  0xCu);
  }

  -[UABestAppSuggestionNotifier setWantsBestAppChangedNotifications:](self, "setWantsBestAppChangedNotifications:", 0LL);
  -[UABestAppSuggestionNotifier setLastItemUUIDs:](self, "setLastItemUUIDs:", 0LL);
  -[UABestAppSuggestionNotifier setLastItemWhens:](self, "setLastItemWhens:", 0LL);
}

- (void)doQueueFetchOfPayloadForBestAppSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543362;
    os_log_t v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Queuing fetch for bestAppUUID %{public}@",  buf,  0xCu);
  }

  kdebug_trace(722141200LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier userActivityInfoForUUID:](self, "userActivityInfoForUUID:", v6));
  if (v11)
  {
    os_log_t v12 = sub_100039584(@"signposts");
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = v13;
    if (v11 != (void *)-1LL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v11,  "bestAppFetch",  (const char *)&unk_1000ABCB9,  buf,  2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000BD64;
    v15[3] = &unk_1000BCD10;
    id v16 = v11;
    id v17 = v7;
    [v16 requestPayloadWithCompletionHandler:v15];
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSMutableDictionary)supressedUntil
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSupressedUntil:(id)a3
{
}

- (UADispatchScheduler)scheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setScheduler:(id)a3
{
}

- (NSMutableDictionary)possibleItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPossibleItems:(id)a3
{
}

- (NSArray)lastItemUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setLastItemUUIDs:(id)a3
{
}

- (NSArray)lastItemWhens
{
  return (NSArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLastItemWhens:(id)a3
{
}

- (NSString)lastItemStr
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setLastItemStr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end