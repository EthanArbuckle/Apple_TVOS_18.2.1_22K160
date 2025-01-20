void sub_4028(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_11818;
  qword_11818 = (uint64_t)v1;
}

void sub_41BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_41D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _icloudDataChanged:0];
}

void sub_4444(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = VOTLogICloud();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_70E4();
    }

    if (!AXIsInternalInstall())
    {

      objc_end_catch();
      JUMPOUT(0x4400LL);
    }

    objc_exception_throw(v2);
    __break(1u);
    JUMPOUT(0x44BCLL);
  }

  _Unwind_Resume(exception_object);
}

void sub_4708(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = VOTLogActivities();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_70E4();
    }

    if (!AXIsInternalInstall())
    {

      objc_end_catch();
      JUMPOUT(0x46C4LL);
    }

    objc_exception_throw(v2);
    __break(1u);
    JUMPOUT(0x4780LL);
  }

  _Unwind_Resume(exception_object);
}

id sub_47F8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
  [v2 synchronize];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 syncPronunciationsWithCloudKit];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _reconcilePronunciations];
  }
  return [*(id *)(a1 + 32) _reconcileActivities];
}

LABEL_11:
  v16 = VOTLogActivities();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Did not find a change, not updating", buf, 2u);
  }

LABEL_22:
}

      v32 = AXLogCommon();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v20;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Opening URL: %@", buf, 0xCu);
      }

LABEL_25:
LABEL_26:
      v11 = 0LL;
LABEL_27:

      return v11;
    default:
      goto LABEL_27;
  }

LABEL_46:
    -[AXAssetAndDataServer _syncToWatch](self, "_syncToWatch");
    goto LABEL_47;
  }

  v60 = 0uLL;
  v61 = 0uLL;
  v58 = 0uLL;
  v59 = 0uLL;
  v35 = v3;
  v36 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v36)
  {
    v37 = v36;
    v38 = *(void *)v59;
    while (2)
    {
      for (j = 0LL; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        if (![v15 containsObject:*(void *)(*((void *)&v58 + 1) + 8 * (void)j)])
        {

          goto LABEL_39;
        }
      }

      v37 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  if (v16 != v17)
  {
LABEL_39:
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemPronunciations sharedInstance]( &OBJC_CLASS___AXSubsystemPronunciations,  "sharedInstance"));
    v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations identifier](&OBJC_CLASS___AXSubsystemPronunciations, "identifier"));
      v49 = AXLoggerForFacility();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);

      v51 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v50, v51))
      {
        v52 = AXColorizeFormatLog(1LL, @"Reconciled iCloud pronunciations: adding: %{private}@");
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        v54 = _AXStringForArgs(v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v50, v51))
        {
          *(_DWORD *)buf = 138543362;
          v69 = v55;
          _os_log_impl(&dword_0, v50, v51, "%{public}@", buf, 0xCu);
        }
      }
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v56 setCustomPronunciationSubstitutions:v35];

    goto LABEL_46;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations sharedInstance](&OBJC_CLASS___AXSubsystemPronunciations, "sharedInstance"));
  v41 = [v40 ignoreLogging];

  if ((v41 & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations identifier](&OBJC_CLASS___AXSubsystemPronunciations, "identifier"));
    v43 = AXLoggerForFacility();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);

    v30 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled(v29, v30))
    {
      v44 = AXColorizeFormatLog(1LL, @"Did not find a change, not updating");
      v32 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v45 = _AXStringForArgs(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 138543362;
        v69 = v34;
        goto LABEL_34;
      }

LABEL_35:
    }

LABEL_36:
  }

LABEL_47:
}
}

void sub_51AC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 voiceOverActivities]);
  id v4 = [v3 copy];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  if ([v5 length])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
    [v6 setData:v5 forKey:@"AXVoiceOverActivities"];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
    [v7 synchronize];
  }

  else
  {
    uint64_t v8 = VOTLogActivities();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_71A4((os_log_t)v7);
    }
  }

  uint64_t v9 = VOTLogActivities();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 134218243;
    uint64_t v13 = v11;
    __int16 v14 = 2113;
    id v15 = v4;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "ICLOUD[%p]: Publishing data to iCloud %{private}@",  (uint8_t *)&v12,  0x16u);
  }
}

id sub_54DC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 syncPronunciationsWithCloudKit];

  if ((v3 & 1) != 0) {
    return objc_msgSend(*(id *)(a1 + 32), "_syncToWatch", v30, v31);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 customPronunciationSubstitutions]);
  id v6 = [v5 copy];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  0LL));
  if ([v7 length])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
    [v8 setData:v7 forKey:@"AXCustomPronunciations"];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
    [v9 synchronize];
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemPronunciations sharedInstance]( &OBJC_CLASS___AXSubsystemPronunciations,  "sharedInstance"));
    unsigned __int8 v22 = [v21 ignoreLogging];

    if ((v22 & 1) != 0) {
      goto LABEL_5;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations identifier](&OBJC_CLASS___AXSubsystemPronunciations, "identifier"));
    uint64_t v24 = AXLoggerForFacility();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v24);

    os_log_type_t v25 = AXOSLogLevelFromAXLogLevel(0LL);
    if (os_log_type_enabled((os_log_t)v9, v25))
    {
      uint64_t v26 = AXColorizeFormatLog(0LL, @"Created an empty length archive, not synching");
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      uint64_t v28 = _AXStringForArgs(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v9, v25))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v29;
        _os_log_impl(&dword_0, (os_log_t)v9, v25, "%{public}@", buf, 0xCu);
      }
    }
  }

LABEL_5:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations sharedInstance](&OBJC_CLASS___AXSubsystemPronunciations, "sharedInstance"));
  unsigned __int8 v11 = [v10 ignoreLogging];

  if ((v11 & 1) == 0)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations identifier](&OBJC_CLASS___AXSubsystemPronunciations, "identifier"));
    uint64_t v13 = AXLoggerForFacility();
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = AXColorizeFormatLog(1LL, @"ICLOUD[%p]: Publishing data to iCloud %{private}@");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v30 = *(void *)(a1 + 32);
      id v31 = v6;
      uint64_t v18 = _AXStringForArgs(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_0, v14, v15, "%{public}@", buf, 0xCu);
      }
    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "_syncToWatch", v30, v31);
}

void sub_5A70(_Unwind_Exception *a1)
{
}

void sub_5A98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _customPronunciationsSettingsChanged];
}

void sub_5AC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _saveActivitiesToExternalsAndDelete:0];
}

LABEL_13:
  if ([v7 isEqualToString:AXSpeechSourceKeySwitchControl]
    && !_AXSAssistiveTouchScannerEnabled())
  {
    v33 = AXLogSpeechAssetDownload();
    os_log_type_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v32 = "Not updating default spoken content voice because switch control is not enabled.";
    goto LABEL_30;
  }

  if (([v6 isEqualToString:v13] & 1) == 0)
  {
    id v31 = AXLogSpeechAssetDownload();
    os_log_type_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v32 = "Not updating default voice because the voice doesn't match our system language.";
    goto LABEL_30;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v19 = [v18 userDidSelectVoiceForLanguage:v6 sourceKey:v7];

  if ((v19 & 1) != 0) {
    goto LABEL_42;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  v21 = AXLanguageConvertToCanonicalForm(v6);
  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v20 resourcesWithLanguage:v22 type:1]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ax_flatMappedArrayUsingBlock:", &stru_C400));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  os_log_type_t v25 = v24;
  uint64_t v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v48,  v60,  16LL);
  if (!v26) {
    goto LABEL_40;
  }
  v27 = v26;
  uint64_t v28 = *(void *)v49;
  while (2)
  {
    for (i = 0LL; i != v27; i = (char *)i + 1)
    {
      if (*(void *)v49 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
      if ([v30 isDefault])
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 speechVoiceIdentifierForLanguage:v6 sourceKey:v7 exists:0]);

        v36 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "voiceForIdentifier:",  v35));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
        if (([v37 isEqualToString:v35] & 1) == 0
          && [v36 footprint] != &dword_4
          && [v30 footprint] == &dword_4)
        {
          v47 = +[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:]( &OBJC_CLASS___TTSAlternativeVoices,  "isNeuralSiriVoiceIdentifier:",  v35);

          if ((v47 & 1) != 0)
          {
LABEL_39:

            goto LABEL_40;
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          v39 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
          [v38 setSpeechVoiceIdentifier:v39 forLanguage:v6 sourceKey:v7];

          v40 = AXLogSpeechAssetDownload();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
            *(_DWORD *)buf = 138413058;
            v53 = v35;
            v54 = 2112;
            v55 = v42;
            v56 = 2112;
            v57 = v7;
            v58 = 2112;
            v59 = v6;
            _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_DEFAULT,  "Switching voice from %@ to %@ for source %@ because default voice has changed, and the user hasn't selecte d one for language %@",  buf,  0x2Au);
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v30 language]);
          -[AXAssetAndDataServer informSiriAboutVoiceUsageForIdentifier:forLanguage:add:]( self,  "informSiriAboutVoiceUsageForIdentifier:forLanguage:add:",  v37,  v43,  1LL);
        }

        goto LABEL_39;
      }
    }

    v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v48,  v60,  16LL);
    if (v27) {
      continue;
    }
    break;
  }

LABEL_40:
LABEL_41:
LABEL_42:
}

id sub_6030(id a1, TTSAXResource *a2)
{
  return -[TTSAXResource speechVoice](a2, "speechVoice");
}

void sub_64F8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[TTSSiriAssetManager installedAssetsForLanguage:voiceType:]( &OBJC_CLASS___TTSSiriAssetManager,  "installedAssetsForLanguage:voiceType:",  0LL,  4LL));
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[TTSSiriAssetManager installedAssetsForLanguage:voiceType:]( &OBJC_CLASS___TTSSiriAssetManager,  "installedAssetsForLanguage:voiceType:",  0LL,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v23 = (void *)v2;
  [v4 axSafelyAddObjectsFromArray:v2];
  unsigned __int8 v22 = (void *)v3;
  [v4 axSafelyAddObjectsFromArray:v3];
  id v21 = objc_alloc_init(&OBJC_CLASS___SiriTTSDaemonSession);
  [v21 subscribeWithVoices:&__NSArray0__struct reply:&stru_C440];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ([v10 isInstalled])
        {
          unsigned __int8 v11 = *(void **)(a1 + 32);
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          LODWORD(v11) = [v11 containsObject:v12];

          if ((_DWORD)v11)
          {
            uint64_t v13 = AXLogSpeechAssetDownload();
            __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v10;
              _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "Asset is installed and is in selected voices: %@",  buf,  0xCu);
            }

            os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 languages]);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);

            [*(id *)(a1 + 40) informSiriAboutVoiceUsageForIdentifier:v16 forLanguage:v18 add:1];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v7);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v19 setSiriAutoUpdateListInitialized:1];

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIServiceManager sharedServiceManager](&OBJC_CLASS___AXUIServiceManager, "sharedServiceManager"));
  [v20 endTransactionWithIdentifier:*(void *)(a1 + 48) forService:*(void *)(a1 + 40)];
}

void sub_67D4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = AXLogSpeechAssetDownload();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      int v9 = 138412290;
      v10 = v2;
      id v6 = "AXAssetAndDataServer: Unable to reset voice subscriptions. %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "AXAssetAndDataServer: Reset voice subscriptions.";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_70C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_70E4()
{
}

void sub_7144()
{
}

void sub_71A4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Created an empty length archive, not synching", v1, 2u);
}

id objc_msgSend_wordFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 wordFeedbackEnabled];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      LOBYTE(v11) = [v12 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemPronunciations identifier](&OBJC_CLASS___AXSubsystemPronunciations, "identifier"));
      __int16 v14 = AXLoggerForFacility();
      os_log_type_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

      uint64_t v16 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v15, v16))
      {
        v17 = AXColorizeFormatLog(1LL, @"Starting pronunciation dictation: %@, %@, %@");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = _AXStringForArgs(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          unsigned __int8 v22 = v20;
          _os_log_impl(&dword_0, v15, v16, "%{public}@", buf, 0xCu);
        }
      }
    }

    self->_isRecording = 1;
  }
}

- (OS_dispatch_queue)voiceRefreshQueue
{
  return self->_voiceRefreshQueue;
}

- (void)setVoiceRefreshQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end