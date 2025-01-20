@interface PBCaptionsOnMuteController
+ (id)_preferredCaptionLanguageCode;
+ (id)sharedInstance;
- (BOOL)isDisplayingCaptionsOnMute;
- (BOOL)isMuted;
- (NSMutableDictionary)volumeSourceStateDictionary;
- (NSString)lastPreferredCaptionsLanguageCode;
- (NSUserDefaults)avKitDefaults;
- (NSUserDefaults)soundDefaults;
- (PBCaptionsOnMuteController)init;
- (TVSStateMachine)stateMachine;
- (id)_volumeStateForSource:(unint64_t)a3;
- (int64_t)lastCaptionsDisplayType;
- (void)_hideCaptions;
- (void)_initializeStateMachine;
- (void)_showCaptions;
- (void)_updateMutedState;
- (void)dealloc;
- (void)noteVolumeLevel:(id)a3 fromSource:(unint64_t)a4 sourceTracksVolumeLevel:(BOOL)a5;
- (void)setAvKitDefaults:(id)a3;
- (void)setDisplayingCaptionsOnMute:(BOOL)a3;
- (void)setLastCaptionsDisplayType:(int64_t)a3;
- (void)setLastPreferredCaptionsLanguageCode:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setSoundDefaults:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setVolumeSourceStateDictionary:(id)a3;
@end

@implementation PBCaptionsOnMuteController

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100159DDC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004710F8 != -1) {
    dispatch_once(&qword_1004710F8, block);
  }
  return (id)qword_1004710F0;
}

- (PBCaptionsOnMuteController)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBCaptionsOnMuteController;
  v2 = -[PBCaptionsOnMuteController init](&v12, "init");
  if (v2 && _os_feature_enabled_impl("PineBoard", "CaptionsOnMute"))
  {
    -[PBCaptionsOnMuteController _initializeStateMachine](v2, "_initializeStateMachine");
    v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.preferences-sounds");
    soundDefaults = v2->_soundDefaults;
    v2->_soundDefaults = v3;

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.avkit");
    avKitDefaults = v2->_avKitDefaults;
    v2->_avKitDefaults = v5;

    v2->_lastCaptionsDisplayType = 1LL;
    v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    volumeSourceStateDictionary = v2->_volumeSourceStateDictionary;
    v2->_volumeSourceStateDictionary = v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100159F20,  kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBCaptionsOnMuteController stateMachine](v2, "stateMachine"));
    [v10 postEvent:@"Ready"];
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBCaptionsOnMuteController;
  -[PBCaptionsOnMuteController dealloc](&v4, "dealloc");
}

- (void)noteVolumeLevel:(id)a3 fromSource:(unint64_t)a4 sourceTracksVolumeLevel:(BOOL)a5
{
  id v8 = a3;
  if (_os_feature_enabled_impl("PineBoard", "CaptionsOnMute"))
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10015A0A0;
    block[3] = &unk_1003D98B0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a4;
    id v10 = v8;
    BOOL v12 = a5;
    dispatch_async(&_dispatch_main_q, block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isDisplayingCaptionsOnMute
{
  return -[NSUserDefaults BOOLForKey:](self->_soundDefaults, "BOOLForKey:", @"isDisplayingCaptionsOnMute");
}

- (void)setDisplayingCaptionsOnMute:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[PBCaptionsOnMuteController isDisplayingCaptionsOnMute](self, "isDisplayingCaptionsOnMute") != a3) {
    -[NSUserDefaults setBool:forKey:](self->_soundDefaults, "setBool:forKey:", v3, @"isDisplayingCaptionsOnMute");
  }
}

- (void)_initializeStateMachine
{
  objc_super v4 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:stateChangeHandler:",  @"CaptionsOnMute",  @"Initial",  0LL,  0LL);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v4;

  v6 = self->_stateMachine;
  id v7 = sub_1000F69AC();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TVSStateMachine setLogObject:](v6, "setLogObject:", v8);

  objc_initWeak(&location, self);
  v9 = self->_stateMachine;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10015A784;
  v42[3] = &unk_1003D0990;
  objc_copyWeak(&v43, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v9,  "registerHandlerForEvent:onState:withBlock:",  @"Ready",  @"Initial",  v42);
  id v10 = self->_stateMachine;
  v46[0] = @"Mute";
  v46[1] = @"Unmute";
  v46[2] = @"DisplayingCaptions";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 3LL));
  v45 = @"Disabled";
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10015A828;
  v40[3] = &unk_1003D98D8;
  objc_copyWeak(v41, &location);
  v41[1] = (id)a2;
  v40[4] = self;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v10,  "registerHandlerForEvents:onStates:withBlock:",  v11,  v12,  v40);

  v13 = self->_stateMachine;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10015A928;
  v38[3] = &unk_1003D98D8;
  objc_copyWeak(v39, &location);
  v39[1] = (id)a2;
  v38[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v13,  "registerHandlerForEvent:onState:withBlock:",  @"ShowWhenMutedPrefUpdated",  @"Disabled",  v38);
  v14 = self->_stateMachine;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10015AAAC;
  v36[3] = &unk_1003D98D8;
  objc_copyWeak(v37, &location);
  v37[1] = (id)a2;
  v36[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v14,  "registerHandlerForEvent:onState:withBlock:",  @"Mute",  @"Idle",  v36);
  v15 = self->_stateMachine;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10015ABA4;
  v34[3] = &unk_1003D98D8;
  objc_copyWeak(v35, &location);
  v35[1] = (id)a2;
  v34[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"Unmute",  @"Idle",  v34);
  v16 = self->_stateMachine;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10015ACA4;
  v32[3] = &unk_1003D98D8;
  objc_copyWeak(v33, &location);
  v33[1] = (id)a2;
  v32[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v16,  "registerHandlerForEvent:onState:withBlock:",  @"DisplayingCaptions",  @"Idle",  v32);
  v17 = self->_stateMachine;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10015ADA4;
  v30[3] = &unk_1003D98D8;
  objc_copyWeak(v31, &location);
  v31[1] = (id)a2;
  v30[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v17,  "registerHandlerForEvent:onState:withBlock:",  @"ShowWhenMutedPrefUpdated",  @"Idle",  v30);
  v18 = self->_stateMachine;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10015AEB8;
  v28[3] = &unk_1003D98D8;
  objc_copyWeak(v29, &location);
  v29[1] = (id)a2;
  v28[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v18,  "registerHandlerForEvent:onState:withBlock:",  @"Mute",  @"DisplayingCaptions",  v28);
  v19 = self->_stateMachine;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10015AFB8;
  v26[3] = &unk_1003D98D8;
  objc_copyWeak(v27, &location);
  v27[1] = (id)a2;
  v26[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v19,  "registerHandlerForEvent:onState:withBlock:",  @"Unmute",  @"DisplayingCaptions",  v26);
  v20 = self->_stateMachine;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10015B0B0;
  v24[3] = &unk_1003D98D8;
  objc_copyWeak(v25, &location);
  v25[1] = (id)a2;
  v24[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v20,  "registerHandlerForEvent:onState:withBlock:",  @"DisplayingCaptions",  @"DisplayingCaptions",  v24);
  v21 = self->_stateMachine;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10015B1B0;
  v22[3] = &unk_1003D0990;
  objc_copyWeak(&v23, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v21,  "registerHandlerForEvent:onState:withBlock:",  @"ShowWhenMutedPrefUpdated",  @"DisplayingCaptions",  v22);
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v23);
  objc_destroyWeak(v25);
  objc_destroyWeak(v27);
  objc_destroyWeak(v29);
  objc_destroyWeak(v31);
  objc_destroyWeak(v33);
  objc_destroyWeak(v35);
  objc_destroyWeak(v37);
  objc_destroyWeak(v39);
  objc_destroyWeak(v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (id)_volumeStateForSource:(unint64_t)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
  v5 = (_PBVolumeState *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_volumeSourceStateDictionary, "objectForKey:", v4));
  if (!v5)
  {
    v5 = objc_alloc_init(&OBJC_CLASS____PBVolumeState);
    -[NSMutableDictionary setObject:forKey:](self->_volumeSourceStateDictionary, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_updateMutedState
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 0;
  volumeSourceStateDictionary = self->_volumeSourceStateDictionary;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  id v11[2] = sub_10015B444;
  v11[3] = &unk_1003D9900;
  v11[4] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( volumeSourceStateDictionary,  "enumerateKeysAndObjectsUsingBlock:",  v11);
  -[PBCaptionsOnMuteController setMuted:](self, "setMuted:", *((_DWORD *)v13 + 6) == 2);
  int v4 = *((_DWORD *)v13 + 6);
  if (v4 == 1) {
    v5 = @"unmuted";
  }
  else {
    v5 = @"undefined";
  }
  id v6 = sub_1000F69AC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"muted";
    if (v4 != 2) {
      id v8 = v5;
    }
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Calculated updated overall mute state: %{public}@",  buf,  0xCu);
  }

  stateMachine = self->_stateMachine;
  if (-[PBCaptionsOnMuteController isMuted](self, "isMuted")) {
    id v10 = @"Mute";
  }
  else {
    id v10 = @"Unmute";
  }
  -[TVSStateMachine postEvent:](stateMachine, "postEvent:", v10);
  _Block_object_dispose(&v12, 8);
}

- (void)_showCaptions
{
  if (!-[PBCaptionsOnMuteController isDisplayingCaptionsOnMute](self, "isDisplayingCaptionsOnMute"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    self->_lastCaptionsDisplayType = (int64_t)[v3 subtitleDisplayType];

    if (-[NSUserDefaults BOOLForKey:](self->_avKitDefaults, "BOOLForKey:", @"isDisplayingCaptionsOnSkipBack")
      && self->_lastCaptionsDisplayType == 2)
    {
      id v4 = sub_1000F69AC();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AVKit may be forcing on subtitles, deferring to the user's preference for automatic subtitles",  buf,  2u);
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
      self->_lastCaptionsDisplayType = [v6 BOOLForKey:@"AutomaticSubtitlesEnabled" defaultValue:1];
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    id v8 = [v7 subtitleDisplayType];

    if (v8 != (id)2)
    {
      id v9 = sub_1000F69AC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing show captions", v15, 2u);
      }

      v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization systemLanguage]( &OBJC_CLASS___TVSInternationalization,  "systemLanguage"));
      if (v11) {
        MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v11);
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
      [v12 setSubtitleDisplayType:2];
    }

    v13 = (NSString *)objc_claimAutoreleasedReturnValue( +[PBCaptionsOnMuteController _preferredCaptionLanguageCode]( &OBJC_CLASS___PBCaptionsOnMuteController,  "_preferredCaptionLanguageCode"));
    lastPreferredCaptionsLanguageCode = self->_lastPreferredCaptionsLanguageCode;
    self->_lastPreferredCaptionsLanguageCode = v13;

    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"DisplayingCaptions");
    -[PBCaptionsOnMuteController setDisplayingCaptionsOnMute:](self, "setDisplayingCaptionsOnMute:", 1LL);
  }

- (void)_hideCaptions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v4 = [v3 subtitleDisplayType];

  if (v4 == (id)2 && -[PBCaptionsOnMuteController isDisplayingCaptionsOnMute](self, "isDisplayingCaptionsOnMute"))
  {
    v5 = self->_lastPreferredCaptionsLanguageCode;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBCaptionsOnMuteController _preferredCaptionLanguageCode]( &OBJC_CLASS___PBCaptionsOnMuteController,  "_preferredCaptionLanguageCode"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v5));
    if (!v5
      || -[NSString isEqualToString:](v5, "isEqualToString:", v6)
      || v7
      && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 languageCode]),
          unsigned int v9 = [v8 isEqualToString:v6],
          v8,
          v9))
    {
      id v10 = sub_1000F69AC();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Performing hide captions",  (uint8_t *)&v16,  2u);
      }

      int64_t lastCaptionsDisplayType = self->_lastCaptionsDisplayType;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
      [v13 setSubtitleDisplayType:lastCaptionsDisplayType];
    }

    else
    {
      id v15 = sub_1000F69AC();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        v17 = v5;
        __int16 v18 = 2114;
        v19 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Not hiding captions because the preferred language code (%{public}@) has been altered (%{public}@) since we st arted displaying captions",  (uint8_t *)&v16,  0x16u);
      }
    }

    lastPreferredCaptionsLanguageCode = self->_lastPreferredCaptionsLanguageCode;
    self->_lastPreferredCaptionsLanguageCode = 0LL;
  }

  -[PBCaptionsOnMuteController setDisplayingCaptionsOnMute:](self, "setDisplayingCaptionsOnMute:", 0LL);
}

+ (id)_preferredCaptionLanguageCode
{
  CFArrayRef v2 = MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray firstObject](v2, "firstObject"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  return v8;
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSUserDefaults)avKitDefaults
{
  return self->_avKitDefaults;
}

- (void)setAvKitDefaults:(id)a3
{
}

- (NSUserDefaults)soundDefaults
{
  return self->_soundDefaults;
}

- (void)setSoundDefaults:(id)a3
{
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (int64_t)lastCaptionsDisplayType
{
  return self->_lastCaptionsDisplayType;
}

- (void)setLastCaptionsDisplayType:(int64_t)a3
{
  self->_int64_t lastCaptionsDisplayType = a3;
}

- (NSString)lastPreferredCaptionsLanguageCode
{
  return self->_lastPreferredCaptionsLanguageCode;
}

- (void)setLastPreferredCaptionsLanguageCode:(id)a3
{
}

- (NSMutableDictionary)volumeSourceStateDictionary
{
  return self->_volumeSourceStateDictionary;
}

- (void)setVolumeSourceStateDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end