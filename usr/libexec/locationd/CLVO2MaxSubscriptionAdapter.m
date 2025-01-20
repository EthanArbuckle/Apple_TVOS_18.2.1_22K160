@interface CLVO2MaxSubscriptionAdapter
- (BOOL)valid;
- (CLVO2MaxSubscriptionAdapter)initWithSubscription:(void *)a3;
- (void)invalidate;
- (void)onRetrocomputeStatusUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVO2MaxSubscriptionAdapter

- (CLVO2MaxSubscriptionAdapter)initWithSubscription:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLVO2MaxSubscriptionAdapter;
  v4 = -[CLVO2MaxSubscriptionAdapter init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_subscription = a3;
    -[CLVO2MaxSubscriptionAdapter setValid:](v4, "setValid:", 1LL);
  }

  return v5;
}

- (void)onRetrocomputeStatusUpdate:(id)a3
{
  if (a3)
  {
    sub_100B8EDFC((uint64_t)self->_subscription, (uint64_t)a3);
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101874498);
    }
    v3 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "Attempting to notify nil retrocompute state",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101874498);
      }
      v6[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  17LL,  "Attempting to notify nil retrocompute state",  v6,  2);
      v5 = (uint8_t *)v4;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxSubscriptionAdapter onRetrocomputeStatusUpdate:]", "%s\n", v4);
      if (v5 != buf) {
        free(v5);
      }
    }
  }

- (void)invalidate
{
  self->_subscription = 0LL;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end