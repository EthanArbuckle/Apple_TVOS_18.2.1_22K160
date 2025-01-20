@interface CSIntuitiveConvAudioCaptureMonitor
+ (CSIntuitiveConvAudioCaptureMonitor)sharedInstance;
- (CSAudioStartStreamOption)startStreamOption;
- (CSIntuitiveConvAudioCaptureMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)notifyDidStartAudioCaptureSuccessfully:(BOOL)a3 eventUUID:(id)a4;
- (void)notifyDidStopAudioCaptureWithOption:(id)a3 eventUUID:(id)a4 error:(id)a5;
- (void)notifyFetchedAudioStream:(id)a3 successfully:(BOOL)a4;
- (void)notifyWillStartAudioCaptureWithContext:(id)a3 option:(id)a4;
- (void)notifyWillStopAudioCaptureWithReason:(unint64_t)a3;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartStreamOption:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSIntuitiveConvAudioCaptureMonitor

- (CSIntuitiveConvAudioCaptureMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor;
  v2 = -[CSIntuitiveConvAudioCaptureMonitor init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSIntuitiveConvAudioCaptureMonitor", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }

  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A4F64;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A4F24;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyFetchedAudioStream:(id)a3 successfully:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSIntuitiveConvAudioCaptureMonitor notifyFetchedAudioStream:successfully:]";
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s audioStream : %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4E00;
  block[3] = &unk_10022ECA8;
  block[4] = self;
  id v13 = v6;
  BOOL v14 = a4;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)notifyWillStartAudioCaptureWithContext:(id)a3 option:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
    *(_DWORD *)buf = 136315650;
    v19 = "-[CSIntuitiveConvAudioCaptureMonitor notifyWillStartAudioCaptureWithContext:option:]";
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s context : %@, option : %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4CC4;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v16 = v7;
  id v17 = v6;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(queue, block);
}

- (void)notifyDidStartAudioCaptureSuccessfully:(BOOL)a3 eventUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[CSIntuitiveConvAudioCaptureMonitor notifyDidStartAudioCaptureSuccessfully:eventUUID:]";
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s flag : %d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4B9C;
  block[3] = &unk_10022ECA8;
  BOOL v12 = v4;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)notifyWillStopAudioCaptureWithReason:(unint64_t)a3
{
  uint64_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSIntuitiveConvAudioCaptureMonitor notifyWillStopAudioCaptureWithReason:]";
    __int16 v10 = 1024;
    int v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s reason : %u", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A4A7C;
  v7[3] = &unk_10022F020;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(queue, v7);
}

- (void)notifyDidStopAudioCaptureWithOption:(id)a3 eventUUID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSIntuitiveConvAudioCaptureMonitor notifyDidStopAudioCaptureWithOption:eventUUID:error:]";
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s error: %{public}@", buf, 0x16u);
  }

  if ([v10 code] != (id)961)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A4958;
    block[3] = &unk_10022EA98;
    block[4] = self;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(queue, block);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CSAudioStartStreamOption)startStreamOption
{
  return self->_startStreamOption;
}

- (void)setStartStreamOption:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CSIntuitiveConvAudioCaptureMonitor)sharedInstance
{
  if (qword_10027FED0 != -1) {
    dispatch_once(&qword_10027FED0, &stru_10022C150);
  }
  return (CSIntuitiveConvAudioCaptureMonitor *)(id)qword_10027FEC8;
}

@end