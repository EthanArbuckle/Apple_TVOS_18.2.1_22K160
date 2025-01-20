@interface CLAccessoryLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLAccessoryLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchAccessoryBitSetWithReply:(id)a3;
- (void)fetchAccessoryPASCDTransmissionStateWithReply:(id)a3;
- (void)fetchIsAccessoryConnectedWithReply:(id)a3;
- (void)syncSetNavigationStateChange:(int)a3;
@end

@implementation CLAccessoryLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019960E0 != -1) {
    dispatch_once(&qword_1019960E0, &stru_10183C890);
  }
  return (id)qword_1019960D8;
}

- (CLAccessoryLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAccessoryLocationProviderAdapter;
  return -[CLAccessoryLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAccessoryLocationProviderProtocol,  &OBJC_PROTOCOL___CLAccessoryLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10123BD5C();
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

- (void)fetchIsAccessoryConnectedWithReply:(id)a3
{
}

- (void)fetchAccessoryBitSetWithReply:(id)a3
{
  uint64_t v4 = sub_1004D44C4((uint64_t)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"), 1);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)fetchAccessoryPASCDTransmissionStateWithReply:(id)a3
{
  HIDWORD(v5) = *((_DWORD *)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee") + 248);
  LODWORD(v5) = HIDWORD(v5) - 68;
  unsigned int v4 = v5 >> 1;
  if (v4 > 7) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = dword_1012EE718[v4];
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)syncSetNavigationStateChange:(int)a3
{
  if (-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee")) {
    sub_1004D4704((uint64_t)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"), a3);
  }
}

+ (BOOL)isSupported
{
  if (qword_1019960F0 != -1) {
    dispatch_once(&qword_1019960F0, &stru_10183C8B0);
  }
  return byte_1019960E8;
}

@end