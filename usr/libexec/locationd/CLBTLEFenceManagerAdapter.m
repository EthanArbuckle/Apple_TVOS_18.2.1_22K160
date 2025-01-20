@interface CLBTLEFenceManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasMonitoredRegions:(id)a3;
- (BOOL)syncgetMonitoredRegions:(void *)a3 forClient:(id)a4;
- (CLBTLEFenceManagerAdapter)init;
- (void)adaptee;
- (void)addMonitoredRegion:(id)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)queryBundleIdentifiersWithEnteredRegionsWithReply:(id)a3;
- (void)removeMonitoredRegion:(id)a3;
- (void)requestRegionState:(id)a3;
- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6;
@end

@implementation CLBTLEFenceManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199EE90 != -1) {
    dispatch_once(&qword_10199EE90, &stru_101889890);
  }
  return (id)qword_10199EE88;
}

- (CLBTLEFenceManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBTLEFenceManagerAdapter;
  return -[CLBTLEFenceManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBTLEFenceManagerProtocol,  &OBJC_PROTOCOL___CLBTLEFenceManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101275154();
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

+ (BOOL)isSupported
{
  if (qword_10199EEA0 != -1) {
    dispatch_once(&qword_10199EEA0, &stru_1018898B0);
  }
  return byte_10199EE98;
}

- (void)queryBundleIdentifiersWithEnteredRegionsWithReply:(id)a3
{
  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(void *)v4 + 256LL))(v4, a3);
}

- (void)addMonitoredRegion:(id)a3
{
  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, void *))(*(void *)v4 + 216LL))(v4, v5);
  sub_1002722AC((uint64_t)v5);
}

- (void)removeMonitoredRegion:(id)a3
{
  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, void *))(*(void *)v4 + 240LL))(v4, v5);
  sub_1002722AC((uint64_t)v5);
}

- (void)requestRegionState:(id)a3
{
  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, void *))(*(void *)v4 + 248LL))(v4, v5);
  sub_1002722AC((uint64_t)v5);
}

- (BOOL)syncgetHasMonitoredRegions:(id)a3
{
  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  char v5 = (*(uint64_t (**)(void *, void **))(*(void *)v4 + 232LL))(v4, __p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

- (BOOL)syncgetMonitoredRegions:(void *)a3 forClient:(id)a4
{
  v6 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  (*(void (**)(void *, void **, void *))(*(void *)v6 + 224LL))(v6, __p, a3);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
  if (a6 == 1) {
    unsigned int v9 = 4;
  }
  else {
    unsigned int v9 = 1;
  }
  if (a6) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 2LL;
  }
  v11 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  (*(void (**)(void *, void **, int64_t, int64_t, uint64_t))(*(void *)v11 + 208LL))( v11,  __p,  a4,  a5,  v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

@end