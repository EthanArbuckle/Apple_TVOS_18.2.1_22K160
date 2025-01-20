@interface RMAudioListenerPoseEngine
+ (id)sharedInstance;
- (RMAudioListenerPoseEngine)init;
- (id)startProducingDataForObject:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5 callback:(id)a6;
- (void)facePoseCaptureSessionDidConfigure:(id)a3;
- (void)stopProducingDataForObject:(id)a3;
@end

@implementation RMAudioListenerPoseEngine

+ (id)sharedInstance
{
  if (qword_100023C38 != -1) {
    dispatch_once(&qword_100023C38, &stru_10001C688);
  }
  return (id)qword_100023C30;
}

- (RMAudioListenerPoseEngine)init
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___RMAudioListenerPoseEngine;
  v2 = -[RMAudioListenerPoseEngine init](&v38, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  5LL,  0LL));
    sub_100003CEC((uint64_t)v2, v3);

    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("RMAudioListenerPoseEngineQueue", v5);
    sub_100003D0C((uint64_t)v2, v6);

    dispatch_queue_t v7 = dispatch_queue_create("RMAudioListenerPoseCaptureQueue", v5);
    sub_100004244((uint64_t)v2, v7);

    v8 = objc_opt_new(&OBJC_CLASS___RMAudioListenerPoseEngineSession);
    sub_100003CFC((uint64_t)v2, v8);

    v9 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.RelativeMotion");
    sub_100004254((uint64_t)v2, v9);

    defaults = v2->_defaults;
    v42[0] = @"TempestKeepAliveDuration";
    v42[1] = @"TempestOpportunisticAnchoredKeepAliveDuration";
    v43[0] = &off_10001D9D8;
    v43[1] = &off_10001D9E8;
    v42[2] = @"OasisKeepAliveDuration";
    v43[2] = &off_10001D9E8;
    v11 = defaults;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));
    -[NSUserDefaults registerDefaults:](v11, "registerDefaults:", v12);

    unsigned __int8 v13 = 0;
    if (+[RMPlatformInfo isInternalBuild](&OBJC_CLASS___RMPlatformInfo, "isInternalBuild")) {
      unsigned __int8 v13 = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", @"TempestEnableFacePose");
    }
    v2->_BOOL faceKitEnabled = +[RMPlatformInfo supportsOpportunisticAnchoredTracking]( &OBJC_CLASS___RMPlatformInfo,  "supportsOpportunisticAnchoredTracking") | v13;
    v14 = v2->_defaults;
    v2->_BOOL facePoseVerboseLoggingEnabled = -[NSUserDefaults BOOLForKey:]( v14,  "BOOLForKey:",  @"TempestEnableFacePoseVerboseLogging");

    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    v15 = (void *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      unsigned int v17 = +[RMPlatformInfo supportsOpportunisticAnchoredTracking]( &OBJC_CLASS___RMPlatformInfo,  "supportsOpportunisticAnchoredTracking");
      BOOL faceKitEnabled = v2->_faceKitEnabled;
      BOOL facePoseVerboseLoggingEnabled = v2->_facePoseVerboseLoggingEnabled;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v40 = v17;
      *(_WORD *)&v40[4] = 1026;
      *(_DWORD *)&v40[6] = faceKitEnabled;
      LOWORD(v41) = 1026;
      *(_DWORD *)((char *)&v41 + 2) = facePoseVerboseLoggingEnabled;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Face pose supported: %{public}d, face pose enabled: %{public}d, verbose logging: %{public}d",  buf,  0x14u);
    }

    if (v2->_faceKitEnabled
      && (v20 = objc_opt_new(&OBJC_CLASS___RMFacePoseCaptureSession),
          sub_100004264((uint64_t)v2, v20),
          v20,
          -[RMFacePoseCaptureSession setDelegate:](v2->_facePoseCaptureSession, "setDelegate:", v2),
          v21 = objc_opt_new(&OBJC_CLASS___RMLidAngleSensor),
          sub_100004274((uint64_t)v2, v21),
          v21,
          v2->_faceKitEnabled))
    {
      v22 = v2->_defaults;
      v23 = v22;
      v24 = @"TempestOpportunisticAnchoredKeepAliveDuration";
    }

    else
    {
      v22 = v2->_defaults;
      v23 = v22;
      v24 = @"TempestKeepAliveDuration";
    }

    -[NSUserDefaults doubleForKey:](v22, "doubleForKey:", v24);
    session = v2->_session;
    if (session) {
      session->_double keepAliveDurationVideo = v25;
    }

    v27 = v2->_defaults;
    -[NSUserDefaults doubleForKey:](v27, "doubleForKey:", @"OasisKeepAliveDuration");
    v29 = v2->_session;
    if (v29) {
      v29->_keepAliveDurationMusic = v28;
    }

    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    v30 = (void *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v2->_session;
      if (v31) {
        double keepAliveDurationVideo = v31->_keepAliveDurationVideo;
      }
      else {
        double keepAliveDurationVideo = 0.0;
      }
      v33 = v2->_session;
      if (v33) {
        v33 = *(RMAudioListenerPoseEngineSession **)&v33->_keepAliveDurationMusic;
      }
      *(_DWORD *)buf = 134349312;
      *(double *)v40 = keepAliveDurationVideo;
      *(_WORD *)&v40[8] = 2050;
      v41 = v33;
      v34 = v31;
      v35 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "keepAliveDurationVideo: %{public}.3f sec, keepAliveDurationMusic: %{public}.3f sec",  buf,  0x16u);
    }

    v2->_userInteractionMonitorClientCount = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[RMUserInteractionMonitor userInteractionMonitor]( &OBJC_CLASS___RMUserInteractionMonitor,  "userInteractionMonitor"));
    sub_100004284((uint64_t)v2, v36);
  }

  return v2;
}

- (id)startProducingDataForObject:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned __int8 v13 = v12;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_1000043D4;
  v30 = sub_1000043E4;
  id v31 = 0LL;
  if (self) {
    producerQueue = (dispatch_queue_s *)self->_producerQueue;
  }
  else {
    producerQueue = 0LL;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000043EC;
  v20[3] = &unk_10001C6B0;
  v20[4] = self;
  id v21 = v11;
  id v22 = v10;
  id v23 = v12;
  v24 = &v26;
  BOOL v25 = a5;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  dispatch_sync(producerQueue, v20);
  id v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

- (void)stopProducingDataForObject:(id)a3
{
  id v4 = a3;
  if (self) {
    producerQueue = (dispatch_queue_s *)self->_producerQueue;
  }
  else {
    producerQueue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004EBC;
  block[3] = &unk_10001C700;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(producerQueue, block);
}

- (void)facePoseCaptureSessionDidConfigure:(id)a3
{
  id v4 = a3;
  if (self) {
    producerQueue = (dispatch_queue_s *)self->_producerQueue;
  }
  else {
    producerQueue = 0LL;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000674C;
  v7[3] = &unk_10001C700;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(producerQueue, v7);
}

- (void).cxx_destruct
{
}

@end