@interface CLSkiNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSkiNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)queryUsingRecord:(CLSkiEntry *)a3 withReply:(id)a4;
@end

@implementation CLSkiNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A5D8 != -1) {
    dispatch_once(&qword_10199A5D8, &stru_10186C090);
  }
  return (id)qword_10199A5D0;
}

- (CLSkiNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSkiNotifierAdapter;
  return -[CLSkiNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSkiNotifierProtocol,  &OBJC_PROTOCOL___CLSkiNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10125AEC0();
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

- (void)queryUsingRecord:(CLSkiEntry *)a3 withReply:(id)a4
{
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0xAAAAAAAAAAAAAAABLL * ((v10 - (_BYTE *)__p) >> 5));
  v6 = (char *)__p;
  v7 = v10;
  if (__p != v10)
  {
    do
    {
      id v8 = [[CMSkiData alloc] initWithSkiEntry:v6];
      -[NSMutableArray addObject:](v5, "addObject:", v8);

      v6 += 96;
    }

    while (v6 != v7);
  }

  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v10 = (char *)__p;
    operator delete(__p);
  }

+ (BOOL)isSupported
{
  if (qword_10199A5E8 != -1) {
    dispatch_once(&qword_10199A5E8, &stru_10186C0B0);
  }
  return byte_10199A5E0;
}

@end