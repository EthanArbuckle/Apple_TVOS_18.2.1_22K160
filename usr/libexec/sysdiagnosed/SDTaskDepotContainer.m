@interface SDTaskDepotContainer
+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7;
+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7 withCompletionBlock:(id)a8;
- (BOOL)_execute;
- (BOOL)addSDTasksToContainer:(id)a3;
- (BOOL)addSDTasksToContainer:(id)a3 withTmpOutputDir:(id)a4;
- (BOOL)exceededAllowedCPUTime:(unint64_t)a3;
- (BOOL)isConcurrent;
- (BOOL)isRunningAlone;
- (BOOL)mayStartExecuting;
- (BOOL)ranForMaximumTime;
- (BOOL)ranForMinimumTime;
- (BOOL)startTasks;
- (BOOL)startTasksSequentially;
- (NSMutableArray)runningTasks;
- (OS_dispatch_queue)sequentialTasksQueue;
- (OS_dispatch_semaphore)sequentialTasksSem;
- (id)completionBlock;
- (id)createTaskHandlers:(id)a3;
- (id)timeoutMetricsString;
- (int64_t)numExitedTasks;
- (int64_t)numReapedTasks;
- (int64_t)numTimeouts;
- (unint64_t)countCPUTimeUsedNS;
- (unint64_t)cpuTimeUsedNS;
- (unint64_t)reapTasks;
- (unint64_t)wallTimeUsedNS;
- (void)endExecution;
- (void)markTaskAsDone:(id)a3;
- (void)replaceTaskArguments:(id)a3 withSubstitutionKey:(id)a4 withSubstitutionString:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setCpuTimeUsedNS:(unint64_t)a3;
- (void)setIsConcurrent:(BOOL)a3;
- (void)setMayStartExecuting:(BOOL)a3;
- (void)setNumExitedTasks:(int64_t)a3;
- (void)setNumReapedTasks:(int64_t)a3;
- (void)setNumTimeouts:(int64_t)a3;
- (void)setRunningTasks:(id)a3;
- (void)setSequentialTasksQueue:(id)a3;
- (void)setSequentialTasksSem:(id)a3;
- (void)setTasks:(id)a3;
- (void)setWallTimeUsedNS:(unint64_t)a3;
- (void)startTimeout;
@end

@implementation SDTaskDepotContainer

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a7;
  id v13 = a4;
  v14 = -[SDContainer initWithName:andDestination:withDelegate:]( objc_alloc(&OBJC_CLASS___SDTaskDepotContainer),  "initWithName:andDestination:withDelegate:",  v11,  v13,  v12);

  if (v14)
  {
    -[SDTaskContainer setTimeout:](v14, "setTimeout:", a5);
    -[SDTaskDepotContainer setIsConcurrent:](v14, "setIsConcurrent:", v8);
    -[SDTaskDepotContainer setMayStartExecuting:](v14, "setMayStartExecuting:", 1LL);
    -[SDContainer setName:](v14, "setName:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[SDTaskDepotContainer setRunningTasks:](v14, "setRunningTasks:", v15);

    -[SDTaskDepotContainer setNumExitedTasks:](v14, "setNumExitedTasks:", 0LL);
    -[SDTaskDepotContainer setNumReapedTasks:](v14, "setNumReapedTasks:", 0LL);
    -[SDTaskContainer setTimeoutSource:](v14, "setTimeoutSource:", 0LL);
    -[SDTaskDepotContainer setNumTimeouts:](v14, "setNumTimeouts:", 0LL);
    -[SDTaskDepotContainer setCompletionBlock:](v14, "setCompletionBlock:", 0LL);
    -[SDTaskDepotContainer setWallTimeUsedNS:](v14, "setWallTimeUsedNS:", 0LL);
    -[SDTaskDepotContainer setCpuTimeUsedNS:](v14, "setCpuTimeUsedNS:", 0LL);
    -[SDTaskDepotContainer setSequentialTasksQueue:](v14, "setSequentialTasksQueue:", 0LL);
    -[SDTaskDepotContainer setSequentialTasksSem:](v14, "setSequentialTasksSem:", 0LL);
  }

  return v14;
}

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7 withCompletionBlock:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v19 = objc_msgSend( (id)objc_opt_class(a1, v18),  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  v17,  v16,  v9,  v15,  a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v20) {
    [v20 setCompletionBlock:v14];
  }

  return v20;
}

- (BOOL)addSDTasksToContainer:(id)a3
{
  return -[SDTaskDepotContainer addSDTasksToContainer:withTmpOutputDir:]( self,  "addSDTasksToContainer:withTmpOutputDir:",  a3,  0LL);
}

- (BOOL)addSDTasksToContainer:(id)a3 withTmpOutputDir:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
        id v14 = [v13 copy];
        [v12 setDestination:v14];

        if (v7) {
          -[SDTaskDepotContainer replaceTaskArguments:withSubstitutionKey:withSubstitutionString:]( self,  "replaceTaskArguments:withSubstitutionKey:withSubstitutionString:",  v12,  @"<TMPOUTPUTDIR>",  v7);
        }
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
        if (v15)
        {
          id v16 = (void *)v15;
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 providedPIDorProcess]);

          if (v18)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 providedPIDorProcess]);
            -[SDTaskDepotContainer replaceTaskArguments:withSubstitutionKey:withSubstitutionString:]( self,  "replaceTaskArguments:withSubstitutionKey:withSubstitutionString:",  v12,  @"<PID>",  v20);
          }
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([v12 launchPath]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v12 arguments]);
        id v23 = [v22 count];

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingString:@" "]);

          v25 = (void *)objc_claimAutoreleasedReturnValue([v12 arguments]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 componentsJoinedByString:@" "]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingString:v26]);
        }

        if (-[SDContainer evaluateCollectionFlagsWithOverlay:withName:]( self,  "evaluateCollectionFlagsWithOverlay:withName:",  [v12 runtimeChecks],  v21))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer units](self, "units"));
          [v27 addObject:v12];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v9);
  }

  return 1;
}

- (void)markTaskAsDone:(id)a3
{
  id v4 = a3;
  v5 = sub_100024174();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if ((unint64_t)v4 + 1 >= 2 && os_signpost_enabled(v6))
  {
    int v14 = 134217984;
    double v15 = (double)(unint64_t)[v4 cpuTimeUsedNS] / 1000000000.0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v4,  "CLI Task",  "CPU time: %fs",  (uint8_t *)&v14,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
  if (v8)
  {
    id v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
    dispatch_semaphore_signal(v9);
  }

  [v4 executionTime];
  -[SDTaskDepotContainer setWallTimeUsedNS:]( self,  "setWallTimeUsedNS:",  (char *)-[SDTaskDepotContainer wallTimeUsedNS](self, "wallTimeUsedNS") + (unint64_t)(v10 * 1000000000.0));
  -[SDTaskDepotContainer setCpuTimeUsedNS:]( self,  "setCpuTimeUsedNS:",  (char *)[v4 cpuTimeUsedNS] + -[SDTaskDepotContainer cpuTimeUsedNS](self, "cpuTimeUsedNS"));
  -[SDTaskDepotContainer setNumExitedTasks:]( self,  "setNumExitedTasks:",  (char *)-[SDTaskDepotContainer numExitedTasks](self, "numExitedTasks") + 1);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  [v11 removeObject:v4];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  id v13 = [v12 count];

  if (!v13) {
    -[SDTaskDepotContainer endExecution](self, "endExecution");
  }
}

- (id)createTaskHandlers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 taskQueue]);
  id v7 = sub_1000248CC(v4, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 setExitSource:v8];

  id v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v4 exitSource]);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003C460;
  handler[3] = &unk_100089138;
  handler[4] = self;
  id v10 = v4;
  id v22 = v10;
  dispatch_source_set_event_handler(v9, handler);

  id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v10 exitSource]);
  double v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10003C524;
  uint64_t v18 = &unk_100089138;
  id v19 = self;
  id v20 = v10;
  id v12 = v10;
  dispatch_source_set_cancel_handler(v11, &v15);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "exitSource", v15, v16, v17, v18, v19));
  return v13;
}

- (void)endExecution
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 taskQueue]);
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
    dispatch_source_cancel(v6);
  }

  double v7 = (double)-[SDTaskDepotContainer wallTimeUsedNS](self, "wallTimeUsedNS");
  double v8 = (double)-[SDTaskDepotContainer cpuTimeUsedNS](self, "cpuTimeUsedNS") / 1000000000.0;
  -[SDTaskContainer timeout](self, "timeout");
  if (v9 == 0.0)
  {
    double v11 = 0.0;
  }

  else
  {
    -[SDTaskContainer timeout](self, "timeout");
    double v11 = v8 / v10 * 100.0;
  }

  double v12 = v7 / 1000000000.0;
  int64_t v13 = -[SDTaskDepotContainer numExitedTasks](self, "numExitedTasks");
  int64_t v14 = v13 - -[SDTaskDepotContainer numReapedTasks](self, "numReapedTasks");
  double v15 = sub_1000241E4();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
    id v19 = [v18 count];
    double v20 = v8 / v12;
    -[SDTaskContainer timeout](self, "timeout");
    *(_DWORD *)buf = 138414338;
    v45 = v17;
    __int16 v46 = 2048;
    int64_t v47 = v14;
    __int16 v48 = 2048;
    id v49 = v19;
    __int16 v50 = 2048;
    double v51 = v7 / 1000000000.0;
    __int16 v52 = 2048;
    double v53 = v8;
    __int16 v54 = 2048;
    double v55 = v8 / v12;
    __int16 v56 = 2048;
    uint64_t v57 = v21;
    __int16 v58 = 2048;
    double v59 = v11;
    __int16 v60 = 2048;
    int64_t v61 = -[SDTaskDepotContainer numTimeouts](self, "numTimeouts");
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Task Container %@ finished %lu/%lu tasks [wall seconds:%.1f] [CPU seconds:%.1f] [CPU/wall: %.1f%%] [timeout: %.1f] [CPU/timeout: %.1f%%] [numTimeouts: %ld] ",  buf,  0x5Cu);
  }

  else
  {
    double v20 = v8 / v12;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
  id v25 = [v24 count];
  -[SDTaskContainer timeout](self, "timeout");
  [v22 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Task Container %@ finished %lu/%lu tasks [wall seconds:%.1f] [CPU seconds:%.1f] [CPU/wall: %.1f%%] [timeout: %.1f] [CPU/timeout: %.1f%%] [numTimeouts: %ld] ", v23, v14, v25, *(void *)&v12, *(void *)&v8, *(void *)&v20, v26, *(void *)&v11, -[SDTaskDepotContainer numTimeouts](self, "numTimeouts") category msg];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer completionBlock](self, "completionBlock"));
  if (v27)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10003CA58;
    v43[3] = &unk_100088EA8;
    v43[4] = self;
    double v28 = sub_10002484C(v43);
    if (v28 > 1.0)
    {
      v29 = sub_1000241E4();
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100056978(self);
      }

      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      [v31 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v32, *(void *)&v28, 0x3FF0000000000000 category msg];
    }
  }

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 pushBufferDelegate]);
  if (v34)
  {
    v35 = (void *)v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v33 pushBufferDelegate]);
    char v37 = objc_opt_respondsToSelector(v36, "writeReportForTasks:withTimeout:concurrently:withDepotName:");

    if ((v37 & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v33 pushBufferDelegate]);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
      -[SDTaskContainer timeout](self, "timeout");
      double v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      [v38 writeReportForTasks:v39 withTimeout:1 concurrently:v42 withDepotName:v41];
    }
  }

  [v33 recordTaskContainerEnd:self];
}

- (unint64_t)reapTasks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  id v4 = [v3 count];

  if (v4)
  {
    -[SDTaskDepotContainer setMayStartExecuting:](self, "setMayStartExecuting:", 0LL);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
    id v6 = [v5 copy];

    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      unint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          double v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if ([v12 isRunning])
          {
            ++v9;
            [v12 stop];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v8);
    }

    else
    {
      unint64_t v9 = 0LL;
    }

    int64_t v13 = sub_1000241E4();
    int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 134218242;
      unint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Reaping %lu tasks for container: %@",  buf,  0x16u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    [v16 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Reaping %lu tasks for container: %@", v9, v17 category msg];
  }

  else
  {
    if (-[SDTaskDepotContainer mayStartExecuting](self, "mayStartExecuting"))
    {
      -[SDTaskDepotContainer setMayStartExecuting:](self, "setMayStartExecuting:", 0LL);
      -[SDTaskDepotContainer endExecution](self, "endExecution");
    }

    return 0LL;
  }

  return v9;
}

- (id)timeoutMetricsString
{
  int64_t v3 = -[SDTaskDepotContainer numTimeouts](self, "numTimeouts");
  -[SDTaskContainer timeout](self, "timeout");
  uint64_t v5 = v4;
  -[SDTaskContainer elapsedTime](self, "elapsedTime");
  uint64_t v7 = v6;
  double v8 = (double)-[SDTaskDepotContainer countCPUTimeUsedNS](self, "countCPUTimeUsedNS") / 1000000000.0;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"(numTimeouts: %ld) (timeout: %f) (elapsed time: %.2fs) (CPU time used: %.2f) (task containers running: %ld)",  v3,  v5,  v7,  *(void *)&v8,  [v9 numRunningTaskContainers]));

  return v10;
}

- (unint64_t)countCPUTimeUsedNS
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) cpuTimeUsedNS];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)exceededAllowedCPUTime:(unint64_t)a3
{
  double v3 = (double)a3;
  -[SDTaskContainer timeout](self, "timeout");
  return v4 * 1000000000.0 <= v3;
}

- (BOOL)ranForMinimumTime
{
  double v4 = v3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v5 minimumTimeBeforeTimeouts];
  double v7 = v4 + v6;

  -[SDTaskContainer elapsedTime](self, "elapsedTime");
  return v8 >= v7;
}

- (BOOL)ranForMaximumTime
{
  double v4 = v3;
  -[SDTaskContainer timeout](self, "timeout");
  if (v5 >= 60.0) {
    double v6 = v5;
  }
  else {
    double v6 = 60.0;
  }
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v7 minimumTimeBeforeTimeouts];
  BOOL v9 = v4 >= v6 + v8;

  return v9;
}

- (BOOL)isRunningAlone
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  if ([v3 numRunningTaskContainers] == (id)1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = -[SDTaskContainer runByItself](self, "runByItself");
  }

  return v4;
}

- (void)startTimeout
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003D040;
  v3[3] = &unk_100088EA8;
  v3[4] = self;
  -[SDTaskContainer startTimeout:withHandler:](self, "startTimeout:withHandler:", v3);
}

- (void)replaceTaskArguments:(id)a3 withSubstitutionKey:(id)a4 withSubstitutionString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);

  if (v10)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);
    id v12 = [v11 mutableCopy];

    if ([v12 count])
    {
      unint64_t v13 = 0LL;
      do
      {
        int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v13]);

        if ([v15 rangeOfString:v8] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByReplacingOccurrencesOfString:v8 withString:v9]);
          id v17 = sub_1000241E4();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v22 = v8;
            __int16 v23 = 2112;
            unint64_t v24 = v15;
            __int16 v25 = 2112;
            uint64_t v26 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ Substitution found: %@ --> %@",  buf,  0x20u);
          }

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v19 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ Substitution found: %@ --> %@", v8, v15, v16 category msg];

          [v12 replaceObjectAtIndex:v13 withObject:v16];
        }

        ++v13;
      }

      while ((unint64_t)[v12 count] > v13);
    }

    id v20 = [v12 copy];
    [v7 setArguments:v20];
  }

  else
  {
    [v7 setArguments:&__NSArray0__struct];
  }
}

- (BOOL)startTasks
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
  [v3 addObjectsFromArray:v4];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  if ([v5 noTimeout])
  {
  }

  else
  {
    -[SDTaskContainer timeout](self, "timeout");
    double v7 = v6;

    if (v7 > 0.0) {
      -[SDTaskDepotContainer startTimeout](self, "startTimeout");
    }
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
  id v9 = [v8 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v9)
  {
    id v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v51;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(v8);
        }
        int64_t v14 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));

        if (v15)
        {
          uint64_t v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
          dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
        }

        if (!-[SDTaskDepotContainer mayStartExecuting](self, "mayStartExecuting"))
        {
          double v28 = sub_1000241E4();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
            *(_DWORD *)buf = 138412546;
            double v55 = v30;
            __int16 v56 = 2112;
            uint64_t v57 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%@ container] Can't start task %@ in because the container has been stopped",  buf,  0x16u);
          }

          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
          [v32 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Can't start task %@ in because the container has been stopped", v33, v34 category msg];

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
            char v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v36 taskQueue]);
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472LL;
            v49[2] = sub_10003DBDC;
            v49[3] = &unk_100088EA8;
            v49[4] = self;
            dispatch_sync(v37, v49);

            v38 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
            dispatch_semaphore_signal(v38);
          }

          else
          {
            -[SDTaskDepotContainer endExecution](self, "endExecution");
          }

          goto LABEL_29;
        }

        if ([v14 createChild])
        {
          id v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer createTaskHandlers:](self, "createTaskHandlers:", v14));
          dispatch_resume(v17);
          ++v11;
        }

        else
        {
          uint64_t v18 = sub_1000241E4();
          __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            *(_DWORD *)buf = 138412546;
            double v55 = v26;
            __int16 v56 = 2112;
            uint64_t v57 = v27;
            _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to create child process for task %@ in group %@",  buf,  0x16u);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          [v20 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create child process for task %@ in group %@", v21, v22 category msg];

          [v14 setStopped:1];
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));

          if (v23)
          {
            unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
            __int16 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 taskQueue]);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10003DBE4;
            block[3] = &unk_100089138;
            block[4] = self;
            block[5] = v14;
            dispatch_sync(v25, block);

            id v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
            dispatch_semaphore_signal(v17);
          }

          else
          {
            id v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
            -[dispatch_semaphore_s removeObject:](v17, "removeObject:", v14);
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v10) {
        continue;
      }
      break;
    }

- (BOOL)startTasksSequentially
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.sysdiagnose.SDTaskDepotContainer.sequentialTasksQueue", v4);
  -[SDTaskDepotContainer setSequentialTasksQueue:](self, "setSequentialTasksQueue:", v5);

  dispatch_semaphore_t v6 = dispatch_semaphore_create(1LL);
  -[SDTaskDepotContainer setSequentialTasksSem:](self, "setSequentialTasksSem:", v6);

  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksQueue](self, "sequentialTasksQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003DD00;
  block[3] = &unk_100088EA8;
  block[4] = self;
  dispatch_async(v7, block);

  return 1;
}

- (BOOL)_execute
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  if ([v3 mayStartExecuting])
  {
    [v3 recordTaskContainerStart:self];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
    id v5 = [v4 count];

    if (!-[SDTaskDepotContainer isConcurrent](self, "isConcurrent") && (unint64_t)v5 <= 1)
    {
      dispatch_semaphore_t v6 = sub_1000241E4();
      double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100056B18(self);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      [v8 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Container %@ shouldn't be marked as not concurrent because it only has %lu task", v9, v5 category msg];

      -[SDTaskDepotContainer setIsConcurrent:](self, "setIsConcurrent:", 1LL);
    }

    if (-[SDTaskDepotContainer isConcurrent](self, "isConcurrent")) {
      unsigned __int8 v10 = -[SDTaskDepotContainer startTasks](self, "startTasks");
    }
    else {
      unsigned __int8 v10 = -[SDTaskDepotContainer startTasksSequentially](self, "startTasksSequentially");
    }
    BOOL v16 = v10;
  }

  else
  {
    int v11 = sub_1000241E4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 138412290;
      __int128 v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@ container] Can't execute because sysdiagnose has stopped",  buf,  0xCu);
    }

    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    [v14 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Can't execute because sysdiagnose has stopped", v15 category msg];

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isConcurrent
{
  return self->_isConcurrent;
}

- (void)setIsConcurrent:(BOOL)a3
{
  self->_isConcurrent = a3;
}

- (BOOL)mayStartExecuting
{
  return self->_mayStartExecuting;
}

- (void)setMayStartExecuting:(BOOL)a3
{
  self->_mayStartExecuting = a3;
}

- (void)setTasks:(id)a3
{
}

- (NSMutableArray)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
}

- (int64_t)numExitedTasks
{
  return self->_numExitedTasks;
}

- (void)setNumExitedTasks:(int64_t)a3
{
  self->_numExitedTasks = a3;
}

- (int64_t)numReapedTasks
{
  return self->_numReapedTasks;
}

- (void)setNumReapedTasks:(int64_t)a3
{
  self->_numReapedTasks = a3;
}

- (int64_t)numTimeouts
{
  return self->_numTimeouts;
}

- (void)setNumTimeouts:(int64_t)a3
{
  self->_numTimeouts = a3;
}

- (unint64_t)cpuTimeUsedNS
{
  return self->_cpuTimeUsedNS;
}

- (void)setCpuTimeUsedNS:(unint64_t)a3
{
  self->_cpuTimeUsedNS = a3;
}

- (unint64_t)wallTimeUsedNS
{
  return self->_wallTimeUsedNS;
}

- (void)setWallTimeUsedNS:(unint64_t)a3
{
  self->_wallTimeUsedNS = a3;
}

- (OS_dispatch_queue)sequentialTasksQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setSequentialTasksQueue:(id)a3
{
}

- (OS_dispatch_semaphore)sequentialTasksSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setSequentialTasksSem:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 184LL, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end