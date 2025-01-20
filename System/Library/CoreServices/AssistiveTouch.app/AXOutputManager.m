@interface AXOutputManager
+ (AXOutputManager)sharedOutputManager;
- (AXAccessQueue)outputAccessQueue;
- (AXOutputManager)init;
- (BOOL)_scatLanguage:(id)a3 matchesOverrideLanguage:(id)a4;
- (BOOL)_scatOutputCanSpeakString:(id)a3 withLanguage:(id)a4;
- (BOOL)_usesAVAudioPlayer;
- (BOOL)areSoundEffectsEnabled;
- (BOOL)isSoundAudioSessionActive;
- (BOOL)isSpeechAudioSessionActive;
- (BOOL)isSpeechEnabled;
- (BOOL)scanningInterruptsSpeech;
- (NSMutableArray)cachedRecentSpeechOutputRequests;
- (NSMutableDictionary)registeredSoundIDs;
- (NSMutableDictionary)soundIDsToAudioPlayer;
- (NSMutableSet)activeSoundIDs;
- (NSMutableSet)unfinishedSpeechActionsWithCompletionBlocks;
- (NSNumber)cacheSCVolumeForDuckingOff;
- (TTSSpeechManager)speechManager;
- (float)_volume;
- (id)_scatProcessAttributedString:(id)a3;
- (id)_urlForSoundEffect:(int)a3;
- (id)_voiceOverBundle;
- (id)processAXOutputAction:(id)a3;
- (id)selectionForLanguage:(id)a3;
- (unint64_t)lastSetOptions;
- (void)_applySelectionToAction:(id)a3 selection:(id)a4;
- (void)_audioPlayerFinished:(id)a3;
- (void)_flushSoundIDs;
- (void)_playSoundWithSoundID:(unsigned int)a3;
- (void)_scatAddCompletionBlockToAction:(id)a3 completionBlock:(id)a4;
- (void)_setDuckingLevelAlways:(double)a3;
- (void)_setDuckingLevelOnlySpeaking:(double)a3;
- (void)_setDuckingProperties;
- (void)_setUnDuckingProperties;
- (void)_updateAudioSessionProperties;
- (void)_updateDuckingMode;
- (void)_updateSoundEffect:(int)a3 isActive:(BOOL)a4;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)cancelSpeech;
- (void)clearRecentSpeech;
- (void)dealloc;
- (void)dispatchSpeechAction:(id)a3;
- (void)outputScannerAnnouncement:(id)a3 completionBlock:(id)a4;
- (void)outputScannerAttributedString:(id)a3 completionBlock:(id)a4;
- (void)outputScannerFocusContext:(id)a3 completion:(id)a4;
- (void)playMouseClickSound;
- (void)playSound:(int)a3;
- (void)setActiveSoundIDs:(id)a3;
- (void)setCacheSCVolumeForDuckingOff:(id)a3;
- (void)setCachedRecentSpeechOutputRequests:(id)a3;
- (void)setLastSetOptions:(unint64_t)a3;
- (void)setOutputAccessQueue:(id)a3;
- (void)setRecentSpeechOutputStrings:(id)a3;
- (void)setRegisteredSoundIDs:(id)a3;
- (void)setSoundAudioSessionActive:(BOOL)a3;
- (void)setSoundEffectsEnabled:(BOOL)a3;
- (void)setSoundIDsToAudioPlayer:(id)a3;
- (void)setSpeechAudioSessionActive:(BOOL)a3;
- (void)setSpeechEnabled:(BOOL)a3;
- (void)setSpeechManager:(id)a3;
- (void)setUnfinishedSpeechActionsWithCompletionBlocks:(id)a3;
@end

@implementation AXOutputManager

+ (AXOutputManager)sharedOutputManager
{
  if (qword_100157770 != -1) {
    dispatch_once(&qword_100157770, &stru_100124778);
  }
  return (AXOutputManager *)(id)qword_100157768;
}

- (AXOutputManager)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___AXOutputManager;
  v2 = -[AXOutputManager init](&v28, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    soundIDsToAudioPlayer = v2->_soundIDsToAudioPlayer;
    v2->_soundIDsToAudioPlayer = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeSoundIDs = v2->_activeSoundIDs;
    v2->_activeSoundIDs = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    registeredSoundIDs = v2->_registeredSoundIDs;
    v2->_registeredSoundIDs = v7;

    v9 = objc_alloc(&OBJC_CLASS___AXAccessQueue);
    *(void *)&double v11 = objc_opt_class(v2, v10).n128_u64[0];
    v13 = -[AXAccessQueue initWithParentClass:description:appendUUIDToLabel:]( v9,  "initWithParentClass:description:appendUUIDToLabel:",  v12,  &stru_100127100,  0LL,  v11);
    outputAccessQueue = v2->_outputAccessQueue;
    v2->_outputAccessQueue = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    unfinishedSpeechActionsWithCompletionBlocks = v2->_unfinishedSpeechActionsWithCompletionBlocks;
    v2->_unfinishedSpeechActionsWithCompletionBlocks = (NSMutableSet *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    cachedRecentSpeechOutputRequests = v2->_cachedRecentSpeechOutputRequests;
    v2->_cachedRecentSpeechOutputRequests = (NSMutableArray *)v17;

    v2->_lastSetOptions = 0LL;
    LODWORD(v19) = 1.0;
    v2->_cacheSCVolumeForDuckingOff = (NSNumber *) +[NSNumber numberWithFloat:]( &OBJC_CLASS___NSNumber,  "numberWithFloat:",  v19);
    objc_initWeak(&location, v2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10008FFD4;
    v25[3] = &unk_100121EE8;
    objc_copyWeak(&v26, &location);
    [v20 registerUpdateBlock:v25 forRetrieveSelector:"voiceOverMediaDuckingAmount" withListener:v2];

    objc_destroyWeak(&v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100090000;
    v23[3] = &unk_100121EE8;
    objc_copyWeak(&v24, &location);
    [v21 registerUpdateBlock:v23 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:v2];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXOutputManager;
  -[AXOutputManager dealloc](&v3, "dealloc");
}

- (void)setSpeechEnabled:(BOOL)a3
{
  if (self->_speechEnabled != a3)
  {
    if (a3)
    {
      if (!self->_speechManager)
      {
        v5 = objc_alloc_init(&OBJC_CLASS___TTSSpeechManager);
        speechManager = self->_speechManager;
        self->_speechManager = v5;

        -[TTSSpeechManager setSpeechSource:](self->_speechManager, "setSpeechSource:", AXSpeechSourceKeySwitchControl);
        -[TTSSpeechManager setAudioSessionCategory:]( self->_speechManager,  "setAudioSessionCategory:",  AVAudioSessionCategoryVoiceOver);
        -[TTSSpeechManager setUsesAuxiliarySession:](self->_speechManager, "setUsesAuxiliarySession:", 1LL);
        -[AXOutputManager _updateAudioSessionProperties](self, "_updateAudioSessionProperties");
      }
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[AXOutputManager unfinishedSpeechActionsWithCompletionBlocks]( self,  "unfinishedSpeechActionsWithCompletionBlocks"));
      id v8 = [v7 copy];

      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
            uint64_t v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionCallback", (void)v23));
            ((void (**)(void, void *, void))v15)[2](v15, v14, 0LL);
          }

          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v11);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue( -[AXOutputManager unfinishedSpeechActionsWithCompletionBlocks]( self,  "unfinishedSpeechActionsWithCompletionBlocks"));
      id v17 = [v16 count];

      if (v17)
      {
        uint64_t v19 = SWCHLogCommon(v18);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_1000AFAB0(v20);
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue( -[AXOutputManager unfinishedSpeechActionsWithCompletionBlocks]( self,  "unfinishedSpeechActionsWithCompletionBlocks",  (void)v23));
      [v21 removeAllObjects];

      -[TTSSpeechManager tearDown](self->_speechManager, "tearDown");
      v22 = self->_speechManager;
      self->_speechManager = 0LL;

      self->_lastSetOptions = 0LL;
    }

    self->_speechEnabled = a3;
  }

- (void)setSpeechAudioSessionActive:(BOOL)a3
{
  if (self->_speechAudioSessionActive != a3) {
    self->_speechAudioSessionActive = a3;
  }
}

- (void)setSoundAudioSessionActive:(BOOL)a3
{
  if (self->_soundAudioSessionActive != a3) {
    self->_soundAudioSessionActive = a3;
  }
}

- (id)_voiceOverBundle
{
  return +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/CoreServices/VoiceOverTouch.app");
}

- (BOOL)isSpeechEnabled
{
  if (self->_speechEnabled)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    unsigned int v3 = [v2 isSystemSleeping] ^ 1;
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)areSoundEffectsEnabled
{
  if (self->_soundEffectsEnabled)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    unsigned int v3 = [v2 isSystemSleeping] ^ 1;
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)playSound:(int)a3
{
  if (-[AXOutputManager areSoundEffectsEnabled](self, "areSoundEffectsEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager outputAccessQueue](self, "outputAccessQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000903F4;
    v6[3] = &unk_1001247A0;
    v6[4] = self;
    int v7 = a3;
    [v5 performAsynchronousWritingBlock:v6];
  }

- (void)playMouseClickSound
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v3 = [v2 assistiveTouchMouseClickSoundsEnabled];

  if (v3)
  {
    if (qword_100157780 != -1) {
      dispatch_once(&qword_100157780, &stru_1001247C0);
    }
    AudioServicesPlaySoundWithBehavior(dword_100157778, 1111LL);
  }

- (void)dispatchSpeechAction:(id)a3
{
  id v10 = a3;
  [v10 setShouldProcessEmoji:1];
  -[AXOutputManager _volume](self, "_volume");
  [v10 setVolume:v4];
  -[TTSSpeechManager dispatchSpeechAction:](self->_speechManager, "dispatchSpeechAction:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager cachedRecentSpeechOutputRequests](self, "cachedRecentSpeechOutputRequests"));
  id v6 = [v5 count];

  if (v6 == (id)10)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager cachedRecentSpeechOutputRequests](self, "cachedRecentSpeechOutputRequests"));
    [v7 removeObjectAtIndex:0];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 string]);
  if ([v8 length])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager cachedRecentSpeechOutputRequests](self, "cachedRecentSpeechOutputRequests"));
    [v9 addObject:v8];
  }
}

- (void)cancelSpeech
{
}

- (void)clearRecentSpeech
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[AXOutputManager cachedRecentSpeechOutputRequests](self, "cachedRecentSpeechOutputRequests"));
  [v2 removeAllObjects];
}

- (void)_playSoundWithSoundID:(unsigned int)a3
{
}

- (void)_flushSoundIDs
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager outputAccessQueue](self, "outputAccessQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100090948;
  v4[3] = &unk_100121D18;
  v4[4] = self;
  [v3 performSynchronousWritingBlock:v4];
}

- (id)_urlForSoundEffect:(int)a3
{
  switch(a3)
  {
    case 1000:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sounds/ElementBorder.aiff",  v6);
      goto LABEL_10;
    case 1001:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sounds/Select.aiff",  v6);
      goto LABEL_10;
    case 1002:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sounds/PopupAppeared.aiff",  v6);
      goto LABEL_10;
    case 1003:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/Sounds/Alert.aiff", v6);
      goto LABEL_10;
    case 1004:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sounds/WrapBoundary.aiff",  v6);
      goto LABEL_10;
    case 1005:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sounds/ScreenChange.aiff",  v6);
      goto LABEL_10;
    case 1006:
      id v4 = objc_allocWithZone(&OBJC_CLASS___NSURL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _voiceOverBundle](self, "_voiceOverBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sounds/iOSScreenOff.aiff",  v6);
LABEL_10:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v8 = [v4 initFileURLWithPath:v9 isDirectory:0];

      break;
    default:
      char v11 = 1;
      _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, v11, @"AXSoundEffect was not recognized");
      id v8 = 0LL;
      break;
  }

  return v8;
}

- (void)_updateAudioSessionProperties
{
  if (self->_speechManager)
  {
    uint64_t v3 = SWCHLogCommon(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v5 voiceOverMediaDuckingMode]));
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Update audio session properties: ducking mode: %@.",  buf,  0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v8 = [v7 voiceOverMediaDuckingMode];

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      if ([v9 voiceOverMediaDuckingMode] == (id)2) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = 2LL;
      }

      -[AXOutputManager _setDuckingProperties](self, "_setDuckingProperties");
    }

    else
    {
      -[AXOutputManager _setUnDuckingProperties](self, "_setUnDuckingProperties");
      uint64_t v10 = 1LL;
    }

    unint64_t v11 = -[AXOutputManager lastSetOptions](self, "lastSetOptions");
    if (v10 == v11)
    {
      uint64_t v12 = SWCHLogCommon(v11);
      id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        return;
      }

      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_lastSetOptions));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      __int16 v22 = 2112;
      __int128 v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Not updating audio session. New options are the same as current options: (lastSet: %@, newSet: %@)",  buf,  0x16u);
    }

    else
    {
      -[AXOutputManager setLastSetOptions:](self, "setLastSetOptions:", v10);
      -[TTSSpeechManager setAudioSessionCategoryOptions:](self->_speechManager, "setAudioSessionCategoryOptions:", v10);
      if (!-[AXOutputManager _usesAVAudioPlayer](self, "_usesAVAudioPlayer")) {
        return;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      id v19 = 0LL;
      [v16 setCategory:AVAudioSessionCategoryVoiceOver withOptions:v10 error:&v19];
      id v13 = v19;

      if (!v13) {
        goto LABEL_18;
      }
      uint64_t v18 = SWCHLogCommon(v17);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000AFB78();
      }
    }

    goto LABEL_18;
  }

- (void)_setDuckingProperties
{
  if (self->_speechManager)
  {
    uint64_t v3 = SWCHLogCommon(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v5 voiceOverMediaDuckingMode]));
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Updating audio ducking properties for audio ducking mode %@.",  (uint8_t *)&v12,  0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v7 voiceOverMediaDuckingAmount];
    double v9 = 1.0 - v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v11 = [v10 voiceOverMediaDuckingMode];

    if (v11 == (id)2)
    {
      -[AXOutputManager _setDuckingLevelAlways:](self, "_setDuckingLevelAlways:", 1.0 - v9);
    }

    else
    {
      -[AXOutputManager _setDuckingLevelAlways:](self, "_setDuckingLevelAlways:", 1.0);
      -[AXOutputManager _setDuckingLevelOnlySpeaking:](self, "_setDuckingLevelOnlySpeaking:", 1.0 - v9);
    }
  }

- (void)_setUnDuckingProperties
{
  if (self->_speechManager)
  {
    uint64_t v3 = SWCHLogCommon(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting ducking levels to default.", v5, 2u);
    }

    -[AXOutputManager _setDuckingLevelAlways:](self, "_setDuckingLevelAlways:", 1.0);
    -[AXOutputManager _setDuckingLevelOnlySpeaking:](self, "_setDuckingLevelOnlySpeaking:", 1.0);
  }

- (float)_volume
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 voiceOverEffectiveSpeakingVolume];
  float v4 = v3;

  return v4;
}

- (void)_updateDuckingMode
{
  if (self->_speechManager)
  {
    uint64_t v3 = SWCHLogCommon(self);
    float v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v5 voiceOverMediaDuckingMode]));
      int v7 = 138412290;
      double v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Update Switch Control audio ducking mode: %@.",  (uint8_t *)&v7,  0xCu);
    }

    -[AXOutputManager _updateAudioSessionProperties](self, "_updateAudioSessionProperties");
  }

- (void)_setDuckingLevelAlways:(double)a3
{
  if (self->_speechManager)
  {
    uint64_t v4 = SWCHLogCommon(self);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
      int v13 = 138412290;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting audio ducking ALWAYS to duckingVolume level %@.",  (uint8_t *)&v13,  0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    *(float *)&double v8 = a3;
    id v9 = [v7 setDuckScalarForVoiceOver:v8];
    if ((_DWORD)v9)
    {
      int v10 = (int)v9;
      uint64_t v11 = SWCHLogCommon(v9);
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000AFBDC(v10, v12);
      }
    }
  }

- (void)_setDuckingLevelOnlySpeaking:(double)a3
{
  if (self->_speechManager)
  {
    uint64_t v5 = SWCHLogCommon(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting audio ducking WHEN SPEAKING to ducking amount level %@.",  buf,  0xCu);
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TTSSpeechManager audioSession](self->_speechManager, "audioSession"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    id v18 = 0LL;
    id v10 = [v8 setDuckToLevelScalar:v9 unduckToLevelScalar:0 error:&v18];
    id v11 = v18;

    if (v11)
    {
      uint64_t v13 = SWCHLogCommon(v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000AFC50();
      }
    }

    uint64_t v15 = SWCHLogCommon(v12);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Updated audio ducking level result: %@",  buf,  0xCu);
    }
  }

- (void)_updateSoundEffect:(int)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager activeSoundIDs](self, "activeSoundIDs"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  if (v4) {
    [v7 addObject:v8];
  }
  else {
    [v7 removeObject:v8];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager activeSoundIDs](self, "activeSoundIDs"));
  id v10 = [v9 count];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  char v12 = (v10 != 0) ^ [v11 isActive];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v18 = 0LL;
    [v13 setActive:v10 != 0 withOptions:0 error:&v18];
    id v14 = v18;

    if (v14)
    {
      uint64_t v16 = SWCHLogCommon(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000AFCB4();
      }
    }
  }

- (void)_audioPlayerFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager soundIDsToAudioPlayer](self, "soundIDsToAudioPlayer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009177C;
  v7[3] = &unk_1001247E8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
}

- (BOOL)_usesAVAudioPlayer
{
  return 0;
}

- (NSMutableDictionary)registeredSoundIDs
{
  return self->_registeredSoundIDs;
}

- (void)setRegisteredSoundIDs:(id)a3
{
}

- (AXAccessQueue)outputAccessQueue
{
  return self->_outputAccessQueue;
}

- (void)setOutputAccessQueue:(id)a3
{
}

- (TTSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (BOOL)isSoundAudioSessionActive
{
  return self->_soundAudioSessionActive;
}

- (BOOL)isSpeechAudioSessionActive
{
  return self->_speechAudioSessionActive;
}

- (void)setSoundEffectsEnabled:(BOOL)a3
{
  self->_soundEffectsEnabled = a3;
}

- (void)setRecentSpeechOutputStrings:(id)a3
{
}

- (NSMutableDictionary)soundIDsToAudioPlayer
{
  return self->_soundIDsToAudioPlayer;
}

- (void)setSoundIDsToAudioPlayer:(id)a3
{
}

- (NSMutableSet)activeSoundIDs
{
  return self->_activeSoundIDs;
}

- (void)setActiveSoundIDs:(id)a3
{
}

- (NSMutableSet)unfinishedSpeechActionsWithCompletionBlocks
{
  return self->_unfinishedSpeechActionsWithCompletionBlocks;
}

- (void)setUnfinishedSpeechActionsWithCompletionBlocks:(id)a3
{
}

- (NSMutableArray)cachedRecentSpeechOutputRequests
{
  return self->_cachedRecentSpeechOutputRequests;
}

- (void)setCachedRecentSpeechOutputRequests:(id)a3
{
}

- (unint64_t)lastSetOptions
{
  return self->_lastSetOptions;
}

- (void)setLastSetOptions:(unint64_t)a3
{
  self->_lastSetOptions = a3;
}

- (NSNumber)cacheSCVolumeForDuckingOff
{
  return self->_cacheSCVolumeForDuckingOff;
}

- (void)setCacheSCVolumeForDuckingOff:(id)a3
{
  self->_cacheSCVolumeForDuckingOff = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

- (id)selectionForLanguage:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_100091A30;
  id v14 = sub_100091A40;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100091A48;
  v7[3] = &unk_100124810;
  id v9 = &v10;
  id v4 = dispatch_semaphore_create(0LL);
  id v8 = v4;
  +[AXPrefsBridge voiceSelectionForLanguageCode:completionHandler:]( &OBJC_CLASS____TtC15assistivetouchd13AXPrefsBridge,  "voiceSelectionForLanguageCode:completionHandler:",  v3,  v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_scatProcessAttributedString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_opt_class(&OBJC_CLASS___AXAttributedString, v6);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    unint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    id v28 = [v4 length];
    if (v28)
    {
      unint64_t v8 = 0LL;
      while (1)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesAtIndex:v8 effectiveRange:&v29]);
        uint64_t v10 = v9;
        if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v29, v30));
        id v12 = [[AXOutputAction alloc] initWithString:v11];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXOutputRequest addAttributesToAction:fromDictionary:]( &OBJC_CLASS___AXOutputRequest,  "addAttributesToAction:fromDictionary:",  v12,  v10));

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager processAXOutputAction:](self, "processAXOutputAction:", v13));
        [v14 setShouldProcessEmoji:1];
        [v11 rangeOfString:v11];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:16]);

        uint64_t v16 = 16LL;
        if (v15
          || (uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:15]),
              v17,
              uint64_t v16 = 15LL,
              v17))
        {
          [v14 setShouldDetectLanguage:1];
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:v16]);
          [v14 setLanguage:v18];
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 systemLanguageID]);

        uint64_t v21 = objc_claimAutoreleasedReturnValue([v14 language]);
        __int16 v22 = (void *)v21;
        if (v21) {
          __int128 v23 = (void *)v21;
        }
        else {
          __int128 v23 = v20;
        }
        id v24 = v23;

        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager selectionForLanguage:](self, "selectionForLanguage:", v24));
        -[AXOutputManager _applySelectionToAction:selection:](self, "_applySelectionToAction:selection:", v14, v25);

        [v5 addObject:v14];
        unint64_t v8 = v30 + v29;
        unint64_t v29 = v8;
      }
    }
  }

  else
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechAction actionWithString:shouldQueue:]( &OBJC_CLASS___TTSSpeechAction,  "actionWithString:shouldQueue:",  v4,  1LL));
    [v26 setShouldProcessEmoji:1];
    [v5 addObject:v26];
  }

- (void)_applySelectionToAction:(id)a3 selection:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceId]);
  [v22 setVoiceIdentifier:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 rate]);
  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 rate]);
    [v8 floatValue];
    [v22 setSpeakingRate:v9];
  }

  else
  {
    [v22 setSpeakingRate:0.5];
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 pitch]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 pitch]);
    [v11 floatValue];
    [v22 setPitch:v12];
  }

  else
  {
    [v22 setPitch:0.5];
  }

  [v22 pitch];
  double v14 = v13;
  [v22 pitch];
  if (v15 >= 0.5)
  {
    [v22 pitch];
    double v16 = (v17 + -1.0) * 2.0 + 2.0;
  }

  else
  {
    double v16 = v14 + 0.5;
  }

  float v18 = v16;
  [v22 setPitch:v18];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 volume]);
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 volume]);
    [v20 floatValue];
    [v22 setVolume:v21];
  }

  else
  {
    [v22 setVolume:1.0];
  }
}

- (id)processAXOutputAction:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 string]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechAction actionWithString:shouldQueue:]( &OBJC_CLASS___TTSSpeechAction,  "actionWithString:shouldQueue:",  v3,  1LL));

  return v4;
}

- (BOOL)_scatLanguage:(id)a3 matchesOverrideLanguage:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a4 lowercaseString]);
  id v7 = [v6 rangeOfString:@"-"];
  unint64_t v8 = v6;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 substringToIndex:v7]);
  }

  unsigned __int8 v9 = [v5 hasPrefix:v8];

  return v9;
}

- (BOOL)_scatOutputCanSpeakString:(id)a3 withLanguage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dialectForLanguageID:v5]);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dialectsThatCanSpeakString:v6]);

  LOBYTE(v6) = [v10 containsObject:v8];
  return (char)v6;
}

- (void)outputScannerFocusContext:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void))a4;
  if (!-[AXOutputManager isSpeechEnabled](self, "isSpeechEnabled")) {
    *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/AXOutputManager.m",  704LL,  "-[AXOutputManager(SCAT_Extras) outputScannerFocusContext:completion:]",  @"Speech output option should be enabled if you're calling this").n128_u64[0];
  }
  if (!-[AXOutputManager isSpeechEnabled](self, "isSpeechEnabled", v7))
  {
    v6[2](v6, 0LL);
    goto LABEL_19;
  }

  if ([v19 selectBehavior] == 4)
  {
    unint64_t v8 = @"EXIT_GROUP";
LABEL_11:
    id v16 = sub_10002B014(v8);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_14;
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v19 menuElement]);

  if (v9 == v10)
  {
    unint64_t v8 = @"EXIT_MENU";
    goto LABEL_11;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
  char v12 = objc_opt_respondsToSelector(v11, "scatSpeakableDescription:");

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
  double v14 = v13;
  if ((v12 & 1) != 0) {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scatSpeakableDescription:", objc_msgSend(v19, "isFirstInSequence")));
  }
  else {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 scatSpeakableDescription]);
  }
  double v17 = (void *)v15;

LABEL_14:
  id v18 = [v17 length];
  if (!v6 || v18) {
    -[AXOutputManager outputScannerAnnouncement:completionBlock:]( self,  "outputScannerAnnouncement:completionBlock:",  v17,  v6);
  }
  else {
    v6[2](v6, 0LL);
  }

LABEL_19:
}

- (void)outputScannerAnnouncement:(id)a3 completionBlock:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager speechManager](self, "speechManager"));
  [v7 stopSpeaking:0];

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager speechManager](self, "speechManager"));
  [v8 clearSpeechQueue];

  if ([v15 isAXAttributedString])
  {
    id v9 = [[AXAttributedString alloc] initWithString:v15];
    -[AXOutputManager outputScannerAttributedString:completionBlock:]( self,  "outputScannerAttributedString:completionBlock:",  v9,  v6);
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[TTSSpeechAction actionWithString:shouldQueue:]( &OBJC_CLASS___TTSSpeechAction,  "actionWithString:shouldQueue:",  v15,  1LL));
    [v9 setShouldProcessEmoji:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 systemLanguageID]);

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[AXOutputManager selectionForLanguage:](self, "selectionForLanguage:", v11));
    -[AXOutputManager _applySelectionToAction:selection:](self, "_applySelectionToAction:selection:", v9, v12);

    -[AXOutputManager _scatAddCompletionBlockToAction:completionBlock:]( self,  "_scatAddCompletionBlockToAction:completionBlock:",  v9,  v6);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    LOBYTE(v12) = [v13 isOKToSpeak];

    if ((v12 & 1) != 0)
    {
      -[AXOutputManager dispatchSpeechAction:](self, "dispatchSpeechAction:", v9);
    }

    else
    {
      double v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v9 completionCallback]);
      ((void (**)(void, id, void))v14)[2](v14, v9, 0LL);
    }

    id v6 = (id)v11;
  }
}

- (void)outputScannerAttributedString:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXOutputManager _scatProcessAttributedString:](self, "_scatProcessAttributedString:", a3));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  -[AXOutputManager _scatAddCompletionBlockToAction:completionBlock:]( self,  "_scatAddCompletionBlockToAction:completionBlock:",  v8,  v6);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  unsigned __int8 v10 = [v9 isOKToSpeak];

  if ((v10 & 1) != 0)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[AXOutputManager dispatchSpeechAction:]( self,  "dispatchSpeechAction:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15),  (void)v19);
          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v13);
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 completionCallback]);

    if (v17)
    {
      id v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v16 completionCallback]);
      ((void (**)(void, void *, void))v18)[2](v18, v16, 0LL);
    }
  }
}

- (void)_scatAddCompletionBlockToAction:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXOutputManager unfinishedSpeechActionsWithCompletionBlocks]( self,  "unfinishedSpeechActionsWithCompletionBlocks"));
    [v8 addObject:v6];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100092644;
    v9[3] = &unk_100124860;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    [v6 setCompletionCallback:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)scanningInterruptsSpeech
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchScannerSpeechIsInterruptedByScanning];

  return v3;
}

@end