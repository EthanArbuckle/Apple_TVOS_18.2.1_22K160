@interface CLOdometerNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLOdometerNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)querySignificantElevationDeltaFromDate:(id)a3 toDate:(id)a4 withReply:(id)a5;
- (void)registerForCyclingWorkoutDistanceUpdates:(id)a3;
- (void)unregisterForCyclingWorkoutDistanceUpdates:(id)a3;
- (void)updatePhoneWorkoutElevationSubscription:(BOOL)a3;
@end

@implementation CLOdometerNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993F18 != -1) {
    dispatch_once(&qword_101993F18, &stru_10182D560);
  }
  return (id)qword_101993F10;
}

- (CLOdometerNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLOdometerNotifierAdapter;
  return -[CLOdometerNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLOdometerNotifierProtocol,  &OBJC_PROTOCOL___CLOdometerNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101232408();
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
  if (qword_101993F28 != -1) {
    dispatch_once(&qword_101993F28, &stru_10182D580);
  }
  return byte_101993F20;
}

- (void)querySignificantElevationDeltaFromDate:(id)a3 toDate:(id)a4 withReply:(id)a5
{
  v8 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  [a3 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [a4 timeIntervalSinceReferenceDate];
  sub_10027CA28((uint64_t)v8, (uint64_t)v13, v10, v11);
  if (v14 == -1.0)
  {
    (*((void (**)(id, void, double))a5 + 2))(a5, 0LL, v14);
  }

  else
  {
    id v12 = [[CMSignificantElevationSample alloc] initWithSignificantElevation:v13];
    (*((void (**)(id, id))a5 + 2))(a5, v12);
  }

- (void)updatePhoneWorkoutElevationSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, BOOL))(*(void *)v4 + 208LL))(v4, v3);
}

- (void)registerForCyclingWorkoutDistanceUpdates:(id)a3
{
  v4 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(void *)v4 + 216LL))(v4, a3);
}

- (void)unregisterForCyclingWorkoutDistanceUpdates:(id)a3
{
  v4 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(void *)v4 + 224LL))(v4, a3);
}

@end