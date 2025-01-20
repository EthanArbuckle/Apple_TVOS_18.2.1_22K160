@interface CLSuggestedActionManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLSuggestedActionManager)init;
- (void)beginService;
- (void)dealloc;
- (void)endService;
@end

@implementation CLSuggestedActionManager

+ (BOOL)isSupported
{
  if (qword_101998A30 != -1) {
    dispatch_once(&qword_101998A30, &stru_10184F918);
  }
  return byte_101998A28;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101998A40 != -1) {
    dispatch_once(&qword_101998A40, &stru_10184F938);
  }
  return (id)qword_101998A38;
}

- (CLSuggestedActionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSuggestedActionManager;
  return -[CLSuggestedActionManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSuggestedActionServiceProtocol,  &OBJC_PROTOCOL___CLSuggestedActionClientProtocol);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLSuggestedActionManager;
  -[CLSuggestedActionManager dealloc](&v2, "dealloc");
}

- (void)beginService
{
}

- (void)endService
{
}

@end