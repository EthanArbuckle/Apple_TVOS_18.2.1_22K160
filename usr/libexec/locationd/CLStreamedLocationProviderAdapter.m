@interface CLStreamedLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLStreamedLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)pairedDeviceIsNearby:(BOOL)a3;
- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4;
- (void)releaseDisablementAssertion;
- (void)releaseEmergencyEnablementAssertion;
- (void)takeDisablementAssertion;
- (void)takeEmergencyEnablementAssertion;
@end

@implementation CLStreamedLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993D70 != -1) {
    dispatch_once(&qword_101993D70, &stru_10182BF00);
  }
  return (id)qword_101993D68;
}

- (CLStreamedLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStreamedLocationProviderAdapter;
  return -[CLStreamedLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLStreamedLocationProviderProtocol,  &OBJC_PROTOCOL___CLStreamedLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_1012313BC();
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
  if (qword_101993D80 != -1) {
    dispatch_once(&qword_101993D80, &stru_10182BF20);
  }
  return byte_101993D78;
}

- (void)takeDisablementAssertion
{
}

- (void)releaseDisablementAssertion
{
}

- (void)takeEmergencyEnablementAssertion
{
}

- (void)releaseEmergencyEnablementAssertion
{
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = -[CLStreamedLocationProviderAdapter adaptee](self, "adaptee");
  if (v3)
  {
    int v6 = 9;
    (*(void (**)(void *, int *))(*(void *)v4 + 120LL))(v4, &v6);
  }

  else
  {
    int v5 = 9;
    (*(void (**)(void *, int *, uint64_t, uint64_t))(*(void *)v4 + 144LL))(v4, &v5, 1LL, 0xFFFFFFFFLL);
  }

@end