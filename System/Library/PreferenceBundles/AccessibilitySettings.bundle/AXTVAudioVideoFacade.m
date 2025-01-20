@interface AXTVAudioVideoFacade
+ (id)sharedInstance;
- (AXTVAudioVideoFacade)init;
- (AXTVCaptionStyle)activeCaptionStyle;
- (BOOL)navigationSoundEffectsEnabled;
- (BOOL)transitionSoundsAndPreviewAudioEnabled;
- (NSArray)availableAudioLanguageCodes;
- (NSArray)availableCaptionStyles;
- (NSArray)availableCustomCaptionStyles;
- (NSArray)availableSubtitleLanguageOptions;
- (NSString)subtitleLanguageOption;
- (id)_availableDefaultAudioLanguages;
- (id)_availableDefaultSubtitleLanguages;
- (void)_updateAvailableAudioLanguageCodes:(BOOL)a3;
- (void)_updateAvailableSubtitleLanguageOptions:(BOOL)a3;
- (void)_updateSelectedSubtitleOption:(BOOL)a3;
- (void)dealloc;
- (void)deleteCaptionStyle:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActiveCaptionStyle:(id)a3;
- (void)setNavigationSoundEffectsEnabled:(BOOL)a3;
- (void)setSubtitleLanguageOption:(id)a3;
- (void)setTransitionSoundsAndPreviewAudioEnabled:(BOOL)a3;
@end

@implementation AXTVAudioVideoFacade

+ (id)sharedInstance
{
  if (qword_80588 != -1) {
    dispatch_once(&qword_80588, &stru_65DD8);
  }
  return (id)qword_80580;
}

- (AXTVAudioVideoFacade)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVAudioVideoFacade;
  v2 = -[AXTVAudioVideoFacade init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    [v3 addObserver:v2 forKeyPath:@"preferredAudioLanguageCode" options:0 context:off_80228];
    [v3 addObserver:v2 forKeyPath:@"preferredSubtitleLanguageCode" options:0 context:off_80230];
    [v3 addObserver:v2 forKeyPath:@"subtitleDisplayType" options:0 context:off_80238];
    -[AXTVAudioVideoFacade _updateAvailableAudioLanguageCodes:](v2, "_updateAvailableAudioLanguageCodes:", 0LL);
    -[AXTVAudioVideoFacade _updateAvailableSubtitleLanguageOptions:]( v2,  "_updateAvailableSubtitleLanguageOptions:",  0LL);
    -[AXTVAudioVideoFacade _updateSelectedSubtitleOption:](v2, "_updateSelectedSubtitleOption:", 0LL);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"preferredAudioLanguageCode" context:off_80228];
  [v3 removeObserver:self forKeyPath:@"preferredSubtitleLanguageCode" context:off_80230];
  [v3 removeObserver:self forKeyPath:@"subtitleDisplayType" context:off_80238];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVAudioVideoFacade;
  -[AXTVAudioVideoFacade dealloc](&v4, "dealloc");
}

- (void)setNavigationSoundEffectsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.preferences.sounds"));
  [v4 setBool:v3 forKey:@"keyboard"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.preferences.sounds.changed", 0LL, 0LL, 1u);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 postNotificationName:NSUserDefaultsDidChangeNotification object:v6];
}

- (BOOL)navigationSoundEffectsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.preferences.sounds"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"keyboard" defaultValue:1];

  return v3;
}

- (void)setTransitionSoundsAndPreviewAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
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

- (void)setSubtitleLanguageOption:(id)a3
{
  id v10 = a3;
  if (([v10 isEqual:self->_subtitleLanguageOption] & 1) == 0)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    if ([v10 isEqual:TVSettingsSubtitleLanguageOff[0]])
    {
      uint64_t v5 = 0LL;
      id v6 = 0LL;
    }

    else
    {
      unsigned int v7 = [v10 isEqual:TVSettingsSubtitleLanguageAuto];
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
    v8 = (NSString *)[v10 copy];
    subtitleLanguageOption = self->_subtitleLanguageOption;
    self->_subtitleLanguageOption = v8;
  }
}

- (AXTVCaptionStyle)activeCaptionStyle
{
  active = (void *)MACaptionAppearancePrefCopyActiveProfileID(self, a2);
  BOOL v3 = -[AXTVCaptionStyle initWithStyleID:](objc_alloc(&OBJC_CLASS___AXTVCaptionStyle), "initWithStyleID:", active);

  return v3;
}

- (void)setActiveCaptionStyle:(id)a3
{
}

- (NSArray)availableCaptionStyles
{
  v2 = (void *)MACaptionAppearancePrefCopyProfileIDs(self, a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortedArrayUsingComparator:&stru_65E18]);

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_arrayByMappingObjectsUsingBlock:", &stru_65E58));
  return (NSArray *)v4;
}

- (NSArray)availableCustomCaptionStyles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAudioVideoFacade availableCaptionStyles](self, "availableCaptionStyles"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 indexesOfObjectsPassingTest:&stru_65E98]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectsAtIndexes:v3]);

  return (NSArray *)v4;
}

- (void)deleteCaptionStyle:(id)a3
{
  id v9 = a3;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeCaptionStyle]);

  if ([v4 isEqual:v9])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 availableCaptionStyles]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
    [v8 setActiveCaptionStyle:v7];
  }

  MACaptionAppearancePrefRemoveProfile([v9 styleID]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  if (off_80238 == a6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1CDF4;
    v19[3] = &unk_654A0;
    v13 = &v20;
    objc_copyWeak(&v20, &location);
    TVSPerformBlockOnMainThread(v19);
LABEL_8:
    objc_destroyWeak(v13);
    goto LABEL_9;
  }

  if (off_80230 == a6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1CE24;
    v17[3] = &unk_654A0;
    v13 = &v18;
    objc_copyWeak(&v18, &location);
    TVSPerformBlockOnMainThread(v17);
    goto LABEL_8;
  }

  if (off_80228 == a6)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1CE78;
    v15[3] = &unk_654A0;
    v13 = &v16;
    objc_copyWeak(&v16, &location);
    TVSPerformBlockOnMainThread(v15);
    goto LABEL_8;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AXTVAudioVideoFacade;
  -[AXTVAudioVideoFacade observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_9:
  objc_destroyWeak(&location);
}

- (void)_updateAvailableAudioLanguageCodes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v5));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredAudioLanguageCode]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAudioVideoFacade _availableDefaultAudioLanguages](self, "_availableDefaultAudioLanguages"));
  id v9 = [v8 mutableCopy];

  [v14 addObjectsFromArray:v9];
  if (([v14 isEqual:self->_availableAudioLanguageCodes] & 1) == 0)
  {
    if (v3)
    {
      -[AXTVAudioVideoFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"availableAudioLanguageCodes");
      id v10 = (NSArray *)[v14 copy];
      availableAudioLanguageCodes = self->_availableAudioLanguageCodes;
      self->_availableAudioLanguageCodes = v10;

      -[AXTVAudioVideoFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"availableAudioLanguageCodes");
    }

    else
    {
      id v12 = (NSArray *)[v14 copy];
      v13 = self->_availableAudioLanguageCodes;
      self->_availableAudioLanguageCodes = v12;
    }
  }
}

- (void)_updateAvailableSubtitleLanguageOptions:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  TVSettingsSubtitleLanguageOff[0],  TVSettingsSubtitleLanguageAuto,  0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAudioVideoFacade _availableDefaultSubtitleLanguages](self, "_availableDefaultSubtitleLanguages"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredSubtitleLanguageCode]);

  [v12 addObjectsFromArray:v5];
  if (([v12 isEqual:self->_availableSubtitleLanguageOptions] & 1) == 0)
  {
    if (v3)
    {
      -[AXTVAudioVideoFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"availableSubtitleLanguageOptions");
      v8 = (NSArray *)[v12 copy];
      availableSubtitleLanguageOptions = self->_availableSubtitleLanguageOptions;
      self->_availableSubtitleLanguageOptions = v8;

      -[AXTVAudioVideoFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"availableSubtitleLanguageOptions");
    }

    else
    {
      id v10 = (NSArray *)[v12 copy];
      id v11 = self->_availableSubtitleLanguageOptions;
      self->_availableSubtitleLanguageOptions = v10;
    }
  }
}

- (void)_updateSelectedSubtitleOption:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  uint64_t v5 = (char *)[v13 subtitleDisplayType];
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    id v6 = TVSettingsSubtitleLanguageAuto;
    goto LABEL_5;
  }

  if (!v5)
  {
    id v6 = TVSettingsSubtitleLanguageOff[0];
LABEL_5:
    unsigned int v7 = v6;
    goto LABEL_7;
  }

  unsigned int v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 preferredSubtitleLanguageCode]);
LABEL_7:
  v8 = v7;
  if ((-[__CFString isEqual:](v7, "isEqual:", self->_subtitleLanguageOption) & 1) == 0)
  {
    if (v3)
    {
      -[AXTVAudioVideoFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"subtitleLanguageOption");
      id v9 = (NSString *)-[__CFString copy](v8, "copy");
      subtitleLanguageOption = self->_subtitleLanguageOption;
      self->_subtitleLanguageOption = v9;

      -[AXTVAudioVideoFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"subtitleLanguageOption");
    }

    else
    {
      id v11 = (NSString *)-[__CFString copy](v8, "copy");
      id v12 = self->_subtitleLanguageOption;
      self->_subtitleLanguageOption = v11;
    }
  }
}

- (id)_availableDefaultSubtitleLanguages
{
  if (qword_80598 != -1) {
    dispatch_once(&qword_80598, &stru_65EB8);
  }
  return (id)qword_80590;
}

- (id)_availableDefaultAudioLanguages
{
  if (qword_805A8 != -1) {
    dispatch_once(&qword_805A8, &stru_65ED8);
  }
  return (id)qword_805A0;
}

- (NSString)subtitleLanguageOption
{
  return self->_subtitleLanguageOption;
}

- (NSArray)availableSubtitleLanguageOptions
{
  return self->_availableSubtitleLanguageOptions;
}

- (NSArray)availableAudioLanguageCodes
{
  return self->_availableAudioLanguageCodes;
}

- (void).cxx_destruct
{
}

@end