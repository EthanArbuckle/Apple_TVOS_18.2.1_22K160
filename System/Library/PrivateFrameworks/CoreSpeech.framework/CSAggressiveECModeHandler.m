@interface CSAggressiveECModeHandler
- (BOOL)aggressiveEchoCancellationApplied;
- (BOOL)inAttendingWindow;
- (BOOL)readThisOrVoiceOverSessionActive;
- (CSAggressiveECModeHandler)init;
- (CSAttSiriAudioSessionStateClient)siriStateClient;
- (OS_dispatch_queue)queue;
- (int64_t)echoCancellationReason;
- (void)_configureAggressiveEchoCancellationParams:(BOOL)a3;
- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3;
- (void)setAggressiveEchoCancellationApplied:(BOOL)a3;
- (void)setAttendingState:(BOOL)a3;
- (void)setAudioSessionState:(id)a3;
- (void)setEchoCancellationReason:(int64_t)a3;
- (void)setInAttendingWindow:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReadThisOrVoiceOverSessionActive:(BOOL)a3;
- (void)setSiriStateClient:(id)a3;
- (void)siriDismissed;
@end

@implementation CSAggressiveECModeHandler

- (CSAggressiveECModeHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAggressiveECModeHandler;
  v2 = -[CSAggressiveECModeHandler init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AggressiveECModeHandler queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_readThisOrVoiceOverSessionActive = 0;
    v2->_aggressiveEchoCancellationApplied = 0;
    v2->_echoCancellationReason = 0LL;
    v5 = -[CSAttSiriAudioSessionStateClient initWithDelegate:]( objc_alloc(&OBJC_CLASS___CSAttSiriAudioSessionStateClient),  "initWithDelegate:",  v2);
    siriStateClient = v2->_siriStateClient;
    v2->_siriStateClient = v5;
  }

  return v2;
}

- (void)setAttendingState:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100101D1C;
  v4[3] = &unk_10022EFA8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)setAudioSessionState:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010191C;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)siriDismissed
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100101868;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10010178C;
  v4[3] = &unk_10022EFA8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)_configureAggressiveEchoCancellationParams:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v6 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    id v8 = @"remove";
    if (v3) {
      id v8 = @"apply";
    }
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSAggressiveECModeHandler _configureAggressiveEchoCancellationParams:]";
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  %@ Aggressive EC params", buf, 0x16u);
  }

  if (CSIsIOS(v6, v7))
  {
    if (+[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient]( &OBJC_CLASS___CSAVVoiceTriggerClientManager,  "sharedVoiceTriggerClient"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001015A8;
      v10[3] = &unk_10022D5E0;
      BOOL v11 = v3;
      v10[4] = self;
      [v9 setAggressiveECMode:v3 completionBlock:v10];
    }
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAttSiriAudioSessionStateClient)siriStateClient
{
  return self->_siriStateClient;
}

- (void)setSiriStateClient:(id)a3
{
}

- (BOOL)readThisOrVoiceOverSessionActive
{
  return self->_readThisOrVoiceOverSessionActive;
}

- (void)setReadThisOrVoiceOverSessionActive:(BOOL)a3
{
  self->_readThisOrVoiceOverSessionActive = a3;
}

- (BOOL)inAttendingWindow
{
  return self->_inAttendingWindow;
}

- (void)setInAttendingWindow:(BOOL)a3
{
  self->_inAttendingWindow = a3;
}

- (BOOL)aggressiveEchoCancellationApplied
{
  return self->_aggressiveEchoCancellationApplied;
}

- (void)setAggressiveEchoCancellationApplied:(BOOL)a3
{
  self->_aggressiveEchoCancellationApplied = a3;
}

- (int64_t)echoCancellationReason
{
  return self->_echoCancellationReason;
}

- (void)setEchoCancellationReason:(int64_t)a3
{
  self->_echoCancellationReason = a3;
}

- (void).cxx_destruct
{
}

@end