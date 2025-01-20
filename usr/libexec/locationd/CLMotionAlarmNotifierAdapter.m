@interface CLMotionAlarmNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionAlarmNotifierAdapter)init;
- (void)acknowledgeAlarm:(id)a3 withReply:(id)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fireEventAlarm:(unsigned int)a3;
- (void)launchRemoteApplication:(id)a3 withReply:(id)a4;
- (void)onCardioChangeEvent;
- (void)onClassATimerActivity:(id)a3 withAlarmId:(unint64_t)a4;
- (void)registerAlarm:(id)a3 withReply:(id)a4;
- (void)registerClient:(id)a3 adapter:(id)a4 systemClient:(BOOL)a5;
- (void)unregisterAlarm:(id)a3 withReply:(id)a4;
- (void)unregisterClient:(id)a3 systemClient:(BOOL)a4;
@end

@implementation CLMotionAlarmNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997CB8 != -1) {
    dispatch_once(&qword_101997CB8, &stru_101849980);
  }
  return (id)qword_101997CB0;
}

- (CLMotionAlarmNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMotionAlarmNotifierAdapter;
  return -[CLMotionAlarmNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMotionAlarmNotifierProtocol,  &OBJC_PROTOCOL___CLMotionAlarmNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101243554();
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
  return ((unint64_t)sub_1004F97F4() >> 1) & 1;
}

- (void)registerClient:(id)a3 adapter:(id)a4 systemClient:(BOOL)a5
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  sub_1006BFBA0((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), (__int128 *)v7, (uint64_t)a4);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
}

- (void)unregisterClient:(id)a3 systemClient:(BOOL)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v5, a3, a2);
  sub_1006C028C((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), (__int128 *)v5);
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
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

- (void)registerAlarm:(id)a3 withReply:(id)a4
{
}

- (void)unregisterAlarm:(id)a3 withReply:(id)a4
{
}

- (void)acknowledgeAlarm:(id)a3 withReply:(id)a4
{
}

- (void)launchRemoteApplication:(id)a3 withReply:(id)a4
{
}

- (void)onClassATimerActivity:(id)a3 withAlarmId:(unint64_t)a4
{
}

- (void)onCardioChangeEvent
{
}

- (void)fireEventAlarm:(unsigned int)a3
{
}

@end