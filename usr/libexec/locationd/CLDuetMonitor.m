@interface CLDuetMonitor
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLDuetMonitor)init;
- (int64_t)eventTypeFromNSNumber:(id)a3;
- (void)beginService;
- (void)dealloc;
- (void)endService;
@end

@implementation CLDuetMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101998928 != -1) {
    dispatch_once(&qword_101998928, &stru_10184EB40);
  }
  return (id)qword_101998920;
}

+ (BOOL)isSupported
{
  if (qword_101998938 != -1) {
    dispatch_once(&qword_101998938, &stru_10184EB60);
  }
  return (byte_101998930 & 1) == 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLDuetMonitor;
  -[CLDuetMonitor dealloc](&v2, "dealloc");
}

- (void)beginService
{
}

- (void)endService
{
}

- (CLDuetMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDuetMonitor;
  return -[CLDuetMonitor initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDuetMonitorServiceProtocol,  &OBJC_PROTOCOL___CLDuetMonitorClientProtocol);
}

- (int64_t)eventTypeFromNSNumber:(id)a3
{
  if (!a3) {
    sub_10124AAC4();
  }
  int64_t result = (int)[a3 intValue];
  return result;
}

@end