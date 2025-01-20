@interface CSAttSiriAudioSessionStateClient
- (AFNotifyObserver)siriStateObserver;
- (BOOL)isActiveRequest;
- (BOOL)isActiveSession;
- (BOOL)isListening;
- (BOOL)isSpeaking;
- (CSAttSiriAudioSessionStateClient)initWithDelegate:(id)a3;
- (CSAttSiriSessionStateDelegate)delegate;
- (OS_dispatch_queue)stateNotificationQueue;
- (void)dispatchStateChangedFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)setIsActiveRequest:(BOOL)a3;
- (void)setIsActiveSession:(BOOL)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setIsSpeaking:(BOOL)a3;
- (void)setSiriStateObserver:(id)a3;
- (void)setStateNotificationQueue:(id)a3;
@end

@implementation CSAttSiriAudioSessionStateClient

- (CSAttSiriAudioSessionStateClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAttSiriAudioSessionStateClient initWithDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSAttSiriAudioSessionStateClient;
  v6 = -[CSAttSiriAudioSessionStateClient init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    *(_DWORD *)&v7->_isSpeaking = 0;
    dispatch_queue_t v8 = dispatch_queue_create("SiriStateNotificationListener", 0LL);
    stateNotificationQueue = v7->_stateNotificationQueue;
    v7->_stateNotificationQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    v11 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
    v12 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v10,  "initWithName:options:queue:delegate:",  v11,  1LL,  v7->_stateNotificationQueue,  v7);
    siriStateObserver = v7->_siriStateObserver;
    v7->_siriStateObserver = v12;
  }

  return v7;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  v6 = (AFNotifyObserver *)a3;
  v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[CSAttSiriAudioSessionStateClient notifyObserver:didReceiveNotificationWithToken:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }

  if (self->_siriStateObserver == v6)
  {
    dispatch_queue_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[CSAttSiriAudioSessionStateClient notifyObserver:didReceiveNotificationWithToken:]";
      __int16 v11 = 1024;
      int v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s token:%d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  dispatch_queue_t v8 = (AFNotifyObserver *)a3;
  int v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    __int16 v11 = "-[CSAttSiriAudioSessionStateClient notifyObserver:didChangeStateFrom:to:]";
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    __int16 v14 = 2048;
    unint64_t v15 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s fromState:%llu, toState:%llu",  (uint8_t *)&v10,  0x20u);
  }

  if (self->_siriStateObserver == v8) {
    -[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:](self, "dispatchStateChangedFrom:to:", a4, a5);
  }
}

- (void)dispatchStateChangedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  int v5 = a3;
  v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315138;
    v34 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v33, 0xCu);
  }

  if (((a4 ^ v5) & 2) != 0)
  {
    BOOL v8 = (v5 & 2) == 0 && (a4 >> 1) & 1;
    self->_BOOL isActiveSession = v8;
    int v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315394;
      v34 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
      __int16 v35 = 1024;
      int v36 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s SiriState - isActiveSession:%d",  (uint8_t *)&v33,  0x12u);
    }
  }

  if (((a4 ^ v5) & 1) != 0)
  {
    unsigned __int8 v10 = v5 | ((a4 & 1) == 0);
    self->_isActiveRequest = (v10 ^ 1) & 1;
    __int16 v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315394;
      v34 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
      __int16 v35 = 1024;
      int v36 = (v10 ^ 1) & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s SiriState - isActiveRequest:%d",  (uint8_t *)&v33,  0x12u);
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  if (((a4 ^ v5) & 4) != 0)
  {
    BOOL v12 = (v5 & 4) == 0 && (a4 >> 2) & 1;
    self->_isListening = v12;
    unint64_t v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315394;
      v34 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
      __int16 v35 = 1024;
      int v36 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s SiriState - isListening:%d",  (uint8_t *)&v33,  0x12u);
    }
  }

  if (((a4 ^ v5) & 8) == 0)
  {
    int v14 = 0;
    goto LABEL_32;
  }

  if ((v5 & 8) == 0 && (a4 & 8) != 0)
  {
    self->_BOOL isSpeaking = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector(WeakRetained, "notifySiriSessionStateTTSOngoing:");

    if ((v16 & 1) == 0)
    {
      BOOL isActiveSession = 0;
      goto LABEL_29;
    }

    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 notifySiriSessionStateTTSOngoing:1];
    BOOL isActiveSession = 0;
    goto LABEL_27;
  }

  self->_BOOL isSpeaking = 0;
  BOOL isActiveSession = self->_isActiveSession;
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  char v20 = objc_opt_respondsToSelector(v19, "notifySiriSessionStateTTSOngoing:");

  if ((v20 & 1) != 0)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 notifySiriSessionStateTTSOngoing:0];
LABEL_27:
  }

- (CSAttSiriSessionStateDelegate)delegate
{
  return (CSAttSiriSessionStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AFNotifyObserver)siriStateObserver
{
  return self->_siriStateObserver;
}

- (void)setSiriStateObserver:(id)a3
{
}

- (OS_dispatch_queue)stateNotificationQueue
{
  return self->_stateNotificationQueue;
}

- (void)setStateNotificationQueue:(id)a3
{
}

- (BOOL)isSpeaking
{
  return self->_isSpeaking;
}

- (void)setIsSpeaking:(BOOL)a3
{
  self->_BOOL isSpeaking = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isActiveRequest
{
  return self->_isActiveRequest;
}

- (void)setIsActiveRequest:(BOOL)a3
{
  self->_isActiveRequest = a3;
}

- (BOOL)isActiveSession
{
  return self->_isActiveSession;
}

- (void)setIsActiveSession:(BOOL)a3
{
  self->_BOOL isActiveSession = a3;
}

- (void).cxx_destruct
{
}

@end