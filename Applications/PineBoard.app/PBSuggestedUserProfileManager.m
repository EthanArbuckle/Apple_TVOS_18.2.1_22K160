@interface PBSuggestedUserProfileManager
+ (id)sharedInstance;
- (FAFetchFamilyCircleRequest)fetchRequest;
- (NSDate)lastRefreshDate;
- (NSHashTable)observers;
- (OS_dispatch_queue)observerQueue;
- (OS_dispatch_queue)workQueue;
- (PBSSuggestedUserProfileSnapshot)suggestedUserProfileSnapshot;
- (PBSuggestedUserProfileManager)initWithStore:(id)a3 userProfileManager:(id)a4;
- (PBSuggestedUserProfileStore)profileStore;
- (PBUserProfileManager)userProfileManager;
- (id)_workQueue_reconciledSnapshotWithFamilyCircleProfiles:(id)a3;
- (void)_handleUpdateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(BOOL)a4;
- (void)_loadFamilyCircle;
- (void)_workQueue_clearSnapshot;
- (void)_workQueue_loadFamilyCircle;
- (void)_workQueue_loadFamilyCircleWithCompletionHandler:(id)a3;
- (void)_workQueue_notifyObserversSuggestedUsersDidUpdate;
- (void)_workQueue_processFamilyCircleMembers:(id)a3 completionHandler:(id)a4;
- (void)_workQueue_saveStoreAndNotifyObservers;
- (void)_workQueue_updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)clearSnapshot;
- (void)dealloc;
- (void)refreshFamilyMembersWithCompletionHandler:(id)a3;
- (void)refreshSuggestedUserProfiles;
- (void)removeObserver:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setLastRefreshDate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProfileStore:(id)a3;
- (void)setUserProfileManager:(id)a3;
- (void)updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(id)a4;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation PBSuggestedUserProfileManager

- (PBSuggestedUserProfileManager)initWithStore:(id)a3 userProfileManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBSuggestedUserProfileManager;
  v9 = -[PBSuggestedUserProfileManager init](&v17, "init");
  if (v9)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBSuggestedUserProfileManager.workQueue");
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)Serial;

    uint64_t v12 = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBSuggestedUserProfileManager.observerQueue");
    observerQueue = v9->_observerQueue;
    v9->_observerQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v9->_profileStore, a3);
    objc_storeStrong((id *)&v9->_userProfileManager, a4);
    -[PBUserProfileManager addObserver:](v9->_userProfileManager, "addObserver:", v9);
    -[PBSuggestedUserProfileManager _loadFamilyCircle](v9, "_loadFamilyCircle");
  }

  return v9;
}

+ (id)sharedInstance
{
  if (qword_100471118 != -1) {
    dispatch_once(&qword_100471118, &stru_1003D9948);
  }
  return (id)qword_100471110;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSuggestedUserProfileManager;
  -[PBSuggestedUserProfileManager dealloc](&v3, "dealloc");
}

- (void)refreshFamilyMembersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10015D160;
  v7[3] = &unk_1003D0070;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_loadFamilyCircle
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015D1E4;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_workQueue_loadFamilyCircle
{
}

- (void)_workQueue_loadFamilyCircleWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  lastRefreshDate = self->_lastRefreshDate;
  self->_lastRefreshDate = v5;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10015D400;
  v19[3] = &unk_1003D2560;
  id v7 = v4;
  v19[4] = self;
  id v20 = v7;
  id v8 = objc_retainBlock(v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileManager userProfilesSnapshot](self->_userProfileManager, "userProfilesSnapshot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 primaryUserProfile]);

  if (v10)
  {
    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x2050000000LL;
    v11 = (void *)qword_100471120;
    uint64_t v25 = qword_100471120;
    if (!qword_100471120)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10015EB9C;
      v21[3] = &unk_1003D0790;
      v21[4] = &v22;
      sub_10015EB9C((uint64_t)v21);
      v11 = (void *)v23[3];
    }

    uint64_t v12 = v11;
    _Block_object_dispose(&v22, 8);
    v13 = (FAFetchFamilyCircleRequest *)objc_alloc_init(v12);
    fetchRequest = self->_fetchRequest;
    self->_fetchRequest = v13;
    v15 = v13;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10015D4C4;
    v16[3] = &unk_1003D9970;
    v16[4] = self;
    objc_super v17 = v8;
    id v18 = v7;
    -[FAFetchFamilyCircleRequest startRequestWithCompletionHandler:](v15, "startRequestWithCompletionHandler:", v16);
  }

  else
  {
    -[PBSuggestedUserProfileManager _workQueue_clearSnapshot](self, "_workQueue_clearSnapshot");
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)_workQueue_processFamilyCircleMembers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = sub_100083FF0();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = [v6 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Processing suggested users from family members. {familyMembers.count=%lu, familyMembers=%@}",  buf,  0x16u);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileManager userProfilesSnapshot](self->_userProfileManager, "userProfilesSnapshot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v29 userProfiles]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);

  v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v16 iCloudAltDSID]);
        -[NSMutableSet bs_safeAddObject:](v11, "bs_safeAddObject:", v17);

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 iTunesAltDSID]);
        -[NSMutableSet bs_safeAddObject:](v11, "bs_safeAddObject:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue([v16 gameCenterAltDSID]);
        -[NSMutableSet bs_safeAddObject:](v11, "bs_safeAddObject:", v19);
      }

      id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v13);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10015D9F4;
  v35[3] = &unk_1003D9998;
  id v20 = v11;
  v36 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_filter:", v35));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v42 = sub_10015DB68;
  v43 = sub_10015DB78;
  id v44 = 0LL;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10015DB90;
  v34[3] = &unk_1003D99C0;
  v34[4] = buf;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bs_map:", v34));
  v23 = (void *)objc_claimAutoreleasedReturnValue( -[PBSuggestedUserProfileManager _workQueue_reconciledSnapshotWithFamilyCircleProfiles:]( self,  "_workQueue_reconciledSnapshotWithFamilyCircleProfiles:",  v22));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBSuggestedUserProfileStore snapshot](self->_profileStore, "snapshot"));
  unsigned __int8 v25 = [v23 isEqual:v24];

  if ((v25 & 1) == 0)
  {
    -[PBSuggestedUserProfileStore updateSuggestedUserProfileSnapshot:]( self->_profileStore,  "updateSuggestedUserProfileSnapshot:",  v23);
    -[PBSuggestedUserProfileManager _workQueue_saveStoreAndNotifyObservers]( self,  "_workQueue_saveStoreAndNotifyObservers");
  }

  if (v30)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBSuggestedUserProfileStore snapshot](self->_profileStore, "snapshot"));
    observerQueue = (dispatch_queue_s *)self->_observerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10015DCE0;
    block[3] = &unk_1003D2560;
    id v32 = v26;
    id v33 = v30;
    id v28 = v26;
    dispatch_async(observerQueue, block);
  }

  _Block_object_dispose(buf, 8);
}

- (id)_workQueue_reconciledSnapshotWithFamilyCircleProfiles:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSuggestedUserProfileStore snapshot](self->_profileStore, "snapshot"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 suggestedUserProfiles]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_map:", &stru_1003D9A00));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 altDSID]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, v16);
      }

      id v12 = [v10 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }

    while (v12);
  }

  v41 = v10;

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v17 = v4;
  id v18 = [v17 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 altDSID]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v23));
        id v25 = sub_100083FF0();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
        if (v24)
        {
          if (v27)
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v56 = 1752392040LL;
            __int16 v57 = 2112;
            v58 = v23;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Updating existing suggested profile for FAFamilyMember. {altDSID=%{mask.hash}@}",  buf,  0x16u);
          }

          id v28 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
          v29 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v22,  "updatedProfileWithIdentifier:suppressed:",  v28,  objc_msgSend(v24, "suppressed")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v29, v23);
        }

        else
        {
          if (v27)
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v56 = 1752392040LL;
            __int16 v57 = 2112;
            v58 = v23;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "New suggested profile for FAFamilyMember. {altDSID=%{mask.hash}@}",  buf,  0x16u);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v22, v23);
        }

        [v8 removeObject:v23];
      }

      id v19 = [v17 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }

    while (v19);
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v30 = v8;
  id v31 = [v30 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v43;
    do
    {
      for (k = 0LL; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)k);
        id v36 = sub_100083FF0();
        __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 141558274;
          uint64_t v56 = 1752392040LL;
          __int16 v57 = 2112;
          v58 = v35;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "Removing stale user suggestion. {altDSID=%{mask.hash}@}",  buf,  0x16u);
        }

        -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v35);
      }

      id v32 = [v30 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }

    while (v32);
  }

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v9, "allValues"));
  __int128 v39 = -[PBSSuggestedUserProfileSnapshot initWithSuggestedUserProfiles:]( objc_alloc(&OBJC_CLASS___PBSSuggestedUserProfileSnapshot),  "initWithSuggestedUserProfiles:",  v38);

  return v39;
}

- (void)_workQueue_saveStoreAndNotifyObservers
{
}

- (void)_workQueue_updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSuggestedUserProfileStore snapshot](self->_profileStore, "snapshot"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 profileWithIdentifier:v6]);

  if (v8)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 updatedProfileWithSuppressed:v4]);
    -[PBSuggestedUserProfileStore updateSuggestedUserProfile:](self->_profileStore, "updateSuggestedUserProfile:", v9);
    -[PBSuggestedUserProfileManager _workQueue_saveStoreAndNotifyObservers]( self,  "_workQueue_saveStoreAndNotifyObservers");
  }

  else
  {
    id v10 = sub_100083FF0();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100287408((uint64_t)v6, v9, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (PBSSuggestedUserProfileSnapshot)suggestedUserProfileSnapshot
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10015DB68;
  uint64_t v11 = sub_10015DB78;
  id v12 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10015E3B0;
  v6[3] = &unk_1003D0210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PBSSuggestedUserProfileSnapshot *)v4;
}

- (void)refreshSuggestedUserProfiles
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015E448;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(id)a4
{
  id v6 = a3;
  -[PBSuggestedUserProfileManager _handleUpdateSuppressedForSuggestedUserWithIdentifier:suppressed:]( self,  "_handleUpdateSuppressedForSuggestedUserWithIdentifier:suppressed:",  v6,  [a4 BOOLValue]);
}

- (void)clearSnapshot
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015E55C;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_handleUpdateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(BOOL)a4
{
  id v6 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015E600;
  block[3] = &unk_1003D1490;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)_workQueue_clearSnapshot
{
  lastRefreshDate = self->_lastRefreshDate;
  self->_lastRefreshDate = 0LL;

  -[PBSuggestedUserProfileStore clearStore](self->_profileStore, "clearStore");
  -[PBSuggestedUserProfileManager _workQueue_notifyObserversSuggestedUsersDidUpdate]( self,  "_workQueue_notifyObserversSuggestedUsersDidUpdate");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10015E6E8;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10015E794;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)_workQueue_notifyObserversSuggestedUsersDidUpdate
{
  id v3 = sub_100083FF0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSuggestedUserProfileStore snapshot](self->_profileStore, "snapshot"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 suggestedUserProfiles]);
    id v7 = [v6 count];
    NSUInteger v8 = -[NSHashTable count](self->_observers, "count");
    *(_DWORD *)buf = 134218240;
    id v23 = v7;
    __int16 v24 = 2048;
    NSUInteger v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Notifying observers suggested user profiles did update. {profilesCount=%ld, observersCount=%ld}",  buf,  0x16u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v9 = self->_observers;
  id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13);
        observerQueue = (dispatch_queue_s *)self->_observerQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10015E988;
        block[3] = &unk_1003CFF08;
        void block[4] = v14;
        dispatch_async(observerQueue, block);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v11);
  }
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015E9F8;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (FAFetchFamilyCircleRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (PBSuggestedUserProfileStore)profileStore
{
  return self->_profileStore;
}

- (void)setProfileStore:(id)a3
{
}

- (PBUserProfileManager)userProfileManager
{
  return self->_userProfileManager;
}

- (void)setUserProfileManager:(id)a3
{
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (void)setLastRefreshDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end