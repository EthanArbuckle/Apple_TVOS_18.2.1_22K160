@interface SRModeSystemState
- (BOOL)isConnectedToAudioAccessory;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isDeviceSilentMode;
- (BOOL)isEyesFree;
- (BOOL)isForCarDND;
- (BOOL)isRequestEmergencyCall;
- (BOOL)isRequestMadeWithPhysicalDeviceInteraction;
- (BOOL)isScreenOffBeforeRequest;
- (BOOL)isVoiceTriggerRequest;
- (BOOL)userTouchedSnippet;
- (BOOL)userTypedInSiri;
- (SASRequestOptions)requestOptions;
- (SRModeSystemState)init;
- (id)_requestOptions;
- (id)description;
- (unint64_t)voiceFeedbackSetting;
- (void)_connectedOutputDevicesDidChange:(id)a3;
- (void)_fetchConnectedAudioAccessoryState;
- (void)setRequestOptions:(id)a3;
- (void)setUserTouchedSnippet:(BOOL)a3;
- (void)setUserTypedInSiri:(BOOL)a3;
- (void)setVoiceFeedbackSetting:(unint64_t)a3;
@end

@implementation SRModeSystemState

- (SRModeSystemState)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SRModeSystemState;
  v2 = -[SRModeSystemState init](&v16, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unint64_t v4 = (unint64_t)[v3 useDeviceSpeakerForTTS];
    if (v4 > 3) {
      uint64_t v5 = 1LL;
    }
    else {
      uint64_t v5 = qword_100082938[v4];
    }
    v2->_voiceFeedbackSetting = v5;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.siri.AudioAccessoryQueue", 0LL);
    audioAccessoryQueue = v2->_audioAccessoryQueue;
    v2->_audioAccessoryQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemAudioContext](&OBJC_CLASS___AVOutputContext, "sharedSystemAudioContext"));
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v8;

    -[SRModeSystemState _fetchConnectedAudioAccessoryState](v2, "_fetchConnectedAudioAccessoryState");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v2 selector:"_connectedOutputDevicesDidChange:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_connectedOutputDevicesDidChange:" name:AVOutputContextOutputDevicesDidChangeNotification object:0];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.siri.mode.SystemState", 0LL);
    v13 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  @"com.apple.springboard.ringerstate",  1LL,  v12,  0LL);
    ringerStateObserver = v2->_ringerStateObserver;
    v2->_ringerStateObserver = v13;
  }

  return v2;
}

- (BOOL)userTypedInSiri
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  id v3 = [v2 requestSource];

  return v3 == (id)32 || v3 == (id)23;
}

- (BOOL)isVoiceTriggerRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  id v4 = [v3 requestSource];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 speechRequestOptions]);
  id v7 = [v6 activationEvent];

  BOOL v10 = v4 == (id)18 && v7 == (id)15 || v4 == (id)44;
  return v4 == (id)8 || v10;
}

- (BOOL)isConnectedToCarPlay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  unsigned __int8 v3 = [v2 isConnectedToCarPlay];

  return v3;
}

- (BOOL)isForCarDND
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  unsigned __int8 v3 = [v2 isForCarDND];

  return v3;
}

- (BOOL)isEyesFree
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  unsigned __int8 v3 = [v2 isForEyesFree];

  return v3;
}

- (BOOL)isConnectedToAudioAccessory
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  audioAccessoryQueue = (dispatch_queue_s *)self->_audioAccessoryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008E94;
  v5[3] = &unk_1000BA028;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioAccessoryQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isScreenOffBeforeRequest
{
  return 0;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  unint64_t v3 = (unint64_t)[v2 requestSource];

  return (v3 > 0x37) | (0x37800E1880000EuLL >> v3) & 1;
}

- (BOOL)isDeviceSilentMode
{
  return -[AFNotifyObserver state](self->_ringerStateObserver, "state") == 0LL;
}

- (BOOL)isRequestEmergencyCall
{
  return 0;
}

- (id)description
{
  *(void *)&double v3 = objc_opt_class(self, a2).n128_u64[0];
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p",  v3,  v4,  self));
  v23[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"userTypedInSiri=%i",  -[SRModeSystemState userTypedInSiri](self, "userTypedInSiri")));
  v23[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"userTouchedSnippet=%i",  -[SRModeSystemState userTouchedSnippet](self, "userTouchedSnippet")));
  v23[2] = v20;
  unint64_t v5 = -[SRModeSystemState voiceFeedbackSetting](self, "voiceFeedbackSetting");
  uint64_t v6 = @"SRModeVoiceFeedbackPreferSilentResponses";
  if (v5 == 1) {
    uint64_t v6 = @"SRModeVoiceFeedbackAutomatic";
  }
  if (v5 == 2) {
    uint64_t v6 = @"SRModeVoiceFeedbackPreferSpokenResponses";
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"voiceFeedbackSetting=%@",  v6));
  v23[3] = v19;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isVoiceTriggerRequest=%i",  -[SRModeSystemState isVoiceTriggerRequest](self, "isVoiceTriggerRequest")));
  v23[4] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isConnectedToCarPlay=%i",  -[SRModeSystemState isConnectedToCarPlay](self, "isConnectedToCarPlay")));
  v23[5] = v8;
  char v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isForCarDND=%i",  -[SRModeSystemState isForCarDND](self, "isForCarDND")));
  v23[6] = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isEyesFree=%i",  -[SRModeSystemState isEyesFree](self, "isEyesFree")));
  v23[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isConnectedToAudioAccessory=%i",  -[SRModeSystemState isConnectedToAudioAccessory](self, "isConnectedToAudioAccessory")));
  v23[8] = v11;
  dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isScreenOffBeforeRequest=%i",  -[SRModeSystemState isScreenOffBeforeRequest](self, "isScreenOffBeforeRequest")));
  v23[9] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isRequestMadeWithPhysicalDeviceInteraction=%i",  -[SRModeSystemState isRequestMadeWithPhysicalDeviceInteraction]( self,  "isRequestMadeWithPhysicalDeviceInteraction")));
  v23[10] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isDeviceSilentMode=%i",  -[SRModeSystemState isDeviceSilentMode](self, "isDeviceSilentMode")));
  v23[11] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"isRequestEmergencyCall=%i",  -[SRModeSystemState isRequestEmergencyCall](self, "isRequestEmergencyCall")));
  v23[12] = v15;
  v23[13] = @">";
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 14LL));

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsJoinedByString:@"; "]);
  return v17;
}

- (id)_requestOptions
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
  if ([v3 requestSource] != (id)9)
  {

    goto LABEL_5;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originalRequestOptions]);

  if (!v5)
  {
LABEL_5:
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
    return v7;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 originalRequestOptions]);

  return v7;
}

- (void)_fetchConnectedAudioAccessoryState
{
  self->_connectedToAudioAccessory = 0;
  objc_initWeak(&location, self);
  audioAccessoryQueue = (dispatch_queue_s *)self->_audioAccessoryQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000093E8;
  v4[3] = &unk_1000B9F38;
  objc_copyWeak(&v5, &location);
  dispatch_async(audioAccessoryQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SRModeSystemState _connectedOutputDevicesDidChange:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #modes: output devices changed, re-fetching connected audio accessory state",  (uint8_t *)&v5,  0xCu);
  }

  -[SRModeSystemState _fetchConnectedAudioAccessoryState](self, "_fetchConnectedAudioAccessoryState");
}

- (SASRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
}

- (void)setUserTypedInSiri:(BOOL)a3
{
  self->_userTypedInSiri = a3;
}

- (BOOL)userTouchedSnippet
{
  return self->_userTouchedSnippet;
}

- (void)setUserTouchedSnippet:(BOOL)a3
{
  self->_userTouchedSnippet = a3;
}

- (unint64_t)voiceFeedbackSetting
{
  return self->_voiceFeedbackSetting;
}

- (void)setVoiceFeedbackSetting:(unint64_t)a3
{
  self->_voiceFeedbackSetting = a3;
}

- (void).cxx_destruct
{
}

@end