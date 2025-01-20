@interface SystemDiagnosticBT
+ (id)sharedInstance;
- (BOOL)attachedToBTSession;
- (BOOL)isLimitedLoggingEnabled;
- (BOOL)shouldGatherBTLogs;
- (BOOL)waitingToCaptureAirPodLogs;
- (BTAccessoryManagerImpl)accessoryManager;
- (BTSessionImpl)btSession;
- (NSArray)accessoryLogs;
- (NSString)diagnosticID;
- (OS_dispatch_group)airpodsGroup;
- (OS_dispatch_queue)bluetoothQueue;
- (OS_os_log)accessoryLogSubsystem;
- (SystemDiagnosticBT)init;
- (id)waitForAirPodLogsIfAvailable;
- (int)numAttachTries;
- (unint64_t)defaultAirpodTimeout;
- (unint64_t)getAirpodsTimeout;
- (void)attachToBTSession;
- (void)deregisterBTSession;
- (void)deregisterBTSessionIfDone;
- (void)forceDeregisterBTSession;
- (void)logCompletionHandler:(char *)a3 size:(unint64_t)a4;
- (void)markAirpodLogsDone:(BOOL)a3;
- (void)retryAttachToBTSession;
- (void)sessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)setAccessoryLogSubsystem:(id)a3;
- (void)setAccessoryLogs:(id)a3;
- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setAirpodsGroup:(id)a3;
- (void)setAttachedToBTSession:(BOOL)a3;
- (void)setBluetoothQueue:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setDefaultAirpodTimeout:(unint64_t)a3;
- (void)setDiagnosticID:(id)a3;
- (void)setNumAttachTries:(int)a3;
- (void)setShouldGatherBTLogs:(BOOL)a3;
- (void)setWaitingToCaptureAirPodLogs:(BOOL)a3;
- (void)startBTSession:(id)a3;
- (void)startBTSessionAndTriggerAirPodLogs:(id)a3;
- (void)triggerAirPodLogsIfConnected;
@end

@implementation SystemDiagnosticBT

+ (id)sharedInstance
{
  if (qword_1000A5170 != -1) {
    dispatch_once(&qword_1000A5170, &stru_100088E80);
  }
  return (id)qword_1000A5168;
}

- (SystemDiagnosticBT)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SystemDiagnosticBT;
  v2 = -[SystemDiagnosticBT init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_shouldGatherBTLogs = 1;
    os_log_t v4 = os_log_create("com.apple.sysdiagnose", "bluetooth");
    accessoryLogSubsystem = v3->_accessoryLogSubsystem;
    v3->_accessoryLogSubsystem = v4;

    airpodsGroup = v3->_airpodsGroup;
    v3->_airpodsGroup = 0LL;

    v3->_defaultAirpodTimeout = 0LL;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.sysdiagnose.bluetooth", 0LL);
    bluetoothQueue = v3->_bluetoothQueue;
    v3->_bluetoothQueue = (OS_dispatch_queue *)v7;

    v3->_numAttachTries = 0;
  }

  return v3;
}

- (void)attachToBTSession
{
  objc_super v10 = sub_10000A53C;
  id v3 = objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT diagnosticID](self, "diagnosticID"));
  int v4 = BTSessionAttachWithQueue([v3 UTF8String], &v10, 0, self->_bluetoothQueue);

  -[SystemDiagnosticBT setNumAttachTries:]( self,  "setNumAttachTries:",  -[SystemDiagnosticBT numAttachTries](self, "numAttachTries") + 1);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100053820();
    }

    dispatch_queue_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000087C4;
    block[3] = &unk_100088EA8;
    block[4] = self;
    dispatch_sync(v7, block);
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully attached to bluetoothd, waiting for session callback.",  v8,  2u);
    }

    -[SystemDiagnosticBT setAttachedToBTSession:](self, "setAttachedToBTSession:", 1LL);
  }

- (void)startBTSession:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000088C4;
  v6[3] = &unk_100088ED0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (!*((_BYTE *)v8 + 24) && !-[SystemDiagnosticBT attachedToBTSession](self, "attachedToBTSession"))
  {
    -[SystemDiagnosticBT setNumAttachTries:](self, "setNumAttachTries:", 0LL);
    -[SystemDiagnosticBT setDiagnosticID:](self, "setDiagnosticID:", v4);
    -[SystemDiagnosticBT attachToBTSession](self, "attachToBTSession");
  }

  _Block_object_dispose(&v7, 8);
}

- (void)startBTSessionAndTriggerAirPodLogs:(id)a3
{
  id v4 = a3;
  if (qword_1000A5180 != -1) {
    dispatch_once(&qword_1000A5180, &stru_100088F40);
  }
  if ((byte_1000A5178 & 1) != 0)
  {
    if (-[SystemDiagnosticBT shouldGatherBTLogs](self, "shouldGatherBTLogs"))
    {
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Querying bluetooth if Airpods are connected, and collect AirPod logs if so.",  buf,  2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v6,  "logWithSubsystem:category:msg:",  "remoteSysdiagnose",  "AccessoryLogSubsystem",  @"Querying bluetooth if Airpods are connected, and collect AirPod logs if so.");

      -[SystemDiagnosticBT setAccessoryLogs:](self, "setAccessoryLogs:", 0LL);
      dispatch_group_t v7 = dispatch_group_create();
      -[SystemDiagnosticBT setAirpodsGroup:](self, "setAirpodsGroup:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
      if (v8)
      {
        uint64_t v9 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
        dispatch_group_enter(v9);
      }

      *(void *)buf = 0LL;
      v15 = buf;
      uint64_t v16 = 0x2020000000LL;
      char v17 = 0;
      char v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100008BA8;
      v13[3] = &unk_100088ED0;
      v13[4] = self;
      v13[5] = buf;
      dispatch_sync(v10, v13);

      if (v15[24]) {
        -[SystemDiagnosticBT startBTSession:](self, "startBTSession:", v4);
      }
      _Block_object_dispose(buf, 8);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not triggering AirPod logs, as self.shouldGatherBTLogs is set to NO",  buf,  2u);
    }
  }

  else
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not triggering airpod logs since bluetooth is missing",  buf,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v12 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Not triggering airpod logs since bluetooth is missing"];
  }
}

- (BOOL)isLimitedLoggingEnabled
{
  if (objc_opt_class(&OBJC_CLASS___CBUserController, a2))
  {
    *(void *)v22 = 0LL;
    v23 = v22;
    uint64_t v24 = 0x2020000000LL;
    char v25 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    dispatch_time_t v4 = dispatch_time(0LL, 1000000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100008EDC;
    block[3] = &unk_100088F20;
    block[4] = self;
    v21 = v22;
    dispatch_group_t v7 = v3;
    v20 = v7;
    dispatch_async(v6, block);

    if (dispatch_semaphore_wait(v7, v4))
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for limited logging check. Assuming limited logging disabled",  buf,  2u);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v9,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      char v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v10 stdoutWrite:@"Timed out waiting for limited logging check. Assuming limited logging disabled"];

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v11 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Timed out waiting for limited logging check. Assuming limited logging disabled"];

      BOOL v12 = 0;
    }

    else
    {
      BOOL v12 = v23[24] != 0;
    }

    _Block_object_dispose(v22, 8);
  }

  else
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CBUserController not found. Assuming limited logging disabled",  v22,  2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v14,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v15 stdoutWrite:@"CBUserController not found. Assuming limited logging disabled"];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v16 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"CBUserController not found. Assuming limited logging disabled"];

    return 0;
  }

  return v12;
}

- (unint64_t)getAirpodsTimeout
{
  if (-[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout"))
  {
    dispatch_semaphore_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout");
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Found testing airpod timeouts override. Using timeout: %llu",  buf,  0xCu);
    }

    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v4,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v5,  "stdoutWrite:",  @"Found testing airpod timeouts override. Using timeout: %llu",  -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v6,  "logWithSubsystem:category:msg:",  "remoteSysdiagnose",  "AccessoryLogSubsystem",  @"Found testing airpod timeouts override. Using timeout: %llu",  -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout"));

    return -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout");
  }

  else
  {
    if (sub_1000404C4(@"airpods-timeout", @"com.apple.sysdiagnose", @"mobile", buf))
    {
      unint64_t v7 = 1000000000LL * *(void *)buf;
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found manual airpods timeout override. Using timeout: %llu",  buf,  0xCu);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v9,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      char v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v11 = @"Found manual airpods timeout override. Using timeout: %llu";
      objc_msgSend(v10, "stdoutWrite:", @"Found manual airpods timeout override. Using timeout: %llu", v7);
    }

    else
    {
      unsigned int v12 = -[SystemDiagnosticBT isLimitedLoggingEnabled](self, "isLimitedLoggingEnabled");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        unint64_t v7 = 300000000000LL;
        if (v14)
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = 300000000000LL;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Limited logging is enabled. Using airpods timeout: %llu",  buf,  0xCu);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend( v15,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
          "remoteSysdiagnose",
          "AccessoryLogSubsystem");

        char v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v11 = @"Limited logging is enabled. Using airpods timeout: %llu";
        objc_msgSend( v10,  "stdoutWrite:",  @"Limited logging is enabled. Using airpods timeout: %llu",  300000000000);
      }

      else
      {
        unint64_t v7 = 240000000000LL;
        if (v14)
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = 240000000000LL;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No preferences found. Using default airpods timeout value of: %llu",  buf,  0xCu);
        }

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend( v16,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
          "remoteSysdiagnose",
          "AccessoryLogSubsystem");

        char v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v11 = @"No preferences found. Using default airpods timeout value of: %llu";
        objc_msgSend( v10,  "stdoutWrite:",  @"No preferences found. Using default airpods timeout value of: %llu",  240000000000);
      }
    }

    char v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v17, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", v11, v7);
  }

  return v7;
}

- (id)waitForAirPodLogsIfAvailable
{
  if (qword_1000A5180 != -1) {
    dispatch_once(&qword_1000A5180, &stru_100088F40);
  }
  if (byte_1000A5178 != 1) {
    return 0LL;
  }
  if (!-[SystemDiagnosticBT shouldGatherBTLogs](self, "shouldGatherBTLogs"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not waiting for AirPod logs, as self.shouldGatherBTLogs is set to NO",  buf,  2u);
    }

    return 0LL;
  }

  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));

  if (!v3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));

    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "AirPod logs still collecting; waiting for them to become available.",
          buf,
          2u);
      }

      int64_t v14 = -[SystemDiagnosticBT getAirpodsTimeout](self, "getAirpodsTimeout");
      v15 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
      dispatch_time_t v16 = dispatch_time(0LL, v14);
      uint64_t v17 = dispatch_group_wait(v15, v16);

      if (!v17)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));
        id v5 = [v21 copy];

        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received AirPod logs after wait.",  buf,  2u);
        }

        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v8 = v7;
        uint64_t v9 = @"Received AirPod logs after wait.";
        goto LABEL_9;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100053880();
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v19 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Timed out waiting for AirPod logs collection."];

      v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100009998;
      block[3] = &unk_100088EA8;
      block[4] = self;
      dispatch_async(v20, block);
    }

    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No AirPod logs available to collect.",  buf,  2u);
      }

      v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      -[dispatch_queue_s logWithSubsystem:category:msg:]( v20,  "logWithSubsystem:category:msg:",  "remoteSysdiagnose",  "AccessoryLogSubsystem",  @"No AirPod logs available to collect.");
    }

    id v5 = 0LL;
    goto LABEL_24;
  }

  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));
  id v5 = [v4 copy];

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found collected AirPod logs.", buf, 2u);
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  v8 = v7;
  uint64_t v9 = @"Found collected AirPod logs.";
LABEL_9:
  [v7 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:v9];

LABEL_24:
  -[SystemDiagnosticBT setAccessoryLogs:](self, "setAccessoryLogs:", 0LL);
  return v5;
}

- (void)deregisterBTSession
{
  dispatch_semaphore_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[SystemDiagnosticBT accessoryManager](self, "accessoryManager"))
  {
    dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unregistering AirPod logs dump with BTAccessoryManager.",  v6,  2u);
    }

    BTAccessoryManagerDeregisterCustomMessageClient( -[SystemDiagnosticBT accessoryManager](self, "accessoryManager", sub_10000A600),  v6);
    -[SystemDiagnosticBT setAccessoryManager:](self, "setAccessoryManager:", 0LL);
  }

  if (-[SystemDiagnosticBT btSession](self, "btSession"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detaching from bluetoothd.", v6, 2u);
    }

    *(void *)v6 = -[SystemDiagnosticBT btSession](self, "btSession");
    BTSessionDetachWithQueue(v6);
    -[SystemDiagnosticBT setBtSession:](self, "setBtSession:", 0LL);
  }

  -[SystemDiagnosticBT setAttachedToBTSession:](self, "setAttachedToBTSession:", 0LL);
}

- (void)deregisterBTSessionIfDone
{
  dispatch_semaphore_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[SystemDiagnosticBT waitingToCaptureAirPodLogs](self, "waitingToCaptureAirPodLogs")) {
    -[SystemDiagnosticBT deregisterBTSession](self, "deregisterBTSession");
  }
}

- (void)forceDeregisterBTSession
{
  dispatch_semaphore_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  -[SystemDiagnosticBT markAirpodLogsDone:](self, "markAirpodLogsDone:", 0LL);
  -[SystemDiagnosticBT deregisterBTSession](self, "deregisterBTSession");
}

- (void)retryAttachToBTSession
{
  dispatch_semaphore_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  int v4 = -[SystemDiagnosticBT numAttachTries](self, "numAttachTries");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  v6 = v5;
  if (v4 > 2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000538AC(self, v6);
    }

    -[SystemDiagnosticBT forceDeregisterBTSession](self, "forceDeregisterBTSession");
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v9 = -[SystemDiagnosticBT numAttachTries](self, "numAttachTries");
      __int16 v10 = 1024;
      int v11 = 3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempt (%d/%d) to attach to BTSession failed. Trying again...",  buf,  0xEu);
    }

    -[SystemDiagnosticBT deregisterBTSession](self, "deregisterBTSession");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009CC4;
    block[3] = &unk_100088EA8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)markAirpodLogsDone:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v5);

  -[SystemDiagnosticBT setWaitingToCaptureAirPodLogs:](self, "setWaitingToCaptureAirPodLogs:", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));

  if (v6)
  {
    if (!a3)
    {
      unint64_t v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
      dispatch_group_leave(v7);
    }

    -[SystemDiagnosticBT setAirpodsGroup:](self, "setAirpodsGroup:", 0LL);
  }

  -[SystemDiagnosticBT deregisterBTSessionIfDone](self, "deregisterBTSessionIfDone");
}

- (void)triggerAirPodLogsIfConnected
{
  dispatch_semaphore_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v3);

  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to trigger AirPod logs dump.",  buf,  2u);
  }

  if (BTAccessoryManagerGetDefault(-[SystemDiagnosticBT btSession](self, "btSession"), buf))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100053A50();
    }

    goto LABEL_27;
  }

  -[SystemDiagnosticBT setAccessoryManager:](self, "setAccessoryManager:", *(void *)buf);
  __int16 v10 = sub_10000A600;
  int v6 = BTAccessoryManagerRegisterCustomMessageClient( -[SystemDiagnosticBT accessoryManager](self, "accessoryManager"),  &v10,  64LL,  0xFFFFFFFFLL);
  if (v6 > 9)
  {
    switch(v6)
    {
      case 10:
        unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1000539CC();
        }
        goto LABEL_26;
      case 312:
        unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1000539F8();
        }
        goto LABEL_26;
      case 11:
        unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1000539A0();
        }
LABEL_26:

LABEL_27:
        -[SystemDiagnosticBT markAirpodLogsDone:](self, "markAirpodLogsDone:", 0LL);
        return;
    }

- (void)sessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v9);

  switch(a4)
  {
    case 0:
      if (a5)
      {
        __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100053B1C();
        }

        -[SystemDiagnosticBT retryAttachToBTSession](self, "retryAttachToBTSession");
      }

      else
      {
        -[SystemDiagnosticBT setBtSession:](self, "setBtSession:", a3);
        BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received BT_SESSION_ATTACHED (BT_SUCCESS) event in BTSession event callback. Capturing available data.",  buf,  2u);
        }

        if (-[SystemDiagnosticBT waitingToCaptureAirPodLogs](self, "waitingToCaptureAirPodLogs")) {
          -[SystemDiagnosticBT triggerAirPodLogsIfConnected](self, "triggerAirPodLogsIfConnected");
        }
      }

      return;
    case 1:
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received BT_SESSION_DETACHED event in BTSession event callback. Ignoring.",  v14,  2u);
      }

      goto LABEL_15;
    case 2:
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100053B7C();
      }

      -[SystemDiagnosticBT forceDeregisterBTSession](self, "forceDeregisterBTSession");
      return;
    case 3:
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100053BA8();
      }
      goto LABEL_15;
    default:
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100053AB0();
      }
LABEL_15:

      return;
  }

- (void)logCompletionHandler:(char *)a3 size:(unint64_t)a4
{
  unint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT bluetoothQueue](self, "bluetoothQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "AirPod logs callback received.",  (uint8_t *)&v19,  2u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogs](self, "accessoryLogs"));
  if (v9)
  {
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100053C80();
    }
  }

  else
  {
    __int16 v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    if ((uint64_t)a4 >= 1)
    {
      int v11 = &a3[a4];
      while (1)
      {
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
        BOOL v13 = v12;
        if (!v12 || ![v12 length]) {
          break;
        }
        -[os_log_s addObject:](v10, "addObject:", v13);
        a3 += strlen(a3) + 1;

        if (a3 >= v11) {
          goto LABEL_15;
        }
      }

      int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100053C54();
      }
    }

- (BOOL)shouldGatherBTLogs
{
  return self->_shouldGatherBTLogs;
}

- (void)setShouldGatherBTLogs:(BOOL)a3
{
  self->_shouldGatherBTLogs = a3;
}

- (unint64_t)defaultAirpodTimeout
{
  return self->_defaultAirpodTimeout;
}

- (void)setDefaultAirpodTimeout:(unint64_t)a3
{
  self->_defaultAirpodTimeout = a3;
}

- (OS_dispatch_queue)bluetoothQueue
{
  return self->_bluetoothQueue;
}

- (void)setBluetoothQueue:(id)a3
{
}

- (NSArray)accessoryLogs
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAccessoryLogs:(id)a3
{
}

- (OS_os_log)accessoryLogSubsystem
{
  return self->_accessoryLogSubsystem;
}

- (void)setAccessoryLogSubsystem:(id)a3
{
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (int)numAttachTries
{
  return self->_numAttachTries;
}

- (void)setNumAttachTries:(int)a3
{
  self->_numAttachTries = a3;
}

- (NSString)diagnosticID
{
  return self->_diagnosticID;
}

- (void)setDiagnosticID:(id)a3
{
}

- (BOOL)attachedToBTSession
{
  return self->_attachedToBTSession;
}

- (void)setAttachedToBTSession:(BOOL)a3
{
  self->_attachedToBTSession = a3;
}

- (BOOL)waitingToCaptureAirPodLogs
{
  return self->_waitingToCaptureAirPodLogs;
}

- (void)setWaitingToCaptureAirPodLogs:(BOOL)a3
{
  self->_waitingToCaptureAirPodLogs = a3;
}

- (OS_dispatch_group)airpodsGroup
{
  return self->_airpodsGroup;
}

- (void)setAirpodsGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end