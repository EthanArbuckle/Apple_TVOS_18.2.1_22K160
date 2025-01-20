@interface CLSensorMonitor
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLSensorMonitor)init;
- (Class)classForSensorIdentifier:(id)a3;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
@end

@implementation CLSensorMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101996908 != -1) {
    dispatch_once(&qword_101996908, &stru_10183E610);
  }
  return (id)qword_101996900;
}

+ (BOOL)isSupported
{
  return 0;
}

- (CLSensorMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSensorMonitor;
  return -[CLSensorMonitor initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSensorMonitorProtocol,  &OBJC_PROTOCOL___CLSensorMonitorClientProtocol);
}

- (void)beginService
{
}

- (void)endService
{
}

- (Class)classForSensorIdentifier:(id)a3
{
  return 0LL;
}

- (void).cxx_destruct
{
  value = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  unint64_t v5 = self->_heartRateClient.__ptr_.__value_;
  self->_heartRateClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  v6 = self->_odometerClient.__ptr_.__value_;
  self->_odometerClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8LL))(v6, a2);
  }
  v7 = self->_fallClient.__ptr_.__value_;
  self->_fallClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8LL))(v7, a2);
  }
  v8 = self->_stepCountClient.__ptr_.__value_;
  self->_stepCountClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 30) = 0LL;
  return self;
}

@end