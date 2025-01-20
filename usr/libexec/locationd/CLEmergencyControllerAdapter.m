@interface CLEmergencyControllerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLEmergencyControllerAdapter)init;
- (void)beginService;
- (void)onCLEmergencyEnablementAssertion:(BOOL)a3;
- (void)shouldDisplayEEDUIWithReply:(id)a3;
- (void)startMonitoringEmergencyState:(id)a3;
- (void)stopMonitoringEmergencyState:(id)a3;
@end

@implementation CLEmergencyControllerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199ADA0 != -1) {
    dispatch_once(&qword_10199ADA0, &stru_101877918);
  }
  return (id)qword_10199AD98;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLEmergencyControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLEmergencyControllerAdapter;
  return -[CLEmergencyControllerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLEmergencyControllerProtocol,  &OBJC_PROTOCOL___CLEmergencyClientProtocol);
}

- (void)beginService
{
  qword_1019A1E98 = (uint64_t)sub_100BEFACC((uint64_t)-[CLEmergencyControllerAdapter universe](self, "universe"));
}

- (void)startMonitoringEmergencyState:(id)a3
{
}

- (void)stopMonitoringEmergencyState:(id)a3
{
}

- (void)onCLEmergencyEnablementAssertion:(BOOL)a3
{
}

- (void)shouldDisplayEEDUIWithReply:(id)a3
{
  uint64_t v4 = sub_100F99440(*(void *)(qword_1019A1E98 + 576));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

@end