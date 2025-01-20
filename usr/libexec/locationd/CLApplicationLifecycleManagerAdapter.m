@interface CLApplicationLifecycleManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLApplicationLifecycleManagerAdapter)init;
- (void)beginService;
- (void)endService;
- (void)launchApplication:(id)a3 requiringAuthForServiceMask:(unint64_t)a4;
- (void)launchDaemon:(id)a3;
- (void)manager;
- (void)setManager:(void *)a3;
@end

@implementation CLApplicationLifecycleManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999860 != -1) {
    dispatch_once(&qword_101999860, &stru_101862130);
  }
  return (id)qword_101999858;
}

+ (BOOL)isSupported
{
  if (qword_101999870 != -1) {
    dispatch_once(&qword_101999870, &stru_101862150);
  }
  return (byte_101999868 & 1) == 0;
}

- (CLApplicationLifecycleManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLApplicationLifecycleManagerAdapter;
  return -[CLApplicationLifecycleManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLApplicationLifecycleManagerProtocol,  &OBJC_PROTOCOL___CLApplicationLifecycleManagerClientProtocol);
}

- (void)beginService
{
  objc_super v3 = operator new(0x58uLL);
  sub_10095B0B8((uint64_t)v3, -[CLApplicationLifecycleManagerAdapter universe](self, "universe"));
  self->_manager = v3;
}

- (void)endService
{
  manager = self->_manager;
  if (manager)
  {
    v4 = (void *)sub_10095B6A8((uint64_t)manager);
    operator delete(v4);
  }

  self->_manager = 0LL;
}

- (void)launchApplication:(id)a3 requiringAuthForServiceMask:(unint64_t)a4
{
  manager = self->_manager;
  if (manager)
  {
    sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
    sub_10095A65C((uint64_t)manager, (unsigned __int8 *)__p, a4);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }

- (void)launchDaemon:(id)a3
{
  manager = (id *)self->_manager;
  if (manager)
  {
    sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
    id v4 = objc_msgSend(objc_msgSend(*manager, "vendor"), "proxyForService:", @"CLClientManager");
    if (v7 >= 0) {
      unint64_t v5 = __p;
    }
    else {
      unint64_t v5 = (void **)__p[0];
    }
    objc_msgSend( v4,  "wakeUpLaunchdManagedClient:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

@end