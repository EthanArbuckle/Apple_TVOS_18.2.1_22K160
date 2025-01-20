}

LABEL_17:
LABEL_18:
  if ((AFIsATV() & 1) != 0) {
    goto LABEL_23;
  }
  v18 = sub_6208();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if ([v19 compare:@"10.0" options:64] == (id)-1)
  {
    v20 = AFProductVersion();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = [v21 compare:@"10.0" options:64];

    if (v22 == (id)-1LL) {
      goto LABEL_23;
    }
    v23 = CFPreferencesGetAppBooleanValue(@"UIKeyboardSupressDictationOptIn", kCFPreferencesAnyApplication, 0LL) != 0;
    CFPreferencesSetAppValue(@"UIKeyboardSupressDictationOptIn", 0LL, kCFPreferencesAnyApplication);
    CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v19 _setSuppressDictationOptInLocal:v23];
  }

LABEL_23:
  v24 = kAFUIKitDictationEnabledKey;
  v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  kAFUIKitPreferencesDomain);
  v25 = -[NSUserDefaults BOOLForKey:](v5, "BOOLForKey:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v27 = [v26 dictationIsEnabled];

  if (v25 != (_DWORD)v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v28 _setDictationIsEnabledLocal:v27];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v29 synchronize];
  }

  v30 = _AFSupportPreferencesBoolValueForKey(kAFManagedConfigurationDictationAllowedKey);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (!v31)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v37 = AFPreferencesDictationAllowed();
    v35 = v36;
    goto LABEL_29;
  }

  v32 = -[NSUserDefaults BOOLForKey:](v5, "BOOLForKey:", kAFUIKitDictationAllowedKey);
  v33 = [v31 BOOLValue];
  if (v32 != (_DWORD)v33)
  {
    v34 = (uint64_t)v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v36 = v35;
    v37 = v34;
LABEL_29:
    [v35 _setDictationIsAllowed:v37];

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v38 synchronize];
  }

  v39 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v47 = 136315138;
    v48 = "-[SiriMigrator _performDictationMigration]";
    _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v47, 0xCu);
  }

LABEL_33:
}

LABEL_13:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 inProgressOutputVoice]);

  if (!v16) {
    goto LABEL_23;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 languageCode]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "voiceNamesForOutputLanguageCode:gender:", v18, objc_msgSend(v16, "gender")));

  v20 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
  v21 = objc_claimAutoreleasedReturnValue([v19 firstObject]);
  v22 = (os_log_s *)AFSiriLogContextUtility;
  if (!v21)
  {
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v27 = 136315394;
      v28 = "-[SiriMigrator _performVoiceNameMigration]";
      v29 = 2112;
      v30 = v16;
      _os_log_error_impl( &dword_0,  v22,  OS_LOG_TYPE_ERROR,  "%s Could not find a voice name for in progress voice %@",  (uint8_t *)&v27,  0x16u);
    }

LABEL_22:
    goto LABEL_23;
  }

  v23 = (void *)v21;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v27 = 136315650;
    v28 = "-[SiriMigrator _performVoiceNameMigration]";
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v23;
    _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "%s Updating voice name for in progress voice from '%@' to '%@'",  (uint8_t *)&v27,  0x20u);
  }

  v24 = sub_6238(v16, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);

  _AFPreferencesSetInProgressOutputVoice(v25);
  v16 = (void *)v25;
LABEL_23:
  v26 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v27 = 136315138;
    v28 = "-[SiriMigrator _performVoiceNameMigration]";
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v27, 0xCu);
  }
}

__CFString *sub_6208()
{
  uint64_t v0 = _AFPreferencesValueForKey(@"SiriMigrationVersion");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue(v0);
  if (!v1) {
    v1 = @"1.0";
  }
  return v1;
}

id sub_6238(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc(&OBJC_CLASS___AFVoiceInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
  id v7 = [v4 gender];
  id v8 = [v4 isCustom];

  id v9 = [v5 initWithLanguageCode:v6 gender:v7 isCustom:v8 name:v3 footprint:0 contentVersion:0 masteredVersion:0];
  return v9;
}

void sub_62F0(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v6 = _AFPreferencesValueForKey(a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    id v10 = v7;
    uint64_t v8 = _AFBackedUpPreferencesValueForKey(a1);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (!v9)
    {
      _AFBackedUpPreferencesSetValueForKey(v10, a1);
      if (a2) {
        *a2 = 1;
      }
    }

    _AFPreferencesSetValueForKey(0LL, a1);
    id v7 = v10;
    if (a3) {
      *a3 = 1;
    }
  }
}

id objc_msgSend_initWithLanguageCode_gender_isCustom_name_footprint_contentVersion_masteredVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:");
}

id objc_msgSend_voiceNamesForOutputLanguageCode_gender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceNamesForOutputLanguageCode:gender:");
}