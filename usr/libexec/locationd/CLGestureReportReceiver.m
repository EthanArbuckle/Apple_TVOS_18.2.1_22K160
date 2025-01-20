@interface CLGestureReportReceiver
+ (BOOL)isSupported;
- (CLGestureReportReceiver)init;
- (id).cxx_construct;
- (void)onWakeGesture:(const Sample *)a3;
- (void)setDelegate:(CLGestureReportReceiverDelegate *)a3;
@end

@implementation CLGestureReportReceiver

- (void)setDelegate:(CLGestureReportReceiverDelegate *)a3
{
  self->_delegate = a3;
}

+ (BOOL)isSupported
{
  if (qword_10199EF00 != -1) {
    dispatch_once(&qword_10199EF00, &stru_10188AA00);
  }
  return byte_10199EEF8;
}

- (CLGestureReportReceiver)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLGestureReportReceiver;
  id v2 = -[CLGestureReportReceiver init](&v7, "init");
  if (v2 && +[CLGestureReportReceiver isSupported](&OBJC_CLASS___CLGestureReportReceiver, "isSupported"))
  {
    v3 = operator new(0x20uLL);
    void *v3 = off_1018A2210;
    void *v3 = &off_10185F668;
    v3[1] = 0LL;
    v3[2] = sub_100ECEF88;
    v3[3] = v2;
    uint64_t v4 = *((void *)v2 + 1);
    *((void *)v2 + 1) = v3;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
    }
    uint64_t v5 = sub_100C87D2C();
    sub_1006DCB40(v5, 0, *((void *)v2 + 1), -1.0);
  }

  return (CLGestureReportReceiver *)v2;
}

- (void)onWakeGesture:(const Sample *)a3
{
  uint64_t v4 = *(_OWORD **)&a3->var1.var0;
  __int128 v5 = *(_OWORD *)((char *)v4 + 12);
  *(_OWORD *)v17 = *v4;
  *(_OWORD *)&v17[12] = v5;
  *(void *)v16 = 0LL;
  *(void *)&v16[8] = 0LL;
  v15 = &off_10185EA80;
  *(_DWORD *)&v16[15] = 0;
  sub_100E5A608(v17, &v15);
  if (!v16[16])
  {
    sub_1004F2598();
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188AA20);
    }
    objc_super v7 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CLGestureReportReceiver] failed to visit WakeGesture",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_18;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188AA20);
    }
    v14[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  16LL,  "[CLGestureReportReceiver] failed to visit WakeGesture",  v14,  2);
    v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLGestureReportReceiver onWakeGesture:]", "%s\n", v8);
LABEL_22:
    if (v9 != buf) {
      free(v9);
    }
    goto LABEL_18;
  }

  delegate = self->_delegate;
  if (delegate)
  {
    uint64_t v13 = *(void *)&v16[16];
    __int128 v12 = *(_OWORD *)v16;
    (*((void (**)(CLGestureReportReceiverDelegate *, __int128 *))delegate->var0 + 2))(delegate, &v12);
    goto LABEL_18;
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10188AA20);
  }
  v10 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[CLGestureReportReceiver] No delegate set",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188AA20);
    }
    v14[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  16LL,  "[CLGestureReportReceiver] No delegate set",  v14,  2);
    v9 = (uint8_t *)v11;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLGestureReportReceiver onWakeGesture:]", "%s\n", v11);
    goto LABEL_22;
  }

- (void).cxx_destruct
{
  value = self->_wakeGestureNotificationVisitor.__ptr_.__value_;
  self->_wakeGestureNotificationVisitor.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CMWakeGestureNotificationVisitor *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  uint64_t v4 = self->_wakeDispatcher.__ptr_.__value_;
  self->_wakeDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(void *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end