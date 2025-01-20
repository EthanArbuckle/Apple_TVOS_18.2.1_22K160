@interface PBSuggestedUserProfileStore
- (BOOL)_workQueue_addSuggestedUserProfile:(id)a3 error:(id *)a4;
- (BOOL)_workQueue_removeSuggestedUserProfileWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_workQueue_updateSuggestedUserProfile:(id)a3 error:(id *)a4;
- (BOOL)_workQueue_updateSuggestedUserProfileSnapshot:(id)a3 error:(id *)a4;
- (NSMutableDictionary)mutableSuggestedUserProfilesByIdentifier;
- (OS_dispatch_queue)workQueue;
- (PBSSuggestedUserProfileSnapshot)snapshot;
- (PBSuggestedUserProfileStore)init;
- (os_unfair_lock_s)snapshotLock;
- (void)_workQueue_clearStore;
- (void)_workQueue_initializeStore;
- (void)_workQueue_takeSnapshot;
- (void)_workQueue_writeArchive;
- (void)addUserProfile:(id)a3;
- (void)clearStore;
- (void)removeUserProfileWithIdentifier:(id)a3;
- (void)save;
- (void)setSnapshotLock:(os_unfair_lock_s)a3;
- (void)updateSuggestedUserProfile:(id)a3;
- (void)updateSuggestedUserProfileSnapshot:(id)a3;
@end

@implementation PBSuggestedUserProfileStore

- (PBSuggestedUserProfileStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSuggestedUserProfileStore;
  v2 = -[PBSuggestedUserProfileStore init](&v9, "init");
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBSuggestedUserProfileStore.workQueue");
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)Serial;

    v2->_snapshotLock._os_unfair_lock_opaque = 0;
    v5 = (dispatch_queue_s *)v2->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100052E64;
    block[3] = &unk_1003CFF08;
    v8 = v2;
    dispatch_sync(v5, block);
  }

  return v2;
}

- (PBSSuggestedUserProfileSnapshot)snapshot
{
  p_snapshotLock = &self->_snapshotLock;
  os_unfair_lock_lock(&self->_snapshotLock);
  v4 = self->_snapshot;
  os_unfair_lock_unlock(p_snapshotLock);
  return v4;
}

- (void)save
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100052F28;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)addUserProfile:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100052FD0;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)updateSuggestedUserProfile:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000530E8;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)removeUserProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100053200;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)updateSuggestedUserProfileSnapshot:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100053318;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)clearStore
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053408;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_workQueue_initializeStore
{
  id v3 = sub_100083FF0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Initializing SuggestedUserProfileStore",  buf,  2u);
  }

  id v5 = sub_100023A20(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = sub_100083FF0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Reading suggested user profiles archive from disk",  v13,  2u);
    }

    objc_super v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v6 suggestedUserProfilesByIdentifier]);
    v10 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v9, "mutableCopy");
    mutableSuggestedUserProfilesByIdentifier = self->_mutableSuggestedUserProfilesByIdentifier;
    self->_mutableSuggestedUserProfilesByIdentifier = v10;
  }

  else
  {
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_super v9 = self->_mutableSuggestedUserProfilesByIdentifier;
    self->_mutableSuggestedUserProfilesByIdentifier = v12;
  }

  -[PBSuggestedUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
}

- (void)_workQueue_writeArchive
{
  id v3 = -[PBSuggestedUserProfilesArchive initWithSuggestedUserProfilesByIdentifier:]( objc_alloc(&OBJC_CLASS___PBSuggestedUserProfilesArchive),  "initWithSuggestedUserProfilesByIdentifier:",  self->_mutableSuggestedUserProfilesByIdentifier);
  id v8 = 0LL;
  unsigned __int8 v4 = sub_100023A80(v3, (uint64_t)&v8);
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = sub_100083FF0();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10027446C(v5, v7);
    }
  }
}

- (void)_workQueue_takeSnapshot
{
  p_snapshotLock = &self->_snapshotLock;
  os_unfair_lock_lock(&self->_snapshotLock);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mutableSuggestedUserProfilesByIdentifier, "allValues"));
  id v5 = [v4 copy];

  id v6 = -[PBSSuggestedUserProfileSnapshot initWithSuggestedUserProfiles:]( objc_alloc(&OBJC_CLASS___PBSSuggestedUserProfileSnapshot),  "initWithSuggestedUserProfiles:",  v5);
  snapshot = self->_snapshot;
  self->_snapshot = v6;

  id v8 = sub_100083FF0();
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSSuggestedUserProfileSnapshot suggestedUserProfiles](self->_snapshot, "suggestedUserProfiles"));
    int v11 = 134217984;
    id v12 = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "New SuggestedUserProfile Snapshot Taken: {count:%ld}",  (uint8_t *)&v11,  0xCu);
  }

  os_unfair_lock_unlock(p_snapshotLock);
}

- (void)_workQueue_clearStore
{
  id v7 = 0LL;
  BOOL v3 = sub_100023ADC((uint64_t)&v7);
  id v4 = v7;
  if (!v3)
  {
    id v5 = sub_100083FF0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100274500((uint64_t)v4, v6);
    }
  }

  -[NSMutableDictionary removeAllObjects](self->_mutableSuggestedUserProfilesByIdentifier, "removeAllObjects");
  -[PBSuggestedUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
}

- (BOOL)_workQueue_addSuggestedUserProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mutableSuggestedUserProfilesByIdentifier,  "objectForKeyedSubscript:",  v7));

  if (v8)
  {
    if (a4)
    {
      objc_super v9 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      v13 = @"Suggested user already exists";
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      *a4 =  -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  @"PBSuggestedUserProfileStoreErrorDomain",  101LL,  v10);
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableSuggestedUserProfilesByIdentifier,  "setObject:forKeyedSubscript:",  v6,  v7);
    -[PBSuggestedUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
  }

  return v8 == 0LL;
}

- (BOOL)_workQueue_updateSuggestedUserProfile:(id)a3 error:(id *)a4
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableSuggestedUserProfilesByIdentifier,  "setObject:forKeyedSubscript:",  v6,  v7);

  -[PBSuggestedUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
  return 1;
}

- (BOOL)_workQueue_removeSuggestedUserProfileWithIdentifier:(id)a3 error:(id *)a4
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mutableSuggestedUserProfilesByIdentifier,  "objectForKeyedSubscript:",  v7));

  if (v8)
  {
    -[PBSuggestedUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
  }

  else if (a4)
  {
    objc_super v9 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v13 = @"SuggestedProfileStore asked to remove non-existing profile";
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    *a4 =  -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  @"PBSuggestedUserProfileStoreErrorDomain",  102LL,  v10);
  }

  return v8 != 0LL;
}

- (BOOL)_workQueue_updateSuggestedUserProfileSnapshot:(id)a3 error:(id *)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 suggestedUserProfiles]);
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", (void)v17));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  mutableSuggestedUserProfilesByIdentifier = self->_mutableSuggestedUserProfilesByIdentifier;
  self->_mutableSuggestedUserProfilesByIdentifier = v7;

  -[PBSuggestedUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
  return 1;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)mutableSuggestedUserProfilesByIdentifier
{
  return self->_mutableSuggestedUserProfilesByIdentifier;
}

- (os_unfair_lock_s)snapshotLock
{
  return self->_snapshotLock;
}

- (void)setSnapshotLock:(os_unfair_lock_s)a3
{
  self->_snapshotLock = a3;
}

- (void).cxx_destruct
{
}

@end