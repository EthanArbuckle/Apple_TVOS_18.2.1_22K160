}

void sub_100004960( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100004A08(uint64_t a1)
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]_block_invoke";
    __int16 v6 = 2112;
    v7 = @"com.apple.corespeech.fakeasset.rolling";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Received notification %@",  (uint8_t *)&v4,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldRollFakeModel:1];
}

uint64_t sub_100004ADC(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 32);
  if ((_DWORD)result != -1) {
    return notify_cancel(result);
  }
  return result;
}

id sub_100004AF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForFakeAssetRollNotification];
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_alloc_init(&OBJC_CLASS___ServiceDelegate);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

LABEL_53:
                if (v39)
                {
                  v59 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    v84 = 2114;
                    v85[0] = v39;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s Using fake model : %{public}@",  buf,  0x16u);
                  }

                  v60 = v68;
                  -[CoreSpeechXPCFakeModelMonitor setShouldRollFakeModel:]( v68->_fakeAssetMonitor,  "setShouldRollFakeModel:",  0LL,  v68);
                  fakeAssetMonitor = v60->_fakeAssetMonitor;
                  v62 = (void *)objc_claimAutoreleasedReturnValue([v39 modelHash]);
                  -[CoreSpeechXPCFakeModelMonitor setLastFakeModelUsedHash:]( fakeAssetMonitor,  "setLastFakeModelUsedHash:",  v62);
                }
              }

              else
              {
                v39 = 0LL;
              }

              v63 = objc_msgSend(v71, "count", v68);
              v64 = v71;
              if (v63 || (v65 = [v72 count], v64 = v72, v65)) {
                v66 = (void *)objc_claimAutoreleasedReturnValue([v64 objectAtIndex:0]);
              }
              else {
                v66 = 0LL;
              }
              v67 = (os_log_s *)CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                v84 = 2114;
                v85[0] = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%s %{public}@ fake model is selected for download",  buf,  0x16u);
                v67 = (os_log_s *)CSLogContextFacilityCoreSpeech;
              }

              v21 = v69;
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                v84 = 2114;
                v85[0] = v66;
                _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%s %{public}@ model is selected for fallback",  buf,  0x16u);
              }

              v73[2](v73, v39, v66, @"fakeModel", 0LL);

              v23 = obj;
            }

            else
            {
              v38 = (void *)CSLogContextFacilityCoreSpeech;
              v14 = v71;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
              {
                v56 = v38;
                v57 = [v75 count];
                *(_DWORD *)buf = 136315650;
                v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                v84 = 1026;
                LODWORD(v85[0]) = v57;
                WORD2(v85[0]) = 1026;
                *(_DWORD *)((char *)v85 + 6) = 3;
                _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "%s fake model number(%{public}d) is less than minimum fake model number((%{public}d)",  buf,  0x18u);
              }

              v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  410LL,  0LL,  v68));
              ((void (**)(id, void *, void *, const __CFString *, void *))v73)[2](v73, 0LL, 0LL, 0LL, v39);
              v21 = v69;
            }

            v15 = v72;
            v16 = v73;
            v18 = v70;
          }

          else
          {
            v45 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalle"
                    "dModels:completion:]";
              v84 = 2114;
              v85[0] = v18;
              _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%s Unable to parse fake model meta json : %{public}@",  buf,  0x16u);
            }

            v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  409LL,  0LL));
            ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0LL, 0LL, 0LL, v46);
          }
        }

        else
        {
          v43 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledM"
                  "odels:completion:]";
            v84 = 2114;
            v85[0] = v18;
            _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%s Unable to parse fake model meta json : %{public}@",  buf,  0x16u);
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  409LL,  0LL));
          ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0LL, 0LL, 0LL, v44);

          v23 = 0LL;
        }
      }

      else
      {
        v42 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledMod"
                "els:completion:]";
          v84 = 2114;
          v85[0] = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s Unable to read fake model meta json : %{public}@",  buf,  0x16u);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  409LL,  0LL));
        ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0LL, 0LL, 0LL, v23);
      }
    }

    else
    {
      v41 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:]";
        v84 = 2114;
        v85[0] = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s fake model meta json does not exist : %{public}@",  buf,  0x16u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  408LL,  0LL));
      ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0LL, 0LL, 0LL, v21);
    }
  }

  else
  {
    v40 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:]";
      v84 = 2114;
      v85[0] = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s Fake Model Path does not exist : %{public}@",  buf,  0x16u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  407LL,  0LL));
    ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0LL, 0LL, 0LL, v18);
  }
}

LABEL_19:
  return v17;
}

LABEL_22:
    v27 = v19;
  }

  else
  {
LABEL_20:
    v27 = 0LL;
  }

  return v27;
}

void sub_100007934(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      v12 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Trial assets not available, fallback to MA assets",  (uint8_t *)&v11,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetController sharedController](&OBJC_CLASS___CSAssetController, "sharedController"));
    [v10 installedAssetOfType:0 language:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, 0LL);
    }
  }
}

void sub_100007A48(id a1)
{
  v1 = (void *)qword_100022CE0;
  qword_100022CE0 = (uint64_t)&off_10001E0E8;
}

void sub_100007A60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v15 = 136315650;
    v16 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Select keyword language as %{public}@, error : %{public}@",  (uint8_t *)&v15,  0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSJarvisTriggerModeMonitor sharedInstance]( &OBJC_CLASS___CSJarvisTriggerModeMonitor,  "sharedInstance"));
  int v11 = v10;
  if (v5)
  {
    [v10 setTriggerMode:1];

    id v12 = v5;
    uint64_t v13 = 1LL;
  }

  else
  {
    [v10 setTriggerMode:2];

    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = 2LL;
  }

  +[CoreSpeechXPC logLanguageMismatchMetricWithJarvisSelectedLocale:jarvisTriggerMode:]( &OBJC_CLASS___CoreSpeechXPC,  "logLanguageMismatchMetricWithJarvisSelectedLocale:jarvisTriggerMode:",  v12,  v13);
LABEL_8:
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void sub_100007BE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v23 = v7;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      v38 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      __int16 v39 = 2114;
      v40 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s VoiceTriggerAsset is not available : %{public}@",  buf,  0x16u);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 jarvisRTModelLocaleMap]);
  if (!v8)
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Jarvis locale map is nil, fallback to embedded locale map",  buf,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getAccessoryFallbackLocalTable]);
  }

  if ([*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 48)])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v10 = *(id *)(a1 + 56);
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * (void)v14) isEqualToString:*(void *)(a1 + 40)])
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
            goto LABEL_33;
          }

          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getAccessoryFallbackFamilyLocal:*(void *)(a1 + 40) fromLocaleMap:v8]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getAccessoryFallbackFamilyLocal:*(void *)(a1 + 48) fromLocaleMap:v8]);
    if ([v15 isEqualToString:v10])
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }

    else
    {
      v25 = v15;
      id v26 = v6;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v16 = *(id *)(a1 + 56);
      id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v28;
        while (2)
        {
          v20 = 0LL;
          do
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "getAccessoryFallbackFamilyLocal:fromLocaleMap:",  *(void *)(*((void *)&v27 + 1) + 8 * (void)v20),  v8,  v25,  v26,  (void)v27));
            if ([v21 isEqualToString:v10])
            {
              (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();

              goto LABEL_31;
            }

            v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v22 = *(void *)(a1 + 64);
      id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  404LL,  0LL));
      (*(void (**)(uint64_t, void, id))(v22 + 16))(v22, 0LL, v16);
LABEL_31:

      int v15 = v25;
      id v6 = v26;
    }

LABEL_33:
  }
}

void sub_100007FC8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!*(void *)(a1 + 40))
  {
    if (v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 modelHash]);
      [v12 setHearstFirstPassModelVersion:v13];
    }

    if (v10)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      [v14 setHearstSecondPassModelVersion:v10];
    }
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id, id, id))(v15 + 16))(v15, v16, v9, v11);
  }
}

void sub_1000080C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 rtModelWithRequestOptions:*(void *)(a1 + 32)]);
    uint64_t v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 resourcePath]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 configVersion]);
      *(_DWORD *)buf = 136316162;
      v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      __int16 v57 = 2112;
      *(void *)v58 = v9;
      *(_WORD *)&v58[8] = 2112;
      *(void *)v59 = v11;
      *(_WORD *)&v59[8] = 2112;
      *(void *)v60 = v12;
      *(_WORD *)&v60[8] = 2112;
      v61 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Queried model for language:%@ path:%@ configVers:%@ model:%@",  buf,  0x34u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 rtModelLocaleMapWithModelType:*(void *)(a1 + 80)]);
    if (v13)
    {
      if (v7)
      {
LABEL_6:
        v42 = v13;
        id v43 = v6;
        id v44 = v5;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v14 = *(id *)(a1 + 56);
        id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v50;
          while (2)
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v50 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue([v19 modelHash]);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v7 modelHash]);
              unsigned int v22 = [v20 isEqualToString:v21];

              if (v22)
              {
                __int128 v33 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                id v6 = v43;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  __int16 v57 = 2114;
                  *(void *)v58 = v19;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s Hash matched with downloadedModel : %{public}@, accessory will select this model",  buf,  0x16u);
                }

                (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
                id v5 = v44;
LABEL_40:
                uint64_t v13 = v42;
                goto LABEL_41;
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v14 = *(id *)(a1 + 64);
        id v23 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v46;
          while (2)
          {
            for (j = 0LL; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v46 != v25) {
                objc_enumerationMutation(v14);
              }
              __int128 v27 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 modelHash]);
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v7 modelHash]);
              unsigned int v30 = [v28 isEqualToString:v29];

              if (v30)
              {
                v36 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  __int16 v57 = 2114;
                  *(void *)v58 = v27;
                  _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s Hash matched with preinstalledModel : %{public}@, accessory will select this model",  buf,  0x16u);
                }

                (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
                id v6 = v43;
                id v5 = v44;
                goto LABEL_40;
              }
            }

            id v24 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        uint64_t v13 = v42;
        id v14 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) selectFallbackModelForLocale:*(void *)(a1 + 40) downloadedModels:*(void *)(a1 + 56) preinstalledModels:*(void *)(a1 + 64) rtLocaleMap:v42]);
        __int128 v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
          __int16 v57 = 2114;
          *(void *)v58 = v7;
          *(_WORD *)&v58[8] = 2114;
          *(void *)v59 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s Ask for download : %{public}@, and use %{public}@ as fallback",  buf,  0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
        id v6 = v43;
        id v5 = v44;
        goto LABEL_41;
      }
    }

    else
    {
      __int128 v34 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s rtLocaleMap is nil fallback to embedded locale map",  buf,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) getAccessoryFallbackLocalTable]);
      if (v7) {
        goto LABEL_6;
      }
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) selectFallbackModelForLocale:*(void *)(a1 + 40) downloadedModels:*(void *)(a1 + 56) preinstalledModels:*(void *)(a1 + 64) rtLocaleMap:v13]);
    v35 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(a1 + 88);
      uint64_t v40 = *(void *)(a1 + 96);
      uint64_t v41 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      __int16 v57 = 1026;
      *(_DWORD *)v58 = v39;
      *(_WORD *)&v58[4] = 1026;
      *(_DWORD *)&v58[6] = v40;
      *(_WORD *)v59 = 2114;
      *(void *)&v59[2] = v41;
      *(_WORD *)v60 = 2114;
      *(void *)&v60[2] = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s accessoryRTBlobs are not available for the version(%{public}d.%{public}d) and locale:%{public}@, returning fa llback model : %{public}@",  buf,  0x2Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
LABEL_41:

    goto LABEL_42;
  }

  __int128 v32 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v37 = v32;
    v38 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
    *(_DWORD *)buf = 136315394;
    v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
    __int16 v57 = 2114;
    *(void *)v58 = v38;
    _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s VoiceTriggerAsset is not available : %{public}@",  buf,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
LABEL_42:
}

void sub_100008764(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
  [v6 setEngineMajorVersion:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
  [v6 setEngineMinorVersion:v5];

  [v6 setSiriLocale:@"en-US"];
}

void sub_100008D48(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) objectForKeyedSubscript:v4]);
  [v5 refresh];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 levelForFactor:@"AssetData" withNamespaceName:v4]);
  v7 = v6;
  if (v6
    && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fileValue]),
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]),
        v9,
        v8,
        v9))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 fileValue]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 levelForFactor:@"isAssetArchived" withNamespaceName:v4]);
    if (v12 && [v12 BOOLeanValue])
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 trialBaseAssetDirectory]);

      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getAssetTypeStringForType:]( &OBJC_CLASS___CSAssetController,  "getAssetTypeStringForType:",  a1[6]));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:v15]);

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:@"TrialAssetData"]);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 levelForFactor:@"AssetVersion" withNamespaceName:v4]);

    uint64_t v17 = a1[6];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  v17,  v11,  v18,  1LL));

    if (v19)
    {
      v20 = 0LL;
    }

    else
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to get Trial asset from path: %@",  v11));
      __int128 v27 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[CSTrialAssetManager getInstalledAssetofType:forLocale:completion:]_block_invoke";
        __int16 v37 = 2112;
        v38 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

      uint64_t v28 = CSErrorDomain;
      __int128 v31 = @"reason";
      __int128 v32 = v26;
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v28,  1601LL,  v29));
    }

    uint64_t v30 = a1[5];
    if (v30) {
      (*(void (**)(uint64_t, void *, void *))(v30 + 16))(v30, v19, v20);
    }
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v7 fileValue]);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to get Trial asset from path: %@",  v22));

    id v23 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSTrialAssetManager getInstalledAssetofType:forLocale:completion:]_block_invoke";
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    uint64_t v24 = CSErrorDomain;
    __int128 v33 = @"reason";
    __int128 v34 = v19;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  1601LL,  v25));

    (*(void (**)(void))(a1[5] + 16LL))();
  }
}

void sub_10000919C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  [v6 refresh];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = @"com.apple.siri.sp.mitigation";
  if (v7 != 6) {
    uint64_t v8 = 0LL;
  }
  if (v7) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = @"com.apple.siri.sp.invocation";
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UAFLevelForFactor:v9 withNamespaceName:v5 withLanguage:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 directoryValue]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"version"]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"locale"]);

  id v18 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    v38 = "-[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]_block_invoke";
    __int16 v39 = 2048;
    uint64_t v40 = v19;
    __int16 v41 = 2112;
    v42 = v17;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Got Trial rollout for assetType: %lu for locale: %@ version: %@",  buf,  0x2Au);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000095AC;
  v29[3] = &unk_10001C5B8;
  id v30 = *(id *)(a1 + 48);
  v20 = objc_retainBlock(v29);
  if (v13 && v15 && v17)
  {
    if ([*(id *)(a1 + 40) isEqualToString:v17])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      unsigned int v22 = [v21 bypassTrialAssets];

      if (!v22)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  *(void *)(a1 + 56),  v13,  v15,  1LL));
        ((void (*)(void *, void *, void))v20[2])(v20, v23, 0LL);
        goto LABEL_17;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Trial asset bypass is set"));
      uint64_t v24 = CSErrorDomain;
      __int128 v31 = @"reason";
      __int128 v32 = v23;
      uint64_t v25 = &v32;
      id v26 = &v31;
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Mismatch between Current locale: %@ & Trial rollout locale: %@",  *(void *)(a1 + 40),  v17));
      uint64_t v24 = CSErrorDomain;
      __int128 v33 = @"reason";
      __int128 v34 = v23;
      uint64_t v25 = &v34;
      id v26 = &v33;
    }
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to get Trial factor: %@",  v9));
    uint64_t v24 = CSErrorDomain;
    v35 = @"reason";
    v36 = v23;
    uint64_t v25 = &v36;
    id v26 = &v35;
  }

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v26,  1LL));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  1601LL,  v27));

  ((void (*)(void *, void, void *))v20[2])(v20, 0LL, v28);
LABEL_17:
}

void sub_1000095AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v7;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      int v12 = 136315650;
      uint64_t v13 = "-[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@ - %@", (uint8_t *)&v12, 0x20u);
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

void sub_1000096E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", a2));
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void sub_10000978C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___CSTrialAssetManager);
  v2 = (void *)qword_100022CE8;
  qword_100022CE8 = (uint64_t)v1;
}

void sub_100009A44(_Unwind_Exception *a1)
{
}

void sub_100009E70(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSiriLocale:v3];
  [v4 setAllowMph:*(unsigned __int8 *)(a1 + 88)];
  [v4 setUserSelectedPhraseType:*(void *)(a1 + 40)];
  [v4 setEndpointId:*(void *)(a1 + 48)];
  [v4 setEngineMajorVersion:*(void *)(a1 + 56)];
  [v4 setEngineMinorVersion:*(void *)(a1 + 64)];
  [v4 setAccessoryModelType:*(void *)(a1 + 72)];
  [v4 setCSCoreSpeechServicesAccessoryInfo:*(void *)(a1 + 80)];
}

void sub_100009F00(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained siriLocale]);
  [v3 setSiriLocale:v5];

  id v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setAllowMph:", objc_msgSend(v6, "allowMph"));

  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userSelectedPhraseType]);
  [v3 setUserSelectedPhraseType:v8];

  id v9 = objc_loadWeakRetained(v2);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointId]);
  [v3 setEndpointId:v10];

  id v11 = objc_loadWeakRetained(v2);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 engineMajorVersion]);
  [v3 setEngineMajorVersion:v12];

  id v13 = objc_loadWeakRetained(v2);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 engineMinorVersion]);
  [v3 setEngineMinorVersion:v14];

  id v15 = objc_loadWeakRetained(v2);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accessoryModelType]);
  [v3 setAccessoryModelType:v16];

  id v18 = objc_loadWeakRetained(v2);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v18 accessoryInfo]);
  [v3 setCSCoreSpeechServicesAccessoryInfo:v17];
}

void sub_10000A08C(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) siriLocale]);
  [v11 setSiriLocale:v3];

  objc_msgSend(v11, "setAllowMph:", objc_msgSend(*(id *)(a1 + 32), "allowMph"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userSelectedPhraseType]);
  [v11 setUserSelectedPhraseType:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpointId]);
  [v11 setEndpointId:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) engineMajorVersion]);
  [v11 setEngineMajorVersion:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) engineMinorVersion]);
  [v11 setEngineMinorVersion:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryModelType]);
  [v11 setAccessoryModelType:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryInfo]);
  [v11 setCSCoreSpeechServicesAccessoryInfo:v9];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

void sub_10000B154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_9:
}

void sub_10000CAA4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (v4)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);
    [v6 removeObject:*(void *)(a1 + 40)];
  }

void sub_10000CB88(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
    [v6 setObject:v5 forKeyedSubscript:v7];
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);
  [v9 addObject:*(void *)(a1 + 40)];
}

void sub_10000CCA8(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 expectedTimeRemaining];
  if (v3 <= 0.0)
  {
    [*(id *)(a1 + 32) attachProgressCallBack:0];
  }

  else
  {
    double v4 = (double)(uint64_t)[v6 totalWritten];
    if (v4 / (float)(uint64_t)[v6 totalExpected] > 0.0)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        (*(void (**)(void))(v5 + 16))();
      }
    }
  }
}

void sub_10000CD34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v2)
    {
      id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  804LL,  0LL));
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
    }
  }

  else if (v2)
  {
    (*(void (**)(void, void))(v2 + 16))(*(void *)(a1 + 32), 0LL);
  }

void sub_10000CDCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)CSLogCategoryAsset;
  if (v3)
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      id v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 assetServerUrl]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
      int v13 = 136315650;
      __int16 v14 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
      __int16 v15 = 2114;
      __int16 v16 = v7;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s ::: Error downloading from %{public}@ with error %{public}@",  (uint8_t *)&v13,  0x20u);
    }
  }

  else
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = v4;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 assetServerUrl]);
      int v13 = 136315394;
      __int16 v14 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
      __int16 v15 = 2114;
      __int16 v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s ::: download completed successfully from %{public}@.",  (uint8_t *)&v13,  0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

void sub_10000CF68(id a1, double a2)
{
  id v3 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
    __int16 v6 = 2050;
    double v7 = a2 * 100.0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s ::: download progress: %{public}3.0f%%",  (uint8_t *)&v4,  0x16u);
  }

void sub_10000D030(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D0C0;
  block[3] = &unk_10001C910;
  id v3 = *(id *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_async(v2, block);
}

void sub_10000D0C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0LL);
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  if (v5)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v13, "CSAssetController:didDownloadNewAssetForType:") & 1) != 0) {
            [v13 CSAssetController:*(void *)(a1 + 32) didDownloadNewAssetForType:*(void *)(a1 + 48)];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v10);
    }
  }

void sub_10000D278(uint64_t a1, uint64_t a2)
{
  int v4 = (os_log_s *)CSLogCategoryAsset;
  if (a2)
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 136315650;
      id v10 = "-[CSAssetController _downloadAssetCatalogForAssetType:complete:]_block_invoke";
      __int16 v11 = 2050;
      uint64_t v12 = v8;
      __int16 v13 = 2050;
      uint64_t v14 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Failed to download meta data for assetType %{public}lu with error %{public}lu",  (uint8_t *)&v9,  0x20u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  804LL,  0LL));
  }

  else
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v9 = 136315394;
      id v10 = "-[CSAssetController _downloadAssetCatalogForAssetType:complete:]_block_invoke";
      __int16 v11 = 2050;
      uint64_t v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Meta data downloaded successfully for assetType %{public}lu",  (uint8_t *)&v9,  0x16u);
    }

    id v5 = 0LL;
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *, id))(v7 + 16))( v7,  v5,  [*(id *)(a1 + 32) _isRetryRecommendedWithResult:a2]);
  }
}

void sub_10000D3FC(uint64_t a1, uint64_t a2)
{
  int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000D4C4;
  v9[3] = &unk_10001C8C0;
  uint64_t v14 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  id v10 = v5;
  uint64_t v15 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 56);
  dispatch_async(v4, v9);
}

void sub_10000D4C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController filteredAssetsForAssets:assetType:language:]( &OBJC_CLASS___CSAssetController,  "filteredAssetsForAssets:assetType:language:",  v6,  *(void *)(a1 + 72),  *(void *)(a1 + 40)));

    id v7 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      id v9 = [v5 count];
      uint64_t v10 = *(void *)(a1 + 72);
      int v12 = 136315650;
      id v13 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]_block_invoke_2";
      __int16 v14 = 2050;
      id v15 = v9;
      __int16 v16 = 2050;
      uint64_t v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s ::: found %{public}lu assets for assetType %{public}lu",  (uint8_t *)&v12,  0x20u);
    }

    [*(id *)(a1 + 48) _updateFromRemoteToLocalAssets:v5 forAssetType:*(void *)(a1 + 72) completion:*(void *)(a1 + 56)];
    goto LABEL_9;
  }

  id v3 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
  {
    id v11 = *(void **)(a1 + 72);
    int v12 = 136315650;
    id v13 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]_block_invoke";
    __int16 v14 = 2050;
    id v15 = v11;
    __int16 v16 = 2050;
    uint64_t v17 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Failed to finish query for assetType %{public}lu with error %{public}lu",  (uint8_t *)&v12,  0x20u);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  802LL,  0LL));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_9:
  }

void sub_10000D6AC(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48)) {
      BOOL v6 = a3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      id v7 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v14 = "-[CSAssetController fetchRemoteMetaOfType:allowRetry:]_block_invoke";
        __int16 v15 = 2050;
        uint64_t v16 = 0x4072C00000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Fetching remote meta data failed, scheduled retry after %{public}f seconds",  buf,  0x16u);
      }

      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      dispatch_time_t v8 = dispatch_time(0LL, 0x45D9648000LL);
      id v9 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10000D858;
      v11[3] = &unk_10001C870;
      objc_copyWeak(v12, (id *)buf);
      v12[1] = *(id *)(a1 + 40);
      dispatch_after(v8, v9, v11);
      objc_destroyWeak(v12);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _assetQueryForAssetType:*(void *)(a1 + 40)]);
    [*(id *)(a1 + 32) _runAssetQuery:v10 completion:0];
  }
}

void sub_10000D858(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchRemoteMetaOfType:*(void *)(a1 + 40) allowRetry:0];
}

void sub_10000D898(uint64_t a1, void *a2)
{
  if (a2
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]),
        id v8 = [v7 count],
        v7,
        !v8))
  {
    uint64_t v4 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int16 v15 = "-[CSAssetController _runAssetQuery:completion:]_block_invoke";
      __int16 v16 = 2050;
      id v17 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Error running asset query: error %{public}lu, or result is empty",  (uint8_t *)&v14,  0x16u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  802LL,  0LL));
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
LABEL_11:
    }
  }

  else
  {
    id v9 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      id v11 = v9;
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 results]);
      int v14 = 136315394;
      __int16 v15 = "-[CSAssetController _runAssetQuery:completion:]_block_invoke";
      __int16 v16 = 2050;
      id v17 = [v12 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Found %{public}lu assets",  (uint8_t *)&v14,  0x16u);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v6, 0LL);
      goto LABEL_11;
    }
  }

void sub_10000DA80(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController filteredAssetsForAssets:assetType:language:]( &OBJC_CLASS___CSAssetController,  "filteredAssetsForAssets:assetType:language:",  v7,  *(void *)(a1 + 64),  *(void *)(a1 + 40)));

    id v8 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v6 count];
      uint64_t v11 = *(void *)(a1 + 64);
      int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queryParams]);
      int v18 = 136315906;
      uint64_t v19 = "-[CSAssetController _installedAssetOfType:query:withLanguage:completion:]_block_invoke";
      __int16 v20 = 2050;
      id v21 = v10;
      __int16 v22 = 2050;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      unint64_t v25 = (unint64_t)v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s ::: found %{public}lu assets for assetType=%{public}lu, matching query: %{public}@",  (uint8_t *)&v18,  0x2Au);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _findLatestInstalledAsset:v6]);
    uint64_t v14 = *(void *)(a1 + 56);
    if (v13)
    {
      if (v14) {
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v13, 0LL);
      }
    }

    else if (v14)
    {
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  802LL,  0LL));
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0LL, v15);
    }

    goto LABEL_14;
  }

  uint64_t v4 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = *(void **)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 136315906;
    uint64_t v19 = "-[CSAssetController _installedAssetOfType:query:withLanguage:completion:]_block_invoke";
    __int16 v20 = 2050;
    id v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 2050;
    unint64_t v25 = a2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu",  (uint8_t *)&v18,  0x2Au);
  }

  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  803LL,  0LL));
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
LABEL_14:
  }

void sub_10000DD1C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DDA4;
  v7[3] = &unk_10001C780;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 _installedAssetOfType:v4 withLanguage:v3 completion:v7];
}

void sub_10000DDA4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue([a2 getCSAssetOfType:v5]);
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }

uint64_t sub_10000DE28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000DE38(uint64_t a1)
{
}

void sub_10000DE40(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _installedAssetOfType:*(void *)(a1 + 56) withLanguage:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000DE80(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___MAAssetQuery);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);
  id v6 = [v2 initWithType:v5];

  if (*(void *)(a1 + 56) == 5LL)
  {
    uint64_t v7 = ASAttributeCompatibilityVersion;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  *(void *)(a1 + 64)));
    [v6 addKeyValuePair:v7 with:v8];
  }

  else
  {
    id v18 = v6;
    +[CSAssetController addKeyValuePairForQuery:assetType:]( &OBJC_CLASS___CSAssetController,  "addKeyValuePairForQuery:assetType:",  &v18);
    id v9 = v18;

    id v6 = v9;
  }

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E004;
  v15[3] = &unk_10001C780;
  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  id v16 = v13;
  uint64_t v17 = v14;
  [v10 _installedAssetOfType:v12 query:v6 withLanguage:v11 completion:v15];
  [*(id *)(a1 + 32) _fetchRemoteAssetOfType:*(void *)(a1 + 56) withLanguage:*(void *)(a1 + 40) query:v6 completion:0];
}

void sub_10000E004(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue([a2 getCSAssetOfType:v5]);
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }

id sub_10000E088(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRemoteAssetOfType:*(void *)(a1 + 48) withLanguage:*(void *)(a1 + 40) completion:0];
}

void sub_10000E09C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == (id)2
    || [v5 state] == (id)3
    || [v5 state] == (id)5
    || [v5 state] == (id)6)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 getCSAssetOfType:*(void *)(a1 + 40)]);
    [v3 addObject:v4];
  }
}

int64_t sub_10000E12C(id a1, MAAsset *a2, MAAsset *a3)
{
  else {
    return 1LL;
  }
}

id sub_10000E150(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRemoteAssetOfType:*(void *)(a1 + 48) withLanguage:*(void *)(a1 + 40) completion:0];
}

id sub_10000E164(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpMobileAssetV1Directory];
}

void sub_10000E258(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___CSAssetController);
  id v2 = (void *)qword_100022CF8;
  qword_100022CF8 = (uint64_t)v1;
}

LABEL_15:
  return v22;
}

int64_t sub_100010A68(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"majorVersion"));
  unsigned int v7 = [v6 unsignedIntValue];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"majorVersion"));
  unsigned int v9 = [v8 unsignedIntValue];

  if (v7 > v9) {
    goto LABEL_5;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"majorVersion"));
  unsigned int v11 = [v10 unsignedIntValue];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"majorVersion"));
  unsigned int v13 = [v12 unsignedIntValue];

  if (v11 < v13)
  {
    int64_t v14 = 1LL;
    goto LABEL_6;
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"minorVersion"));
  unsigned int v16 = [v15 unsignedIntValue];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"minorVersion"));
  unsigned int v18 = [v17 unsignedIntValue];

  if (v16 > v18)
  {
LABEL_5:
    int64_t v14 = -1LL;
    goto LABEL_6;
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"minorVersion"));
  unsigned int v21 = [v20 unsignedIntValue];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"minorVersion"));
  unsigned int v23 = [v22 unsignedIntValue];

  if (v21 < v23) {
    int64_t v14 = 1LL;
  }
  else {
    int64_t v14 = -1LL;
  }
LABEL_6:

  return v14;
}

void sub_100010C04(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
  [v4 setEngineMajorVersion:v5];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
  [v4 setEngineMinorVersion:v6];
}

id sub_1000111A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

id sub_1000111AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewSpeechEndpointAssetMetaData];
}

void sub_1000111F4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___CSSpeechEndpointAssetMetaUpdateMonitor);
  id v2 = (void *)qword_100022D08;
  qword_100022D08 = (uint64_t)v1;
}

id sub_100011B50(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

id sub_100011B5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewVoiceTriggerAssetMetaData];
}

id sub_100011B64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewVoiceTriggerAssetMetaData];
}

id sub_100011B6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewVoiceTriggerAssetMetaData];
}

void sub_100011BB4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerAssetMetaUpdateMonitor);
  id v2 = (void *)qword_100022D18;
  qword_100022D18 = (uint64_t)v1;
}

id objc_msgSend_CSSpeechEndpointAssetMetaUpdateMonitor_didReceiveNewSpeechEndpointAssetMetaData_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CSSpeechEndpointAssetMetaUpdateMonitor:didReceiveNewSpeechEndpointAssetMetaData:");
}

id objc_msgSend_CSVoiceTriggerAssetMetaUpdateMonitor_didReceiveNewVoiceTriggerAssetMetaData_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CSVoiceTriggerAssetMetaUpdateMonitor:didReceiveNewVoiceTriggerAssetMetaData:");
}

id objc_msgSend__getFilteredAccessoryRTBlobListForRequestOptions_accessoryBlobs_forceSkipEngineVersionCheck_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:");
}

id objc_msgSend__handleFakeHearstModelRequest_majorVersion_minorVersion_downloadedModels_preinstalledModels_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:");
}

id objc_msgSend_selectFallbackModelForLocale_downloadedModels_preinstalledModels_rtLocaleMap_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectFallbackModelForLocale:downloadedModels:preinstalledModels:rtLocaleMap:");
}

id objc_msgSend_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:");
}

id objc_msgSend_xpcConnection_hasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:hasEntitlement:");
}