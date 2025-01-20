@interface IXSAppUpdateScheduler
+ (id)sharedInstance;
- (BOOL)_onQueue_scheduleUpdateRequestForTask:(id)a3 error:(id *)a4;
- (BOOL)scheduleUpdateInstallForCoordinatorUUID:(id)a3 error:(id *)a4;
- (BOOL)scheduledInstallIsRunning;
- (IXSAppUpdateScheduler)init;
- (NSArray)queuedInstalls;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)scheduleQueue;
- (id)_onQueue_dequeueInstallTask;
- (unint64_t)scheduledInstallCount;
- (void)_onQueue_enqueueInstallTask:(id)a3;
- (void)_onQueue_invokeInstallerForTask:(id)a3;
- (void)_onQueue_registerUpdateRequestForTask:(id)a3;
- (void)_onQueue_removeEnqueuedTask:(id)a3;
- (void)_scheduleNextTask;
- (void)removeUpdateRequestForCoordinatorUUID:(id)a3;
- (void)setQueuedInstalls:(id)a3;
- (void)setScheduledInstallCount:(unint64_t)a3;
- (void)setScheduledInstallIsRunning:(BOOL)a3;
@end

@implementation IXSAppUpdateScheduler

- (IXSAppUpdateScheduler)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IXSAppUpdateScheduler;
  v2 = -[IXSAppUpdateScheduler init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordination.appUpdateScheduler.internal", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.installcoordination.appUpdateScheduler.schedule", v8);
    scheduleQueue = v2->_scheduleQueue;
    v2->_scheduleQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSArray);
    queuedInstalls = v2->_queuedInstalls;
    v2->_queuedInstalls = v11;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003BE68;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8F70 != -1) {
    dispatch_once(&qword_1000E8F70, block);
  }
  return (id)qword_1000E8F68;
}

- (BOOL)scheduledInstallIsRunning
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_scheduledInstallIsRunning;
}

- (void)setScheduledInstallIsRunning:(BOOL)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_scheduledInstallIsRunning = a3;
}

- (void)_onQueue_enqueueInstallTask:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v8 = -[NSArray mutableCopy](self->_queuedInstalls, "mutableCopy");
  [v8 addObject:v4];

  v6 = (NSArray *)[v8 copy];
  queuedInstalls = self->_queuedInstalls;
  self->_queuedInstalls = v6;
}

- (id)_onQueue_dequeueInstallTask
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[NSArray count](self->_queuedInstalls, "count"))
  {
    id v4 = -[NSArray mutableCopy](self->_queuedInstalls, "mutableCopy");
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
    [v4 removeLastObject];
    v6 = (NSArray *)[v4 copy];
    queuedInstalls = self->_queuedInstalls;
    self->_queuedInstalls = v6;
  }

  else
  {
    dispatch_queue_t v5 = 0LL;
  }

  return v5;
}

- (void)_onQueue_removeEnqueuedTask:(id)a3
{
  id v8 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v4);

  if (-[NSArray count](self->_queuedInstalls, "count"))
  {
    id v5 = -[NSArray mutableCopy](self->_queuedInstalls, "mutableCopy");
    [v5 removeObject:v8];
    v6 = (NSArray *)[v5 copy];
    queuedInstalls = self->_queuedInstalls;
    self->_queuedInstalls = v6;
  }
}

- (void)_onQueue_invokeInstallerForTask:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_10003C27C(v4);
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 coordinatorForUUID:v7]);

    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10003C304;
      v13[3] = &unk_1000CCE58;
      v13[4] = self;
      [v9 scheduledAppUpdateReadyToExecuteAndRunBlockWhenComplete:v13];
    }

    else
    {
      v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "-[IXSAppUpdateScheduler _onQueue_invokeInstallerForTask:]";
        __int16 v16 = 2112;
        id v17 = v7;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: No coordinator found for %@. Marking task as completed: %@",  buf,  0x20u);
      }
    }
  }

  else
  {
    v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[IXSAppUpdateScheduler _onQueue_invokeInstallerForTask:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get coordinator uuid from app update task identifier: %@",  buf,  0x16u);
    }
  }
}

- (void)_scheduleNextTask
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003C378;
  v4[3] = &unk_1000CCE58;
  v4[4] = self;
  sub_10005A8F0(v3, v4);
}

- (void)_onQueue_registerUpdateRequestForTask:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  dispatch_queue_attr_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[IXSAppUpdateScheduler _onQueue_registerUpdateRequestForTask:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Registering opportunistic install for %@",  buf,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler scheduleQueue](self, "scheduleQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003C610;
  v11[3] = &unk_1000CE190;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  [v8 registerForTaskWithIdentifier:v10 usingQueue:v9 launchHandler:v11];
}

- (BOOL)_onQueue_scheduleUpdateRequestForTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_queue_attr_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 taskRequestForIdentifier:v6]);
  if (v9)
  {
    id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10007F7B4();
    }
    id v12 = 0LL;
    unsigned __int8 v13 = 1;
    goto LABEL_25;
  }

  v34 = a4;
  v11 = (os_log_s *)[[BGNonRepeatingSystemTaskRequest alloc] initWithIdentifier:v6];
  -[os_log_s setRequiresNetworkConnectivity:](v11, "setRequiresNetworkConnectivity:", 0LL);
  -[os_log_s setRequiresExternalPower:](v11, "setRequiresExternalPower:", 0LL);
  -[os_log_s setPriority:](v11, "setPriority:", 2LL);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  v15 = sub_10003C27C(v6);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 coordinatorForUUID:v16]);

  if (v17)
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identity]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
    id v36 = 0LL;
    BOOL v20 = sub_100031830(v19, 15LL, &v36);
    id v21 = v36;

    if (v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"TEST_MODE_BG_UPDATE_SCHEDULE_AFTER"]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"TEST_MODE_BG_UPDATE_SCHEDULE_BEFORE"]);
      if (v22)
      {
        [v22 doubleValue];
        -[os_log_s setScheduleAfter:](v11, "setScheduleAfter:");
      }

      if (v23)
      {
        [v23 doubleValue];
        -[os_log_s setTrySchedulingBefore:](v11, "setTrySchedulingBefore:");
      }

      goto LABEL_14;
    }
  }

  else
  {
    id v21 = 0LL;
  }

  -[os_log_s setRequiresUserInactivity:](v11, "setRequiresUserInactivity:", 1LL);
LABEL_14:
  v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[IXSAppUpdateScheduler _onQueue_scheduleUpdateRequestForTask:error:]";
    __int16 v39 = 2112;
    v40 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: Scheduling opportunistic install for %@",  buf,  0x16u);
  }

  id v35 = 0LL;
  unsigned __int8 v13 = [v8 submitTaskRequest:v11 error:&v35];
  id v12 = v35;
  if ((v13 & 1) != 0)
  {
    -[IXSAppUpdateScheduler setScheduledInstallCount:]( self,  "setScheduledInstallCount:",  (char *)-[IXSAppUpdateScheduler scheduledInstallCount](self, "scheduledInstallCount") + 1);
  }

  else
  {
    id v33 = v21;
    v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10007F708(v17, (uint64_t)v12, v27);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
    id v30 = sub_10003556C( (uint64_t)"-[IXSAppUpdateScheduler _onQueue_scheduleUpdateRequestForTask:error:]",  236LL,  @"IXErrorDomain",  1uLL,  v12,  0LL,  @"Failed to submit background update request for %@",  v29,  (uint64_t)v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

    if (v34)
    {
      id v12 = v31;
      id *v34 = v12;
    }

    else
    {
      id v12 = v31;
    }

    id v21 = v33;
  }

LABEL_25:
  return v13;
}

- (BOOL)scheduleUpdateInstallForCoordinatorUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v17 = 0LL;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  BOOL v20 = sub_10003CDF8;
  id v21 = sub_10003CE08;
  id v22 = 0LL;
  dispatch_queue_attr_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003CE10;
  v12[3] = &unk_1000CE1B8;
  id v8 = v6;
  id v13 = v8;
  objc_super v14 = self;
  v15 = &v23;
  __int16 v16 = &v17;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v9 = *((unsigned __int8 *)v24 + 24);
  }

  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (void)removeUpdateRequestForCoordinatorUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppUpdateScheduler internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D08C;
  block[3] = &unk_1000CCCB8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)scheduleQueue
{
  return self->_scheduleQueue;
}

- (unint64_t)scheduledInstallCount
{
  return self->_scheduledInstallCount;
}

- (void)setScheduledInstallCount:(unint64_t)a3
{
  self->_scheduledInstallCount = a3;
}

- (NSArray)queuedInstalls
{
  return self->_queuedInstalls;
}

- (void)setQueuedInstalls:(id)a3
{
}

- (void).cxx_destruct
{
}

@end