@interface SDTaskDepot
+ (id)sharedTaskDepot;
+ (unint64_t)stopTasks;
+ (void)signalInterrupt;
+ (void)signalStopTasks;
- (BOOL)allTasksComplete;
- (BOOL)mayStartExecuting;
- (BOOL)noTimeout;
- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3;
- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3 withSemaphore:(id)a4;
- (NSMutableArray)allTasksFinishedSemaphoresArray;
- (NSMutableArray)runningTaskContainers;
- (NSString)outputDirectory;
- (OS_dispatch_queue)taskQueue;
- (OS_dispatch_semaphore)defaultAllTasksFinishedSemaphore;
- (SDTaskDepotPushBufferDelegate)pushBufferDelegate;
- (double)minimumTimeBeforeTimeouts;
- (id)taskCompletionBlock;
- (int)totalFailedTasks;
- (int)totalTimeouts;
- (int64_t)numRunningBlocks;
- (int64_t)numRunningHelperTasks;
- (int64_t)numRunningTaskContainers;
- (unint64_t)_reapTasks;
- (unint64_t)totalTaskContainers;
- (unint64_t)totalTasks;
- (void)continueExecution;
- (void)recordBlockTaskEnd;
- (void)recordBlockTaskStart;
- (void)recordHelperTaskEnd;
- (void)recordHelperTaskStart;
- (void)recordTaskContainerEnd:(id)a3;
- (void)recordTaskContainerStart:(id)a3;
- (void)recordTaskEnd;
- (void)setAllTasksFinishedSemaphoresArray:(id)a3;
- (void)setDefaultAllTasksFinishedSemaphore:(id)a3;
- (void)setMayStartExecuting:(BOOL)a3;
- (void)setMinimumTimeBeforeTimeouts:(double)a3;
- (void)setNoTimeout:(BOOL)a3;
- (void)setNumRunningBlocks:(int64_t)a3;
- (void)setNumRunningHelperTasks:(int64_t)a3;
- (void)setNumRunningTaskContainers:(int64_t)a3;
- (void)setOutputDirectory:(id)a3;
- (void)setPushBufferDelegate:(id)a3;
- (void)setRunningTaskContainers:(id)a3;
- (void)setTaskCompletionBlock:(id)a3;
- (void)setTaskQueue:(id)a3;
- (void)setTotalFailedTasks:(int)a3;
- (void)setTotalTaskContainers:(unint64_t)a3;
- (void)setTotalTasks:(unint64_t)a3;
- (void)setTotalTimeouts:(int)a3;
@end

@implementation SDTaskDepot

+ (id)sharedTaskDepot
{
  if (qword_1000A52C8 != -1) {
    dispatch_once(&qword_1000A52C8, &stru_100089A90);
  }
  return (id)qword_1000A52C0;
}

- (void)recordTaskContainerStart:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tasks]);
  -[SDTaskDepot setTotalTasks:]( self,  "setTotalTasks:",  (char *)[v5 count] + -[SDTaskDepot totalTasks](self, "totalTasks"));

  -[SDTaskDepot setTotalTaskContainers:]( self,  "setTotalTaskContainers:",  (char *)-[SDTaskDepot totalTaskContainers](self, "totalTaskContainers") + 1);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  [v6 addObject:v4];
}

- (void)recordTaskContainerEnd:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  [v5 removeObject:v4];

  -[SDTaskDepot recordTaskEnd](self, "recordTaskEnd");
}

- (void)recordHelperTaskStart
{
}

- (void)recordHelperTaskEnd
{
}

- (void)recordBlockTaskStart
{
}

- (void)recordBlockTaskEnd
{
}

- (void)recordTaskEnd
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot taskCompletionBlock](self, "taskCompletionBlock"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDTaskDepot taskCompletionBlock](self, "taskCompletionBlock"));
    v4[2]();
  }

  if (-[SDTaskDepot allTasksComplete](self, "allTasksComplete")) {
    -[SDTaskDepot continueExecution](self, "continueExecution");
  }
}

- (int64_t)numRunningTaskContainers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  id v4 = (char *)[v3 count];
  int64_t v5 = -[SDTaskDepot numRunningHelperTasks](self, "numRunningHelperTasks");
  id v6 = &v4[-[SDTaskDepot numRunningBlocks](self, "numRunningBlocks") + v5];

  return (int64_t)v6;
}

- (BOOL)allTasksComplete
{
  return -[SDTaskDepot numRunningTaskContainers](self, "numRunningTaskContainers") < 1;
}

- (void)continueExecution
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TaskDepot unblocking waiting threads",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v3 stdoutWrite:@"TaskDepot unblocking waiting threads"];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v4 log:@"TaskDepot unblocking waiting threads"];

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
  objc_sync_enter(v5);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3 withSemaphore:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (-[SDTaskDepot allTasksComplete](self, "allTasksComplete"))
    {
      BOOL v7 = 1;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      objc_sync_enter(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      unsigned int v20 = [v19 containsObject:v6];

      if (v20)
      {
        BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v21) {
          sub_100056824(v21, v22, v23, v24, v25, v26, v27, v28);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v29 stderrWrite:@"Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores."];

        v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v30 log:@"Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores."];
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      [v31 addObject:v6];

      objc_sync_exit(v18);
      if (a3) {
        dispatch_time_t v32 = dispatch_time(0LL, 1000000000 * a3);
      }
      else {
        dispatch_time_t v32 = -1LL;
      }
      uint64_t v47 = 0LL;
      v48 = &v47;
      uint64_t v49 = 0x2020000000LL;
      char v50 = 0;
      v40 = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472LL;
      v42 = sub_10003A81C;
      v43 = &unk_100089AB8;
      v45 = &v47;
      id v33 = v6;
      id v44 = v33;
      dispatch_time_t v46 = v32;
      double v34 = sub_10002484C(&v40);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v52 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Blocked thread for %.1fs while waiting for tasks to complete",  buf,  0xCu);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v35,  "log:",  @"Blocked thread for %.1fs while waiting for tasks to complete",  *(void *)&v34,  v40,  v41,  v42,  v43);

      if (*((_BYTE *)v48 + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000567A8(a3);
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend(v36, "log:", @"Timed out waiting for all tasks to complete. Timeout: %llus", a3);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      objc_sync_enter(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      [v38 removeObject:v33];

      objc_sync_exit(v37);
      BOOL v7 = *((_BYTE *)v48 + 24) == 0;

      _Block_object_dispose(&v47, 8);
    }
  }

  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_100056770(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v16 stderrWrite:@"Semaphore to wait for tasks to complete is nil"];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v17 log:@"Semaphore to wait for tasks to complete is nil"];

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot defaultAllTasksFinishedSemaphore](self, "defaultAllTasksFinishedSemaphore"));
  LOBYTE(a3) = -[SDTaskDepot waitUntilAllTasksComplete:withSemaphore:]( self,  "waitUntilAllTasksComplete:withSemaphore:",  a3,  v5);

  return a3;
}

- (unint64_t)_reapTasks
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Trying to reap tasks...",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v3 log:@"Trying to reap tasks..."];

  *(void *)buf = 0LL;
  unsigned int v20 = buf;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  id obj = [v4 copy];

  id v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      BOOL v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
        uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 taskQueue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10003AAE0;
        block[3] = &unk_100089AE0;
        block[4] = v8;
        block[5] = buf;
        dispatch_sync(v10, block);

        BOOL v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v5);
  }

  unint64_t v11 = *((void *)v20 + 3);
  _Block_object_dispose(buf, 8);
  return v11;
}

+ (unint64_t)stopTasks
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stopping TaskDepot.",  buf,  2u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v2 stdoutWrite:@"Stopping TaskDepot."];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v3 log:@"Stopping TaskDepot."];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 taskQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003AC68;
  block[3] = &unk_100088EA8;
  id v11 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = [v6 _reapTasks];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  [v6 waitUntilAllTasksComplete:60 withSemaphore:v8];

  return (unint64_t)v7;
}

+ (void)signalInterrupt
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n",  v5,  2u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", @"\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", @"\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n");

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v4 _reapTasks];
}

+ (void)signalStopTasks
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\nTerminated, cleaning up subtasks and blocking new ones...\n",  buf,  2u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", @"\nTerminated, cleaning up subtasks and blocking new ones...\n");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", @"\nTerminated, cleaning up subtasks and blocking new ones...\n");

  +[SDTaskDepot stopTasks](&OBJC_CLASS___SDTaskDepot, "stopTasks");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Posting stop notification",  v9,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v4 log:@"Posting stop notification"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.sysdiagnose.sysdiagnoseStopped",  0LL,  0LL,  1u);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  dispatch_semaphore_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 outputDirectory]);
  [v6 removeItemAtPath:v8 error:0];
}

- (NSString)outputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOutputDirectory:(id)a3
{
}

- (unint64_t)totalTasks
{
  return self->_totalTasks;
}

- (void)setTotalTasks:(unint64_t)a3
{
  self->_totalTasks = a3;
}

- (unint64_t)totalTaskContainers
{
  return self->_totalTaskContainers;
}

- (void)setTotalTaskContainers:(unint64_t)a3
{
  self->_totalTaskContainers = a3;
}

- (int)totalFailedTasks
{
  return self->_totalFailedTasks;
}

- (void)setTotalFailedTasks:(int)a3
{
  self->_totalFailedTasks = a3;
}

- (int)totalTimeouts
{
  return self->_totalTimeouts;
}

- (void)setTotalTimeouts:(int)a3
{
  self->_totalTimeouts = a3;
}

- (NSMutableArray)runningTaskContainers
{
  return self->_runningTaskContainers;
}

- (void)setRunningTaskContainers:(id)a3
{
}

- (int64_t)numRunningHelperTasks
{
  return self->_numRunningHelperTasks;
}

- (void)setNumRunningHelperTasks:(int64_t)a3
{
  self->_numRunningHelperTasks = a3;
}

- (int64_t)numRunningBlocks
{
  return self->_numRunningBlocks;
}

- (void)setNumRunningBlocks:(int64_t)a3
{
  self->_numRunningBlocks = a3;
}

- (void)setNumRunningTaskContainers:(int64_t)a3
{
  self->_numRunningTaskContainers = a3;
}

- (SDTaskDepotPushBufferDelegate)pushBufferDelegate
{
  return (SDTaskDepotPushBufferDelegate *)objc_loadWeakRetained((id *)&self->_pushBufferDelegate);
}

- (void)setPushBufferDelegate:(id)a3
{
}

- (OS_dispatch_queue)taskQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setTaskQueue:(id)a3
{
}

- (OS_dispatch_semaphore)defaultAllTasksFinishedSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDefaultAllTasksFinishedSemaphore:(id)a3
{
}

- (NSMutableArray)allTasksFinishedSemaphoresArray
{
  return self->_allTasksFinishedSemaphoresArray;
}

- (void)setAllTasksFinishedSemaphoresArray:(id)a3
{
}

- (BOOL)mayStartExecuting
{
  return self->_mayStartExecuting;
}

- (void)setMayStartExecuting:(BOOL)a3
{
  self->_mayStartExecuting = a3;
}

- (BOOL)noTimeout
{
  return self->_noTimeout;
}

- (void)setNoTimeout:(BOOL)a3
{
  self->_noTimeout = a3;
}

- (double)minimumTimeBeforeTimeouts
{
  return self->_minimumTimeBeforeTimeouts;
}

- (void)setMinimumTimeBeforeTimeouts:(double)a3
{
  self->_minimumTimeBeforeTimeouts = a3;
}

- (id)taskCompletionBlock
{
  return objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTaskCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end