@interface CLSpringTrackingNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsTracking;
- (CLSpringTrackingNotifierAdapter)init;
- (int)syncgetStartTracking;
- (int)syncgetStopTracking;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)querySinceRecord:(CLSpringTrackerEntry *)a3 withReply:(id)a4;
@end

@implementation CLSpringTrackingNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199EEC8 != -1) {
    dispatch_once(&qword_10199EEC8, &stru_101889DF0);
  }
  return (id)qword_10199EEC0;
}

- (CLSpringTrackingNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSpringTrackingNotifierAdapter;
  return -[CLSpringTrackingNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSpringTrackingNotifierProtocol,  &OBJC_PROTOCOL___CLSpringTrackingNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101275320();
    sub_100E95D8C(v3);
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

- (BOOL)syncgetIsTracking
{
  return *((void *)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee") + 26) != 0LL;
}

- (int)syncgetStartTracking
{
  return sub_100E95F20((uint64_t)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"));
}

- (int)syncgetStopTracking
{
  return 100;
}

- (void)querySinceRecord:(CLSpringTrackerEntry *)a3 withReply:(id)a4
{
  if (!a4)
  {
    sub_101275494(self, a2, a3);
    __break(1u);
  }

  sub_100E96480((uint64_t)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3, (uint64_t)&__p);
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0x6DB6DB6DB6DB6DB7LL * ((v13 - (_BYTE *)__p) >> 3));
  v6 = __p;
  v7 = v13;
  if (__p != v13)
  {
    do
    {
      __int128 v8 = *v6;
      __int128 v9 = v6[1];
      __int128 v10 = v6[2];
      uint64_t v15 = *((void *)v6 + 6);
      v14[1] = v9;
      v14[2] = v10;
      v14[0] = v8;
      id v11 = [[CMSleepData alloc] initWithSpringEntry:v14];
      -[NSMutableArray addObject:](v5, "addObject:", v11);

      v6 = (_OWORD *)((char *)v6 + 56);
    }

    while (v6 != (_OWORD *)v7);
  }

  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

+ (BOOL)isSupported
{
  if (qword_10199EED8 != -1) {
    dispatch_once(&qword_10199EED8, &stru_101889E10);
  }
  return byte_10199EED0;
}

@end