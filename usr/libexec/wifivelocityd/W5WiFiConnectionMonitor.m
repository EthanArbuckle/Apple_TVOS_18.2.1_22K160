@interface W5WiFiConnectionMonitor
- (W5WiFiConnectionMonitor)init;
- (W5WiFiConnectionMonitor)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4;
- (id)__followupTests;
- (id)__initialTests;
- (id)droppedWiFiConnectionCallback;
- (void)__runDiagnosticsTests:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)pauseMonitoring;
- (void)resumeMonitoringAfterDelay:(double)a3;
- (void)setDroppedWiFiConnectionCallback:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation W5WiFiConnectionMonitor

- (W5WiFiConnectionMonitor)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5WiFiConnectionMonitor;
  v6 = -[W5WiFiConnectionMonitor init](&v12, "init");
  v7 = v6;
  if (a3 && v6 && (v6->_status = (W5StatusManager *)a3, a4))
  {
    v7->_diagnostics = (W5DiagnosticsManager *)a4;
    v8 = dispatch_queue_create("com.apple.wifivelocity.wifi-conn-monitor", 0LL);
    v7->_queue = (OS_dispatch_queue *)v8;
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
    v7->_pingTimer = (OS_dispatch_source *)v9;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100031F6C;
    handler[3] = &unk_1000D1BF8;
    handler[4] = v7;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer((dispatch_source_t)v7->_pingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)v7->_pingTimer);
  }

  else
  {

    return 0LL;
  }

  return v7;
}

- (W5WiFiConnectionMonitor)init
{
  return result;
}

- (void)dealloc
{
  pingTimer = self->_pingTimer;
  if (pingTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pingTimer);
    dispatch_release((dispatch_object_t)self->_pingTimer);
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5WiFiConnectionMonitor;
  -[W5WiFiConnectionMonitor dealloc](&v5, "dealloc");
}

- (void)setDroppedWiFiConnectionCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_droppedWiFiConnectionCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100032534;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)__runDiagnosticsTests:(id)a3 reply:(id)a4
{
  v7 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestRequestInternal);
  -[W5DiagnosticsTestRequestInternal setUuid:](v7, "setUuid:", +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v7, "setTestRequests:", a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003262C;
  v8[3] = &unk_1000D1FA0;
  v8[4] = self;
  v8[5] = a4;
  -[W5DiagnosticsTestRequestInternal setReply:](v7, "setReply:", v8);
  -[W5DiagnosticsManager addRequest:](self->_diagnostics, "addRequest:", v7);
}

- (id)__initialTests
{
  v3[1] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  3LL,  0LL,  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  52LL,  0LL));
  v3[2] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  6LL,  0LL);
  v3[3] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  7LL,  0LL);
  v3[4] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  9LL,  0LL);
  v3[5] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  11LL,  0LL);
  v3[6] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  32LL,  0LL);
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 7LL);
}

- (id)__followupTests
{
  v3[0] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  52LL,  0LL);
  v3[1] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  3LL,  0LL);
  v3[2] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  6LL,  0LL);
  v3[3] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  7LL,  0LL);
  v3[4] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  9LL,  0LL);
  v3[5] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  11LL,  0LL);
  v3[6] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  24LL,  0LL);
  void v3[7] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( &OBJC_CLASS___W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  32LL,  0LL);
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 8LL);
}

- (void)startMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032A98;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032B48;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)pauseMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032BF4;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeMonitoringAfterDelay:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100032CA0;
  v4[3] = &unk_1000D2440;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)droppedWiFiConnectionCallback
{
  return self->_droppedWiFiConnectionCallback;
}

@end