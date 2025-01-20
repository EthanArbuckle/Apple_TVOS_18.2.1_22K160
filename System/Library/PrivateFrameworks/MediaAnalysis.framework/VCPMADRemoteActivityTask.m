@interface VCPMADRemoteActivityTask
+ (id)taskWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4;
- (BOOL)run:(id *)a3;
- (VCPMADRemoteActivityTask)initWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4;
- (id)connection;
- (void)updateProgress:(double)a3;
@end

@implementation VCPMADRemoteActivityTask

- (VCPMADRemoteActivityTask)initWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VCPMADRemoteActivityTask;
  v7 = -[VCPMADRemoteActivityTask initWithCompletionHandler:](&v14, "initWithCompletionHandler:", v6);
  v9 = v7;
  if (v7)
  {
    v7->_activityType = a3;
    if ((int)MediaAnalysisLogLevel(v7, v8) >= 7)
    {
      uint64_t v10 = VCPLogInstance();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 67109120;
        int v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MAD BG Service] Initializing activity %d ... ", buf, 8u);
      }
    }
  }

  return v9;
}

+ (id)taskWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4
{
  id v6 = a4;
  if (a3 <= 0x10 && ((1LL << a3) & 0x1140E) != 0 || a3 == 256) {
    id v7 = [objc_alloc((Class)a1) initWithActivityType:a3 andCompletionHandler:v6];
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.mediaanalysisd.service.activity",  0LL);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    id v6 = self->_connection;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMADRemoteActivityClientProtocol));
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    uint64_t v8 = self->_connection;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMADRemoteActivityServerProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &stru_1001BD2B8);
    objc_initWeak(&location, self);
    uint64_t v10 = self->_connection;
    os_log_type_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    objc_super v14 = sub_1000D22C0;
    v15 = &unk_1001B99F0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (void)updateProgress:(double)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v4 pet];

  uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
  if ((int)v7 >= 6)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      int v12 = 134217984;
      double v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAD BG Service] %3.1f%% complete", (uint8_t *)&v12, 0xCu);
    }
  }

- (BOOL)run:(id *)a3
{
  uint64_t v79 = 0LL;
  v80 = &v79;
  uint64_t v81 = 0x2020000000LL;
  char v82 = 1;
  uint64_t v73 = 0LL;
  v74 = &v73;
  uint64_t v75 = 0x3032000000LL;
  v76 = sub_1000D2BF8;
  v77 = sub_1000D2C08;
  id v78 = 0LL;
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x2020000000LL;
  char v72 = 1;
  os_log_type_t type = VCPLogToOSLogType[7];
  while (1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v4 pet];

    id v5 = -[VCPMADRemoteActivityTask isCanceled](self, "isCanceled");
    if ((_DWORD)v5)
    {
      uint64_t v28 = MediaAnalysisLogLevel(v5, v6);
      if ((int)v28 >= 5)
      {
        uint64_t v30 = VCPLogInstance(v28, v29);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v32 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v31, v32))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "[MAD BG Service] Processing canceled", buf, 2u);
        }
      }

      NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Processing canceled"));
      v90 = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
      uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v34));
      v36 = (void *)v74[5];
      v74[5] = v35;

      *((_BYTE *)v80 + 24) = 0;
LABEL_15:
      uint64_t v37 = MediaAnalysisLogLevel(v26, v27);
      if ((int)v37 >= 5)
      {
        uint64_t v39 = VCPLogInstance(v37, v38);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        os_log_type_t v41 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v40, v41))
        {
          unsigned int v42 = [(id)v74[5] code];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "[MAD BG Service] finished (%d)", buf, 8u);
        }
      }

      if (a3)
      {
        v43 = (void *)v74[5];
        if (v43)
        {
          id v44 = [v43 copy];
          id v45 = *a3;
          *a3 = v44;
        }
      }

      BOOL v46 = *((_BYTE *)v80 + 24) != 0;
      goto LABEL_30;
    }

    uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v7 >= 7)
    {
      uint64_t v9 = VCPLogInstance(v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, type))
      {
        unint64_t activityType = self->_activityType;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = activityType;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  type,  "[MAD BG Service] Waking background analysis service (%d) ...",  buf,  8u);
      }
    }

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMADRemoteActivityTask connection](self, "connection"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteObjectProxyWithErrorHandler:&stru_1001BD2D8]);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_1000D2C8C;
    v67[3] = &unk_1001BD300;
    v15 = v12;
    v68 = v15;
    [v14 wakeWithReply:v67];

    dispatch_time_t v16 = dispatch_time(0LL, 30000000000LL);
    uint64_t v17 = dispatch_semaphore_wait(v15, v16);
    if (v17) {
      break;
    }
    v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMADRemoteActivityTask connection](self, "connection"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_1000D2D58;
    v65[3] = &unk_1001BB430;
    v21 = v19;
    v66 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 remoteObjectProxyWithErrorHandler:v65]);
    unint64_t v23 = self->_activityType;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_1000D2E70;
    v60[3] = &unk_1001BD328;
    v62 = &v73;
    v60[4] = self;
    v63 = &v79;
    v64 = &v69;
    v24 = v21;
    v61 = v24;
    [v22 startActivityWithType:v23 andReply:v60];

    *(void *)buf = 0LL;
    v84 = buf;
    uint64_t v85 = 0x2020000000LL;
    int v86 = 0;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1000D30E8;
    v59[3] = &unk_1001BA008;
    v59[4] = self;
    v59[5] = buf;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPTimer timerWithInterval:unit:oneShot:andBlock:]( &OBJC_CLASS___VCPTimer,  "timerWithInterval:unit:oneShot:andBlock:",  100LL,  2LL,  0LL,  v59));
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    [v25 destroy];

    _Block_object_dispose(buf, 8);
    if (!*((_BYTE *)v70 + 24)) {
      goto LABEL_15;
    }
  }

  uint64_t v47 = MediaAnalysisLogLevel(v17, v18);
  if ((int)v47 >= 3)
  {
    uint64_t v49 = VCPLogInstance(v47, v48);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    os_log_type_t v51 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v50, v51))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  v51,  "[MAD BG Service] Waking background analysis service timeout; deferring ...",
        buf,
        2u);
    }
  }

  if (a3)
  {
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Waking background analysis service timeout; deferring ..."));
    v88 = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v53));
    id v55 = *a3;
    *a3 = v54;
  }

  BOOL v46 = 0;
LABEL_30:
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  return v46;
}

- (void).cxx_destruct
{
}

@end