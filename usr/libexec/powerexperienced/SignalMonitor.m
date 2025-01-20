@interface SignalMonitor
+ (id)sharedInstance;
- (BOOL)audioActive;
- (BOOL)nfcActive;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)nfcTransaction;
- (ResourceHint)audioResourceHint;
- (ResourceHint)nfcResourceHint;
- (SignalMonitor)init;
- (void)handleAudioSession;
- (void)handleNFCSession;
- (void)handleXPCEvent:(id)a3;
- (void)initAudioHandling;
- (void)initNFCHandling;
- (void)initializeMonitors;
- (void)setAudioActive:(BOOL)a3;
- (void)setAudioResourceHint:(id)a3;
- (void)setNfcActive:(BOOL)a3;
- (void)setNfcResourceHint:(id)a3;
- (void)setNfcTransaction:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SignalMonitor

+ (id)sharedInstance
{
  if (qword_10001B770 != -1) {
    dispatch_once(&qword_10001B770, &stru_100014748);
  }
  return (id)qword_10001B768;
}

- (SignalMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SignalMonitor;
  v2 = -[SignalMonitor init](&v9, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.powerexperieced.signalmonitor", v4);
    -[SignalMonitor setQueue:](v2, "setQueue:", v5);

    os_log_t v6 = os_log_create("com.apple.powerexperienced", "signalMonitor");
    v7 = (void *)qword_10001B778;
    qword_10001B778 = (uint64_t)v6;
  }

  return v2;
}

- (void)initializeMonitors
{
  dispatch_queue_attr_t v3 = (os_log_s *)qword_10001B778;
  if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initialized signal monitors", v4, 2u);
  }

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A244;
  v7[3] = &unk_100014510;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)initAudioHandling
{
  if (notify_register_check("com.apple.coreaudio.IORunning", &dword_10001B780))
  {
    if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_ERROR)) {
      sub_10000D7DC();
    }
  }

- (void)handleAudioSession
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t state64 = 0LL;
  if (!notify_get_state(dword_10001B780, &state64))
  {
    if (state64)
    {
      -[SignalMonitor setAudioActive:](self, "setAudioActive:", 1LL);
      id v4 = (os_log_s *)qword_10001B778;
      if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = state64;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Audio playback started current_state %llu. Creating a resource hint",  buf,  0xCu);
      }

      dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));

      if (!v5)
      {
        v11 = -[ResourceHint initWithResourceType:andState:]( objc_alloc(&OBJC_CLASS___ResourceHint),  "initWithResourceType:andState:",  5LL,  1LL);
        -[SignalMonitor setAudioResourceHint:](self, "setAudioResourceHint:", v11);

        return;
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));
      v7 = v6;
      uint64_t v8 = 1LL;
    }

    else
    {
      -[SignalMonitor setAudioActive:](self, "setAudioActive:", 0LL);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));

      if (!v9) {
        return;
      }
      v10 = (os_log_s *)qword_10001B778;
      if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Audio playback stopped. Dropping a resource hint",  buf,  2u);
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));
      v7 = v6;
      uint64_t v8 = 0LL;
    }

    [v6 updateState:v8];

    return;
  }

  if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_ERROR)) {
    sub_10000D808();
  }
}

- (void)initNFCHandling
{
  if (notify_register_check("com.apple.request.hipuncap", &dword_10001B784))
  {
    if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_ERROR)) {
      sub_10000D834();
    }
  }

- (void)handleNFCSession
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t state64 = 0LL;
  if (!notify_get_state(dword_10001B784, &state64))
  {
    if (state64 && !-[SignalMonitor nfcActive](self, "nfcActive"))
    {
      -[SignalMonitor setNfcActive:](self, "setNfcActive:", 1LL);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor nfcResourceHint](self, "nfcResourceHint"));

      if (v4)
      {
        dispatch_queue_t v5 = (ResourceHint *)objc_claimAutoreleasedReturnValue(-[SignalMonitor nfcResourceHint](self, "nfcResourceHint"));
        -[ResourceHint updateState:](v5, "updateState:", 1LL);
      }

      else
      {
        id v6 = (os_log_s *)qword_10001B778;
        if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "NFC session started. Creating a resource hint",  buf,  2u);
        }

        dispatch_queue_t v5 = -[ResourceHint initWithResourceType:andState:]( objc_alloc(&OBJC_CLASS___ResourceHint),  "initWithResourceType:andState:",  4LL,  1LL);
        -[SignalMonitor setNfcResourceHint:](self, "setNfcResourceHint:", v5);
      }

      dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
      uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000A6F0;
      block[3] = &unk_1000145B0;
      block[4] = self;
      dispatch_after(v7, v8, block);
    }

    else if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_ERROR))
    {
      sub_10000D860();
    }
  }

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)audioActive
{
  return self->_audioActive;
}

- (void)setAudioActive:(BOOL)a3
{
  self->_audioActive = a3;
}

- (BOOL)nfcActive
{
  return self->_nfcActive;
}

- (void)setNfcActive:(BOOL)a3
{
  self->_nfcActive = a3;
}

- (ResourceHint)audioResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAudioResourceHint:(id)a3
{
}

- (ResourceHint)nfcResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNfcResourceHint:(id)a3
{
}

- (OS_os_transaction)nfcTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNfcTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end