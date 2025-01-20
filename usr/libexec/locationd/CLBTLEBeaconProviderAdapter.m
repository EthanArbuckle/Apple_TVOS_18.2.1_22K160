@interface CLBTLEBeaconProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAddProximityZone:(const void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetRemoveProximityZone:(const void *)a3;
- (BOOL)syncgetadvertiseSelfAsBeaconForRegion:(id)a3 power:(int)a4;
- (CLBTLEBeaconProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)startScan;
- (void)stopScan;
@end

@implementation CLBTLEBeaconProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F3A8 != -1) {
    dispatch_once(&qword_10199F3A8, &stru_10188B4F0);
  }
  return (id)qword_10199F3A0;
}

- (CLBTLEBeaconProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBTLEBeaconProviderAdapter;
  return -[CLBTLEBeaconProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBTLEBeaconProviderProtocol,  &OBJC_PROTOCOL___CLBTLEBeaconProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101277ABC();
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

- (void)startScan
{
  v2 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(void *)v2 + 240LL))(v2);
}

- (void)stopScan
{
  v2 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(void *)v2 + 248LL))(v2);
}

- (BOOL)syncgetAddProximityZone:(const void *)a3
{
  v4 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, const void *))(*(void *)v4 + 208LL))(v4, a3);
}

- (BOOL)syncgetRemoveProximityZone:(const void *)a3
{
  v4 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, const void *))(*(void *)v4 + 216LL))(v4, a3);
}

- (BOOL)syncgetadvertiseSelfAsBeaconForRegion:(id)a3 power:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, id, uint64_t))(*(void *)v6 + 256LL))(v6, a3, v4);
}

@end