@interface SATVInternationalUtility
+ (SATVInternationalUtility)sharedInstance;
- (BOOL)commitLanguageWillRestartSystem;
- (BOOL)commitLocaleWillRestartSystem;
- (BOOL)languageCommitted;
- (BOOL)localeCommitted;
- (NSArray)orderedGreetingLanguageCodes;
- (NSArray)orderedGreetingSubtitleStrings;
- (NSArray)orderedGreetingTitleStrings;
- (NSArray)orderedLanguageCodes;
- (NSArray)orderedRemotePairingErrorStrings;
- (NSArray)orderedRemotePairingHelpStrings;
- (NSArray)orderedRemotePairingStrings;
- (NSArray)orderedRemoteProximityStrings;
- (NSDictionary)languageCodesToLanguageStringsDictionary;
- (NSOrderedSet)sortedSupportedGreetingLanguages;
- (NSString)userSetSystemLanguageCode;
- (NSString)userSetSystemRegionCode;
- (SATVInternationalUtility)init;
- (TVCSPreferredLanguagesManager)languageManager;
- (id)_attributedStringWithImage:(id)a3;
- (id)_localizedStringFromResource:(id)a3 language:(id)a4 key:(id)a5;
- (id)_localizedStringFromResource:(id)a3 localization:(id)a4 key:(id)a5;
- (id)_orderedLanguageStringsForKey:(id)a3;
- (id)_pairingHelpStringWithString:(id)a3;
- (id)_replaceMarker:(id)a3 withAttachment:(id)a4 forAttributedString:(id)a5;
- (id)firstSupportedLanguageFromLanguages:(id)a3;
- (id)languageCodeWithGuessedRegionForCode:(id)a3;
- (id)languageHeaderStringForLanguageCode:(id)a3;
- (id)localizedString:(id)a3 forLanguage:(id)a4;
- (id)regionHeaderStringWithUserSelectedLanguageCode;
- (id)regionOtherStringWithUserSelectedLanguageCode;
- (void)_generateLanguageCodes;
- (void)_notifyPineBoard;
- (void)commitLanguage;
- (void)commitRegion;
- (void)setLanguageCodesToLanguageStringsDictionary:(id)a3;
- (void)setLanguageCommitted:(BOOL)a3;
- (void)setLanguageManager:(id)a3;
- (void)setLocaleCommitted:(BOOL)a3;
- (void)setOrderedGreetingSubtitleStrings:(id)a3;
- (void)setOrderedGreetingTitleStrings:(id)a3;
- (void)setOrderedLanguageCodes:(id)a3;
- (void)setOrderedRemotePairingErrorStrings:(id)a3;
- (void)setOrderedRemotePairingHelpStrings:(id)a3;
- (void)setOrderedRemotePairingStrings:(id)a3;
- (void)setOrderedRemoteProximityStrings:(id)a3;
- (void)setSortedSupportedGreetingLanguages:(id)a3;
- (void)setUserSetSystemLanguageCode:(id)a3;
- (void)setUserSetSystemRegionCode:(id)a3;
@end

@implementation SATVInternationalUtility

+ (SATVInternationalUtility)sharedInstance
{
  if (qword_100109760 != -1) {
    dispatch_once(&qword_100109760, &stru_1000C95F0);
  }
  return (SATVInternationalUtility *)(id)qword_100109758;
}

- (SATVInternationalUtility)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVInternationalUtility;
  v2 = -[SATVInternationalUtility init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    languageManager = v2->_languageManager;
    v2->_languageManager = (TVCSPreferredLanguagesManager *)v3;
  }

  return v2;
}

- (NSString)userSetSystemLanguageCode
{
  userSetSystemLanguageCode = self->_userSetSystemLanguageCode;
  if (userSetSystemLanguageCode)
  {
    uint64_t v3 = userSetSystemLanguageCode;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  }

  return v3;
}

- (NSArray)orderedGreetingTitleStrings
{
  p_orderedGreetingTitleStrings = &self->_orderedGreetingTitleStrings;
  orderedGreetingTitleStrings = self->_orderedGreetingTitleStrings;
  if (!orderedGreetingTitleStrings)
  {
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _orderedLanguageStringsForKey:]( self,  "_orderedLanguageStringsForKey:",  @"REMOTE_TITLE"));
    objc_super v6 = self->_orderedGreetingTitleStrings;
    self->_orderedGreetingTitleStrings = v5;

    id v7 = sub_10002B154();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000760A0();
    }

    orderedGreetingTitleStrings = *p_orderedGreetingTitleStrings;
  }

  return orderedGreetingTitleStrings;
}

- (NSArray)orderedGreetingSubtitleStrings
{
  p_orderedGreetingSubtitleStrings = &self->_orderedGreetingSubtitleStrings;
  orderedGreetingSubtitleStrings = self->_orderedGreetingSubtitleStrings;
  if (!orderedGreetingSubtitleStrings)
  {
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _orderedLanguageStringsForKey:]( self,  "_orderedLanguageStringsForKey:",  @"REMOTE_SUBTITLE"));
    objc_super v6 = self->_orderedGreetingSubtitleStrings;
    self->_orderedGreetingSubtitleStrings = v5;

    id v7 = sub_10002B154();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100076100();
    }

    orderedGreetingSubtitleStrings = *p_orderedGreetingSubtitleStrings;
  }

  return orderedGreetingSubtitleStrings;
}

- (NSArray)orderedRemotePairingStrings
{
  p_orderedRemotePairingStrings = &self->_orderedRemotePairingStrings;
  orderedRemotePairingStrings = self->_orderedRemotePairingStrings;
  if (!orderedRemotePairingStrings)
  {
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _orderedLanguageStringsForKey:]( self,  "_orderedLanguageStringsForKey:",  @"REMOTE_PAIRING"));
    objc_super v6 = self->_orderedRemotePairingStrings;
    self->_orderedRemotePairingStrings = v5;

    id v7 = sub_10002B154();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100076160();
    }

    orderedRemotePairingStrings = *p_orderedRemotePairingStrings;
  }

  return orderedRemotePairingStrings;
}

- (NSArray)orderedRemotePairingHelpStrings
{
  orderedRemotePairingHelpStrings = self->_orderedRemotePairingHelpStrings;
  if (!orderedRemotePairingHelpStrings)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _orderedLanguageStringsForKey:]( self,  "_orderedLanguageStringsForKey:",  @"REMOTE_PAIRING_HELP"));
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_10000BD68;
    v12 = &unk_1000C9618;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    v14 = self;
    id v5 = v13;
    [v4 enumerateObjectsUsingBlock:&v9];
    objc_super v6 = (NSArray *)objc_msgSend(v5, "copy", v9, v10, v11, v12);
    id v7 = self->_orderedRemotePairingHelpStrings;
    self->_orderedRemotePairingHelpStrings = v6;

    orderedRemotePairingHelpStrings = self->_orderedRemotePairingHelpStrings;
  }

  return orderedRemotePairingHelpStrings;
}

- (NSArray)orderedRemotePairingErrorStrings
{
  orderedRemotePairingErrorStrings = self->_orderedRemotePairingErrorStrings;
  if (!orderedRemotePairingErrorStrings)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _orderedLanguageStringsForKey:]( self,  "_orderedLanguageStringsForKey:",  @"REMOTE_PAIRING_ERROR"));
    id v5 = self->_orderedRemotePairingErrorStrings;
    self->_orderedRemotePairingErrorStrings = v4;

    orderedRemotePairingErrorStrings = self->_orderedRemotePairingErrorStrings;
  }

  return orderedRemotePairingErrorStrings;
}

- (NSArray)orderedRemoteProximityStrings
{
  p_orderedRemoteProximityStrings = &self->_orderedRemoteProximityStrings;
  orderedRemoteProximityStrings = self->_orderedRemoteProximityStrings;
  if (!orderedRemoteProximityStrings)
  {
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _orderedLanguageStringsForKey:]( self,  "_orderedLanguageStringsForKey:",  @"REMOTE_PROXIMITY"));
    objc_super v6 = self->_orderedRemoteProximityStrings;
    self->_orderedRemoteProximityStrings = v5;

    id v7 = sub_10002B154();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000761C0();
    }

    orderedRemoteProximityStrings = *p_orderedRemoteProximityStrings;
  }

  return orderedRemoteProximityStrings;
}

- (NSOrderedSet)sortedSupportedGreetingLanguages
{
  p_sortedSupportedGreetingLanguages = &self->_sortedSupportedGreetingLanguages;
  if (!self->_sortedSupportedGreetingLanguages)
  {
    v20 = &self->_sortedSupportedGreetingLanguages;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization availableBaseSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "availableBaseSystemLanguages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizations]);

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v25 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v25,  1LL));
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v5,  v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

          [v6 addObject:v14];
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v9);
    }

    v15 = (NSOrderedSet *)[v6 copy];
    p_sortedSupportedGreetingLanguages = v20;
    v16 = *v20;
    *v20 = v15;
  }

  id v17 = sub_10002B154();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100076220();
  }

  return *p_sortedSupportedGreetingLanguages;
}

- (id)languageHeaderStringForLanguageCode:(id)a3
{
  return -[SATVInternationalUtility localizedString:forLanguage:]( self,  "localizedString:forLanguage:",  @"LANGUAGE_TITLE",  a3);
}

- (id)languageCodeWithGuessedRegionForCode:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[BYLocationController sharedBuddyLocationController]( &OBJC_CLASS___BYLocationController,  "sharedBuddyLocationController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 guessedCountries]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  id v7 = v3;
  id v8 = v7;
  if ([v6 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale languageFromLanguage:byReplacingRegion:]( &OBJC_CLASS___NSLocale,  "languageFromLanguage:byReplacingRegion:",  v7,  v6));
  }

  return v8;
}

- (NSDictionary)languageCodesToLanguageStringsDictionary
{
  languageCodesToLanguageStringsDictionary = self->_languageCodesToLanguageStringsDictionary;
  if (!languageCodesToLanguageStringsDictionary)
  {
    -[SATVInternationalUtility _generateLanguageCodes](self, "_generateLanguageCodes");
    languageCodesToLanguageStringsDictionary = self->_languageCodesToLanguageStringsDictionary;
  }

  return languageCodesToLanguageStringsDictionary;
}

- (NSArray)orderedLanguageCodes
{
  orderedLanguageCodes = self->_orderedLanguageCodes;
  if (!orderedLanguageCodes)
  {
    -[SATVInternationalUtility _generateLanguageCodes](self, "_generateLanguageCodes");
    orderedLanguageCodes = self->_orderedLanguageCodes;
  }

  return orderedLanguageCodes;
}

- (NSArray)orderedGreetingLanguageCodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility sortedSupportedGreetingLanguages](self, "sortedSupportedGreetingLanguages"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 array]);

  return (NSArray *)v3;
}

- (id)regionHeaderStringWithUserSelectedLanguageCode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemLanguageCode](self, "userSetSystemLanguageCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility localizedString:forLanguage:]( self,  "localizedString:forLanguage:",  @"REGION_TITLE",  v3));

  return v4;
}

- (id)regionOtherStringWithUserSelectedLanguageCode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemLanguageCode](self, "userSetSystemLanguageCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility localizedString:forLanguage:]( self,  "localizedString:forLanguage:",  @"REGION_MORE_COUNTRIES",  v3));

  return v4;
}

- (void)commitLanguage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v3 setSiriEnabled:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemLanguageCode](self, "userSetSystemLanguageCode"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 bestSiriLanguageForSystemLanguage:v5]);

  if (v9)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    [v6 setLanguage:v9];
  }

  -[SATVInternationalUtility setLanguageCommitted:](self, "setLanguageCommitted:", 1LL);
  if (-[SATVInternationalUtility commitLanguageWillRestartSystem](self, "commitLanguageWillRestartSystem"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemLanguageCode](self, "userSetSystemLanguageCode"));
    +[TVSInternationalization setSystemLanguage:](&OBJC_CLASS___TVSInternationalization, "setSystemLanguage:", v7);

    -[SATVInternationalUtility _notifyPineBoard](self, "_notifyPineBoard");
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemLanguageCode](self, "userSetSystemLanguageCode"));
    +[NSLocale setLocaleAfterLanguageChange:](&OBJC_CLASS___NSLocale, "setLocaleAfterLanguageChange:", v8);
  }
}

- (BOOL)commitLocaleWillRestartSystem
{
  return 1;
}

- (void)commitRegion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemRegionCode](self, "userSetSystemRegionCode"));
  +[NSLocale setLocaleAfterRegionChange:](&OBJC_CLASS___NSLocale, "setLocaleAfterRegionChange:", v3);

  languageManager = self->_languageManager;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemRegionCode](self, "userSetSystemRegionCode"));
  -[TVCSPreferredLanguagesManager setRegion:updateFirstLanguage:]( languageManager,  "setRegion:updateFirstLanguage:",  v5,  1LL);

  -[TVCSPreferredLanguagesManager applyInputModesChanges](self->_languageManager, "applyInputModesChanges");
  -[TVCSPreferredLanguagesManager applyPreferredLanguagesChanges]( self->_languageManager,  "applyPreferredLanguagesChanges");
  if (-[SATVInternationalUtility commitLocaleWillRestartSystem](self, "commitLocaleWillRestartSystem")) {
    -[SATVInternationalUtility _notifyPineBoard](self, "_notifyPineBoard");
  }
}

- (BOOL)commitLanguageWillRestartSystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility userSetSystemLanguageCode](self, "userSetSystemLanguageCode"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  char v5 = [v2 isEqual:v4] ^ 1;

  return v5;
}

- (BOOL)languageCommitted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.purplebuddy"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"TVBuddyLanguageSet"];

  return v3;
}

- (void)setLanguageCommitted:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferenceManager sharedInstance](&OBJC_CLASS___TVSPreferenceManager, "sharedInstance"));
  [v4 enableDistributedSyncForDomain:@"com.apple.purplebuddy"];

  char v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.purplebuddy"));
  [v5 setBool:v3 forKey:@"TVBuddyLanguageSet"];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferenceManager sharedInstance](&OBJC_CLASS___TVSPreferenceManager, "sharedInstance"));
  [v6 syncDomain:@"com.apple.purplebuddy"];

  CFPreferencesSynchronize(@"com.apple.purplebuddy", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (BOOL)localeCommitted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.purplebuddy"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"TVBuddyLocaleSet"];

  return v3;
}

- (void)setLocaleCommitted:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferenceManager sharedInstance](&OBJC_CLASS___TVSPreferenceManager, "sharedInstance"));
  [v4 enableDistributedSyncForDomain:@"com.apple.purplebuddy"];

  char v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.purplebuddy"));
  [v5 setBool:v3 forKey:@"TVBuddyLocaleSet"];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferenceManager sharedInstance](&OBJC_CLASS___TVSPreferenceManager, "sharedInstance"));
  [v6 syncDomain:@"com.apple.purplebuddy"];

  CFPreferencesSynchronize(@"com.apple.purplebuddy", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (id)localizedString:(id)a3 forLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length")) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _localizedStringFromResource:language:key:]( self,  "_localizedStringFromResource:language:key:",  @"Localizable",  v7,  v6));
  }
  else {
    id v8 = 0LL;
  }
  if (![v8 length])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v6 value:&stru_1000CB560 table:0]);

    id v8 = (void *)v10;
  }

  return v8;
}

- (id)firstSupportedLanguageFromLanguages:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization allSupportedSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "allSupportedSystemLanguages"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v6)
  {
    id v17 = 0LL;
    goto LABEL_20;
  }

  id v8 = v6;
  uint64_t v9 = *(void *)v22;
  *(void *)&__int128 v7 = 138543362LL;
  __int128 v20 = v7;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale baseLanguageFromLanguage:]( &OBJC_CLASS___NSLocale,  "baseLanguageFromLanguage:",  v11,  v20,  (void)v21));
      if ([v4 containsObject:v11])
      {
        id v18 = sub_10002B154();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          v26 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ is a supported system language",  buf,  0xCu);
        }

        goto LABEL_19;
      }

      unsigned int v13 = [v4 containsObject:v12];
      id v14 = sub_10002B154();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138543618;
          v26 = v11;
          __int16 v27 = 2114;
          v28 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ has a supported base language %{public}@",  buf,  0x16u);
        }

        v11 = v12;
LABEL_19:

        id v17 = v11;
        goto LABEL_20;
      }

      if (v16)
      {
        *(_DWORD *)buf = v20;
        v26 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ is not a supported language.",  buf,  0xCu);
      }
    }

    id v8 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    id v17 = 0LL;
    if (v8) {
      continue;
    }
    break;
  }

- (id)_localizedStringFromResource:(id)a3 language:(id)a4 key:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizations]);

    id v22 = v9;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v13,  v14));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

    id v17 = [v16 length];
    if (v17) {
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _localizedStringFromResource:localization:key:]( self,  "_localizedStringFromResource:localization:key:",  v8,  v16,  v11));
    }
    id v18 = (os_log_s *)v17;

    v19 = v18;
  }

  else
  {
    id v20 = sub_10002B154();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int128 v24 = "-[SATVInternationalUtility _localizedStringFromResource:language:key:]";
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "%s called with nil parameters: resourceName=%@, language=%@, key=%@",  buf,  0x2Au);
    }

    v19 = 0LL;
  }

  return v19;
}

- (id)_localizedStringFromResource:(id)a3 localization:(id)a4 key:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10000D7C0();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    unsigned int v13 = 0LL;
LABEL_6:
    BOOL v16 = v13;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( [v17 pathForResource:v7 ofType:@"strings" inDirectory:0 forLocalization:v8]);

    if ([v13 length])
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v9]);
    }

    else
    {
      v15 = 0LL;
    }

    goto LABEL_9;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 pathForResource:v11 ofType:@"strings" inDirectory:0 forLocalization:v8]);

  if (![v13 length]) {
    goto LABEL_6;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);

  if (!v15) {
    goto LABEL_6;
  }
LABEL_9:

  return v15;
}

- (void)_notifyPineBoard
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 synchronize];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, off_100108420, 0LL, 0LL, 1u);
}

- (void)_generateLanguageCodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization availableBaseSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "availableBaseSystemLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithArray:",  v3));

  v31 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 array]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  languageCodesToLanguageStringsDictionary = self->_languageCodesToLanguageStringsDictionary;
  self->_languageCodesToLanguageStringsDictionary = &v6->super;

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IntlUtility sharedIntlUtility](&OBJC_CLASS___IntlUtility, "sharedIntlUtility"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 displayNameForLanguage:v13 context:2 displayLanguage:v13]);
        BOOL v16 = (void *)v15;
        if (v15) {
          id v17 = (void *)v15;
        }
        else {
          id v17 = v13;
        }
        id v18 = v17;

        -[NSDictionary setValue:forKey:](self->_languageCodesToLanguageStringsDictionary, "setValue:forKey:", v18, v13);
      }

      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v10);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[BYLocationController sharedBuddyLocationController]( &OBJC_CLASS___BYLocationController,  "sharedBuddyLocationController"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 guessedLanguages]);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v22 = v20;
  id v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale baseLanguageFromLanguage:]( &OBJC_CLASS___NSLocale,  "baseLanguageFromLanguage:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)j)));
        [v21 addObject:v27];
      }

      id v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v24);
  }

  [v21 addObjectsFromArray:v8];
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v21 array]);
  __int16 v29 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v28));
  orderedLanguageCodes = self->_orderedLanguageCodes;
  self->_orderedLanguageCodes = v29;
}

- (id)_orderedLanguageStringsForKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVInternationalUtility orderedGreetingLanguageCodes](self, "orderedGreetingLanguageCodes"));
  id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility localizedString:forLanguage:]( self,  "localizedString:forLanguage:",  v4,  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
        if (v12) {
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = -[NSMutableArray copy](v6, "copy");
  return v13;
}

- (id)_pairingHelpStringWithString:(id)a3
{
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  __int128 v16 = sub_10000D350;
  __int128 v17 = &unk_1000C9468;
  __int128 v18 = self;
  uint64_t v4 = qword_100109780;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100109780, &v14);
  }
  id v6 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  NSAttributedStringKey v19 = NSBaselineOffsetAttributeName;
  id v20 = &off_1000D0C28;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL,  v14,  v15,  v16,  v17,  v18));
  id v8 = -[NSMutableAttributedString initWithString:attributes:](v6, "initWithString:attributes:", v5, v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _replaceMarker:withAttachment:forAttributedString:]( self,  "_replaceMarker:withAttachment:forAttributedString:",  @"@@MENU@@",  qword_100109768,  v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _replaceMarker:withAttachment:forAttributedString:]( self,  "_replaceMarker:withAttachment:forAttributedString:",  @"@@PLUS@@",  qword_100109770,  v9));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[SATVInternationalUtility _replaceMarker:withAttachment:forAttributedString:]( self,  "_replaceMarker:withAttachment:forAttributedString:",  @"@@BACK@@",  qword_100109778,  v10));
  id v12 = [v11 copy];

  return v12;
}

- (id)_replaceMarker:(id)a3 withAttachment:(id)a4 forAttributedString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 string]);
  uint64_t v11 = -[NSMutableAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithAttributedString:",  v9);

  id v12 = [v10 rangeOfString:v7];
  if (v13)
  {
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v11,  "replaceCharactersInRange:withAttributedString:",  v12,  v13,  v8);
  }

  else
  {
    id v14 = sub_10002B154();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100076280((uint64_t)v7, (uint64_t)v10, v15);
    }
  }

  __int128 v16 = -[NSAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithAttributedString:",  v11);

  return v16;
}

- (id)_attributedStringWithImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL,  0LL);
  -[NSTextAttachment setImage:](v4, "setImage:", v3);

  __int16 v10 = -4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v10,  1LL));
  id v6 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  NSAttributedStringKey v11 = NSAttachmentAttributeName;
  id v12 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  id v8 = -[NSAttributedString initWithString:attributes:](v6, "initWithString:attributes:", v5, v7);

  return v8;
}

- (void)setOrderedGreetingTitleStrings:(id)a3
{
}

- (void)setOrderedGreetingSubtitleStrings:(id)a3
{
}

- (void)setOrderedRemotePairingStrings:(id)a3
{
}

- (void)setOrderedRemotePairingHelpStrings:(id)a3
{
}

- (void)setOrderedRemotePairingErrorStrings:(id)a3
{
}

- (void)setOrderedRemoteProximityStrings:(id)a3
{
}

- (void)setLanguageCodesToLanguageStringsDictionary:(id)a3
{
}

- (void)setOrderedLanguageCodes:(id)a3
{
}

- (void)setUserSetSystemLanguageCode:(id)a3
{
}

- (NSString)userSetSystemRegionCode
{
  return self->_userSetSystemRegionCode;
}

- (void)setUserSetSystemRegionCode:(id)a3
{
}

- (TVCSPreferredLanguagesManager)languageManager
{
  return self->_languageManager;
}

- (void)setLanguageManager:(id)a3
{
}

- (void)setSortedSupportedGreetingLanguages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end