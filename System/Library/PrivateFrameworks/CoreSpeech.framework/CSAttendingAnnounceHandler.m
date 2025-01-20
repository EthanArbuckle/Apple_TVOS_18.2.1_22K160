@interface CSAttendingAnnounceHandler
- (BOOL)_shouldDuckTTSAtSpeechStartDetected:(int64_t)a3;
- (CSAttendingAnnounceHandler)init;
- (LBAttendingStatesServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)speechStartDetectedWithEventInfo:(id)a3;
@end

@implementation CSAttendingAnnounceHandler

- (CSAttendingAnnounceHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttendingAnnounceHandler;
  v2 = -[CSAttendingAnnounceHandler init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttendingAnnounceHandler Queue",  33LL));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100145E48;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttendingAnnounceHandler speechStartDetectedWithEventInfo:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100145CA8;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (BOOL)_shouldDuckTTSAtSpeechStartDetected:(int64_t)a3
{
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSAttendingAnnounceHandler _shouldDuckTTSAtSpeechStartDetected:]";
    __int16 v8 = 1026;
    BOOL v9 = a3 == 25;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s shouldDuckTTS: %{public}d",  (uint8_t *)&v6,  0x12u);
  }

  return a3 == 25;
}

- (LBAttendingStatesServiceDelegate)delegate
{
  return (LBAttendingStatesServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end