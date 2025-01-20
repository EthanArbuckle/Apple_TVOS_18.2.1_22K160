@interface AVIndependentSoundInput
- (AFNotifyObserver)siriObserver;
- (AVAudioEngine)audioEngine;
- (AVAudioFormat)expectedFormat;
- (AVIndependentSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4;
- (BOOL)audioSessionSetupCompleted;
- (BOOL)isRecording;
- (BOOL)setupAudioSession;
- (BOOL)startRecording:(int)a3;
- (BOOL)startRunningAudioEngine;
- (id)deliverSamples;
- (void)_addRecordedSpeechSampleData:(signed __int16 *)a3 length:(unsigned int)a4;
- (void)_appendPCMBuffer:(id)a3;
- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3;
- (void)_drainAndClearAudioConverter;
- (void)_handleConfigurationChangeNotification:(id)a3;
- (void)activateNotifications;
- (void)deactivateNotifications;
- (void)dealloc;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)setAudioEngine:(id)a3;
- (void)setDeliverSamples:(id)a3;
- (void)setExpectedFormat:(id)a3;
- (void)setSiriObserver:(id)a3;
- (void)stopRecording;
- (void)stopRunningAudioEngine;
@end

@implementation AVIndependentSoundInput

- (AVIndependentSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AVIndependentSoundInput;
  v6 = -[AVIndependentSoundInput init](&v12, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("RDAudioBufferQueue", 0LL);
    v6->_avAudioBufferQueue = (OS_dispatch_queue *)v7;
    dispatch_queue_set_specific(v7, v6, v6, 0LL);
    v6->_expectedFormat = (AVAudioFormat *)a3;
    v6->_deliverSamples = _Block_copy(a4);
    v6->_audioEngine = objc_alloc_init(&OBJC_CLASS___AVAudioEngine);
    unsigned __int8 v8 = -[AVIndependentSoundInput setupAudioSession](v6, "setupAudioSession");
    v6->_audioSessionSetupCompleted = v8;
    if ((v8 & 1) == 0)
    {
      v9 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "AVI:ERROR in setting up the audio session",  v11,  2u);
      }

      return 0LL;
    }
  }

  return v6;
}

- (BOOL)setupAudioSession
{
  uint64_t v11 = 0LL;
  id v2 = objc_alloc_init(&OBJC_CLASS___AVAudioSessionRouteControl);
  [v2 setRouteControlOptions:1];
  -[AVAudioSession setPreferredRouteControlConfig:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setPreferredRouteControlConfig:error:",  v2,  &v11);
  if (v11)
  {
    v3 = (os_log_s *)RXOSLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v11;
      v5 = "AVI:Error setting preffered route: %@";
LABEL_7:
      v6 = v3;
      uint32_t v7 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
      LOBYTE(v4) = 0;
    }
  }

  else
  {
    -[AVAudioSession setCategory:withOptions:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setCategory:withOptions:error:",  AVAudioSessionCategoryRecord,  131073LL,  &v11);
    if (v11)
    {
      v3 = (os_log_s *)RXOSLog();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v11;
        v5 = "AVI:Error setting audio session category: %@";
        goto LABEL_7;
      }
    }

    else
    {
      -[AVAudioSession preferredRouteControlConfig]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "preferredRouteControlConfig");
      if ([v2 routeControlOptions] != (id)1)
      {
        unsigned __int8 v8 = (os_log_s *)RXOSLog();
        BOOL v4 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        *(_WORD *)buf = 0;
        v5 = "AVI:no independent route";
        v6 = v8;
        uint32_t v7 = 2;
        goto LABEL_8;
      }

      -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setAllowHapticsAndSystemSoundsDuringRecording:error:",  1LL,  &v11);
      if (v11)
      {
        v3 = (os_log_s *)RXOSLog();
        BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v11;
        v5 = "AVI:Error setting haptics and sounds during recording: %@";
        goto LABEL_7;
      }

      if (_os_feature_enabled_impl("VirtualAudio", "Oneness"))
      {
        v9 = +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance");
        -[AVAudioSession setMXSessionProperty:value:error:]( v9,  "setMXSessionProperty:value:error:",  kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl,  &__kCFBooleanTrue,  &v11);
        if (v11)
        {
          v3 = (os_log_s *)RXOSLog();
          BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
          if (!v4) {
            return v4;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v11;
          v5 = "AVI:Error setting MX property for non-interruption: %@";
          goto LABEL_7;
        }
      }

      LOBYTE(v4) = 1;
    }
  }

  return v4;
}

- (void)activateNotifications
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AVI:AV activateNotifications", v6, 2u);
  }

  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleConfigurationChangeNotification:",  AVAudioEngineConfigurationChangeNotification,  self->_audioEngine);
  if (objc_opt_class(&OBJC_CLASS___AFNotifyObserver))
  {
    BOOL v4 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
    v5 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    self->_siriObserver = -[AFNotifyObserver initWithName:options:queue:delegate:]( v5,  "initWithName:options:queue:delegate:",  v4,  1LL,  gRDServerQueue,  self);
  }

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  unsigned __int8 v8 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218240;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "AF notification didChangeStateFrom %lld to %lld ",  (uint8_t *)&v19,  0x16u);
  }

  v9 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((a5 & 4) != 0) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Siri is listening: %@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v11 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((a5 & 8) != 0) {
      objc_super v12 = @"YES";
    }
    else {
      objc_super v12 = @"NO";
    }
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri is speaking: %@", (uint8_t *)&v19, 0xCu);
  }

  unint64_t v13 = a5 & 0xFFFFFFFFFFFFFFFDLL;
  v14 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      v15 = @"NO";
    }
    else {
      v15 = @"YES";
    }
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Siri is idle: %@", (uint8_t *)&v19, 0xCu);
  }

  unsigned int v16 = -[AVIndependentSoundInput isRecording](self, "isRecording");
  if (v13)
  {
    if (v16)
    {
      v17 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Stop recording from Independent VAD since Siri is active",  (uint8_t *)&v19,  2u);
      }

      -[AVIndependentSoundInput stopRecording](self, "stopRecording");
    }
  }

  else if ((v16 & 1) == 0)
  {
    v18 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Start recording Independent VAD since Siri is Idle",  (uint8_t *)&v19,  2u);
    }

    -[AVIndependentSoundInput startRecording:](self, "startRecording:", 0LL);
  }

- (void)deactivateNotifications
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AVI:AV deactivateNotifications", v4, 2u);
  }

  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioEngineConfigurationChangeNotification,  self->_audioEngine);
}

- (void)_handleConfigurationChangeNotification:(id)a3
{
  v5 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AVI::Audio configuration changed = %@",  buf,  0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B588;
  block[3] = &unk_1000CDBC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)gRDServerQueue, block);
}

- (BOOL)startRecording:(int)a3
{
  BOOL v4 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AVI:startRecording", buf, 2u);
  }

  if (+[RDSoundInputImpl_iOS_Shared isSystemSleeping](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isSystemSleeping"))
  {
    v5 = (os_log_s *)RXOSLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v7) = 0;
    if (!v6) {
      return v7;
    }
    *(_WORD *)buf = 0;
    id v8 = "AVI:System is sleeping, so don't start recording";
    goto LABEL_6;
  }

  if (-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
  {
    objc_super v12 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v13 = "AVI:AV is already running";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }

    goto LABEL_19;
  }

  -[AVIndependentSoundInput stopRunningAudioEngine](self, "stopRunningAudioEngine");
  id v27 = 0LL;
  if (!-[AVIndependentSoundInput audioSessionSetupCompleted](self, "audioSessionSetupCompleted"))
  {
    unsigned __int8 v14 = -[AVAudioSession setActive:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setActive:error:",  1LL,  &v27);
    v15 = (os_log_s *)RXOSLog();
    unsigned int v16 = v15;
    if ((v14 & 1) == 0)
    {
      BOOL v7 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      id v22 = v27;
      id v23 = [v27 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v23;
      id v8 = "AVI:AVAudioSession set active failed with error code:{%@}, error message: {%@}";
      v9 = v16;
      goto LABEL_30;
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AVI:Audio Session already active", buf, 2u);
    }
  }

  -[AVIndependentSoundInput activateNotifications](self, "activateNotifications");
  unsigned int v17 = -[AVIndependentSoundInput startRunningAudioEngine](self, "startRunningAudioEngine");
  v18 = (os_log_s *)RXOSLog();
  objc_super v12 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v13 = "AVI:Started Recording from AV";
      goto LABEL_18;
    }

- (BOOL)startRunningAudioEngine
{
  v3 = -[AVAudioEngine inputNode](self->_audioEngine, "inputNode");
  id v4 = -[AVAudioInputNode inputFormatForBus:](v3, "inputFormatForBus:", 0LL);
  if ([v4 channelCount])
  {
    -[AVAudioSession availableInputs]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "availableInputs");
    -[AVAudioInputNode removeTapOnBus:](v3, "removeTapOnBus:", 0LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000BAC4;
    v10[3] = &unk_1000CE080;
    v10[4] = self;
    -[AVAudioInputNode installTapOnBus:bufferSize:format:block:]( v3,  "installTapOnBus:bufferSize:format:block:",  0LL,  1024LL,  v4,  v10);
    uint64_t v9 = 0LL;
    BOOL v5 = -[AVAudioEngine startAndReturnError:](self->_audioEngine, "startAndReturnError:", &v9);
    if (!v5)
    {
      BOOL v6 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AVI:Error Starting engine: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    BOOL v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "AVI:No audio input available, channel count 0",  buf,  2u);
    }

    return 0;
  }

  return v5;
}

- (void)stopRunningAudioEngine
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AVI:stopRunningAudioEngine", v4, 2u);
  }

  -[AVAudioInputNode removeTapOnBus:]( -[AVAudioEngine inputNode](self->_audioEngine, "inputNode"),  "removeTapOnBus:",  0LL);
  -[AVAudioEngine stop](self->_audioEngine, "stop");
}

- (void)stopRecording
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AVI:StopRecording from AV", buf, 2u);
  }

  -[AVIndependentSoundInput deactivateNotifications](self, "deactivateNotifications");
  -[AVIndependentSoundInput stopRunningAudioEngine](self, "stopRunningAudioEngine");
  if (dispatch_get_specific(self) == self)
  {
    -[AVIndependentSoundInput _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");
  }

  else
  {
    avAudioBufferQueue = self->_avAudioBufferQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000BD70;
    block[3] = &unk_1000CDBC8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)avAudioBufferQueue, block);
  }

  -[AVAudioSession setActive:withOptions:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance", 0LL),  "setActive:withOptions:error:",  0LL,  1LL,  &v6);
  if (v6)
  {
    BOOL v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "AVI:stopRecording : error stopping AVAudioSession: %@",  buf,  0xCu);
    }
  }

- (BOOL)isRecording
{
  return -[AVAudioEngine isRunning](-[AVIndependentSoundInput audioEngine](self, "audioEngine"), "isRunning");
}

- (void)dealloc
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "AVI:Deallocating RDSoundInputImpl_iOS_Independent_AV",  buf,  2u);
  }

  if (-[AVIndependentSoundInput isRecording](self, "isRecording")) {
    -[AVIndependentSoundInput stopRecording](self, "stopRecording");
  }

  id deliverSamples = self->_deliverSamples;
  if (deliverSamples)
  {
    _Block_release(deliverSamples);
    self->_id deliverSamples = 0LL;
  }

  if (dispatch_get_specific(self) != self) {
    dispatch_sync((dispatch_queue_t)self->_avAudioBufferQueue, &stru_1000CE0A0);
  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_avAudioBufferQueue, self, 0LL, 0LL);

  expectedFormat = self->_expectedFormat;
  if (expectedFormat) {

  }
  converter = self->_converter;
  if (converter) {

  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AVIndependentSoundInput;
  -[AVIndependentSoundInput dealloc](&v7, "dealloc");
}

- (void)_appendPCMBuffer:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "format"), "isEqual:", self->_expectedFormat))
  {
    -[AVIndependentSoundInput _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");
    uint64_t v6 = [a3 int16ChannelData];
    if (!v6) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"RDSoundInputImpl_iOS_Independent_AV.m",  293LL,  @"Invalid audio format");
    }
    -[AVIndependentSoundInput _addRecordedSpeechSampleData:length:]( self,  "_addRecordedSpeechSampleData:length:",  *v6,  [a3 frameLength]);
  }

  else
  {
    -[AVIndependentSoundInput _convertAndFeedPCMBufferAVAudioPCMBuffer:]( self,  "_convertAndFeedPCMBufferAVAudioPCMBuffer:",  a3);
  }

- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3
{
  id v6 = [a3 format];
  expectedFormat = self->_expectedFormat;
  if (!-[AVAudioFormat isEqual:](-[AVAudioConverter inputFormat](self->_converter, "inputFormat"), "isEqual:", v6))
  {
    -[AVIndependentSoundInput _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");

    id v8 = -[AVAudioConverter initFromFormat:toFormat:]( objc_alloc(&OBJC_CLASS___AVAudioConverter),  "initFromFormat:toFormat:",  v6,  expectedFormat);
    self->_converter = v8;
    -[AVAudioConverter setSampleRateConverterQuality:](v8, "setSampleRateConverterQuality:", 127LL);
  }

  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  char v18 = 0;
  uint64_t v9 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( objc_alloc(&OBJC_CLASS___AVAudioPCMBuffer),  "initWithPCMFormat:frameCapacity:",  self->_expectedFormat,  8000LL);
  -[AVAudioPCMBuffer setFrameLength:](v9, "setFrameLength:", 8000LL);
  do
  {
    converter = self->_converter;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000C1A8;
    v15[3] = &unk_1000CE0C8;
    v15[4] = a3;
    v15[5] = v17;
    id v11 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:]( converter,  "convertToBuffer:error:withInputFromBlock:",  v9,  &v16,  v15);
    id v12 = v11;
    if (v11 == (id)2) {
      break;
    }
    if (v11 == (id)3)
    {
      unsigned __int8 v14 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "AVI:Could not run audio converter %@",  buf,  0xCu);
      }

      break;
    }

    unint64_t v13 = -[AVAudioPCMBuffer int16ChannelData](v9, "int16ChannelData");
    if (!v13) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"RDSoundInputImpl_iOS_Independent_AV.m",  341LL,  @"Invalid audio format");
    }
    -[AVIndependentSoundInput _addRecordedSpeechSampleData:length:]( self,  "_addRecordedSpeechSampleData:length:",  *v13,  -[AVAudioPCMBuffer frameLength](v9, "frameLength"));
  }

  while (v12 != (id)1);
  if (v9) {

  }
  _Block_object_dispose(v17, 8);
}

- (void)_addRecordedSpeechSampleData:(signed __int16 *)a3 length:(unsigned int)a4
{
  id deliverSamples = (void (**)(id, signed __int16 *, void))self->_deliverSamples;
  if (deliverSamples) {
    deliverSamples[2](deliverSamples, a3, a4);
  }
}

- (void)_drainAndClearAudioConverter
{
  if (self->_converter)
  {
    id v4 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( objc_alloc(&OBJC_CLASS___AVAudioPCMBuffer),  "initWithPCMFormat:frameCapacity:",  self->_expectedFormat,  8000LL);
    -[AVAudioPCMBuffer setFrameLength:](v4, "setFrameLength:", 8000LL);
    do
    {
      AVAudioConverterOutputStatus v5 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:]( self->_converter,  "convertToBuffer:error:withInputFromBlock:",  v4,  &v10,  &stru_1000CE108);
      if (v5 == AVAudioConverterOutputStatus_EndOfStream) {
        break;
      }
      AVAudioConverterOutputStatus v6 = v5;
      if (v5 == AVAudioConverterOutputStatus_Error)
      {
        id v8 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v12 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "AVI:Could not drain converter %@",  buf,  0xCu);
        }

        break;
      }

      objc_super v7 = -[AVAudioPCMBuffer int16ChannelData](v4, "int16ChannelData");
      if (!v7) {
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"RDSoundInputImpl_iOS_Independent_AV.m",  388LL,  @"Invalid audio format");
      }
      -[AVIndependentSoundInput _addRecordedSpeechSampleData:length:]( self,  "_addRecordedSpeechSampleData:length:",  *v7,  -[AVAudioPCMBuffer frameLength](v4, "frameLength"));
    }

    while (v6 != AVAudioConverterOutputStatus_InputRanDry);
    converter = self->_converter;
    if (converter) {

    }
    self->_converter = 0LL;
    if (v4) {
  }
    }

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
}

- (id)deliverSamples
{
  return self->_deliverSamples;
}

- (void)setDeliverSamples:(id)a3
{
}

- (AVAudioFormat)expectedFormat
{
  return self->_expectedFormat;
}

- (void)setExpectedFormat:(id)a3
{
}

- (BOOL)audioSessionSetupCompleted
{
  return self->_audioSessionSetupCompleted;
}

- (AFNotifyObserver)siriObserver
{
  return self->_siriObserver;
}

- (void)setSiriObserver:(id)a3
{
}

@end