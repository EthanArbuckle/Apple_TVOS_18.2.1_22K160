@interface GenericSiriRemoteListener
+ (id)instance;
- (DoAPAudioRelay)doapAudioRelay;
- (GenericSiriRemoteListener)init;
- (HIDManager)hidManager;
- (NSDate)lastAudioDate;
- (NSMutableArray)audioBuffer;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (id)allocHIDQueue;
- (unsigned)state;
- (void)dealloc;
- (void)doapAudioDidStop:(id)a3;
- (void)doapAudioWillStart:(id)a3;
- (void)handleAudioData:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setHidManager:(id)a3;
- (void)setLastAudioDate:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setUpHidHandlers;
- (void)waitForSiriAudioToStop:(id)a3;
@end

@implementation GenericSiriRemoteListener

+ (id)instance
{
  if (qword_100070C10 != -1) {
    dispatch_once(&qword_100070C10, &stru_10005CE78);
  }
  return (id)qword_100070C08;
}

- (void)dealloc
{
  hidManager = self->_hidManager;
  if (hidManager)
  {
    -[HIDManager cancel](hidManager, "cancel");
    -[HIDManager close](self->_hidManager, "close");
  }

  eventQueue = self->_eventQueue;
  self->_eventQueue = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GenericSiriRemoteListener;
  -[GenericSiriRemoteListener dealloc](&v5, "dealloc");
}

- (void)setUpHidHandlers
{
  hidManager = self->_hidManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010970;
  v6[3] = &unk_10005CEA0;
  v6[4] = self;
  -[HIDManager setInputElementHandler:](hidManager, "setInputElementHandler:", v6);
  -[HIDManager setDeviceMatching:](self->_hidManager, "setDeviceMatching:", &off_100060148);
  v4 = self->_hidManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000109B4;
  v5[3] = &unk_10005CEC8;
  v5[4] = self;
  -[HIDManager setDeviceNotificationHandler:](v4, "setDeviceNotificationHandler:", v5);
  -[HIDManager setDispatchQueue:](self->_hidManager, "setDispatchQueue:", self->_eventQueue);
  -[HIDManager open](self->_hidManager, "open");
  -[HIDManager activate](self->_hidManager, "activate");
}

- (id)allocHIDQueue
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  objc_opt_class(self, v5));
  id v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v4);

  return v8;
}

- (GenericSiriRemoteListener)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GenericSiriRemoteListener;
  v2 = -[GenericSiriRemoteListener init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    audioBuffer = v2->_audioBuffer;
    v2->_audioBuffer = v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(1LL);
    doapAudioStart = v2->_doapAudioStart;
    v2->_doapAudioStart = (OS_dispatch_semaphore *)v5;

    id v7 = objc_alloc_init(&OBJC_CLASS___HIDManager);
    hidManager = v2->_hidManager;
    v2->_hidManager = v7;

    v9 = -[GenericSiriRemoteListener allocHIDQueue](v2, "allocHIDQueue");
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v9;
  }

  return v2;
}

- (void)handleAudioData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 length];
  uint64_t v36 = 0LL;
  if (v5 <= 3)
  {
    uint64_t v6 = v5;
    id v7 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_100039AF0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_22;
  }

  [v4 getBytes:&v36 range:4];
  if (-[GenericSiriRemoteListener state](self, "state") == 4) {
    goto LABEL_22;
  }
  if (v4 && v36)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[GenericSiriRemoteListener setLastAudioDate:](self, "setLastAudioDate:", v15);

    v16 = (GenericSiriRemoteListener *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v4));
    if (objc_opt_class(&OBJC_CLASS___SLGLog, v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100010F68;
      v34[3] = &unk_10005CBD0;
      v35 = v16;
      [v18 logBlock:v34];
    }

    v19 = self;
    objc_sync_enter(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener audioBuffer](v19, "audioBuffer"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener audioBuffer](v19, "audioBuffer"));
      [v21 addObject:v16];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioRelay](v19, "doapAudioRelay"));
      [v21 sendAudioFrame:v16];
    }

    objc_sync_exit(v19);
LABEL_21:

    goto LABEL_22;
  }

  if (!v36)
  {
    if (objc_opt_class(&OBJC_CLASS___SLGLog, v14))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
      [v30 logBlock:&stru_10005CEE8];
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));

    if (v31)
    {
      v32 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));
      dispatch_semaphore_signal(v32);
    }

    v16 = self;
    objc_sync_enter(v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener audioBuffer](v16, "audioBuffer"));
    [v33 removeAllObjects];

    objc_sync_exit(v16);
    goto LABEL_21;
  }

  v22 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_100039B58(v22, v23, v24, v25, v26, v27, v28, v29);
  }
LABEL_22:
}

- (void)doapAudioWillStart:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GenericSiriRemote stopped (disconnected)"));
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    uint64_t v12 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870185LL,  v6));

    v4[2](v4, v7);
  }

  else
  {
    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011174;
    block[3] = &unk_10005CF10;
    block[4] = self;
    uint64_t v10 = v4;
    dispatch_async(eventQueue, block);
  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GenericSiriRemote stopped (disconnected)"));
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    v52 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870185LL,  v6));

    v4[2](v4, v7);
    uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);

    goto LABEL_18;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
  [v9 timeIntervalSinceNow];
  double v11 = fabs(v10);

  if (v11 >= 0.105)
  {
    uint64_t v25 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v25;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
      [v27 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      double v50 = fabs(v28) * 1000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Have not received audio data for %f ms. Stop Siri session.",  buf,  0xCu);
    }

    goto LABEL_17;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));
    dispatch_time_t v17 = dispatch_time(0LL, 1000000 * vcvtpd_s64_f64((v15 + 0.105) * 1000.0));
    uint64_t v18 = dispatch_semaphore_wait(v16, v17);

    v19 = (void *)qword_100070CC8;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
        [v22 timeIntervalSinceNow];
        *(_DWORD *)buf = 134217984;
        double v50 = fabs(v23) * 1000.0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received Siri audio data %f ms ago.",  buf,  0xCu);
      }

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100011AB8;
      v45[3] = &unk_10005CF10;
      v45[4] = self;
      v46 = v4;
      dispatch_async(eventQueue, v45);

      goto LABEL_18;
    }

    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Received empty audio input report. Stop Siri session.",  buf,  2u);
    }

- (void)doapAudioDidStop:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GenericSiriRemote stopped (disconnected)"));
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    uint64_t v13 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870185LL,  v6));

    v4[2](v4, v7);
    uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);
  }

  else
  {
    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011C48;
    block[3] = &unk_10005CF10;
    block[4] = self;
    double v11 = v4;
    dispatch_async(eventQueue, block);
  }
}

- (HIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end