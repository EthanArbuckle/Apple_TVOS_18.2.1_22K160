@interface UAUserActivityClientProcess
- (BOOL)allowedToGetCurrentActivityInfo;
- (BOOL)allowedToMatchUserActivities;
- (BOOL)allowedToUseEligibleEvenWhenInBackground;
- (BOOL)allowedToUseLSAlwaysEligible;
- (BOOL)allowedToUseLSAlwaysPick;
- (BOOL)allowedToUseUAAlwaysAdvertise;
- (BOOL)askSourceProcessToUpdateActivityWithUUID:(id)a3 evenIfClean:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)clientIsSandboxed;
- (BOOL)clientIsSigned;
- (BOOL)didResumeUserActivityWithUUID:(id)a3 completionHandler:(id)a4;
- (BOOL)frontmost;
- (BOOL)isDirtyActivityWithUUID:(id)a3;
- (BOOL)isEligibleToAdvertiseWithUUID:(id)a3;
- (BOOL)isEligibleToAlwaysAdvertiseWithUUID:(id)a3;
- (BOOL)removeUserActivityAdvertiseableItemByUUID:(id)a3;
- (NSArray)uniqueIdentifiers;
- (NSDate)lastFrontTime;
- (NSMutableArray)pendingUpdateTasks;
- (NSMutableDictionary)userActivityAdvertisableItemsByUUID;
- (NSMutableSet)dirtyUUIDs;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)teamID;
- (NSString)teamIdentifier;
- (NSXPCConnection)connection;
- (OS_os_transaction)os_transaction;
- (UAAuditToken)auditToken;
- (UACornerActionManager)manager;
- (UAUserActivityAdvertisableItem)currentAdvertisableActivity;
- (UAUserActivityClientProcess)initWithController:(id)a3 connection:(id)a4;
- (UAUserActivityClientProcessesController)controller;
- (id)statusString;
- (id)userActivityAdvertisableItemByUUID:(id)a3;
- (unsigned)allowedToAccessAnyItem;
- (void)addUserActivity:(id)a3;
- (void)dispatchPendingTasksForUUID:(id)a3 error:(id)a4;
- (void)doAddDynamicUserActivity:(id)a3 matching:(id)a4;
- (void)doDeleteUserActivityWithUUID:(id)a3;
- (void)doDetermineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4;
- (void)doFetchUserActivityInfoWithUUID:(id)a3 completionHandler:(id)a4;
- (void)doGetCurrentUserActivityInfo:(id)a3;
- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doGetUserActivityProxiesWithOptions:(id)a3 completionHandler:(id)a4;
- (void)doInitializeWithClientVersion:(int64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5;
- (void)doMarkUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4 webpageURL:(id)a5 expiration:(id)a6 hasiCloudDocument:(BOOL)a7 hasUnsynchronizediCloudDoc:(BOOL)a8;
- (void)doPinUserActivityInfo:(id)a3 completionHandler:(id)a4;
- (void)doRegisterAsProxyApplicationForPid:(int)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doRemoveDynamicUserActivity:(id)a3 matching:(id)a4;
- (void)doUpdateUserActivityInfo:(id)a3 makeCurrent:(BOOL)a4 completionHandler:(id)a5;
- (void)doUpdateUserActivityWithUUID:(id)a3 setActive:(BOOL)a4;
- (void)invalidate;
- (void)removeUserActivity:(id)a3;
- (void)setAllowedToAccessAnyItem:(unsigned __int8)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLastFrontTime:(id)a3;
- (void)setManager:(id)a3;
- (void)setOs_transaction:(id)a3;
- (void)setPendingUpdateTasks:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setUserActivityAdvertisableItemsByUUID:(id)a3;
@end

@implementation UAUserActivityClientProcess

- (UAUserActivityClientProcess)initWithController:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 manager]);
  v108.receiver = self;
  v108.super_class = (Class)&OBJC_CLASS___UAUserActivityClientProcess;
  v10 = -[UACornerActionManagerHandler initWithManager:name:](&v108, "initWithManager:name:", v9, @"Application");

  if (!v10) {
    goto LABEL_45;
  }
  snprintf( __str,  0x80uLL,  "com.apple.coreservices.useractivity.client-connection.%d",  [v8 processIdentifier]);
  v11 = (void *)os_transaction_create(__str);
  -[UAUserActivityClientProcess setOs_transaction:](v10, "setOs_transaction:", v11);

  objc_storeStrong((id *)&v10->_controller, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 manager]);
  objc_storeWeak((id *)&v10->_manager, v12);

  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  userActivityAdvertisableItemsByUUID = v10->_userActivityAdvertisableItemsByUUID;
  v10->_userActivityAdvertisableItemsByUUID = v13;

  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  dirtyUUIDs = v10->_dirtyUUIDs;
  v10->_dirtyUUIDs = v15;

  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  pendingResumeActivityUUIDs = v10->_pendingResumeActivityUUIDs;
  v10->_pendingResumeActivityUUIDs = v17;

  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pendingUpdateTasks = v10->_pendingUpdateTasks;
  v10->_pendingUpdateTasks = v19;

  [v8 setExportedObject:v10];
  id v21 = sub_10003A518();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v8 setExportedInterface:v22];

  id v23 = sub_10003A71C();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v8 setRemoteObjectInterface:v24];

  *(void *)__str = 0LL;
  v118 = __str;
  uint64_t v119 = 0x3042000000LL;
  v120 = sub_100051DDC;
  v121 = sub_100051DE8;
  objc_initWeak(v122, v10);
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_100051DF0;
  v107[3] = &unk_1000BD728;
  v107[4] = __str;
  [v8 setInvalidationHandler:v107];
  objc_storeWeak((id *)&v10->_connection, v8);
  v25 = objc_alloc(&OBJC_CLASS___UAAuditToken);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
  v27 = v26;
  if (v26) {
    [v26 auditToken];
  }
  else {
    memset(v106, 0, sizeof(v106));
  }
  v28 = -[UAAuditToken initWithAuditToken:](v25, "initWithAuditToken:", v106);
  auditToken = v10->_auditToken;
  v10->_auditToken = v28;

  if (sub_100051F84(@"com.apple.security.app-sandbox"))
  {
    v10->_clientIsSandboxed = 1;
  }

  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](v10, "auditToken"));
    v10->_clientIsSandboxed = [v30 isSandboxed];
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
  uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 valueForEntitlement:@"com.apple.application-identifier"]);
  applicationIdentifier = v10->_applicationIdentifier;
  v10->_applicationIdentifier = (NSString *)v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 valueForEntitlement:@"useractivity-team-identifier"]);

  if (v35)
  {
    uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
    {
      os_log_t v37 = sub_100039584(0LL);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v10, "applicationIdentifier"));
        *(_DWORD *)buf = 138543618;
        *(void *)v110 = v35;
        *(_WORD *)&v110[8] = 2114;
        *(void *)&v110[10] = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "Using overridden team identifier %{public}@ for applicationIdentifier %{public}@",  buf,  0x16u);
      }

      id v40 = v35;
LABEL_18:
      v42 = v40;
      teamID = v10->_teamID;
      v10->_teamID = (NSString *)v40;
      goto LABEL_19;
    }
  }

  teamID = (NSString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
  v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSString valueForEntitlement:]( teamID,  "valueForEntitlement:",  @"com.apple.developer.team-identifier"));

  if (v42)
  {
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v42, v43);

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_20;
    }
    os_log_t v45 = sub_100039584(0LL);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v10, "applicationIdentifier"));
      *(_DWORD *)buf = 138543618;
      *(void *)v110 = v42;
      *(_WORD *)&v110[8] = 2114;
      *(void *)&v110[10] = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Using developer team identifier %{public}@ for applicationIdentifier %{public}@",  buf,  0x16u);
    }

    id v40 = v42;
    goto LABEL_18;
  }

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  -[UAUserActivityClientProcess setOs_transaction:](v2, "setOs_transaction:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v2, "connection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v2, "connection"));
    [v4 setExportedObject:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v2, "connection"));
    [v5 invalidate];

    objc_storeWeak((id *)&v2->_connection, 0LL);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess uniqueIdentifiers](v2, "uniqueIdentifiers"));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        os_log_t v11 = sub_100039584(0LL);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v19 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "removing %{public}@ userActivityInfoItem",  buf,  0xCu);
        }

        -[UAUserActivityClientProcess removeUserActivityAdvertiseableItemByUUID:]( v2,  "removeUserActivityAdvertiseableItemByUUID:",  v10);
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 removeObserver:v2 name:@"UAUserActivityDebugStateChanged" object:0];

  objc_sync_exit(v2);
}

- (id)userActivityAdvertisableItemByUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_userActivityAdvertisableItemsByUUID, "objectForKey:", v4));
  objc_sync_exit(v5);

  return v6;
}

- (NSArray)uniqueIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_userActivityAdvertisableItemsByUUID, "allKeys"));
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addUserActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = self;
    objc_sync_enter(v5);
    userActivityAdvertisableItemsByUUID = v5->_userActivityAdvertisableItemsByUUID;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
    -[NSMutableDictionary setObject:forKey:](userActivityAdvertisableItemsByUUID, "setObject:forKey:", v8, v7);

    objc_sync_exit(v5);
    id v4 = v8;
  }
}

- (void)removeUserActivity:(id)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([a3 uuid]);
    -[UAUserActivityClientProcess removeUserActivityAdvertiseableItemByUUID:]( self,  "removeUserActivityAdvertiseableItemByUUID:",  v4);
  }

- (BOOL)removeUserActivityAdvertiseableItemByUUID:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    *(_DWORD *)buf = 138543362;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", buf, 0xCu);
  }

  id v8 = self;
  objc_sync_enter(v8);
  -[NSMutableSet removeObject:](v8->_dirtyUUIDs, "removeObject:", v4);
  -[NSMutableSet removeObject:](v8->_pendingResumeActivityUUIDs, "removeObject:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( v8,  "userActivityAdvertisableItemByUUID:",  v4));
  if (!v9)
  {
    if (-[UAUserActivityClientProcess allowedToAccessAnyItem](v8, "allowedToAccessAnyItem"))
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](v8, "controller", 0LL));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 additionalUserActivityAdvertisableItems]);

      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v31;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uuid]);
            unsigned int v22 = [v21 isEqual:v4];

            if (v22)
            {
              os_log_t v23 = sub_100039584(0LL);
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue([0 uuid]);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v25 UUIDString]);
                v27 = (void *)objc_claimAutoreleasedReturnValue([0 logString]);
                *(_DWORD *)buf = 138543619;
                v35 = v26;
                __int16 v36 = 2113;
                os_log_t v37 = v27;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Removing item %{public}@/%{private}@ from additionalUserActivityAdvertisableItems",  buf,  0x16u);
              }

              v28 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](v8, "controller"));
              [v28 removeAdditionalUserActivityAdvertisableItems:v20];

              goto LABEL_25;
            }
          }

          id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

- (BOOL)isEligibleToAdvertiseWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
    if (v5)
    {
      v6 = (void *)v5;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      unsigned int v9 = [v8 isEqual:v4];

      if (v9)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( self,  "userActivityAdvertisableItemByUUID:",  v4));
        os_log_t v11 = v10;
        if (v10)
        {
          if (([v10 alwaysPick] & 1) != 0
            || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](self, "controller")),
                unsigned __int8 v13 = [v12 clientIsActive:self],
                v12,
                (v13 & 1) != 0)
            || (__int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 proxiedBundleIdentifier]),
                v14,
                v14)
            || -[UAUserActivityClientProcess allowedToUseLSAlwaysEligible](self, "allowedToUseLSAlwaysEligible")
            && ([v11 alwaysEligible] & 1) != 0)
          {
            unsigned __int8 v15 = 1;
LABEL_16:

            goto LABEL_10;
          }

          if (-[UAUserActivityClientProcess allowedToUseEligibleEvenWhenInBackground]( self,  "allowedToUseEligibleEvenWhenInBackground"))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( self,  "userActivityAdvertisableItemByUUID:",  v4));
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 options]);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:UAUserActivityEligibleEvenWhenInBackgroundKey]);
            unsigned __int8 v15 = [v19 BOOLValue];

            goto LABEL_16;
          }
        }

        unsigned __int8 v15 = 0;
        goto LABEL_16;
      }
    }
  }

  unsigned __int8 v15 = 0;
LABEL_10:

  return v15;
}

- (BOOL)isEligibleToAlwaysAdvertiseWithUUID:(id)a3
{
  id v4 = a3;
  if (-[UAUserActivityClientProcess allowedToUseUAAlwaysAdvertise](self, "allowedToUseUAAlwaysAdvertise"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( self,  "userActivityAdvertisableItemByUUID:",  v4));
    v6 = v5;
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 options]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:UAAlwaysAdvertise]);
      unsigned __int8 v9 = [v8 BOOLValue];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isDirtyActivityWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = -[NSMutableSet containsObject:](v5->_dirtyUUIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)askSourceProcessToUpdateActivityWithUUID:(id)a3 evenIfClean:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v53 = (void (**)(void))a5;
  os_log_t v9 = sub_100039584(0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
    *(_DWORD *)buf = 138543618;
    id v68 = v11;
    __int16 v69 = 2048;
    uint64_t v70 = (void *)(int)[v12 pid];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ from client %ld", buf, 0x16u);
  }

  unsigned __int8 v13 = self;
  objc_sync_enter(v13);
  if (a4) {
    unsigned __int8 v14 = 1;
  }
  else {
    unsigned __int8 v14 = -[NSMutableSet containsObject:](v13->_dirtyUUIDs, "containsObject:", v8);
  }
  unsigned int v15 = -[NSMutableSet containsObject:](v13->_pendingResumeActivityUUIDs, "containsObject:", v8);
  objc_sync_exit(v13);

  if ((v14 & 1) != 0)
  {
    if (!v15)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](v13, "auditToken"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v27 pid]));

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.coreservices.useractivityd",  @"ActivityAdvertising"));
      id v28 = objc_alloc(&OBJC_CLASS___RBSAssertion);
      v66 = v51;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
      id v30 = [v28 initWithExplanation:@"Allow process to update handoff payload" target:v52 attributes:v29];

      id v65 = 0LL;
      unsigned __int8 v31 = [v30 acquireWithError:&v65];
      id v49 = v65;
      if (v49) {
        unsigned __int8 v32 = 0;
      }
      else {
        unsigned __int8 v32 = v31;
      }
      if ((v32 & 1) == 0)
      {
        os_log_t v33 = sub_100039584(0LL);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Error acquiring RBSAssertion: %@",  buf,  0xCu);
        }
      }

      id WeakRetained = objc_loadWeakRetained((id *)&v13->_connection);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_1000535E8;
      v60[3] = &unk_1000BDE20;
      id v36 = v8;
      id v61 = v36;
      v62 = v13;
      os_log_t v37 = v53;
      v64 = v37;
      id v50 = v30;
      id v63 = v50;
      v38 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v60]);

      BOOL v26 = v38 != 0LL;
      if (v38)
      {
        v39 = v13;
        objc_sync_enter(v39);
        -[NSMutableSet addObject:](v13->_pendingResumeActivityUUIDs, "addObject:", v36);
        objc_sync_exit(v39);

        id v40 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( v39,  "userActivityAdvertisableItemByUUID:",  v36));
        os_log_t v41 = sub_100039584(0LL);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v36 UUIDString]);
          *(_DWORD *)buf = 138543362;
          id v68 = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Calling back to client to ask it to save activity %{public}@",  buf,  0xCu);
        }

        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472LL;
        v54[2] = sub_100053730;
        v54[3] = &unk_1000BDE48;
        id v55 = v36;
        id v56 = v40;
        v57 = v39;
        BOOL v59 = v37;
        id v58 = v50;
        id v44 = v40;
        [v38 askClientUserActivityToSave:v55 completionHandler:v54];
      }

      else
      {
        os_log_t v45 = sub_100039584(0LL);
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](v13, "bundleIdentifier"));
          *(_DWORD *)buf = 138543619;
          id v68 = v36;
          __int16 v69 = 2113;
          uint64_t v70 = v47;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Unable to call willSave for user activity %{public}@ for process %{private}@ because its owning process/conn ection seems to be gone.",  buf,  0x16u);
        }

        [v50 invalidate];
      }

      goto LABEL_32;
    }

    os_log_t v16 = sub_100039584(0LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      *(_DWORD *)buf = 138543362;
      id v68 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  " - A prepareToResume is already in progress for activity %{public}@, queuing callback for when fetch is complete",  buf,  0xCu);
    }

    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___UAUserActivityClientPendingUpdateTask);
    -[UAUserActivityClientPendingUpdateTask setUuid:](v19, "setUuid:", v8);
    -[UAUserActivityClientPendingUpdateTask setBlock:](v19, "setBlock:", v53);
    v20 = v13;
    objc_sync_enter(v20);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess pendingUpdateTasks](v20, "pendingUpdateTasks"));
    [v21 addObject:v19];

    objc_sync_exit(v20);
LABEL_15:
    BOOL v26 = 1;
LABEL_32:
    v25 = v53;
    goto LABEL_33;
  }

  os_log_t v22 = sub_100039584(0LL);
  os_log_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    *(_DWORD *)buf = 138543362;
    id v68 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  " - no need to call back to get updated info for activity %{public}@, because it is not dirty",  buf,  0xCu);
  }

  v25 = v53;
  if (v53)
  {
    v53[2]();
    goto LABEL_15;
  }

  BOOL v26 = 1;
LABEL_33:

  return v26;
}

- (BOOL)didResumeUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100053B0C;
  v15[3] = &unk_1000BD5C0;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v15]);

  os_log_t v11 = sub_100039584(0LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Telling client that user activity %{public}@ was resumed (on another device).",  buf,  0xCu);
  }

  [v10 tellClientUserActivityItWasResumed:v6];
  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }

  return 1;
}

- (void)dispatchPendingTasksForUUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess pendingUpdateTasks](v8, "pendingUpdateTasks"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100053E84;
  v23[3] = &unk_1000BDE70;
  id v11 = v6;
  id v24 = v11;
  id v12 = v7;
  id v25 = v12;
  unsigned __int8 v13 = v9;
  BOOL v26 = v13;
  [v10 enumerateObjectsUsingBlock:v23];

  if (-[NSMutableIndexSet count](v13, "count"))
  {
    os_log_t v14 = sub_100039584(0LL);
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = -[NSMutableIndexSet count](v13, "count");
      *(_DWORD *)buf = 134218242;
      id v28 = v16;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  " -- Called %lu pending fetch tasks for %{public}@, removing from queue",  buf,  0x16u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess pendingUpdateTasks](v8, "pendingUpdateTasks"));
    [v17 removeObjectsAtIndexes:v13];
  }

  else
  {
    os_log_t v18 = sub_100039584(0LL);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_INFO,  " -- No pending fetch tasks called for %{public}@",  buf,  0xCu);
    }
  }

  os_log_t v19 = sub_100039584(0LL);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess pendingUpdateTasks](v8, "pendingUpdateTasks"));
    id v22 = [v21 count];
    *(_DWORD *)buf = 134217984;
    id v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, " -- %lu remaining queued tasks total", buf, 0xCu);
  }

  objc_sync_exit(v8);
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
  id v4 = [v3 pid];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess uniqueIdentifiers](self, "uniqueIdentifiers"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"{"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) UUIDString]);
        [v7 appendFormat:@"%@ ", v13];
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  [v7 appendString:@"}"];
  os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UserActivityClient(pid=%d/%@ uuids=%@)",  v4,  v5,  v7));

  return (NSString *)v14;
}

- (void)doInitializeWithClientVersion:(int64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_autoreleasePoolPush();
  os_log_t v11 = sub_100039584(0LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
    if (self->_allowedToAccessAnyItem) {
      unsigned int v15 = @"YES";
    }
    else {
      unsigned int v15 = @"NO";
    }
    __int128 v16 = v10;
    id v17 = v9;
    if (self->_clientIsSandboxed) {
      __int128 v18 = @"YES";
    }
    else {
      __int128 v18 = @"NO";
    }
    id v33 = v8;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    id v20 = sub_10005BF18(v19);
    unsigned __int8 v32 = self;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 134219267;
    int64_t v35 = a3;
    __int16 v36 = 2114;
    os_log_t v37 = v13;
    __int16 v38 = 2113;
    v39 = v14;
    __int16 v40 = 2114;
    os_log_t v41 = v15;
    __int16 v42 = 2114;
    uint64_t v43 = v18;
    id v9 = v17;
    id v10 = v16;
    __int16 v44 = 2113;
    os_log_t v45 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CLIENT: version=%ld, %{public}@ %{private}@ any=%{public}@ sandbox=%{public}@ clientInfo=%{private}@",  buf,  0x3Eu);

    id v8 = v33;
    self = v32;
  }

  if (v8)
  {
    if (-[UAUserActivityClientProcess clientIsSandboxed](self, "clientIsSandboxed"))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 valueForEntitlement:@"com.apple.private.useractivity.allowedtosetbundleidentifier"]);
      unsigned int v24 = [v23 BOOLValue];

      if (v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));

        if (!v25)
        {
          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"CFBundleIdentifier"]);
          -[UAUserActivityClientProcess setBundleIdentifier:](self, "setBundleIdentifier:", v26);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](self, "applicationIdentifier", v32));

        if (!v27)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
          -[UAUserActivityClientProcess setApplicationIdentifier:](self, "setApplicationIdentifier:", v28);
LABEL_20:
        }
      }
    }

    else
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](self, "applicationIdentifier"));

      if (!v29)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"application-identifier"]);
        -[UAUserActivityClientProcess setApplicationIdentifier:](self, "setApplicationIdentifier:", v30);
      }

      unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier", v32));

      if (!v31)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"CFBundleIdentifier"]);
        -[UAUserActivityClientProcess setBundleIdentifier:](self, "setBundleIdentifier:", v28);
        goto LABEL_20;
      }
    }
  }

  (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 1LL, 0LL, 0LL);
  objc_autoreleasePoolPop(v10);
}

- (void)doDeleteUserActivityWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100039584(0LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "deleteUserActivity %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  if (v4) {
    -[UAUserActivityClientProcess removeUserActivityAdvertiseableItemByUUID:]( self,  "removeUserActivityAdvertiseableItemByUUID:",  v4);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)doAddDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v37 = v6;
    __int16 v38 = 2113;
    id v39 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "doAddDynamicUserActivity(%{private}@ %{private}@)",  buf,  0x16u);
  }

  if (v6 && v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
    os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@",  v10,  v7,  v6));

    id v12 = (void *)_LSCreateHashedBytesForAdvertisingFromString(1LL, v11);
    unsigned __int8 v13 = (void *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising(v12);
    if (v13)
    {
      os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v14,  v7));

      int64_t v35 = (void *)_LSCreateHashedBytesForAdvertisingFromString(1LL, v15);
      __int128 v16 = (void *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising(v35);
      if (v16
        && (id v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID")),
            v17,
            v17))
      {
        v34 = v12;
        __int128 v18 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
        __int128 v19 = -[NSUserDefaults initWithSuiteName:](v18, "initWithSuiteName:", kUADynamicUserActivitesPreferences);
        uint64_t v33 = kUADynamicUserActivitiesKey;
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v19, "objectForKey:"));
        id v21 = (NSMutableDictionary *)[v20 mutableCopy];

        if (!v21) {
          id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }
        v44[0] = kUADynamicUserActivityHashKey;
        v44[1] = kUADynamicUserActivityDynamicActivityKey;
        v45[0] = v16;
        v45[1] = v6;
        v44[2] = kUADynamicUserActivityTeamIDKey;
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
        v44[3] = kUADynamicUserActivityAppActivityKey;
        v45[2] = v22;
        v45[3] = v7;
        os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  4LL));

        -[NSMutableDictionary setValue:forKey:](v21, "setValue:forKey:", v23, v13);
        -[NSUserDefaults setValue:forKey:](v19, "setValue:forKey:", v21, v33);
        -[NSUserDefaults synchronize](v19, "synchronize");

        id v12 = v34;
      }

      else
      {
        os_log_t v25 = sub_100039584(0LL);
        __int128 v19 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
          v27 = v12;
          id v28 = (void *)v26;
          *(_DWORD *)buf = 138544130;
          id v37 = v6;
          __int16 v38 = 2114;
          id v39 = v7;
          __int16 v40 = 2114;
          uint64_t v41 = (uint64_t)v16;
          __int16 v42 = 2114;
          uint64_t v43 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "doAddDynamicUserActivity(%{public}@, %{public}@) failed, nil for hash %{public}@ or teamID %{public}@.",  buf,  0x2Au);

          id v12 = v27;
        }
      }
    }

    else
    {
      os_log_t v29 = sub_100039584(0LL);
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
        unsigned __int8 v31 = v12;
        unsigned __int8 v32 = (void *)v30;
        *(_DWORD *)buf = 138543874;
        id v37 = v6;
        __int16 v38 = 2114;
        id v39 = v7;
        __int16 v40 = 2114;
        uint64_t v41 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "doAddDynamicUserActivity, nil dynamicHash from (%{public}@, %{public}@, %{public}@).",  buf,  0x20u);

        id v12 = v31;
      }
    }
  }

  else
  {
    os_log_t v24 = sub_100039584(0LL);
    os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v37 = v6;
      __int16 v38 = 2114;
      id v39 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "doAddDynamicUserActivity(%{public}@, %{public}@) failed, nil for one param.",  buf,  0x16u);
    }
  }
}

- (void)doRemoveDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v43 = v6;
    __int16 v44 = 2113;
    id v45 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "doRemoveDynamicUserActivity(%{private}@ %{private}@)",  buf,  0x16u);
  }

  if (v7)
  {
    id v10 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    os_log_t v11 = -[NSUserDefaults initWithSuiteName:](v10, "initWithSuiteName:", kUADynamicUserActivitesPreferences);
    uint64_t v12 = kUADynamicUserActivitiesKey;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v11, "objectForKey:", kUADynamicUserActivitiesKey));
    id v14 = [v13 mutableCopy];

    if (v6)
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@",  v15,  v7,  v6));

      id v17 = (void *)_LSCreateHashedBytesForAdvertisingFromString(1LL, v16);
      __int128 v18 = (void *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising(v17);
      [v14 removeObjectForKey:v18];
      -[NSUserDefaults setValue:forKey:](v11, "setValue:forKey:", v14, v12);
      -[NSUserDefaults synchronize](v11, "synchronize");
    }

    else
    {
      uint64_t v34 = v12;
      int64_t v35 = v11;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v20 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v38;
        uint64_t v23 = kUADynamicUserActivityAppActivityKey;
        do
        {
          os_log_t v24 = 0LL;
          id v36 = v21;
          do
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v16);
            }
            os_log_t v25 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v24);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:v25]);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 valueForKey:v23]);
            if ([v7 isEqualToString:v27])
            {
              uint64_t v28 = v23;
              uint64_t v29 = v22;
              id v30 = v7;
              unsigned __int8 v31 = v16;
              os_log_t v32 = sub_100039584(0LL);
              uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                id v43 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  " - found %{public}@ activity, removing it.",  buf,  0xCu);
              }

              [v14 removeObjectForKey:v25];
              __int128 v16 = v31;
              id v7 = v30;
              uint64_t v22 = v29;
              uint64_t v23 = v28;
              id v21 = v36;
            }

            os_log_t v24 = (char *)v24 + 1;
          }

          while (v21 != v24);
          id v21 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }

        while (v21);
      }

      os_log_t v11 = v35;
      -[NSUserDefaults setValue:forKey:](v35, "setValue:forKey:", v14, v34);
      -[NSUserDefaults synchronize](v35, "synchronize");
      id v6 = 0LL;
    }
  }

  else
  {
    os_log_t v19 = sub_100039584(0LL);
    os_log_t v11 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "doRemoveDynamicUserActivity(%{public}@), nil appActivity",  buf,  0xCu);
    }
  }
}

- (void)doPinUserActivityInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, void *, void))a4;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](self, "connection"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.coreservices.canopenactivity"]);
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[__CFString setUuid:](v6, "setUuid:", v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
    [v12 setPinnedUserActivityInfoItem:v6];

    os_log_t v13 = sub_100039584(0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v6, "uuid"));
      __int128 v16 = (UAAuditToken *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
      *(_DWORD *)buf = 138543619;
      os_log_t v25 = v16;
      __int16 v26 = 2113;
      v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Pinned Activity Info: %{public}@/%{private}@",  buf,  0x16u);
    }

    v7[2](v7, v11, 0LL);
  }

  else
  {
    os_log_t v17 = sub_100039584(0LL);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      os_log_t v19 = objc_alloc(&OBJC_CLASS___UAAuditToken);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](self, "connection"));
      id v21 = v20;
      if (v20) {
        [v20 auditToken];
      }
      else {
        memset(v23, 0, sizeof(v23));
      }
      uint64_t v22 = -[UAAuditToken initWithAuditToken:](v19, "initWithAuditToken:", v23);
      *(_DWORD *)buf = 138543618;
      os_log_t v25 = v22;
      __int16 v26 = 2114;
      v27 = @"com.apple.private.coreservices.canopenactivity";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "*** Attempt to pin activity from process %{public}@, which doesn't have the %{public}@ entitlement.",  buf,  0x16u);
    }

    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -112LL,  0LL));
    ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v11);
  }
}

- (void)doGetCurrentUserActivityInfo:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void *, void *, void *))a3;
  if (!-[UAUserActivityClientProcess allowedToGetCurrentActivityInfo](self, "allowedToGetCurrentActivityInfo"))
  {
    os_log_t v15 = sub_100039584(0LL);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      os_log_t v17 = objc_alloc(&OBJC_CLASS___UAAuditToken);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](self, "connection"));
      os_log_t v19 = v18;
      if (v18) {
        [v18 auditToken];
      }
      else {
        memset(v33, 0, sizeof(v33));
      }
      os_log_t v25 = -[UAAuditToken initWithAuditToken:](v17, "initWithAuditToken:", v33);
      *(_DWORD *)buf = 138543618;
      __int128 v39 = v25;
      __int16 v40 = 2114;
      uint64_t v41 = @"com.apple.private.coreservices.cangetcurrentactivityinfo";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "*** Attempt to get current activity information from process %{public}@, which doesn't have the %{public}@ entitlement.",  buf,  0x16u);
    }

    os_log_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -112LL,  0LL));
    id v14 = 0LL;
LABEL_22:
    uint64_t v23 = 0LL;
    goto LABEL_23;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uaAdvertisableItemsInOrder]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (!v8)
  {
LABEL_10:

    id v14 = 0LL;
LABEL_18:
    os_log_t v24 = 0LL;
    goto LABEL_22;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v35;
LABEL_4:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v35 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___UAUserActivityAdvertisableItem);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  id v14 = v12;

  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___UAUserActivityAdvertisableItem);
  if ((objc_opt_isKindOfClass(v14, v20) & 1) == 0) {
    goto LABEL_18;
  }
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 client]);
  uint64_t v22 = v21;
  if (v21) {
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);
  }
  else {
    uint64_t v23 = 0LL;
  }

  os_log_t v24 = 0LL;
LABEL_23:
  os_log_t v26 = sub_100039584(0LL);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    uint64_t v29 = (UAAuditToken *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
    *(_DWORD *)buf = 138543875;
    __int128 v39 = v29;
    __int16 v40 = 2113;
    uint64_t v41 = v23;
    __int16 v42 = 2114;
    id v43 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "result=%{public}@ %{private}@ error=%{public}@",  buf,  0x20u);
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
  unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue([v14 activityType]);
  os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([v14 dynamicActivityType]);
  v4[2](v4, v30, v31, v32, v23, v24);
}

- (void)doGetUserActivityProxiesWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  id v43 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  os_log_t v8 = sub_100039584(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    id v11 = sub_10005BF18(v10);
    uint64_t v12 = (UAAuditToken *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543362;
    v52 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "doGetUserActivityProxiesWithOptions:%{public}@",  buf,  0xCu);
  }

  if (-[UAUserActivityClientProcess allowedToMatchUserActivities](self, "allowedToMatchUserActivities"))
  {
    uint64_t v41 = v7;
    id v42 = v6;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 advertiseableItems]);

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v46;
      p_cache = &OBJC_METACLASS___UAActivityReplayReceiver.cache;
      id v20 = v15;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v46 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          uint64_t v23 = objc_opt_class(p_cache + 498);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          {
            os_log_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 client]);
            os_log_t v25 = v24;
            if (v24) {
              os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
            }
            else {
              os_log_t v26 = 0LL;
            }
            id v27 = objc_alloc(&OBJC_CLASS___UAUserActivityProxy);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v22 uuid]);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v22 activityType]);
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v22 dynamicActivityType]);
            id v31 = [v27 initWithUUID:v28 activityType:v29 dynamicActivityType:v30 bundleID:v26];

            -[NSMutableArray addObject:](v43, "addObject:", v31);
            id v15 = v20;
            p_cache = (void **)(&OBJC_METACLASS___UAActivityReplayReceiver + 16);
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }

      while (v17);
    }

    os_log_t v32 = 0LL;
    id v7 = v41;
    id v6 = v42;
  }

  else
  {
    os_log_t v33 = sub_100039584(0LL);
    __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int128 v35 = objc_alloc(&OBJC_CLASS___UAAuditToken);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](self, "connection"));
      __int128 v37 = v36;
      if (v36) {
        [v36 auditToken];
      }
      else {
        memset(v44, 0, sizeof(v44));
      }
      __int128 v38 = -[UAAuditToken initWithAuditToken:](v35, "initWithAuditToken:", v44);
      *(_DWORD *)buf = 138543618;
      v52 = v38;
      __int16 v53 = 2114;
      BOOL v54 = @"com.apple.private.coreservices.allowedToMatchUserActivities";
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "*** Attempt to get current activity information from process %{public}@, which doesn't have the %{public}@ entitlement.",  buf,  0x16u);
    }

    uint64_t v39 = UAContinuityErrorDomain;
    id v49 = @"entitlement";
    id v50 = @"com.apple.private.coreservices.allowedToMatchUserActivities";
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v39,  -135LL,  v15));
  }

  id v40 = -[NSMutableArray copy](v43, "copy");
  v7[2](v7, v40, v32);
}

- (void)doDetermineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = (UAAuditToken *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543362;
    __int128 v48 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "doDetermineIfUserActivityIsCurrent: uuid=%{public}@",  buf,  0xCu);
  }

  if (!-[UAUserActivityClientProcess allowedToGetCurrentActivityInfo](self, "allowedToGetCurrentActivityInfo"))
  {
    os_log_t v21 = sub_100039584(0LL);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_alloc(&OBJC_CLASS___UAAuditToken);
      os_log_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](self, "connection"));
      os_log_t v25 = v24;
      if (v24)
      {
        [v24 auditToken];
      }

      else
      {
        __int128 v41 = 0u;
        __int128 v42 = 0u;
      }

      uint64_t v39 = -[UAAuditToken initWithAuditToken:](v23, "initWithAuditToken:", &v41);
      *(_DWORD *)buf = 138543618;
      __int128 v48 = v39;
      __int16 v49 = 2114;
      id v50 = @"com.apple.private.coreservices.cangetcurrentactivityinfo";
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "*** Attempt to determineIfUserActivityIsCurrent from process %{public}@, which doesn't have the %{public}@ entitlement.",  buf,  0x16u);
    }

    uint64_t v19 = UAContinuityErrorDomain;
    uint64_t v20 = -112LL;
LABEL_26:
    os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  v20,  0LL,  v41,  v42));
    (*((void (**)(id, void, void, void, void, void *))v7 + 2))(v7, 0LL, 0LL, 0LL, 0LL, v26);
    uint64_t v12 = v6;
LABEL_30:

    goto LABEL_31;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clients]);

  id v13 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v44;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(__CFString **)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v18 = objc_claimAutoreleasedReturnValue(-[__CFString userActivityInfoForUUID:](v17, "userActivityInfoForUUID:", v6));
        if (v18)
        {
          os_log_t v26 = (void *)v18;
          os_log_t v27 = sub_100039584(0LL);
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v29 = (UAAuditToken *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
            *(_DWORD *)buf = 138543875;
            __int128 v48 = v29;
            __int16 v49 = 2114;
            id v50 = v17;
            __int16 v51 = 2113;
            v52 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "doDetermineIfUserActivityIsCurrent: Found uuid=%{public}@, in client %{public}@ as %{private}@",  buf,  0x20u);
          }

          uint64_t v30 = objc_opt_class(&OBJC_CLASS___UAUserActivityClientProcessesController);
          if ((objc_opt_isKindOfClass(v17, v30) & 1) != 0)
          {
            id v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userActivityClientForUUID:](v17, "userActivityClientForUUID:", v6));
            os_log_t v32 = v31;
            if (v31)
            {
              os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 currentAdvertisableActivity]);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uuid]);
              uint64_t v35 = (uint64_t)[v34 isEqual:v6];

              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleIdentifier]);
              __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v32 auditToken]);
              id v38 = [v37 pid];
            }

            else
            {
              id v38 = 0LL;
              __int128 v36 = 0LL;
              uint64_t v35 = 1LL;
            }
          }

          else
          {
            id v38 = 0LL;
            __int128 v36 = 0LL;
            uint64_t v35 = 1LL;
          }

          id v40 = (void *)objc_claimAutoreleasedReturnValue([v26 activityType]);
          (*((void (**)(id, uint64_t, void *, id, void *, void))v7 + 2))(v7, v35, v36, v38, v40, 0LL);

          goto LABEL_30;
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (v6)
  {
    uint64_t v19 = UAContinuityErrorDomain;
    uint64_t v20 = -108LL;
    goto LABEL_26;
  }

- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -1LL,  0LL));
    (*((void (**)(id, void, id))a5 + 2))(v6, 0LL, v7);
  }

- (void)doFetchUserActivityInfoWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = objc_autoreleasePoolPush();
  os_log_t v9 = sub_100039584(0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543362;
    id v50 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "doFetchUserActivityInfoWithUUID:(%{public}@)",  buf,  0xCu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( self,  "userActivityAdvertisableItemByUUID:",  v6));
  if (v12)
  {
    id v13 = v12;
    if ([v12 isDirty])
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_100056164;
      v46[3] = &unk_1000BDE98;
      id v14 = (void (**)(id, void, void *))v7;
      id v48 = v14;
      id v13 = v13;
      id v47 = v13;
      if (([v13 requestPayloadWithCompletionHandler:v46] & 1) == 0)
      {
        os_log_t v15 = sub_100039584(0LL);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  " -- Could not update activityInfo for fetch",  buf,  2u);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -133LL,  0LL));
        v14[2](v14, 0LL, v17);
      }

      uint64_t v18 = v48;
LABEL_21:

      goto LABEL_24;
    }

    id v29 = [v13 copy];
LABEL_23:
    uint64_t v30 = v29;
    (*((void (**)(id, id, void))v7 + 2))(v7, v29, 0LL);

    goto LABEL_24;
  }

  if ((-[UAUserActivityClientProcess allowedToAccessAnyItem](self, "allowedToAccessAnyItem")
     || -[UAUserActivityClientProcess allowedToGetCurrentActivityInfo](self, "allowedToGetCurrentActivityInfo"))
    && (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](self, "controller")),
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userActivityInfoForUUID:v6]),
        v19,
        v20)
    || (os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager")),
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v21 cornerActionItemForUUID:v6]),
        v21,
        v20))
  {
    os_log_t v22 = sub_100039584(0LL);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      *(_DWORD *)buf = 138543362;
      id v50 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "-- activity with uuid %{public}@, so fetching payload for it.",  buf,  0xCu);
    }

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000561D0;
    v42[3] = &unk_1000BDEC0;
    id v43 = v6;
    id v13 = v20;
    id v44 = v13;
    id v25 = v7;
    id v45 = v25;
    if (([v13 requestPayloadWithCompletionHandler:v42] & 1) == 0)
    {
      os_log_t v26 = sub_100039584(0LL);
      os_log_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  " -- Could not update activityInfo for fetch",  buf,  2u);
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -133LL,  0LL));
      (*((void (**)(id, void, void *))v25 + 2))(v25, 0LL, v28);
    }

    uint64_t v18 = v43;
    goto LABEL_21;
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
  os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 pinnedUserActivityInfoItem]);
  os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 uuid]);
  unsigned int v34 = [v33 isEqual:v6];

  if (v34)
  {
    os_log_t v35 = sub_100039584(0LL);
    __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 pinnedUserActivityInfoItem]);
      *(_DWORD *)buf = 138477827;
      id v50 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  " -- Sending Pinned userActivityInfo back to client: %{private}@",  buf,  0xCu);
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
    id v29 = (id)objc_claimAutoreleasedReturnValue([v13 pinnedUserActivityInfoItem]);
    goto LABEL_23;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -106LL,  0LL));
  os_log_t v39 = sub_100039584(0LL);
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543618;
    id v50 = v41;
    __int16 v51 = 2114;
    id v52 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Activity with uuid %{public}@ fetch requested, but was neither a locally created item nor a corner action item, so returning error %{public}@",  buf,  0x16u);
  }

  (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v13);
LABEL_24:

  objc_autoreleasePoolPop(v8);
}

- (void)doUpdateUserActivityInfo:(id)a3 makeCurrent:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v115 = a4;
  id v7 = (__CFString *)a3;
  os_log_t v8 = (void (**)(id, void *))a5;
  context = objc_autoreleasePoolPush();
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v117 = [v9 debugCrossoverAllActivities];

  os_log_t v10 = sub_100039584(0LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v115) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v7, "uuid"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    *(_DWORD *)buf = 138543875;
    uint64_t v119 = v12;
    __int16 v120 = 2114;
    v121 = v14;
    __int16 v122 = 2113;
    v123 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "doUpdateUserActivityInfo: makeCurrent=%{public}@ newInfo = %{public}@/%{private}@",  buf,  0x20u);
  }

  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v7, "uuid"));
  id v16 = (UAUserActivityAdvertisableItem *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( self,  "userActivityAdvertisableItemByUUID:",  v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[__CFString setWhen:](v7, "setWhen:", v17);

  unsigned int v116 = self;
  if (v16)
  {
    uint64_t v18 = 0LL;
    LOBYTE(v19) = 0;
    goto LABEL_33;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v7, "activityType"));

  if (!v20)
  {
    os_log_t v29 = sub_100039584(0LL);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
      os_log_t v32 = (const __CFString *)(int)[v31 pid];
      os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
      *(_DWORD *)buf = 134218243;
      uint64_t v119 = v32;
      __int16 v120 = 2113;
      v121 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "The application with pid %ld/%{private}@ didn't provide a activityType.",  buf,  0x16u);
    }

    uint64_t v34 = UAContinuityErrorDomain;
    uint64_t v35 = -102LL;
    goto LABEL_18;
  }

  os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
  if (!v21)
  {
    os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](self, "applicationIdentifier"));
    if (([v21 hasPrefix:@"com.apple."] & 1) == 0)
    {
      unsigned int v36 = -[UAUserActivityClientProcess clientIsSandboxed](self, "clientIsSandboxed");

      if (!v36) {
        goto LABEL_12;
      }
      os_log_t v37 = sub_100039584(0LL);
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
        id v40 = (const __CFString *)(int)[v39 pid];
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
        if (v41) {
          __int128 v42 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
        }
        else {
          __int128 v42 = @"NULL";
        }
        *(_DWORD *)buf = 134218243;
        uint64_t v119 = v40;
        __int16 v120 = 2113;
        v121 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "The application with pid %ld/%{private}@ doesn't have a team identifier in its application-identifier, or isn' t from com.apple., and is sandboxed, so unable to proceed.",  buf,  0x16u);
        if (v41) {
      }
        }

      uint64_t v34 = UAContinuityErrorDomain;
      uint64_t v35 = -101LL;
LABEL_18:
      uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v34,  v35,  0LL));
      id v16 = 0LL;
      goto LABEL_28;
    }
  }

LABEL_12:
  os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](self, "teamID"));
  os_log_t v23 = sub_100039584(0LL);
  os_log_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = v8;
    os_log_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
    os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
    if (v27) {
      uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
    }
    else {
      uint64_t v28 = @"NULL";
    }
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v7, "activityType"));
    *(_DWORD *)buf = 138544131;
    uint64_t v119 = v26;
    __int16 v120 = 2113;
    v121 = v22;
    __int16 v122 = 2113;
    v123 = v28;
    __int16 v124 = 2113;
    v125 = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Application %{public}@ is registering an activity with teamID %{private}@ bundleID=%{private}@ activityType=%{private}@",  buf,  0x2Au);

    if (v27) {
    os_log_t v8 = v25;
    }
  }

  id v16 = -[UAUserActivityAdvertisableItem initWithUserActivityInfo:client:]( objc_alloc(&OBJC_CLASS___UAUserActivityAdvertisableItem),  "initWithUserActivityInfo:client:",  v7,  self);
  -[UAUserActivityAdvertisableItem setTeamIdentifier:](v16, "setTeamIdentifier:", v22);
  id v44 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
  -[UAUserActivityAdvertisableItem setBundleIdentifier:](v16, "setBundleIdentifier:", v44);

  -[UAUserActivityClientProcess addUserActivity:](self, "addUserActivity:", v16);
  uint64_t v18 = 0LL;
LABEL_28:
  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v7, "options"));
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"]);

  LODWORD(v19) = v46 != 0LL;
  if (v46)
  {
    __int16 v113 = v8;
    os_log_t v47 = sub_100039584(0LL);
    id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
      id v50 = (__CFString *)objc_claimAutoreleasedReturnValue([v49 UUIDString]);
      __int16 v51 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem logString](v16, "logString"));
      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v7, "options"));
      __int16 v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"]);
      *(_DWORD *)buf = 138543875;
      uint64_t v119 = v50;
      __int16 v120 = 2113;
      v121 = v51;
      __int16 v122 = 2114;
      v123 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "Application item %{public}@/%{private}@ has a proxy %{public}@, so forcing an advertisement update.",  buf,  0x20u);

      self = v116;
    }

    os_log_t v8 = v113;
  }

  if (!v16)
  {
    os_log_t v81 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](self, "controller"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v7, "uuid"));
    unsigned int v83 = (void *)objc_claimAutoreleasedReturnValue([v81 userActivityInfoForUUID:v82]);

    if (v83) {
      uint64_t v84 = -107LL;
    }
    else {
      uint64_t v84 = -108LL;
    }
    uint64_t v112 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  v84,  0LL));

    id v16 = 0LL;
    uint64_t v18 = (__CFString *)v112;
    if (!v112) {
      goto LABEL_74;
    }
    goto LABEL_71;
  }

- (void)doUpdateUserActivityWithUUID:(id)a3 setActive:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  os_log_t v8 = sub_100039584(0LL);
  os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    id v11 = @"NO";
    *(_DWORD *)buf = 138543875;
    __int128 v46 = v10;
    if (v4) {
      id v11 = @"YES";
    }
    __int16 v47 = 2113;
    id v48 = self;
    __int16 v49 = 2114;
    id v50 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "doUpdateUserActivityWithUUID(%{public}@/%{private}@, current=%{public}@)",  buf,  0x20u);
  }

  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue( -[UAUserActivityClientProcess userActivityAdvertisableItemByUUID:]( self,  "userActivityAdvertisableItemByUUID:",  v6));
  if (v12)
  {
    id v43 = v7;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
    id v44 = v6;
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
      os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v12, "uuid"));
      unsigned int v17 = [v15 isEqual:v16];

      if (v17 == v4)
      {
        LODWORD(v13) = 0;
        int v18 = 0;
        goto LABEL_20;
      }
    }

    else
    {
      unsigned int v17 = 0;
      int v18 = 0;
      if ((v4 & 1) == 0) {
        goto LABEL_20;
      }
    }

    if ((-[__CFString alwaysPick](v12, "alwaysPick") & 1) != 0)
    {
      LODWORD(v13) = 1;
    }

    else
    {
      os_log_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](self, "controller"));
      LODWORD(v13) = [v24 clientIsActive:self];
    }

    int v18 = 1;
LABEL_20:
    os_log_t v25 = sub_100039584(0LL);
    os_log_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v12, "uuid"));
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 UUIDString]);
      uint64_t v30 = (void *)v29;
      id v31 = &stru_1000BE738;
      *(_DWORD *)buf = 138544387;
      __int128 v46 = v27;
      if (v17) {
        id v31 = @"(already current)";
      }
      os_log_t v32 = @".";
      __int16 v47 = 2114;
      __int16 v49 = 2113;
      id v48 = (UAUserActivityClientProcess *)v29;
      id v50 = v12;
      __int16 v51 = 2114;
      if ((_DWORD)v13) {
        os_log_t v32 = @", and updating advertisment.";
      }
      id v52 = v31;
      __int16 v53 = 2114;
      BOOL v54 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Checking if the current item for %{public}@ is changed, %{public}@/%{private}@ %{public}@%{public}@",  buf,  0x34u);
    }

    os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[__CFString setWhen:](v12, "setWhen:", v33);

    if (((v4 ^ 1 | v17) & 1) != 0)
    {
      id v7 = v43;
      if (!v18) {
        goto LABEL_33;
      }
      os_log_t v34 = sub_100039584(0LL);
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
        *(_DWORD *)buf = 138543362;
        __int128 v46 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Triggering the update of the advertisable items because the current status of our application, %{public}@, has changed.",  buf,  0xCu);
      }

      currentAdvertisableActivity = self->_currentAdvertisableActivity;
      self->_currentAdvertisableActivity = 0LL;
      LODWORD(v13) = 1;
    }

    else
    {
      id v38 = v12;
      currentAdvertisableActivity = self->_currentAdvertisableActivity;
      self->_currentAdvertisableActivity = v38;
      id v7 = v43;
    }

LABEL_33:
    os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    if ([v39 debugCrossoverAllActivities])
    {

      id v6 = v44;
    }

    else
    {
      BOOL v40 = sub_10005C3C4((uint64_t)-[__CFString type](v12, "type"));

      id v6 = v44;
      if (v40) {
        goto LABEL_37;
      }
    }

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
    [v41 scheduleBestAppDetermination];

LABEL_37:
    if ((_DWORD)v13)
    {
LABEL_38:
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
      [v42 scheduleUpdatingAdvertisableItems];

      goto LABEL_39;
    }

    goto LABEL_39;
  }

  if (!v6)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));

    if (v19)
    {
      if (v4)
      {
        os_log_t v20 = sub_100039584(0LL);
        os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
          *(_DWORD *)buf = 138543362;
          __int128 v46 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Triggering the update of the advertisable items because uuid == nil, for application %{public}@, has changed.",  buf,  0xCu);
        }

        os_log_t v23 = self->_currentAdvertisableActivity;
        self->_currentAdvertisableActivity = 0LL;

        goto LABEL_38;
      }
    }
  }

- (void)doMarkUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4 webpageURL:(id)a5 expiration:(id)a6 hasiCloudDocument:(BOOL)a7 hasUnsynchronizediCloudDoc:(BOOL)a8
{
  BOOL v79 = a8;
  BOOL v80 = a4;
  BOOL v81 = a7;
  id v86 = a3;
  id v84 = a5;
  id v83 = a6;
  context = objc_autoreleasePoolPush();
  os_log_t v11 = sub_100039584(0LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v86 UUIDString]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](self, "auditToken"));
    os_log_t v15 = @"NO";
    *(_DWORD *)buf = 138544898;
    char v93 = v13;
    __int16 v94 = 2114;
    v95 = v14;
    if (v80) {
      os_log_t v15 = @"YES";
    }
    if (v84) {
      id v16 = @"private";
    }
    else {
      id v16 = @"-";
    }
    __int16 v96 = 2114;
    v97 = v15;
    unsigned int v17 = " iCloudDoc";
    if (!v81) {
      unsigned int v17 = "";
    }
    __int16 v98 = 2114;
    v99 = v16;
    __int16 v100 = 2114;
    id v101 = v83;
    __int16 v102 = 2082;
    v103 = v17;
    if (v79) {
      int v18 = " unSynchronizediCloudDoc";
    }
    else {
      int v18 = "";
    }
    __int16 v104 = 2082;
    v105 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "doMarkUserActivityAsDirty(%{public}@) for app %{public}@ forceImmediate=%{public}@ webpageURL=%{public}@ expiratio n=%{public}@%{public}s%{public}s",  buf,  0x48u);
  }

  uint64_t v19 = self;
  objc_sync_enter(v19);
  -[NSMutableSet addObject:](v19->_dirtyUUIDs, "addObject:", v86);
  objc_sync_exit(v19);
  p_isa = (id *)&v19->super.super.isa;

  os_log_t v20 = sub_100039584(0LL);
  os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess dirtyUUIDs](v19, "dirtyUUIDs"));
    v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v78 count]));
    id v22 = (id)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess dirtyUUIDs](v19, "dirtyUUIDs"));
    os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"{"));
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    id v24 = v22;
    id v25 = [v24 countByEnumeratingWithState:&v88 objects:buf count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v89;
      uint64_t v27 = 10LL;
LABEL_16:
      uint64_t v28 = 0LL;
      while (1)
      {
        if (*(void *)v89 != v26) {
          objc_enumerationMutation(v24);
        }
        if ((v27 & ~(v27 >> 63)) == v28) {
          break;
        }
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v88 + 1) + 8 * v28) UUIDString]);
        [v23 appendFormat:@"%@ ", v29];

        if (v25 == (id)++v28)
        {
          id v25 = [v24 countByEnumeratingWithState:&v88 objects:buf count:16];
          v27 -= v28;
          if (v25) {
            goto LABEL_16;
          }
          break;
        }
      }
    }

    [v23 appendString:@"}"];
    *(_DWORD *)buf = 138543618;
    char v93 = v77;
    __int16 v94 = 2114;
    v95 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  " -- dirty activities for this client: (%{public}@) %{public}@",  buf,  0x16u);
  }

  uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue([p_isa userActivityAdvertisableItemByUUID:v86]);
  if (v30)
  {
    id WeakRetained = objc_loadWeakRetained(p_isa + 10);
    os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained uaAdvertisableItemsInOrder]);
    unsigned int v33 = [v32 containsObject:v30];

    if (v33)
    {
      os_log_t v34 = sub_100039584(0LL);
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v86 UUIDString]);
        *(_DWORD *)buf = 138543362;
        char v93 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  " -- Updating the user activity, because it's the currently advertised item, to let the server know it should(maybe) re-fetch the payload: %{public}@",  buf,  0xCu);
      }

      os_log_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v30, "webpageURL"));
      id v38 = v37;
      if (v84)
      {
        if (([v84 isEqual:v37] & 1) == 0)
        {

          -[__CFString setWebpageURL:](v30, "setWebpageURL:", v84);
          goto LABEL_38;
        }
      }

      else
      {
        BOOL v39 = v37 == 0LL;

        if (v39) {
          goto LABEL_43;
        }
      }

      BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v30, "webpageURL"));
      if (!v40)
      {

        if (v84)
        {

          -[__CFString setWebpageURL:](v30, "setWebpageURL:", v84);
        }

        else
        {
          -[__CFString setWebpageURL:](v30, "setWebpageURL:", 0LL);
        }

        goto LABEL_43;
      }

      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v30, "webpageURL"));
      unsigned __int8 v42 = [v41 isEqual:v84];

      if (v84)
      {

        -[__CFString setWebpageURL:](v30, "setWebpageURL:", v84);
      }

      else
      {
        -[__CFString setWebpageURL:](v30, "setWebpageURL:", 0LL);
      }

      if ((v42 & 1) != 0)
      {
LABEL_43:
        __int16 v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString expirationDate](v30, "expirationDate"));
        id v52 = v51;
        if (v83)
        {
          if (([v83 isEqual:v51] & 1) == 0)
          {

            -[__CFString setExpirationDate:](v30, "setExpirationDate:", v83);
            goto LABEL_54;
          }
        }

        else
        {
          BOOL v53 = v51 == 0LL;

          if (v53) {
            goto LABEL_57;
          }
        }

        BOOL v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString expirationDate](v30, "expirationDate"));
        if (!v54)
        {

          if (v83)
          {

            -[__CFString setExpirationDate:](v30, "setExpirationDate:", v83);
          }

          else
          {
            -[__CFString setExpirationDate:](v30, "setExpirationDate:", 0LL);
          }

          goto LABEL_57;
        }

        id v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString expirationDate](v30, "expirationDate"));
        unsigned __int8 v56 = [v55 isEqual:v83];

        if (v83)
        {

          -[__CFString setExpirationDate:](v30, "setExpirationDate:", v83);
        }

        else
        {
          -[__CFString setExpirationDate:](v30, "setExpirationDate:", 0LL);
        }

        if ((v56 & 1) != 0)
        {
LABEL_57:
          uint64_t v60 = objc_claimAutoreleasedReturnValue(-[__CFString options](v30, "options"));
          id v61 = (void *)v60;
          if (v81)
          {
            if (v60)
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v30, "options"));
              id v63 = [v62 mutableCopy];
            }

            else
            {
              id v63 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            }

            [v63 setObject:&__kCFBooleanTrue forKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
            if (v79) {
              id v68 = &__kCFBooleanTrue;
            }
            else {
              id v68 = &__kCFBooleanFalse;
            }
            [v63 setObject:v68 forKeyedSubscript:_LSUserActivityContainsUnsynchronizedCloudDocsKey];
            id v69 = [v63 copy];
            -[__CFString setOptions:](v30, "setOptions:", v69);

            goto LABEL_72;
          }

          if (v60)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v30, "options"));
            uint64_t v65 = _UAUserActivityContainsCloudDocsKey;
            unsigned __int8 v66 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:_UAUserActivityContainsCloudDocsKey]);
            if (v66)
            {

              uint64_t v67 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
              goto LABEL_69;
            }

            uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v30, "options"));
            uint64_t v67 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
            v71 = (void *)objc_claimAutoreleasedReturnValue( [v70 objectForKeyedSubscript:_LSUserActivityContainsUnsynchronizedCloudDocsKey]);
            BOOL v72 = v71 == 0LL;

            if (!v72)
            {
LABEL_69:
              uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v30, "options"));
              id v63 = [v73 mutableCopy];

              [v63 removeObjectForKey:v65];
              [v63 removeObjectForKey:v67];
              if ([v63 count])
              {
                id v74 = [v63 copy];
                -[__CFString setOptions:](v30, "setOptions:", v74);
              }

              else
              {
                -[__CFString setOptions:](v30, "setOptions:", 0LL);
              }

- (void)doRegisterAsProxyApplicationForPid:(int)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  os_log_t v9 = (void (**)(id, void))a5;
  os_log_t v10 = sub_100039584(0LL);
  os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67240450;
    v13[1] = v6;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "doRegisterAsProxyApplicationForPid, pid=%{public}d options=%{public}@",  (uint8_t *)v13,  0x12u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess controller](self, "controller"));
  [v12 registerAsProxyApplication:self forPid:v6];

  v9[2](v9, 0LL);
}

- (id)statusString
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](self, "bundleIdentifier"));
  id v51 = (id)-[UAAuditToken pid](self->_auditToken, "pid");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
  if (v4)
  {
    os_log_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
    unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v45 uuid]);
    __int16 v47 = (const __CFString *)objc_claimAutoreleasedReturnValue([v44 UUIDString]);
  }

  else
  {
    __int16 v47 = @"-";
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
  uint64_t v6 = &stru_1000BE738;
  id v48 = (void *)v3;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess dirtyUUIDs](self, "dirtyUUIDs"));
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
    unsigned __int8 v42 = v7;
    BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v41 uuid]);
  }

  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v46 proxiedBundleIdentifier]);
  if (v8)
  {
    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v39 proxiedBundleIdentifier]);
    obj = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"proxyAs=%@ ",  v38));
  }

  else
  {
    obj = &stru_1000BE738;
  }

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess lastFrontTime](self, "lastFrontTime"));
  if (v9)
  {
    id v43 = v5;
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess lastFrontTime](self, "lastFrontTime"));
    os_log_t v11 = sub_1000758E0(v10);
    uint64_t v12 = v4;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" lastFront=%@",  v13));
    id v15 = v48;
    unsigned int v36 = v6;
    id v16 = (__CFString *)v47;
    id v52 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@ pid=%d currentActive=%@%@%@%@",  v48,  v51,  v47,  v36,  obj,  v14));

    int v4 = v12;
    uint64_t v5 = v43;
  }

  else
  {
    os_log_t v37 = v6;
    id v16 = (__CFString *)v47;
    id v15 = v48;
    id v52 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@ pid=%d currentActive=%@%@%@%@",  v48,  v51,  v47,  v37,  obj,  &stru_1000BE738));
  }

  if (v8)
  {
  }

  if (v5)
  {
  }

  if (v4)
  {
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess uniqueIdentifiers](self, "uniqueIdentifiers"));
  if ((unint64_t)[v17 count] >= 2)
  {
  }

  else
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));

    if (v18) {
      return v52;
    }
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess uniqueIdentifiers](self, "uniqueIdentifiers"));
  id v19 = [obja countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v54;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(obja);
        }
        os_log_t v23 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
        if (!v24) {
          goto LABEL_30;
        }
        id v25 = (void *)v24;
        uint64_t v26 = objc_opt_self(self);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 currentAdvertisableActivity]);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 uuid]);
        unsigned __int8 v30 = [v23 isEqual:v29];

        if ((v30 & 1) == 0)
        {
LABEL_30:
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);
          os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess dirtyUUIDs](self, "dirtyUUIDs"));
          unsigned int v33 = [v32 containsObject:v23];
          os_log_t v34 = "";
          if (v33) {
            os_log_t v34 = " (dirty)";
          }
          [v52 appendFormat:@"%@%s ", v31, v34];
        }
      }

      id v20 = [obja countByEnumeratingWithState:&v53 objects:v57 count:16];
    }

    while (v20);
  }

  [v52 appendString:@"}"];
  return v52;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
}

- (UAAuditToken)auditToken
{
  return (UAAuditToken *)objc_getProperty(self, a2, 88LL, 1);
}

- (BOOL)clientIsSandboxed
{
  return self->_clientIsSandboxed;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setTeamID:(id)a3
{
}

- (unsigned)allowedToAccessAnyItem
{
  return self->_allowedToAccessAnyItem;
}

- (void)setAllowedToAccessAnyItem:(unsigned __int8)a3
{
  self->_allowedToAccessAnyItem = a3;
}

- (NSMutableSet)dirtyUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120LL, 1);
}

- (UAUserActivityClientProcessesController)controller
{
  return (UAUserActivityClientProcessesController *)objc_getProperty(self, a2, 128LL, 1);
}

- (UAUserActivityAdvertisableItem)currentAdvertisableActivity
{
  return (UAUserActivityAdvertisableItem *)objc_getProperty(self, a2, 136LL, 1);
}

- (BOOL)frontmost
{
  return self->_frontmost;
}

- (BOOL)allowedToUseLSAlwaysEligible
{
  return self->_allowedToUseLSAlwaysEligible;
}

- (BOOL)allowedToUseEligibleEvenWhenInBackground
{
  return self->_allowedToUseEligibleEvenWhenInBackground;
}

- (BOOL)allowedToUseLSAlwaysPick
{
  return self->_allowedToUseLSAlwaysPick;
}

- (BOOL)allowedToUseUAAlwaysAdvertise
{
  return self->_allowedToUseUAAlwaysAdvertise;
}

- (BOOL)allowedToGetCurrentActivityInfo
{
  return self->_allowedToGetCurrentActivityInfo;
}

- (BOOL)allowedToMatchUserActivities
{
  return self->_allowedToMatchUserActivities;
}

- (NSDate)lastFrontTime
{
  return (NSDate *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setLastFrontTime:(id)a3
{
}

- (BOOL)clientIsSigned
{
  return self->_clientIsSigned;
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (NSMutableDictionary)userActivityAdvertisableItemsByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setUserActivityAdvertisableItemsByUUID:(id)a3
{
}

- (OS_os_transaction)os_transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setOs_transaction:(id)a3
{
}

- (NSMutableArray)pendingUpdateTasks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setPendingUpdateTasks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end