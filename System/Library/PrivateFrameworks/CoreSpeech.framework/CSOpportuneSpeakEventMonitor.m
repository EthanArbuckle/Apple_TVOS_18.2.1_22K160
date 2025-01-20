@interface CSOpportuneSpeakEventMonitor
+ (id)sharedInstance;
- (BOOL)isOpportuneSpeakListening;
- (BOOL)isStreaming;
- (CSAudioRecordContext)audioRecordContext;
- (CSOpportuneSpeakEventMonitor)init;
- (NSString)audioProviderUUID;
- (NSUUID)token;
- (OS_dispatch_queue)queue;
- (void)_notifyStopOpportuneSpeakWithDelay:(double)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 audioProviderUUID:(id)a5 successfully:(BOOL)a6 option:(id)a7;
- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStopStream:(id)a4;
- (void)opportuneSpeakBehaviorMonitor:(id)a3 willStopStream:(id)a4;
- (void)setAudioProviderUUID:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setIsOpportuneSpeakListening:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation CSOpportuneSpeakEventMonitor

- (CSOpportuneSpeakEventMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSOpportuneSpeakEventMonitor;
  v2 = -[CSOpportuneSpeakEventMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOpportuneSpeakEventMonitor", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isOpportuneSpeakListening = 0;
  }

  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor,  "sharedInstance",  a3));
  [v4 registerObserver:self];

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040D0C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopMonitoring
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor,  "sharedInstance"));
  [v3 unregisterObserver:self];

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040CF8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isStreaming
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100040CDC;
  v7[3] = &unk_10022EF80;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(queue, v7);
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *((unsigned __int8 *)v9 + 24);
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSOpportuneSpeakEventMonitor isStreaming]";
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Fetching CommandControl Listening State: %d",  buf,  0x12u);
  }

  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSString)audioProviderUUID
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100040C44;
  uint64_t v10 = sub_100040C54;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100040C9C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (CSAudioRecordContext)audioRecordContext
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100040C44;
  uint64_t v10 = sub_100040C54;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100040C5C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSAudioRecordContext *)v3;
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 audioProviderUUID:(id)a5 successfully:(BOOL)a6 option:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100040B08;
  v15[3] = &unk_10022DB78;
  BOOL v18 = a6;
  v15[4] = self;
  id v16 = v11;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, v15);
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 willStopStream:(id)a4
{
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStopStream:(id)a4
{
}

- (void)_notifyStopOpportuneSpeakWithDelay:(double)a3
{
  id v5 = -[NSUUID copy](self->_token, "copy");
  dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000409E0;
  v9[3] = &unk_10022EFD0;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_after(v6, queue, v9);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isOpportuneSpeakListening
{
  return self->_isOpportuneSpeakListening;
}

- (void)setIsOpportuneSpeakListening:(BOOL)a3
{
  self->_isOpportuneSpeakListening = a3;
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (void)setAudioRecordContext:(id)a3
{
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FD20 != -1) {
    dispatch_once(&qword_10027FD20, &stru_10022AF50);
  }
  return (id)qword_10027FD18;
}

@end