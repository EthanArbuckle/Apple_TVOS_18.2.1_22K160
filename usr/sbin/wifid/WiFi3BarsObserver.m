@interface WiFi3BarsObserver
+ (id)sharedWiFi3BarsObserver;
- (NSXPCConnection)connectionToService;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)timer;
- (WiFi3BarsObserver)init;
- (void)_cleanupMaintenanceTask;
- (void)_installDeferMonitorForActivity:(id)a3 proxy:(id)a4;
- (void)dealloc;
- (void)fetch3BarsNetworksForLocation:(id)a3;
- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4;
- (void)prune3BarsNetworks:(unint64_t)a3;
- (void)run3BarsObserver:(void *)a3 withActivity:(id)a4 withCompletion:(id)a5;
- (void)setTimer:(id)a3;
- (void)setTimerQueue:(id)a3;
@end

@implementation WiFi3BarsObserver

+ (id)sharedWiFi3BarsObserver
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219E98 != -1) {
    dispatch_once(&qword_100219E98, &stru_1001E67B8);
  }
  v3 = (void *)qword_100219E90;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (WiFi3BarsObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFi3BarsObserver;
  v2 = -[WiFi3BarsObserver init](&v7, "init");
  if (v2)
  {
    v3 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.wifi.ThreeBarsXPCService");
    v2->_connectionToService = v3;
    if (v3)
    {
      -[NSXPCConnection setRemoteObjectInterface:]( v2->_connectionToService,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TBXPCServiceProtocol));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10013C93C;
      v6[3] = &unk_1001E2AF0;
      v6[4] = v2;
      -[NSXPCConnection setInvalidationHandler:](v2->_connectionToService, "setInvalidationHandler:", v6);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_10013CA04;
      v5[3] = &unk_1001E2AF0;
      v5[4] = v2;
      -[NSXPCConnection setInterruptionHandler:](v2->_connectionToService, "setInterruptionHandler:", v5);
      -[NSXPCConnection resume](v2->_connectionToService, "resume");
      v2->_timerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifid.3BarsObserverTimer", 0LL);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFi3BarsObserver;
  -[WiFi3BarsObserver dealloc](&v3, "dealloc");
}

- (void)_installDeferMonitorForActivity:(id)a3 proxy:(id)a4
{
  objc_super v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_timerQueue);
  self->_timer = v7;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10013CC38;
  handler[3] = &unk_1001E2AF0;
  handler[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)v7, handler);
  self->_activityStartTimestamp = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  timer = self->_timer;
  dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer((dispatch_source_t)timer, v9, 0x12A05F200uLL, 0x12A05F200uLL);
  v10 = self->_timer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013CC68;
  v11[3] = &unk_1001E5A30;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a3;
  dispatch_source_set_event_handler((dispatch_source_t)v10, v11);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)run3BarsObserver:(void *)a3 withActivity:(id)a4 withCompletion:(id)a5
{
  if (!sub_100068AB0((uint64_t)a3))
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: availability engine is not enabled",  "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]");
    }
    dispatch_time_t v9 = 0LL;
LABEL_13:
    objc_autoreleasePoolPop(v13);
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
    if (!v9) {
      return;
    }
    goto LABEL_6;
  }

  dispatch_time_t v9 = sub_10007E6F0((id *)a3);
  if (!sub_10007E748((uint64_t)a3, (uint64_t)v9))
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: location not valid",  "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]");
    }
    goto LABEL_13;
  }

  connectionToService = self->_connectionToService;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10013CF78;
  v15[3] = &unk_1001E67E0;
  v15[4] = a5;
  id v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connectionToService,  "remoteObjectProxyWithErrorHandler:",  v15);
  if (v11)
  {
    v12 = v11;
    -[WiFi3BarsObserver _installDeferMonitorForActivity:proxy:](self, "_installDeferMonitorForActivity:proxy:", a4, v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10013CFF0;
    v14[3] = &unk_1001E6808;
    v14[4] = self;
    v14[5] = a5;
    [v12 maintenanceTask:104857600 location:v9 predictedForDuration:1 maxPredictedLocations:v14 completionHandler:86400.0];
  }

  if (v9) {
LABEL_6:
  }
    CFRelease(v9);
}

- (void)_cleanupMaintenanceTask
{
  objc_super v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: cleaning maintenance task",  "-[WiFi3BarsObserver _cleanupMaintenanceTask]");
  }
  objc_autoreleasePoolPop(v3);
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel((dispatch_source_t)timer);
  }
}

- (void)fetch3BarsNetworksForLocation:(id)a3
{
  id v4 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "remoteObjectProxyWithErrorHandler:",  &stru_1001E6848);
  if (v4) {
    [v4 fetch3BarsNetworksForLocation:a3];
  }
}

- (void)prune3BarsNetworks:(unint64_t)a3
{
  id v4 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "remoteObjectProxyWithErrorHandler:",  &stru_1001E6868);
  if (v4) {
    [v4 prune3BarsNetworks:a3];
  }
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  id v6 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "remoteObjectProxyWithErrorHandler:",  &stru_1001E6888);
  if (v6) {
    [v6 forceFetch3BarsNetworkMatchingBSSID:a3 completionHandler:a4];
  }
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  self->_timer = (OS_dispatch_source *)a3;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
}

@end