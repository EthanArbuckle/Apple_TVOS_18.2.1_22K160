@interface SystemDiagnosticiOS
- (BOOL)makeOutputDirectory;
- (BOOL)readCoSysdiagnoseSetting;
- (BOOL)tailspinOnly;
- (BOOL)triggerWatchCoSysdiagnose;
- (BOOL)vibrateStart;
- (BOOL)wasLockedAtLaunch;
- (SystemDiagnosticiOS)init;
- (id)defaultBaseDirectory;
- (id)parseSizeToString:(unint64_t)a3;
- (id)searchForTransfer:(id)a3;
- (int)idsCase;
- (int64_t)maxHistory;
- (int64_t)openIssueFiler;
- (int64_t)statusBar;
- (void)clearHistory;
- (void)configureDefaultSettings;
- (void)createFileAndTransfer:(id)a3 atLocation:(id)a4;
- (void)dropCoSysdiagnoseError:(id)a3;
- (void)gatherDiagnostic;
- (void)getSettings;
- (void)getUserSettings;
- (void)launchSettings_async;
- (void)overrideSettings;
- (void)run;
- (void)sendDefaultsInstructions;
- (void)sendFailedInstructions;
- (void)sendPathToArchive;
- (void)sendUnableToCreateMsg;
- (void)setIdsCase:(int)a3;
- (void)setMaxHistory:(int64_t)a3;
- (void)setOpenIssueFiler:(int64_t)a3;
- (void)setStatusBar:(int64_t)a3;
- (void)setTailspinOnly:(BOOL)a3;
- (void)setVibrateStart:(BOOL)a3;
- (void)setWasLockedAtLaunch:(BOOL)a3;
- (void)startIDSConnection;
- (void)triggerAirPodLogs:(BOOL)a3;
- (void)triggerRemoteSysdiagnoses;
@end

@implementation SystemDiagnosticiOS

- (SystemDiagnosticiOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SystemDiagnosticiOS;
  v2 = -[SystemDiagnostic init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[SystemDiagnosticiOS setIdsCase:](v2, "setIdsCase:", 0LL);
    -[SystemDiagnostic setDpClass:](v3, "setDpClass:", 0LL);
    -[SystemDiagnostic setShouldPostProcess:](v3, "setShouldPostProcess:", 0LL);
    -[SystemDiagnosticiOS setMaxHistory:](v3, "setMaxHistory:", -1LL);
  }

  return v3;
}

- (id)defaultBaseDirectory
{
  return +[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory");
}

- (void)clearHistory
{
  if (-[SystemDiagnosticiOS maxHistory](self, "maxHistory") != -1)
  {
    id v3 = -[SDCacheEnumerator initCacheEnumerator](objc_alloc(&OBJC_CLASS___SDCacheEnumerator), "initCacheEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 nextValidURL]);
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        v8 = objc_autoreleasePoolPush();
        [v4 addObject:v7];
        objc_autoreleasePoolPop(v8);
        uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 nextValidURL]);

        v7 = (void *)v9;
      }

      while (v9);
    }

    [v4 sortUsingComparator:&stru_100089DB8];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v25 = [v4 count];
      __int16 v26 = 2048;
      int64_t v27 = -[SystemDiagnosticiOS maxHistory](self, "maxHistory");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Found %ld files in history with max of %ld",  buf,  0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v10,  "log:",  @"Found %ld files in history with max of %ld",  objc_msgSend(v4, "count"),  -[SystemDiagnosticiOS maxHistory](self, "maxHistory"));

    id v11 = [v4 count];
    if (v11 > (id)-[SystemDiagnosticiOS maxHistory](self, "maxHistory"))
    {
      unint64_t v12 = -[SystemDiagnosticiOS maxHistory](self, "maxHistory");
      if (v12 < (unint64_t)[v4 count])
      {
        id v13 = 0LL;
        do
        {

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v12]);
            *(_DWORD *)buf = 138412546;
            id v25 = v14;
            __int16 v26 = 2048;
            int64_t v27 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Removing '%@' at index '%lu'",  buf,  0x16u);
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v12]);
          [v15 log:@"Removing '%@' at index '%lu'", v16, v12];

          v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v12]);
          id v23 = 0LL;
          [v5 removeItemAtURL:v17 error:&v23];
          id v13 = v23;

          if (v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v12]);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
              *(_DWORD *)buf = 138412546;
              id v25 = v18;
              __int16 v26 = 2112;
              int64_t v27 = (int64_t)v19;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error removing '%@': %@",  buf,  0x16u);
            }

            v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v12]);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
            [v20 log:@"Error removing '%@': %@", v21, v22];
          }

          ++v12;
        }

        while (v12 < (unint64_t)[v4 count]);
      }
    }
  }

- (BOOL)makeOutputDirectory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 stringByAppendingPathComponent:@"Latest"]);
  [v3 removeItemAtPath:v5 error:0];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  LOBYTE(v4) = -[SystemDiagnostic makeTargetDirectory:](self, "makeTargetDirectory:", v6);

  if ((v4 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
    unsigned __int8 v8 = -[SystemDiagnostic makeTargetDirectory:](self, "makeTargetDirectory:", v7);

    if ((v8 & 1) != 0) {
      return 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create directory: %@",  buf,  0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
    [v16 stdoutWrite:@"Failed to create directory: %@", v17];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create directory: %@",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    [v11 stdoutWrite:@"Failed to create directory: %@", v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  }

  v18 = (void *)v14;
  [v13 log:@"Failed to create directory: %@", v14];

  return 0;
}

- (BOOL)readCoSysdiagnoseSetting
{
  BOOL v3 = -[SystemDiagnosticiOS idsCase](self, "idsCase") == 5 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 2;
  id v4 = sub_1000256F0();
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"cosysdiagnose"]);
  v7 = v6;
  if (v6) {
    BOOL v3 = [v6 integerValue] == (id)1;
  }

  return v3;
}

- (void)createFileAndTransfer:(id)a3 atLocation:(id)a4
{
  id v9 = a4;
  sub_100021250(a3, v9);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](&OBJC_CLASS___SystemDiagnosticIDS, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  LODWORD(self) = objc_msgSend( v6,  "sendFileAtPath:forDiagnosticID:withCase:",  v9,  v7,  -[SystemDiagnosticiOS idsCase](self, "idsCase"));

  if ((_DWORD)self)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v8 removeItemAtPath:v9 error:0];
  }
}

- (void)sendUnableToCreateMsg
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"co-sysdiagnose-failed.log"]);

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:]( self,  "createFileAndTransfer:atLocation:",  @"Co-sysdiagnose archive could not be transferred to the phone.\nThe sysdiagnose archive creation on the device failed.\nSee the logfile generated inside the watch's sysdiagnose directory for more details.\n",  v4);
}

- (void)sendFailedInstructions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"co-sysdiagnose-failed.log"]);

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:]( self,  "createFileAndTransfer:atLocation:",  @"Co-sysdiagnose archive could not be transferred to the phone.\nSince the current sysdiagnose was run before first unlock, it cannot be accessed due to Data Protection class\n\n",  v4);
}

- (void)sendDefaultsInstructions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"co-sysdiagnose-disabled.log"]);

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:]( self,  "createFileAndTransfer:atLocation:",  @"Co-sysdiagnoses are disabled on the watch.\nTo re-enable them, ssh in to your watch as mobile and run:\ndefaults write com.apple.sysdiagnose cosysdiagnose -BOOL true \n\n",  v4);
}

- (void)sendPathToArchive
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS defaultBaseDirectory](self, "defaultBaseDirectory"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"co-sysdiagnose-location.log"]);

  id v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Co-sysdiagnoses was triggered from command line.\nThe local archive can be found at the following path on the watch:\n%s\n\n",  [v4 UTF8String]));

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:](self, "createFileAndTransfer:atLocation:", v5, v6);
}

- (void)dropCoSysdiagnoseError:(id)a3
{
}

- (BOOL)triggerWatchCoSysdiagnose
{
  return 0;
}

- (void)triggerAirPodLogs:(BOOL)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](&OBJC_CLASS___SystemDiagnosticBT, "sharedInstance", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  [v5 startBTSessionAndTriggerAirPodLogs:v4];
}

- (void)triggerRemoteSysdiagnoses
{
  BOOL v3 = -[SystemDiagnosticiOS triggerWatchCoSysdiagnose](self, "triggerWatchCoSysdiagnose");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic prepareCoSysdiagnoseParams](self, "prepareCoSysdiagnoseParams"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  [v4 triggerCoSysdiagnosesWithParams:v5 forDiagnosticID:v6];

  -[SystemDiagnosticiOS triggerAirPodLogs:](self, "triggerAirPodLogs:", v3);
}

- (void)gatherDiagnostic
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v3 setMayStartExecuting:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  [v4 readyToReceiveCoSysdiagnosesAtDir:v5 forDiagnosticID:v6];

  -[SystemDiagnosticiOS triggerRemoteSysdiagnoses](self, "triggerRemoteSysdiagnoses");
  if (-[SystemDiagnostic coSysdiagnoseOnly](self, "coSysdiagnoseOnly"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    [v7 waitForCoSysdiagnosesForDiagnosticID:v8];

    -[SystemDiagnostic endDiagnostics](self, "endDiagnostics");
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    [v3 setOutputDirectory:v9];

    [v3 setPushBufferDelegate:self];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
    -[SystemDiagnostic setOldestDateCreatedCutoff:](self, "setOldestDateCreatedCutoff:", v10);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Posting start notification",  buf,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v11 log:@"Posting start notification"];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.sysdiagnose.sysdiagnoseStarted",  0LL,  0LL,  1u);
    -[SystemDiagnostic executeDiagnosticContainers](self, "executeDiagnosticContainers");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Posting stop notification",  v15,  2u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v13 log:@"Posting stop notification"];

    uint64_t v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v14, @"com.apple.sysdiagnose.sysdiagnoseStopped", 0LL, 0LL, 1u);
  }
}

- (void)launchSettings_async
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_100089DD8);
}

- (void)configureDefaultSettings
{
  uint64_t v3 = sub_10004024C();
  if ((_DWORD)v3)
  {
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", 0LL);
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", 1LL);
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 2LL);
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", 1LL);
  }

  else
  {
    id v5 = sub_100020A70(v3, v4);
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", 0LL);
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", v5);
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 0LL);
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", 1LL);
    -[SystemDiagnostic setEarlyPrompt:](self, "setEarlyPrompt:", v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v8 = -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Seed check : %ld",  buf,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", @"Seed check : %ld", -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));
  }

- (void)getUserSettings
{
  id v3 = sub_1000256F0();
  id v13 = (id)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"tailspinOnly"]);
  id v5 = v4;
  if (v4) {
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", [v4 BOOLValue]);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"postCompletion"]);

  if (v6) {
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", [v6 integerValue]);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"vibrateStart"]);

  if (v7) {
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", [v7 BOOLValue]);
  }
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"statusBar"]);

  if (v8) {
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", [v8 integerValue]);
  }
  if (-[SystemDiagnostic coSysdiagnose](self, "coSysdiagnose"))
  {
    id v9 = v8;
    goto LABEL_21;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"cosysdiagnose"]);

  if (v9)
  {
    if (!-[SystemDiagnosticiOS idsCase](self, "idsCase") || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
    {
      uint64_t v10 = (uint64_t)[v9 BOOLValue];
LABEL_20:
      -[SystemDiagnosticiOS setIdsCase:](self, "setIdsCase:", v10);
      goto LABEL_21;
    }

    if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 2 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
    {
      else {
        uint64_t v10 = 2LL;
      }
      goto LABEL_20;
    }
  }

- (void)overrideSettings
{
  if (-[SystemDiagnostic coSysdiagnose](self, "coSysdiagnose"))
  {
    int64_t v3 = -[SystemDiagnostic coSysdiagnose](self, "coSysdiagnose");
    unsigned int v4 = -[SystemDiagnosticiOS idsCase](self, "idsCase");
    if (v3 == 2)
    {
      if (!v4 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
      {
        uint64_t v5 = 1LL;
LABEL_15:
        -[SystemDiagnosticiOS setIdsCase:](self, "setIdsCase:", v5);
        return;
      }

      if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 2 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
      {
        uint64_t v5 = 3LL;
        goto LABEL_15;
      }
    }

    else
    {
      if (!v4 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
      {
        uint64_t v5 = 0LL;
        goto LABEL_15;
      }

      if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 2 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
      {
        uint64_t v5 = 2LL;
        goto LABEL_15;
      }
    }
  }

- (void)getSettings
{
}

- (id)searchForTransfer:(id)a3
{
  id v22 = a3;
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/mobile/Library/IdentityServices/incomingfiles"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLIsDirectoryKey,  NSURLNameKey,  NSURLPathKey,  NSURLCreationDateKey,  0LL));
  v21 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:4 errorHandler:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    id v23 = 0LL;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v13 = objc_autoreleasePoolPush();
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);
        id v15 = [v14 rangeOfString:@"sysdiagnose"];

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v25 = 0LL;
          [v12 getResourceValue:&v25 forKey:NSURLCreationDateKey error:0];
          id v16 = v25;
          if ([v16 compare:v7] == (id)1)
          {
            id v17 = v16;

            id v18 = v12;
            id v23 = v18;
            v7 = v17;
          }
        }

        objc_autoreleasePoolPop(v13);
      }

      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v9);
  }

  else
  {
    id v23 = 0LL;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
  return v19;
}

- (id)parseSizeToString:(unint64_t)a3
{
  if (a3 > 0x100000) {
    int64_t v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu MB",  (unint64_t)(int)a3 >> 20);
  }
  else {
    int64_t v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu KB", a3 >> 10);
  }
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)run
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Done reading settings: issueFiler %ld",  buf,  0xCu);
  }

  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend( v3,  "log:",  @"Done reading settings: issueFiler %ld",  -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));

  if ((sub_10004024C() & 1) == 0) {
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 0LL);
  }
  if (!-[SystemDiagnostic requestSource](self, "requestSource")) {
    sub_100057948(&v15, buf);
  }
  unsigned int v4 = -[SystemDiagnostic requestSource](self, "requestSource");
  if (v4 > 5) {
    goto LABEL_21;
  }
  if (((1 << v4) & 0x2C) != 0)
  {
LABEL_16:
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___SystemDiagnosticiOS;
    -[SystemDiagnostic run](&v14, "run");
    id v11 = objc_alloc_init(&OBJC_CLASS___SDPromptDelegate);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    -[SDPromptDelegate setDiagnosticID:](v11, "setDiagnosticID:", v12);

    -[SDPromptDelegate setOpenIssueFiler:]( v11,  "setOpenIssueFiler:",  -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));
    -[SDPromptDelegate setDidPartnerTimeout:](v11, "setDidPartnerTimeout:", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic frontmostBundleID](self, "frontmostBundleID"));
    -[SDPromptDelegate setBundleID:](v11, "setBundleID:", v13);

    -[SDPromptDelegate setOpenIssueFiler:](v11, "setOpenIssueFiler:", 0LL);
    sub_100025974(v11);

    return;
  }

  if (((1 << v4) & 0x12) == 0)
  {
LABEL_21:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unexpected request",  buf,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v9 stdoutWrite:@"unexpected request"];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v10 log:@"unexpected request"];

    goto LABEL_16;
  }

  if (!-[SystemDiagnosticiOS tailspinOnly](self, "tailspinOnly")) {
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ignoring full sysdiagnose request due to tailspin only user preference.",  buf,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v5 stdoutWrite:@"ignoring full sysdiagnose request due to tailspin only user preference."];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v6 log:@"ignoring full sysdiagnose request due to tailspin only user preference."];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  sub_1000220B0(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v8 closeSysdiagnoseSession];

  sub_100025974(0LL);
}

- (void)startIDSConnection
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](&OBJC_CLASS___SystemDiagnosticIDS, "sharedInstance"));
  if (v3)
  {
    unsigned int v4 = dispatch_group_create();
    uint64_t v5 = v4;
    if (v4)
    {
      dispatch_group_enter(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 executionGroupDictionary]);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      [v6 setValue:v5 forKey:v7];
    }

    if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 3 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      [v3 startCoSysdiagnoseForFilename:v8];
    }

    dispatch_group_t v9 = dispatch_group_create();
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 localGroupDictionary]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      [v10 setObject:v9 forKey:v11];
    }

    if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 1 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 4)
    {
      if (!v9)
      {
LABEL_18:
        if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 4)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));

          if (v13)
          {
            objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
            v23[0] = v14;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));
            v23[1] = v15;
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v23,  2LL));
            [v3 sendFilenamePair:v16];
          }
        }

        if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 5)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));

          if (v17)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 localTupleDictionary]);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
            [v18 setObject:v19 forKey:v20];
          }
        }

        if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 1
          || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 4)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](&OBJC_CLASS___SystemDiagnosticIDS, "sharedInstance"));
          [v21 setPreferredWifi:1];
        }

        goto LABEL_28;
      }
    }

    else
    {
      unsigned int v12 = -[SystemDiagnosticiOS idsCase](self, "idsCase");
      if (!v9 || v12 != 3) {
        goto LABEL_18;
      }
    }

    dispatch_group_enter(v9);
    goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v22 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got nil SystemDiagnosticIDS instance, not starting IDS connection",  v22,  2u);
  }

- (BOOL)tailspinOnly
{
  return self->_tailspinOnly;
}

- (void)setTailspinOnly:(BOOL)a3
{
  self->_tailspinOnly = a3;
}

- (BOOL)vibrateStart
{
  return self->_vibrateStart;
}

- (void)setVibrateStart:(BOOL)a3
{
  self->_vibrateStart = a3;
}

- (int64_t)maxHistory
{
  return self->_maxHistory;
}

- (void)setMaxHistory:(int64_t)a3
{
  self->_maxHistory = a3;
}

- (int64_t)openIssueFiler
{
  return self->_openIssueFiler;
}

- (void)setOpenIssueFiler:(int64_t)a3
{
  self->_openIssueFiler = a3;
}

- (int64_t)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(int64_t)a3
{
  self->_statusBar = a3;
}

- (int)idsCase
{
  return self->_idsCase;
}

- (void)setIdsCase:(int)a3
{
  self->_idsCase = a3;
}

- (BOOL)wasLockedAtLaunch
{
  return self->_wasLockedAtLaunch;
}

- (void)setWasLockedAtLaunch:(BOOL)a3
{
  self->_wasLockedAtLaunch = a3;
}

@end