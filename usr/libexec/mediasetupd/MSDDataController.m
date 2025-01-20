@interface MSDDataController
+ (id)sharedInstance;
- (BOOL)isPerformingRefresh;
- (BOOL)thirdPartyMusicAvailable:(id)a3;
- (MSDCloudManager)cloudManager;
- (MSDDataController)initWithCloudDataManager:(id)a3 homeManager:(id)a4;
- (MSDHomeManager)homeManager;
- (id)_databaseForUser:(BOOL)a3;
- (void)_fetchDefaultServiceForUser:(id)a3 inHome:(id)a4 usingDatabase:(id)a5 completion:(id)a6;
- (void)_findServicesForUser:(id)a3 homeID:(id)a4 completion:(id)a5;
- (void)_servicesForUser:(id)a3 homeID:(id)a4 publicInfo:(id)a5 currentUser:(BOOL)a6 completion:(id)a7;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6;
- (void)getAvailableServices:(id)a3 completion:(id)a4;
- (void)getCachedAvailableServices:(id)a3 homeID:(id)a4 completion:(id)a5;
- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6;
- (void)getDefaultMediaService:(id)a3 completion:(id)a4;
- (void)getDefaultMediaServiceForAllUsers:(id)a3 completion:(id)a4;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)invalidateRefreshTimestamps;
- (void)refreshDataForReason:(unint64_t)a3 completion:(id)a4;
- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)setIsPerformingRefresh:(BOOL)a3;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5;
- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6;
@end

@implementation MSDDataController

- (MSDDataController)initWithCloudDataManager:(id)a3 homeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0LL;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___MSDDataController;
    v11 = -[MSDDataController init](&v14, "init");
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_cloudManager, a3);
      objc_storeStrong((id *)&v12->_homeManager, a4);
      v12->_isPerformingRefresh = 0;
      v12->_refreshLock._os_unfair_lock_opaque = 0;
    }

    self = v12;
    v10 = self;
  }

  return v10;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000055E0;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070768 != -1) {
    dispatch_once(&qword_100070768, block);
  }
  return (id)qword_100070760;
}

- (void)refreshDataForReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_refreshLock);
  if (self->_isPerformingRefresh)
  {
    os_unfair_lock_unlock(&self->_refreshLock);
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 9) {
        v9 = @"Unknown";
      }
      else {
        v9 = off_100060AD8[a3];
      }
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Skipping request (reason: %@) to perform refresh. One underway",  (uint8_t *)location,  0xCu);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }

  else
  {
    self->_isPerformingRefresh = 1;
    os_unfair_lock_unlock(&self->_refreshLock);
    v10 = -[MSDDataRefresh initWithReason:](objc_alloc(&OBJC_CLASS___MSDDataRefresh), "initWithReason:", a3);
    objc_initWeak(location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100005850;
    v11[3] = &unk_100060AB8;
    objc_copyWeak(&v13, location);
    id v12 = v6;
    -[MSDDataRefresh performRefreshWithCompletion:](v10, "performRefreshWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
}

- (void)invalidateRefreshTimestamps
{
}

- (MSDCloudManager)cloudManager
{
  return self->_cloudManager;
}

- (MSDHomeManager)homeManager
{
  return self->_homeManager;
}

- (BOOL)isPerformingRefresh
{
  return self->_isPerformingRefresh;
}

- (void)setIsPerformingRefresh:(BOOL)a3
{
  self->_isPerformingRefresh = a3;
}

- (void).cxx_destruct
{
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 privateCloudDatabase]);
  [v13 addMediaService:v12 usingSetupBundles:v11 transaction:v10 completion:v9];
}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 privateCloudDatabase]);
  [v7 getAvailableServices:v6 completion:v5];
}

- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 privateCloudDatabase]);
  [v10 updateDefaultMediaService:v9 withUserInfo:v8 completion:v7];
}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 privateCloudDatabase]);
  [v7 getDefaultMediaService:v6 completion:v5];
}

- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 privateCloudDatabase]);
  [v13 updateProperty:v12 propertyInfo:v11 withUserInfo:v10 completion:v9];
}

- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 privateCloudDatabase]);
  [v10 removeMediaService:v9 withUserInfo:v8 completion:v7];
}

- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (!v7 || ![v7 count])
  {
    if (!v9) {
      goto LABEL_13;
    }
    uint64_t v12 = MSErrorDomain;
    uint64_t v28 = MSUserInfoErrorStringKey;
    v29 = @"ServiceIDs specified is nil";
    id v13 = &v29;
    id v14 = &v28;
LABEL_12:
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v14,  1LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  1LL,  v24));
    v9[2](v9, 0LL, v25);

    goto LABEL_13;
  }

  if (v8 && [v8 count])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 privateCloudDatabase]);
    [v11 removeMediaServices:v7 withUserInfo:v8 completion:v9];

    goto LABEL_13;
  }

  id v15 = sub_10003E9DC();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10001567C(v16, v17, v18, v19, v20, v21, v22, v23);
  }

  if (v9)
  {
    uint64_t v12 = MSErrorDomain;
    uint64_t v26 = MSUserInfoErrorStringKey;
    v27 = @"Failed to remove services, NIL identifiers passed";
    id v13 = &v27;
    id v14 = &v26;
    goto LABEL_12;
  }

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 privateCloudDatabase]);
  [v10 getServiceConfigurationInfo:v9 serviceID:v8 completion:v7];
}

- (void)getCachedAvailableServices:(id)a3 homeID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        -[MSDDataController _findServicesForUser:homeID:completion:]( self,  "_findServicesForUser:homeID:completion:",  v8,  v9,  v10);
        goto LABEL_8;
      }

      uint64_t v11 = MSErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v17 = @"HomeID Passed is Nil";
      uint64_t v12 = &v17;
      id v13 = &v16;
    }

    else
    {
      uint64_t v11 = MSErrorDomain;
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      uint64_t v19 = @"HomeUserID Passed is Nil";
      uint64_t v12 = &v19;
      id v13 = &v18;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  v14));
    v10[2](v10, 0LL, v15);
  }

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___MSDAppSelectionAssistant);
    if (v10)
    {
      id v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    }

    else
    {
      id v15 = sub_10003E9DC();
      NSErrorUserInfoKey v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No homeUserID provided. Searching for users in the home who have the requested service",  buf,  2u);
      }

      id v14 = (NSUUID *)objc_claimAutoreleasedReturnValue( -[MSDAppSelectionAssistant homeUserWithService:forEndpoint:]( v13,  "homeUserWithService:forEndpoint:",  v9,  v11));
      if (!v14)
      {
        uint64_t v27 = MSErrorDomain;
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        v36 = @"No users in the home have the requested service";
        id v14 = (NSUUID *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  5LL,  v14));
        (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v17);
LABEL_11:

        goto LABEL_12;
      }
    }

    uint64_t v28 = v13;
    id v29 = v11;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant serviceInfoForUser:](v13, "serviceInfoForUser:", v14));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100027600;
    v30[3] = &unk_100060D00;
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForBundleID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForBundleID:",  v9));
    id v31 = v18;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "na_firstObjectPassingTest:", v30));
    uint64_t v20 = v19;
    if (v19)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 service]);
      id v22 = [v21 copy];

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForBundleID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForBundleID:",  v9));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v20 homeID]);
      [v22 populateMediaService:v23 homeID:v24 homeUserID:v14];

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v14, "UUIDString"));
      (*((void (**)(id, id, void *, void))v12 + 2))(v12, v22, v25, 0LL);
    }

    else
    {
      uint64_t v26 = MSErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      v34 = @"No users in the home have the requested service";
      id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  4LL,  v22));
      (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v23);
    }

    id v13 = v28;
    id v11 = v29;
    goto LABEL_11;
  }

- (BOOL)thirdPartyMusicAvailable:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v11 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100028CB0(v6, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForDefaultWithCustomClass:@"privateDatabaseData"]);
  id v6 = (os_log_s *)[v5 mutableCopy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForDefaultWithCustomClass:@"sharedDatabaseData"]);
  -[os_log_s addObjectsFromArray:](v6, "addObjectsFromArray:", v8);

  if (!-[os_log_s count](v6, "count"))
  {
    id v19 = sub_10003E9DC();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100028D20(v20);
    }

LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100027800;
  v22[3] = &unk_100060D00;
  id v23 = v3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s na_firstObjectPassingTest:](v6, "na_firstObjectPassingTest:", v22));
  BOOL v10 = v9 != 0LL;

LABEL_10:
  return v10;
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v14 privateCloudDatabase]);
  [v13 switchUserAccountInfo:v12 homeID:v11 homeUserID:v10 completion:v9];
}

- (void)getDefaultMediaServiceForAllUsers:(id)a3 completion:(id)a4
{
  id v23 = a3;
  id v24 = a4;
  uint64_t v28 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v6);
  id v7 = dispatch_group_create();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v8 currentHome]);

  if (v25)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 homeOwnerUniqueIdentifier]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

    v41[0] = 0LL;
    v41[1] = v41;
    v41[2] = 0x3032000000LL;
    v41[3] = sub_100027DC0;
    v41[4] = sub_100027DD0;
    id v42 = 0LL;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id obj = v23;
    id v13 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
          id v18 = [v17 isEqualToString:v27];

          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDataController _databaseForUser:](self, "_databaseForUser:", v18));
          dispatch_group_enter(v7);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_100027DD8;
          v33[3] = &unk_100061ED8;
          v33[4] = v16;
          v36 = v41;
          id v34 = v28;
          NSErrorUserInfoKey v35 = v7;
          -[MSDDataController _fetchDefaultServiceForUser:inHome:usingDatabase:completion:]( self,  "_fetchDefaultServiceForUser:inHome:usingDatabase:completion:",  v20,  v12,  v19,  v33);
        }

        id v13 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }

      while (v13);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100027F10;
    block[3] = &unk_1000612E0;
    id v31 = v24;
    id v30 = v28;
    v32 = v41;
    dispatch_group_notify(v7, v22, block);

    _Block_object_dispose(v41, 8);
    goto LABEL_12;
  }

  if (v24)
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    v45 = @"Failed to fetch valid home";
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  3LL,  v27));
    (*((void (**)(id, void, void *))v24 + 2))(v24, 0LL, v12);
LABEL_12:
  }
}

- (void)updateAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x3032000000LL;
    v51 = sub_100027DC0;
    v52 = sub_100027DD0;
    id v53 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000283E4;
    v45[3] = &unk_100061F00;
    v47 = &v48;
    id v12 = v10;
    v46 = v12;
    [v11 awaitCurrentHomeWithCompletion:v45];

    id v13 = (void *)v49[5];
    if (v13)
    {
      v54[0] = kCKDatabaseAccessUserInfoHomeIDKey;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
      v55[0] = v15;
      v54[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      v55[1] = v16;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  2LL));

      id v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v49[5] owner]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueIdentifier]);
      LODWORD(v15) = [v19 isEqual:v8];

      if ((_DWORD)v15)
      {
        id v20 = sub_10003E9DC();
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "HomeUserID passed is owner of home",  buf,  2u);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 privateCloudDatabase]);
        [v23 updateAuthRenewalForMediaService:v7 userInfo:v17 completion:v9];
      }

      else
      {
        id v42 = sub_10003E9DC();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "HomeUserID passed is not owner of home",  buf,  2u);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sharedCloudDatabase]);
        [v23 updateAuthRenewalForMediaService:v7 userInfo:v17 completion:v9];
      }
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to update MediaService AuthInfo, NIL Home for %@",  v8));
      id v34 = sub_10003E9DC();
      NSErrorUserInfoKey v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10000A170((uint64_t)v17, v35, v36, v37, v38, v39, v40, v41);
      }

      if (!v9) {
        goto LABEL_19;
      }
      NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
      v57 = v17;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  3LL,  v22));
      v9[2](v9, 0LL, v23);
    }

LABEL_19:
    _Block_object_dispose(&v48, 8);

    goto LABEL_20;
  }

  id v24 = sub_10003E9DC();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100028DE4(v25, v26, v27, v28, v29, v30, v31, v32);
  }

  if (v9)
  {
    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    v59 = @"Failed to update MediaService AuthInfo, NIL homeUserID";
    id v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  4LL,  v12));
    v9[2](v9, 0LL, v33);

LABEL_20:
  }
}

- (void)_findServicesForUser:(id)a3 homeID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 homeOwnerUniqueIdentifier]);
  id v13 = [v10 isEqual:v12];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100028530;
  v15[3] = &unk_100061AF0;
  id v16 = v8;
  id v14 = v8;
  -[MSDDataController _servicesForUser:homeID:publicInfo:currentUser:completion:]( self,  "_servicesForUser:homeID:publicInfo:currentUser:completion:",  v10,  v9,  0LL,  v13,  v15);
}

- (void)_servicesForUser:(id)a3 homeID:(id)a4 publicInfo:(id)a5 currentUser:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a7;
  id v13 = kPrivateDatabaseKeyData;
  if (!v8) {
    id v13 = kSharedDatabaseKeyData;
  }
  id v14 = *v13;
  id v15 = sub_10003E9DC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = @"is NOT";
    if (v8) {
      uint64_t v17 = @"is";
    }
    id v18 = @"Shared";
    if (v8) {
      id v18 = @"Private";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v39 = v17;
    __int16 v40 = 2112;
    uint64_t v41 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "The user %@ the currentUser, querying %@ database",  buf,  0x16u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForDefaultWithCustomClass:v14]);

  if ([v20 count])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100028A74;
    v31[3] = &unk_100060D28;
    id v21 = v10;
    id v32 = v21;
    id v33 = v11;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "na_filter:", v31));
    id v23 = v22;
    if (v22 && [v22 count])
    {
      v12[2](v12, v23, 0LL);
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to locate services for homeUserID %@",  v21));
      uint64_t v25 = MSErrorDomain;
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v35 = v24;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v25,  5LL,  v26));
      ((void (**)(id, void *, void *))v12)[2](v12, 0LL, v27);
    }

    uint64_t v28 = v32;
  }

  else
  {
    uint64_t v29 = MSErrorDomain;
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    uint64_t v37 = @"No service configured in home";
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v29,  2LL,  v28));
    ((void (**)(id, void *, void *))v12)[2](v12, 0LL, v30);
  }
}

- (id)_databaseForUser:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v5 = v4;
  if (a3) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 privateCloudDatabase]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 sharedCloudDatabase]);
  }
  id v7 = (void *)v6;

  return v7;
}

- (void)_fetchDefaultServiceForUser:(id)a3 inHome:(id)a4 usingDatabase:(id)a5 completion:(id)a6
{
  v14[0] = kCKDatabaseAccessUserInfoHomeIDKey;
  v14[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
  v15[0] = a4;
  v15[1] = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  [v10 getDefaultMediaService:v13 completion:v9];
}

@end