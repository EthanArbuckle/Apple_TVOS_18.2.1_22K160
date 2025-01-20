@interface RDSoundInputImpl
+ (BOOL)isCSVADHidden;
+ (BOOL)isCSVADPresent;
+ (BOOL)isCallActive;
+ (BOOL)isHearstConnected;
- (AVIndependentSoundInput)avIndependenRouteSoundInput;
- (AVSoundInput)avSoundInput;
- (BOOL)hasIndependentRouteCapability;
- (BOOL)isRecording;
- (BOOL)startRecording;
- (BOOL)startRecording:(int)a3;
- (CSSoundInput)csSoundInput;
- (RDSoundInputImpl)initWithExpectedFormat:(const AudioStreamBasicDescription *)a3 deliverSamples:(id)a4;
- (void)_callStatusChanged:(id)a3;
- (void)_handleSpeechDetectionVADPresentChange:(id)a3;
- (void)_handleSpeechSomeClientActiveDidChange:(id)a3;
- (void)_handleSystemControllerDied:(id)a3;
- (void)_startObservingSpeechClientsActive;
- (void)_startObservingSpeechDetectionVADPresence;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopObservingSpeechClientsActive;
- (void)dealloc;
- (void)setAvIndependenRouteSoundInput:(id)a3;
- (void)setAvSoundInput:(id)a3;
- (void)setCsSoundInput:(id)a3;
- (void)stopRecording;
@end

@implementation RDSoundInputImpl

- (RDSoundInputImpl)initWithExpectedFormat:(const AudioStreamBasicDescription *)a3 deliverSamples:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RDSoundInputImpl;
  v6 = -[RDSoundInputImpl init](&v11, "init");
  if (v6)
  {
    v7 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  a3);
    if (qword_1000DDCF0 != -1) {
      dispatch_once(&qword_1000DDCF0, &stru_1000CE1A8);
    }
    if (RXIsUseIndependentVADEnabled() && byte_1000DDCE9) {
      v6->_avIndependenRouteSoundInput = -[AVIndependentSoundInput initWithExpectedFormat:deliverSamples:]( objc_alloc(&OBJC_CLASS___AVIndependentSoundInput),  "initWithExpectedFormat:deliverSamples:",  v7,  a4);
    }
    if (RXIsUseIndependentVADEnabled() && byte_1000DDCE9)
    {
      if (v6->_avIndependenRouteSoundInput)
      {
        v6->_hasIndependentRouteCapability = 1;
        CFPreferencesSetAppValue( @"RXUsingIndependentVAD",  kCFBooleanTrue,  @"com.apple.SpeechRecognitionCore.speechrecognitiond");
        v8 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Device supports independent route",  v10,  2u);
        }
      }
    }

    else
    {
      v6->_hasIndependentRouteCapability = 0;
      CFPreferencesSetAppValue( @"RXUsingIndependentVAD",  kCFBooleanFalse,  @"com.apple.SpeechRecognitionCore.speechrecognitiond");
      v6->_csSoundInput = -[CSSoundInput initWithDeliverSamples:]( objc_alloc(&OBJC_CLASS___CSSoundInput),  "initWithDeliverSamples:",  a4);
      v6->_avSoundInput = -[AVSoundInput initWithExpectedFormat:deliverSamples:]( objc_alloc(&OBJC_CLASS___AVSoundInput),  "initWithExpectedFormat:deliverSamples:",  v7,  a4);

      -[RDSoundInputImpl _startObservingSystemControllerLifecycle](v6, "_startObservingSystemControllerLifecycle");
      -[RDSoundInputImpl _startObservingSpeechDetectionVADPresence](v6, "_startObservingSpeechDetectionVADPresence");
    }
  }

  return v6;
}

- (void)_startObservingSystemControllerLifecycle
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  AVSystemController_ServerConnectionDiedNotification,  0LL);
  v4 = +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  AVSystemController_ServerConnectionDiedNotification);
  id v5 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  self,  "_handleSystemControllerDied:",  AVSystemController_ServerConnectionDiedNotification,  +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController"));
  +[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance");
  v7 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v7,  "addObserver:selector:name:object:",  self,  "_callStatusChanged:",  TUCallCenterCallStatusChangedNotification,  0LL);
  v8 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v8,  "addObserver:selector:name:object:",  self,  "_callStatusChanged:",  TUCallCenterVideoCallStatusChangedNotification,  0LL);
}

- (void)_handleSystemControllerDied:(id)a3
{
  v4 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RDSoundInput::AVSystemControllerDied", v5, 2u);
  }

  -[RDSoundInputImpl _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[RDSoundInputImpl _startObservingSpeechDetectionVADPresence](self, "_startObservingSpeechDetectionVADPresence");
  -[RDSoundInputImpl _handleSpeechDetectionVADPresentChange:](self, "_handleSpeechDetectionVADPresentChange:", 0LL);
}

- (void)_startObservingSpeechDetectionVADPresence
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  AVSystemController_SpeechDetectionDevicePresentDidChangeNotification,  0LL);
  v4 = +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  AVSystemController_SpeechDetectionDevicePresentDidChangeNotification);
  id v5 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  self,  "_handleSpeechDetectionVADPresentChange:",  AVSystemController_SpeechDetectionDevicePresentDidChangeNotification,  +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController"));
}

- (void)_startObservingSpeechClientsActive
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  AVSystemController_SomeClientIsActiveDidChangeNotification,  +[AVSystemController sharedInstance](&OBJC_CLASS___AVSystemController, "sharedInstance"));
  v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  self,  "_handleSpeechSomeClientActiveDidChange:",  AVSystemController_SomeClientIsActiveDidChangeNotification,  +[AVSystemController sharedInstance](&OBJC_CLASS___AVSystemController, "sharedInstance"));
}

- (void)_stopObservingSpeechClientsActive
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  AVSystemController_SomeClientIsActiveDidChangeNotification,  +[AVSystemController sharedInstance](&OBJC_CLASS___AVSystemController, "sharedInstance"));
}

- (BOOL)startRecording
{
  return -[RDSoundInputImpl startRecording:](self, "startRecording:", 0LL);
}

- (BOOL)startRecording:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (RXIsUseIndependentVADEnabled(self, a2) && self->_hasIndependentRouteCapability)
  {
    if (-[AVIndependentSoundInput startRecording:]( -[RDSoundInputImpl avIndependenRouteSoundInput](self, "avIndependenRouteSoundInput"),  "startRecording:",  0LL))
    {
      +[AudioNotification sendLiveRecordingOnNotification]( &OBJC_CLASS___AudioNotification,  "sendLiveRecordingOnNotification");
      return 1;
    }

    goto LABEL_30;
  }

  id v5 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl_iOS:startingRecording with reason %d",  (uint8_t *)v18,  8u);
  }

  if (+[RDSoundInputImpl_iOS_Shared isSystemSleeping](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isSystemSleeping"))
  {
    v6 = (os_log_s *)RXOSLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v7) {
      return result;
    }
    LOWORD(v18[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System is sleeping, so don't start recording",  (uint8_t *)v18,  2u);
    return 0;
  }

  unsigned __int8 v9 = +[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent");
  unsigned int v10 = +[RDSoundInputImpl isCSVADHidden](&OBJC_CLASS___RDSoundInputImpl, "isCSVADHidden");
  char v11 = v10;
  char v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || !v10) {
    -[RDSoundInputImpl _stopObservingSpeechClientsActive](self, "_stopObservingSpeechClientsActive");
  }
  else {
    -[RDSoundInputImpl _startObservingSpeechClientsActive](self, "_startObservingSpeechClientsActive");
  }
  char v13 = v12 | v11;
  v14 = (os_log_s *)RXOSLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) == 0)
  {
    if (v15)
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl_iOS:CSVAD Present",  (uint8_t *)v18,  2u);
    }

    if (-[AVSoundInput isRecording](-[RDSoundInputImpl avSoundInput](self, "avSoundInput"), "isRecording")) {
      -[AVSoundInput stopRecording](-[RDSoundInputImpl avSoundInput](self, "avSoundInput"), "stopRecording");
    }
    -[AVSoundInput deactivateNotifications]( -[RDSoundInputImpl avSoundInput](self, "avSoundInput"),  "deactivateNotifications");
    int v17 = 3;
    while (!-[CSSoundInput startRecording](-[RDSoundInputImpl csSoundInput](self, "csSoundInput"), "startRecording"))
    {
      usleep(0xC350u);
      if (!--v17) {
        goto LABEL_30;
      }
    }

    goto LABEL_20;
  }

  if (v15)
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl_iOS:CSVAD not present",  (uint8_t *)v18,  2u);
  }

  if (-[CSSoundInput isRecording](-[RDSoundInputImpl csSoundInput](self, "csSoundInput"), "isRecording")) {
    -[CSSoundInput stopRecording](-[RDSoundInputImpl csSoundInput](self, "csSoundInput"), "stopRecording");
  }
  -[AVSoundInput activateNotifications](-[RDSoundInputImpl avSoundInput](self, "avSoundInput"), "activateNotifications");
  if (-[AVSoundInput startRecording:](-[RDSoundInputImpl avSoundInput](self, "avSoundInput"), "startRecording:", v3))
  {
LABEL_20:
    +[AudioNotification sendLiveRecordingOnNotification]( &OBJC_CLASS___AudioNotification,  "sendLiveRecordingOnNotification");
    v16 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl_iOS:startedRecording",  (uint8_t *)v18,  2u);
    }

    return 1;
  }

- (void)stopRecording
{
  uint64_t v3 = (os_log_s *)RXOSLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl_iOS:stoppingRecording",  buf,  2u);
  }

  if (RXIsUseIndependentVADEnabled(v4, v5) && self->_hasIndependentRouteCapability)
  {
    v6 = -[RDSoundInputImpl avIndependenRouteSoundInput](self, "avIndependenRouteSoundInput");
  }

  else if (+[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent"))
  {
    v6 = -[RDSoundInputImpl csSoundInput](self, "csSoundInput");
  }

  else
  {
    v6 = -[RDSoundInputImpl avSoundInput](self, "avSoundInput");
  }

  -[AVIndependentSoundInput stopRecording](v6, "stopRecording");
  BOOL v7 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:stoppedRecording", v8, 2u);
  }

  +[AudioNotification sendLiveRecordingOffNotificationWithInterrupt:]( &OBJC_CLASS___AudioNotification,  "sendLiveRecordingOffNotificationWithInterrupt:",  0LL);
}

- (BOOL)isRecording
{
  if (+[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent")) {
    return -[CSSoundInput isRecording](-[RDSoundInputImpl csSoundInput](self, "csSoundInput"), "isRecording") != 0;
  }
  else {
    return -[AVSoundInput isRecording](-[RDSoundInputImpl avSoundInput](self, "avSoundInput"), "isRecording");
  }
}

- (void)_handleSpeechDetectionVADPresentChange:(id)a3
{
  if (!+[RDSoundInputImpl_iOS_Shared isCarPlayActive](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isCarPlayActive")
    || self->_hasIndependentRouteCapability)
  {
    uint64_t v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Speech detection VAD status changed = %@",  buf,  0xCu);
    }

    if (!self->_hasIndependentRouteCapability)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000FB2C;
      block[3] = &unk_1000CDBC8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }
  }

- (void)_handleSpeechSomeClientActiveDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000FB98;
  v3[3] = &unk_1000CE1D0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)gRDServerQueue, v3);
}

- (void)_callStatusChanged:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = [v4 status];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl:_callStatusChanged:%d",  buf,  8u);
  }

  if (v4)
  {
    if ([v4 status] == 4 || objc_msgSend(v4, "status") == 3)
    {
      v6 = (dispatch_queue_s *)gRDServerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000FDB0;
      block[3] = &unk_1000CE1D0;
      block[4] = v4;
      void block[5] = self;
      BOOL v7 = block;
LABEL_7:
      dispatch_async(v6, v7);
      return;
    }

    if ([v4 status] == 6)
    {
      v6 = (dispatch_queue_s *)gRDServerQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10000FE58;
      v8[3] = &unk_1000CE1D0;
      v8[4] = v4;
      v8[5] = self;
      BOOL v7 = v8;
      goto LABEL_7;
    }
  }

- (void)dealloc
{
  avIndependenRouteSoundInput = self->_avIndependenRouteSoundInput;
  if (avIndependenRouteSoundInput) {

  }
  csSoundInput = self->_csSoundInput;
  if (csSoundInput) {

  }
  avSoundInput = self->_avSoundInput;
  if (avSoundInput) {

  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RDSoundInputImpl;
  -[RDSoundInputImpl dealloc](&v6, "dealloc");
}

+ (BOOL)isCSVADPresent
{
  if (+[RDSoundInputImpl_iOS_Shared isCarPlayActive](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isCarPlayActive")) {
    return 1;
  }
  id v3 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  return objc_msgSend( objc_msgSend( v3,  "attributeForKey:",  AVSystemController_SpeechDetectionDevicePresentAttribute),  "BOOLValue");
}

+ (BOOL)isCSVADHidden
{
  if (+[RDSoundInputImpl_iOS_Shared isCarPlayActive](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isCarPlayActive")) {
    return 0;
  }
  id v3 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  id v4 = [v3 attributeForKey:AVSystemController_ActiveClientPIDsThatHideTheSpeechDetectionDeviceAttribute];
  if ([v4 count] == (id)1) {
    unsigned int v5 = objc_msgSend( objc_msgSend(v4, "firstObject"),  "isEqual:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid())) ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }
  if ([v4 count]) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (BOOL)isCallActive
{
  id v2 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  [v2 attributeForKey:AVSystemController_CallIsActive];
  id v3 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  objc_msgSend(objc_msgSend(v3, "attributeForKey:", AVSystemController_RecordingClientPIDsAttribute), "count");
  id v4 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  return objc_msgSend( objc_msgSend(v4, "attributeForKey:", AVSystemController_CallIsActive),  "BOOLValue");
}

+ (BOOL)isHearstConnected
{
  id v2 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  id v3 = [v2 attributeForKey:AVSystemController_PickableRoutesAttribute];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend( v8,  "objectForKey:",  AVSystemController_RouteDescriptionKey_IsPreferredExternalRoute),  "BOOLValue")
          && objc_msgSend( objc_msgSend( v8,  "objectForKey:",  AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupported),  "BOOLValue")
          && objc_msgSend( objc_msgSend( v8,  "objectForKey:",  AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive),  "BOOLValue")
          && (objc_msgSend( objc_msgSend( v8,  "objectForKey:",  AVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP),  "BOOLValue") & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_14;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_14:
  unsigned int v10 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Airpods Connected=%d", buf, 8u);
  }

  return v9;
}

- (BOOL)hasIndependentRouteCapability
{
  return self->_hasIndependentRouteCapability;
}

- (CSSoundInput)csSoundInput
{
  return self->_csSoundInput;
}

- (void)setCsSoundInput:(id)a3
{
}

- (AVSoundInput)avSoundInput
{
  return self->_avSoundInput;
}

- (void)setAvSoundInput:(id)a3
{
}

- (AVIndependentSoundInput)avIndependenRouteSoundInput
{
  return self->_avIndependenRouteSoundInput;
}

- (void)setAvIndependenRouteSoundInput:(id)a3
{
}

@end