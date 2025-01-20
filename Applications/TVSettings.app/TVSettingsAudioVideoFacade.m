@interface TVSettingsAudioVideoFacade
+ (id)_enhanceDialogueLevelPrefKey;
+ (id)sharedInstance;
- (BOOL)_enhanceDialogueSupportsAXLevels;
- (BOOL)atmosAvailable;
- (BOOL)atmosEnabled;
- (BOOL)audioFormatConversionEnabled;
- (BOOL)automaticSubtitles;
- (BOOL)displayVolumeUI;
- (BOOL)enhanceDialogueSupportsLevels;
- (BOOL)highQualityAudioEnabled;
- (BOOL)navigationSoundEffectsEnabled;
- (BOOL)showOnSkipBack;
- (BOOL)showWhenMuted;
- (BOOL)transitionSoundsAndPreviewAudioEnabled;
- (BOOL)videoTapToZoomEnabled;
- (NSArray)availableAudioLanguageCodes;
- (NSArray)availableEnhanceDialogueLevels;
- (NSArray)availableSubtitleLanguageOptions;
- (NSNumber)enhanceDialogueLevel;
- (NSString)preferredAudioLanguageCode;
- (NSString)subtitleLanguageOption;
- (TVSettingsAudioVideoFacade)init;
- (id)_availableDefaultAudioLanguages;
- (id)_availableDefaultSubtitleLanguages;
- (void)_didBecomeActive:(id)a3;
- (void)_updateAutomaticSubtitles;
- (void)_updateAvailableAudioLanguageCodes:(BOOL)a3;
- (void)_updateAvailableSubtitleLanguageOptions:(BOOL)a3;
- (void)_updateEnhanceDialogueLevel;
- (void)_updateEnhanceDialogueSupportsLevels;
- (void)_updateSelectedSubtitleOption:(BOOL)a3;
- (void)_updateShowOnSkipBack;
- (void)_updateShowWhenMuted;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAtmosEnabled:(BOOL)a3;
- (void)setAudioFormatConversionEnabled:(BOOL)a3;
- (void)setAutomaticSubtitles:(BOOL)a3;
- (void)setDisplayVolumeUI:(BOOL)a3;
- (void)setEnhanceDialogueLevel:(id)a3;
- (void)setHighQualityAudioEnabled:(BOOL)a3;
- (void)setNavigationSoundEffectsEnabled:(BOOL)a3;
- (void)setPreferredAudioLanguageCode:(id)a3;
- (void)setShowOnSkipBack:(BOOL)a3;
- (void)setShowWhenMuted:(BOOL)a3;
- (void)setSubtitleLanguageOption:(id)a3;
- (void)setTransitionSoundsAndPreviewAudioEnabled:(BOOL)a3;
- (void)setVideoTapToZoomEnabled:(BOOL)a3;
@end

@implementation TVSettingsAudioVideoFacade

+ (id)sharedInstance
{
  if (qword_1001E1670 != -1) {
    dispatch_once(&qword_1001E1670, &stru_10018FD50);
  }
  return (id)qword_1001E1668;
}

- (TVSettingsAudioVideoFacade)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoFacade;
  v2 = -[TVSettingsAudioVideoFacade init](&v19, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    [v3 addObserver:v2 forKeyPath:@"preferredAudioLanguageCode" options:0 context:off_1001DF7D0];
    [v3 addObserver:v2 forKeyPath:@"preferredSubtitleLanguageCode" options:0 context:off_1001DF7D8];
    [v3 addObserver:v2 forKeyPath:@"subtitleDisplayType" options:0 context:off_1001DF7E0];
    v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.preferences-sounds");
    soundsUserDefaults = v2->_soundsUserDefaults;
    v2->_soundsUserDefaults = v4;

    v6 = v2->_soundsUserDefaults;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade _enhanceDialogueLevelPrefKey]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "_enhanceDialogueLevelPrefKey"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v6,  "addObserver:forKeyPath:options:context:",  v2,  v7,  0LL,  off_1001DF7E8);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
    [v8 addObserver:v2 forKeyPath:@"enhanceDialogue" options:0 context:off_1001DF7F0];

    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v2->_soundsUserDefaults,  "addObserver:forKeyPath:options:context:",  v2,  @"enhancedialoguelevel",  0LL,  off_1001DF7F8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    -[TVSettingsAudioVideoFacade _updateEnhanceDialogueSupportsLevels](v2, "_updateEnhanceDialogueSupportsLevels");
    -[TVSettingsAudioVideoFacade _updateEnhanceDialogueLevel](v2, "_updateEnhanceDialogueLevel");
    -[TVSettingsAudioVideoFacade _updateAutomaticSubtitles](v2, "_updateAutomaticSubtitles");
    -[TVSettingsAudioVideoFacade _updateShowWhenMuted](v2, "_updateShowWhenMuted");
    -[TVSettingsAudioVideoFacade _updateShowOnSkipBack](v2, "_updateShowOnSkipBack");
    -[TVSettingsAudioVideoFacade _updateAvailableAudioLanguageCodes:](v2, "_updateAvailableAudioLanguageCodes:", 0LL);
    -[TVSettingsAudioVideoFacade _updateAvailableSubtitleLanguageOptions:]( v2,  "_updateAvailableSubtitleLanguageOptions:",  0LL);
    -[TVSettingsAudioVideoFacade _updateSelectedSubtitleOption:](v2, "_updateSelectedSubtitleOption:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    v2->_atmosEnabled = [v10 atmosEnabled];

    objc_initWeak(&location, v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100033348;
    v16[3] = &unk_10018E810;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v12,  v16));
    id appleTVServicesDomainObserver = v2->_appleTVServicesDomainObserver;
    v2->_id appleTVServicesDomainObserver = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"preferredAudioLanguageCode" context:off_1001DF7D0];
  [v3 removeObserver:self forKeyPath:@"preferredSubtitleLanguageCode" context:off_1001DF7D8];
  [v3 removeObserver:self forKeyPath:@"subtitleDisplayType" context:off_1001DF7E0];
  soundsUserDefaults = self->_soundsUserDefaults;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade _enhanceDialogueLevelPrefKey]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "_enhanceDialogueLevelPrefKey"));
  -[NSUserDefaults removeObserver:forKeyPath:context:]( soundsUserDefaults,  "removeObserver:forKeyPath:context:",  self,  v5,  off_1001DF7E8);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  [v6 removeObserver:self forKeyPath:@"enhanceDialogue" context:off_1001DF7F0];

  -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_soundsUserDefaults,  "removeObserver:forKeyPath:context:",  self,  @"enhancedialoguelevel",  off_1001DF7F8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoFacade;
  -[TVSettingsAudioVideoFacade dealloc](&v8, "dealloc");
}

- (void)setNavigationSoundEffectsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.preferences.sounds"));
  [v4 setBool:v3 forKey:@"keyboard-audio"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.preferences.sounds.changed", 0LL, 0LL, 1u);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 postNotificationName:NSUserDefaultsDidChangeNotification object:v6];
}

- (BOOL)navigationSoundEffectsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.preferences.sounds"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"keyboard-audio" defaultValue:1];

  return v3;
}

- (void)setTransitionSoundsAndPreviewAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v4 setPreviewPageAudioEnabled:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v5 setTransitionSoundEffectsEnabled:v3];
}

- (BOOL)transitionSoundsAndPreviewAudioEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  if ([v2 previewPageAudioEnabled])
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 transitionSoundEffectsEnabled];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSArray)availableEnhanceDialogueLevels
{
  if (-[TVSettingsAudioVideoFacade _enhanceDialogueSupportsAXLevels](self, "_enhanceDialogueSupportsAXLevels")) {
    return (NSArray *)&off_1001AEBC0;
  }
  else {
    return (NSArray *)&off_1001AEBD8;
  }
}

- (void)setSubtitleLanguageOption:(id)a3
{
  id v10 = a3;
  if (([v10 isEqual:self->_subtitleLanguageOption] & 1) == 0)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    if ([v10 isEqual:off_1001DF7B8[0]])
    {
      uint64_t v5 = 0LL;
      id v6 = 0LL;
    }

    else
    {
      unsigned int v7 = [v10 isEqual:off_1001DF7C0[0]];
      if (v7) {
        uint64_t v5 = 1LL;
      }
      else {
        uint64_t v5 = 2LL;
      }
      if (v7) {
        id v6 = 0LL;
      }
      else {
        id v6 = v10;
      }
    }

    [v4 setSubtitleDisplayType:v5];
    [v4 setPreferredSubtitleLanguageCode:v6];
    objc_super v8 = (NSString *)[v10 copy];
    subtitleLanguageOption = self->_subtitleLanguageOption;
    self->_subtitleLanguageOption = v8;
  }
}

- (void)setAutomaticSubtitles:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL automaticSubtitles = a3;
  id v5 = sub_10003398C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL automaticSubtitles = self->_automaticSubtitles;
    v15[0] = 67109120;
    v15[1] = automaticSubtitles;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "AutomaticSubtitles set to %d",  (uint8_t *)v15,  8u);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
  [v8 setBool:v3 forKey:@"AutomaticSubtitlesEnabled"];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v10 = v9;
  if (v3)
  {
    if (![v9 subtitleDisplayType] || objc_msgSend(v10, "subtitleDisplayType") == (id)2)
    {
      id v11 = sub_10003398C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setSubtitleDisplayType set to TVSettingsSubtitleLanguageAuto automatically",  (uint8_t *)v15,  2u);
      }

      uint64_t v13 = 1LL;
LABEL_13:

      [v10 setSubtitleDisplayType:v13];
    }
  }

  else if (-[NSString isEqual:](self->_subtitleLanguageOption, "isEqual:", off_1001DF7C0[0]))
  {
    id v14 = sub_10003398C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "SubtitleDisplayType set to TVPSubtitleDisplayTypeForcedOnly automatically",  (uint8_t *)v15,  2u);
    }

    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

  -[TVSettingsAudioVideoFacade _updateSelectedSubtitleOption:](self, "_updateSelectedSubtitleOption:", 1LL);
  -[TVSettingsAudioVideoFacade _updateAvailableSubtitleLanguageOptions:]( self,  "_updateAvailableSubtitleLanguageOptions:",  1LL);
}

- (void)setShowWhenMuted:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showWhenMuted = a3;
  id v4 = sub_10003398C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ShowWhenMuted set to %{BOOL}d",  (uint8_t *)v6,  8u);
  }

  _AXSSetAutomaticSubtitlesShowWhenMuted(v3);
}

- (void)setShowOnSkipBack:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showOnSkipBack = a3;
  id v4 = sub_10003398C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ShowOnSkipBack set to %{BOOL}d",  (uint8_t *)v6,  8u);
  }

  _AXSSetAutomaticSubtitlesShowOnSkipBack(v3);
}

- (NSString)preferredAudioLanguageCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 preferredAudioLanguageCode]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = off_1001DF7C8;
  }
  id v5 = v4;

  return v5;
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:off_1001DF7C8])
  {

    id v4 = 0LL;
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v3 setPreferredAudioLanguageCode:v4];
}

- (BOOL)atmosAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedTVSettingsPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedTVSettingsPreferences"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"AtmosAvailable" defaultValue:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  unsigned int v5 = [v4 isDolbyAtmosAvailable];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  unsigned int v7 = [v6 odeonEnabled];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentDisplayMode]);

  int v10 = (v5 | v7) & PBSDisplayResolutionIsHD([v9 resolution]);
  if ((v3 & 1) != 0) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (BOOL)audioFormatConversionEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  if ([v2 audioOutputFormat] == (id)2)
  {
    LOBYTE(v3) = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    if ([v4 audioOutputFormat] == (id)3)
    {
      LOBYTE(v3) = 0;
    }

    else
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
      unsigned int v3 = [v5 odeonEnabled] ^ 1;
    }
  }

  return v3;
}

- (void)setAudioFormatConversionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v6 = v5;
  if (v3) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  [v5 setAudioOutputFormat:v7];

  self->_atmosEnabled = !v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v8 enableAtmos:self->_atmosEnabled];
}

- (void)setAtmosEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_atmosEnabled = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  unsigned int v5 = v4;
  if (v3) {
    uint64_t v6 = 2LL;
  }
  else {
    uint64_t v6 = 3LL;
  }
  [v4 setAudioOutputFormat:v6];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v7 enableAtmos:v3];
}

- (BOOL)highQualityAudioEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 highQualityAudioEnabled];

  return v3;
}

- (void)setHighQualityAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[TVSettingsAudioVideoFacade highQualityAudioEnabled](self, "highQualityAudioEnabled") != a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    [v4 setHighQualityAudioEnabled:v3];

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
    +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 3LL, v5);
  }

- (BOOL)videoTapToZoomEnabled
{
  return CFPreferencesGetAppBooleanValue(@"AVKitTapToZoomEnabled", @".GlobalPreferences", 0LL) != 0;
}

- (void)setVideoTapToZoomEnabled:(BOOL)a3
{
}

- (BOOL)displayVolumeUI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  3LL));
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)setDisplayVolumeUI:(BOOL)a3
{
  if (-[TVSettingsAudioVideoFacade displayVolumeUI](self, "displayVolumeUI") != a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  3LL));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
    [v3 togglePolicyForFeature:v4 withCompletion:&stru_10018FD90];
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  if (off_1001DF7E0 == a6)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000343C8;
    v26[3] = &unk_10018E810;
    uint64_t v13 = &v27;
    objc_copyWeak(&v27, &location);
    TVSPerformBlockOnMainThread(v26);
LABEL_14:
    objc_destroyWeak(v13);
    goto LABEL_15;
  }

  if (off_1001DF7D8 == a6)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000343F8;
    v24[3] = &unk_10018E810;
    uint64_t v13 = &v25;
    objc_copyWeak(&v25, &location);
    TVSPerformBlockOnMainThread(v24);
    goto LABEL_14;
  }

  if (off_1001DF7D0 == a6)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100034434;
    v22[3] = &unk_10018E810;
    uint64_t v13 = &v23;
    objc_copyWeak(&v23, &location);
    TVSPerformBlockOnMainThread(v22);
    goto LABEL_14;
  }

  if (off_1001DF7E8 == a6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100034464;
    v20[3] = &unk_10018E810;
    uint64_t v13 = &v21;
    objc_copyWeak(&v21, &location);
    TVSPerformBlockOnMainThread(v20);
    goto LABEL_14;
  }

  if (off_1001DF7F0 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100034490;
    v18[3] = &unk_10018E810;
    uint64_t v13 = &v19;
    objc_copyWeak(&v19, &location);
    TVSPerformBlockOnMainThread(v18);
    goto LABEL_14;
  }

  if (off_1001DF7F8 == a6)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
    [v14 refresh];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10003450C;
    v16[3] = &unk_10018E810;
    uint64_t v13 = &v17;
    objc_copyWeak(&v17, &location);
    TVSPerformBlockOnMainThread(v16);
    goto LABEL_14;
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoFacade;
  -[TVSettingsAudioVideoFacade observeValueForKeyPath:ofObject:change:context:]( &v15,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_15:
  objc_destroyWeak(&location);
}

- (void)_didBecomeActive:(id)a3
{
  id v4 = sub_10003398C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "TVSettingsAudioVideoFacade DidBecomeActive Handler called",  buf,  2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v7 = [v6 subtitleDisplayType];
  if (v7)
  {
    if (v7 == (id)1)
    {
      id v8 = sub_10003398C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "TVSettingsAudioVideoFacade DidBecomeActiveHandler setting AutomaticSubtitles to YES",  v14,  2u);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
      [v10 setBool:1 forKey:@"AutomaticSubtitlesEnabled"];
    }
  }

  else if (self->_automaticSubtitles)
  {
    id v11 = sub_10003398C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "TVSettingsAudioVideoFacade DidBecomeActiveHandler setting SubtitleDisplayType to TVPSubtitleDisplayTypeAutomatic",  v13,  2u);
    }

    [v6 setSubtitleDisplayType:1];
  }

  -[TVSettingsAudioVideoFacade _updateAutomaticSubtitles](self, "_updateAutomaticSubtitles");
  -[TVSettingsAudioVideoFacade _updateShowWhenMuted](self, "_updateShowWhenMuted");
  -[TVSettingsAudioVideoFacade _updateShowOnSkipBack](self, "_updateShowOnSkipBack");
  -[TVSettingsAudioVideoFacade _updateSelectedSubtitleOption:](self, "_updateSelectedSubtitleOption:", 1LL);
  -[TVSettingsAudioVideoFacade _updateAvailableSubtitleLanguageOptions:]( self,  "_updateAvailableSubtitleLanguageOptions:",  1LL);
}

- (void)_updateEnhanceDialogueSupportsLevels
{
  soundsUserDefaults = self->_soundsUserDefaults;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade _enhanceDialogueLevelPrefKey]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "_enhanceDialogueLevelPrefKey"));
  unsigned int v5 = -[NSUserDefaults BOOLForKey:](soundsUserDefaults, "BOOLForKey:", v4);

  if (self->_enhanceDialogueSupportsLevels != v5)
  {
    -[TVSettingsAudioVideoFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"enhanceDialogueSupportsLevels");
    self->_enhanceDialogueSupportsLevels = v5;
    -[TVSettingsAudioVideoFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"enhanceDialogueSupportsLevels");
    id v6 = sub_10003398C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "EnhanceDialogueSupportsLevels updated to %{BOOL}d",  (uint8_t *)v8,  8u);
    }
  }

+ (id)_enhanceDialogueLevelPrefKey
{
  else {
    return @"routesupportsenhancedialogue";
  }
}

- (void)setEnhanceDialogueLevel:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);

  [v5 postNotificationName:@"com.apple.TVPAudioVideoSettings.setEnhanceDialogueLevel" object:v4 userInfo:0];
}

- (void)_updateEnhanceDialogueLevel
{
  uint64_t v3 = -[NSUserDefaults integerForKey:](self->_soundsUserDefaults, "integerForKey:", @"enhancedialoguelevel");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  unsigned int v5 = [v4 enhanceDialogue];

  if (v5)
  {
    if (v3 <= 3)
    {
      if (v3 == 3
        && !-[TVSettingsAudioVideoFacade _enhanceDialogueSupportsAXLevels](self, "_enhanceDialogueSupportsAXLevels"))
      {
        uint64_t v3 = 2LL;
      }

      else if ((unint64_t)v3 <= 1)
      {
        uint64_t v3 = 1LL;
      }
    }

    else
    {
      uint64_t v3 = 1LL;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  enhanceDialogueLevel = self->_enhanceDialogueLevel;
  if (!enhanceDialogueLevel || -[NSNumber integerValue](enhanceDialogueLevel, "integerValue") != v3)
  {
    -[TVSettingsAudioVideoFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"enhanceDialogueLevel");
    id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v3));
    id v8 = self->_enhanceDialogueLevel;
    self->_enhanceDialogueLevel = v7;

    -[TVSettingsAudioVideoFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"enhanceDialogueLevel");
    id v9 = sub_10003398C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "EnhanceDialogueLevel updated to %ld",  (uint8_t *)&v11,  0xCu);
    }
  }

- (BOOL)_enhanceDialogueSupportsAXLevels
{
  int v2 = _os_feature_enabled_impl("CoreAudioServices", "EnhanceDialogue_Accessibility");
  if (v2) {
    LOBYTE(v2) = _AXSExtendedVoiceIsolationMediaModesEnabled() != 0;
  }
  return v2;
}

- (void)_updateAutomaticSubtitles
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
  self->_BOOL automaticSubtitles = [v3 BOOLForKey:@"AutomaticSubtitlesEnabled" defaultValue:1];
  id v4 = sub_10003398C();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL automaticSubtitles = self->_automaticSubtitles;
    v7[0] = 67109120;
    v7[1] = automaticSubtitles;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AutomaticSubtitles updated to %d",  (uint8_t *)v7,  8u);
  }
}

- (void)_updateShowWhenMuted
{
  self->_showWhenMuted = _AXSAutomaticSubtitlesShowWhenMuted(self, a2) != 0;
}

- (void)_updateShowOnSkipBack
{
  self->_showOnSkipBack = _AXSAutomaticSubtitlesShowOnSkipBack(self, a2) != 0;
}

- (void)_updateAvailableAudioLanguageCodes:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", off_1001DF7C8));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredAudioLanguageCode]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioVideoFacade _availableDefaultAudioLanguages](self, "_availableDefaultAudioLanguages"));
  id v8 = [v7 mutableCopy];

  [v13 addObjectsFromArray:v8];
  if (([v13 isEqual:self->_availableAudioLanguageCodes] & 1) == 0)
  {
    if (v3)
    {
      -[TVSettingsAudioVideoFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"availableAudioLanguageCodes");
      id v9 = (NSArray *)[v13 copy];
      availableAudioLanguageCodes = self->_availableAudioLanguageCodes;
      self->_availableAudioLanguageCodes = v9;

      -[TVSettingsAudioVideoFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"availableAudioLanguageCodes");
    }

    else
    {
      int v11 = (NSArray *)[v13 copy];
      uint64_t v12 = self->_availableAudioLanguageCodes;
      self->_availableAudioLanguageCodes = v11;
    }
  }
}

- (void)_updateAvailableSubtitleLanguageOptions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10003398C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL automaticSubtitles = self->_automaticSubtitles;
    *(_DWORD *)buf = 67109120;
    BOOL v18 = automaticSubtitles;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating available subtitle language options BOOL automaticSubtitles = %d",  buf,  8u);
  }

  id v8 = off_1001DF7C0;
  if (!self->_automaticSubtitles) {
    id v8 = off_1001DF7B8;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](&OBJC_CLASS___NSMutableArray, "arrayWithObjects:", *v8, 0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAudioVideoFacade _availableDefaultSubtitleLanguages]( self,  "_availableDefaultSubtitleLanguages"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 preferredSubtitleLanguageCode]);

  [v9 addObjectsFromArray:v10];
  if (([v9 isEqual:self->_availableSubtitleLanguageOptions] & 1) == 0)
  {
    if (v3)
    {
      -[TVSettingsAudioVideoFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"availableSubtitleLanguageOptions");
      id v13 = (NSArray *)[v9 copy];
      availableSubtitleLanguageOptions = self->_availableSubtitleLanguageOptions;
      self->_availableSubtitleLanguageOptions = v13;

      -[TVSettingsAudioVideoFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"availableSubtitleLanguageOptions");
    }

    else
    {
      objc_super v15 = (NSArray *)[v9 copy];
      v16 = self->_availableSubtitleLanguageOptions;
      self->_availableSubtitleLanguageOptions = v15;
    }
  }
}

- (void)_updateSelectedSubtitleOption:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10003398C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL automaticSubtitles = self->_automaticSubtitles;
    v18[0] = 67109120;
    v18[1] = automaticSubtitles;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating selected subtitle language options BOOL automaticSubtitles = %d",  (uint8_t *)v18,  8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v9 = [v8 subtitleDisplayType];
  if (v9 == (id)1)
  {
    int v11 = off_1001DF7C0[0];
LABEL_9:
    uint64_t v12 = v11;
    goto LABEL_11;
  }

  if (!v9)
  {
    id v10 = off_1001DF7C0;
    if (!self->_automaticSubtitles) {
      id v10 = off_1001DF7B8;
    }
    int v11 = *v10;
    goto LABEL_9;
  }

  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 preferredSubtitleLanguageCode]);
LABEL_11:
  id v13 = v12;
  if ((-[__CFString isEqual:](v12, "isEqual:", self->_subtitleLanguageOption) & 1) == 0)
  {
    if (v3)
    {
      -[TVSettingsAudioVideoFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"subtitleLanguageOption");
      id v14 = (NSString *)-[__CFString copy](v13, "copy");
      subtitleLanguageOption = self->_subtitleLanguageOption;
      self->_subtitleLanguageOption = v14;

      -[TVSettingsAudioVideoFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"subtitleLanguageOption");
    }

    else
    {
      v16 = (NSString *)-[__CFString copy](v13, "copy");
      id v17 = self->_subtitleLanguageOption;
      self->_subtitleLanguageOption = v16;
    }
  }
}

- (id)_availableDefaultSubtitleLanguages
{
  if (qword_1001E1680 != -1) {
    dispatch_once(&qword_1001E1680, &stru_10018FDB0);
  }
  return (id)qword_1001E1678;
}

- (id)_availableDefaultAudioLanguages
{
  id v2 = [&off_1001AEC08 mutableCopy];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SupplementaryAvailableAudioLanguages"]);

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v7);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
  uint64_t v12 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v15 = v14;
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@"-"]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    if (v17)
    {
      id v27 = v16;
      v28 = v11;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v18 = v2;
      id v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (j = 0LL; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
            else {
              v24 = v15;
            }
            -[NSMutableArray addObject:](v24, "addObject:", v23);
          }

          id v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }

        while (v20);
      }

      v16 = v27;
      int v11 = v28;
      uint64_t v12 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    }

    else
    {
      -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v2);
    }
  }

  else
  {
    -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v2);
  }

  -[NSMutableArray sortUsingComparator:](v13, "sortUsingComparator:", &stru_10018FDF0, v27, v28);
  -[NSMutableArray sortUsingComparator:](v15, "sortUsingComparator:", &stru_10018FE10);
  id v25 = [objc_alloc((Class)v12[422]) initWithArray:v13];
  [v25 addObjectsFromArray:v15];

  return v25;
}

- (NSString)subtitleLanguageOption
{
  return self->_subtitleLanguageOption;
}

- (BOOL)automaticSubtitles
{
  return self->_automaticSubtitles;
}

- (NSArray)availableSubtitleLanguageOptions
{
  return self->_availableSubtitleLanguageOptions;
}

- (BOOL)showWhenMuted
{
  return self->_showWhenMuted;
}

- (BOOL)showOnSkipBack
{
  return self->_showOnSkipBack;
}

- (BOOL)enhanceDialogueSupportsLevels
{
  return self->_enhanceDialogueSupportsLevels;
}

- (NSNumber)enhanceDialogueLevel
{
  return self->_enhanceDialogueLevel;
}

- (NSArray)availableAudioLanguageCodes
{
  return self->_availableAudioLanguageCodes;
}

- (BOOL)atmosEnabled
{
  return self->_atmosEnabled;
}

- (void).cxx_destruct
{
}

@end