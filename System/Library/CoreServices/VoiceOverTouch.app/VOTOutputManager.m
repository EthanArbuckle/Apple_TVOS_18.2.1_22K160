@interface VOTOutputManager
+ (NSArray)previousSoundsPlayed;
+ (id)outputManager;
+ (id)outputManagerIfExists;
+ (void)clearPreviousSoundsPlayed;
+ (void)initialize;
+ (void)logSoundPlayed:(id)a3;
- (AXAccessQueue)audioSessionQueue;
- (BOOL)_isHeadphoneRoute:(id)a3;
- (BOOL)_isHeadsetRoute:(id)a3;
- (BOOL)_isRouteExternalHDMIRoute:(id)a3;
- (BOOL)airTunesRouteIsAirPlaying;
- (BOOL)audioSessionActive;
- (BOOL)externalAudioRouteIsHearingAid;
- (BOOL)externalAudioRouteSelected;
- (BOOL)externalAudioRoutesAvailable;
- (BOOL)externalAudioRoutesContainHDMIRoute;
- (BOOL)isCurrentRouteConsideredExternal:(id)a3;
- (BOOL)isPaused;
- (BOOL)isRouteAirplayMirroring;
- (BOOL)isRoutePicked:(id)a3;
- (BOOL)isRouteWireless:(id)a3;
- (BOOL)isSpeaking;
- (BOOL)isSystemMuted;
- (BOOL)isWirelessRoutePicked:(id)a3;
- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3;
- (BOOL)selectedRouteIsHDMI;
- (NSArray)queuedRequests;
- (NSDate)dateToResumeRequests;
- (NSDate)dateToResumeSounds;
- (NSString)currentRouteName;
- (VOTOutputManager)init;
- (double)volume;
- (float)defaultSpeechRate;
- (float)speechRate;
- (float)speechRateForLanguage:(id)a3;
- (float)systemVolume;
- (id)airTunesRouteIsAirPlayingTestingBlock;
- (id)componentForType:(int)a3;
- (id)currentLanguageMap;
- (id)speechComponent;
- (void)_activeRouteChanged:(id)a3;
- (void)_dispatchNextQueuedRequest;
- (void)_handleProcessRequest:(id)a3;
- (void)_handleRequestFinished:(id)a3;
- (void)_holdCurrentRequest;
- (void)_notifyObserversOutputManagerDidFinishProcessingQueuedRequests;
- (void)_notifyObserversOutputManagerWillProcessNextRequest:(id)a3;
- (void)_resumeCurrentRequest;
- (void)_silenceRequestsForTimeInterval:(id)a3;
- (void)_updateActiveRoutes;
- (void)_updateExternalRoutesAvailable;
- (void)_updateSoundCurtain;
- (void)addOutputManagerObserver:(id)a3;
- (void)addVOSEventFinishedHandler:(id)a3 forIdentifier:(id)a4;
- (void)addVOSEventStartedHandler:(id)a3 forIdentifier:(id)a4;
- (void)callStatusChanged;
- (void)clearAllQueues;
- (void)clearQueue;
- (void)continueSpeaking;
- (void)dealloc;
- (void)disableAudioSession:(id)a3;
- (void)disableAudioSession:(id)a3 userDelay:(double)a4;
- (void)dispatcher:(id)a3 handleEvent:(id)a4 soundPack:(id)a5 hapticPack:(id)a6;
- (void)enableAudioSession:(id)a3;
- (void)finishedOutputRequest:(id)a3;
- (void)handleEvent:(id)a3;
- (void)holdCurrentRequest;
- (void)pauseSpeakingAtBoundary:(int)a3;
- (void)playSoundFast:(id)a3;
- (void)playSoundFast:(id)a3 completionBlock:(id)a4;
- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)removeAllAudioSessionEnablers;
- (void)removeAllOutputManagerObservers;
- (void)removeOutputManagerObserver:(id)a3;
- (void)removeVOSEventFinishedHandler:(id)a3;
- (void)removeVOSEventStartedHandler:(id)a3;
- (void)resetSpeechRate;
- (void)resumeCurrentRequest;
- (void)selectAudioRoute:(BOOL)a3;
- (void)selectExternalAudioRoute;
- (void)selectLocalAudioRoute;
- (void)sendEvent:(id)a3;
- (void)setAirTunesRouteIsAirPlayingTestingBlock:(id)a3;
- (void)setCurrentRouteName:(id)a3;
- (void)setDateToResumeRequests:(id)a3;
- (void)setDateToResumeSounds:(id)a3;
- (void)setRate:(float)a3;
- (void)setSoundCurtainEnabled:(BOOL)a3;
- (void)setSpeechRate:(float)a3 forLanguage:(id)a4;
- (void)setSystemVolume:(float)a3;
- (void)shutdown;
- (void)silenceOutputForTimeInterval:(double)a3;
- (void)speakSimpleString:(id)a3;
- (void)speakSimpleString:(id)a3 braille:(BOOL)a4 language:(id)a5;
- (void)stopSpeakingAtBoundary:(int)a3;
- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5;
- (void)synchVolumeWithSystem;
- (void)toggleAudioSessionActive:(BOOL)a3;
- (void)toggleSystemMute;
- (void)updateAudioSessionProperties;
- (void)updateSupportedLanguageMap;
- (void)updateWithCurrentRoute;
@end

@implementation VOTOutputManager

+ (void)initialize
{
  if (qword_1001ACBF8 != -1) {
    dispatch_once(&qword_1001ACBF8, &stru_100176D10);
  }
}

- (VOTOutputManager)init
{
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___VOTOutputManager;
  v2 = -[VOTOutputManager init](&v59, "init");
  if (v2)
  {
    v3 = -[SCRCThreadKey initWithObject:](objc_alloc(&OBJC_CLASS___SCRCThreadKey), "initWithObject:", v2);
    threadKey = v2->_threadKey;
    v2->_threadKey = v3;

    v2->_cachedRate = 3.40282347e38;
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    queuedOutputRequests = v2->_queuedOutputRequests;
    v2->_queuedOutputRequests = v5;

    v7 = (NSMutableArray *)[objc_allocWithZone(NSMutableArray) init];
    requestRunners = v2->_requestRunners;
    v2->_requestRunners = v7;

    id v9 = [objc_allocWithZone((Class)VOTOutputRequestRunner) init];
    -[NSMutableArray addObject:](v2->_requestRunners, "addObject:", v9);
    id v10 = [objc_allocWithZone((Class)VOTOutputRequestRunner) init];
    -[NSMutableArray addObject:](v2->_requestRunners, "addObject:", v10);
    v11 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
    components = v2->_components;
    v2->_components = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___AXAccessQueue);
    audioSessionQueue = v2->_audioSessionQueue;
    v2->_audioSessionQueue = v13;

    v15 = -[AXAccessQueueTimer initWithTargetAccessQueue:]( objc_alloc(&OBJC_CLASS___AXAccessQueueTimer),  "initWithTargetAccessQueue:",  v2->_audioSessionQueue);
    inactivateAudioTimer = v2->_inactivateAudioTimer;
    v2->_inactivateAudioTimer = v15;

    -[AXAccessQueueTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v2->_inactivateAudioTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    audioSessionUsers = v2->_audioSessionUsers;
    v2->_audioSessionUsers = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    currentlyRunningRequests = v2->_currentlyRunningRequests;
    v2->_currentlyRunningRequests = (NSMutableArray *)v19;

    if (-[VOTOutputManager externalAudioRouteSelected](v2, "externalAudioRouteSelected"))
    {
      if (v2->_currentExternalRoutingInfo.isHeadphoneBT || v2->_currentExternalRoutingInfo.isHeadsetBT)
      {
        uint64_t v21 = VOTLogAudio();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Not auto-selecting external route at init because route is HeadphoneBT or HeadsetBT",  buf,  2u);
        }
      }

      else
      {
        [(id)VOTSharedWorkspace setAudioDestinationRequestExternal:1];
      }
    }

    -[VOTOutputManager updateSupportedLanguageMap](v2, "updateSupportedLanguageMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v2 selector:"updateSupportedLanguageMap" name:NSCurrentLocaleDidChangeNotification object:0];

    id v24 = [objc_allocWithZone((Class)VOTOutputSpeechComponent) init];
    if (v24) {
      -[AXIndexMap setObject:forIndex:](v2->_components, "setObject:forIndex:", v24, 0LL);
    }
    id v25 = [objc_allocWithZone((Class)VOTOutputSoundComponent) init];

    if (v25) {
      -[AXIndexMap setObject:forIndex:](v2->_components, "setObject:forIndex:", v25, 1LL);
    }

    id v26 = [objc_allocWithZone((Class)VOTOutputBrailleComponent) init];
    if (v26) {
      -[AXIndexMap setObject:forIndex:](v2->_components, "setObject:forIndex:", v26, 3LL);
    }
    dispatch_queue_t v27 = dispatch_queue_create("voiceover.avaccessqueue.output", 0LL);
    avAccessQueue = v2->_avAccessQueue;
    v2->_avAccessQueue = (OS_dispatch_queue *)v27;

    -[VOTOutputManager resetSpeechRate](v2, "resetSpeechRate");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v2 selector:"_voiceOverVolumeChanged:" name:kAXSVoiceOverTouchVolumeChangedNotification object:0];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_10000D130;
    v56[3] = &unk_100176D38;
    v31 = v2;
    v57 = v31;
    [v30 registerUpdateBlock:v56 forRetrieveSelector:"voiceOverAdjustSoundVolumeIndependently" withListener:v31];

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_10000D13C;
    v54[3] = &unk_100176D38;
    v33 = v31;
    v55 = v33;
    [v32 registerUpdateBlock:v54 forRetrieveSelector:"voiceOverSoundVolume" withListener:v33];

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_10000D148;
    v52[3] = &unk_100176D38;
    v35 = v33;
    v53 = v35;
    [v34 registerUpdateBlock:v52 forRetrieveSelector:"voiceOverSoundCurtain" withListener:v35];

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v47 = _NSConcreteStackBlock;
    uint64_t v48 = 3221225472LL;
    v49 = sub_10000D150;
    v50 = &unk_100176D60;
    v38 = v35;
    v51 = v38;
    id v39 =  [v36 addObserverForName:@"VOTBrailleDisplayActiveStateChanged" object:0 queue:v37 usingBlock:&v47];

    -[VOTOutputManager _updateSoundCurtain](v38, "_updateSoundCurtain", v47, v48, v49, v50);
    -[VOTOutputManager callStatusChanged](v38, "callStatusChanged");
    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    outputManagerObservers = v38->_outputManagerObservers;
    v38->_outputManagerObservers = (NSHashTable *)v40;

    v42 = objc_alloc_init(&OBJC_CLASS___NSLock);
    outputManagerObserversLock = v38->_outputManagerObserversLock;
    v38->_outputManagerObserversLock = v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEventDispatcher sharedInstance](&OBJC_CLASS___VOSOutputEventDispatcher, "sharedInstance"));
    [v44 addEventHandler:v38];

    v45 = v38;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEventDispatcher sharedInstance](&OBJC_CLASS___VOSOutputEventDispatcher, "sharedInstance"));
  [v3 removeEventHandler:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTOutputManager;
  -[VOTOutputManager dealloc](&v5, "dealloc");
}

+ (id)outputManagerIfExists
{
  return (id)qword_1001ACBE0;
}

+ (id)outputManager
{
  if (qword_1001ACC00 != -1) {
    dispatch_once(&qword_1001ACC00, &stru_100176D80);
  }
  return (id)qword_1001ACBE0;
}

- (NSArray)queuedRequests
{
  return (NSArray *)-[NSMutableArray copy](self->_queuedOutputRequests, "copy");
}

- (void)handleEvent:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForIndex:1]);
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 3)
  {
    -[VOTOutputManager _handleRequestFinished:](self, "_handleRequestFinished:", v10);
    goto LABEL_8;
  }

  if (v5 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager dateToResumeRequests](self, "dateToResumeRequests"));

    if (!v6)
    {
LABEL_6:
      -[VOTOutputManager _handleProcessRequest:](self, "_handleProcessRequest:", v10);
      goto LABEL_8;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager dateToResumeRequests](self, "dateToResumeRequests"));
    id v9 = [v7 compare:v8];

    if (v9 != (id)-1LL)
    {
      -[VOTOutputManager setDateToResumeRequests:](self, "setDateToResumeRequests:", 0LL);
      goto LABEL_6;
    }
  }

- (void)updateSupportedLanguageMap
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  v4 = (AXDialectMap *)objc_claimAutoreleasedReturnValue([v3 dialectForLanguageID:v6]);
  supportedLanguageMap = self->_supportedLanguageMap;
  self->_supportedLanguageMap = v4;

  if (!self->_supportedLanguageMap) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTOutputManager.m",  343LL,  "-[VOTOutputManager updateSupportedLanguageMap]",  @"Could not find a language map: %@");
  }
}

- (id)currentLanguageMap
{
  return self->_supportedLanguageMap;
}

- (void)clearQueue
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000D458;
  v2[3] = &unk_100176D38;
  v2[4] = self;
  AX_PERFORM_WITH_LOCK(&self->_queueLock, v2);
}

- (void)clearAllQueues
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000D4BC;
  v2[3] = &unk_100176D38;
  v2[4] = self;
  AX_PERFORM_WITH_LOCK(&self->_queueLock, v2);
}

- (void)_handleRequestFinished:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForIndex:14]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 completionDelegate]);
  [v5 outputRequestFinished:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 completionBlock]);
  if (v6)
  {
    v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completionBlock]);
    ((void (**)(void, void *))v7)[2](v7, v4);
  }

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_10000D620;
  v14 = &unk_100176DA8;
  v15 = self;
  id v8 = v4;
  id v16 = v8;
  AX_PERFORM_WITH_LOCK(&self->_queueLock, &v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_requestRunners, "firstObject", v11, v12, v13, v14, v15));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 currentRequest]);

  if (v8 && (!v10 || v10 == v8)) {
    -[VOTOutputManager _dispatchNextQueuedRequest](self, "_dispatchNextQueuedRequest");
  }
}

- (void)shutdown
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    uint64_t v3 = VOTLogAudio();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000EEDD4(v4);
    }
  }

  else
  {
    self->_shutdown = 1;
  }

- (void)_handleProcessRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (!self->_shutdown)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    char v14 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000D828;
    v7[3] = &unk_100176DD0;
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForIndex:14]);
    id v8 = v6;
    id v9 = self;
    id v10 = &v11;
    AX_PERFORM_WITH_LOCK(&self->_queueLock, v7);
    if (*((_BYTE *)v12 + 24)) {
      -[VOTOutputManager _dispatchNextQueuedRequest](self, "_dispatchNextQueuedRequest");
    }

    _Block_object_dispose(&v11, 8);
  }
}

- (void)_dispatchNextQueuedRequest
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_requestRunners, "objectAtIndex:", 0LL));
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_10000DC44;
  char v14 = sub_10000DC54;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DC5C;
  v7[3] = &unk_100176DF8;
  void v7[4] = self;
  id v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  AX_PERFORM_WITH_LOCK(&self->_queueLock, v7);
  unsigned int v5 = (void *)v11[5];
  if (v5)
  {
    if ([v5 cancelRequest])
    {
      -[VOTOutputManager _dispatchNextQueuedRequest](self, "_dispatchNextQueuedRequest");
    }

    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10000DCD0;
      v6[3] = &unk_100176E20;
      v6[4] = self;
      v6[5] = &v10;
      AX_PERFORM_WITH_LOCK(&self->_queueLock, v6);
      -[VOTOutputManager _notifyObserversOutputManagerWillProcessNextRequest:]( self,  "_notifyObserversOutputManagerWillProcessNextRequest:",  v11[5]);
      [v4 runOutputRequest:v11[5]];
    }
  }

  else
  {
    -[VOTOutputManager _notifyObserversOutputManagerDidFinishProcessingQueuedRequests]( self,  "_notifyObserversOutputManagerDidFinishProcessingQueuedRequests");
  }

  _Block_object_dispose(&v10, 8);
}

- (void)finishedOutputRequest:(id)a3
{
  id v4 = a3;
  id v6 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:3];
  id v5 = [objc_allocWithZone(AXIndexMap) init];
  [v5 setObject:v6 forIndex:1];
  [v5 setObject:v4 forIndex:14];

  -[VOTOutputManager performSelector:withThreadKey:count:objects:]( self,  "performSelector:withThreadKey:count:objects:",  "handleEvent:",  self->_threadKey,  1LL,  v5);
}

- (id)componentForType:(int)a3
{
  return -[AXIndexMap objectForIndex:](self->_components, "objectForIndex:", a3);
}

- (void)setSystemVolume:(float)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  *(float *)&double v4 = a3;
  [v6 setVolumeTo:@"Audio/Video" forCategory:v4];
  double v5 = a3 * 0.8;
  *(float *)&double v5 = v5;
  [v6 setVolumeTo:AVAudioSessionCategoryVoiceCommand forCategory:v5];
}

- (float)systemVolume
{
  float v5 = 0.0;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  [v2 getVolume:&v5 forCategory:@"Audio/Video"];
  float v3 = v5;

  return v3;
}

- (void)_updateSoundCurtain
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 voiceOverSoundCurtain];

  if (!v4) {
    goto LABEL_11;
  }
  if ([(id)VOTSharedWorkspace telephonyIsActive])
  {
    uint64_t v5 = VOTLogAudio();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      v7 = "Turning off sound curtain for active telephony";
      id v8 = (uint8_t *)&v14;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  unsigned __int8 v10 = [v9 brailleEnabled];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = VOTLogAudio();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v7 = "Turning off sound curtain for no braille display";
      id v8 = (uint8_t *)&v13;
      goto LABEL_9;
    }

- (void)setSoundCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  if (v3 && [(id)VOTSharedWorkspace voiceOverIsConfirmed])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_FullMuteAttribute]);
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      id v13 = 0LL;
      [v4 setAttribute:&__kCFBooleanTrue forKey:AVSystemController_FullMuteAttribute error:&v13];
      id v7 = v13;
      if (!v7)
      {
        char v10 = 1;
        goto LABEL_13;
      }

      uint64_t v8 = VOTLogAudio();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000EEE64();
      }
      char v10 = 1;
LABEL_12:

LABEL_13:
      byte_1001ACC08 = v10;
    }
  }

  else if (byte_1001ACC08 == 1)
  {
    id v12 = 0LL;
    [v4 setAttribute:&__kCFBooleanFalse forKey:AVSystemController_FullMuteAttribute error:&v12];
    id v7 = v12;
    uint64_t v11 = VOTLogAudio();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000EEEC4();
    }
    char v10 = 0;
    goto LABEL_12;
  }
}

- (void)synchVolumeWithSystem
{
}

- (void)toggleSystemMute
{
  unsigned int v2 = -[VOTOutputManager isSystemMuted](self, "isSystemMuted");
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v2 ^ 1));
  [v4 setAttribute:v3 forKey:AVSystemController_FullMuteAttribute error:0];
}

- (BOOL)isSystemMuted
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributeForKey:AVSystemController_FullMuteAttribute]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (double)volume
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  [v2 volume];
  double v4 = v3;

  return v4;
}

- (id)speechComponent
{
  return -[VOTOutputManager componentForType:](self, "componentForType:", 0LL);
}

- (BOOL)airTunesRouteIsAirPlaying
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputManager airTunesRouteIsAirPlayingTestingBlock]( self,  "airTunesRouteIsAirPlayingTestingBlock"));

  if (v3)
  {
    double v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( -[VOTOutputManager airTunesRouteIsAirPlayingTestingBlock]( self,  "airTunesRouteIsAirPlayingTestingBlock"));
    LOBYTE(v5) = v4[2]();
  }

  else
  {
    double v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_CurrentExternalScreenAttribute]);
    uint64_t v5 = [v6 isEqualToString:AVSystemController_ExternalScreenType_AirPlay];
  }

  return v5;
}

- (BOOL)_isRouteExternalHDMIRoute:(id)a3
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:AVController_RouteDescriptionKey_AVAudioRouteName]);
  unsigned __int8 v4 = [v3 isEqualToString:@"HDMI"];

  return v4;
}

- (BOOL)isCurrentRouteConsideredExternal:(id)a3
{
  return 0;
}

- (BOOL)_isHeadphoneRoute:(id)a3
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:AVController_RouteDescriptionKey_AVAudioRouteName]);
  unsigned __int8 v4 = [v3 isEqualToString:@"HeadphonesBT"];

  return v4;
}

- (BOOL)_isHeadsetRoute:(id)a3
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:AVController_RouteDescriptionKey_AVAudioRouteName]);
  unsigned __int8 v4 = [v3 isEqualToString:@"HeadsetBT"];

  return v4;
}

- (BOOL)isRoutePicked:(id)a3
{
  uint64_t v3 = AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);
  unsigned __int8 v6 = [v5 BOOLValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKey:AVSystemController_RouteDescriptionKey_IsCurrentlyPickedOnPairedDevice]);
  LOBYTE(v4) = [v7 BOOLValue];

  return v6 & (v4 ^ 1);
}

- (BOOL)isRouteWireless:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:AVController_RouteDescriptionKey_RouteType]);
  unsigned __int8 v4 = [v3 isEqualToString:AVController_PickableRouteType_Wireless];

  return v4;
}

- (BOOL)isWirelessRoutePicked:(id)a3
{
  id v4 = a3;
  if (-[VOTOutputManager isRouteWireless:](self, "isRouteWireless:", v4)) {
    BOOL v5 = -[VOTOutputManager isRoutePicked:](self, "isRoutePicked:", v4);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)callStatusChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000E55C;
  v2[3] = &unk_100176D38;
  v2[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v2, a2);
}

- (void)_activeRouteChanged:(id)a3
{
  avAccessQueue = (dispatch_queue_s *)self->_avAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E5F8;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(avAccessQueue, block);
}

- (void)_updateActiveRoutes
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10000DC44;
  uint64_t v19 = sub_10000DC54;
  id v20 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pickableRoutesForCategory:AVAudioSessionCategoryVoiceOver]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000E8F4;
  v14[3] = &unk_100176E48;
  v14[4] = self;
  v14[5] = &v15;
  [v4 enumerateObjectsUsingBlock:v14];

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v16[5] valueForKey:AVController_RouteDescriptionKey_AVAudioRouteName]);
  if (-[VOTOutputManager isCurrentRouteConsideredExternal:](self, "isCurrentRouteConsideredExternal:", v16[5]))
  {
    uint64_t v6 = VOTLogAudio();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v22 = (unint64_t)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Route considered external %{public}@",  buf,  0xCu);
    }

    if (-[VOTOutputManager _isHeadphoneRoute:](self, "_isHeadphoneRoute:", v16[5])
      || -[VOTOutputManager _isHeadsetRoute:](self, "_isHeadsetRoute:", v16[5]))
    {
      uint64_t v8 = VOTLogAudio();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not auto-selecting external route because route is HeadphoneBT or HeadsetBT",  buf,  2u);
      }
    }

    else
    {
      [(id)VOTSharedWorkspace setAudioDestinationRequestExternal:1];
    }
  }

  char v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager currentRouteName](self, "currentRouteName"));
  uint64_t v11 = VOTLogAudio();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_currentExternalRoutingInfo.state;
    *(_DWORD *)buf = 134218498;
    unint64_t v22 = state;
    __int16 v23 = 2114;
    id v24 = v5;
    __int16 v25 = 2114;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Audio route changed %lu %{public}@-%{public}@",  buf,  0x20u);
  }

  if (([v5 isEqualToString:v10] & 1) == 0)
  {
    [v5 isEqualToString:@"HDMI"];
    -[VOTOutputManager updateAudioSessionProperties](self, "updateAudioSessionProperties");
  }

  -[VOTOutputManager _updateExternalRoutesAvailable](self, "_updateExternalRoutesAvailable");

  _Block_object_dispose(&v15, 8);
}

- (void)_updateExternalRoutesAvailable
{
  unsigned int v2 = self;
  self->_externalAudioRouteIsHearingAid = 0;
  p_externalAudioRouteIsHearingAid = &self->_externalAudioRouteIsHearingAid;
  *(_WORD *)&self->_externalRoutesAvailable = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pickableRoutesForCategory:@"Audio/Video"]);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = &AVController_RouteDescriptionKey_AVAudioRouteName;
    uint64_t v8 = @"AirTunes";
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:*v7]);
        unsigned int v13 = -[VOTOutputManager isCurrentRouteConsideredExternal:](v2, "isCurrentRouteConsideredExternal:", v11);
        if ([v12 isEqualToString:v8])
        {
          id v26 = v12;
          __int16 v14 = v2;
          id v15 = v6;
          uint64_t v16 = v9;
          uint64_t v17 = v8;
          v18 = v7;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:AVController_RouteDescriptionKey_RouteCurrentlyPicked]);
          unsigned int v20 = [v19 BOOLValue];

          id v7 = v18;
          uint64_t v8 = v17;
          uint64_t v9 = v16;
          id v6 = v15;
          unsigned int v2 = v14;
          id v12 = v26;
          v13 &= v20;
        }

        if (!-[VOTOutputManager _isHeadphoneRoute:](v2, "_isHeadphoneRoute:", v11)
          && !-[VOTOutputManager _isHeadsetRoute:](v2, "_isHeadsetRoute:", v11)
          && ((v13 ^ 1) & 1) == 0)
        {
          v2->_externalRoutesAvailable = 1;
          unsigned __int8 v21 = -[VOTOutputManager _isRouteExternalHDMIRoute:](v2, "_isRouteExternalHDMIRoute:", v11);
          unint64_t v22 = p_externalAudioRouteIsHearingAid - 1;
          if ((v21 & 1) != 0
            || (unsigned int v23 = [v12 isEqualToString:@"BluetoothLEOutput"],
                unint64_t v22 = p_externalAudioRouteIsHearingAid,
                v23))
          {
            BOOL *v22 = 1;
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v6);
  }
}

- (BOOL)externalAudioRoutesAvailable
{
  return self->_externalRoutesAvailable;
}

- (BOOL)externalAudioRoutesContainHDMIRoute
{
  return self->_externalRoutesContainHDMIRoute;
}

- (BOOL)externalAudioRouteIsHearingAid
{
  return self->_externalAudioRouteIsHearingAid;
}

- (BOOL)selectedRouteIsHDMI
{
  return self->_selectedRouteIsHDMI;
}

- (BOOL)isRouteAirplayMirroring
{
  return self->_currentExternalRoutingInfo.state == 2
      && self->_currentExternalRoutingInfo.isMirroring
      && self->_currentExternalRoutingInfo.supportsAudio
      && self->_currentExternalRoutingInfo.isWireless;
}

- (BOOL)externalAudioRouteSelected
{
  unint64_t state = self->_currentExternalRoutingInfo.state;
  BOOL v3 = state == 2;
  if (!state)
  {
    self->_currentExternalRoutingInfo.unint64_t state = 1LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pickableRoutesForCategory:@"Audio/Video"]);

    uint64_t v7 = VOTLogAudio();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v30 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Pickable routes for A/V category: %{public}@",  buf,  0xCu);
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          if (-[VOTOutputManager isCurrentRouteConsideredExternal:]( self,  "isCurrentRouteConsideredExternal:",  v14,  (void)v24))
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:AVController_RouteDescriptionKey_RouteCurrentlyPicked]);
            unsigned int v16 = [v15 BOOLValue];

            if (v16)
            {
              uint64_t v17 = VOTLogAudio();
              v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                __int128 v30 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Found external audio routes: %{public}@",  buf,  0xCu);
              }

              self->_currentExternalRoutingInfo.unint64_t state = 2LL;
              self->_selectedRouteIsHDMI = -[VOTOutputManager _isRouteExternalHDMIRoute:]( self,  "_isRouteExternalHDMIRoute:",  v14);
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:AVController_RouteDescriptionKey_RouteName]);
              -[VOTOutputManager setCurrentRouteName:](self, "setCurrentRouteName:", v19);

              unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:AVController_RouteDescriptionKey_RouteType]);
              self->_currentExternalRoutingInfo.isWireless = [v20 isEqualToString:AVController_PickableRouteType_Wireless];

              unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( [v14 objectForKey:AVController_RouteDescriptionKey_RouteSupportsAirPlayAudio]);
              self->_currentExternalRoutingInfo.supportsAudio = [v21 BOOLValue];

              unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"MirroringMode"]);
              self->_currentExternalRoutingInfo.isMirroring = [v22 isEqualToString:@"MirroringMode_Default"];

              self->_currentExternalRoutingInfo.isHeadphoneBT = -[VOTOutputManager _isHeadphoneRoute:]( self,  "_isHeadphoneRoute:",  v14);
              self->_currentExternalRoutingInfo.isHeadsetBT = -[VOTOutputManager _isHeadsetRoute:]( self,  "_isHeadsetRoute:",  v14);
              BOOL v3 = 1;
              goto LABEL_17;
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

- (void)selectExternalAudioRoute
{
}

- (void)selectLocalAudioRoute
{
}

- (void)selectAudioRoute:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pickableRoutesForCategory:@"Audio/Video"]);

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    v34 = 0LL;
    id v8 = 0LL;
    char v9 = 0;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:AVController_RouteDescriptionKey_RouteType]);
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:AVController_RouteDescriptionKey_RouteCurrentlyPicked]);
        unsigned __int8 v15 = [v14 BOOLValue];

        unsigned int v16 = -[VOTOutputManager isCurrentRouteConsideredExternal:](self, "isCurrentRouteConsideredExternal:", v12);
        if ([v13 isEqual:AVController_PickableRouteType_Default])
        {
          id v17 = v12;
          v18 = v8;
          id v8 = v17;
        }

        if (v16)
        {
          id v19 = v12;

          v34 = v19;
        }

        v9 |= v15 & v16 & v3 | (v15 ^ 1 | v16 | v3) ^ 1;
      }

      id v7 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v7);
  }

  else
  {
    v34 = 0LL;
    id v8 = 0LL;
    char v9 = 0;
  }

  uint64_t v20 = VOTLogAudio();
  unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v40[0]) = v9 & 1;
    WORD2(v40[0]) = 2114;
    *(void *)((char *)v40 + 6) = obj;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "routes available [changing category:%d]: %{public}@",  buf,  0x12u);
  }

  uint64_t v22 = VOTLogAudio();
  unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v40[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "default route: %{public}@", buf, 0xCu);
  }

  uint64_t v24 = VOTLogAudio();
  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v40[0] = v34;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "external route: %{public}@", buf, 0xCu);
  }

  if ((v9 & 1) != 0)
  {
    if (v3) {
      __int128 v26 = v8;
    }
    else {
      __int128 v26 = v34;
    }
    id v27 = v26;
    if (-[VOTOutputManager isRouteWireless:](self, "isRouteWireless:", v27)
      && !-[VOTOutputManager isWirelessRoutePicked:](self, "isWirelessRoutePicked:", v27))
    {
      uint64_t v31 = VOTLogAudio();
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v40[0] = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "skipping wireless route selection: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v28 = VOTLogAudio();
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v40[0] = v27;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Changed category: %{public}@", buf, 0xCu);
      }

      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 valueForKey:AVController_RouteDescriptionKey_RouteName]);
      -[VOTOutputManager setCurrentRouteName:](self, "setCurrentRouteName:", v30);
    }
  }
}

- (void)updateWithCurrentRoute
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 routeForCategory:AVAudioSessionCategoryVoiceOver]);
  -[VOTOutputManager setCurrentRouteName:](self, "setCurrentRouteName:", v3);
}

- (void)updateAudioSessionProperties
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  [v2 updateAudioSessionProperties:0];
}

- (void)setSpeechRate:(float)a3 forLanguage:(id)a4
{
  id v10 = a4;
  if (!v10) {
    goto LABEL_4;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  if (([v10 isEqualToString:v6] & 1) == 0)
  {

    goto LABEL_6;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

  if (v7)
  {
LABEL_6:
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    *(float *)&double v9 = a3;
    [v8 setVoiceOverSpeakingRate:v10 forLanguage:v9];

    goto LABEL_7;
  }

- (float)speechRateForLanguage:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v8 = 0LL;
    float v7 = 3.4028e38;
    goto LABEL_13;
  }

  id v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  if ([v4 isEqualToString:v5])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

    if (!v6)
    {
      float v7 = 3.4028e38;
LABEL_12:
      id v8 = v4;
      goto LABEL_13;
    }
  }

  else
  {
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v9 voiceOverSpeakingRateForLanguage:v4];
  float v7 = v10;

  if (fabs(v7 + -3.40282347e38) >= 2.22044605e-16) {
    goto LABEL_12;
  }
  uint64_t v11 = AXLanguageCanonicalFormToGeneralLanguage(v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v12 voiceOverSpeakingRateForLanguage:v8];
  float v7 = v13;

  if (fabs(v7 + -3.40282347e38) < 2.22044605e-16)
  {
    uint64_t v14 = AXLanguageConvertToCanonicalForm(v8);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (([v8 isEqualToString:v15] & 1) == 0)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v16 voiceOverSpeakingRateForLanguage:v15];
      float v7 = v17;
    }
  }

- (float)defaultSpeechRate
{
  double cachedRate = self->_cachedRate;
  double v4 = fabs(cachedRate + -3.40282347e38);
  if (v4 < 2.22044605e-16)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    -[VOTOutputManager speechRateForLanguage:](self, "speechRateForLanguage:", v5);
    self->_double cachedRate = v6;

    double cachedRate = self->_cachedRate;
    double v4 = fabs(cachedRate + -3.40282347e38);
  }

  if (v4 < 2.22044605e-16)
  {
    self->_double cachedRate = 0.689999998;
    return 0.689999998;
  }

  return cachedRate;
}

- (void)resetSpeechRate
{
  self->_double cachedRate = 3.40282347e38;
  -[VOTOutputManager defaultSpeechRate](self, "defaultSpeechRate");
  -[VOTOutputManager setRate:](self, "setRate:");
}

- (float)speechRate
{
  return self->_cachedRate;
}

- (void)setRate:(float)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  *(float *)&double v4 = a3;
  [v5 setRate:v4];
}

- (void)pauseSpeakingAtBoundary:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  [v4 pauseSpeakingAtBoundary:v3];
}

- (void)continueSpeaking
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  [v2 continueSpeaking];
}

- (void)stopSpeakingAtBoundary:(int)a3
{
}

- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  [v9 stopSpeakingAtBoundary:v6 allRequests:v5 sessionDeactivationDelay:v8];
}

- (BOOL)isPaused
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  unsigned __int8 v3 = [v2 isPaused];

  return v3;
}

- (BOOL)isSpeaking
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  unsigned __int8 v3 = [v2 isSpeaking];

  return v3;
}

- (void)holdCurrentRequest
{
}

- (void)_holdCurrentRequest
{
  onHoldRunner = self->_onHoldRunner;
  if (onHoldRunner)
  {
    -[NSMutableArray insertObject:atIndex:](self->_requestRunners, "insertObject:atIndex:", onHoldRunner, 0LL);
    -[VOTOutputRequestRunner resume](self->_onHoldRunner, "resume");
    id v4 = self->_onHoldRunner;
    self->_onHoldRunner = 0LL;
  }

  -[VOTOutputManager stopSpeakingAtBoundary:](self, "stopSpeakingAtBoundary:", 1LL);
  BOOL v5 = (VOTOutputRequestRunner *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_requestRunners, "objectAtIndex:", 0LL));
  uint64_t v6 = self->_onHoldRunner;
  self->_onHoldRunner = v5;

  -[VOTOutputRequestRunner setOnHold:](self->_onHoldRunner, "setOnHold:", 1LL);
  -[NSMutableArray removeObjectAtIndex:](self->_requestRunners, "removeObjectAtIndex:", 0LL);
}

- (void)resumeCurrentRequest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F9BC;
  v2[3] = &unk_100176D38;
  v2[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v2, a2, 0.75);
}

- (void)_resumeCurrentRequest
{
  onHoldRunner = self->_onHoldRunner;
  if (onHoldRunner)
  {
    -[NSMutableArray insertObject:atIndex:](self->_requestRunners, "insertObject:atIndex:", onHoldRunner, 0LL);
    -[VOTOutputRequestRunner resume](self->_onHoldRunner, "resume");
    id v4 = self->_onHoldRunner;
    self->_onHoldRunner = 0LL;
  }

- (void)_silenceRequestsForTimeInterval:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 doubleValue];
  double v6 = v5;

  float v7 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:v6]);
  -[VOTOutputManager setDateToResumeRequests:](self, "setDateToResumeRequests:", v7);
}

- (void)silenceOutputForTimeInterval:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:a3]);
  -[VOTOutputManager setDateToResumeSounds:](self, "setDateToResumeSounds:", v6);

  threadKey = self->_threadKey;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[VOTOutputManager performSelector:withThreadKey:count:objects:]( self,  "performSelector:withThreadKey:count:objects:",  "_silenceRequestsForTimeInterval:",  threadKey,  1LL,  v8);
}

- (void)toggleAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = VOTLogAudio(self, a2);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Toggle audio session: %d", buf, 8u);
  }

  float v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  id v17 = 0LL;
  unsigned int v8 = [v7 setActive:v3 withOptions:0 error:&v17];
  id v9 = v17;

  if (v8) {
    BOOL v12 = v9 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    uint64_t v13 = VOTLogAudio(v10, v11);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000EEF9C();
    }
  }

  self->_audioSessionActive = v3;
  uint64_t v15 = VOTLogAudio(v10, v11);
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000EEF24(v16);
  }
}

- (void)enableAudioSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    audioSessionQueue = self->_audioSessionQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000FD44;
    v7[3] = &unk_100176DA8;
    void v7[4] = self;
    id v8 = v4;
    -[AXAccessQueue performSynchronousWritingBlock:](audioSessionQueue, "performSynchronousWritingBlock:", v7);
  }
}

- (void)removeAllAudioSessionEnablers
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  unsigned int v16 = sub_10000DC44;
  id v17 = sub_10000DC54;
  id v18 = 0LL;
  audioSessionQueue = self->_audioSessionQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100010024;
  v12[3] = &unk_100176E20;
  v12[4] = self;
  v12[5] = &v13;
  -[AXAccessQueue performSynchronousWritingBlock:](audioSessionQueue, "performSynchronousWritingBlock:", v12);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v4 = (id)v14[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      float v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[VOTOutputManager disableAudioSession:]( self,  "disableAudioSession:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8);
        float v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)disableAudioSession:(id)a3
{
}

- (void)disableAudioSession:(id)a3 userDelay:(double)a4
{
  id v6 = a3;
  audioSessionQueue = self->_audioSessionQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000100F0;
  v9[3] = &unk_100176E70;
  v9[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  -[AXAccessQueue performSynchronousWritingBlock:](audioSessionQueue, "performSynchronousWritingBlock:", v9);
}

- (void)speakSimpleString:(id)a3
{
}

- (void)speakSimpleString:(id)a3 braille:(BOOL)a4 language:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v7 = a5;
  if ([v10 length])
  {
    id v8 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v9 = [v8 addString:v10 withLanguage:v7];
    if (v6) {
      sub_10000BB58(v8);
    }
    [v8 send];
  }
}

+ (NSArray)previousSoundsPlayed
{
  id v2 = [(id)qword_1001ACBE8 copy];
  [(id)qword_1001ACBF0 unlock];
  return (NSArray *)v2;
}

+ (void)clearPreviousSoundsPlayed
{
}

- (void)playSoundFast:(id)a3 completionBlock:(id)a4
{
}

- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 length])
  {
    uint64_t v25 = VOTLogAudio(0LL, v11);
    unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000EF13C(v21);
    }
    goto LABEL_17;
  }

  objc_msgSend((id)objc_opt_class(self, v11), "logSoundPlayed:", v8);
  id v12 = [v8 isEqualToString:@"Sounds/WrapBoundary.aiff"];
  if ((_DWORD)v12)
  {
    id v12 = (id)_AXSAutomationEnabled(v12);
    if ((_DWORD)v12)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      [v14 postNotificationName:@"VoiceOverEventOccurred" object:@"BoundaryEncountered"];
    }
  }

  uint64_t v15 = VOTLogAudio(v12, v13);
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000EF17C((uint64_t)v8, v16);
  }

  if (([(id)VOTSharedWorkspace screenOn] & 1) != 0
    || ([v8 isEqualToString:@"Sounds/ScreenOff.aiff"] & 1) != 0
    || ([v8 isEqualToString:@"Sounds/LockScreenTouchIDAuthenticated.aiff"] & 1) != 0
    || [v8 isEqualToString:@"Sounds/BrailleDisplayDisconnected.aiff"])
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager dateToResumeSounds](self, "dateToResumeSounds"));

    if (!v17)
    {
LABEL_14:
      unsigned __int8 v21 = (os_log_s *)[objc_allocWithZone((Class)VOTOutputAction) initWithSoundPath:v8];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
      -[os_log_s setObject:forVariant:](v21, "setObject:forVariant:", v23, 43LL);

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager componentForType:](self, "componentForType:", 1LL));
      [v24 playSoundFast:v21 startedBlock:v9 completionBlock:v10];

LABEL_17:
      goto LABEL_18;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager dateToResumeSounds](self, "dateToResumeSounds"));
    id v20 = [v18 compare:v19];

    if (v20 != (id)-1LL)
    {
      -[VOTOutputManager setDateToResumeSounds:](self, "setDateToResumeSounds:", 0LL);
      goto LABEL_14;
    }
  }

+ (void)logSoundPlayed:(id)a3
{
  id v3 = a3;
  [(id)qword_1001ACBF0 lock];
  if ((unint64_t)[(id)qword_1001ACBE8 count] >= 0xB) {
    objc_msgSend( (id)qword_1001ACBE8,  "removeObjectsInRange:",  0,  (char *)objc_msgSend((id)qword_1001ACBE8, "count") - 10);
  }
  [(id)qword_1001ACBE8 addObject:v3];
  [(id)qword_1001ACBF0 unlock];
}

- (void)playSoundFast:(id)a3
{
}

- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputManager speechComponent](self, "speechComponent"));
  LOBYTE(v3) = [v4 replacesCharacterAsPunctuation:v3];

  return v3;
}

- (void)sendEvent:(id)a3
{
  id v8 = a3;
  if (([(id)VOTSharedWorkspace outputDisabled] & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEventDispatcher sharedInstance](&OBJC_CLASS___VOSOutputEventDispatcher, "sharedInstance"));
    [v4 sendEvent:v8];

    if ([v8 supportsSoundEffect])
    {
      BOOL v6 = (void *)objc_opt_class(self, v5);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 rawValue]);
      [v6 logSoundPlayed:v7];
    }
  }
}

- (void)addVOSEventFinishedHandler:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_vosEventHandlers)
  {
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    vosEventHandlers = self->_vosEventHandlers;
    self->_vosEventHandlers = v7;
  }

  id v9 = objc_retainBlock(v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_vosEventHandlers, "setObject:forKeyedSubscript:", v9, v6);
}

- (void)addVOSEventStartedHandler:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_vosEventStartedHandlers)
  {
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    vosEventStartedHandlers = self->_vosEventStartedHandlers;
    self->_vosEventStartedHandlers = v7;
  }

  id v9 = objc_retainBlock(v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_vosEventStartedHandlers,  "setObject:forKeyedSubscript:",  v9,  v6);
}

- (void)removeVOSEventFinishedHandler:(id)a3
{
}

- (void)removeVOSEventStartedHandler:(id)a3
{
}

- (void)dispatcher:(id)a3 handleEvent:(id)a4 soundPack:(id)a5 hapticPack:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(id)VOTSharedWorkspace pauseSpeechAndHaptics];
  if ((_DWORD)v12)
  {
    uint64_t v14 = VOTLogAudio(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Not dispatching event because speech and haptics is currently paused",  buf,  2u);
    }
  }

  else
  {
    uint64_t v16 = VOTLogCommon(v12);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000EF294();
    }

    if ([v9 shouldPlaySoundForEvent:v10])
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 soundAssetURLForOutputEvent:v10]);
      uint64_t v19 = VOTLogCommon(v18);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1000EF230();
      }

      if (v18)
      {
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sounds/%@",  v21));

        v23[4] = self;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100010DC4;
        v24[3] = &unk_100176EC0;
        v24[4] = self;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100010E6C;
        v23[3] = &unk_100176EC0;
        -[VOTOutputManager playSoundFast:startedBlock:completionBlock:]( self,  "playSoundFast:startedBlock:completionBlock:",  v22,  v24,  v23);
      }
    }

    [v9 shouldPlayHapticForEvent:v10];
  }
}

- (void)addOutputManagerObserver:(id)a3
{
  if (a3)
  {
    outputManagerObserversLock = self->_outputManagerObserversLock;
    id v5 = a3;
    -[NSLock lock](outputManagerObserversLock, "lock");
    -[NSHashTable addObject:](self->_outputManagerObservers, "addObject:", v5);

    -[NSLock unlock](self->_outputManagerObserversLock, "unlock");
  }

- (void)removeOutputManagerObserver:(id)a3
{
  if (a3)
  {
    outputManagerObserversLock = self->_outputManagerObserversLock;
    id v5 = a3;
    -[NSLock lock](outputManagerObserversLock, "lock");
    -[NSHashTable removeObject:](self->_outputManagerObservers, "removeObject:", v5);

    -[NSLock unlock](self->_outputManagerObserversLock, "unlock");
  }

- (void)removeAllOutputManagerObservers
{
}

- (void)_notifyObserversOutputManagerDidFinishProcessingQueuedRequests
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_outputManagerObservers, "allObjects"));
  -[NSLock unlock](self->_outputManagerObserversLock, "unlock");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * (void)v8),  "outputManagerDidFinishProcessingQueuedRequests:",  self,  (void)v9);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_notifyObserversOutputManagerWillProcessNextRequest:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_outputManagerObserversLock, "lock");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_outputManagerObservers, "allObjects"));
  -[NSLock unlock](self->_outputManagerObserversLock, "unlock");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v10),  "outputManager:willProcessNextRequest:",  self,  v4,  (void)v11);
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (AXAccessQueue)audioSessionQueue
{
  return self->_audioSessionQueue;
}

- (id)airTunesRouteIsAirPlayingTestingBlock
{
  return self->_airTunesRouteIsAirPlayingTestingBlock;
}

- (void)setAirTunesRouteIsAirPlayingTestingBlock:(id)a3
{
}

- (NSDate)dateToResumeRequests
{
  return self->_dateToResumeRequests;
}

- (void)setDateToResumeRequests:(id)a3
{
}

- (NSDate)dateToResumeSounds
{
  return self->_dateToResumeSounds;
}

- (void)setDateToResumeSounds:(id)a3
{
}

- (NSString)currentRouteName
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setCurrentRouteName:(id)a3
{
}

- (BOOL)audioSessionActive
{
  return self->_audioSessionActive;
}

- (void).cxx_destruct
{
}

@end