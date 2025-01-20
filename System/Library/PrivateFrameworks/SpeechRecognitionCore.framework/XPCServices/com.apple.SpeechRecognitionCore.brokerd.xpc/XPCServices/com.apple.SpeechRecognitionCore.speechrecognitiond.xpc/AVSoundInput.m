@interface AVSoundInput
- (AVAudioEngine)audioEngine;
- (AVAudioFormat)expectedFormat;
- (AVSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4;
- (BOOL)isRecording;
- (BOOL)setupAudioSession;
- (BOOL)setupDefaultAudioSession:(unint64_t)a3;
- (BOOL)startRecording:(int)a3;
- (BOOL)startRunningAudioEngine;
- (id)deliverSamples;
- (void)_addRecordedSpeechSampleData:(signed __int16 *)a3 length:(unsigned int)a4;
- (void)_appendPCMBuffer:(id)a3;
- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3;
- (void)_didReceiveSiriSettingChanged:(BOOL)a3;
- (void)_drainAndClearAudioConverter;
- (void)_handleAudioSessionInterruption:(id)a3;
- (void)_handleConfigurationChangeNotification:(id)a3;
- (void)_handleRouteChange:(id)a3;
- (void)_recordingStateChanged:(id)a3;
- (void)activateNotifications;
- (void)deactivateNotifications;
- (void)dealloc;
- (void)setAudioEngine:(id)a3;
- (void)setDeliverSamples:(id)a3;
- (void)setExpectedFormat:(id)a3;
- (void)stopRecording;
@end

@implementation AVSoundInput

- (AVSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AVSoundInput;
  v6 = -[AVSoundInput init](&v16, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("RDAudioBufferQueue", 0LL);
    v6->_avAudioBufferQueue = (OS_dispatch_queue *)v7;
    dispatch_queue_set_specific(v7, v6, v6, 0LL);
    v6->_expectedFormat = (AVAudioFormat *)a3;
    v6->_deliverSamples = _Block_copy(a4);
    v6->_isHearstConnectedFlag = +[RDSoundInputImpl isHearstConnected]( &OBJC_CLASS___RDSoundInputImpl,  "isHearstConnected");
    v6->_isSiriEnabled = AFPreferencesAssistantEnabled() != 0;
    v6->_isNotificationActivated = 0;
    v6->_audioEngine = objc_alloc_init(&OBJC_CLASS___AVAudioEngine);
    id v8 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
    uint64_t v19 = AVSystemController_SomeClientIsActiveDidChangeNotification;
    v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
    [v8 setAttribute:v9 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v15];
    if (v15)
    {
      id v10 = [v15 description];
      v11 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [v10 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "AVSystemController_SubscribeToNotificationsAttribute Failed, Error = %s",  buf,  0xCu);
      }
    }

    if (!-[AVSoundInput setupAudioSession](v6, "setupAudioSession"))
    {
      v13 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "ERROR in setting up the audio session",  buf,  2u);
      }
    }
  }

  return v6;
}

- (BOOL)setupAudioSession
{
  uint64_t v13 = 0LL;
  -[AVAudioSession setPrefersNoMicrophoneUsageIndicator:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setPrefersNoMicrophoneUsageIndicator:error:",  1LL,  &v13);
  if (v13)
  {
    v3 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SRC:Failed to suppress mic indicator", buf, 2u);
    }

    uint64_t v13 = 0LL;
  }

  -[AVAudioSession setCategory:withOptions:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setCategory:withOptions:error:",  AVAudioSessionCategoryPlayAndRecord,  41LL,  &v13);
  if (v13)
  {
    v4 = (os_log_s *)RXOSLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v13;
      v6 = "startRecording error setting AVAudioSession category: %@";
LABEL_8:
      v7 = v4;
      uint32_t v8 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      LOBYTE(v5) = 0;
    }
  }

  else
  {
    self->_isUsingTelephonyVAD = 0;
    if (!-[AVSoundInput setupDefaultAudioSession:](self, "setupDefaultAudioSession:", 41LL))
    {
      id v10 = (os_log_s *)RXOSLog();
      BOOL v5 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_WORD *)buf = 0;
      v6 = "failed to setupDefaultAudioSession";
      v7 = v10;
      uint32_t v8 = 2;
      goto LABEL_9;
    }

    -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setAllowHapticsAndSystemSoundsDuringRecording:error:",  1LL,  &v13);
    if (v13)
    {
      v9 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "startRecording error setting haptics: %@",  buf,  0xCu);
      }

      uint64_t v13 = 0LL;
    }

    -[AVAudioSession preferDecoupledIO:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "preferDecoupledIO:error:",  1LL,  &v13);
    if (v13)
    {
      v4 = (os_log_s *)RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v13;
      v6 = "startRecording error setting AVAudioSession DecoupledIO: %@";
      goto LABEL_8;
    }

    if (_os_feature_enabled_impl("VirtualAudio", "Oneness"))
    {
      v11 = +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance");
      -[AVAudioSession setMXSessionProperty:value:error:]( v11,  "setMXSessionProperty:value:error:",  kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl,  &__kCFBooleanTrue,  &v13);
      if (v13)
      {
        v4 = (os_log_s *)RXOSLog();
        BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v13;
        v6 = "AV:Error setting MX property for non-interruption: %@";
        goto LABEL_8;
      }
    }

    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)setupDefaultAudioSession:(unint64_t)a3
{
  uint64_t v10 = 0LL;
  -[AVAudioSession setCategory:withOptions:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setCategory:withOptions:error:",  AVAudioSessionCategoryPlayAndRecord,  a3,  &v10);
  if (v10)
  {
    v4 = (os_log_s *)RXOSLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v10;
      v6 = "startRecording error setting AVAudioSession category: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      LOBYTE(v5) = 0;
    }
  }

  else if (+[RDSoundInputImpl isCallActive](&OBJC_CLASS___RDSoundInputImpl, "isCallActive") {
         && +[RDSoundInputImpl isHearstConnected](&OBJC_CLASS___RDSoundInputImpl, "isHearstConnected"))
  }
  {
    v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Another call is active and AirPods connected",  buf,  2u);
    }

    -[AVAudioSession setAudioHardwareControlFlags:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setAudioHardwareControlFlags:error:",  0LL,  &v10);
    if (v10)
    {
      v4 = (os_log_s *)RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v10;
        v6 = "startRecording error setting AVAudioSession hardware control flags to 0: %@";
        goto LABEL_16;
      }
    }

    else
    {
      LOBYTE(v5) = 1;
      self->_isUsingTelephonyVAD = 1;
    }
  }

  else
  {
    uint32_t v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No other call is active or AirpPods are not connected",  buf,  2u);
    }

    -[AVAudioSession setAudioHardwareControlFlags:error:]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "setAudioHardwareControlFlags:error:",  18LL,  &v10);
    if (v10)
    {
      v4 = (os_log_s *)RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v10;
        v6 = "startRecording error setting AVAudioSession hardware control flags: %@";
        goto LABEL_16;
      }
    }

    else
    {
      self->_isUsingTelephonyVAD = 0;
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (BOOL)startRecording:(int)a3
{
  if (!+[RDSoundInputImpl_iOS_Shared isSystemSleeping](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isSystemSleeping"))
  {
    if (-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
    {
      if (a3 == 1 && self->_isUsingTelephonyVAD)
      {
        v11 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v12 = "AV is already running using Telephony VAD";
LABEL_14:
          uint64_t v13 = v11;
          uint32_t v14 = 2;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          goto LABEL_16;
        }

        goto LABEL_16;
      }

      if (a3 != 1 && !self->_isUsingTelephonyVAD)
      {
        v11 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v12 = "AV is already running";
          goto LABEL_14;
        }

- (BOOL)startRunningAudioEngine
{
  v3 = -[AVAudioEngine inputNode](self->_audioEngine, "inputNode");
  id v4 = -[AVAudioInputNode inputFormatForBus:](v3, "inputFormatForBus:", 0LL);
  if ([v4 channelCount])
  {
    -[AVAudioInputNode removeTapOnBus:](v3, "removeTapOnBus:", 0LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000D074;
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
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error Starting engine: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    BOOL v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "No audio input available, channel count 0",  buf,  2u);
    }

    return 0;
  }

  return v5;
}

- (void)stopRecording
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "StopRecording from AV", buf, 2u);
  }

  -[AVAudioInputNode removeTapOnBus:]( -[AVAudioEngine inputNode](self->_audioEngine, "inputNode"),  "removeTapOnBus:",  0LL);
  -[AVAudioEngine stop](self->_audioEngine, "stop");
  if (dispatch_get_specific(self) == self)
  {
    -[AVSoundInput _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");
  }

  else
  {
    avAudioBufferQueue = self->_avAudioBufferQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000D2B0;
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
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "stopRecording : error stopping AVAudioSession: %@",  buf,  0xCu);
    }
  }

- (BOOL)isRecording
{
  return -[AVAudioEngine isRunning](-[AVSoundInput audioEngine](self, "audioEngine"), "isRunning");
}

- (void)dealloc
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocating RDSoundInputImpl_iOS_AV", buf, 2u);
  }

  -[AVSoundInput stopRecording](self, "stopRecording");

  -[AVSoundInput deactivateNotifications](self, "deactivateNotifications");
  id deliverSamples = self->_deliverSamples;
  if (deliverSamples)
  {
    _Block_release(deliverSamples);
    self->_id deliverSamples = 0LL;
  }

  if (dispatch_get_specific(self) != self) {
    dispatch_sync((dispatch_queue_t)self->_avAudioBufferQueue, &stru_1000CE128);
  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_avAudioBufferQueue, self, 0LL, 0LL);

  BOOL v5 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "released RDAudioBufferQueue", buf, 2u);
  }

  expectedFormat = self->_expectedFormat;
  if (expectedFormat) {

  }
  converter = self->_converter;
  if (converter) {

  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AVSoundInput;
  -[AVSoundInput dealloc](&v8, "dealloc");
}

- (void)_appendPCMBuffer:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "format"), "isEqual:", self->_expectedFormat))
  {
    -[AVSoundInput _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");
    uint64_t v6 = [a3 int16ChannelData];
    if (!v6) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"RDSoundInputImpl_iOS_AV.m",  316LL,  @"Invalid audio format");
    }
    -[AVSoundInput _addRecordedSpeechSampleData:length:]( self,  "_addRecordedSpeechSampleData:length:",  *v6,  [a3 frameLength]);
  }

  else
  {
    -[AVSoundInput _convertAndFeedPCMBufferAVAudioPCMBuffer:](self, "_convertAndFeedPCMBufferAVAudioPCMBuffer:", a3);
  }

- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3
{
  id v6 = [a3 format];
  expectedFormat = self->_expectedFormat;
  if (!-[AVAudioFormat isEqual:](-[AVAudioConverter inputFormat](self->_converter, "inputFormat"), "isEqual:", v6))
  {
    -[AVSoundInput _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");

    objc_super v8 = -[AVAudioConverter initFromFormat:toFormat:]( objc_alloc(&OBJC_CLASS___AVAudioConverter),  "initFromFormat:toFormat:",  v6,  expectedFormat);
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
    v15[2] = sub_10000D770;
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
      uint32_t v14 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not run audio converter %@", buf, 0xCu);
      }

      break;
    }

    uint64_t v13 = -[AVAudioPCMBuffer int16ChannelData](v9, "int16ChannelData");
    if (!v13) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"RDSoundInputImpl_iOS_AV.m",  364LL,  @"Invalid audio format");
    }
    -[AVSoundInput _addRecordedSpeechSampleData:length:]( self,  "_addRecordedSpeechSampleData:length:",  *v13,  -[AVAudioPCMBuffer frameLength](v9, "frameLength"));
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
      AVAudioConverterOutputStatus v5 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:]( self->_converter,  "convertToBuffer:error:withInputFromBlock:",  v4,  &v10,  &stru_1000CE148);
      if (v5 == AVAudioConverterOutputStatus_EndOfStream) {
        break;
      }
      AVAudioConverterOutputStatus v6 = v5;
      if (v5 == AVAudioConverterOutputStatus_Error)
      {
        objc_super v8 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not drain converter %@", buf, 0xCu);
        }

        break;
      }

      BOOL v7 = -[AVAudioPCMBuffer int16ChannelData](v4, "int16ChannelData");
      if (!v7) {
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"RDSoundInputImpl_iOS_AV.m",  411LL,  @"Invalid audio format");
      }
      -[AVSoundInput _addRecordedSpeechSampleData:length:]( self,  "_addRecordedSpeechSampleData:length:",  *v7,  -[AVAudioPCMBuffer frameLength](v4, "frameLength"));
    }

    while (v6 != AVAudioConverterOutputStatus_InputRanDry);
    converter = self->_converter;
    if (converter) {

    }
    self->_converter = 0LL;
    if (v4) {
  }
    }

- (void)activateNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = objc_loadWeak(&location);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v4,  (CFNotificationCallback)sub_10000DB98,  kAFPreferencesDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  if (!self->_isSiriEnabled)
  {
    uint64_t v9 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Activating notifications with Siri disabled",  v10,  2u);
    }

    BOOL v7 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    objc_super v8 = +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance");
    goto LABEL_9;
  }

  AVAudioConverterOutputStatus v5 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activating notifications with Siri enabled",  buf,  2u);
  }

  AVAudioConverterOutputStatus v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  self,  "_recordingStateChanged:",  AVSystemController_SomeClientIsActiveDidChangeNotification,  +[AVSystemController sharedInstance](&OBJC_CLASS___AVSystemController, "sharedInstance"));
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleRouteChange:",  AVAudioSessionRouteChangeNotification,  +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  if (self->_isHearstConnectedFlag)
  {
    BOOL v7 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    objc_super v8 = +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance");
LABEL_9:
    -[NSNotificationCenter addObserver:selector:name:object:]( v7,  "addObserver:selector:name:object:",  self,  "_handleAudioSessionInterruption:",  AVAudioSessionInterruptionNotification,  v8);
  }

  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleConfigurationChangeNotification:",  AVAudioEngineConfigurationChangeNotification,  self->_audioEngine);
  self->_isNotificationActivated = 1;
  objc_destroyWeak(&location);
}

- (void)deactivateNotifications
{
  if (self->_isNotificationActivated)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFPreferencesDidChangeDarwinNotification, 0LL);
    BOOL isSiriEnabled = self->_isSiriEnabled;
    AVAudioConverterOutputStatus v5 = (os_log_s *)RXOSLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (isSiriEnabled)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Dectivating notifications with Siri enabled",  buf,  2u);
      }

      if (self->_isHearstConnectedFlag) {
        -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioSessionInterruptionNotification,  0LL);
      }
      BOOL v7 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter removeObserver:name:object:]( v7,  "removeObserver:name:object:",  self,  AVSystemController_SomeClientIsActiveDidChangeNotification,  0LL);
      objc_super v8 = &AVAudioSessionRouteChangeNotification;
    }

    else
    {
      if (v6)
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Dectivating notifications with Siri disabled",  v9,  2u);
      }

      objc_super v8 = &AVAudioSessionInterruptionNotification;
    }

    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  *v8,  0LL);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioEngineConfigurationChangeNotification,  self->_audioEngine);
    self->_isNotificationActivated = 0;
  }

- (void)_didReceiveSiriSettingChanged:(BOOL)a3
{
  if (self->_isSiriEnabled != a3)
  {
    BOOL v3 = a3;
    self->_BOOL isSiriEnabled = a3;
    AVAudioConverterOutputStatus v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    if (v3)
    {
      -[NSNotificationCenter removeObserver:name:object:]( v5,  "removeObserver:name:object:",  self,  AVAudioSessionInterruptionNotification,  0LL);
      -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioEngineConfigurationChangeNotification,  0LL);
      BOOL v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  self,  "_recordingStateChanged:",  AVSystemController_SomeClientIsActiveDidChangeNotification,  +[AVSystemController sharedInstance](&OBJC_CLASS___AVSystemController, "sharedInstance"));
      -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleRouteChange:",  AVAudioSessionRouteChangeNotification,  +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      BOOL v7 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Stopping the AV session for CS to take over as Siri is enabled",  buf,  2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000E018;
      block[3] = &unk_1000CDBC8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }

    else
    {
      -[NSNotificationCenter removeObserver:name:object:]( v5,  "removeObserver:name:object:",  self,  AVSystemController_SomeClientIsActiveDidChangeNotification,  0LL);
      -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioSessionRouteChangeNotification,  0LL);
      -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleAudioSessionInterruption:",  AVAudioSessionInterruptionNotification,  +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleConfigurationChangeNotification:",  AVAudioEngineConfigurationChangeNotification,  self->_audioEngine);
    }
  }

- (void)_handleAudioSessionInterruption:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = objc_msgSend(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionTypeKey), "unsignedIntegerValue");
  unsigned __int8 v6 = objc_msgSend( objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionOptionKey),  "unsignedIntegerValue");
  if (v5)
  {
    if (v5 != (id)1) {
      return;
    }
    BOOL v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Interruption: Audio Interruption started",  buf,  2u);
    }

    objc_super v8 = (dispatch_queue_s *)gRDServerQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000E1A8;
    v13[3] = &unk_1000CDBC8;
    v13[4] = self;
    uint64_t v9 = v13;
    goto LABEL_11;
  }

  unsigned __int8 v10 = v6;
  id v11 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Interruption: Audio Interruption ended",  buf,  2u);
  }

  if ((v10 & 1) != 0 && !-[AVSoundInput isRecording](self, "isRecording"))
  {
    objc_super v8 = (dispatch_queue_s *)gRDServerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000E1CC;
    v12[3] = &unk_1000CDBC8;
    v12[4] = self;
    uint64_t v9 = v12;
LABEL_11:
    dispatch_async(v8, v9);
  }

- (void)_handleRouteChange:(id)a3
{
  int v4 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", AVAudioSessionRouteChangeReasonKey),  "intValue");
  if (v4 == 2)
  {
    if (self->_isHearstConnectedFlag
      && !+[RDSoundInputImpl isHearstConnected](&OBJC_CLASS___RDSoundInputImpl, "isHearstConnected"))
    {
      self->_isHearstConnectedFlag = 0;
      -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioSessionInterruptionNotification,  0LL);
      unsigned __int8 v6 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "handleRouteChange: AirPods are disconnected",  buf,  2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000E3B4;
      block[3] = &unk_1000CDBC8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }
  }

  else if (v4 == 1 {
         && !self->_isHearstConnectedFlag
  }
         && +[RDSoundInputImpl isHearstConnected](&OBJC_CLASS___RDSoundInputImpl, "isHearstConnected"))
  {
    self->_isHearstConnectedFlag = 1;
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_handleAudioSessionInterruption:",  AVAudioSessionInterruptionNotification,  +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "handleRouteChange: AirPods are connected",  buf,  2u);
    }
  }

- (void)_handleConfigurationChangeNotification:(id)a3
{
  id v5 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Audio configuration changed = %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E4D4;
  block[3] = &unk_1000CDBC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)gRDServerQueue, block);
}

- (void)_recordingStateChanged:(id)a3
{
  int v4 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering _recordingStateChanged", buf, 2u);
  }

  if (self->_isSiriEnabled)
  {
    id v5 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
    id v6 = [v5 attributeForKey:AVSystemController_ActiveClientPIDsThatHideTheSpeechDetectionDeviceAttribute];
    BOOL v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AVSystemController :: Recording state changed. List of recording client PIDs : %@",  buf,  0xCu);
    }

    if (!v6)
    {
      +[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent");
      return;
    }

    if (![v6 count]) {
      return;
    }
    if ([v6 count] == (id)1)
    {
      unsigned int v8 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 0), "intValue");
      if (v8 == getpid())
      {
        if (+[RDSoundInputImpl isHearstConnected](&OBJC_CLASS___RDSoundInputImpl, "isHearstConnected"))
        {
          uint64_t v9 = (os_log_s *)RXOSLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "AirPods are connected so keep the AV session active",  buf,  2u);
          }

          return;
        }

        if (!+[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent")) {
          return;
        }
        uint64_t v12 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Stopping the AV session for CS to take over",  buf,  2u);
        }

        unsigned __int8 v10 = (dispatch_queue_s *)gRDServerQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000E798;
        block[3] = &unk_1000CDBC8;
        block[4] = self;
        id v11 = block;
LABEL_22:
        dispatch_async(v10, v11);
        return;
      }
    }

    if (!+[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent")
      && (objc_msgSend( v6,  "containsObject:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid())) & 1) == 0 && !+[RDSoundInputImpl isCallActive](RDSoundInputImpl, "isCallActive"))
    {
      unsigned __int8 v10 = (dispatch_queue_s *)gRDServerQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10000E7A0;
      v13[3] = &unk_1000CDBC8;
      v13[4] = self;
      id v11 = v13;
      goto LABEL_22;
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

@end