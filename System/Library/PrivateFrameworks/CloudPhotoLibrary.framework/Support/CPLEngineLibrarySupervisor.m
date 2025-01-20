@interface CPLEngineLibrarySupervisor
- (BOOL)schedulerShouldStartSyncSessionMovingToForeground:(id)a3 currentSession:(id)a4;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineLibrarySupervisor)initWithEngineLibrary:(id)a3 queue:(id)a4;
- (CPLEngineStore)store;
- (NSString)status;
- (OS_dispatch_queue)queue;
- (int64_t)_supervisorExitStateForScopeChange:(id)a3;
- (void)_checkExitSupervisor;
- (void)_checkExitSupervisorInTransaction:(id)a3;
- (void)_launchForcedExitForSupervisor:(id)a3;
- (void)_scheduleOrLaunchIfNecessary;
- (void)_scheduleOrLaunchIfNecessaryInQueue;
- (void)_sendExitFeedbackForSupervisor:(id)a3 cloudKitScope:(id)a4 exitState:(int64_t)a5;
- (void)_storeSupervisorInfoInTransaction:(id)a3;
- (void)_unscheduleInQueue;
- (void)engineDidOpen:(id)a3;
- (void)engineWillClose:(id)a3;
- (void)pause;
- (void)ping;
- (void)resume;
- (void)scopeStorage:(id)a3 didDropSharingScopeIdentifier:(id)a4;
- (void)scopeStorage:(id)a3 didStoreSharingScopeIdentifier:(id)a4;
- (void)scopeStorage:(id)a3 didUpdateScopeChange:(id)a4 forScope:(id)a5;
- (void)scopeUpdateTaskDidFinishSuccessfully:(id)a3;
- (void)transportNotedServerHasChanges:(id)a3;
@end

@implementation CPLEngineLibrarySupervisor

- (CPLEngineLibrarySupervisor)initWithEngineLibrary:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLEngineLibrarySupervisor;
  v8 = -[CPLEngineLibrarySupervisor init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_engineLibrary, v6);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 store]);
    store = v9->_store;
    v9->_store = (CPLEngineStore *)v11;

    objc_storeStrong((id *)&v9->_queue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)_unscheduleInQueue
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)retryTimer);
    v4 = self->_retryTimer;
    self->_retryTimer = 0LL;

    nextRetryDate = self->_nextRetryDate;
    self->_nextRetryDate = 0LL;
  }

- (void)_scheduleOrLaunchIfNecessaryInQueue
{
  if (self->_closed)
  {
    -[CPLEngineLibrarySupervisor _unscheduleInQueue](self, "_unscheduleInQueue");
    return;
  }

  if (!self->_forceProcessingStagedScopesTask)
  {
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    v24 = sub_10002C98C;
    v25 = sub_10002C99C;
    id v26 = 0LL;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v17 = sub_10002C9A4;
    v18 = &unk_10023E658;
    v19 = self;
    v20 = &v21;
    v3 = v16;
    os_unfair_lock_lock(&self->_lock);
    v17((uint64_t)v3);
    os_unfair_lock_unlock(&self->_lock);

    v4 = (void *)v22[5];
    if (v4)
    {
      nextRetryDate = self->_nextRetryDate;
      if (!nextRetryDate)
      {
LABEL_8:
        objc_storeStrong((id *)&self->_nextRetryDate, v4);
        [(id)v22[5] timeIntervalSinceNow];
        if (v6 >= 0.100000001) {
          double v7 = v6 * 1000000000.0;
        }
        else {
          double v7 = 100000001.0;
        }
        dispatch_source_t v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10002CA24;
        v13[3] = &unk_10023DDE8;
        v9 = v8;
        objc_super v14 = v9;
        v15 = self;
        dispatch_source_set_event_handler(v9, v13);
        dispatch_time_t v10 = dispatch_walltime(0LL, (uint64_t)v7);
        dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
        retryTimer = self->_retryTimer;
        self->_retryTimer = (OS_dispatch_source *)v9;
        v12 = v9;

        dispatch_resume((dispatch_object_t)self->_retryTimer);
        goto LABEL_14;
      }

      if ((id)-[NSDate compare:](nextRetryDate, "compare:") == (id)1)
      {
        -[CPLEngineLibrarySupervisor _unscheduleInQueue](self, "_unscheduleInQueue");
        v4 = (void *)v22[5];
        if (v4) {
          goto LABEL_8;
        }
      }

      else if (v22[5])
      {
LABEL_14:
        _Block_object_dispose(&v21, 8);

        return;
      }
    }

    -[CPLEngineLibrarySupervisor _unscheduleInQueue](self, "_unscheduleInQueue");
    goto LABEL_14;
  }

- (void)_scheduleOrLaunchIfNecessary
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002CAF4;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE90;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)engineDidOpen:(id)a3
{
  store = self->_store;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002CB74;
  v6[3] = &unk_10023F188;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002CDFC;
  v5[3] = &unk_10023F188;
  id v4 =  -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:]( store,  "performWriteTransactionWithBlock:completionHandler:",  v6,  v5);
}

- (void)engineWillClose:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002CEBC;
  v7[3] = &unk_10023DC70;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE90;
  block[3] = &unk_10023DBC8;
  id v9 = v4;
  dispatch_block_t v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (BOOL)schedulerShouldStartSyncSessionMovingToForeground:(id)a3 currentSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 activityState] != (id)1)
  {
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    char v21 = 1;
    p_lock = &self->_lock;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    objc_super v14 = sub_10002D008;
    v15 = &unk_10023E658;
    v16 = self;
    v17 = &v18;
    dispatch_time_t v10 = v13;
    os_unfair_lock_lock(p_lock);
    v14((uint64_t)v10);
    os_unfair_lock_unlock(p_lock);

    BOOL v11 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }

  return v11;
}

- (int64_t)_supervisorExitStateForScopeChange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 exitState];
  if (v4 == (id)2)
  {
    int64_t v5 = 4LL;
    goto LABEL_9;
  }

  if (v4 != (id)1)
  {
    if (!v4)
    {
      else {
        int64_t v5 = 0LL;
      }
      goto LABEL_9;
    }

- (void)_checkExitSupervisorInTransaction:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineStore scopes](self->_store, "scopes"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineStore sharingScopeIdentifier](self->_store, "sharingScopeIdentifier"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeWithIdentifier:v6]);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeChangeForScope:v7]);
      if (v8) {
        int64_t v9 = -[CPLEngineLibrarySupervisor _supervisorExitStateForScopeChange:]( self,  "_supervisorExitStateForScopeChange:",  v8);
      }
      else {
        int64_t v9 = 0LL;
      }
    }

    else
    {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
    id v7 = 0LL;
  }

  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_10002C98C;
  v27[4] = sub_10002C99C;
  id v28 = 0LL;
  p_lock = &self->_lock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v19 = sub_10002D414;
  uint64_t v20 = &unk_10023F1B0;
  char v21 = self;
  id v11 = v6;
  int64_t v26 = v9;
  id v22 = v11;
  v24 = &v29;
  id v12 = v7;
  id v23 = v12;
  v25 = v27;
  v13 = v18;
  os_unfair_lock_lock(p_lock);
  v19((uint64_t)v13);
  os_unfair_lock_unlock(p_lock);

  if (*((_BYTE *)v30 + 24))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002D6B8;
    v14[3] = &unk_10023F1D8;
    id v15 = v5;
    v17 = v27;
    id v16 = v12;
    [v4 do:v14];
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)_checkExitSupervisor
{
  store = self->_store;
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002D74C;
  v5[3] = &unk_10023F188;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D758;
  v4[3] = &unk_10023F188;
  id v3 =  -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:]( store,  "performWriteTransactionWithBlock:completionHandler:",  v5,  v4);
}

- (void)_storeSupervisorInfoInTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10002C98C;
  v24 = sub_10002C99C;
  id v25 = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  void v18[2] = 0x3032000000LL;
  v18[3] = sub_10002C98C;
  v18[4] = sub_10002C99C;
  id v19 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v13 = sub_10002D94C;
  objc_super v14 = &unk_10023F200;
  id v15 = self;
  id v16 = &v20;
  v17 = v18;
  int64_t v5 = v12;
  os_unfair_lock_lock(&self->_lock);
  v13(v5);
  os_unfair_lock_unlock(&self->_lock);

  if (v21[5])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineStore scopes](self->_store, "scopes"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeWithIdentifier:v21[5]]);
    if (v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10002D9AC;
      v8[3] = &unk_10023F1D8;
      id v9 = v6;
      id v11 = v18;
      id v10 = v7;
      [v4 do:v8];
    }
  }

  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
}

- (void)scopeStorage:(id)a3 didUpdateScopeChange:(id)a4 forScope:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 scopeIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineStore sharingScopeIdentifier](self->_store, "sharingScopeIdentifier"));
  unint64_t v13 = (unint64_t)v12;
  if (v11 && v12)
  {
    unsigned __int8 v14 = [(id)v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
  }

  else
  {

    if (v11 | v13) {
      goto LABEL_9;
    }
  }

  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  char v21 = sub_10002DBD0;
  uint64_t v22 = &unk_10023F228;
  id v23 = self;
  id v25 = &v27;
  int64_t v26 = -[CPLEngineLibrarySupervisor _supervisorExitStateForScopeChange:]( self,  "_supervisorExitStateForScopeChange:",  v9);
  id v24 = v9;
  id v15 = v20;
  os_unfair_lock_lock(&self->_lock);
  v21((uint64_t)v15);
  os_unfair_lock_unlock(&self->_lock);

  if (*((_BYTE *)v28 + 24))
  {
    store = self->_store;
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10002DC54;
    v19[3] = &unk_10023F188;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    void v18[2] = sub_10002DCA0;
    v18[3] = &unk_10023F188;
    id v17 =  -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:]( store,  "performWriteTransactionWithBlock:completionHandler:",  v19,  v18);
  }

  _Block_object_dispose(&v27, 8);
LABEL_9:
}

- (void)scopeStorage:(id)a3 didDropSharingScopeIdentifier:(id)a4
{
}

- (void)scopeStorage:(id)a3 didStoreSharingScopeIdentifier:(id)a4
{
}

- (void)scopeUpdateTaskDidFinishSuccessfully:(id)a3
{
}

- (void)transportNotedServerHasChanges:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  uint64_t v11 = sub_10002DE14;
  id v12 = &unk_10023E658;
  unint64_t v13 = self;
  unsigned __int8 v14 = &v15;
  int64_t v5 = v10;
  os_unfair_lock_lock(&self->_lock);
  v11((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);

  if (*((_BYTE *)v16 + 24))
  {
    store = self->_store;
    void v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002E020;
    v9[3] = &unk_10023F188;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002E06C;
    v8[3] = &unk_10023F188;
    id v7 =  -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:]( store,  "performWriteTransactionWithBlock:completionHandler:",  v9,  v8);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)_sendExitFeedbackForSupervisor:(id)a3 cloudKitScope:(id)a4 exitState:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_10002E184;
  v16[3] = &unk_10023DA98;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a5;
  uint64_t v11 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE90;
  block[3] = &unk_10023DBC8;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

- (void)_launchForcedExitForSupervisor:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_10002E8D4;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE90;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)pause
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002F204;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE90;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)resume
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002F310;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE90;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)ping
{
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  id v6 = sub_10002F3F4;
  id v7 = &unk_10023DC70;
  id v8 = self;
  id v4 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  -[CPLEngineLibrarySupervisor _scheduleOrLaunchIfNecessary](self, "_scheduleOrLaunchIfNecessary");
}

- (NSString)status
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_10002C98C;
  dispatch_block_t v15 = sub_10002C99C;
  id v16 = 0LL;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_10002F508;
  id v8 = &unk_10023DD58;
  dispatch_block_t v9 = self;
  id v10 = &v11;
  id v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v4;
}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end