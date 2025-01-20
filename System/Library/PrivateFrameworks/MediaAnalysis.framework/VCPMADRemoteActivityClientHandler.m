@interface VCPMADRemoteActivityClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
+ (id)serviceName;
+ (void)notifyServicePID;
- (VCPMADRemoteActivityClientHandler)initWithXPCConnection:(id)a3;
- (void)cancelActivity;
- (void)handleLostConnection;
- (void)startActivityWithType:(unint64_t)a3 andReply:(id)a4;
- (void)wakeWithReply:(id)a3;
@end

@implementation VCPMADRemoteActivityClientHandler

+ (id)serviceName
{
  return @"com.apple.mediaanalysisd.service.activity";
}

- (VCPMADRemoteActivityClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VCPMADRemoteActivityClientHandler;
  v6 = -[VCPMADRemoteActivityClientHandler init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    [*p_connection setExportedObject:v7];
    id v9 = *p_connection;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMADRemoteActivityServerProtocol));
    [v9 setExportedInterface:v10];

    id v11 = *p_connection;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMADRemoteActivityClientProtocol));
    [v11 setRemoteObjectInterface:v12];

    id v13 = *p_connection;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000CF3AC;
    v18[3] = &unk_1001B99F0;
    objc_copyWeak(&v19, &location);
    [v13 setInterruptionHandler:v18];
    id v14 = *p_connection;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000CF460;
    v16[3] = &unk_1001B99F0;
    objc_copyWeak(&v17, &location);
    [v14 setInvalidationHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithXPCConnection:v4];

  return v5;
}

- (void)handleLostConnection
{
  p_taskID = &self->_taskID;
  if (atomic_load(&self->_taskID.__a_.__a_value))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    uint64_t v6 = atomic_load(&p_taskID->__a_.__a_value);
    id v7 = v5;
    [v5 cancelTaskWithID:v6];
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[VCPClientManager sharedManager](&OBJC_CLASS___VCPClientManager, "sharedManager"));
  [v8 removeClientHandler:self];
}

+ (void)notifyServicePID
{
  if (qword_1001E6620 != -1) {
    dispatch_once(&qword_1001E6620, &stru_1001BD0B8);
  }
  if (dword_1001E6628)
  {
    pid_t v2 = getpid();
    uint64_t v3 = notify_set_state(dword_1001E6628, v2);
    if ((_DWORD)v3)
    {
      int v5 = v3;
      uint64_t v6 = MediaAnalysisLogLevel(v3, v4);
      if ((int)v6 >= 3)
      {
        uint64_t v8 = VCPLogInstance(v6, v7);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        os_log_type_t v10 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v9, v10))
        {
          int v18 = 67109376;
          pid_t v19 = v2;
          __int16 v20 = 1024;
          int v21 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[BG Service] Failed to set service pid (%d) state (%d)",  (uint8_t *)&v18,  0xEu);
        }
      }
    }

    uint64_t v11 = notify_post((const char *)[@"com.apple.mediaanalysisd.serviceProcessID" UTF8String]);
    uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v13 >= 7)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v16, v17))
      {
        int v18 = 67109120;
        pid_t v19 = v2;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[BG Service] Notify service pid: %d", (uint8_t *)&v18, 8u);
      }
    }
  }

- (void)startActivityWithType:(unint64_t)a3 andReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 5)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[BG Service] Request to start activity (%d)", buf, 8u);
    }
  }

  if (atomic_load(&self->_taskID.__a_.__a_value))
  {
    uint64_t v14 = MediaAnalysisLogLevel(v8, v9);
    if ((int)v14 >= 5)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[BG Service] Activity already started; dropping request",
          buf,
          2u);
      }
    }

    NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
    pid_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activity already started; dropping request (%d)",
                      a3));
    v118 = v19;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v118,  &v117,  1LL));
    int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v20));
    v6[2](v6, v21);
  }

  else
  {
    xpc_transaction_exit_clean();
    [(id)objc_opt_class(self) notifyServicePID];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    pid_t v19 = (void *)objc_claimAutoreleasedReturnValue([v22 allPhotoLibraries]);

    if ([v19 count])
    {
      *(void *)buf = 0LL;
      v112 = buf;
      uint64_t v113 = 0x3032000000LL;
      v114 = sub_1000D0650;
      v115 = sub_1000D0660;
      id v116 = 0LL;
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_1000D0668;
      v96[3] = &unk_1001BA4E0;
      unint64_t v98 = a3;
      id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v97 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:]( &OBJC_CLASS___VCPTimer,  "timerWithIntervalSeconds:isOneShot:andBlock:",  60LL,  0LL,  v96));
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472LL;
      v90[2] = sub_1000D0700;
      v90[3] = &unk_1001BD0E0;
      v94 = buf;
      v90[4] = self;
      id v26 = v24;
      id v91 = v26;
      id v71 = v25;
      id v92 = v71;
      unint64_t v95 = a3;
      v70 = v6;
      v93 = v70;
      v73 = objc_retainBlock(v90);
      v88[0] = 0LL;
      v88[1] = v88;
      v88[2] = 0x3032000000LL;
      v88[3] = sub_1000D0650;
      v88[4] = sub_1000D0660;
      id v89 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472LL;
      v84[2] = sub_1000D0AC8;
      v84[3] = &unk_1001BD108;
      v84[4] = self;
      unint64_t v87 = a3;
      id v27 = v26;
      id v85 = v27;
      v86 = v88;
      v28 = objc_retainBlock(v84);
      v72 = v28;
      switch(a3)
      {
        case 1uLL:
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472LL;
          v81[2] = sub_1000D0BFC;
          v81[3] = &unk_1001BC570;
          v81[4] = self;
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[VCPLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  v19,  &__NSDictionary0__struct,  v81,  v73,  &stru_1001BD1A8));
          goto LABEL_41;
        case 2uLL:
          if (VCPMADUnifiedBackgroundProcessing())
          {
            v109 = @"SkipSyncGallery";
            v110 = &__kCFBooleanTrue;
            v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v110,  &v109,  1LL));
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[MADUnifiedProcessingTask taskWithCancelBlock:options:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADUnifiedProcessingTask,  "taskWithCancelBlock:options:progressHandler:andCompletionHandler:",  &stru_1001BD128,  v46,  v72,  v73));

            goto LABEL_32;
          }

          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472LL;
          v83[2] = sub_1000D0BB4;
          v83[3] = &unk_1001BC570;
          v83[4] = self;
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v19,  &stru_1001BD148,  v83,  v73));
          goto LABEL_41;
        case 3uLL:
          if (VCPMADUnifiedBackgroundProcessing())
          {
            v107 = @"SkipSyncGallery";
            v108 = &__kCFBooleanFalse;
            v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v108,  &v107,  1LL));
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[MADUnifiedProcessingTask taskWithCancelBlock:options:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADUnifiedProcessingTask,  "taskWithCancelBlock:options:progressHandler:andCompletionHandler:",  &stru_1001BD168,  v47,  v72,  v73));

            goto LABEL_32;
          }

          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472LL;
          v82[2] = sub_1000D0BD8;
          v82[3] = &unk_1001BC570;
          v82[4] = self;
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPFaceLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  v19,  0LL,  v82,  v73,  &stru_1001BD188));
          goto LABEL_41;
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
          goto LABEL_21;
        case 0xAuLL:
          if (VCPMADUnifiedBackgroundProcessing())
          {
            v105 = @"SkipSyncGallery";
            v106 = &__kCFBooleanTrue;
            v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v106,  &v105,  1LL));
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[MADUnifiedProcessingTask taskWithCancelBlock:options:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADUnifiedProcessingTask,  "taskWithCancelBlock:options:progressHandler:andCompletionHandler:",  &stru_1001BD1C8,  v48,  v72,  v73));

            goto LABEL_32;
          }

          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472LL;
          v80[2] = sub_1000D0C30;
          v80[3] = &unk_1001BC570;
          v80[4] = self;
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[VCPMADOCRLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADOCRLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v19,  &stru_1001BD1E8,  v80,  v73));
LABEL_41:
          v37 = (void *)v30;
          if (v30) {
            goto LABEL_42;
          }
          goto LABEL_33;
        default:
          if (a3 == 256)
          {
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472LL;
            v79[2] = sub_1000D0C54;
            v79[3] = &unk_1001BC570;
            v79[4] = self;
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472LL;
            v77[2] = sub_1000D0C70;
            v77[3] = &unk_1001BADE0;
            v78 = v73;
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[MADProgressReporterProcessingTask taskWithCancelBlock:progressHandler:completionHandler:]( &OBJC_CLASS___MADProgressReporterProcessingTask,  "taskWithCancelBlock:progressHandler:completionHandler:",  &stru_1001BD208,  v79,  v77));

LABEL_32:
            if (v37)
            {
LABEL_42:
              v76[0] = _NSConcreteStackBlock;
              v76[1] = 3221225472LL;
              v76[2] = sub_1000D0CCC;
              v76[3] = &unk_1001BA0C8;
              v76[4] = self;
              uint64_t v56 = objc_claimAutoreleasedReturnValue( +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:]( &OBJC_CLASS___VCPTimer,  "timerWithIntervalSeconds:isOneShot:andBlock:",  10LL,  0LL,  v76));
              v57 = (void *)*((void *)v112 + 5);
              *((void *)v112 + 5) = v56;

              v58 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
              [v58 enable];

              v59 = (void *)objc_claimAutoreleasedReturnValue( +[PHPhotoLibrary vcp_defaultPhotoLibrary]( &OBJC_CLASS___PHPhotoLibrary,  "vcp_defaultPhotoLibrary"));
              v60 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v59));

              [v60 storeSchedulingHistoryForActivityID:a3 andStartTime:v27];
              [v60 purgeExcessiveSchedulingRecordsForActivityID:a3];
              [v60 commit];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_1000D0D40;
              block[3] = &unk_1001B9E70;
              block[4] = self;
              id v43 = v37;
              id v75 = v43;
              v61 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
              v61[2]();

              if (!atomic_load(&self->_taskID.__a_.__a_value))
              {
                uint64_t v65 = MediaAnalysisLogLevel(v62, v63);
                if ((int)v65 >= 4)
                {
                  uint64_t v67 = VCPLogInstance(v65, v66);
                  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
                  os_log_type_t v69 = VCPLogToOSLogType[4];
                  if (os_log_type_enabled(v68, v69))
                  {
                    *(_DWORD *)v103 = 67109120;
                    int v104 = a3;
                    _os_log_impl( (void *)&_mh_execute_header,  v68,  v69,  "[BG Service] Failed to schedule task (%d)",  v103,  8u);
                  }
                }
              }
            }

            else
            {
LABEL_33:
              uint64_t v49 = MediaAnalysisLogLevel(v30, v31);
              if ((int)v49 >= 4)
              {
                uint64_t v51 = VCPLogInstance(v49, v50);
                v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                os_log_type_t v53 = VCPLogToOSLogType[4];
                if (os_log_type_enabled(v52, v53))
                {
                  *(_DWORD *)v103 = 67109120;
                  int v104 = a3;
                  _os_log_impl( (void *)&_mh_execute_header,  v52,  v53,  "[BG Service] Failed to create activity (%d)",  v103,  8u);
                }
              }

              NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
              id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create activity (%d)",  a3));
              id v100 = v43;
              v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
              v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v54));
              v70[2](v70, v55);
            }
          }

          else
          {
LABEL_21:
            uint64_t v38 = MediaAnalysisLogLevel(v28, v29);
            if ((int)v38 >= 4)
            {
              uint64_t v40 = VCPLogInstance(v38, v39);
              v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              os_log_type_t v42 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v41, v42))
              {
                *(_DWORD *)v103 = 67109120;
                int v104 = a3;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "[BG Service] Invalid activity type (%d) requested",  v103,  8u);
              }
            }

            NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
            id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid activity type (%d) requested",  a3));
            id v102 = v43;
            v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
            v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v44));
            v70[2](v70, v45);
          }

          _Block_object_dispose(v88, 8);
          _Block_object_dispose(buf, 8);

          break;
      }
    }

    else
    {
      uint64_t v32 = MediaAnalysisLogLevel(0LL, v23);
      if ((int)v32 >= 5)
      {
        uint64_t v34 = VCPLogInstance(v32, v33);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        os_log_type_t v36 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v35, v36))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "[BG Service] No PhotoLibrary present; quitting processing",
            buf,
            2u);
        }
      }

      v6[2](v6, 0LL);
    }
  }
}

- (void)cancelActivity
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 4)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[BG Service] Request to cancel processing", buf, 2u);
    }
  }

  uint64_t v8 = atomic_load(&self->_taskID.__a_.__a_value);
  if ((_DWORD)v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    [v9 cancelTaskWithID:v8];
LABEL_7:

    return;
  }

  uint64_t v10 = MediaAnalysisLogLevel(v3, v4);
  if ((int)v10 >= 4)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v13 = VCPLogToOSLogType[4];
    if (os_log_type_enabled((os_log_t)v9, v13))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  v13,  "[BG Service] No active task; cannot cancel",
        v14,
        2u);
    }

    goto LABEL_7;
  }

- (void)wakeWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  if ((int)MediaAnalysisLogLevel(v3, v4) >= 7)
  {
    uint64_t v5 = VCPLogInstance();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[BG Service] Wake request", v9, 2u);
    }
  }

  uint64_t v8 = getpid();
  v3[2](v3, v8);
}

- (void).cxx_destruct
{
}

@end