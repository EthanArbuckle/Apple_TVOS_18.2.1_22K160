@interface CPLBGSTRescheduler
- (BGNonRepeatingSystemTaskRequest)request;
- (BOOL)shouldConsiderRequestingMoreTime;
- (BOOL)shouldDefer;
- (CPLBGSTRescheduler)initWithRequest:(id)a3 reschedulerManager:(id)a4;
- (CPLBGSTReschedulerManager)reschedulerManager;
- (CPLBackgroundActivity)currentActivity;
- (Class)requestClass;
- (NSError)acquireError;
- (NSString)description;
- (NSString)goodConditionsDescription;
- (NSString)taskIdentifier;
- (OS_dispatch_queue)queue;
- (double)estimatedRemainingTime;
- (double)estimatedRunningTime;
- (id)acquireBackgroundActivityWithCompletionHandler:(id)a3;
- (int64_t)activityState;
- (void)_registerFromPersistentSyncSessionWithLaunchBlock:(id)a3;
- (void)_scheduleBlockedTimeout;
- (void)_sessionIsDoneOrWontHappen;
- (void)_sessionTimerFired;
- (void)_submitTaskRequest;
- (void)_unscheduleBlockedTimeout;
- (void)_updateAcquireError:(id)a3;
- (void)_updateRequestIfNecessary;
- (void)_updateTaskIdentifierWithRequest:(id)a3;
- (void)acquiredTask:(id)a3;
- (void)activityHasExpired:(id)a3;
- (void)deferWithBlock:(id)a3;
- (void)dropBackgroundActivityRequest:(id)a3;
- (void)engineIsClosing;
- (void)failedToAcquireTaskWithError:(id)a3;
- (void)getStartDate:(id *)a3 acquireDate:(id *)a4 expireDate:(id *)a5;
- (void)sessionIsDone;
- (void)sessionWontHappen;
- (void)updateSyncSessionPrediction:(id)a3;
@end

@implementation CPLBGSTRescheduler

- (CPLBGSTRescheduler)initWithRequest:(id)a3 reschedulerManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLBGSTRescheduler;
  v9 = -[CPLBGSTRescheduler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_reschedulerManager, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 queue]);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    -[CPLBGSTRescheduler _updateTaskIdentifierWithRequest:](v10, "_updateTaskIdentifierWithRequest:", v10->_request);
  }

  return v10;
}

- (NSString)taskIdentifier
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  objc_super v14 = sub_100025440;
  v15 = sub_100025450;
  id v16 = 0LL;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_100025458;
  id v8 = &unk_10023DD58;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v4;
}

- (double)estimatedRunningTime
{
  uint64_t v11 = 0LL;
  v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000LL;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_100025554;
  id v8 = &unk_10023DD58;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  double v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)_updateTaskIdentifierWithRequest:(id)a3
{
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_100025638;
  id v8 = &unk_10023DDE8;
  v9 = self;
  id v4 = a3;
  id v10 = v4;
  v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (NSError)acquireError
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  objc_super v14 = sub_100025440;
  v15 = sub_100025450;
  id v16 = 0LL;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_1000257E0;
  id v8 = &unk_10023DD58;
  v9 = self;
  id v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSError *)v4;
}

- (void)_updateAcquireError:(id)a3
{
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_1000258C4;
  id v8 = &unk_10023DDE8;
  v9 = self;
  id v4 = a3;
  id v10 = v4;
  v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler taskIdentifier](self, "taskIdentifier"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[%@ %p for %@]", v4, self, v5);

  return v6;
}

- (Class)requestClass
{
  return -[CPLBGSTReschedulerManager requestClass](self->_reschedulerManager, "requestClass");
}

- (void)getStartDate:(id *)a3 acquireDate:(id *)a4 expireDate:(id *)a5
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_100025440;
  v33 = sub_100025450;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100025440;
  v27 = sub_100025450;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100025440;
  v21 = sub_100025450;
  id v22 = 0LL;
  p_lock = &self->_lock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  uint64_t v11 = sub_100025B04;
  v12 = &unk_10023EF38;
  uint64_t v13 = self;
  objc_super v14 = &v29;
  v15 = &v23;
  id v16 = &v17;
  v9 = v10;
  os_unfair_lock_lock(p_lock);
  v11(v9);
  os_unfair_lock_unlock(p_lock);

  *a3 = (id) v30[5];
  *a4 = (id) v24[5];
  *a5 = (id) v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)_submitTaskRequest
{
  if (!self->_submitted)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_100025C4C();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        id v8 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Acquiring Task for %@",  (uint8_t *)&v7,  0xCu);
      }
    }

    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(-[CPLBGSTReschedulerManager now](self->_reschedulerManager, "now"));
    startDate = self->_startDate;
    self->_startDate = v5;

    -[CPLBGSTRescheduler _scheduleBlockedTimeout](self, "_scheduleBlockedTimeout");
    self->_submitted = 1;
    -[CPLBGSTReschedulerManager submitTaskRequestForRescheduler:]( self->_reschedulerManager,  "submitTaskRequestForRescheduler:",  self);
  }

- (void)acquiredTask:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPLBGSTRescheduler _unscheduleBlockedTimeout](self, "_unscheduleBlockedTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = CPLSyncSessionBlockedStateDidChangeNotification;
  uint64_t v33 = CPLSyncSessionBlockedStateIsBlockedKey;
  id v34 = &__kCFBooleanFalse;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  [v6 postNotificationName:v7 object:self userInfo:v8];

  startDate = self->_startDate;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTReschedulerManager now](self->_reschedulerManager, "now"));
  -[NSDate timeIntervalSinceDate:](startDate, "timeIntervalSinceDate:", v10);
  double v12 = -v11;

  if (!self->_sessionIsDone)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler currentActivity](self, "currentActivity"));

    if (v15) {
      sub_10018F0F4((uint64_t)self);
    }
    id v16 = -[CPLBGSTActivity initWithTask:request:rescheduler:]( objc_alloc(&OBJC_CLASS___CPLBGSTActivity),  "initWithTask:request:rescheduler:",  v5,  self->_request,  self);
    -[CPLBGSTRescheduler _setCurrentActivity:](self, "_setCurrentActivity:", v16);
    if (-[NSMutableDictionary count](self->_requests, "count"))
    {
      if (!_CPLSilentLogging)
      {
        id v17 = sub_100025C4C();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = (CPLBGSTRescheduler *)-[NSMutableDictionary count](self->_requests, "count");
          int v25 = 138413058;
          id v26 = v5;
          __int16 v27 = 2112;
          id v28 = self;
          __int16 v29 = 2048;
          v30 = v19;
          __int16 v31 = 2048;
          double v32 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Acquired %@ for %@ - %lu interested clients (took %.3fs)",  (uint8_t *)&v25,  0x2Au);
        }
      }

      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_requests,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10023EF78);
      requests = (os_log_s *)self->_requests;
      self->_requests = 0LL;
    }

    else
    {
      deferBlock = (void (**)(void))self->_deferBlock;
      if (!deferBlock) {
        sub_10018F070((uint64_t)a2, (uint64_t)self, (uint64_t)v5);
      }
      if (self->_isClosing)
      {
        if (_CPLSilentLogging) {
          goto LABEL_15;
        }
        id v22 = sub_100025C4C();
        requests = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(requests, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412802;
          id v26 = v5;
          __int16 v27 = 2112;
          id v28 = self;
          __int16 v29 = 2048;
          v30 = *(CPLBGSTRescheduler **)&v12;
          _os_log_impl( (void *)&_mh_execute_header,  requests,  OS_LOG_TYPE_DEFAULT,  "Acquired Background %@ for %@ but we are closing (took %.3fs)",  (uint8_t *)&v25,  0x20u);
        }
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          id v23 = sub_100025C4C();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 138412802;
            id v26 = v5;
            __int16 v27 = 2112;
            id v28 = self;
            __int16 v29 = 2048;
            v30 = *(CPLBGSTRescheduler **)&v12;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Re-acquired Background %@ for %@ - resuming deferred activity (took %.3fs)",  (uint8_t *)&v25,  0x20u);
          }

          deferBlock = (void (**)(void))self->_deferBlock;
        }

        deferBlock[2]();
        requests = (os_log_s *)self->_deferBlock;
        self->_deferBlock = 0LL;
      }
    }

LABEL_15:
    goto LABEL_16;
  }

  if (!_CPLSilentLogging)
  {
    id v13 = sub_100025C4C();
    objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412802;
      id v26 = v5;
      __int16 v27 = 2048;
      id v28 = *(CPLBGSTRescheduler **)&v12;
      __int16 v29 = 2112;
      v30 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Acquired %@ (took %.3fs) for %@ but we are already done",  (uint8_t *)&v25,  0x20u);
    }
  }

  [v5 setTaskCompleted];
  -[CPLBGSTRescheduler _dropTaskRequest](self, "_dropTaskRequest");
LABEL_16:
}

- (void)failedToAcquireTaskWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPLBGSTRescheduler _updateAcquireError:](self, "_updateAcquireError:", v4);
  -[CPLBGSTRescheduler _unscheduleBlockedTimeout](self, "_unscheduleBlockedTimeout");
  startDate = self->_startDate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTReschedulerManager now](self->_reschedulerManager, "now"));
  -[NSDate timeIntervalSinceDate:](startDate, "timeIntervalSinceDate:", v6);
  double v8 = -v7;

  if (-[NSMutableDictionary count](self->_requests, "count"))
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100025C4C();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = -[NSMutableDictionary count](self->_requests, "count");
        *(_DWORD *)buf = 138412802;
        id v26 = self;
        __int16 v27 = 2048;
        double v28 = *(double *)&v11;
        __int16 v29 = 2048;
        double v30 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to acquire Background task for %@ - %lu interested clients (took %.3fs)",  buf,  0x20u);
      }
    }

    requests = self->_requests;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000265C4;
    v23[3] = &unk_10023EFA0;
    v24 = (os_log_s *)v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requests, "enumerateKeysAndObjectsUsingBlock:", v23);
    id v13 = self->_requests;
    self->_requests = 0LL;

    objc_super v14 = v24;
    goto LABEL_7;
  }

  deferBlock = (void (**)(void))self->_deferBlock;
  if (!deferBlock)
  {
    if (_CPLSilentLogging) {
      goto LABEL_8;
    }
    id v20 = sub_100025C4C();
    objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412546;
    id v26 = self;
    __int16 v27 = 2112;
    double v28 = *(double *)&v4;
    id v17 = "Failed to acquire task for %@ while we are not interested: %@";
    v18 = v14;
    uint32_t v19 = 22;
    goto LABEL_17;
  }

  if (!self->_isClosing)
  {
    if (!_CPLSilentLogging)
    {
      id v21 = sub_100025C4C();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = self;
        __int16 v27 = 2048;
        double v28 = v8;
        __int16 v29 = 2112;
        double v30 = *(double *)&v4;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to re-acquire Background task for %@ - resuming deferred activity (took %.3fs): %@",  buf,  0x20u);
      }

      deferBlock = (void (**)(void))self->_deferBlock;
    }

    deferBlock[2]();
    objc_super v14 = (os_log_s *)self->_deferBlock;
    self->_deferBlock = 0LL;
    goto LABEL_7;
  }

  if (_CPLSilentLogging) {
    goto LABEL_8;
  }
  id v16 = sub_100025C4C();
  objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = self;
    __int16 v27 = 2048;
    double v28 = v8;
    __int16 v29 = 2112;
    double v30 = *(double *)&v4;
    id v17 = "Failed to acquire Background task for %@ but we are closing (took %.3fs): %@";
    v18 = v14;
    uint32_t v19 = 32;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
  }

- (void)activityHasExpired:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000266C4;
  v11[3] = &unk_10023EFC8;
  id v12 = v5;
  id v13 = self;
  SEL v14 = a2;
  double v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v16 = v7;
  double v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)_updateRequestIfNecessary
{
  if (self->_submitted)
  {
    id v3 = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler acquireError](self, "acquireError"));
    if (!v3)
    {
      id v3 = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler currentActivity](self, "currentActivity"));
      if (!v3)
      {
        if (!self->_updatedPrediction) {
          return;
        }
        obj = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue( -[CPLBGSTReschedulerManager updateTaskRequest:updatedPrediction:]( self->_reschedulerManager,  "updateTaskRequest:updatedPrediction:",  self->_request));
        updatedPrediction = self->_updatedPrediction;
        self->_updatedPrediction = 0LL;

        id v3 = obj;
        if (obj != self->_request)
        {
          objc_storeStrong((id *)&self->_request, obj);
          -[CPLBGSTRescheduler _updateTaskIdentifierWithRequest:]( self,  "_updateTaskIdentifierWithRequest:",  self->_request);
          id v3 = obj;
        }
      }
    }
  }

- (void)_registerFromPersistentSyncSessionWithLaunchBlock:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v6 = objc_retainBlock(v5);

  id deferBlock = self->_deferBlock;
  self->_id deferBlock = v6;

  double v8 = (NSDate *)objc_claimAutoreleasedReturnValue(-[CPLBGSTReschedulerManager now](self->_reschedulerManager, "now"));
  startDate = self->_startDate;
  self->_startDate = v8;

  self->_submitted = 1;
  -[CPLBGSTRescheduler _scheduleBlockedTimeout](self, "_scheduleBlockedTimeout");
}

- (BOOL)shouldDefer
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  id v6 = sub_100026ADC;
  double v7 = &unk_10023DD58;
  double v8 = self;
  id v9 = &v10;
  id v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (int64_t)activityState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler currentActivity](self, "currentActivity"));
  if (v2) {
    int64_t v3 = 2LL;
  }
  else {
    int64_t v3 = 1LL;
  }

  return v3;
}

- (BOOL)shouldConsiderRequestingMoreTime
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  id v6 = (void (*)(void *))sub_100026C2C;
  double v7 = &unk_10023E658;
  double v8 = self;
  id v9 = &v10;
  int64_t v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6(v3);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (double)estimatedRemainingTime
{
  uint64_t v11 = 0LL;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0x40AC200000000000LL;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  double v7 = sub_100026D74;
  double v8 = &unk_10023E658;
  id v9 = self;
  uint64_t v10 = &v11;
  int64_t v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  double v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)deferWithBlock:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100026EE8;
  v11[3] = &unk_10023E720;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  double v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v15 = v7;
  double v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)_sessionIsDoneOrWontHappen
{
  if (!self->_sessionIsDone)
  {
    self->_sessionIsDone = 1;
    id deferBlock = self->_deferBlock;
    self->_id deferBlock = 0LL;

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler currentActivity](self, "currentActivity"));
    if (v5)
    {
      double v4 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
      [v4 setTaskCompleted];

      -[CPLBGSTRescheduler _setCurrentActivity:](self, "_setCurrentActivity:", 0LL);
    }

    -[CPLBGSTRescheduler _dropTaskRequest](self, "_dropTaskRequest");
  }

- (void)sessionIsDone
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_1000275A8;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  int64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  double v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)sessionWontHappen
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100027668;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  int64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  double v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)engineIsClosing
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100027728;
  v6[3] = &unk_10023DC98;
  v6[4] = self;
  void v6[5] = a2;
  int64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  double v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (NSString)goodConditionsDescription
{
  int64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler taskIdentifier](self, "taskIdentifier"));
  dispatch_block_t v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"Acquiring a Background System Task %@", v4);

  return v5;
}

- (void)updateSyncSessionPrediction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100027A44;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  double v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (CPLBackgroundActivity)currentActivity
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_100025440;
  id v15 = sub_100025450;
  id v16 = 0LL;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  double v7 = sub_100027C90;
  id v8 = &unk_10023DD58;
  dispatch_block_t v9 = self;
  dispatch_block_t v10 = &v11;
  int64_t v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLBackgroundActivity *)v4;
}

- (id)acquireBackgroundActivityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100027DC0;
  v15[3] = &unk_10023E878;
  v15[4] = self;
  id v17 = v4;
  id v7 = v5;
  id v16 = v7;
  id v8 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v19 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v4;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

  id v12 = v16;
  id v13 = v7;

  return v13;
}

- (void)dropBackgroundActivityRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100027F6C;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_scheduleBlockedTimeout
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = CPLSyncSessionBlockedStateDidChangeNotification;
  uint64_t v15 = CPLSyncSessionBlockedStateSyncRequestedKey;
  id v16 = &__kCFBooleanTrue;
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  [v3 postNotificationName:v4 object:self userInfo:v5];

  -[CPLBGSTRescheduler _unscheduleBlockedTimeout](self, "_unscheduleBlockedTimeout");
  id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  syncTimer = self->_syncTimer;
  self->_syncTimer = v6;

  id v8 = self->_syncTimer;
  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0x2540BE400uLL, 0x3B9ACA00uLL);
  id v10 = self->_syncTimer;
  id v11 = self->_syncTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002815C;
  handler[3] = &unk_10023DDE8;
  handler[4] = self;
  uint64_t v14 = v10;
  id v12 = v10;
  dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
  dispatch_resume((dispatch_object_t)self->_syncTimer);
}

- (void)_unscheduleBlockedTimeout
{
  syncTimer = self->_syncTimer;
  if (syncTimer)
  {
    dispatch_source_cancel((dispatch_source_t)syncTimer);
    uint64_t v4 = self->_syncTimer;
    self->_syncTimer = 0LL;
  }

- (void)_sessionTimerFired
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = CPLSyncSessionBlockedStateDidChangeNotification;
  uint64_t v6 = CPLSyncSessionBlockedStateIsBlockedKey;
  id v7 = &__kCFBooleanTrue;
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v3 postNotificationName:v4 object:self userInfo:v5];

  -[CPLBGSTRescheduler _unscheduleBlockedTimeout](self, "_unscheduleBlockedTimeout");
}

- (BGNonRepeatingSystemTaskRequest)request
{
  return self->_request;
}

- (CPLBGSTReschedulerManager)reschedulerManager
{
  return self->_reschedulerManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end