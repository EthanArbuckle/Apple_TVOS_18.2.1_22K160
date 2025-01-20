@interface CLDistributedSensingService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLDistributedSensingService)init;
- (void)dealloc;
@end

@implementation CLDistributedSensingService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993F50 != -1) {
    dispatch_once(&qword_101993F50, &stru_10182DE28);
  }
  return (id)qword_101993F48;
}

+ (BOOL)isSupported
{
  return 0;
}

- (CLDistributedSensingService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDistributedSensingService;
  return -[CLDistributedSensingService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDistributedSensingServiceProtocol,  &OBJC_PROTOCOL___CLDistributedSensingServiceClientProtocol);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLDistributedSensingService;
  -[CLDistributedSensingService dealloc](&v2, "dealloc");
}

@end