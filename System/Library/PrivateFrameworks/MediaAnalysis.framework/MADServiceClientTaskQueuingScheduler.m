@interface MADServiceClientTaskQueuingScheduler
+ (unint64_t)scheduledRequestLimit;
- (BOOL)scheduleTask:(id)a3;
- (MADServiceClientTaskQueuingScheduler)initWithClientBundleID:(id)a3;
- (unint64_t)cancelAllTasks;
- (unint64_t)currentOutstandingTasks;
- (unint64_t)currentPendingTasks;
- (void)cancelTaskWithRequestID:(unint64_t)a3;
- (void)completeTaskWithInfo:(id)a3 madTaskID:(unint64_t)a4;
- (void)submitClientTask:(id)a3 withRequestID:(unint64_t)a4 schedulingErrorHandler:(id)a5;
@end

@implementation MADServiceClientTaskQueuingScheduler

- (MADServiceClientTaskQueuingScheduler)initWithClientBundleID:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MADServiceClientTaskQueuingScheduler;
  v6 = -[MADServiceClientTaskQueuingScheduler init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientBundleID, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingTaskList = v7->_pendingTaskList;
    v7->_pendingTaskList = (NSMutableArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requestIDToScheduledTask = v7->_requestIDToScheduledTask;
    v7->_requestIDToScheduledTask = (NSMutableDictionary *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MADServiceClientTaskQueuingScheduler.management", v13);
    managementQueue = v7->_managementQueue;
    v7->_managementQueue = (OS_dispatch_queue *)v14;
  }

  return v7;
}

+ (unint64_t)scheduledRequestLimit
{
  return 5LL;
}

- (void)completeTaskWithInfo:(id)a3 madTaskID:(unint64_t)a4
{
  id v6 = a3;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100098478;
  block[3] = &unk_1001BC0D8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(managementQueue, block);
}

- (BOOL)scheduleTask:(id)a3
{
  id v4 = a3;
  requestIDToScheduledTask = self->_requestIDToScheduledTask;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 requestID]));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( requestIDToScheduledTask,  "objectForKeyedSubscript:",  v6));

  if (!v7)
  {
    objc_initWeak(&location, self);
    uint64_t v71 = 3221225472LL;
    v72 = sub_100098DCC;
    v73 = &unk_1001BC600;
    v69 = &v75;
    v70 = _NSConcreteStackBlock;
    objc_copyWeak(&v75, &location);
    id v29 = v4;
    id v74 = v29;
    v30 = objc_retainBlock(&v70);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v29 task]);
    id v33 = [v31 addForegroundTask:v32 withQoS:qos_class_self() completionHandler:v30];

    BOOL v28 = v33 != 0LL;
    if (v33)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v33));
      [v29 setScheduledTaskID:v36];

      v37 = self->_requestIDToScheduledTask;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v29 requestID]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v29, v38);

      uint64_t v41 = MediaAnalysisLogLevel(v39, v40);
      if ((int)v41 < 5)
      {
LABEL_20:

        objc_destroyWeak(v69);
        objc_destroyWeak(&location);
        goto LABEL_21;
      }

      uint64_t v43 = VCPLogInstance(v41, v42);
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      os_log_type_t v45 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue([v29 task]);
        v47 = (NSString *)(id)objc_opt_class(v46);
        id v48 = [v29 requestID];
        v49 = (NSString *)objc_claimAutoreleasedReturnValue([v29 scheduledTaskID]);
        clientBundleID = self->_clientBundleID;
        *(_DWORD *)buf = 138413058;
        v78 = v47;
        __int16 v79 = 2048;
        id v80 = v48;
        __int16 v81 = 2112;
        v82 = v49;
        __int16 v83 = 2112;
        v84 = clientBundleID;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  v45,  "[QueuingScheduler] Scheduled foreground task %@ (MADRequestID %lu, VCPMADTaskID %@) for client %@",  buf,  0x2Au);
      }
    }

    else
    {
      uint64_t v51 = MediaAnalysisLogLevel(v34, v35);
      if ((int)v51 >= 3)
      {
        uint64_t v53 = VCPLogInstance(v51, v52);
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        os_log_type_t v55 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue([v29 task]);
          v57 = (NSString *)(id)objc_opt_class(v56);
          id v58 = [v29 requestID];
          v59 = self->_clientBundleID;
          *(_DWORD *)buf = 138412802;
          v78 = v57;
          __int16 v79 = 2048;
          id v80 = v58;
          __int16 v81 = 2112;
          v82 = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "[QueuingScheduler] Failed to schedule foreground task %@ (MADRequestID %lu) for client %@",  buf,  0x20u);
        }
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue([v29 schedulingErrorHandler]);
      BOOL v61 = v60 == 0LL;

      if (v61) {
        goto LABEL_20;
      }
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 schedulingErrorHandler]);
      NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
      v62 = (void *)objc_claimAutoreleasedReturnValue([v29 task]);
      uint64_t v63 = objc_opt_class(v62);
      id v64 = [v29 requestID];
      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to schedule foreground task %@ (MADRequestID %lu)",  v63,  v64,  &v75,  v70,  v71,  v72,  v73));
      v86 = v65;
      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v66));
      (*((void (**)(os_log_s *, void *))v44 + 2))(v44, v67);
    }

    goto LABEL_20;
  }

  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 3)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      v15 = self->_clientBundleID;
      id v16 = [v4 requestID];
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
      *(_DWORD *)buf = 138412802;
      v78 = v15;
      __int16 v79 = 2048;
      id v80 = v16;
      __int16 v81 = 2112;
      v82 = (NSString *)objc_opt_class(v17);
      v18 = v82;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[QueuingScheduler] Client %@ MADRequestID %lu already registered; abandon task %@",
        buf,
        0x20u);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 schedulingErrorHandler]);
  BOOL v20 = v19 == 0LL;

  if (!v20)
  {
    v21 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 schedulingErrorHandler]);
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    id v22 = [v4 requestID];
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
    v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Client MADRequestID %lu already registered; abandon task %@",
            v22,
            objc_opt_class(v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v88 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v26));
    ((void (**)(void, void *))v21)[2](v21, v27);
  }

  BOOL v28 = 0;
LABEL_21:

  return v28;
}

- (void)submitClientTask:(id)a3 withRequestID:(unint64_t)a4 schedulingErrorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = (void (**)(void, void))v9;
  if (v8)
  {
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009906C;
    block[3] = &unk_1001BC628;
    id v23 = v8;
    unint64_t v26 = a4;
    v24 = self;
    v25 = v11;
    dispatch_sync(managementQueue, block);
  }

  else
  {
    uint64_t v13 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v13 >= 3)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v17))
      {
        clientBundleID = self->_clientBundleID;
        *(_DWORD *)buf = 134218242;
        unint64_t v30 = a4;
        __int16 v31 = 2112;
        v32 = clientBundleID;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[QueuingScheduler] MADRequestID %lu registered an invalid task for client %@",  buf,  0x16u);
      }
    }

    if (v11)
    {
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MADRequestID %lu registered an invalid task",  a4));
      BOOL v28 = v19;
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v20));
      ((void (**)(void, void *))v11)[2](v11, v21);
    }
  }
}

- (void)cancelTaskWithRequestID:(unint64_t)a3
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000993F4;
  uint64_t v10 = sub_100099404;
  id v11 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009940C;
  block[3] = &unk_1001BC650;
  void block[5] = &v6;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(managementQueue, block);
  if (v7[5])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    objc_msgSend(v4, "cancelTaskWithID:", objc_msgSend((id)v7[5], "unsignedIntegerValue"));
  }

  _Block_object_dispose(&v6, 8);
}

- (unint64_t)cancelAllTasks
{
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  BOOL v20 = sub_1000993F4;
  v21 = sub_100099404;
  id v22 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000999D0;
  block[3] = &unk_1001BC678;
  void block[4] = self;
  void block[5] = &v17;
  block[6] = &v23;
  dispatch_sync(managementQueue, block);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (id)v18[5];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v6);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADTaskScheduler sharedInstance]( &OBJC_CLASS___VCPMADTaskScheduler,  "sharedInstance",  (void)v12));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 scheduledTaskID]);
        objc_msgSend(v8, "cancelTaskWithID:", objc_msgSend(v9, "unsignedIntegerValue"));

        ++v24[3];
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v27 count:16];
    }

    while (v4);
  }

  unint64_t v10 = v24[3];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

- (unint64_t)currentPendingTasks
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099B74;
  v5[3] = &unk_1001BA030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)currentOutstandingTasks
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099C34;
  v5[3] = &unk_1001BA030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
}

@end