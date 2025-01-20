@interface CLBeaconFenceAuthorizationManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAddFence:(const void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4;
- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4 onBehalfOf:(id)a5;
- (BOOL)syncgetRemoveFence:(const void *)a3;
- (CLBeaconFenceAuthorizationManagerAdapter)init;
- (int)syncgetCanBundle:(id)a3 performFenceOperationFor:(id)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchAllFencesCountWithReply:(id)a3;
@end

@implementation CLBeaconFenceAuthorizationManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F3E8 != -1) {
    dispatch_once(&qword_10199F3E8, &stru_10188C000);
  }
  return (id)qword_10199F3E0;
}

- (CLBeaconFenceAuthorizationManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBeaconFenceAuthorizationManagerAdapter;
  return -[CLBeaconFenceAuthorizationManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBeaconFenceAuthorizationManagerProtocol,  &OBJC_PROTOCOL___CLBeaconFenceAuthorizationManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10127814C();
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

- (BOOL)syncgetAddFence:(const void *)a3
{
  return sub_100EFCC1C(-[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (BOOL)syncgetRemoveFence:(const void *)a3
{
  return sub_100EFD66C((uint64_t)-[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)fetchAllFencesCountWithReply:(id)a3
{
  uint64_t v4 = sub_100EFDBAC((uint64_t)-[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4
{
  v6 = -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100EF9838((uint64_t)v6 + 128, (std::string::size_type)__p, (uint64_t *)a3);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4 onBehalfOf:(id)a5
{
  v8 = -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&v11, (char *)[a4 UTF8String]);
  sub_1010DDBC0(&__p, (char *)[a5 UTF8String]);
  sub_100EFADF4((uint64_t)v8 + 128, &v11, &__p, (uint64_t *)a3);
  return 1;
}

- (int)syncgetCanBundle:(id)a3 performFenceOperationFor:(id)a4
{
  v6 = -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v11, (char *)[a3 UTF8String]);
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  int v7 = sub_100EFDEF0((uint64_t)v6, (uint64_t)v11, (uint64_t)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  return v7;
}

@end