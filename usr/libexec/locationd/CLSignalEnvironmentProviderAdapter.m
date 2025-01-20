@interface CLSignalEnvironmentProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSignalEnvironmentProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchCoarseSignalEnvironmentForLatitude:(double)a3 longitude:(double)a4 withReply:(id)a5;
@end

@implementation CLSignalEnvironmentProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999F30 != -1) {
    dispatch_once(&qword_101999F30, &stru_101867708);
  }
  return (id)qword_101999F28;
}

- (CLSignalEnvironmentProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSignalEnvironmentProviderAdapter;
  return -[CLSignalEnvironmentProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSignalEnvironmentProviderProtocol,  &OBJC_PROTOCOL___CLSignalEnvironmentProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101259574();
  }
}

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchCoarseSignalEnvironmentForLatitude:(double)a3 longitude:(double)a4 withReply:(id)a5
{
  uint64_t v6 = sub_100A18D78((uint64_t)-[CLSignalEnvironmentProviderAdapter adaptee](self, "adaptee"), a3, a4);
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v6);
}

+ (BOOL)isSupported
{
  if (qword_101999F38 != -1) {
    dispatch_once(&qword_101999F38, &stru_101867728);
  }
  return 1;
}

@end