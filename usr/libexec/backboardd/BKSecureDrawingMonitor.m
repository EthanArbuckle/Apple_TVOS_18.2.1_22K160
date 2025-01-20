@interface BKSecureDrawingMonitor
+ (id)sharedInstance;
- (BKSecureDrawingMonitor)init;
- (BOOL)isSecureModeEnabled;
- (void)reportAndKillInsecureProcesses;
- (void)setSecureModeEnabled:(BOOL)a3;
- (void)startMonitoringSecureDrawing;
@end

@implementation BKSecureDrawingMonitor

- (BKSecureDrawingMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BKSecureDrawingMonitor;
  v2 = -[BKSecureDrawingMonitor init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](&OBJC_CLASS___BSDispatchQueueAttributes, "serial"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceClass:9]);
    uint64_t v5 = BSDispatchQueueCreate(@"com.apple.backboardd.secure-drawing-monitor", v4);
    reportingQueue = v2->_reportingQueue;
    v2->_reportingQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)startMonitoringSecureDrawing
{
  reportingQueue = (dispatch_queue_s *)self->_reportingQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100045578;
  v3[3] = &unk_1000B7030;
  v3[4] = self;
  notify_register_dispatch("com.apple.CoreAnimation.CAWindowServer.SecureModeViolation", &out_token, reportingQueue, v3);
}

- (void)reportAndKillInsecureProcesses
{
  if (-[BKSecureDrawingMonitor isSecureModeEnabled](self, "isSecureModeEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](&OBJC_CLASS___CAWindowServer, "serverIfRunning"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 secureModeViolations]);

    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_100045064;
    v34 = sub_100045074;
    id v35 = 0LL;
    v28[0] = 0LL;
    v28[1] = v28;
    v28[2] = 0x3032000000LL;
    v28[3] = sub_100045064;
    v28[4] = sub_100045074;
    id v29 = 0LL;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10004507C;
    v27[3] = &unk_1000B7058;
    v27[4] = &v30;
    v27[5] = v28;
    [v3 enumerateObjectsUsingBlock:v27];
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    v24 = sub_100045064;
    v25 = sub_100045074;
    id v26 = 0LL;
    if (v31[5])
    {
      v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v5 = (void *)v22[5];
      v22[5] = (uint64_t)v4;

      v6 = (void *)v31[5];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100045258;
      v20[3] = &unk_1000B70A8;
      v20[4] = v28;
      v20[5] = &v21;
      [v6 enumerateKeysAndObjectsUsingBlock:v20];
      if (v22[5])
      {
        uint64_t v41 = 0LL;
        v42 = &v41;
        uint64_t v43 = 0x2050000000LL;
        v7 = (void *)qword_1000DC150;
        uint64_t v44 = qword_1000DC150;
        if (!qword_1000DC150)
        {
          v36 = _NSConcreteStackBlock;
          uint64_t v37 = 3221225472LL;
          uint64_t v38 = (uint64_t)sub_100045354;
          v39 = &unk_1000B70D0;
          v40 = &v41;
          sub_100045354((uint64_t)&v36);
          v7 = (void *)v42[3];
        }

        objc_super v8 = v7;
        _Block_object_dispose(&v41, 8);
        id v9 = objc_alloc_init(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 systemApplicationBundleIdentifier]);
        v36 = 0LL;
        uint64_t v37 = (uint64_t)&v36;
        uint64_t v38 = 0x2020000000LL;
        v11 = (id *)qword_1000DC160;
        v39 = (void *)qword_1000DC160;
        if (!qword_1000DC160)
        {
          v12 = sub_100045418();
          v11 = (id *)dlsym(v12, "FBSOpenApplicationOptionKeyActions");
          *(void *)(v37 + 24) = v11;
          qword_1000DC160 = (uint64_t)v11;
        }

        _Block_object_dispose(&v36, 8);
        if (!v11)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getFBSOpenApplicationOptionKeyActions(void)"));
          objc_msgSend( v18,  "handleFailureInFunction:file:lineNumber:description:",  v19,  @"BKSecureDrawingMonitor.m",  27,  @"%s",  dlerror());

          __break(1u);
          return;
        }

        id v13 = *v11;
        v14 = v13;
        if (v10)
        {
          if (v13)
          {
            id v15 = objc_alloc(&OBJC_CLASS___BKSInsecureDrawingAction);
            id v16 = [v15 initWithSecureModeViolations:v22[5]];
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v16));
            [v9 sendActions:v17 withResult:0];
          }
        }
      }
    }

    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);
  }

- (BOOL)isSecureModeEnabled
{
  return self->_secureModeEnabled;
}

- (void)setSecureModeEnabled:(BOOL)a3
{
  self->_secureModeEnabled = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC148 != -1) {
    dispatch_once(&qword_1000DC148, &stru_1000B7008);
  }
  return (id)qword_1000DC140;
}

@end