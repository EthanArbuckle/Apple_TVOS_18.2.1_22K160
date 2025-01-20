@interface _DASBGSystemTaskHelper
+ (OS_dispatch_queue)activityQueue;
+ (_DASBGSystemTaskHelper)sharedInstance;
- (BOOL)dasSubmitActivity:(id)a3 error:(id *)a4;
- (BOOL)dasSubmitActivity:(id)a3 withClientOffset:(double)a4 error:(id *)a5;
- (BOOL)sendToPPS:(id)a3;
- (NSDate)currentBootupDate;
- (PPSTelemetryIdentifier)ppsID;
- (_DASBGSystemTaskHelper)init;
- (double)uptimeSeconds;
- (id)bootupDate;
- (id)serviceNameFromToken:(unint64_t)a3;
- (unint64_t)reasonForActivitySuspension:(id)a3;
- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6;
- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 retryAfter:(double)a6 completionHandler:(id)a7;
- (void)completeSystemTaskWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6;
- (void)dasCancelActivity:(id)a3;
- (void)dasCompleteActivity:(id)a3;
- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 retryAfter:(double)a6 completionHandler:(id)a7;
- (void)inspect:(id)a3 withHandler:(id)a4;
- (void)recordTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 withPID:(int)a8 withUID:(unsigned int)a9 completionHandler:(id)a10;
- (void)registerTimeChangeNotification;
- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7;
- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7;
- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5;
- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7;
- (void)resubmitRunningTasks:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5;
- (void)resumeTaskSchedulingWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6;
- (void)runActivity:(id)a3;
- (void)setCurrentBootupDate:(id)a3;
- (void)setPpsID:(PPSTelemetryIdentifier *)a3;
- (void)setupPublisher;
- (void)significantTimeChangeHandler:(id)a3;
- (void)startWithListener:(id)a3;
- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7;
- (void)suspendActivity:(id)a3;
- (void)unregisterSystemTaskWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6;
- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7;
@end

@implementation _DASBGSystemTaskHelper

+ (_DASBGSystemTaskHelper)sharedInstance
{
  if (qword_100157BC0 != -1) {
    dispatch_once(&qword_100157BC0, &stru_1001167B8);
  }
  return (_DASBGSystemTaskHelper *)(id)qword_100157BB8;
}

+ (OS_dispatch_queue)activityQueue
{
  return (OS_dispatch_queue *)(id)qword_100157BC8;
}

- (_DASBGSystemTaskHelper)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASBGSystemTaskHelper;
  v2 = -[_DASBGSystemTaskHelper init](&v14, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](&OBJC_CLASS____DASDaemonLogger, "logForCategory:", @"BGSTHelper"));
  v4 = (void *)qword_100157BD0;
  qword_100157BD0 = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = (void *)qword_100157BD8;
  qword_100157BD8 = (uint64_t)v5;

  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.bg.system.task", v8);
  v10 = (void *)qword_100157BC8;
  qword_100157BC8 = (uint64_t)v9;

  -[_DASBGSystemTaskHelper setupPublisher](v2, "setupPublisher");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_DASBGSystemTaskHelper bootupDate](v2, "bootupDate"));
  currentBootupDate = v2->_currentBootupDate;
  v2->_currentBootupDate = (NSDate *)v11;

  -[_DASBGSystemTaskHelper registerTimeChangeNotification](v2, "registerTimeChangeNotification");
  return v2;
}

- (id)serviceNameFromToken:(unint64_t)a3
{
  if (xpc_get_service_identifier_for_token(a3, v6))
  {
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    if (-[__CFString hasPrefix:](v3, "hasPrefix:", @"com.apple."))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString stringByReplacingOccurrencesOfString:withString:]( v3,  "stringByReplacingOccurrencesOfString:withString:",  @"com.apple.",  &stru_100118C98));

      return v4;
    }
  }

  else
  {
    uint64_t v3 = &stru_100118C98;
  }

  return v3;
}

- (void)setupPublisher
{
  uint64_t v3 = xpc_event_publisher_create("com.apple.bg.system.task", qword_100157BC8);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)qword_100157BE0;
  qword_100157BE0 = v4;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100066214;
  v7[3] = &unk_1001167E0;
  v7[4] = self;
  v6 = objc_retainBlock(v7);
  xpc_event_publisher_set_handler(qword_100157BE0, v6);
}

- (void)startWithListener:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (os_log_s *)qword_100157BD0;
  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Creating scheduler with endpoint to listener by DAS",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 endpoint]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[_DASScheduler schedulerWithEndpoint:withClientName:]( &OBJC_CLASS____DASScheduler,  "schedulerWithEndpoint:withClientName:",  v5,  _DASClientNameBGST));
  dispatch_queue_attr_t v7 = (void *)qword_100157BE8;
  qword_100157BE8 = v6;

  v8 = (os_log_s *)qword_100157BD0;
  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activating listener sent by DAS", v12, 2u);
  }

  [v3 activate];
  dispatch_queue_t v9 = (os_log_s *)qword_100157BD0;
  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating publisher", v11, 2u);
  }

  xpc_event_publisher_activate(qword_100157BE0);
  dispatch_time_t v10 = dispatch_time(0LL, 10000000000LL);
  dispatch_after(v10, (dispatch_queue_t)qword_100157BC8, &stru_100116800);
}

- (BOOL)dasSubmitActivity:(id)a3 withClientOffset:(double)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity activityWithDASBGSystemTask:withClientOffset:]( &OBJC_CLASS____DASActivity,  "activityWithDASBGSystemTask:withClientOffset:",  v7,  a4));
  objc_msgSend(v7, "setScheduler_activity:", v8);

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "group_name"));
  if (v9)
  {
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "group_name"));
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( _DASActivityGroup,  "groupWithName:maxConcurrent:",  v10,  objc_msgSend(v7, "group_concurrency_limit")));
  }

  uint64_t v11 = (void *)qword_100157BE8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheduler_activity"));
  id v21 = 0LL;
  unsigned int v13 = [v11 submitActivity:v12 inGroup:v9 error:&v21];
  id v14 = v21;

  if (!v13)
  {
    v19 = (void *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      sub_1000B60DC(v19);
      if (!a5) {
        goto LABEL_9;
      }
    }

    else if (!a5)
    {
      goto LABEL_9;
    }

    *a5 = v14;
    goto LABEL_9;
  }

  [v7 setState:1];
  v15 = (void *)qword_100157BD0;
  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheduler_activity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 debugDescription]);
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    __int16 v24 = 2048;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Submitted %{public}@ (BGST %p)", buf, 0x16u);
  }

- (BOOL)dasSubmitActivity:(id)a3 error:(id *)a4
{
  return -[_DASBGSystemTaskHelper dasSubmitActivity:withClientOffset:error:]( self,  "dasSubmitActivity:withClientOffset:error:",  a3,  a4,  0.0);
}

- (void)dasCancelActivity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dispatchSourceProcessExit]);

  if (v4)
  {
    v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v3 dispatchSourceProcessExit]);
    dispatch_source_cancel(v5);

    [v3 setDispatchSourceProcessExit:0];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));

  if (v6)
  {
    id v7 = (void *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
      int v12 = 138543618;
      unsigned int v13 = v9;
      __int16 v14 = 2048;
      id v15 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Canceling %{public}@ (BGST %p)",  (uint8_t *)&v12,  0x16u);
    }

    dispatch_time_t v10 = (void *)qword_100157BE8;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
    [v10 activityCanceled:v11];

    objc_msgSend(v3, "setScheduler_activity:", 0);
  }

  [v3 setSuspensionReason:-1];
}

- (void)dasCompleteActivity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dispatchSourceProcessExit]);

  if (v5)
  {
    uint64_t v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v4 dispatchSourceProcessExit]);
    dispatch_source_cancel(v6);

    [v4 setDispatchSourceProcessExit:0];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));

  if (v7)
  {
    if ([v4 state] == (id)8 || !objc_msgSend(v4, "state"))
    {
      int v12 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = v12;
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v19 = 138543618;
        v20 = v14;
        __int16 v21 = 2048;
        id v22 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Trying to complete DASActivity for %{public}@ (BGST %p) but it is completed / not scheduled",  (uint8_t *)&v19,  0x16u);
      }
    }

    else
    {
      id v8 = [v4 state];
      dispatch_queue_t v9 = (void *)qword_100157BD0;
      if (v8 == (id)2)
      {
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_time_t v10 = v9;
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          int v19 = 138543618;
          v20 = v11;
          __int16 v21 = 2048;
          id v22 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Trying to complete DASActivity for %{public}@ (BGST %p) but it never started, likely forced. Canceling instead.",  (uint8_t *)&v19,  0x16u);
        }

        -[_DASBGSystemTaskHelper dasCancelActivity:](self, "dasCancelActivity:", v4);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_INFO))
        {
          id v15 = v9;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
          int v19 = 138543618;
          v20 = v16;
          __int16 v21 = 2048;
          id v22 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Completing %{public}@ (BGST %p)",  (uint8_t *)&v19,  0x16u);
        }

        v17 = (void *)qword_100157BE8;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
        [v17 activityCompleted:v18];

        objc_msgSend(v4, "setScheduler_activity:", 0);
      }
    }
  }

  [v4 setState:8];
  [v4 setSuspensionReason:-1];
}

- (void)runActivity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 state];
  if (v5 <= 8)
  {
    if (((1LL << v5) & 0x11D) != 0)
    {
      uint64_t v6 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_INFO))
      {
        id v7 = v6;
        int v15 = 138543618;
        id v16 = v4;
        __int16 v17 = 2048;
        id v18 = [v4 state];
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Invalid state to run task %{public}@: %ld, Cancelling",  (uint8_t *)&v15,  0x16u);
      }

      -[_DASBGSystemTaskHelper dasCancelActivity:](self, "dasCancelActivity:", v4);
    }

    else if (((1LL << v5) & 0xA2) != 0)
    {
      id v8 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_INFO))
      {
        dispatch_queue_t v9 = v8;
        dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v15 = 138543874;
        id v16 = v10;
        __int16 v17 = 2048;
        id v18 = [v4 state];
        __int16 v19 = 2048;
        uint64_t v20 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%{public}@ state change %ld -> %ld",  (uint8_t *)&v15,  0x20u);
      }

      uint64_t v11 = (os_log_s *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Initiating BGST: %{public}@",  (uint8_t *)&v15,  0xCu);
      }

      [v4 setState:2];
      int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v4 markStarted:v12];

      xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_BOOL(v13, "run", 1);
      if (xpc_event_publisher_fire(qword_100157BE0, [v4 token], v13))
      {
        __int16 v14 = (void *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
          sub_1000B6184(v14);
        }
      }
    }
  }
}

- (void)suspendActivity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 state];
  if (v5 <= 8)
  {
    if (((1LL << v5) & 0x1B7) != 0)
    {
      uint64_t v6 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_INFO))
      {
        id v7 = v6;
        int v19 = 138543618;
        id v20 = v4;
        __int16 v21 = 2048;
        id v22 = [v4 state];
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Invalid state to suspend task %{public}@: %ld, Cancelling",  (uint8_t *)&v19,  0x16u);
      }

      -[_DASBGSystemTaskHelper dasCancelActivity:](self, "dasCancelActivity:", v4);
    }

    else if (v5 == 3)
    {
      id v8 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_INFO))
      {
        dispatch_queue_t v9 = v8;
        dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v19 = 138543874;
        id v20 = v10;
        __int16 v21 = 2048;
        id v22 = [v4 state];
        __int16 v23 = 2048;
        uint64_t v24 = 4LL;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%{public}@ state change %ld -> %ld",  (uint8_t *)&v19,  0x20u);
      }

      uint64_t v11 = (os_log_s *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Suspending BGST: %{public}@",  (uint8_t *)&v19,  0xCu);
      }

      [v4 setState:4];
      xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_BOOL(v12, "run", 0);
      xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
      int64_t v14 = -[_DASBGSystemTaskHelper reasonForActivitySuspension:](self, "reasonForActivitySuspension:", v13);

      [v4 setSuspensionReason:v14];
      int v15 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
        int v19 = 138412546;
        id v20 = v17;
        __int16 v21 = 2048;
        id v22 = (id)v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Suspending %@ with reason: %lu",  (uint8_t *)&v19,  0x16u);
      }

      if (v14) {
        xpc_dictionary_set_int64(v12, "expirationReason", v14);
      }
      if (xpc_event_publisher_fire(qword_100157BE0, [v4 token], v12))
      {
        id v18 = (void *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
          sub_1000B620C(v18);
        }
      }
    }
  }
}

- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void, uint64_t))a6;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100067734;
  id v25 = sub_100067744;
  id v26 = 0LL;
  xpc_object_t v12 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006774C;
  block[3] = &unk_100116850;
  id v13 = v10;
  __int16 v17 = &v21;
  id v18 = &v27;
  unsigned int v19 = a5;
  int v20 = a4;
  id v15 = v13;
  id v16 = self;
  dispatch_sync(v12, block);
  v11[2](v11, *((unsigned __int8 *)v28 + 24), v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 retryAfter:(double)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = (void (**)(void))a7;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  *(double *)&v23[3] = a6;
  int64_t v14 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067EB0;
  block[3] = &unk_100116878;
  id v15 = v12;
  unsigned int v21 = a5;
  int v22 = a4;
  double v20 = a6;
  id v18 = self;
  unsigned int v19 = v23;
  id v17 = v15;
  dispatch_sync(v14, block);
  v13[2](v13);

  _Block_object_dispose(v23, 8);
}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 retryAfter:(double)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = (void (**)(id, void))a7;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 1;
  int64_t v14 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000682DC;
  block[3] = &unk_100116878;
  id v15 = v12;
  unsigned int v21 = a5;
  int v22 = a4;
  id v18 = self;
  unsigned int v19 = &v23;
  id v17 = v15;
  double v20 = a6;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v24 + 24));

  _Block_object_dispose(&v23, 8);
}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  int64_t v14 = (void (**)(id, void))a7;
  uint64_t v25 = 0LL;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  id v15 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068634;
  block[3] = &unk_1001168C8;
  id v16 = v12;
  unsigned int v23 = a6;
  int v24 = a5;
  id v19 = v16;
  int v22 = &v25;
  id v17 = v13;
  id v20 = v17;
  unsigned int v21 = self;
  dispatch_sync(v15, block);
  v14[2](v14, *((unsigned __int8 *)v26 + 24));

  _Block_object_dispose(&v25, 8);
}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  int64_t v14 = (void (**)(id, void))a7;
  uint64_t v25 = 0LL;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  id v15 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068BB8;
  block[3] = &unk_1001168F0;
  id v16 = v12;
  id v19 = v16;
  unsigned int v23 = a6;
  int v24 = a5;
  id v17 = v13;
  id v20 = v17;
  unsigned int v21 = self;
  int v22 = &v25;
  dispatch_sync(v15, block);
  v14[2](v14, *((unsigned __int8 *)v26 + 24));

  _Block_object_dispose(&v25, 8);
}

- (void)completeSystemTaskWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068FB8;
  block[3] = &unk_100115510;
  unsigned int v17 = a5;
  int v18 = a4;
  id v15 = v10;
  id v16 = self;
  id v13 = v10;
  id v12 = (void (**)(void))a6;
  dispatch_sync(v11, block);
  v12[2](v12);
}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = (void (**)(id, void))a6;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  uint64_t v11 = (dispatch_queue_s *)qword_100157BC8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000693F8;
  v13[3] = &unk_100116918;
  id v12 = v9;
  unsigned int v17 = a5;
  id v14 = v12;
  id v15 = self;
  id v16 = &v18;
  dispatch_sync(v11, v13);
  v10[2](v10, *((unsigned __int8 *)v19 + 24));

  _Block_object_dispose(&v18, 8);
}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void))a6;
  uint64_t v20 = 0LL;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  id v12 = (dispatch_queue_s *)qword_100157BC8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100069640;
  v14[3] = &unk_100116940;
  id v13 = v10;
  unsigned int v18 = a5;
  int v19 = a4;
  id v16 = self;
  unsigned int v17 = &v20;
  id v15 = v13;
  dispatch_sync(v12, v14);
  v11[2](v11, *((unsigned __int8 *)v21 + 24));

  _Block_object_dispose(&v20, 8);
}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  unsigned int v18 = sub_100067734;
  int v19 = sub_100067744;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006993C;
  block[3] = &unk_100116968;
  id v10 = v7;
  BOOL v14 = a4;
  id v12 = v10;
  id v13 = &v15;
  dispatch_sync(v9, block);
  v8[2](v8, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100067734;
  id v16 = sub_100067744;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (dispatch_queue_s *)qword_100157BC8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100069BC4;
  v9[3] = &unk_100115288;
  id v8 = v5;
  id v10 = v8;
  uint64_t v11 = &v12;
  dispatch_sync(v7, v9);
  v6[2](v6, v13[5]);

  _Block_object_dispose(&v12, 8);
}

- (void)resubmitRunningTasks:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5
{
  id v7 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = sub_100067734;
  v15[4] = sub_100067744;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069E00;
  block[3] = &unk_100116990;
  unsigned int v13 = a5;
  int v14 = a4;
  id v11 = v7;
  uint64_t v12 = v15;
  id v9 = v7;
  dispatch_sync(v8, block);

  _Block_object_dispose(v15, 8);
}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  unsigned int v13 = (void (**)(id, void, uint64_t))a7;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 1;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100067734;
  char v28 = sub_100067744;
  id v29 = 0LL;
  int v14 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A26C;
  block[3] = &unk_100116850;
  id v15 = v11;
  unsigned int v22 = a6;
  int v23 = a5;
  id v18 = v15;
  id v20 = &v24;
  char v21 = &v30;
  id v16 = v12;
  id v19 = v16;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v31 + 24), v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  unsigned int v13 = (void (**)(id, void, uint64_t))a7;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 1;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100067734;
  char v28 = sub_100067744;
  id v29 = 0LL;
  int v14 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A610;
  block[3] = &unk_100116850;
  id v15 = v11;
  unsigned int v22 = a6;
  int v23 = a5;
  id v18 = v15;
  id v20 = &v24;
  char v21 = &v30;
  id v16 = v12;
  id v19 = v16;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v31 + 24), v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  unsigned int v13 = (void (**)(id, void, uint64_t))a7;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 1;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100067734;
  char v28 = sub_100067744;
  id v29 = 0LL;
  int v14 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A9AC;
  block[3] = &unk_100116850;
  id v15 = v12;
  unsigned int v22 = a6;
  int v23 = a5;
  id v18 = v15;
  id v20 = &v24;
  char v21 = &v30;
  id v16 = v11;
  id v19 = v16;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v31 + 24), v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)recordTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 withPID:(int)a8 withUID:(unsigned int)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v16 = a7;
  id v17 = (void (**)(id, void))a10;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  id v18 = (dispatch_queue_s *)qword_100157BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006ACF8;
  block[3] = &unk_1001169B8;
  id v19 = v15;
  id v22 = v19;
  unint64_t v26 = a4;
  unint64_t v27 = a5;
  unint64_t v28 = a6;
  id v20 = v16;
  uint64_t v24 = self;
  uint64_t v25 = &v29;
  id v23 = v20;
  dispatch_sync(v18, block);
  v17[2](v17, *((unsigned __int8 *)v30 + 24));

  _Block_object_dispose(&v29, 8);
}

- (BOOL)sendToPPS:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  unsigned __int8 v5 = [v4 sendDataToPPS:v3 subsystem:@"BackgroundProcessing" category:@"TaskWorkload"];

  return v5;
}

- (void)registerTimeChangeNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"significantTimeChangeHandler:" name:NSSystemTimeZoneDidChangeNotification object:0];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"significantTimeChangeHandler:" name:NSSystemClockDidChangeNotification object:0];
}

- (void)significantTimeChangeHandler:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTaskHelper bootupDate](self, "bootupDate", a3));
  [v4 timeIntervalSinceDate:self->_currentBootupDate];
  if (v5 == 0.0)
  {
    uint64_t v6 = qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Time change: No clock shift observed";
      id v8 = (os_log_s *)v6;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }

  else
  {
    double v9 = v5;
    double v10 = fabs(v5);
    id v11 = (os_log_s *)qword_100157BD0;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT);
    if (v10 >= 30.0)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        double v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Time change: Clock shifted by %lf secs",  buf,  0xCu);
      }

      objc_storeStrong((id *)&self->_currentBootupDate, v4);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10006B118;
      v13[3] = &unk_100115DC8;
      *(double *)&v13[5] = v9;
      void v13[4] = self;
      dispatch_async((dispatch_queue_t)qword_100157BC8, v13);
    }

    else if (v12)
    {
      *(_WORD *)buf = 0;
      id v7 = "Time change: Accumulated clock shift is less than 30 sec";
      id v8 = v11;
      goto LABEL_7;
    }
  }
}

- (unint64_t)reasonForActivitySuspension:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 lastDenialValue];
  return (+[_DASPolicyManager bitmaskForPolicy:]( &OBJC_CLASS____DASPolicyManager,  "bitmaskForPolicy:",  @"Limitations") & v3) != 0;
}

- (double)uptimeSeconds
{
  *(void *)id v7 = 0x1500000001LL;
  size_t v4 = 16LL;
  sysctl(v7, 2u, &v5, &v4, 0LL, 0LL);
  gettimeofday(&v3, 0LL);
  return ((double)(v3.tv_usec - v6) + (double)(v3.tv_sec - v5) * 1000000.0) / 1000000.0;
}

- (id)bootupDate
{
  return +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v2);
}

- (NSDate)currentBootupDate
{
  return self->_currentBootupDate;
}

- (void)setCurrentBootupDate:(id)a3
{
}

- (PPSTelemetryIdentifier)ppsID
{
  return self->_ppsID;
}

- (void)setPpsID:(PPSTelemetryIdentifier *)a3
{
  self->_ppsID = a3;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end