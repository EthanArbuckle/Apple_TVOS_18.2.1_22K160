@interface CSVoiceTriggerAPModeSuspendPolicyIOS
- (BOOL)_isAudioRouteIneligibleForAP;
- (BOOL)_isHearstRoutedAndWithNoPhoneCall;
- (BOOL)_isInPhoneCallStateWithHSPhoneCallCapableRoute;
- (BOOL)_isJarvisRouted;
- (BOOL)_isSpeechDetectionDevicePresent;
- (BOOL)isAssistantClientConsideredAsRecord;
- (CSVoiceTriggerAPModeSuspendPolicyIOS)init;
- (NSString)pendingRecordingStopUUID;
- (void)_addConditionsForIOSAOP;
- (void)_addConditionsForIOSBargeIn;
- (void)_addVoiceTriggerAPModeSuspendConditions;
- (void)_handleClientRecordStateDidChange:(BOOL)a3 eventUUID:(id)a4;
- (void)_subscribeEventMonitors;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6;
- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5;
- (void)setIsAssistantClientConsideredAsRecord:(BOOL)a3;
- (void)setPendingRecordingStopUUID:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didChangedRecordState:(BOOL)a4 withEventUUID:(id)a5 withContext:(id)a6;
@end

@implementation CSVoiceTriggerAPModeSuspendPolicyIOS

- (CSVoiceTriggerAPModeSuspendPolicyIOS)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerAPModeSuspendPolicyIOS;
  v2 = -[CSVoiceTriggerAPModeSuspendPolicyIOS init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerAPModeSuspendPolicyIOS RecordState queue", 0LL);
    recordStateQueue = v2->_recordStateQueue;
    v2->_recordStateQueue = (OS_dispatch_queue *)v3;

    v2->_isAssistantClientConsideredAsRecord = 0;
    -[CSVoiceTriggerAPModeSuspendPolicyIOS _addVoiceTriggerAPModeSuspendConditions]( v2,  "_addVoiceTriggerAPModeSuspendConditions");
    -[CSVoiceTriggerAPModeSuspendPolicyIOS _subscribeEventMonitors](v2, "_subscribeEventMonitors");
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    [v5 registerObserver:v2];

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
    [v6 registerObserver:v2];
  }

  return v2;
}

- (void)_subscribeEventMonitors
{
  if (+[CSUtils isIOSDeviceSupportingBargeIn](&OBJC_CLASS___CSUtils, "isIOSDeviceSupportingBargeIn"))
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSBuiltinSpeakerStateMonitor sharedInstance]( &OBJC_CLASS___CSBuiltinSpeakerStateMonitor,  "sharedInstance"));
    -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRouteChangeMonitor sharedInstance]( &OBJC_CLASS___CSAudioRouteChangeMonitor,  "sharedInstance"));
    -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSPlaybackVolumeStatusMonitor sharedInstance]( &OBJC_CLASS___CSPlaybackVolumeStatusMonitor,  "sharedInstance"));
    -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechDetectionDevicePresentMonitor sharedInstance]( &OBJC_CLASS___CSSpeechDetectionDevicePresentMonitor,  "sharedInstance"));
  -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSAlwaysOnProcessorStateMonitor sharedInstance]( &OBJC_CLASS___CSAlwaysOnProcessorStateMonitor,  "sharedInstance"));
  -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSCommandControlStreamEventMonitor sharedInstance]( &OBJC_CLASS___CSCommandControlStreamEventMonitor,  "sharedInstance"));
  -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSAttSiriStateMonitor sharedInstance](&OBJC_CLASS___CSAttSiriStateMonitor, "sharedInstance"));
  -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamActivityMonitor sharedInstance]( &OBJC_CLASS___CSAudioStreamActivityMonitor,  "sharedInstance"));
  -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  if (+[CSUtils supportHandsFree](&OBJC_CLASS___CSUtils, "supportHandsFree"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
    -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[CSMXRingtoneMonitor sharedInstance](&OBJC_CLASS___CSMXRingtoneMonitor, "sharedInstance"));
    -[CSVoiceTriggerAPModeSuspendPolicyIOS subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);
  }

- (void)_addVoiceTriggerAPModeSuspendConditions
{
  if (+[CSUtils isIOSDeviceSupportingBargeIn](&OBJC_CLASS___CSUtils, "isIOSDeviceSupportingBargeIn")
    && (dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences")),
        unsigned int v4 = [v3 forceVoiceTriggerAPMode],
        v3,
        v4))
  {
    v5 = &stru_10022EBF8;
  }

  else
  {
    id v6 = +[CSUtils isIOSDeviceSupportingBargeIn](&OBJC_CLASS___CSUtils, "isIOSDeviceSupportingBargeIn");
    if ((_DWORD)v6)
    {
      -[CSVoiceTriggerAPModeSuspendPolicyIOS _addConditionsForIOSBargeIn](self, "_addConditionsForIOSBargeIn");
      return;
    }

    if (CSHasAOP(v6))
    {
      -[CSVoiceTriggerAPModeSuspendPolicyIOS _addConditionsForIOSAOP](self, "_addConditionsForIOSAOP");
      return;
    }

    v5 = &stru_10022EC18;
  }

  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v5);
}

- (void)_addConditionsForIOSBargeIn
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10014A658;
  v13[3] = &unk_10022EC40;
  objc_copyWeak(&v14, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v13);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", &stru_10022EC60);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10014A75C;
  v11[3] = &unk_10022EC40;
  objc_copyWeak(&v12, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10014A8E0;
  v9[3] = &unk_10022EC40;
  objc_copyWeak(&v10, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014AC40;
  v7[3] = &unk_10022EC40;
  objc_copyWeak(&v8, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10014AD30;
  v5[3] = &unk_10022EC40;
  objc_copyWeak(&v6, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10014AE28;
  v3[3] = &unk_10022EC40;
  objc_copyWeak(&v4, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_addConditionsForIOSAOP
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10014A074;
  v9[3] = &unk_10022EC40;
  objc_copyWeak(&v10, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v9);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", &stru_10022EC80);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014A178;
  v7[3] = &unk_10022EC40;
  objc_copyWeak(&v8, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10014A268;
  v5[3] = &unk_10022EC40;
  objc_copyWeak(&v6, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10014A3BC;
  v3[3] = &unk_10022EC40;
  objc_copyWeak(&v4, &location);
  -[CSVoiceTriggerAPModeSuspendPolicyIOS addConditions:](self, "addConditions:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_isSpeechDetectionDevicePresent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechDetectionDevicePresentMonitor sharedInstance]( &OBJC_CLASS___CSSpeechDetectionDevicePresentMonitor,  "sharedInstance"));
  unsigned __int8 v3 = [v2 isPresent];

  if ((v3 & 1) == 0)
  {
    id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _isSpeechDetectionDevicePresent]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Speech Detection VAD is not available, we will still running in AOP mode",  (uint8_t *)&v6,  0xCu);
    }
  }

  return v3;
}

- (BOOL)_isJarvisRouted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  unsigned __int8 v3 = [v2 jarvisConnected];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  v5 = (char *)[v4 hearstRouteStatus];

  else {
    return 0;
  }
}

- (BOOL)_isHearstRoutedAndWithNoPhoneCall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  id v3 = [v2 hearstRouteStatus];

  unint64_t v4 = (unint64_t)v3 - 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  id v6 = [v5 phoneCallState];

  return v4 < 2 && (unint64_t)v6 < 2;
}

- (BOOL)_isAudioRouteIneligibleForAP
{
  unsigned int v3 = -[CSVoiceTriggerAPModeSuspendPolicyIOS _isSpeechDetectionDevicePresent](self, "_isSpeechDetectionDevicePresent");
  unsigned int v4 = -[CSVoiceTriggerAPModeSuspendPolicyIOS _isHearstRoutedAndWithNoPhoneCall]( self,  "_isHearstRoutedAndWithNoPhoneCall");
  unsigned int v5 = -[CSVoiceTriggerAPModeSuspendPolicyIOS _isJarvisRouted](self, "_isJarvisRouted");
  int v6 = v3 ^ 1 | v4 | v5;
  if (v6 == 1)
  {
    unsigned int v7 = v5;
    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315906;
      v11 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _isAudioRouteIneligibleForAP]";
      __int16 v12 = 1024;
      unsigned int v13 = v3;
      __int16 v14 = 1024;
      unsigned int v15 = v4;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s VAD is not present (%d) or Hearst routed without phone call (%d) or Jarvis routed (%d)",  (uint8_t *)&v10,  0x1Eu);
    }
  }

  return v6;
}

- (BOOL)_isInPhoneCallStateWithHSPhoneCallCapableRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  unsigned int v3 = (char *)[v2 phoneCallState];

  else {
    unsigned int v4 = 0;
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[CSUtils fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:]( &OBJC_CLASS___CSUtils,  "fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:",  0LL));
  int v6 = (void *)v5;
  if (v5) {
    int v7 = AFBTProductIDSupportsAnnounce(v5);
  }
  else {
    int v7 = 0;
  }
  id v8 = +[CSUtils fetchHypotheticalRouteType](&OBJC_CLASS___CSUtils, "fetchHypotheticalRouteType");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXRingtoneMonitor sharedInstance](&OBJC_CLASS___CSMXRingtoneMonitor, "sharedInstance"));
  unsigned int v10 = [v9 isAnyRingtoneCurrentlyPlaying];

  if (+[CSUtils supportHandsFree](&OBJC_CLASS___CSUtils, "supportHandsFree")
    && ((v4 & 1) != 0 || ((unint64_t)(v3 - 3) < 2 ? (int v11 = 1) : (int v11 = v10), v11 == 1)))
  {
    if (v8 == (id)1) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v7;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  uint64_t v13 = qword_100280250;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_100280250, 2) <= 0xCCCCCCCCCCCCCCCuLL)
  {
    unsigned int v17 = v4;
    __int16 v14 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = v14;
      *(_DWORD *)buf = 136316930;
      v19 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _isInPhoneCallStateWithHSPhoneCallCapableRoute]";
      __int16 v20 = 1024;
      unsigned int v21 = +[CSUtils supportHandsFree](&OBJC_CLASS___CSUtils, "supportHandsFree");
      __int16 v22 = 1024;
      unsigned int v23 = v17;
      __int16 v24 = 1024;
      unsigned int v25 = v10;
      __int16 v26 = 1024;
      int v27 = (int)v3;
      __int16 v28 = 1024;
      int v29 = v7;
      __int16 v30 = 1024;
      BOOL v31 = v8 == (id)1;
      __int16 v32 = 1024;
      BOOL v33 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s #PhoneStates: SpprtHF(%d) RingtoneHFP(%d) RingtoneNotfcn(%d) phoneCallState(%u) hsCallHeadsetCnnctd(%d) built InRoute(%d). Result(%d)",  buf,  0x36u);

      uint64_t v13 = qword_100280250;
    }
  }

  qword_100280250 = v13 + 1;

  return v12;
}

- (void)_handleClientRecordStateDidChange:(BOOL)a3 eventUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    -[CSVoiceTriggerAPModeSuspendPolicyIOS setIsAssistantClientConsideredAsRecord:]( self,  "setIsAssistantClientConsideredAsRecord:",  1LL);
    -[CSVoiceTriggerAPModeSuspendPolicyIOS setPendingRecordingStopUUID:](self, "setPendingRecordingStopUUID:", 0LL);
    -[CSVoiceTriggerAPModeSuspendPolicyIOS notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0LL);
  }

  else
  {
    -[CSVoiceTriggerAPModeSuspendPolicyIOS setPendingRecordingStopUUID:](self, "setPendingRecordingStopUUID:", v6);
    int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _handleClientRecordStateDidChange:eventUUID:]";
      __int16 v15 = 2050;
      uint64_t v16 = 0x4010000000000000LL;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Will notify Siri Client record state change to STOPPED in %{public}f seconds, eventUUID = %{public}@",  buf,  0x20u);
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0LL, 4000000000LL);
    recordStateQueue = (dispatch_queue_s *)self->_recordStateQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100149E80;
    v10[3] = &unk_10022F0D8;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v6;
    dispatch_after(v8, recordStateQueue, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  id v8 = a6;
  recordStateQueue = (dispatch_queue_s *)self->_recordStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100149E64;
  block[3] = &unk_10022ECA8;
  BOOL v13 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(recordStateQueue, block);
}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  id v6 = a5;
  recordStateQueue = (dispatch_queue_s *)self->_recordStateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100149E54;
  v9[3] = &unk_10022EFD0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(recordStateQueue, v9);
}

- (void)siriClientBehaviorMonitor:(id)a3 didChangedRecordState:(BOOL)a4 withEventUUID:(id)a5 withContext:(id)a6
{
  id v8 = a5;
  recordStateQueue = (dispatch_queue_s *)self->_recordStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100149E44;
  block[3] = &unk_10022ECA8;
  BOOL v13 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(recordStateQueue, block);
}

- (BOOL)isAssistantClientConsideredAsRecord
{
  return self->_isAssistantClientConsideredAsRecord;
}

- (void)setIsAssistantClientConsideredAsRecord:(BOOL)a3
{
  self->_isAssistantClientConsideredAsRecord = a3;
}

- (NSString)pendingRecordingStopUUID
{
  return self->_pendingRecordingStopUUID;
}

- (void)setPendingRecordingStopUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end