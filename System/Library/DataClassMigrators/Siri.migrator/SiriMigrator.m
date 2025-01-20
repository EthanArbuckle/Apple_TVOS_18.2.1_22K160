@interface SiriMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
- (void)_cleanupBundleCaches;
- (void)_cleanupiOS9PhotoAlbumData;
- (void)_performATVDictationMigration;
- (void)_performAlwaysPrintOverrideMigration;
- (void)_performAppleAccountMigration;
- (void)_performAudioFeedbackMigration;
- (void)_performBootstrapSpeechIdMigration;
- (void)_performCarPlayAnnounceMigrationIfNeeded;
- (void)_performDictationMigration;
- (void)_performHomePodCensorSettingsMigration;
- (void)_performInternalToBackedUpMigration;
- (void)_performLoggingMigration;
- (void)_performOutputVoiceMigration;
- (void)_performSessionLanguageMigration;
- (void)_performSiriDataSharingMigrationIfNeeded;
- (void)_performVoiceNameMigration;
- (void)_performVoiceServicesLanguageMigration;
- (void)_removeOfflineMetrics;
- (void)_removeTokenDomain;
@end

@implementation SiriMigrator

- (id)dataClassName
{
  return @"com.apple.siri.migrator";
}

- (BOOL)performMigration
{
  v3 = sub_6208();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AFProductVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    v14 = "-[SiriMigrator performMigration]";
    __int16 v15 = 2112;
    v16 = v4;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%s Starting Siri data migration from %@ to %@...",  (uint8_t *)&v13,  0x20u);
  }

  -[SiriMigrator _performInternalToBackedUpMigration](self, "_performInternalToBackedUpMigration");
  -[SiriMigrator _performLoggingMigration](self, "_performLoggingMigration");
  -[SiriMigrator _performSessionLanguageMigration](self, "_performSessionLanguageMigration");
  -[SiriMigrator _performDictationMigration](self, "_performDictationMigration");
  -[SiriMigrator _performATVDictationMigration](self, "_performATVDictationMigration");
  -[SiriMigrator _performOutputVoiceMigration](self, "_performOutputVoiceMigration");
  -[SiriMigrator _performVoiceServicesLanguageMigration](self, "_performVoiceServicesLanguageMigration");
  -[SiriMigrator _performVoiceNameMigration](self, "_performVoiceNameMigration");
  -[SiriMigrator _performBootstrapSpeechIdMigration](self, "_performBootstrapSpeechIdMigration");
  -[SiriMigrator _performAudioFeedbackMigration](self, "_performAudioFeedbackMigration");
  -[SiriMigrator _cleanupBundleCaches](self, "_cleanupBundleCaches");
  -[SiriMigrator _removeTokenDomain](self, "_removeTokenDomain");
  -[SiriMigrator _cleanupiOS9PhotoAlbumData](self, "_cleanupiOS9PhotoAlbumData");
  -[SiriMigrator _performAppleAccountMigration](self, "_performAppleAccountMigration");
  -[SiriMigrator _removeOfflineMetrics](self, "_removeOfflineMetrics");
  -[SiriMigrator _performHomePodCensorSettingsMigration](self, "_performHomePodCensorSettingsMigration");
  -[SiriMigrator _performAlwaysPrintOverrideMigration](self, "_performAlwaysPrintOverrideMigration");
  id v8 = -[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded](self, "_performCarPlayAnnounceMigrationIfNeeded");
  if ((AFIsHorseman(v8, v9) & 1) == 0) {
    -[SiriMigrator _performSiriDataSharingMigrationIfNeeded](self, "_performSiriDataSharingMigrationIfNeeded");
  }
  uint64_t v10 = _AFPreferencesSetValueForKey(v6, @"SiriMigrationVersion");
  AFInternalPreferencesSynchronize(v10);
  v11 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    v14 = "-[SiriMigrator performMigration]";
    __int16 v15 = 2112;
    v16 = v4;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%s Finished Siri data migration from %@ to %@.",  (uint8_t *)&v13,  0x20u);
  }

  return 1;
}

- (void)_performCarPlayAnnounceMigrationIfNeeded
{
  v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_INFO,  "%s Migration is not needed for non-iOS platforms.",  (uint8_t *)&v3,  0xCu);
  }

- (void)_performSiriDataSharingMigrationIfNeeded
{
  if (_AFPreferencesSiriDataSharingOptInStatus(self, a2) != 1)
  {
    int v3 = (os_log_s *)AFSiriLogContextUtility;
    if (!os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v24 = 136315138;
    v25 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    v6 = "%s Device is not opted in to data sharing.";
    goto LABEL_12;
  }

  unsigned int v2 = +[AFFeatureFlags isSiriDataSharingRepromptEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriDataSharingRepromptEnabled");
  int v3 = (os_log_s *)AFSiriLogContextUtility;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (!v4) {
      return;
    }
    int v24 = 136315138;
    v25 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    v6 = "%s Skipping siri data sharing migration. Reprompt is enabled.";
LABEL_12:
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v24, 0xCu);
    return;
  }

  if (v4)
  {
    int v24 = 136315138;
    v25 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_INFO,  "%s Reprompt is disabled. Continuing with siri data sharing migration.",  (uint8_t *)&v24,  0xCu);
  }

  if (AFIsHorseman(v4, v5))
  {
    int v3 = (os_log_s *)AFSiriLogContextUtility;
    if (!os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v24 = 136315138;
    v25 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    v6 = "%s Device is a HomePod. Exiting early..";
    goto LABEL_12;
  }

  v7 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.purplebuddy");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v7, "objectForKey:", @"SetupLastExit"));

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  int v10 = AFIsInternalInstall();
  if (v10) {
    uint64_t v11 = 2020LL;
  }
  else {
    uint64_t v11 = 2021LL;
  }
  if (v10) {
    uint64_t v12 = 10LL;
  }
  else {
    uint64_t v12 = 6LL;
  }
  if (v10) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = 6LL;
  }
  -[NSDateComponents setYear:](v9, "setYear:", v11);
  -[NSDateComponents setMonth:](v9, "setMonth:", v12);
  -[NSDateComponents setDay:](v9, "setDay:", v13);
  -[NSDateComponents setHour:](v9, "setHour:", 0LL);
  -[NSDateComponents setMinute:](v9, "setMinute:", 0LL);
  v14 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v14, "dateFromComponents:", v9));

  id v16 = [v8 compare:v15];
  __int16 v17 = (void *)AFSiriLogContextUtility;
  BOOL v18 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v16 == (id)-1LL)
  {
    if (v18)
    {
      v21 = v17;
      int v22 = AFIsATV();
      v23 = @"iOS";
      if (v22) {
        v23 = @"tvOS";
      }
      int v24 = 136315394;
      v25 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
      __int16 v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s Device has not seen setup on %@ 15.", (uint8_t *)&v24, 0x16u);
    }
  }

  else
  {
    if (v18)
    {
      int v24 = 136315138;
      v25 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
      _os_log_impl( &dword_0,  (os_log_t)v17,  OS_LOG_TYPE_INFO,  "%s Migrate Siri Data Sharing status.",  (uint8_t *)&v24,  0xCu);
    }

    uint64_t v19 = _AFPreferencesSetSiriDataSharingOptInStatus(2LL, 11LL, @"SiriMigrator");
    if ((AFIsHorseman(v19, v20) & 1) == 0) {
      _AFPreferencesSetTVOptedOut2021();
    }
  }
}

- (float)estimatedDuration
{
  return 0.01;
}

- (float)migrationProgress
{
  return 1.0;
}

- (void)_performInternalToBackedUpMigration
{
  unsigned int v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[SiriMigrator _performInternalToBackedUpMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", buf, 0xCu);
  }

  __int16 v10 = 0;
  sub_62F0(kAFHandsFreeModeKey, (_BYTE *)&v10 + 1, &v10);
  sub_62F0(kAFSessionLanguage, (_BYTE *)&v10 + 1, &v10);
  sub_62F0(kAFOutputVoice, (_BYTE *)&v10 + 1, &v10);
  uint64_t v3 = AFPreferencesDefaultsDeleteTypeToSiriSetting();
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    uint64_t v5 = kAFBackedUpTypeToSiriEnabled;
    uint64_t v6 = _AFBackedUpPreferencesValueForKey(kAFBackedUpTypeToSiriEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (!v7)
    {
      _AFBackedUpPreferencesSetValueForKey(v4, v5);
      HIBYTE(v10) = 1;
    }
  }

  sub_62F0(kAFAnnounceNotificationsOnBuiltInSpeaker, (_BYTE *)&v10 + 1, &v10);
  sub_62F0(kAFAnnounceNotificationsOnHearingAids, (_BYTE *)&v10 + 1, &v10);
  if (HIBYTE(v10)) {
    uint64_t v8 = AFBackedUpPreferencesSynchronize();
  }
  if ((_BYTE)v10) {
    AFInternalPreferencesSynchronize(v8);
  }
  uint64_t v9 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[SiriMigrator _performInternalToBackedUpMigration]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s Complete", buf, 0xCu);
  }
}

- (void)_performLoggingMigration
{
  char v2 = AFIsInternalInstall(self, a2);
  uint64_t v3 = (os_log_s *)AFSiriLogContextUtility;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if ((v2 & 1) == 0)
  {
    if (!v4) {
      return;
    }
    int v10 = 136315138;
    uint64_t v11 = "-[SiriMigrator _performLoggingMigration]";
    uint64_t v9 = "%s Device is not internal install. Skipping.";
    goto LABEL_13;
  }

  if (v4)
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SiriMigrator _performLoggingMigration]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = (const __CFString *)kAFLogPreferencesDomain;
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"AFSpeechLoggingEnabled", kAFLogPreferencesDomain);
  if (v6)
  {
    v7 = (void *)v6;
    CFPreferencesSetAppValue(@"AFSpeechLoggingEnabled", 0LL, v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    if ([v7 BOOLValue])
    {
    }

    CFRelease(v7);

    CFPreferencesAppSynchronize(v5);
  }

  uint64_t v3 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SiriMigrator _performLoggingMigration]";
    uint64_t v9 = "%s Complete";
LABEL_13:
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
  }

- (void)_performOutputVoiceMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v27 = 136315138;
    v28 = "-[SiriMigrator _performOutputVoiceMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v27, 0xCu);
  }

  uint64_t v3 = _AFPreferencesOutputVoice();
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (!v4)
  {
    uint64_t v5 = _AFPreferencesLanguageCode();
    CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      id v7 = objc_alloc(&OBJC_CLASS___AFVoiceInfo);
      uint64_t v8 = AFOutputVoiceLanguageForRecognitionLanguage(v6);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = [v7 initWithLanguageCode:v9 gender:0 isCustom:1];

      uint64_t v11 = _AFPreferencesSetOutputVoice(v10);
      AFBackedUpPreferencesSynchronize(v11);
    }
  }

  uint64_t v12 = sub_6208();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 compare:@"13.0" options:64];

  if (v14 == (id)-1LL)
  {
    uint64_t v15 = _AFPreferencesLanguageCode();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ([v16 isEqualToString:@"en-IN"])
    {
      uint64_t v17 = _AFPreferencesOutputVoice();
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 languageCode]);
      unsigned int v20 = [v19 isEqualToString:@"en-GB"];

      if (v20)
      {
        id v21 = objc_alloc(&OBJC_CLASS___AFVoiceInfo);
        uint64_t v22 = AFOutputVoiceLanguageForRecognitionLanguage(v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v24 = objc_msgSend(v21, "initWithLanguageCode:gender:isCustom:", v23, objc_msgSend(v18, "gender"), 1);

        uint64_t v25 = _AFPreferencesSetOutputVoice(v24);
        AFBackedUpPreferencesSynchronize(v25);
      }
    }
  }

  __int16 v26 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v27 = 136315138;
    v28 = "-[SiriMigrator _performOutputVoiceMigration]";
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v27, 0xCu);
  }

- (void)_performAlwaysPrintOverrideMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    BOOL v4 = "-[SiriMigrator _performAlwaysPrintOverrideMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Skipping non-iOS", (uint8_t *)&v3, 0xCu);
  }

- (void)_performVoiceServicesLanguageMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performVoiceServicesLanguageMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v5, 0xCu);
  }

  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  BOOL v4 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performVoiceServicesLanguageMigration]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_performSessionLanguageMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performSessionLanguageMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v5, 0xCu);
  }

  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  BOOL v4 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performSessionLanguageMigration]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_performBootstrapSpeechIdMigration
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  BOOL v4 = (os_log_s *)AFSiriLogContextUtility;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if ((v3 & 1) == 0)
  {
    if (!v5) {
      return;
    }
    int v9 = 136315138;
    id v10 = "-[SiriMigrator _performBootstrapSpeechIdMigration]";
    uint64_t v8 = "%s Assistant is not enabled. Skipping.";
    goto LABEL_10;
  }

  if (v5)
  {
    int v9 = 136315138;
    id v10 = "-[SiriMigrator _performBootstrapSpeechIdMigration]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v9, 0xCu);
  }

  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"Bootstrap Speech Identifier", @"com.apple.siri.backedup.encrypted");
  if (v6)
  {
    id v7 = v6;
    CFPreferencesSetAppValue(@"Bootstrap Speech Identifier", 0LL, @"com.apple.siri.backedup.encrypted");
    CFPreferencesAppSynchronize(@"com.apple.siri.backedup.encrypted");
    CFRelease(v7);
  }

  BOOL v4 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SiriMigrator _performBootstrapSpeechIdMigration]";
    uint64_t v8 = "%s Complete";
LABEL_10:
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
  }

- (void)_performDictationMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  BOOL v3 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v3)
  {
    int v47 = 136315138;
    v48 = "-[SiriMigrator _performDictationMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v47, 0xCu);
  }

  if (AFIsHorseman(v3, v4))
  {
    BOOL v5 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    -[NSUserDefaults _setDictationIsEnabledLocal:](v5, "_setDictationIsEnabledLocal:", 0LL);
    -[NSUserDefaults synchronize](v5, "synchronize");
    CFPropertyListRef v6 = (os_log_s *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v47 = 136315138;
      v48 = "-[SiriMigrator _performDictationMigration]";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s Complete for HomePod", (uint8_t *)&v47, 0xCu);
    }

    goto LABEL_33;
  }

  int v7 = AFIsNano();
  uint64_t v8 = sub_6208();
  int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v7)
  {
    if ([v9 compare:@"6.0" options:64] == (id)-1)
    {
      uint64_t v11 = AFProductVersion();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = [v12 compare:@"6.0" options:64];

      if (v13 == (id)-1LL) {
        goto LABEL_18;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      if (([v10 dictationIsEnabled] & 1) == 0
        && [v10 assistantIsEnabled])
      {
        [v10 _setDictationIsEnabledLocal:1];
        [v10 synchronize];
      }
    }

    goto LABEL_17;
  }

  if ([v9 compare:@"8.3" options:64] != (id)-1) {
    goto LABEL_13;
  }
  uint64_t v40 = AFProductVersion();
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  id v42 = [v41 compare:@"8.3" options:64];

  if (v42 != (id)-1LL)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned __int8 v44 = [v43 dictationIsEnabled];

    if ((v44 & 1) == 0
      && !CFPreferencesGetAppBooleanValue(@"UIKeyboardSupressDictationOptIn", kCFPreferencesAnyApplication, 0LL))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      objc_msgSend(v45, "_setDictationIsEnabledLocal:", objc_msgSend(v46, "assistantIsEnabled"));

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      [v10 synchronize];
LABEL_13:
    }
  }

  id v14 = sub_6208();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if ([v10 compare:@"13.4.1" options:64] == (id)-1)
  {
    uint64_t v15 = AFProductVersion();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = [v16 compare:@"13.4.1" options:64];

    if (v17 == (id)-1LL) {
      goto LABEL_18;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v10 setDictationSLSLanguagesEnabled:0];
  }

- (void)_performVoiceNameMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v27 = 136315138;
    v28 = "-[SiriMigrator _performVoiceNameMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v27, 0xCu);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputVoice]);

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
    CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voiceNamesForOutputLanguageCode:gender:", v6, objc_msgSend(v4, "gender")));

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    if (!v8 || ![v7 containsObject:v8])
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 firstObject]);
      id v10 = (os_log_s *)AFSiriLogContextUtility;
      if (v9)
      {
        uint64_t v11 = (void *)v9;
        if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
        {
          int v27 = 136315650;
          v28 = "-[SiriMigrator _performVoiceNameMigration]";
          __int16 v29 = 2112;
          uint64_t v30 = v8;
          __int16 v31 = 2112;
          unsigned int v32 = v11;
          _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "%s Updating voice name for output voice from '%@' to '%@'",  (uint8_t *)&v27,  0x20u);
        }

        id v12 = sub_6238(v4, v11);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        uint64_t v14 = _AFPreferencesSetOutputVoice(v13);
        AFBackedUpPreferencesSynchronize(v14);
        uint64_t v4 = (void *)v13;
        goto LABEL_13;
      }

      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315394;
        v28 = "-[SiriMigrator _performVoiceNameMigration]";
        __int16 v29 = 2112;
        uint64_t v30 = v4;
        _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "%s Could not find a voice name for output voice %@",  (uint8_t *)&v27,  0x16u);
      }
    }
  }

- (void)_performATVDictationMigration
{
  char v2 = AFIsATV(self, a2);
  BOOL v3 = (os_log_s *)AFSiriLogContextUtility;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      int v13 = 136315138;
      uint64_t v14 = "-[SiriMigrator _performATVDictationMigration]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v13, 0xCu);
    }

    BOOL v5 = sub_6208();
    CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ([v6 compare:@"9.2" options:64] == (id)-1)
    {
      uint64_t v7 = AFProductVersion();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = [v8 compare:@"9.2" options:64];

      if (v9 == (id)-1LL)
      {
LABEL_8:
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
        [v10 _setSuppressDictationOptInLocal:1];

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
        [v11 synchronize];

        BOOL v3 = (os_log_s *)AFSiriLogContextUtility;
        if (!os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO)) {
          return;
        }
        int v13 = 136315138;
        uint64_t v14 = "-[SiriMigrator _performATVDictationMigration]";
        id v12 = "%s Complete";
        goto LABEL_12;
      }

      CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      [v6 _setDictationIsEnabledLocal:0];
    }

    goto LABEL_8;
  }

  if (!v4) {
    return;
  }
  int v13 = 136315138;
  uint64_t v14 = "-[SiriMigrator _performATVDictationMigration]";
  id v12 = "%s Device is not ATV. Skipping.";
LABEL_12:
  _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0xCu);
}

- (void)_performAudioFeedbackMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    id v16 = "-[SiriMigrator _performAudioFeedbackMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v3 = _AFBackedUpPreferencesValueForKey(kAFUseDeviceSpeakerForTTSKey);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (!v4)
  {
    uint64_t v5 = _AFBackedUpPreferencesValueForKey(kAFRespectsSystemMuteKey);
    CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = v6;
    if (v6)
    {
      else {
        uint64_t v8 = 2LL;
      }
    }

    else
    {
      uint64_t v9 = _AFBackedUpPreferencesValueForKey(kAFHandsFreeModeKey);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = v10;
      if (v10)
      {
        else {
          uint64_t v8 = 2LL;
        }
      }

      else
      {
        uint64_t v8 = 2LL;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v12 setUseDeviceSpeakerForTTS:v8];

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v13 synchronize];
  }

  uint64_t v14 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    id v16 = "-[SiriMigrator _performAudioFeedbackMigration]";
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v15, 0xCu);
  }

- (void)_cleanupBundleCaches
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[SiriMigrator _cleanupBundleCaches]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v4 = NSHomeDirectoryForUser(@"mobile");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Library"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"Caches"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"com.apple.siri.bundleservicecache.plist"]);
  [v3 removeItemAtPath:v8 error:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByAppendingPathComponent:@"com.apple.siri.PresentationPluginCache.plist"]);
  [v3 removeItemAtPath:v9 error:0];
  id v10 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[SiriMigrator _cleanupBundleCaches]";
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_removeTokenDomain
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[SiriMigrator _removeTokenDomain]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v3 = NSHomeDirectoryForUser(@"mobile");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"Library"]);
  CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Preferences"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"com.apple.assistant.token.plist"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v8 removeItemAtPath:v7 error:0];

  uint64_t v9 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[SiriMigrator _removeTokenDomain]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_cleanupiOS9PhotoAlbumData
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    int v13 = "-[SiriMigrator _cleanupiOS9PhotoAlbumData]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v4 = NSHomeDirectoryForUser(@"mobile");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Library/Siri"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"/"]);
  [v3 removeItemAtPath:v7 error:0];

  uint64_t v8 = NSHomeDirectoryForUser(@"mobile");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 stringByAppendingPathComponent:@"Library/Assistant/SynapseBundleIDRegistry.plist"]);
  [v3 removeItemAtPath:v10 error:0];

  int v11 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    int v13 = "-[SiriMigrator _cleanupiOS9PhotoAlbumData]";
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v12, 0xCu);
  }
}

- (void)_removeOfflineMetrics
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[SiriMigrator _removeOfflineMetrics]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v3 = NSHomeDirectoryForUser(@"mobile");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"Library"]);
  CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Assistant"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"SiriMetrics"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v8 removeItemAtPath:v7 error:0];

  uint64_t v9 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[SiriMigrator _removeOfflineMetrics]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_performAppleAccountMigration
{
  char v2 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SiriMigrator _performAppleAccountMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v3, "aa_primaryAppleAccount"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    id v6 = [v5 cloudSyncEnabled];
    [v4 setEnabled:v6 forDataclass:kAccountDataclassSiri];
    [v5 setCloudSyncEnabled:v6];
    -[ACAccountStore saveAccount:withCompletionHandler:](v3, "saveAccount:withCompletionHandler:", v4, 0LL);
  }

  uint64_t v7 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SiriMigrator _performAppleAccountMigration]";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_performHomePodCensorSettingsMigration
{
  if (AFIsHorseman(self, a2))
  {
    char v2 = (os_log_s *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[SiriMigrator _performHomePodCensorSettingsMigration]";
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v4, 0xCu);
    }

    uint64_t v3 = (os_log_s *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[SiriMigrator _performHomePodCensorSettingsMigration]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v4, 0xCu);
    }
  }

@end