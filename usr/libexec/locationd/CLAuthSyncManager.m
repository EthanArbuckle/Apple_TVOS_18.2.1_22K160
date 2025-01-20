@interface CLAuthSyncManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAuthSyncManager)init;
@end

@implementation CLAuthSyncManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101998078 != -1) {
    dispatch_once(&qword_101998078, &stru_10184AB30);
  }
  return (id)qword_101998070;
}

+ (BOOL)isSupported
{
  if (qword_101998088 != -1) {
    dispatch_once(&qword_101998088, &stru_10184AB50);
  }
  return byte_101998080;
}

- (CLAuthSyncManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAuthSyncManager;
  return -[CLAuthSyncManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAuthSyncManagerProtocol,  &OBJC_PROTOCOL___CLAuthSyncManagerClientProtocol);
}

@end