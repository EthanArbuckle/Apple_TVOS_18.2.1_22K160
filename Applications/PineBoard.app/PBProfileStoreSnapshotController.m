@interface PBProfileStoreSnapshotController
+ (id)_addProfileRequestsForLegacyUserProfilesArchive:(id)a3;
+ (id)_settingRequests;
- (OS_dispatch_queue)calloutQueue;
- (PBProfileStoreSnapshotController)initWithCallinQueue:(id)a3;
- (PBProfileStoreSnapshotController)initWithProfileStore:(id)a3 profileArchiveController:(id)a4 callinQueue:(id)a5;
- (UPProfileStoreSnapshot)snapshot;
- (id)_callinQueue_handleUpdatedSnapshot:(id)a3 notifyIfNeeded:(BOOL)a4;
- (id)didUpdateHandler;
- (id)updateWithBlock:(id)a3 error:(id *)a4;
- (void)_callinQueue_migrateUserProfilesWithController:(id)a3;
- (void)_callinQueue_notifyObserverWithUpdate:(id)a3;
- (void)_callinQueue_refreshSnapshotWithNotifyIfNeeded:(BOOL)a3;
- (void)_calloutQueue_notifyObserverWithUpdate:(id)a3;
- (void)_handleProfileStoreUpdate;
- (void)dealloc;
- (void)invalidate;
- (void)refreshSnapshot;
- (void)setCalloutQueue:(id)a3;
- (void)setDidUpdateHandler:(id)a3;
@end

@implementation PBProfileStoreSnapshotController

- (PBProfileStoreSnapshotController)initWithCallinQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___UPProfileStore);
  v6 = objc_alloc_init(&OBJC_CLASS___PBUserProfileArchiveController);
  v7 = -[PBProfileStoreSnapshotController initWithProfileStore:profileArchiveController:callinQueue:]( self,  "initWithProfileStore:profileArchiveController:callinQueue:",  v5,  v6,  v4);

  return v7;
}

- (PBProfileStoreSnapshotController)initWithProfileStore:(id)a3 profileArchiveController:(id)a4 callinQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  Class v13 = NSClassFromString(@"UPProfileStore");
  if (!v12)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278C60();
    }
LABEL_17:
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x10008E6F4LL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfileStoreClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278DC0();
    }
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x10008E758LL);
  }

  if (!v11)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"callinQueue"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278D14();
    }
    goto LABEL_17;
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBProfileStoreSnapshotController;
  v14 = -[PBProfileStoreSnapshotController init](&v27, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_callinQueue, a5);
    objc_storeStrong((id *)&v15->_calloutQueue, a5);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[UPProfileStoreSnapshot emptySnapshot](&OBJC_CLASS___UPProfileStoreSnapshot, "emptySnapshot"));
    snapshot = v15->_snapshot;
    v15->_snapshot = (UPProfileStoreSnapshot *)v16;

    objc_storeStrong((id *)&v15->_store, a3);
    objc_initWeak(&location, v15);
    store = v15->_store;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10008E7E0;
    v24[3] = &unk_1003D4270;
    objc_copyWeak(&v25, &location);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[UPProfileStore observeUpdatesUsingHandler:](store, "observeUpdatesUsingHandler:", v24));
    storeListenToken = v15->_storeListenToken;
    v15->_storeListenToken = (BSInvalidatable *)v19;

    if (v10) {
      -[PBProfileStoreSnapshotController _callinQueue_migrateUserProfilesWithController:]( v15,  "_callinQueue_migrateUserProfilesWithController:",  v10);
    }
    -[PBProfileStoreSnapshotController _callinQueue_refreshSnapshotWithNotifyIfNeeded:]( v15,  "_callinQueue_refreshSnapshotWithNotifyIfNeeded:",  0LL);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)dealloc
{
  if (self->_store)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PBProfileStoreSnapshotController instance must be invalidated before being deallocated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278E74();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

  else
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBProfileStoreSnapshotController;
    -[PBProfileStoreSnapshotController dealloc](&v3, "dealloc");
  }

- (void)setCalloutQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callinQueue);
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v4;
}

- (void)setDidUpdateHandler:(id)a3
{
  callinQueue = (dispatch_queue_s *)self->_callinQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(callinQueue);
  id v6 = [v5 copy];

  id didUpdateHandler = self->_didUpdateHandler;
  self->_id didUpdateHandler = v6;
}

- (UPProfileStoreSnapshot)snapshot
{
  return self->_snapshot;
}

- (id)updateWithBlock:(id)a3 error:(id *)a4
{
  id v6 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callinQueue);
  if (!v6)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278F1C();
    }
    _bs_set_crash_log_message([v34 UTF8String]);
    __break(0);
    JUMPOUT(0x10008ED2CLL);
  }

  if (self->_store)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___UPUpdateProfileStoreRequest);
    [v7 setOptions:9];
    id v8 = [(id)objc_opt_class(self) _settingRequests];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 setSettingRequests:v9];

    v6[2](v6, v7);
    id v10 = sub_10008E3B0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 addProfileRequests]);
      id v13 = [v12 count];
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 updateProfileRequests]);
      id v15 = [v14 count];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 removeProfileRequests]);
      *(_DWORD *)buf = 136315906;
      v37 = "-[PBProfileStoreSnapshotController updateWithBlock:error:]";
      __int16 v38 = 2048;
      id v39 = v13;
      __int16 v40 = 2048;
      id v41 = v15;
      __int16 v42 = 2048;
      id v43 = [v16 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Updating profile store. addProfileRequests=%lu, updateProfileRequests=%lu, removeProfileRequests=%lu.",  buf,  0x2Au);
    }

    store = self->_store;
    id v35 = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStore updateForRequest:error:](store, "updateForRequest:error:", v7, &v35));
    id v19 = v35;
    id v20 = sub_10008E3B0();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Profile store update succeeded.", buf, 2u);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue([v18 currentSnapshot]);
      v24 = (void *)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotController _callinQueue_handleUpdatedSnapshot:notifyIfNeeded:]( self,  "_callinQueue_handleUpdatedSnapshot:notifyIfNeeded:",  v23,  0LL));
    }

    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100279004((uint64_t)v19, v22, v26, v27, v28, v29, v30, v31);
      }

      id v32 = sub_10010CEAC(v19);
      v24 = 0LL;
      v23 = v19;
      id v19 = (id)objc_claimAutoreleasedReturnValue(v32);
    }

    if (a4) {
      *a4 = v19;
    }
  }

  else
  {
    id v25 = sub_10008E3B0();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100278FC4((os_log_t)v7);
    }
    v24 = 0LL;
  }

  return v24;
}

- (void)invalidate
{
  storeListenToken = self->_storeListenToken;
  self->_storeListenToken = 0LL;

  -[UPProfileStore invalidate](self->_store, "invalidate");
  store = self->_store;
  self->_store = 0LL;
}

- (void)refreshSnapshot
{
}

+ (id)_settingRequests
{
  if (qword_100470800 != -1) {
    dispatch_once(&qword_100470800, &stru_1003D4290);
  }
  return (id)qword_100470808;
}

- (void)_callinQueue_migrateUserProfilesWithController:(id)a3
{
  id v4 = a3;
  if ([v4 isArchiveAvailable])
  {
    id v35 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 loadArchiveWithError:&v35]);
    id v6 = v35;
    id v7 = sub_10008E3B0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfiles]);
        id v11 = [v10 count];
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfiles]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
        *(_DWORD *)buf = 136315650;
        v37 = "-[PBProfileStoreSnapshotController _callinQueue_migrateUserProfilesWithController:]";
        __int16 v38 = 2048;
        id v39 = v11;
        __int16 v40 = 2112;
        id v41 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Migrating %lu legacy profile. identifiers=%@",  buf,  0x20u);
      }

      id v14 = [(id)objc_opt_class(self) _addProfileRequestsForLegacyUserProfilesArchive:v5];
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      id v15 = -[os_log_s count](v9, "count");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfiles]);
      id v17 = [v16 count];

      if (v15 != v17)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[addProfileRequests count] == [[archive userProfiles] count]"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1002791EC();
        }
        _bs_set_crash_log_message([v32 UTF8String]);
        __break(0);
        JUMPOUT(0x10008F3BCLL);
      }

      if (-[os_log_s count](v9, "count"))
      {
        id v18 = objc_alloc_init(&OBJC_CLASS___UPUpdateProfileStoreRequest);
        [v18 setOptions:4];
        [v18 setAddProfileRequests:v9];
        store = self->_store;
        id v34 = 0LL;
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStore updateForRequest:error:](store, "updateForRequest:error:", v18, &v34));
        id v21 = v34;

        id v22 = sub_10008E3B0();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        v24 = v23;
        if (v20)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = -[os_log_s count](v9, "count");
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForKey:](v9, "valueForKey:", @"identity"));
            *(_DWORD *)buf = 136315650;
            v37 = "-[PBProfileStoreSnapshotController _callinQueue_migrateUserProfilesWithController:]";
            __int16 v38 = 2048;
            id v39 = v25;
            __int16 v40 = 2112;
            id v41 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully migrated %lu legacy profile(s). identities=%@",  buf,  0x20u);
          }
        }

        else if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          sub_100279140(v9, (uint64_t)v21, v24);
        }
      }

      else
      {
        id v21 = v6;
      }

      id v33 = 0LL;
      unsigned int v28 = [v4 removeArchiveWithError:&v33];
      id v6 = v33;

      id v29 = sub_10008E3B0();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v31 = v30;
      if (v28)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[PBProfileStoreSnapshotController _callinQueue_migrateUserProfilesWithController:]";
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully removed legacy profile archive.",  buf,  0xCu);
        }
      }

      else if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        sub_1002790D4();
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      sub_100279068();
    }
  }

  else
  {
    id v27 = sub_10008E3B0();
    id v6 = (id)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[PBProfileStoreSnapshotController _callinQueue_migrateUserProfilesWithController:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "%s: No legacy profile archive exists. Nothing to migrate.",  buf,  0xCu);
    }
  }
}

+ (id)_addProfileRequestsForLegacyUserProfilesArchive:(id)a3
{
  id v3 = a3;
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfiles]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v33 allValues]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_compactMap:", &stru_1003D42D0));

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 systemAppUserIdentifier]);
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v13, v14);
      }

      id v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v9);
  }

  id v29 = v3;
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v3 groupRecommendationsSessions]);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v7;
  id v15 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 systemAppUserIdentifier]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:v19]);

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:v21]);

        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userIdentifiers]);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_10008F9F8;
        v34[3] = &unk_1003D42F8;
        v34[4] = v18;
        id v35 = v6;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bs_compactMap:", v34));

        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[UPSetting recommendationGroupIdentitiesSettingWithIdentities:]( &OBJC_CLASS___UPSetting,  "recommendationGroupIdentitiesSettingWithIdentities:",  v24));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v18 settings]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 setByAddingObject:v25]);

        [v18 setSettings:v27];
      }

      id v16 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }

    while (v16);
  }

  return obj;
}

- (void)_callinQueue_refreshSnapshotWithNotifyIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___UPFetchProfileStoreSnapshotRequest);
  [v5 setOptions:1];
  id v6 = [(id)objc_opt_class(self) _settingRequests];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setSettingRequests:v7];

  id v8 = sub_10008E3B0();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[PBProfileStoreSnapshotController _callinQueue_refreshSnapshotWithNotifyIfNeeded:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Retrieving snapshot from profile store.",  buf,  0xCu);
  }

  store = self->_store;
  id v23 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStore snapshotForFetchRequest:error:](store, "snapshotForFetchRequest:error:", v5, &v23));
  id v12 = v23;
  id v13 = sub_10008E3B0();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[PBProfileStoreSnapshotController _callinQueue_refreshSnapshotWithNotifyIfNeeded:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully retrieved snapshot from profile store.",  buf,  0xCu);
    }

    id v16 =  -[PBProfileStoreSnapshotController _callinQueue_handleUpdatedSnapshot:notifyIfNeeded:]( self,  "_callinQueue_handleUpdatedSnapshot:notifyIfNeeded:",  v11,  v3);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100279294((uint64_t)v12, v15, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (id)_callinQueue_handleUpdatedSnapshot:(id)a3 notifyIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = self->_snapshot;
  id v9 = v7;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UPProfileStoreSnapshotDifference differenceFromSnapshot:toSnapshot:]( &OBJC_CLASS___UPProfileStoreSnapshotDifference,  "differenceFromSnapshot:toSnapshot:",  v8,  v9));
  id v11 = -[PBProfileStoreSnapshotUpdate initWithCurrentSnapshot:previousSnapshot:difference:]( objc_alloc(&OBJC_CLASS___PBProfileStoreSnapshotUpdate),  "initWithCurrentSnapshot:previousSnapshot:difference:",  v9,  v8,  v10);
  objc_storeStrong((id *)&self->_snapshot, a3);
  unsigned int v12 = [v10 hasChanges];
  id v13 = sub_10008E3B0();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      snapshot = self->_snapshot;
      int v20 = 136315650;
      uint64_t v21 = "-[PBProfileStoreSnapshotController _callinQueue_handleUpdatedSnapshot:notifyIfNeeded:]";
      __int16 v22 = 1024;
      BOOL v23 = v4;
      __int16 v24 = 2112;
      id v25 = snapshot;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Latest snapshot differs from current snapshot. notifyIfNeeded=%{BOOL}d, snapshot=%@",  (uint8_t *)&v20,  0x1Cu);
    }

    if (v4)
    {
      id v17 = sub_10008E3B0();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        uint64_t v21 = "-[PBProfileStoreSnapshotController _callinQueue_handleUpdatedSnapshot:notifyIfNeeded:]";
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Latest snapshot update is out-of-band. Will notify observers.",  (uint8_t *)&v20,  0xCu);
      }

      -[PBProfileStoreSnapshotController _callinQueue_notifyObserverWithUpdate:]( self,  "_callinQueue_notifyObserverWithUpdate:",  v11);
    }
  }

  else
  {
    if (v15)
    {
      int v20 = 136315138;
      uint64_t v21 = "-[PBProfileStoreSnapshotController _callinQueue_handleUpdatedSnapshot:notifyIfNeeded:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Latest snapshot does *NOT* differ from current snapshot. Will ignore",  (uint8_t *)&v20,  0xCu);
    }
  }

  return v11;
}

- (void)_callinQueue_notifyObserverWithUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FF18;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_calloutQueue_notifyObserverWithUpdate:(id)a3
{
  id didUpdateHandler = (void (**)(id, id))self->_didUpdateHandler;
  if (didUpdateHandler) {
    didUpdateHandler[2](didUpdateHandler, a3);
  }
}

- (void)_handleProfileStoreUpdate
{
  callinQueue = (dispatch_queue_s *)self->_callinQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100090000;
  v4[3] = &unk_1003D0890;
  objc_copyWeak(&v5, &location);
  dispatch_async(callinQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (id)didUpdateHandler
{
  return self->_didUpdateHandler;
}

- (void).cxx_destruct
{
}

@end