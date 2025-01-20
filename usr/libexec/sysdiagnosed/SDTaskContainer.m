@interface SDTaskContainer
- (BOOL)_execute;
- (BOOL)blockUntilFinished;
- (BOOL)execute;
- (BOOL)executeFromCallback;
- (BOOL)runByItself;
- (BOOL)setStartDate:(id)a3 AndExecuteFromCallback:(BOOL)a4;
- (NSDate)startDate;
- (NSMutableArray)directories;
- (NSString)displayName;
- (OS_dispatch_source)timeoutSource;
- (double)elapsedTime;
- (double)timeout;
- (void)applyContainerOverride:(id)a3;
- (void)resetTimeout:(int64_t)a3;
- (void)setBlockUntilFinished:(BOOL)a3;
- (void)setDirectories:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setRunByItself:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutSource:(id)a3;
- (void)startTimeout:(double)a3 withHandler:(id)a4;
@end

@implementation SDTaskContainer

- (void)applyContainerOverride:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"timeout"]);
  if (v4)
  {
    id v5 = v4;
    [v4 doubleValue];
    -[SDTaskContainer setTimeout:](self, "setTimeout:");
    v4 = v5;
  }
}

- (void)resetTimeout:(int64_t)a3
{
  source = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  dispatch_time_t v4 = dispatch_time(0LL, 1000000000 * a3);
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

- (void)startTimeout:(double)a3 withHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 taskQueue]);
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
  -[SDTaskContainer setTimeoutSource:](self, "setTimeoutSource:", v9);

  -[SDTaskContainer resetTimeout:](self, "resetTimeout:", (uint64_t)a3);
  v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  dispatch_source_set_event_handler(v10, v6);

  v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  dispatch_resume(v11);
}

- (BOOL)_execute
{
}

- (double)elapsedTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer startDate](self, "startDate"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)setStartDate:(id)a3 AndExecuteFromCallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  v8 = sub_1000241E4();
  dispatch_source_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    *(_DWORD *)buf = 138412290;
    double v31 = *(double *)&v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Executing task container: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
  [v11 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Executing task container: %@", v12 category msg];

  if (v4)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10003B5C4;
    v24[3] = &unk_100089110;
    v24[4] = self;
    v25[0] = v6;
    v25[1] = &v26;
    double v13 = sub_10002484C(v24);
    v14 = sub_1000241E4();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 134218242;
      double v31 = v13;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "taskQueue thread spent %.1f seconds blocked waiting for %@ to finish",  buf,  0x16u);
    }

    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    -[dispatch_queue_s logWithSubsystem:category:msg:]( v17,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"taskQueue thread spent %.1f seconds blocked waiting for %@ to finish",  *(void *)&v13,  v18);

    v19 = (id *)v25;
  }

  else
  {
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 taskQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B5FC;
    block[3] = &unk_100089110;
    block[4] = self;
    v19 = (id *)v23;
    v23[0] = v6;
    v23[1] = &v26;
    dispatch_sync(v17, block);
  }

  BOOL v20 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v20;
}

- (BOOL)executeFromCallback
{
  unsigned __int8 v3 = -[SDTaskContainer blockUntilFinished](self, "blockUntilFinished");
  unsigned int v4 = -[SDTaskContainer runByItself](self, "runByItself");
  if ((v3 & 1) != 0 || v4) {
    sub_10005685C();
  }
  -[SDContainer updateContainerWithOverride](self, "updateContainerWithOverride");
  if (!-[SDContainer evaluateCollectionFlags](self, "evaluateCollectionFlags")) {
    return 0;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v6 = 1;
  unsigned __int8 v7 = -[SDTaskContainer setStartDate:AndExecuteFromCallback:](self, "setStartDate:AndExecuteFromCallback:", v5, 1LL);

  if ((v7 & 1) == 0)
  {
    v8 = sub_1000241E4();
    dispatch_source_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100056884(self);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to execute %@", v11 category msg];

    return 0;
  }

  return v6;
}

- (BOOL)execute
{
  v2 = self;
  uint64_t v6 = 0LL;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  unsigned __int8 v3 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[SDContainer executionActivity](self, "executionActivity"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003B804;
  v5[3] = &unk_100088ED0;
  v5[4] = v2;
  v5[5] = &v6;
  os_activity_apply(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableArray)directories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDirectories:(id)a3
{
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)runByItself
{
  return self->_runByItself;
}

- (void)setRunByItself:(BOOL)a3
{
  self->_runByItself = a3;
}

- (BOOL)blockUntilFinished
{
  return self->_blockUntilFinished;
}

- (void)setBlockUntilFinished:(BOOL)a3
{
  self->_blockUntilFinished = a3;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end