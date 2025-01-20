@interface CLAudioAccessoryStatsSubscriptionClient
- (BOOL)valid;
- (CLAudioAccessoryStatsSubscriptionClient)initWithSubscription:(CLAudioAccessoryStatsSubscription *)a3;
- (void)invalidate;
- (void)onUsageMetricsEvent:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLAudioAccessoryStatsSubscriptionClient

- (CLAudioAccessoryStatsSubscriptionClient)initWithSubscription:(CLAudioAccessoryStatsSubscription *)a3
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10184B350);
  }
  v5 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_INFO))
  {
    (*((void (**)(void **__return_ptr, CLAudioAccessoryStatsSubscription *))a3->var0 + 3))(__p, a3);
    v6 = v18 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[HeadphoneUsage] SubscriptionClient - initWithSubscription (%s)",  buf,  0xCu);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10184B350);
    }
    uint64_t v8 = qword_1019345C8;
    (*((void (**)(_BYTE *__return_ptr, CLAudioAccessoryStatsSubscription *))a3->var0 + 3))(buf, a3);
    if (v14 >= 0) {
      v9 = buf;
    }
    else {
      v9 = *(_BYTE **)buf;
    }
    int v15 = 136315138;
    v16 = v9;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v8,  1LL,  "[HeadphoneUsage] SubscriptionClient - initWithSubscription (%s)",  (const char *)&v15);
    v11 = v10;
    if (v14 < 0) {
      operator delete(*(void **)buf);
    }
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAudioAccessoryStatsSubscriptionClient initWithSubscription:]",  "%s\n",  v11);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLAudioAccessoryStatsSubscriptionClient;
  result = -[CLAudioAccessoryStatsSubscriptionClient init](&v12, "init");
  if (result) {
    result->_subscription = a3;
  }
  result->_valid = 1;
  return result;
}

- (void)onUsageMetricsEvent:(id)a3
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10184B350);
  }
  v5 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_INFO))
  {
    (*((void (**)(void **__return_ptr))self->_subscription->var0 + 3))(__p);
    v6 = v20 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[HeadphoneUsage] SubscriptionClient - onUsageMetricsEvent (%s)",  buf,  0xCu);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10184B350);
    }
    uint64_t v9 = qword_1019345C8;
    (*((void (**)(_BYTE *__return_ptr))self->_subscription->var0 + 3))(buf);
    if (v16 >= 0) {
      v10 = buf;
    }
    else {
      v10 = *(_BYTE **)buf;
    }
    int v17 = 136315138;
    char v18 = v10;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v9,  1LL,  "[HeadphoneUsage] SubscriptionClient - onUsageMetricsEvent (%s)",  (const char *)&v17);
    objc_super v12 = v11;
    if (v16 < 0) {
      operator delete(*(void **)buf);
    }
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAudioAccessoryStatsSubscriptionClient onUsageMetricsEvent:]",  "%s\n",  v12);
  }

  if (a3)
  {
    subscription = self->_subscription;
    if (subscription) {
      sub_1006E741C((uint64_t)subscription, a3);
    }
  }

  else
  {
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10184B350);
    }
    uint64_t v8 = (os_log_s *)qword_1019345C8;
    if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[HeadphoneUsage] Service Client: Nil data received",  (uint8_t *)__p,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1019345C0 != -1) {
        dispatch_once(&qword_1019345C0, &stru_10184B350);
      }
      *(_WORD *)buf = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019345C8,  16LL,  "[HeadphoneUsage] Service Client: Nil data received",  buf,  2);
      char v14 = (void **)v13;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLAudioAccessoryStatsSubscriptionClient onUsageMetricsEvent:]",  "%s\n",  v13);
      if (v14 != __p) {
        free(v14);
      }
    }
  }

- (void)invalidate
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10184B350);
  }
  v3 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    (*((void (**)(void **__return_ptr))self->_subscription->var0 + 3))(__p);
    v4 = v14 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] SubscriptionClient - invalidate (%s)",  buf,  0xCu);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10184B350);
    }
    uint64_t v5 = qword_1019345C8;
    (*((void (**)(_BYTE *__return_ptr))self->_subscription->var0 + 3))(buf);
    if (v10 >= 0) {
      v6 = buf;
    }
    else {
      v6 = *(_BYTE **)buf;
    }
    int v11 = 136315138;
    objc_super v12 = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v5,  0LL,  "[HeadphoneUsage] SubscriptionClient - invalidate (%s)",  (const char *)&v11);
    uint64_t v8 = v7;
    if (v10 < 0) {
      operator delete(*(void **)buf);
    }
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryStatsSubscriptionClient invalidate]", "%s\n", v8);
  }

  self->_valid = 0;
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