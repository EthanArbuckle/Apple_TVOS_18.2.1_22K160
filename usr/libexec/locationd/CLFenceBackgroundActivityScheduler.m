@interface CLFenceBackgroundActivityScheduler
- (CLFenceBackgroundActivityScheduler)init;
- (CLFenceBackgroundActivityScheduler)initWithQueue:(id)a3;
- (id)registeredBlock;
- (void)dealloc;
- (void)registerDailyBlock:(id)a3;
- (void)scheduleBackgroundTask;
- (void)setRegisteredBlock:(id)a3;
@end

@implementation CLFenceBackgroundActivityScheduler

- (CLFenceBackgroundActivityScheduler)init
{
  return 0LL;
}

- (CLFenceBackgroundActivityScheduler)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLFenceBackgroundActivityScheduler;
  v4 = -[CLFenceBackgroundActivityScheduler init](&v6, "init");
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    -[CLFenceBackgroundActivityScheduler scheduleBackgroundTask](v4, "scheduleBackgroundTask");
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFenceBackgroundActivityScheduler;
  -[CLFenceBackgroundActivityScheduler dealloc](&v3, "dealloc");
}

- (void)registerDailyBlock:(id)a3
{
  if (qword_101934870 != -1) {
    dispatch_once(&qword_101934870, &stru_101859A38);
  }
  v5 = (os_log_s *)qword_101934878;
  if (os_log_type_enabled((os_log_t)qword_101934878, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#BackgroundTask registering daily block",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934870 != -1) {
      dispatch_once(&qword_101934870, &stru_101859A38);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934878,  0LL,  "#BackgroundTask registering daily block",  v8,  2);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLFenceBackgroundActivityScheduler registerDailyBlock:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  -[CLFenceBackgroundActivityScheduler setRegisteredBlock:](self, "setRegisteredBlock:", a3);
}

- (void)scheduleBackgroundTask
{
  if (qword_101934870 != -1) {
    dispatch_once(&qword_101934870, &stru_101859A38);
  }
  v2 = (os_log_s *)qword_101934878;
  if (os_log_type_enabled((os_log_t)qword_101934878, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "#BackgroundTask BackgroundSystemTask not available",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934870 != -1) {
      dispatch_once(&qword_101934870, &stru_101859A38);
    }
    v5[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934878,  2LL,  "#BackgroundTask BackgroundSystemTask not available",  v5,  2);
    v4 = (uint8_t *)v3;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLFenceBackgroundActivityScheduler scheduleBackgroundTask]", "%s\n", v3);
    if (v4 != buf) {
      free(v4);
    }
  }

- (id)registeredBlock
{
  return self->_registeredBlock;
}

- (void)setRegisteredBlock:(id)a3
{
}

@end