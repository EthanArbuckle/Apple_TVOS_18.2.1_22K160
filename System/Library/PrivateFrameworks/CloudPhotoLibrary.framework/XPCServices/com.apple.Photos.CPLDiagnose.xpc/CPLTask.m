@interface CPLTask
+ (BOOL)waitForAllLongTasksToFinish;
+ (id)taskWithCommand:(id)a3;
+ (id)taskWithCommandAndArguments:(id)a3;
+ (void)_enqueueTaskCompletionForLaterWait:(id)a3;
- (BOOL)canTimeout;
- (BOOL)cleanupEmptyFiles;
- (BOOL)waitInBackgroundIfTaskTimesOut;
- (CPLTask)init;
- (NSArray)argv;
- (NSPipe)stdinPipe;
- (NSString)command;
- (NSString)redirectStderrToFileAtPath;
- (NSString)redirectStdoutToFileAtPath;
- (char)environ;
- (id)_waitDeadline;
- (int)redirectStderrToFileDescriptor;
- (int)redirectStdoutToFileDescriptor;
- (int)timeout;
- (int)waitStatus;
- (int64_t)exec;
- (int64_t)executeWithPIDHandler:(id)a3 endHandler:(id)a4;
- (void)_updateWaitDeadline;
- (void)resetRedirect;
- (void)setArgv:(id)a3;
- (void)setCanTimeout:(BOOL)a3;
- (void)setCleanupEmptyFiles:(BOOL)a3;
- (void)setCommand:(id)a3;
- (void)setCommandWithArguments:(id)a3;
- (void)setEnviron:(char *)a3;
- (void)setRedirectStderrToFileAtPath:(id)a3;
- (void)setRedirectStderrToFileDescriptor:(int)a3;
- (void)setRedirectStdoutToFileAtPath:(id)a3;
- (void)setRedirectStdoutToFileDescriptor:(int)a3;
- (void)setStdinPipe:(id)a3;
- (void)setTimeout:(int)a3;
- (void)setWaitInBackgroundIfTaskTimesOut:(BOOL)a3;
@end

@implementation CPLTask

+ (void)_enqueueTaskCompletionForLaterWait:(id)a3
{
  id v3 = a3;
  v4 = (void *)qword_10003D358;
  id v7 = v3;
  if (!qword_10003D358)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v6 = (void *)qword_10003D358;
    qword_10003D358 = (uint64_t)v5;

    id v3 = v7;
    v4 = (void *)qword_10003D358;
  }

  [v4 addObject:v3];
}

+ (BOOL)waitForAllLongTasksToFinish
{
  if (![(id)qword_10003D358 count]) {
    return 1;
  }
  v2 = dispatch_group_create();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (id)qword_10003D358;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_group_async( v2,  *(dispatch_queue_t *)(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i) + 48LL),  &stru_100030B60);
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  dispatch_time_t v8 = dispatch_time(0LL, 60000000000LL);
  BOOL v9 = dispatch_group_wait(v2, v8) == 0;

  return v9;
}

- (CPLTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLTask;
  result = -[CPLTask init](&v3, "init");
  if (result)
  {
    result->_redirectStdoutToFileDescriptor = -1;
    result->_redirectStderrToFileDescriptor = -1;
    result->_waitInBackgroundIfTaskTimesOut = 1;
    result->_waitDeadlineLock._os_unfair_lock_opaque = 0;
  }

  return result;
}

+ (id)taskWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v8);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 taskWithCommandAndArguments:v5]);
  return v6;
}

+ (id)taskWithCommandAndArguments:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CPLTask);
  -[CPLTask setCommandWithArguments:](v4, "setCommandWithArguments:", v3);

  return v4;
}

- (NSString)command
{
  return (NSString *)-[NSArray firstObject](self->_argv, "firstObject");
}

- (void)setCommand:(id)a3
{
  id v4 = a3;
  id v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v6);

  -[CPLTask setCommandWithArguments:](self, "setCommandWithArguments:", v5);
}

- (void)setCommandWithArguments:(id)a3
{
  id v19 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (![v19 length]) {
    goto LABEL_21;
  }
  int v5 = 0;
  int v6 = 0;
  unint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = -1LL;
  uint64_t v10 = 1LL;
  do
  {
    unsigned int v11 = [v19 characterAtIndex:v7];
    if (v11 != 39 || (v6 & 1) != 0)
    {
      if ((v11 != 34) | v5 & 1)
      {
        BOOL v13 = v11 != 32;
        __int128 v12 = v19;
        if (((v13 | v5 | v6) & 1) != 0)
        {
          uint64_t v14 = v10;
          goto LABEL_18;
        }
      }

      else
      {
        __int128 v12 = v19;
        if ((v6 & 1) == 0)
        {
          int v5 = 0;
          int v6 = 1;
          goto LABEL_17;
        }
      }
    }

    else
    {
      __int128 v12 = v19;
      if ((v5 & 1) == 0)
      {
        int v6 = 0;
        int v5 = 1;
LABEL_17:
        uint64_t v14 = v10;
        uint64_t v9 = v7;
        goto LABEL_18;
      }
    }

    if (v10 != 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v8, v10 - 1));
      v16 = v15;
      if (v9 != -1)
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v9 - v8, 1, &stru_1000319D0));

        v16 = (void *)v17;
      }

      [v4 addObject:v16];

      __int128 v12 = v19;
    }

    int v5 = 0;
    int v6 = 0;
    uint64_t v14 = 0LL;
    v8 += v10;
    uint64_t v9 = -1LL;
LABEL_18:
    uint64_t v10 = v14 + 1;
    ++v7;
  }

  while (v7 < (unint64_t)[v12 length]);
  if (v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "substringWithRange:", v8, v14));
    [v4 addObject:v18];
  }

- (void)_updateWaitDeadline
{
  p_waitDeadlineLock = &self->_waitDeadlineLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  int v5 = sub_10000536C;
  int v6 = &unk_100030B88;
  unint64_t v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_waitDeadlineLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_waitDeadlineLock);
}

- (id)_waitDeadline
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_10000552C;
  v18 = sub_10000553C;
  id v19 = 0LL;
  p_waitDeadlineLock = &self->_waitDeadlineLock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  uint64_t v10 = sub_100005544;
  unsigned int v11 = &unk_100030BB0;
  __int128 v12 = self;
  BOOL v13 = &v14;
  id v3 = v9;
  os_unfair_lock_lock(p_waitDeadlineLock);
  v10((uint64_t)v3);
  os_unfair_lock_unlock(p_waitDeadlineLock);

  id v4 = (void *)v15[5];
  if (!v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    int v6 = (void *)v15[5];
    v15[5] = v5;

    id v4 = (void *)v15[5];
  }

  id v7 = v4;
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (int64_t)executeWithPIDHandler:(id)a3 endHandler:(id)a4
{
  int v6 = (void (**)(id, void))a3;
  id v7 = (void (**)(id, int64_t))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
  if (![v8 count]) {
    sub_10001C94C();
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
  uint64_t v10 = malloc(8 * (void)[v9 count] + 8);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
  id v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
      id v15 = objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v13]);
      v10[v13] = strdup((const char *)[v15 UTF8String]);

      ++v13;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
      id v17 = [v16 count];
    }

    while (v13 < (unint64_t)v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
  v10[(void)[v18 count]] = 0;

  id v19 = (posix_spawn_file_actions_t *)malloc(8uLL);
  int v20 = posix_spawn_file_actions_init(v19);
  int v21 = v20;
  if (v20 && !_CPLSilentLogging)
  {
    id v22 = sub_10000610C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)buf = 136315138;
      v118 = v25;
      v26 = "Unable to initialize the file actions properly (%s).";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  if (v20) {
    goto LABEL_13;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath"));
  id v45 = [v44 length];

  if (v45)
  {
    if (!_CPLSilentLogging)
    {
      id v46 = sub_10000610C();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        v48 = (char *)*v10;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath"));
        *(_DWORD *)buf = 136315394;
        v118 = v48;
        __int16 v119 = 2112;
        v120[0] = v49;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Setting up stdout for %s to %@", buf, 0x16u);
      }
    }

    id v50 = objc_claimAutoreleasedReturnValue(-[CPLTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath"));
    int v51 = posix_spawn_file_actions_addopen( v19,  1,  (const char *)[v50 fileSystemRepresentation],  513,  0x1B6u);

    if (v51)
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      id v52 = sub_10000610C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v53 = __error();
        v54 = strerror(*v53);
        *(_DWORD *)buf = 136315138;
        v118 = v54;
        v26 = "Unable to redirect stdin (%s).";
        goto LABEL_9;
      }

- (int64_t)exec
{
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  v8[3] = 0LL;
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = sub_10000552C;
  v6[4] = sub_10000553C;
  id v7 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000063E4;
  v5[3] = &unk_100030C48;
  v5[5] = v8;
  v5[6] = v6;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_100006688;
  v4[3] = &unk_100030C98;
  v4[4] = v8;
  v4[5] = v6;
  int64_t v2 = -[CPLTask executeWithPIDHandler:endHandler:](self, "executeWithPIDHandler:endHandler:", v5, v4);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(v8, 8);
  return v2;
}

- (void)resetRedirect
{
}

- (NSArray)argv
{
  return self->_argv;
}

- (void)setArgv:(id)a3
{
}

- (NSString)redirectStdoutToFileAtPath
{
  return self->_redirectStdoutToFileAtPath;
}

- (void)setRedirectStdoutToFileAtPath:(id)a3
{
}

- (int)redirectStdoutToFileDescriptor
{
  return self->_redirectStdoutToFileDescriptor;
}

- (void)setRedirectStdoutToFileDescriptor:(int)a3
{
  self->_redirectStdoutToFileDescriptor = a3;
}

- (NSString)redirectStderrToFileAtPath
{
  return self->_redirectStderrToFileAtPath;
}

- (void)setRedirectStderrToFileAtPath:(id)a3
{
}

- (int)redirectStderrToFileDescriptor
{
  return self->_redirectStderrToFileDescriptor;
}

- (void)setRedirectStderrToFileDescriptor:(int)a3
{
  self->_redirectStderrToFileDescriptor = a3;
}

- (int)waitStatus
{
  return self->_waitStatus;
}

- (NSPipe)stdinPipe
{
  return self->_stdinPipe;
}

- (void)setStdinPipe:(id)a3
{
}

- (BOOL)canTimeout
{
  return self->_canTimeout;
}

- (void)setCanTimeout:(BOOL)a3
{
  self->_canTimeout = a3;
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (BOOL)waitInBackgroundIfTaskTimesOut
{
  return self->_waitInBackgroundIfTaskTimesOut;
}

- (void)setWaitInBackgroundIfTaskTimesOut:(BOOL)a3
{
  self->_waitInBackgroundIfTaskTimesOut = a3;
}

- (BOOL)cleanupEmptyFiles
{
  return self->_cleanupEmptyFiles;
}

- (void)setCleanupEmptyFiles:(BOOL)a3
{
  self->_cleanupEmptyFiles = a3;
}

- (char)environ
{
  return self->_environ;
}

- (void)setEnviron:(char *)a3
{
  self->_environ = a3;
}

- (void).cxx_destruct
{
}

@end