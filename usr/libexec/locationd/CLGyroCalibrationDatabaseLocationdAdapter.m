@interface CLGyroCalibrationDatabaseLocationdAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetBiasFit:(id *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetGyroStatsWithBias:(id *)a3 slope:(id *)a4 l2Error:(id *)a5 isDynamic:(BOOL)a6 deltaBias:(id *)a7 deltaSlope:(id *)a8 deltaError:(id *)a9 isDeltaDynamic:(BOOL)a10;
- (BOOL)syncgetInsertWithBias:(id *)a3 variance:(id *)a4 temperature:(float)a5 timestamp:(double)a6;
- (BOOL)syncgetSupportsMiniCalibration;
- (BOOL)syncgetWipeDatabase;
- (CLGyroCalibrationDatabaseLocationdAdapter)init;
- (double)syncgetLastMiniCalibration;
- (int)syncgetMaxDynamicTemperature;
- (int)syncgetNonFactoryRoundCount;
- (int)syncgetNumTemperatures;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)dumpDatabase:(id)a3 onCompletion:(id)a4;
- (void)endService;
- (void)getBiasFitWithReply:(id)a3;
- (void)startFactoryGYTT;
@end

@implementation CLGyroCalibrationDatabaseLocationdAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995568 != -1) {
    dispatch_once(&qword_101995568, &stru_101834F28);
  }
  return (id)qword_101995560;
}

- (CLGyroCalibrationDatabaseLocationdAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLGyroCalibrationDatabaseLocationdAdapter;
  return -[CLGyroCalibrationDatabaseLocationdAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLGyroCalibrationDatabaseProtocol,  &OBJC_PROTOCOL___CLGyroCalibrationDatabaseClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10123693C();
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
  if (qword_101995578 != -1) {
    dispatch_once(&qword_101995578, &stru_101834F48);
  }
  return byte_101995570;
}

- (BOOL)syncgetGyroStatsWithBias:(id *)a3 slope:(id *)a4 l2Error:(id *)a5 isDynamic:(BOOL)a6 deltaBias:(id *)a7 deltaSlope:(id *)a8 deltaError:(id *)a9 isDeltaDynamic:(BOOL)a10
{
  BOOL v12 = a6;
  v17 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  int v18 = (*(uint64_t (**)(void *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, BOOL))(*(void *)v17 + 256LL))( v17,  a3,  a4,  a5,  v12);
  if (v18)
  {
    v19 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
    LOBYTE(v18) = (*(uint64_t (**)(void *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, BOOL))(*(void *)v19 + 256LL))( v19,  a7,  a8,  a9,  a10);
  }

  return v18;
}

- (int)syncgetMaxDynamicTemperature
{
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 264LL))(v2);
}

- (void)startFactoryGYTT
{
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(void *)v2 + 248LL))(v2);
}

- (BOOL)syncgetBiasFit:(id *)a3
{
  v4 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, $675B7E1F406F4C535649C7F92387E9B4 *))(*(void *)v4 + 216LL))(v4, a3);
}

- (void)getBiasFitWithReply:(id)a3
{
  v4 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  uint64_t v5 = (*(uint64_t (**)(void *, _OWORD *))(*(void *)v4 + 216LL))(v4, __src);
  memcpy(v6, __src, sizeof(v6));
  (*((void (**)(id, uint64_t, _BYTE *))a3 + 2))(a3, v5, v6);
}

- (int)syncgetNonFactoryRoundCount
{
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 296LL))(v2);
}

- (BOOL)syncgetSupportsMiniCalibration
{
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 272LL))(v2);
}

- (double)syncgetLastMiniCalibration
{
  double v4 = 0.0;
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, double *))(*(void *)v2 + 288LL))(v2, &v4);
  return v4;
}

- (BOOL)syncgetInsertWithBias:(id *)a3 variance:(id *)a4 temperature:(float)a5 timestamp:(double)a6
{
  v10 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, const $E2C29196C7A5C696474C6955C5A9CE06 *, const $E2C29196C7A5C696474C6955C5A9CE06 *, float, double))(*(void *)v10 + 208LL))( v10,  a3,  a4,  a5,  a6);
}

- (void)dumpDatabase:(id)a3 onCompletion:(id)a4
{
  v6 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  uint64_t v7 = (*(uint64_t (**)(void *, id))(*(void *)v6 + 224LL))(v6, a3);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v7);
}

- (BOOL)syncgetWipeDatabase
{
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 232LL))(v2);
}

- (int)syncgetNumTemperatures
{
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 240LL))(v2);
}

@end