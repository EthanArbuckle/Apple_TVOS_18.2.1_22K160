@interface SDTask
+ (id)createLaunchConstraintData;
+ (id)shellTaskWithCommand:(id)a3 outputFile:(id)a4;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 asUID:(unsigned int)a5 outputFile:(id)a6;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 inBootstrapDomainOfUID:(unsigned int)a5 outputFile:(id)a6;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5 withRuntimeChecks:(unint64_t)a6;
- (BOOL)canLaunch;
- (BOOL)createChild;
- (BOOL)createChildProcess;
- (BOOL)isRunning;
- (BOOL)resume;
- (BOOL)slowTimeout;
- (BOOL)started;
- (BOOL)stopped;
- (NSArray)arguments;
- (NSDate)startDate;
- (NSMutableArray)taskFileHandleArray;
- (NSString)destination;
- (NSString)executionLine;
- (NSString)launchPath;
- (NSString)stderrPath;
- (NSString)stdoutPath;
- (OS_dispatch_source)exitSource;
- (SDTask)init;
- (double)executionTime;
- (id)description;
- (id)fileHandleForError;
- (id)fileHandleForOutput;
- (int)endStatus;
- (int)processIdentifier;
- (int)signalRunningTask:(int)a3;
- (int)terminationStatus;
- (rusage)rusage_details;
- (unint64_t)cpuTimeUsedNS;
- (unsigned)activeLimit;
- (unsigned)inactiveLimit;
- (unsigned)targetUid;
- (void)SDTaskPOSIXSpawnAttributes;
- (void)childExitHandler;
- (void)closeFileHandles;
- (void)createFileHandles;
- (void)finishChild;
- (void)logChildExitReason:(int)a3;
- (void)setActiveLimit:(unsigned int)a3;
- (void)setArguments:(id)a3;
- (void)setCpuTimeUsedNS:(unint64_t)a3;
- (void)setDestination:(id)a3;
- (void)setExecutionLine:(id)a3;
- (void)setExitSource:(id)a3;
- (void)setInactiveLimit:(unsigned int)a3;
- (void)setLaunchPath:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setRusage_details:(rusage *)a3;
- (void)setSlowTimeout:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStderrPath:(id)a3;
- (void)setStdoutPath:(id)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTargetUid:(unsigned int)a3;
- (void)setTaskFileHandleArray:(id)a3;
- (void)stop;
- (void)stop:(int)a3;
- (void)stop:(int)a3 withStateString:(id)a4 withSignal:(int)a5 withWaitMS:(int64_t)a6;
@end

@implementation SDTask

+ (id)createLaunchConstraintData
{
  if (qword_1000A52A8 != -1) {
    dispatch_once(&qword_1000A52A8, &stru_100089A50);
  }
  return [(id)qword_1000A52A0 externalRepresentation];
}

- (void)SDTaskPOSIXSpawnAttributes
{
  posix_spawnattr_t v24 = 0LL;
  if (posix_spawnattr_init(&v24))
  {
    v3 = sub_1000241E4();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to initialize spawn attr", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v5 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to initialize spawn attr"];

    return 0LL;
  }

  else
  {
    sigset_t v22 = -1;
    *(_DWORD *)buf = 0;
    if (posix_spawnattr_setsigmask(&v24, (const sigset_t *)buf))
    {
      v7 = sub_1000241E4();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to setsigmask on spawn attr when launching SDTask",  v21,  2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v9 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to setsigmask on spawn attr when launching SDTask"];
    }

    if (posix_spawnattr_setsigdefault(&v24, &v22))
    {
      v10 = sub_1000241E4();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to setsigdefault on spawn attr when launching SDTask",  v21,  2u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v12 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to setsigdefault on spawn attr when launching SDTask"];
    }

    int v13 = posix_spawnattr_setflags(&v24, 142);
    if (self->_targetUid == -1)
    {
      int v17 = v13;
    }

    else if (posix_spawnattr_set_uid_np(&v24))
    {
      v14 = sub_1000241E4();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to set target uid when launching SDTask.",  v21,  2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v16 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to set target uid when launching SDTask."];

      int v17 = 1;
    }

    else
    {
      int v17 = 0;
    }

    posix_spawnattr_setjetsam_ext( &v24,  12LL,  80LL,  -[SDTask activeLimit](self, "activeLimit"),  -[SDTask inactiveLimit](self, "inactiveLimit"));
    if (v17)
    {
      v18 = sub_1000241E4();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Failed to setflags on spawn attr when launching SDTask",  v21,  2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v20 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to setflags on spawn attr when launching SDTask"];
    }

    amfi_launch_constraint_set_spawnattr( &v24,  -[NSData bytes](self->_launchConstraintData, "bytes"),  -[NSData length](self->_launchConstraintData, "length"));
    posix_spawnattr_set_launch_type_np(&v24, 2LL);
    return v24;
  }

- (SDTask)init
{
  if (qword_1000A52B0 != -1) {
    dispatch_once(&qword_1000A52B0, &stru_100089A70);
  }
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SDTask;
  v3 = -[SDTask init](&v17, "init");
  v4 = v3;
  if (v3)
  {
    launchPath = v3->_launchPath;
    v3->_launchPath = 0LL;

    arguments = v4->_arguments;
    v4->_arguments = 0LL;

    stdoutPath = v4->_stdoutPath;
    v4->_stdoutPath = 0LL;

    stderrPath = v4->_stderrPath;
    v4->_stderrPath = 0LL;

    destination = v4->_destination;
    v4->_destination = 0LL;

    v4->_started = 0;
    v4->_stopped = 0;
    v4->_running = 0;
    v4->_slowTimeout = 0;
    v4->_terminationStatus = -1;
    v4->_processIdentifier = -1;
    v10 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v11 = -[NSMutableArray initWithObjects:](v10, "initWithObjects:", qword_1000A52B8, qword_1000A52B8, 0LL);
    taskFileHandleArray = v4->_taskFileHandleArray;
    v4->_taskFileHandleArray = v11;

    v4->_executionTime = 0.0;
    v4->_targetUid = -1;
    v4->_activeLimit = 0;
    v4->_inactiveLimit = 0;
    startDate = v4->_startDate;
    v4->_startDate = 0LL;

    v4->_cpuTimeUsedNS = 0LL;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[SDTask createLaunchConstraintData](&OBJC_CLASS___SDTask, "createLaunchConstraintData"));
    launchConstraintData = v4->_launchConstraintData;
    v4->_launchConstraintData = (NSData *)v14;
  }

  return v4;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask arguments](self, "arguments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v4));

  return v5;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___SDTask);
  v11 = v10;
  if (v10)
  {
    -[SDTask setArguments:](v10, "setArguments:", v8);
    -[SDTask setLaunchPath:](v11, "setLaunchPath:", v7);
    -[SDTask setStdoutPath:](v11, "setStdoutPath:", v9);
  }

  return v11;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5 withRuntimeChecks:(unint64_t)a6
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  a3,  a4,  a5));
  [v7 setRuntimeChecks:a6];
  return v7;
}

+ (id)shellTaskWithCommand:(id)a3 outputFile:(id)a4
{
  v10[0] = @"-c";
  v10[1] = a3;
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/bash",  v7,  v5));

  return v8;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 inBootstrapDomainOfUID:(unsigned int)a5 outputFile:(id)a6
{
  return +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  a3,  a4,  a6);
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 asUID:(unsigned int)a5 outputFile:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  a3,  a4,  a6));
  [v7 setTargetUid:v6];
  return v7;
}

- (id)fileHandleForOutput
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDirectory]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask destination](self, "destination"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    unsigned __int8 v11 = [v10 isAbsolutePath];

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v12]);

      v4 = (void *)v13;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
    if (([v14 isEqualToString:v6] & 1) == 0)
    {
      NSFileAttributeKey v29 = NSFilePosixPermissions;
      v30 = &off_10009A4E0;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      id v26 = 0LL;
      unsigned __int8 v16 = [v3 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v15 error:&v26];
      id v17 = v26;

      if ((v16 & 1) == 0)
      {
        v20 = sub_1000241E4();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100055F08();
        }

        sigset_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v22 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create dir at %@, err: %@", v14, v17 category msg];

        goto LABEL_16;
      }
    }

    if (([v3 fileExistsAtPath:v4] & 1) != 0
      || (NSFileAttributeKey v27 = NSFilePosixPermissions,
          v28 = &off_10009A4F8,
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1)),  unsigned __int8 v19 = [v3 createFileAtPath:v4 contents:0 attributes:v18],  v18,  (v19 & 1) != 0))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v4));
      [v9 seekToEndOfFile];
LABEL_17:

      goto LABEL_18;
    }

    v23 = sub_1000241E4();
    posix_spawnattr_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100055EA4();
    }

    id v17 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create file for writing at path: %@", v4 category msg];
LABEL_16:

    id v9 = 0LL;
    goto LABEL_17;
  }

- (id)fileHandleForError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  if ([v3 fileExistsAtPath:v4])
  {

LABEL_4:
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v8));

    [v9 seekToEndOfFile];
    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  NSFileAttributeKey v15 = NSFilePosixPermissions;
  unsigned __int8 v16 = &off_10009A4F8;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  unsigned __int8 v7 = [v3 createFileAtPath:v5 contents:0 attributes:v6];

  if ((v7 & 1) != 0) {
    goto LABEL_4;
  }
  v10 = sub_1000241E4();
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100055F68(self);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create error file for writing at path: %@", v13 category msg];

  id v9 = 0LL;
LABEL_8:

  return v9;
}

- (BOOL)canLaunch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask arguments](self, "arguments"));
  id v5 = v3;
  if (!v5) {
    sub_100055FE0(&v32, v33);
  }
  uint64_t v6 = v5;

  if ([v4 count])
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@" "]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v6, v7));
    -[SDTask setExecutionLine:](self, "setExecutionLine:", v8);
  }

  else
  {
    -[SDTask setExecutionLine:](self, "setExecutionLine:", v6);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (([v9 isExecutableFileAtPath:v6] & 1) == 0)
  {
    id v17 = sub_1000241E4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100056258();
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Launch path '%@' not accessible", v6 category msg];
    goto LABEL_31;
  }

  if ((sub_10004024C() & 1) == 0)
  {
    if ([v6 rangeOfString:@"/usr/local/"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = sub_1000241E4();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000561F4();
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error: Blocked launching %@ on this build.", v6 category msg];
      goto LABEL_31;
    }

    if ([v6 isEqualToString:@"/bin/launchctl"]
      && (unint64_t)[v4 count] >= 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:2]);
      if ((([v10 isEqualToString:@"asuser"] & 1) != 0
         || [v10 isEqualToString:@"bsexec"])
        && [v11 rangeOfString:@"/usr/local/"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        NSFileAttributeKey v29 = sub_1000241E4();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100056194();
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v31 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error: Blocked launchctl %@ %@ on this build.", v10, v11 category msg];

        goto LABEL_32;
      }
    }
  }

  if (![@"/bin/bash" isEqualToString:v6])
  {
    sigset_t v22 = sub_1000241E4();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100056130();
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v13,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"File '%@' does not exist; will not execute.",
      v6);
    goto LABEL_31;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@"-c "]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
  NSFileAttributeKey v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@" "]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);

  if (([v9 fileExistsAtPath:v16] & 1) == 0)
  {
    v25 = sub_1000241E4();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100056088((uint64_t)v16, v13, v26);
    }

    NSFileAttributeKey v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
    objc_msgSend( v27,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"File '%@' does not exist; will not execute %@.",
      v16,
      v28);

LABEL_31:
LABEL_32:
    BOOL v19 = 0;
    goto LABEL_33;
  }

LABEL_19:
LABEL_24:
  BOOL v19 = 1;
LABEL_33:

  return v19;
}

- (void)createFileHandles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));

  if (!v3) {
    -[SDTask setStdoutPath:](self, "setStdoutPath:", @"error_log.txt");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask fileHandleForOutput](self, "fileHandleForOutput"));
  if (!v4)
  {
    id v5 = sub_1000241E4();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      id v8 = __error();
      id v9 = strerror(*v8);
      *(_DWORD *)buf = 138412546;
      NSFileAttributeKey v29 = v7;
      __int16 v30 = 2080;
      v31 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Can't create file '%@' to store output: %s.  Continuing...",  buf,  0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    v12 = __error();
    [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Can't create file '%@' to store output: %s.  Continuing...", v11, strerror(*v12) category msg];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
    NSFileAttributeKey v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    unsigned int v16 = [v14 isEqualToString:v15];

    if (v16) {
      id v17 = v4;
    }
    else {
      id v17 = 0LL;
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 outputDirectory]);
    NSFileAttributeKey v15 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:@"errors"]);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastPathComponent]);
    sigset_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingString:@"_stderr.txt"]);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v22]);
    -[SDTask setStderrPath:](self, "setStderrPath:", v23);

    id v17 = (id)objc_claimAutoreleasedReturnValue(-[SDTask fileHandleForError](self, "fileHandleForError"));
  }

  posix_spawnattr_t v24 = v4;
  if (!v4)
  {
    NSFileAttributeKey v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
    posix_spawnattr_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  [v25 setObject:v24 atIndexedSubscript:1];

  if (!v4)
  {
  }

  id v26 = v17;
  if (!v17)
  {
    NSFileAttributeKey v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:2]);
  }

  NSFileAttributeKey v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  [v27 setObject:v26 atIndexedSubscript:2];

  if (!v17)
  {
  }
}

- (void)closeFileHandles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:2]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attributesOfItemAtPath:v7 error:0]);

  id v9 = [v8 fileSize];
  if (v8 && !v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stderrPath](self, "stderrPath"));
    [v6 removeItemAtPath:v10 error:0];
  }

  uint64_t v11 = qword_1000A52B8;
  id v12 = v13;
  if (v13 && v13 != (id)qword_1000A52B8)
  {
    [v13 closeFile];
    id v12 = v13;
    uint64_t v11 = qword_1000A52B8;
  }

  if (v12 != v5 && v5 && v5 != (id)v11) {
    [v5 closeFile];
  }
}

- (BOOL)createChildProcess
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask arguments](self, "arguments"));
  -[SDTask setStarted:](self, "setStarted:", 1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SDTask setStartDate:](self, "setStartDate:", v4);

  id v5 = objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  uint64_t v6 = (char *)[v5 fileSystemRepresentation];

  unsigned __int8 v7 = sub_1000241E4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Executing '%@'", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
  [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Executing '%@'", v11 category msg];

  id v12 = malloc(8 * (void)[v3 count] + 16);
  if (v12)
  {
    id v13 = v12;
    v50 = v6;
    v51 = v3;
    void *v12 = v6;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v14 = v3;
    id v15 = [v14 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v53;
      uint64_t v18 = 1LL;
      do
      {
        BOOL v19 = 0LL;
        uint64_t v20 = v18 << 32;
        uint64_t v21 = (int)v18;
        sigset_t v22 = (char *)&v13[(int)v18];
        do
        {
          if (*(void *)v53 != v17) {
            objc_enumerationMutation(v14);
          }
          *(void *)&v22[8 * (void)v19] = [*(id *)(*((void *)&v52 + 1) + 8 * (void)v19) fileSystemRepresentation];
          BOOL v19 = (char *)v19 + 1;
          v20 += (uint64_t)&_mh_execute_header;
        }

        while (v16 != v19);
        id v16 = [v14 countByEnumeratingWithState:&v52 objects:v59 count:16];
        uint64_t v18 = (uint64_t)v19 + v21;
      }

      while (v16);
      uint64_t v23 = v20 >> 32;
    }

    else
    {
      uint64_t v23 = 1LL;
    }

    v13[v23] = 0LL;
    -[SDTask createFileHandles](self, "createFileHandles");
    int v28 = posix_spawn_file_actions_init(&v56);
    if (v28)
    {
      int v29 = v28;
      __int16 v30 = sub_1000241E4();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      v3 = v51;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000563DC(v29);
      }

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v32,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Failed to posix_spawn_file_actions_init with error: %s. Skipping this task",  strerror(v29));

      free(v13);
      goto LABEL_21;
    }

    uint64_t v35 = 0LL;
    v3 = v51;
    do
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask taskFileHandleArray](self, "taskFileHandleArray"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectAtIndexedSubscript:v35]);
      int v38 = posix_spawn_file_actions_adddup2(&v56, (int)[v37 fileDescriptor], v35);

      if (v38)
      {
        v39 = sub_1000241E4();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v42 = strerror(v38);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to posix_spawn_file_actions_adddup2() for fd %d when launching SDTask: %s",  buf,  0x12u);
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend( v41,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Failed to posix_spawn_file_actions_adddup2() for fd %d when launching SDTask: %s",  v35,  strerror(v38));
      }

      ++v35;
    }

    while (v35 != 3);
    *(void *)buf = -[SDTask SDTaskPOSIXSpawnAttributes](self, "SDTaskPOSIXSpawnAttributes");
    if (!*(void *)buf)
    {
      v47 = sub_1000241E4();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_100056330(v48);
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v49 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Could not get spawn attributes. Skipping this task"];

      free(v13);
      posix_spawn_file_actions_destroy(&v56);
      goto LABEL_21;
    }

    signal(20, 0LL);
    v43 = _NSGetEnviron();
    int v44 = posix_spawn(&v57, v50, &v56, (const posix_spawnattr_t *)buf, (char *const *)v13, *v43);
    free(v13);
    posix_spawn_file_actions_destroy(&v56);
    posix_spawnattr_destroy((posix_spawnattr_t *)buf);
    if (!v44)
    {
      self->_processIdentifier = v57;
      BOOL v33 = 1;
      -[SDTask setRunning:](self, "setRunning:", 1LL);
      goto LABEL_22;
    }

    v45 = sub_1000241E4();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_100056370(v44);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v26,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"posix_spawn failed: %s",  strerror(v44));
  }

  else
  {
    posix_spawnattr_t v24 = sub_1000241E4();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000562BC();
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    NSFileAttributeKey v27 = __error();
    objc_msgSend( v26,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Failed to malloc arg array with errno: %s",  strerror(*v27));
  }

LABEL_21:
  BOOL v33 = 0;
LABEL_22:

  return v33;
}

- (BOOL)createChild
{
  if (-[SDTask started](self, "started") || -[SDTask stopped](self, "stopped"))
  {
    v3 = sub_1000241E4();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100056448(self);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask executionLine](self, "executionLine"));
    objc_msgSend( v5,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Task '%@' has already been started; will not execute",
      v6);

LABEL_6:
    LOBYTE(v7) = 0;
    return v7;
  }

  BOOL v7 = -[SDTask canLaunch](self, "canLaunch");
  if (!v7) {
    return v7;
  }
  if (!-[SDTask createChildProcess](self, "createChildProcess")) {
    goto LABEL_6;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (void)finishChild
{
  if (!-[SDTask stopped](self, "stopped") && -[SDTask isRunning](self, "isRunning"))
  {
    -[SDTask closeFileHandles](self, "closeFileHandles");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask startDate](self, "startDate"));
    [v3 timeIntervalSinceDate:v4];
    self->_executionTime = v5;

    uint64_t v6 = sub_1000241E4();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
      -[SDTask executionTime](self, "executionTime");
      double cpuTimeUsedNS = (double)self->_cpuTimeUsedNS;
      *(_DWORD *)buf = 138413058;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      double v27 = cpuTimeUsedNS / 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Task '%@|%@' finished in %f seconds and used %f seconds of actual CPU time",  buf,  0x2Au);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
    -[SDTask executionTime](self, "executionTime");
    [v14 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Task '%@|%@' finished in %f seconds and used %f seconds of actual CPU time", v16, v18, v19, (double)self->_cpuTimeUsedNS / 1000000000.0 category msg];
  }

  -[SDTask setStopped:](self, "setStopped:", 1LL);
  -[SDTask setRunning:](self, "setRunning:", 0LL);
}

- (void)logChildExitReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = a3 & 0x7F;
  if ((_DWORD)v5 == 127)
  {
    int v14 = a3 >> 8;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    objc_msgSend(v15, "setTotalFailedTasks:", objc_msgSend(v15, "totalFailedTasks") + 1);

    id v16 = sub_1000241E4();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v14 == 19)
    {
      if (v18) {
        sub_1000565D4(self);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Unknown state of child process '%@' with wstatus %04x", v19, v3 category msg];
    }

    else
    {
      if (v18) {
        sub_100056654(self);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' stopped (but did not terminate) due to signal %d", v19, ((int)v3 >> 8) category msg];
    }

    goto LABEL_20;
  }

  if ((a3 & 0x7F) != 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    objc_msgSend(v20, "setTotalFailedTasks:", objc_msgSend(v20, "totalFailedTasks") + 1);

    uint64_t v21 = sub_1000241E4();
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000564C4(self);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' terminated due to signal %d", v19, v5 category msg];
    goto LABEL_20;
  }

  int v6 = BYTE1(a3);
  p_terminationStatus = (unsigned int *)&self->_terminationStatus;
  self->_terminationStatus = BYTE1(a3);
  id v8 = sub_1000241E4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      unsigned int v24 = *p_terminationStatus;
      *(_DWORD *)buf = 138412546;
      __int16 v26 = v23;
      __int16 v27 = 1024;
      unsigned int v28 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Child process '%@' exited with status %d",  buf,  0x12u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' exited with status %d", v19, *p_terminationStatus category msg];
LABEL_20:

    goto LABEL_21;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100056544(self);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  [v11 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' exited with nonzero status %d", v12, *p_terminationStatus category msg];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v13, "setTotalFailedTasks:", objc_msgSend(v13, "totalFailedTasks") + 1);
LABEL_21:
}

- (void)childExitHandler
{
  while (wait4(-[SDTask processIdentifier](self, "processIdentifier"), &v5, 4, &v4) == -1 && *__error() == 4)
    ;
  rusage v3 = v4;
  -[SDTask setRusage_details:](self, "setRusage_details:", &v3);
  self->_endStatus = v5;
  -[SDTask setCpuTimeUsedNS:](self, "setCpuTimeUsedNS:", sub_1000247E0((uint64_t)&v4, (uint64_t)&v4.ru_stime));
  -[SDTask logChildExitReason:](self, "logChildExitReason:", v5);
  -[SDTask finishChild](self, "finishChild");
}

- (void)stop
{
}

- (void)stop:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[SDTask isRunning](self, "isRunning"))
  {
    if (self->_processIdentifier < 0) {
      sub_1000566D4();
    }
    switch((int)v3)
    {
      case 1:
        if (-[SDTask slowTimeout](self, "slowTimeout")) {
          uint64_t v5 = 5500LL;
        }
        else {
          uint64_t v5 = 500LL;
        }
        int v6 = @"Interrupting";
        BOOL v7 = self;
        uint64_t v8 = 1LL;
        uint64_t v9 = 2LL;
        goto LABEL_19;
      case 2:
        if (-[SDTask slowTimeout](self, "slowTimeout")) {
          uint64_t v5 = 2750LL;
        }
        else {
          uint64_t v5 = 250LL;
        }
        int v6 = @"Terminating";
        BOOL v7 = self;
        uint64_t v8 = 2LL;
        uint64_t v9 = 15LL;
        goto LABEL_19;
      case 3:
        uint64_t v13 = sub_1000241E4();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
          *(_DWORD *)buf = 138412546;
          v36 = v16;
          __int16 v37 = 2112;
          int v38 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "-->\tTask is taking a while to terminate: '%@|%@'",  buf,  0x16u);
        }

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastPathComponent]);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lastPathComponent]);
        [v19 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"-->\tTask is taking a while to terminate: '%@|%@'", v21, v23 category msg];

        -[SDTask stop:withStateString:withSignal:withWaitMS:]( self,  "stop:withStateString:withSignal:withWaitMS:",  3LL,  @"Terminating",  0LL,  3000LL);
        return;
      case 4:
        int v6 = @"Killing";
        BOOL v7 = self;
        uint64_t v8 = 4LL;
        uint64_t v9 = 9LL;
        uint64_t v5 = 1000LL;
LABEL_19:
        -[SDTask stop:withStateString:withSignal:withWaitMS:]( v7,  "stop:withStateString:withSignal:withWaitMS:",  v8,  v6,  v9,  v5);
        return;
      case 5:
        unsigned int v24 = sub_1000241E4();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
          unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
          int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 lastPathComponent]);
          *(_DWORD *)buf = 138412546;
          v36 = v27;
          __int16 v37 = 2112;
          int v38 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Giving up on waiting for %@|%@",  buf,  0x16u);
        }

        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 lastPathComponent]);
        BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 lastPathComponent]);
        [v30 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Giving up on waiting for %@|%@", v32, v34 category msg];

        id v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDTask exitSource](self, "exitSource"));
        dispatch_source_cancel(v12);
        goto LABEL_23;
      default:
        v10 = sub_1000241E4();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000566FC(v3, v11);
        }

        id v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        -[dispatch_source_s logWithSubsystem:category:msg:]( v12,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Unknown task stop state: %u",  v3);
LABEL_23:

        break;
    }
  }

- (void)stop:(int)a3 withStateString:(id)a4 withSignal:(int)a5 withWaitMS:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  if (-[SDTask isRunning](self, "isRunning"))
  {
    if ((_DWORD)v7)
    {
      v10 = sub_1000241E4();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = -[SDTask processIdentifier](self, "processIdentifier");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
        int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
        *(_DWORD *)buf = 138413058;
        id v30 = v9;
        __int16 v31 = 1024;
        unsigned int v32 = v12;
        __int16 v33 = 2112;
        v34 = v14;
        __int16 v35 = 2112;
        v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "-->\t%@ (pid %d): '%@|%@'", buf, 0x26u);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v18 = -[SDTask processIdentifier](self, "processIdentifier");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask stdoutPath](self, "stdoutPath"));
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 lastPathComponent]);
      [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"-->\t%@ (pid %d): '%@|%@'", v9, v18, v20, v22 category msg];

      if (-[SDTask processIdentifier](self, "processIdentifier") >= 1) {
        -[SDTask signalRunningTask:](self, "signalRunningTask:", v7);
      }
    }

    dispatch_time_t v23 = dispatch_time(0LL, 1000000 * a6);
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 taskQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100039884;
    block[3] = &unk_100089A08;
    block[4] = self;
    int v28 = a3;
    dispatch_after(v23, v25, block);
  }
}

- (BOOL)resume
{
  int v9 = 0;
  if (!csops(-[SDTask processIdentifier](self, "processIdentifier"), 0LL, &v9, 4LL)
    && (v9 & 0x4000000) != 0)
  {
    return -[SDTask signalRunningTask:](self, "signalRunningTask:", 19LL) == 0;
  }

  uint64_t v3 = sub_1000241E4();
  rusage v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ failed to launch due to validation error",  buf,  0xCu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDTask launchPath](self, "launchPath"));
  [v6 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ failed to launch due to validation error", v7 category msg];

  kill(-[SDTask processIdentifier](self, "processIdentifier"), 9);
  return 0;
}

- (int)signalRunningTask:(int)a3
{
  return killpg(self->_processIdentifier, a3);
}

- (void)setCpuTimeUsedNS:(unint64_t)a3
{
  self->_double cpuTimeUsedNS = a3;
}

- (unint64_t)cpuTimeUsedNS
{
  if (!-[SDTask isRunning](self, "isRunning")) {
    return self->_cpuTimeUsedNS;
  }
  uint64_t v3 = sub_100024770(-[SDTask processIdentifier](self, "processIdentifier"));
  unint64_t result = sub_1000246EC((uint64_t)v3);
  self->_double cpuTimeUsedNS = result;
  return result;
}

- (NSString)launchPath
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLaunchPath:(id)a3
{
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setArguments:(id)a3
{
}

- (NSString)stdoutPath
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setStdoutPath:(id)a3
{
}

- (NSString)stderrPath
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setStderrPath:(id)a3
{
}

- (NSString)executionLine
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setExecutionLine:(id)a3
{
}

- (NSString)destination
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDestination:(id)a3
{
}

- (rusage)rusage_details
{
  __int128 v3 = *(_OWORD *)&self[1].ru_msgrcv;
  *(_OWORD *)&retstr->ru_oublock = *(_OWORD *)&self[1].ru_oublock;
  *(_OWORD *)&retstr->ru_msgrcv = v3;
  *(_OWORD *)&retstr->ru_nvcsw = *(_OWORD *)&self[1].ru_nvcsw;
  __int128 v4 = *(_OWORD *)&self[1].ru_idrss;
  *(_OWORD *)&retstr->ru_maxrss = *(_OWORD *)&self[1].ru_maxrss;
  *(_OWORD *)&retstr->ru_idrss = v4;
  __int128 v5 = *(_OWORD *)&self[1].ru_nswap;
  *(_OWORD *)&retstr->ru_minflt = *(_OWORD *)&self[1].ru_minflt;
  *(_OWORD *)&retstr->ru_nswap = v5;
  timeval ru_stime = self[1].ru_stime;
  retstr->ru_utime = self[1].ru_utime;
  retstr->timeval ru_stime = ru_stime;
  return self;
}

- (void)setRusage_details:(rusage *)a3
{
  self->_rusage_details.ru_utime = a3->ru_utime;
  __int128 v3 = *(_OWORD *)&a3->ru_minflt;
  timeval ru_stime = a3->ru_stime;
  __int128 v4 = *(_OWORD *)&a3->ru_maxrss;
  *(_OWORD *)&self->_rusage_details.ru_idrss = *(_OWORD *)&a3->ru_idrss;
  *(_OWORD *)&self->_rusage_details.ru_minflt = v3;
  self->_rusage_details.timeval ru_stime = ru_stime;
  *(_OWORD *)&self->_rusage_details.ru_maxrss = v4;
  __int128 v6 = *(_OWORD *)&a3->ru_nvcsw;
  __int128 v8 = *(_OWORD *)&a3->ru_nswap;
  __int128 v7 = *(_OWORD *)&a3->ru_oublock;
  *(_OWORD *)&self->_rusage_details.ru_msgrcv = *(_OWORD *)&a3->ru_msgrcv;
  *(_OWORD *)&self->_rusage_details.ru_nvcsw = v6;
  *(_OWORD *)&self->_rusage_details.ru_nswap = v8;
  *(_OWORD *)&self->_rusage_details.ru_oublock = v7;
}

- (unsigned)activeLimit
{
  return self->_activeLimit;
}

- (void)setActiveLimit:(unsigned int)a3
{
  self->_activeLimit = a3;
}

- (unsigned)inactiveLimit
{
  return self->_inactiveLimit;
}

- (void)setInactiveLimit:(unsigned int)a3
{
  self->_inactiveLimit = a3;
}

- (unsigned)targetUid
{
  return self->_targetUid;
}

- (void)setTargetUid:(unsigned int)a3
{
  self->_targetUid = a3;
}

- (OS_dispatch_source)exitSource
{
  return self->_exitSource;
}

- (void)setExitSource:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)slowTimeout
{
  return self->_slowTimeout;
}

- (void)setSlowTimeout:(BOOL)a3
{
  self->_slowTimeout = a3;
}

- (int)terminationStatus
{
  return self->_terminationStatus;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (NSMutableArray)taskFileHandleArray
{
  return self->_taskFileHandleArray;
}

- (void)setTaskFileHandleArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end