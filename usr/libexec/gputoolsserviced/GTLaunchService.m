@interface GTLaunchService
- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4;
- (BOOL)launchReplayService:(id)a3 error:(id *)a4;
- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4;
- (BOOL)resumeTaskForPid:(int)a3 error:(id *)a4;
- (GTLaunchService)initWithServiceProvider:(id)a3;
- (void)bringGuestAppToForeground:(int)a3 completionHandler:(id)a4;
- (void)launchReplayerLocallyWithConfiguration:(id)a3 competionHandler:(id)a4;
- (void)launchReplayerLocallyWithConfigurationEmbedded:(id)a3 competionHandler:(id)a4;
- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4;
- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4;
- (void)symbolicatorSignatureForPid:(int)a3 completionHandler:(id)a4;
@end

@implementation GTLaunchService

- (GTLaunchService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GTLaunchService;
  v6 = -[GTLaunchService init](&v10, "init");
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.gputools.transport", "GTLaunchService");
    log = v6->_log;
    v6->_log = v7;

    objc_storeStrong((id *)&v6->_serviceProvider, a3);
  }

  return v6;
}

- (void)symbolicatorSignatureForPid:(int)a3 completionHandler:(id)a4
{
  id v5 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  os_log_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001BEEC;
  v9[3] = &unk_100030EF0;
  int v11 = a3;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)launchReplayerLocallyWithConfigurationEmbedded:(id)a3 competionHandler:(id)a4
{
  id v6 = a4;
  v22[0] = FBSOpenApplicationOptionKeyDebuggingOptions;
  v20[0] = FBSDebugOptionKeyArguments;
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"arguments"]);
  v9 = (void *)v8;
  id v10 = &__NSArray0__struct;
  if (v8) {
    id v10 = (void *)v8;
  }
  v21[0] = v10;
  v20[1] = FBSDebugOptionKeyEnvironment;
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"environment"]);

  v12 = &__NSDictionary0__struct;
  if (v11) {
    v12 = v11;
  }
  v21[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  v23[0] = v13;
  v23[1] = &__kCFBooleanTrue;
  v22[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v22[2] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v23[2] = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v14));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001BDD4;
  v18[3] = &unk_100030F18;
  v18[4] = self;
  id v19 = v6;
  id v17 = v6;
  [v15 openApplication:@"com.apple.MTLReplayer" withOptions:v16 completion:v18];
}

- (void)launchReplayerLocallyWithConfiguration:(id)a3 competionHandler:(id)a4
{
}

- (BOOL)resumeTaskForPid:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = v5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "resumeTaskForPid:%d", buf, 8u);
  }

  mach_error_t v8 = task_read_for_pid(mach_task_self_, v5, &target_task);
  if (!v8)
  {
    mach_error_t v17 = task_resume(target_task);
    if (!v17)
    {
      LOBYTE(v13) = 1;
      return v13;
    }

    mach_error_t v18 = v17;
    id v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed resume task for process %d: %s",  v5,  mach_error_string(v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (a4)
      {
LABEL_11:
        NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
        v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed resume task for process %d: %s",  v5,  mach_error_string(v18));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v32 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  5LL,  v24));

        v25 = self->_log;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v26 = *a4;
          v27 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedDescription]);
          *(_DWORD *)buf = 138412290;
          v34 = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }

    else if (a4)
    {
      goto LABEL_11;
    }

    goto LABEL_14;
  }

  if (!a4)
  {
LABEL_14:
    LOBYTE(v13) = 0;
    return v13;
  }

  NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
  v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to get task port for process %d: %s",  v5,  mach_error_string(v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v36 = v10;
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  4LL,  v11));

  v12 = self->_log;
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    id v14 = *a4;
    v15 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
    *(_DWORD *)buf = 138412290;
    v34 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    goto LABEL_14;
  }

  return v13;
}

- (void)bringGuestAppToForeground:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "bringGuestAppToForeground:%d", buf, 8u);
  }

  mach_error_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v8));

  id v21 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v9,  &v21));
  id v11 = v21;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bundle]);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001BCB0;
    v19[3] = &unk_100030F18;
    v19[4] = self;
    id v20 = v6;
    [v14 openApplication:v13 withOptions:0 completion:v19];
  }

  else
  {
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      id v17 = objc_claimAutoreleasedReturnValue([v11 description]);
      id v18 = [v17 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v23 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Cannot bring app to foreground: error = %s",  buf,  0xCu);
    }

    (*((void (**)(id, void, id))v6 + 2))(v6, 0LL, v11);
  }
}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  mach_error_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 environment]);
  id v9 = modifyReplayerEnvironment(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, @"environment");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 arguments]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, @"arguments");

  uint64_t v12 = qword_10003DCE0;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_10001BBC8;
  NSErrorUserInfoKey v35 = sub_10001BBD8;
  dispatch_semaphore_t v36 = dispatch_semaphore_create(0LL);
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10001BBC8;
  v25 = sub_10001BBD8;
  id v26 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  void v20[2] = sub_10001BC3C;
  v20[3] = &unk_100030F40;
  v20[4] = &v27;
  v20[5] = &v21;
  v20[6] = &v31;
  -[GTLaunchService launchReplayerLocallyWithConfiguration:competionHandler:]( self,  "launchReplayerLocallyWithConfiguration:competionHandler:",  v7,  v20);
  BOOL v13 = (dispatch_semaphore_s *)v32[5];
  dispatch_time_t v14 = dispatch_time(0LL, 1000000000 * v12);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (a4)
    {
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Replayer launch timed out"));
      v38 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  8LL,  v16));
    }
  }

  else if (a4)
  {
    id v17 = (void *)v22[5];
    if (v17) {
      *a4 = v17;
    }
  }

  char v18 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  id v8 = filteredArrayByPort(v7, (id)a3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ([v9 count] == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    v34 = sub_10001BBC8;
    NSErrorUserInfoKey v35 = sub_10001BBD8;
    id v36 = 0LL;
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x2020000000LL;
    char v30 = 0;
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10001BBE0;
    uint64_t v23 = &unk_100030F68;
    v25 = &v27;
    id v26 = &v31;
    id v11 = dispatch_semaphore_create(0LL);
    v24 = v11;
    uint64_t v12 = objc_retainBlock(&v20);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo", v20, v21, v22, v23));
    id v14 = [v13 processIdentifier];

    -[GTLaunchService bringGuestAppToForeground:completionHandler:]( self,  "bringGuestAppToForeground:completionHandler:",  v14,  v12);
    dispatch_time_t v15 = dispatch_time(0LL, 1000000000 * qword_10003DCE0);
    if (dispatch_semaphore_wait(v11, v15))
    {
      if (a4)
      {
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Foreground service timed out"));
        v38 = v16;
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  7LL,  v17));
      }
    }

    else if (a4)
    {
      *a4 = (id) v32[5];
    }

    LOBYTE(a4) = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

    goto LABEL_10;
  }

  if (a4)
  {
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid service port"));
    v40 = v10;
    char v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  6LL,  v18));

    LOBYTE(a4) = 0;
LABEL_10:
  }

  return (char)a4;
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  id v8 = filteredArrayByPort(v7, (id)a3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ([v9 count] == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 processInfo]);
    id v12 = [v11 processIdentifier];

    LOBYTE(a4) = -[GTLaunchService resumeTaskForPid:error:](self, "resumeTaskForPid:error:", v12, a4);
  }

  else if (a4)
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid service port"));
    id v17 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  6LL,  v14));

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  id v8 = filteredArrayByPort(v7, (id)a3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ([v9 count] == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 processInfo]);
    id v12 = [v11 processIdentifier];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001BBBC;
    v13[3] = &unk_100030F90;
    id v14 = v6;
    -[GTLaunchService symbolicatorSignatureForPid:completionHandler:]( self,  "symbolicatorSignatureForPid:completionHandler:",  v12,  v13);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  kern_return_t v13;
  kern_return_t v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  kern_return_t v23;
  kern_return_t v24;
  NSString *v25;
  void *v26;
  GTProcessState *v27;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;
  NSErrorUserInfoKey v30;
  void *v31;
  NSErrorUserInfoKey v32;
  integer_t task_info_out[11];
  int v34;
  NSErrorUserInfoKey v35;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  id v8 = filteredArrayByPort(v7, (id)a3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ([v9 count] != (id)1)
  {
    char v30 = NSLocalizedDescriptionKey;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid service port"));
    uint64_t v31 = v20;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.LaunchService",  6LL,  v21));

LABEL_10:
    v6[2](v6, 0LL, v22);
    goto LABEL_11;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 processInfo]);
  int v12 = [v11 processIdentifier];
  BOOL v13 = task_name_for_pid(mach_task_self_, v12, &tn);
  if (v13)
  {
    id v14 = v13;
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get name port for message destination pid %ld",  v12));
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    *(void *)task_info_out = v15;
    NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  task_info_out,  &v35,  1LL));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v14,  v16));

    char v18 = 0LL;
    id v19 = 0;
  }

  else
  {
    task_info_outCnt = 12;
    uint64_t v23 = task_info(tn, 0x14u, task_info_out, &task_info_outCnt);
    id v19 = v23 == 0;
    if (v23)
    {
      v24 = v23;
      v25 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get task basic info for pid %ld",  v12));
      v32 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v35 = v25;
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v32,  1LL));
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v24,  v26));

      char v18 = 0LL;
    }

    else
    {
      id v17 = 0LL;
      char v18 = v34 != 0;
    }
  }

  v22 = v17;

  if (!v19) {
    goto LABEL_10;
  }
  uint64_t v27 = objc_alloc_init(&OBJC_CLASS___GTProcessState);
  -[GTProcessState setIsSuspended:](v27, "setIsSuspended:", v18);
  ((void (**)(id, GTProcessState *, id))v6)[2](v6, v27, 0LL);

LABEL_11:
}

- (void).cxx_destruct
{
}

@end