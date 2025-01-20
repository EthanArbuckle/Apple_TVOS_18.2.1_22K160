@interface ADCloudKitRetryManager
- (ADCloudKitRetryManager)initWithQueue:(id)a3;
- (BOOL)handleRateLimitedError:(id)a3 forZoneInfo:(id)a4 operationType:(int64_t)a5;
- (void)cancelRateLimitTimerForZoneInfo:(id)a3;
- (void)cancelRecordZoneSetupTimerForZoneInfo:(id)a3;
- (void)cancelShareCreationTimer:(id)a3;
- (void)cancelSubscriptionSetupTimerForZoneInfo:(id)a3;
- (void)cancelSyncRetryTimerForZoneInfo:(id)a3;
- (void)retryForType:(int64_t)a3 zoneInfo:(id)a4 error:(id)a5;
- (void)retryForTypeOnRetryManagerQueue:(int64_t)a3 zoneInfo:(id)a4 error:(id)a5 retryAfterInterval:(double)a6;
@end

@implementation ADCloudKitRetryManager

- (ADCloudKitRetryManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADCloudKitRetryManager;
  v6 = -[ADCloudKitRetryManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)retryForTypeOnRetryManagerQueue:(int64_t)a3 zoneInfo:(id)a4 error:(id)a5 retryAfterInterval:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  if (a6 == 0.0)
  {
    [v10 currentRetryInterval];
    a6 = v12 + v12;
  }

  if (a6 == 0.0) {
    a6 = 60.0;
  }
  if ([v10 retryState] == (id)1)
  {
    v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[ADCloudKitRetryManager retryForTypeOnRetryManagerQueue:zoneInfo:error:retryAfterInterval:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Attempting retry while in retry.", buf, 0xCu);
    }
  }

  switch(a3)
  {
    case 1LL:
      v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
      dispatch_time_t v15 = dispatch_time(0LL, (unint64_t)(a6 * 1000000000.0));
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      -[ADCloudKitRetryManager cancelRateLimitTimerForZoneInfo:](self, "cancelRateLimitTimerForZoneInfo:", v10);
      [v10 setRateLimitTimer:v14];
      [v10 setRetryState:1];
      v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v10 rateLimitTimer]);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10011ECEC;
      handler[3] = &unk_1004FD968;
      handler[4] = self;
      id v17 = v10;
      id v49 = v17;
      dispatch_source_set_event_handler(v16, handler);

      v18 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v17 rateLimitTimer]);
      dispatch_resume(v18);

      v19 = v49;
      goto LABEL_18;
    case 2LL:
      v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
      dispatch_time_t v20 = dispatch_time(0LL, (unint64_t)(a6 * 1000000000.0));
      dispatch_source_set_timer(v14, v20, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      -[ADCloudKitRetryManager cancelSyncRetryTimerForZoneInfo:](self, "cancelSyncRetryTimerForZoneInfo:", v10);
      [v10 setSyncRetryTimer:v14];
      [v10 setRetryState:1];
      v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v10 syncRetryTimer]);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_10011EC5C;
      v50[3] = &unk_1004FD968;
      v50[4] = self;
      id v22 = v10;
      id v51 = v22;
      dispatch_source_set_event_handler(v21, v50);

      v23 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v22 syncRetryTimer]);
      dispatch_resume(v23);

      v19 = v51;
      goto LABEL_18;
    case 3LL:
      v28 = (void *)objc_claimAutoreleasedReturnValue([v10 dataStore]);
      unsigned int v29 = [v28 isMirroredDataStore];

      if (!v29) {
        goto LABEL_22;
      }
      v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
      dispatch_time_t v30 = dispatch_time(0LL, (unint64_t)(a6 * 1000000000.0));
      dispatch_source_set_timer(v14, v30, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      -[ADCloudKitRetryManager cancelRecordZoneSetupTimerForZoneInfo:]( self,  "cancelRecordZoneSetupTimerForZoneInfo:",  v10);
      [v10 setZoneSetupTimer:v14];
      [v10 setRetryState:1];
      v31 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v10 zoneSetupTimer]);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_10011EDE8;
      v46[3] = &unk_1004FD968;
      v46[4] = self;
      id v32 = v10;
      id v47 = v32;
      dispatch_source_set_event_handler(v31, v46);

      v33 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v32 zoneSetupTimer]);
      dispatch_resume(v33);

      v19 = v47;
      goto LABEL_18;
    case 5LL:
      v34 = (char *)[v10 shareCreationRetryCount];
      if ((unint64_t)v34 >= 4)
      {
        v39 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v53 = "-[ADCloudKitRetryManager retryForTypeOnRetryManagerQueue:zoneInfo:error:retryAfterInterval:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s Ignoring failure as tried share creation too many times.",  buf,  0xCu);
        }

        [v10 setShareCreationRetryCount:0];
      }

      else
      {
        [v10 setShareCreationRetryCount:v34 + 1];
        v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
        dispatch_time_t v35 = dispatch_time(0LL, (unint64_t)(a6 * 1000000000.0));
        dispatch_source_set_timer(v14, v35, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        -[ADCloudKitRetryManager cancelShareCreationTimer:](self, "cancelShareCreationTimer:", v10);
        [v10 setShareCreationTimer:v14];
        [v10 setRetryState:1];
        v36 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v10 shareCreationTimer]);
        v40 = _NSConcreteStackBlock;
        uint64_t v41 = 3221225472LL;
        v42 = sub_10011EEBC;
        v43 = &unk_1004FD968;
        v44 = self;
        id v37 = v10;
        id v45 = v37;
        dispatch_source_set_event_handler(v36, &v40);

        v38 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "shareCreationTimer", v40, v41, v42, v43, v44));
        dispatch_resume(v38);

        v19 = v45;
LABEL_18:
      }

- (void)retryForType:(int64_t)a3 zoneInfo:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011EC48;
  v13[3] = &unk_1004FD510;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (BOOL)handleRateLimitedError:(id)a3 forZoneInfo:(id)a4 operationType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CKCanRetryForError(v8))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:CKErrorRetryAfterKey]);

    BOOL v12 = v11 != 0LL;
    if (v11)
    {
      [v11 doubleValue];
      double v14 = fmax(v13, 60.0);
      -[ADCloudKitRetryManager retryForTypeOnRetryManagerQueue:zoneInfo:error:retryAfterInterval:]( self,  "retryForTypeOnRetryManagerQueue:zoneInfo:error:retryAfterInterval:",  a5,  v9,  v8,  v14);
      id v15 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        id v17 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v9 zone]);
        int v19 = 136315906;
        dispatch_time_t v20 = "-[ADCloudKitRetryManager handleRateLimitedError:forZoneInfo:operationType:]";
        __int16 v21 = 2112;
        id v22 = v18;
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2048;
        double v26 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Rate limiting initiated for zone (%@): (%@) Retrying in %f seconds",  (uint8_t *)&v19,  0x2Au);
      }
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)cancelRateLimitTimerForZoneInfo:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 rateLimitTimer]);

  if (v4)
  {
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 rateLimitTimer]);
    dispatch_source_cancel(v5);

    [v6 setRateLimitTimer:0];
  }
}

- (void)cancelSyncRetryTimerForZoneInfo:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 syncRetryTimer]);

  if (v4)
  {
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 syncRetryTimer]);
    dispatch_source_cancel(v5);

    [v6 setSyncRetryTimer:0];
  }
}

- (void)cancelRecordZoneSetupTimerForZoneInfo:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneSetupTimer]);

  if (v4)
  {
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 zoneSetupTimer]);
    dispatch_source_cancel(v5);

    [v6 setZoneSetupTimer:0];
  }
}

- (void)cancelSubscriptionSetupTimerForZoneInfo:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 subscriptionSetupTimer]);

  if (v4)
  {
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 subscriptionSetupTimer]);
    dispatch_source_cancel(v5);

    [v6 setSubscriptionSetupTimer:0];
  }
}

- (void)cancelShareCreationTimer:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 shareCreationTimer]);

  if (v4)
  {
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 shareCreationTimer]);
    dispatch_source_cancel(v5);

    [v6 setShareCreationTimer:0];
  }
}

- (void).cxx_destruct
{
}

@end