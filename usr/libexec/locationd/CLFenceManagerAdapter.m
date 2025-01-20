@interface CLFenceManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetFences:(void *)a3 forKey:(id)a4;
- (BOOL)syncgetHasMonitoredFences:(id)a3;
- (CLFenceManagerAdapter)init;
- (void)adaptee;
- (void)addFence:(id)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getFencesForBundleID:(id)a3 withReply:(id)a4;
- (void)removeFence:(id)a3;
- (void)requestRegionState:(id)a3;
- (void)setIsSimulatingLocation:(BOOL)a3;
- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6;
@end

@implementation CLFenceManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997A20 != -1) {
    dispatch_once(&qword_101997A20, &stru_101847B10);
  }
  return (id)qword_101997A18;
}

- (CLFenceManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFenceManagerAdapter;
  return -[CLFenceManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLFenceManagerProtocol,  &OBJC_PROTOCOL___CLFenceManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101241BEC();
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

- (void)addFence:(id)a3
{
  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_100658864(v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)removeFence:(id)a3
{
  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_10065A50C((uint64_t)v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)requestRegionState:(id)a3
{
  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_10065A824((uint64_t)v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (BOOL)syncgetHasMonitoredFences:(id)a3
{
  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  char v5 = sub_1009E83E4((uint64_t)v4 + 112, (char *)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

- (BOOL)syncgetFences:(void *)a3 forKey:(id)a4
{
  char v6 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_1009E74BC((uint64_t)v6 + 112, (char *)__p, (uint64_t *)a3);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
  if (a5 == 1) {
    int v9 = 1;
  }
  else {
    int v9 = -1;
  }
  if (a5) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  v11 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v25, (char *)[a3 UTF8String]);
  sub_1010DDBC0(v23, (char *)[a4 UTF8String]);
  if (a6)
  {
    [a6 clientLocation];
  }

  else
  {
    __int128 v19 = 0u;
    memset(v20, 0, 28);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v12 = 0u;
  }

  v21[6] = v18;
  v21[7] = v19;
  v22[0] = v20[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v20 + 12);
  v21[2] = v14;
  v21[3] = v15;
  v21[4] = v16;
  v21[5] = v17;
  v21[0] = v12;
  v21[1] = v13;
  sub_10065B3F8((uint64_t)v11, (char *)v25, v23, v10, v21);
  if (v24 < 0) {
    operator delete((void *)v23[0]);
  }
  if (v26 < 0) {
    operator delete(v25[0]);
  }
}

- (void)setIsSimulatingLocation:(BOOL)a3
{
  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  v4[3786] = a3;
  sub_1009C193C((uint64_t)(v4 + 296), a3);
}

- (void)getFencesForBundleID:(id)a3 withReply:(id)a4
{
  char v6 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  sub_10065B89C((uint64_t)v6, (char *)__p, (uint64_t)a4);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

+ (BOOL)isSupported
{
  return 0;
}

@end