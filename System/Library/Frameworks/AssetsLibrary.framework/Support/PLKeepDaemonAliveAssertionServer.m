@interface PLKeepDaemonAliveAssertionServer
+ (void)start;
- (PLKeepDaemonAliveAssertionServer)init;
- (void)_deactivateCameraSession;
- (void)_registerNewConnection:(id)a3;
- (void)_startServer;
- (void)dealloc;
@end

@implementation PLKeepDaemonAliveAssertionServer

- (PLKeepDaemonAliveAssertionServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PLKeepDaemonAliveAssertionServer;
  v2 = -[PLKeepDaemonAliveAssertionServer init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = pl_dispatch_queue_create_with_fallback_qos( "PLKeepDaemonAliveAssertionServer connection handling queue",  v4,  9LL);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    v8 = -[PLCameraCaptureTaskConstraintCoordinator initWithTaskContstraintRole:name:]( objc_alloc(&OBJC_CLASS___PLCameraCaptureTaskConstraintCoordinator),  "initWithTaskContstraintRole:name:",  1LL,  @"PLKeepDaemonAliveAssertionServer");
    taskConstraintCoordinator = v2->_taskConstraintCoordinator;
    v2->_taskConstraintCoordinator = v8;

    -[PLKeepDaemonAliveAssertionServer _startServer](v2, "_startServer");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PLKeepDaemonAliveAssertionServer;
  -[PLKeepDaemonAliveAssertionServer dealloc](&v3, "dealloc");
}

- (void)_startServer
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service( PLKeepDaemonAliveServiceName,  (dispatch_queue_t)self->_connectionQueue,  1uLL);
  CFRetain(mach_service);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000D134;
  handler[3] = &unk_100020EF0;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
}

- (void)_deactivateCameraSession
{
  uint64_t v3 = PLGatekeeperXPCGetLog(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PLKeepDaemonAliveAssertionServer: deactivating camera session task constraints",  v5,  2u);
  }

  -[PLCameraCaptureTaskConstraintCoordinator deactivateCameraSessionTaskConstraints]( self->_taskConstraintCoordinator,  "deactivateCameraSessionTaskConstraints");
}

- (void)_registerNewConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  uint64_t v6 = PLGatekeeperXPCGetLog(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PLKeepDaemonAliveAssertionServer: activating camera session task constraints",  v8,  2u);
  }

  -[PLCameraCaptureTaskConstraintCoordinator activateCameraSessionTaskConstraints]( self->_taskConstraintCoordinator,  "activateCameraSessionTaskConstraints");
  xpc_connection_set_event_handler(v4, &stru_100020F30);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_connectionQueue);
  xpc_connection_set_context(v4, (void *)qword_1000286F0);
  xpc_connection_set_finalizer_f(v4, (xpc_finalizer_t)sub_10000CFE0);
  xpc_connection_resume(v4);
}

- (void).cxx_destruct
{
}

+ (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000D2D8;
  v2[3] = &unk_100020EC8;
  v2[4] = a1;
  pl_dispatch_once(&unk_1000286E8, v2);
}

@end