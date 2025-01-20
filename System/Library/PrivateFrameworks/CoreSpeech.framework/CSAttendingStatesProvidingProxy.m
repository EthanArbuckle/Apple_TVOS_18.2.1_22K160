@interface CSAttendingStatesProvidingProxy
- (CSAttSiriTTSPromptProtocol)ttsPromptUpdateReceivers;
- (CSAttSiriUIDismissProtocol)dismissUpdateReceivers;
- (CSAttendingHintProviding)hintProvider;
- (CSAttendingStatesProvidingProxy)init;
- (CSCarKitUtils)carKitUtils;
- (LBAttendingStatesServiceDelegate)remoteObjectProxy;
- (OS_dispatch_queue)queue;
- (void)addDismissUpdateReceiver:(id)a3;
- (void)addSiriPromptUpdateReceiver:(id)a3;
- (void)attendingStatesXPCDisconnected;
- (void)directActionJarvisAnnounceMessageTriggerWithDeviceId:(id)a3;
- (void)dismissAttending;
- (void)localAttendingStartedWithRootRequestId:(id)a3;
- (void)localAttendingStopped;
- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3;
- (void)localAttendingWillStartWithRootRequestId:(id)a3;
- (void)registerAttendingHintProvider:(id)a3;
- (void)removeDismissUpdateReceiver:(id)a3;
- (void)removeSiriPromptUpdateReceiver:(id)a3;
- (void)requestDismissed;
- (void)setCarKitUtils:(id)a3;
- (void)setDismissUpdateReceivers:(id)a3;
- (void)setHintProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setTtsPromptUpdateReceivers:(id)a3;
- (void)siriDidPrompt;
- (void)siriDidPromptWithRootRequestId:(id)a3;
- (void)siriPromptWillStart;
- (void)siriPromptWillStartWithRootRequestId:(id)a3;
- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3;
- (void)startUpdateStates;
@end

@implementation CSAttendingStatesProvidingProxy

- (CSAttendingStatesProvidingProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSAttendingStatesProvidingProxy;
  v2 = -[CSAttendingStatesProvidingProxy init](&v12, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSIntuitiveConvRequestHandler queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    dismissUpdateReceivers = v2->_dismissUpdateReceivers;
    v2->_dismissUpdateReceivers = (CSAttSiriUIDismissProtocol *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    ttsPromptUpdateReceivers = v2->_ttsPromptUpdateReceivers;
    v2->_ttsPromptUpdateReceivers = (CSAttSiriTTSPromptProtocol *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[CSCarKitUtils sharedInstance](&OBJC_CLASS___CSCarKitUtils, "sharedInstance"));
    carKitUtils = v2->_carKitUtils;
    v2->_carKitUtils = (CSCarKitUtils *)v9;
  }

  return v2;
}

- (void)setRemoteObjectProxy:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B9B0;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addDismissUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B9A4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeDismissUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B998;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addSiriPromptUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B98C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeSiriPromptUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B980;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerAttendingHintProvider:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B974;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attendingStatesXPCDisconnected
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B81C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startUpdateStates
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttendingStatesProvidingProxy startUpdateStates]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }

- (void)siriPromptWillStart
{
}

- (void)siriDidPrompt
{
}

- (void)siriPromptWillStartWithRootRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[CSAttendingStatesProvidingProxy siriPromptWillStartWithRootRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B6B0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriDidPromptWithRootRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSAttendingStatesProvidingProxy siriDidPromptWithRootRequestId:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006B4FC;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)directActionJarvisAnnounceMessageTriggerWithDeviceId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttendingStatesProvidingProxy carKitUtils](self, "carKitUtils"));
  unsigned int v6 = [v5 isBargeInDisabledForConnectedVehicle];

  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v8 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSAttendingStatesProvidingProxy directActionJarvisAnnounceMessageTriggerWithDeviceId:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s not triggering because barge-in is disabled for this vehicle",  buf,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSAttendingStatesProvidingProxy directActionJarvisAnnounceMessageTriggerWithDeviceId:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s deviceId=%@", buf, 0x16u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10006B49C;
    v10[3] = &unk_10022EFD0;
    id v11 = v4;
    __int16 v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)dismissAttending
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B330;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestDismissed
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B220;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B214;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B208;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B1FC;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingStopped
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B1F0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006B1DC;
  v11[3] = &unk_10022C3E8;
  unint64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006B1C8;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006B1B4;
  v11[3] = &unk_10022C3E8;
  unint64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (LBAttendingStatesServiceDelegate)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAttendingHintProviding)hintProvider
{
  return (CSAttendingHintProviding *)objc_loadWeakRetained((id *)&self->_hintProvider);
}

- (void)setHintProvider:(id)a3
{
}

- (CSAttSiriUIDismissProtocol)dismissUpdateReceivers
{
  return self->_dismissUpdateReceivers;
}

- (void)setDismissUpdateReceivers:(id)a3
{
}

- (CSAttSiriTTSPromptProtocol)ttsPromptUpdateReceivers
{
  return self->_ttsPromptUpdateReceivers;
}

- (void)setTtsPromptUpdateReceivers:(id)a3
{
}

- (CSCarKitUtils)carKitUtils
{
  return self->_carKitUtils;
}

- (void)setCarKitUtils:(id)a3
{
}

- (void).cxx_destruct
{
}

@end