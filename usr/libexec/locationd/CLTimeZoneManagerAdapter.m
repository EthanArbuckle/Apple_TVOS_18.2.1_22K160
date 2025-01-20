@interface CLTimeZoneManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLTimeZoneManagerAdapter)init;
- (void)beginService;
- (void)endService;
- (void)manager;
- (void)setManager:(void *)a3;
@end

@implementation CLTimeZoneManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019979A8 != -1) {
    dispatch_once(&qword_1019979A8, &stru_101847A40);
  }
  return (id)qword_1019979A0;
}

- (CLTimeZoneManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTimeZoneManagerAdapter;
  return -[CLTimeZoneManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTimeZoneManagerProtocol,  &OBJC_PROTOCOL___CLTimeZoneManagerClientProtocol);
}

- (void)beginService
{
  objc_super v3 = operator new(0x430uLL);
  sub_10064CC3C((uint64_t)v3, -[CLTimeZoneManagerAdapter universe](self, "universe"));
  self->_manager = v3;
}

- (void)endService
{
}

+ (BOOL)isSupported
{
  if (qword_1019979B0 != -1) {
    dispatch_once(&qword_1019979B0, &stru_101847A60);
  }
  return qword_1019979B8 != 0;
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

@end