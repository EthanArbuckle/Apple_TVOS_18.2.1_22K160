@interface ADSiriAnalyticsPhoneCallStateObserver
- (ADSiriAnalyticsPhoneCallStateObserver)initWithDelegate:(id)a3 queue:(id)a4;
- (void)callObserver:(id)a3 callStateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)pollConditionStateWithCompletion:(id)a3;
@end

@implementation ADSiriAnalyticsPhoneCallStateObserver

- (ADSiriAnalyticsPhoneCallStateObserver)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADSiriAnalyticsPhoneCallStateObserver;
  v8 = -[ADSiriAnalyticsPhoneCallStateObserver init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = objc_alloc_init(&OBJC_CLASS___ADCallObserver);
    callObserver = v9->_callObserver;
    v9->_callObserver = v10;

    -[ADCallObserver startObservingCallStateWithDelegate:]( v9->_callObserver,  "startObservingCallStateWithDelegate:",  v9);
  }

  return v9;
}

- (void)callObserver:(id)a3 callStateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5
{
  uint64_t v8 = mach_absolute_time();
  v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADSiriAnalyticsPhoneCallStateObserver callObserver:callStateDidChangeFrom:to:]";
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    __int16 v23 = 2048;
    unint64_t v24 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s fromState: %lu to: %lu", buf, 0x20u);
  }

  BOOL v10 = (a5 & 9) != 0 || (a4 & 9) == 0;
  BOOL v11 = !v10;
  uint64_t v12 = 2LL;
  if (!v11) {
    uint64_t v12 = 0LL;
  }
  if ((a4 & 9) == 0 && (a5 & 9) != 0) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 == 2)
  {
    v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADSiriAnalyticsPhoneCallStateObserver callObserver:callStateDidChangeFrom:to:]";
      __int16 v21 = 2048;
      unint64_t v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Triggering endedAt: %llu", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sensitiveCondition:2 endedAt:v8];
    goto LABEL_19;
  }

  if (v13 == 1)
  {
    v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADSiriAnalyticsPhoneCallStateObserver callObserver:callStateDidChangeFrom:to:]";
      __int16 v21 = 2048;
      unint64_t v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Triggering startedAt: %llu", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sensitiveCondition:2 startedAt:v8];
LABEL_19:
  }

  queue = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100275A68;
  v18[3] = &unk_1004FD0A0;
  v18[4] = self;
  v18[5] = a5;
  dispatch_async(queue, v18);
}

- (void)pollConditionStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100275A04;
  block[3] = &unk_1004FB930;
  id v9 = v4;
  uint64_t v10 = v5;
  block[4] = self;
  id v7 = v4;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end