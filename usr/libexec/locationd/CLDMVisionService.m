@interface CLDMVisionService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLDMVisionService)init;
- (id).cxx_construct;
@end

@implementation CLDMVisionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999A90 != -1) {
    dispatch_once(&qword_101999A90, &stru_1018651E8);
  }
  return (id)qword_101999A88;
}

+ (BOOL)isSupported
{
  if (qword_101999A98 != -1) {
    dispatch_once(&qword_101999A98, &stru_101865208);
  }
  return 0;
}

- (CLDMVisionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDMVisionService;
  result = -[CLDMVisionService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDMVisionServiceProtocol,  &OBJC_PROTOCOL___CLDMVisionServiceClientProtocol);
  if (result) {
    result->fDeclination = 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
  self->fVisualLocalizationPropagation._vptr$CLVisualLocalizationPropagation = (void **)&off_101865238;
  value = self->fGeomagneticModelProviderClient.__ptr_.__value_;
  self->fGeomagneticModelProviderClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Dispatcher *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
  self->fGeomagneticModelProviderClient.__ptr_.__value_ = 0LL;
  sub_100A8D128((uint64_t)&self->fVisualLocalizationPropagation);
  return self;
}

@end