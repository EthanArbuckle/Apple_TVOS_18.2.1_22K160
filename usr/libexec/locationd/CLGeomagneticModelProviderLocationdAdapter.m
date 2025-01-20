@interface CLGeomagneticModelProviderLocationdAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLGeomagneticModelProviderLocationdAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchGeomagneticModelData:(id)a3;
@end

@implementation CLGeomagneticModelProviderLocationdAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999F20 != -1) {
    dispatch_once(&qword_101999F20, &stru_101867388);
  }
  return (id)qword_101999F18;
}

- (CLGeomagneticModelProviderLocationdAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLGeomagneticModelProviderLocationdAdapter;
  return -[CLGeomagneticModelProviderLocationdAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLGeomagneticModelProviderProtocol,  &OBJC_PROTOCOL___CLGeomagneticModelProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_1012593EC();
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

- (void)fetchGeomagneticModelData:(id)a3
{
  (*(void (**)(void *__return_ptr))(*(void *)-[CLGeomagneticModelProviderLocationdAdapter adaptee]( self,  "adaptee")
                                               + 208LL))(v4);
  (*((void (**)(id, void *))a3 + 2))(a3, v4);
}

@end