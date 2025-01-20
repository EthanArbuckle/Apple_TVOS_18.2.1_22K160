@interface CLStatusBarIconManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetStatusBarIconForEntityClass:(int)a3;
- (CLStatusBarIconManagerAdapter)init;
- (int)syncgetIconState;
- (void)adaptee;
- (void)beginService;
- (void)endService;
- (void)entityClass:(unsigned int)a3 didChangeArrowState:(unint64_t)a4 dueToDeauthorization:(BOOL)a5;
- (void)setE911Active:(BOOL)a3;
- (void)setStatusBarIconForEntityClass:(int)a3 visible:(BOOL)a4;
@end

@implementation CLStatusBarIconManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A7C0 != -1) {
    dispatch_once(&qword_10199A7C0, &stru_10186E430);
  }
  return (id)qword_10199A7B8;
}

- (CLStatusBarIconManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStatusBarIconManagerAdapter;
  return -[CLStatusBarIconManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLStatusBarIconManagerProtocol,  &OBJC_PROTOCOL___CLStatusBarIconManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10125DD04();
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

+ (BOOL)isSupported
{
  return 1;
}

- (int)syncgetIconState
{
  return sub_100AD9F3C((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetStatusBarIconForEntityClass:(int)a3
{
  return sub_100ADA220((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"), a3);
}

- (void)setStatusBarIconForEntityClass:(int)a3 visible:(BOOL)a4
{
}

- (void)setE911Active:(BOOL)a3
{
}

- (void)entityClass:(unsigned int)a3 didChangeArrowState:(unint64_t)a4 dueToDeauthorization:(BOOL)a5
{
}

@end