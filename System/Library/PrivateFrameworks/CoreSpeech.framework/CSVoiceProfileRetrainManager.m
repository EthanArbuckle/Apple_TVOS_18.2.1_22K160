@interface CSVoiceProfileRetrainManager
+ (CSVoiceProfileRetrainManager)sharedInstance;
- (CSVoiceProfileRetrainManager)init;
- (OS_dispatch_queue)queue;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_migrateTDVoiceProfileCallback;
- (void)_retrainingVoiceProfile:(id)a3 voiceProfile:(id)a4 asset:(id)a5;
- (void)_runVoiceProfileRetrainerWithAsset:(id)a3 withLanguageCode:(id)a4;
- (void)_speakerRecognitionCleanupDuplicatedProfilesCallback;
- (void)_speakerRecognitionModelRetrainCallback;
- (void)setQueue:(id)a3;
- (void)triggerVoiceProfileRetrainingWithAsset:(id)a3;
@end

@implementation CSVoiceProfileRetrainManager

- (CSVoiceProfileRetrainManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSVoiceProfileRetrainManager;
  v2 = -[CSVoiceProfileRetrainManager init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("cs.secondpass.retrainer.q", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100135664;
    block[3] = &unk_10022F100;
    v6 = v2;
    v10 = v6;
    dispatch_async(v5, block);
    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSVoiceProfileRetrainManager init]";
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Created CSVoiceProfileRetrainManager %@",  buf,  0x16u);
    }
  }

  return v2;
}

- (void)triggerVoiceProfileRetrainingWithAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013552C;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001351BC;
  v5[3] = &unk_10022EFA8;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  BOOL v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSVoiceProfileRetrainManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Language Changed to %{public}@ - Triggering voice profile retraining",  buf,  0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100134FAC;
  v9[3] = &unk_10022E390;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 getVoiceTriggerAssetWithEndpointId:0 completion:v9];
}

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  unsigned __int8 v7 = +[CSUtils supportsSpeakerRecognitionAssets]( &OBJC_CLASS___CSUtils,  "supportsSpeakerRecognitionAssets",  a3,  a4);
  id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s New SpeakerRecognition assets downloaded - Triggering voice profile retraining",  buf,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
    if (a5)
    {
      id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s ERR: SpeakerRecognition asset is only from MobileAsset Provider",  buf,  0xCu);
      }
    }

    else
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSRAssetManager sharedManager](&OBJC_CLASS___SSRAssetManager, "sharedManager"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100134D9C;
      v12[3] = &unk_10022E390;
      v12[4] = self;
      id v13 = v9;
      [v11 getSpeakerRecognitionAssetWithLanguage:v13 completion:v12];
    }
  }

  else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s ERR: Ignoring CSSpeakerRecognitionAssetDownloadMonitorDelegate for non-TVOS platforms !",  buf,  0xCu);
  }

- (void)_speakerRecognitionModelRetrainCallback
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[CSVoiceProfileRetrainManager _speakerRecognitionModelRetrainCallback]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s SpeakerRecognition Model Missing - Triggering voice profile retraining",  buf,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSRAssetManager sharedManager](&OBJC_CLASS___SSRAssetManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100134B8C;
  v7[3] = &unk_10022E390;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getSpeakerRecognitionAssetWithLanguage:v6 completion:v7];
}

- (void)_speakerRecognitionCleanupDuplicatedProfilesCallback
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  unsigned int v4 = [v3 isEnabled];

  if (CSIsIOS(v5) && v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
    unsigned __int8 v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[CSVoiceProfileRetrainManager _speakerRecognitionCleanupDuplicatedProfilesCallback]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Triggered cleanup of duplicated profiles",  buf,  0xCu);
    }

    if ([v6 triggerVoiceProfileDuplicatesCleanup])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10013497C;
      v11[3] = &unk_10022E390;
      v11[4] = self;
      id v12 = v8;
      id v10 = v8;
      [v9 getVoiceTriggerAssetWithEndpointId:0 completion:v11];
    }
  }

- (void)_migrateTDVoiceProfileCallback
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
  [v2 migrateTDVoiceProfilesToTDTI];
}

- (void)_runVoiceProfileRetrainerWithAsset:(id)a3 withLanguageCode:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x3032000000LL;
  v37[3] = sub_100134538;
  v37[4] = sub_100134548;
  id v38 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  unsigned __int8 v9 = [v8 isEnabled];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100134550;
  block[3] = &unk_10022EF80;
  id v10 = v7;
  id v35 = v10;
  v36 = v37;
  if (qword_1002801C8 == -1)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_3;
    }
  }

  else
  {
    dispatch_once(&qword_1002801C8, block);
    if ((v9 & 1) == 0)
    {
LABEL_3:
      if (!+[CSUtils supportsSpeakerRecognitionAssets]( &OBJC_CLASS___CSUtils,  "supportsSpeakerRecognitionAssets")) {
        goto LABEL_28;
      }
    }
  }

  context = objc_autoreleasePoolPush();
  [v10 cleanupVoiceProfileModelFilesForLocale:v25 withAsset:v6];
  objc_super v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( [v10 provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriAppDomain withLocale:v25]);
  id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v13 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2114;
      v42 = v11;
      LOWORD(v43) = 2112;
      *(void *)((char *)&v43 + 2) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s languageCode:  %{public}@ -voiceProfileArray: %{public}@, _currentAsset:%@",  buf,  0x2Au);
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v23 = v11;
    id v14 = v11;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v42 = sub_100134538;
          *(void *)&__int128 v43 = sub_100134548;
          *((void *)&v43 + 1) = v6;
          if ([*((id *)&v43 + 1) useSpeakerRecognitionAsset])
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSRAssetManager sharedManager](&OBJC_CLASS___SSRAssetManager, "sharedManager"));
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472LL;
            v26[2] = sub_10013471C;
            v26[3] = &unk_10022E3E0;
            v29 = buf;
            v26[4] = self;
            id v27 = v10;
            uint64_t v28 = v18;
            [v19 getSpeakerRecognitionAssetWithLanguage:v25 completion:v26];
          }

          else
          {
            id v20 = -[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]( self,  "_retrainingVoiceProfile:voiceProfile:asset:",  v10,  v18,  *(void *)(*(void *)&buf[8] + 40LL));
          }

          if ((CSIsCommunalDevice(v20, v21) & 1) == 0 && (unint64_t)[v14 count] >= 2)
          {
            v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v39 = 136315138;
              v40 = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s ERR: Constraining pruning and retraining to first profile",  v39,  0xCu);
            }

            _Block_object_dispose(buf, 8);

            goto LABEL_26;
          }

          _Block_object_dispose(buf, 8);
        }

        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

- (void)_retrainingVoiceProfile:(id)a3 voiceProfile:(id)a4 asset:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v9)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]";
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s recognitionAsset:%@", buf, 0x16u);
    }

    [v7 pruneImplicitUtterancesOfProfile:v8 withAsset:v9];
    v17[0] = SSRVoiceRetrainingVoiceProfileKey;
    v17[1] = SSRVoiceRetrainingFilterToVoiceTriggerUtterancesKey;
    v18[0] = v8;
    v18[1] = &__kCFBooleanTrue;
    v17[2] = SSRVoiceRetrainingAssetKey;
    v18[2] = v9;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
    id v16 = 0LL;
    id v12 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v11 error:&v16];
    id v13 = v16;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100134444;
    v14[3] = &unk_10022E408;
    id v15 = v8;
    [v7 triggerRetrainingVoiceProfile:v15 withContext:v12 withCompletion:v14];
  }

  else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Asset is nil. Cannot retrain voice profile.",  buf,  0xCu);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CSVoiceProfileRetrainManager)sharedInstance
{
  if (qword_1002801C0 != -1) {
    dispatch_once(&qword_1002801C0, &stru_10022E318);
  }
  return (CSVoiceProfileRetrainManager *)(id)qword_1002801B8;
}

@end