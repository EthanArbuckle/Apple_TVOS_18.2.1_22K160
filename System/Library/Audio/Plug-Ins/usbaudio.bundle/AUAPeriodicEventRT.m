@interface AUAPeriodicEventRT
- (void)dealloc;
- (void)start:(unint64_t)a3 maxPeriodMach:(unint64_t)a4 eventHandler:(id)a5;
- (void)stop;
@end

@implementation AUAPeriodicEventRT

- (void)start:(unint64_t)a3 maxPeriodMach:(unint64_t)a4 eventHandler:(id)a5
{
  id v9 = a5;
  -[AUAPeriodicEventRT stop](self, "stop");
  v8 = (char *)operator new(0xE0uLL);
  AUAPeriodicEventRTImpl::AUAPeriodicEventRTImpl(v8, @"AUAPeriodicEventRT", a3, a4, v9);
  self->_impl = (AUAPeriodicEventRTImpl *)v8;
  pthread_mutex_lock((pthread_mutex_t *)(v8 + 40));
  *((_DWORD *)v8 + 2) = 2;
  pthread_cond_signal((pthread_cond_t *)(v8 + 112));
  pthread_mutex_unlock((pthread_mutex_t *)(v8 + 40));
}

- (void)stop
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&impl->var5);
    impl->var1 = 1;
    pthread_cond_signal(&impl->var7);
    pthread_mutex_unlock(&impl->var5);
    v4 = self->_impl;
    if (v4) {
      (*((void (**)(AUAPeriodicEventRTImpl *))v4->var0 + 1))(v4);
    }
    self->_impl = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AUAPeriodicEventRT;
  -[AUAPeriodicEventRT dealloc](&v3, "dealloc");
}

@end