@interface ESConnection
+ (id)_bestGuessTaskStringsFromPreheatSource:(id)a3;
+ (id)_languagesToCompileForAssetType:(unint64_t)a3 assetManager:(id)a4;
+ (id)_speechRecognizerWithAssetConfig:(id)a3 enableITN:(BOOL)a4 isHighPriority:(BOOL)a5 error:(id *)a6;
+ (id)_speechRecognizerWithAssetConfig:(id)a3 geoLMRegionId:(id)a4 enableITN:(BOOL)a5 overrides:(id)a6 modelOverrideURL:(id)a7 preloadModels:(BOOL)a8 requestSource:(id)a9 enableParallelLoading:(BOOL)a10 isHighPriority:(BOOL)a11 geoLMLoadedOut:(id *)a12 error:(id *)a13;
+ (id)getRecognizerQueue;
+ (unint64_t)_cooldownTimerTimeoutSeconds;
+ (void)_addPendingAnalyticsEvent:(id)a3;
+ (void)_addPendingProfilerANEModelInitializationEvent:(id)a3;
+ (void)_addPendingProfilerPreheatEvent:(id)a3;
+ (void)_cachedRecognizerCleanUp;
+ (void)_cancelCooldownTimer;
+ (void)_clearPendingAnalyticsEvents;
+ (void)_clearPendingProfilerEvents;
+ (void)_cooldownTimerFired;
+ (void)_discardCachedRecognizer;
+ (void)_replaceCachedRecognizerIfNeeded;
+ (void)_scheduleCooldownTimer;
+ (void)_sendPendingAnalyticsEvents;
+ (void)captureESStartTimeInTicks;
+ (void)didFinishModelInitializing:(id)a3;
+ (void)didStartModelInitializing:(id)a3;
+ (void)initialize;
+ (void)prepareToExit;
- (BOOL)_invalidated;
- (ESConnection)init;
- (ESConnection)initWithXPCConnection:(id)a3;
- (id)_audioDataPostRecognitionStart:(id)a3;
- (id)_delegate;
- (id)_fidesEvalQueue;
- (id)_modelRootWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 error:(id *)a6;
- (id)_packetReadyUpstreamTimestampsFromAudioTime:(float)a3;
- (id)_recordedTimestampFromAudioTime:(float)a3;
- (id)_redecodeQueue;
- (id)_sLowPrioritySerialQueue;
- (id)_userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8;
- (id)dummyResultPackage:(id)a3;
- (id)geoLMRegionIdWithLanguage:(id)a3 location:(id)a4;
- (id)statusForError:(id)a3;
- (void)_processAudioPacket:(id)a3;
- (void)_processBufferedAudioPackets;
- (void)_scheduleCacheResetTimer:(id)a3;
- (void)_scheduleCompilationTimerForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)_updateAudioDuration:(id)a3;
- (void)addAudioPacket:(id)a3;
- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5;
- (void)adjustAppleTVLogLevelForSecureOfflineOnly:(BOOL)a3;
- (void)cleanupUnusedSubscriptions;
- (void)compileAllAssetsWithCompletion:(id)a3;
- (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4;
- (void)compilePrimaryAssistantAssetWithCompletion:(id)a3;
- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteAllDESRecordsForDictationPersonalizationWithCompletion:(id)a3;
- (void)fetchModelInfoForAssetConfig:(id)a3 completion:(id)a4;
- (void)fetchModelInfoForAssetConfig:(id)a3 triggerDownload:(BOOL)a4 completion:(id)a5;
- (void)fetchModelPropertiesForAssetConfig:(id)a3 completion:(id)a4;
- (void)finishAudio;
- (void)forceCooldownIfIdleWithCompletion:(id)a3;
- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5;
- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4;
- (void)handlePostUpgradeSubscriptions;
- (void)pauseRecognition;
- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5;
- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4;
- (void)preheatSpeechRecognizerWithSilence;
- (void)processPartialResultMetricsWithTokens:(id)a3 preITNTokens:(id)a4 timestamp:(double)a5;
- (void)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 completion:(id)a5;
- (void)purgeInstalledAssetsExceptLanguages:(id)a3 completion:(id)a4;
- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5;
- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7;
- (void)requestEagerResult;
- (void)resetCacheWithCompletion:(id)a3;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (void)speechRecognizer:(id)a3 didProduceLoggableMultiUserPackages:(id)a4;
- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultMultiUserPackages:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5;
- (void)startRequestActivityWithCompletion:(id)a3;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4;
- (void)stopAudioDecoding;
- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 existingProfile:(id)a5 existingAssetPath:(id)a6 completion:(id)a7;
@end

@implementation ESConnection

- (ESConnection)init
{
  return 0LL;
}

- (ESConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ESConnection;
  v6 = -[ESConnection init](&v31, "init");
  if (v6)
  {
    v7 = (void *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener _UUID](&OBJC_CLASS___NSXPCListener, "_UUID"));
      *(_DWORD *)buf = 136315394;
      v35 = "-[ESConnection initWithXPCConnection:]";
      __int16 v36 = 2114;
      v37 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Instantiating ESConnection %{public}@",  buf,  0x16u);
    }

    v6->_resultCandidateId = 0LL;
    v6->_lastWordCount = 0LL;
    v6->_disableDeliveringAsrFeatures = 0;
    objc_storeStrong((id *)&v6->_connection, a3);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    bufferedAudioPackets = v6->_bufferedAudioPackets;
    v6->_bufferedAudioPackets = v10;

    v6->_bufferedAudioDataLength = 0LL;
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    bufferedRequestEagerResultData = v6->_bufferedRequestEagerResultData;
    v6->_bufferedRequestEagerResultData = v12;

    firstAudioPacketRecordedTimeInTicks = v6->_firstAudioPacketRecordedTimeInTicks;
    v6->_firstAudioPacketRecordedTimeInTicks = 0LL;

    v6->_firstAudioPacketReceivedTime = 2.22507386e-308;
    firstAudioPacketReceivedTimeInTicks = v6->_firstAudioPacketReceivedTimeInTicks;
    v6->_firstAudioPacketReceivedTimeInTicks = 0LL;

    v6->_firstAudioPacketTimeUntilFirstPartial = 2.22507386e-308;
    v6->_timeUntilRecognitionStartInMs = 0.0;
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    processedPacketsReadyUpstreamTimestampsBuffer = v6->_processedPacketsReadyUpstreamTimestampsBuffer;
    v6->_processedPacketsReadyUpstreamTimestampsBuffer = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    processedPacketsCumulativeAudioDurationBuffer = v6->_processedPacketsCumulativeAudioDurationBuffer;
    v6->_processedPacketsCumulativeAudioDurationBuffer = v18;

    v6->_partialResultCount = 0LL;
    v6->_partialResultOffset = 0LL;
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    partialResultsTimeList = v6->_partialResultsTimeList;
    v6->_partialResultsTimeList = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    firstSeenPartialResultTokens = v6->_firstSeenPartialResultTokens;
    v6->_firstSeenPartialResultTokens = v22;

    if ((AFDeviceSupportsSiriUOD() & 1) != 0 || AFOfflineDictationCapable())
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned int v25 = [v24 infersQoSFromInstanceUUIDForEAR];

      if (v25)
      {
        uuid_clear(buf);
        if (xpc_get_instance(buf))
        {
          if (CoreEmbeddedSpeechRecognizerGetIsHighPriorityFromInstanceUUID(buf))
          {
            v26 = (os_log_s *)AFSiriLogContextSpeech;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v32 = 136315138;
              v33 = "-[ESConnection initWithXPCConnection:]";
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s ASR: Using high priority configuration.",  v32,  0xCu);
            }

            v6->_isHighPriority = 1;
          }
        }
      }
    }

    -[NSXPCConnection _setQueue:](v6->_connection, "_setQueue:", qword_100049570);
    objc_initWeak((id *)buf, v6);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100022414;
    v29[3] = &unk_100040C48;
    objc_copyWeak(&v30, (id *)buf);
    v27 = objc_retainBlock(v29);
    [v5 setInterruptionHandler:v27];
    [v5 setInvalidationHandler:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (void)dealloc
{
  p_audioBuffer = &self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);
  [WeakRetained cancelRecognition];

  id v5 = objc_loadWeakRetained((id *)p_audioBuffer);
  uint64_t v6 = qword_100049588;

  if (v5 == (id)v6)
  {
    v7 = (void *)qword_100049588;
    qword_100049588 = 0LL;
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v8 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[ESConnection dealloc]";
    __int16 v12 = 2114;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ deallocating", buf, 0x16u);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ESConnection;
  -[ESConnection dealloc](&v9, "dealloc");
}

- (id)_delegate
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)_fidesEvalQueue
{
  fidesEvalQueue = self->_fidesEvalQueue;
  if (!fidesEvalQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.ESConnection.fidesEval", 0LL);
    id v5 = self->_fidesEvalQueue;
    self->_fidesEvalQueue = v4;

    fidesEvalQueue = self->_fidesEvalQueue;
  }

  return fidesEvalQueue;
}

- (BOOL)_invalidated
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100022400;
  v4[3] = &unk_100040C70;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100049570, v4);
  LOBYTE(self) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)self;
}

- (id)_redecodeQueue
{
  redecodeQueue = self->_redecodeQueue;
  if (!redecodeQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.ESConnection.redecode", 0LL);
    uint64_t v5 = self->_redecodeQueue;
    self->_redecodeQueue = v4;

    redecodeQueue = self->_redecodeQueue;
  }

  return redecodeQueue;
}

- (id)_sLowPrioritySerialQueue
{
  v2 = (void *)qword_100049590;
  if (!qword_100049590)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.siri.ESConnection.lowPrioritySerial", v6);
    v8 = (void *)qword_100049590;
    qword_100049590 = (uint64_t)v7;

    v2 = (void *)qword_100049590;
  }

  return v2;
}

- (void)startRequestActivityWithCompletion:(id)a3
{
  id v7 = a3;
  requestCompletion = (void (**)(void))self->_requestCompletion;
  if (requestCompletion) {
    requestCompletion[2]();
  }
  id v5 = objc_retainBlock(v7);
  id v6 = self->_requestCompletion;
  self->_requestCompletion = v5;
}

- (void)fetchModelInfoForAssetConfig:(id)a3 completion:(id)a4
{
}

- (void)fetchModelInfoForAssetConfig:(id)a3 triggerDownload:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = (void (**)(id, void *, void))a5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 language]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v37 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 installedModelInfoForAssetConfig:v7 error:&v37 triggerDownload:v6]);
    id v12 = v37;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForKey:@"quasarModelPath"]);
    if (v13)
    {
      v14 = (void *)v13;
LABEL_17:
      if (v8)
      {
        if (v11) {
          id v32 = 0LL;
        }
        else {
          id v32 = v12;
        }
        ((void (**)(id, void *, id))v8)[2](v8, v11, v32);
      }

      goto LABEL_23;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v36 = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "installationStatusForLanguagesIgnoringCache:assetType:withDetailedStatus:withError:",  0,  objc_msgSend(v7, "assetType"),  0,  &v36));
    id v18 = v36;

    if (!v17)
    {
      objc_super v31 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
        __int16 v40 = 2114;
        id v41 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Could not get offline language for fetch fallback: %{public}@",  buf,  0x16u);
      }

      id v12 = v18;
      goto LABEL_16;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));

    v34 = (void *)v20;
    uint64_t v21 = AFOfflineDictationLanguageForKeyboardLanguage(v9, v20);
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v21);
    v22 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( [SFEntitledAssetConfig alloc],  "initWithLanguage:assetType:",  v33,  [v7 assetType]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v35 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 installedModelInfoForAssetConfig:v22 error:&v35 triggerDownload:v6]);
    id v12 = v35;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"quasarModelPath"]);
    unsigned int v25 = (os_log_s *)AFSiriLogContextSpeech;
    BOOL v26 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      v27 = (void *)v33;
      if (!v26) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315650;
      v39 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
      __int16 v40 = 2114;
      id v41 = v9;
      __int16 v42 = 2114;
      uint64_t v43 = v33;
      v28 = "%s Fell back asset fetch from %{public}@ to %{public}@";
      v29 = v25;
      uint32_t v30 = 32;
    }

    else
    {
      v27 = (void *)v33;
      if (!v26) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315906;
      v39 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
      __int16 v40 = 2114;
      id v41 = v9;
      __int16 v42 = 2114;
      uint64_t v43 = v33;
      __int16 v44 = 2114;
      id v45 = v12;
      v28 = "%s Failed to fall back asset fetch from %{public}@ to %{public}@, got %{public}@";
      v29 = v25;
      uint32_t v30 = 42;
    }

    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
LABEL_15:

    v11 = v24;
    if (v14) {
      goto LABEL_17;
    }
LABEL_16:

    v14 = 0LL;
    v11 = 0LL;
    goto LABEL_17;
  }

  v15 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Failing to fetch assets for nil language",  buf,  0xCu);
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1104LL,  0LL));
  ((void (**)(id, void *, id))v8)[2](v8, 0LL, v12);
LABEL_23:
}

- (void)fetchModelPropertiesForAssetConfig:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022164;
  v7[3] = &unk_100040C98;
  id v8 = a4;
  id v6 = v8;
  -[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]( self,  "fetchModelInfoForAssetConfig:triggerDownload:completion:",  a3,  0LL,  v7);
}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5
{
}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  objc_super v9 = (void (**)(id, void *, id))a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  id v14 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 installationStatusForLanguagesIgnoringCache:v8 assetType:a4 withDetailedStatus:v6 withError:&v14]);
  id v12 = v14;

  if (!v11)
  {
    uint64_t v13 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ESConnection getOfflineAssetStatusIgnoringCache:assetType:withDetailedStatus:withCompletion:]";
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Could not get installed offline language statuses: %{public}@",  buf,  0x16u);
    }
  }

  v9[2](v9, v11, v12);
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v7,  3LL);

  -[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]( self,  "preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:",  v8,  0LL,  v6);
}

- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  v11 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v83 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
    __int16 v84 = 2114;
    id v85 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Preheat for %{public}@", buf, 0x16u);
  }

  if (qword_100049588)
  {
    id v12 = (void *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v12;
      uint64_t v14 = SFEntitledAssetTypeToString([v8 assetType]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 136315394;
      v83 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
      __int16 v84 = 2114;
      id v85 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Preheat for %{public}@ dismissed because recognition in progress",  buf,  0x16u);
    }
  }

  else
  {
    +[ESConnection _clearPendingAnalyticsEvents](&OBJC_CLASS___ESConnection, "_clearPendingAnalyticsEvents");
    uint64_t Current = AFAnalyticsEventCreateCurrent(4406LL, 0LL);
    v76 = (void *)objc_claimAutoreleasedReturnValue(Current);
    +[ESConnection _addPendingAnalyticsEvent:](&OBJC_CLASS___ESConnection, "_addPendingAnalyticsEvent:");
    +[ESConnection _clearPendingProfilerEvents](&OBJC_CLASS___ESConnection, "_clearPendingProfilerEvents");
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[ESSelfHelper createPreheatStartedOrChangedEvent]( &OBJC_CLASS___ESSelfHelper,  "createPreheatStartedOrChangedEvent"));
    +[ESConnection _addPendingProfilerPreheatEvent:](&OBJC_CLASS___ESConnection, "_addPendingProfilerPreheatEvent:");
    id v78 = v8;
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v8 language]);
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v19 = sub_1000215AC(0LL, v10);
    id v77 = (id)objc_claimAutoreleasedReturnValue(v19);
    id obj = (id)v17;
    unsigned int v20 = [(id)qword_1000495B0 isEqualToString:v17];
    if (qword_1000495B8) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = 0;
    }
    +[ESConnection _scheduleCooldownTimer](&OBJC_CLASS___ESConnection, "_scheduleCooldownTimer");
    unsigned int v73 = v21;
    v74 = v18;
    if (v21 == 1)
    {
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", @"AlreadyLoaded", @"Preheating");
      v22 = (os_log_s *)qword_100049580;
      BOOL v23 = 0;
      id v24 = obj;
      p_superclass = (__objc2_class **)(&OBJC_CLASS___ESAlignmentState + 8);
      if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v83 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
        __int16 v84 = 2114;
        id v85 = obj;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s Skipping preheat for %{public}@; recognizer already loaded",
          buf,
          0x16u);
        BOOL v23 = 0;
      }
    }

    else
    {
      if (v10) {
        v70 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" with CustomModelURL %@",  v10));
      }
      else {
        v70 = &stru_1000415D8;
      }
      else {
        char v71 = 0;
      }
      if (!qword_1000495C0)
      {
        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(+[CESRGeoLMRegionIDCache sharedInstance](&OBJC_CLASS___CESRGeoLMRegionIDCache, "sharedInstance"));
        uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 lastUsedGeoLMRegionIdForLanguage:obj]);
        v28 = (void *)qword_1000495C0;
        qword_1000495C0 = v27;
      }

      if (qword_1000495B8)
      {
        if (([(id)qword_1000495B0 isEqualToString:obj] & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager sharedInstance]( &OBJC_CLASS___SFEntitledAssetManager,  "sharedInstance"));
          [v29 refreshAssetSetWithConfig:v8 regionId:qword_1000495C0];
        }

        uint32_t v30 = (void *)qword_1000495B8;
        objc_super v31 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing]( &OBJC_CLASS____EARSpeechRecognitionActiveConfiguration,  "activeConfigurationForNothing"));
        [v30 setActiveConfiguration:v31];

        id v32 = (void *)qword_1000495B8;
        qword_1000495B8 = 0LL;
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000495C8 allObjects]);
      id v34 = [v33 count];

      if (v34)
      {
        id v35 = (void *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
        {
          v64 = (void *)qword_1000495C8;
          v65 = v35;
          v66 = (void *)objc_claimAutoreleasedReturnValue([v64 allObjects]);
          id v67 = [v66 count];
          *(_DWORD *)buf = 136315394;
          v83 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
          __int16 v84 = 2048;
          id v85 = v67;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_FAULT,  "%s sRecognizerTracker: Too many recognizers active during preheat: %lu",  buf,  0x16u);
        }
      }

      BOOL isHighPriority = self->_isHighPriority;
      id v80 = 0LL;
      v81 = &off_100043068;
      BYTE1(v69) = isHighPriority;
      LOBYTE(v69) = v71;
      uint64_t v37 = objc_claimAutoreleasedReturnValue( +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]( &OBJC_CLASS___ESConnection,  "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:reques tSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:",  v8,  qword_1000495C0,  1LL,  0LL,  v10,  1LL,  v9,  v69,  &v81,  &v80));
      v38 = v81;
      id v72 = v80;
      v39 = (void *)qword_1000495B8;
      qword_1000495B8 = v37;

      if (!qword_1000495C8)
      {
        uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
        id v41 = (void *)qword_1000495C8;
        qword_1000495C8 = v40;
      }

      BOOL v23 = qword_1000495B8 == 0;
      if (qword_1000495B8)
      {
        objc_storeStrong((id *)&qword_1000495B0, obj);
        objc_storeStrong((id *)&qword_1000495D0, v77);
        byte_1000495D8 = [v38 BOOLValue];
        [(id)qword_1000495C8 addObject:qword_1000495B8];
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000495B8 modelInfo]);
        uint64_t v43 = (__CFString *)objc_claimAutoreleasedReturnValue([v42 version]);

        -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", @"Success", @"Preheating");
        __int16 v44 = (os_log_s *)qword_100049580;
        if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = (const __CFString *)qword_1000495C0;
          *(_DWORD *)buf = 136316163;
          if (!qword_1000495C0) {
            id v45 = @"(none)";
          }
          v83 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
          __int16 v84 = 2114;
          id v85 = obj;
          __int16 v86 = 2114;
          id v87 = v9;
          __int16 v88 = 2113;
          v89 = v45;
          __int16 v90 = 2114;
          v46 = (__CFString *)v70;
          v91 = v70;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s Preheated for language %{public}@, source %{public}@, regionId %{private}@%{public}@",  buf,  0x34u);
          id v24 = obj;
          p_superclass = (__objc2_class **)(&OBJC_CLASS___ESAlignmentState + 8);
        }

        else
        {
          id v24 = obj;
          p_superclass = &OBJC_CLASS___ESAlignmentState.superclass;
          v46 = (__CFString *)v70;
        }
      }

      else
      {
        -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", @"Failure", @"Preheating");
        v47 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          v68 = (const __CFString *)qword_1000495C0;
          if (!qword_1000495C0) {
            v68 = @"(none)";
          }
          *(_DWORD *)buf = 136316419;
          v83 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
          __int16 v84 = 2114;
          id v24 = obj;
          id v85 = obj;
          __int16 v86 = 2114;
          id v87 = v9;
          __int16 v88 = 2113;
          v89 = v68;
          __int16 v90 = 2114;
          v46 = (__CFString *)v70;
          v91 = v70;
          __int16 v92 = 2112;
          id v93 = v72;
          _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s Could not preheat for language %{public}@, source %{public}@, regionId %{private}@%{public}@: %@",  buf,  0x3Eu);
          uint64_t v43 = &stru_1000415D8;
          p_superclass = (__objc2_class **)(&OBJC_CLASS___ESAlignmentState + 8);
        }

        else
        {
          uint64_t v43 = &stru_1000415D8;
          id v24 = obj;
          p_superclass = (__objc2_class **)(&OBJC_CLASS___ESAlignmentState + 8);
          v46 = (__CFString *)v70;
        }
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
      [v48 logPreheatOnlyEventsWithPowerLogEvent:@"preheatSpeechRecognitionWithAssetConfig" language:v24 modelVersion:v43];

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
      [v49 purgeUnusedGeoLMAssetsForLanguage:v24];
    }

    if (qword_1000495E0) {
      v50 = (NSMutableDictionary *)(id)qword_1000495E0;
    }
    else {
      v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v51 = (void *)qword_1000495E0;
    qword_1000495E0 = (uint64_t)v50;

    +[CESRUtilities loadSpeechProfiles:language:]( &OBJC_CLASS___CESRUtilities,  "loadSpeechProfiles:language:",  qword_1000495E0,  v24);
    v52 = p_superclass + 84;
    if (v23) {
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v52 createPreheatFailedEvent]);
    }
    else {
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v52 createPreheatEndedEventWithPreheatAlreadyDone:v73]);
    }
    v54 = (void *)v53;
    +[ESConnection _addPendingProfilerPreheatEvent:]( &OBJC_CLASS___ESConnection,  "_addPendingProfilerPreheatEvent:",  v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 preheatContext]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 timestampInTicks]);
    v57 = [v56 unsignedLongLongValue];
    v58 = (void *)objc_claimAutoreleasedReturnValue([v75 preheatContext]);
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 timestampInTicks]);
    int64_t v60 = v57 - (_BYTE *)[v59 unsignedLongLongValue];

    +[CESRUtilities hostTimeToSeconds:](&OBJC_CLASS___CESRUtilities, "hostTimeToSeconds:", v60);
    NSLog(@"Preheat time interval in seconds: %lf", v61);
    uint64_t v62 = AFAnalyticsEventCreateCurrent(4407LL, v74);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    +[ESConnection _addPendingAnalyticsEvent:](&OBJC_CLASS___ESConnection, "_addPendingAnalyticsEvent:", v63);

    id v8 = v78;
  }
}

- (void)preheatSpeechRecognizerWithSilence
{
  if (qword_100049588)
  {
    v2 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ESConnection preheatSpeechRecognizerWithSilence]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s On-Device ASR: Warm up of Recognizer dismissed because recognition is in progress",  (uint8_t *)&v9,  0xCu);
    }
  }

  else if (AFDeviceSupportsSiriMUX() {
         && AFIsUODCapableHorsemanDevice()
  }
         && qword_1000495B8
         && qword_1000495B0)
  {
    dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "-[ESConnection preheatSpeechRecognizerWithSilence]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: Initiating the warm up of Recognizer with dummy silence audio data",  (uint8_t *)&v9,  0xCu);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 1920LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_1000495B8 recognitionResultsWithAudioData:v4 userProfileData:0 language:qword_1000495B0 task:CoreEmbeddedSpeechRecognizerTaskBeto samplingRate:16000 extraLanguageModel:0]);
    id v6 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      id v7 = v6;
      id v8 = [v5 count];
      int v9 = 136315394;
      id v10 = "-[ESConnection preheatSpeechRecognizerWithSilence]";
      __int16 v11 = 2048;
      id v12 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: Warmed up Recognizer. ASR results (from warm-up): %lu",  (uint8_t *)&v9,  0x16u);
    }
  }

- (id)geoLMRegionIdWithLanguage:(id)a3 location:(id)a4
{
  id v5 = a3;
  id v6 = (void *)qword_1000495B0;
  id v7 = a4;
  if (![v6 isEqualToString:v5]
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance")),
        unsigned __int8 v9 = [v8 geoLmInitialized],
        v8,
        (v9 & 1) == 0))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    [v10 initializeGeoLMWithLanguage:v5];
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 geoLMRegionIdForLocation:v7]);

  return v12;
}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000220E0;
  v7[3] = &unk_100040CE0;
  id v8 = a4;
  id v6 = v8;
  -[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]( self,  "startSpeechRecognitionWithParameters:didStartHandlerWithInfo:",  a3,  v7);
}

- (void)adjustAppleTVLogLevelForSecureOfflineOnly:(BOOL)a3
{
  BOOL v3 = a3;
  if (AFIsATV(self, a2) && AFIsInternalInstall())
  {
    v4 = (os_log_s *)AFSiriLogContextSpeech;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        int v6 = 136315138;
        id v7 = "-[ESConnection adjustAppleTVLogLevelForSecureOfflineOnly:]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Setting Quasar log level to WARN",  (uint8_t *)&v6,  0xCu);
      }

      +[_EARLogHelper setCustomQuasarLogLevel:](&OBJC_CLASS____EARLogHelper, "setCustomQuasarLogLevel:", 2LL);
    }

    else
    {
      if (v5)
      {
        int v6 = 136315138;
        id v7 = "-[ESConnection adjustAppleTVLogLevelForSecureOfflineOnly:]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Settting Quasar log level to System Default",  (uint8_t *)&v6,  0xCu);
      }

      +[_EARLogHelper setQuasarLogLevelToSystemDefault](&OBJC_CLASS____EARLogHelper, "setQuasarLogLevelToSystemDefault");
    }
  }

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4
{
  id v6 = a3;
  v347 = (void (**)(id, void, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
  if ((+[CESRUtilities isTaskDictationSpecific:]( &OBJC_CLASS___CESRUtilities,  "isTaskDictationSpecific:",  v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);

    if (v8)
    {
      unsigned __int8 v9 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s Location data was provided in the context of a Dictation request!",  buf,  0xCu);
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 mutatedCopyWithMutator:&stru_100040D20]);
      id v6 = (id)v10;
    }
  }

  else
  {
  }

  __int16 v11 = (os_log_s *)(id)qword_100049580;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Starting", buf, 0xCu);
  }

  -[ESConnection adjustAppleTVLogLevelForSecureOfflineOnly:]( self,  "adjustAppleTVLogLevelForSecureOfflineOnly:",  [v6 secureOfflineOnly]);
  id v12 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  v346 = (void *)objc_claimAutoreleasedReturnValue(v12);
  os_signpost_id_t v13 = os_signpost_id_generate(AFSiriLogContextSpeech);
  uint64_t v14 = (os_log_s *)AFSiriLogContextSpeech;
  v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v336 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "SiriX";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "ES: Recognizer Init",  "%s %s",  buf,  0x16u);
  }

  self->_resultCandidateId = 0LL;
  self->_audioDurationMs = 0.0;
  self->_processedAudioDuration = 0.0;
  self->_recognitionEndTime = 0.0;
  self->_recognitionAbsoluteEndTime = 0.0;
  self->_recognitionBeginTime = 0.0;
  self->_isSpeechAPIRequest = [v6 isSpeechAPIRequest];
  +[ESConnection _sendPendingAnalyticsEvents](&OBJC_CLASS___ESConnection, "_sendPendingAnalyticsEvents");
  p_audioBuffer = (id *)&self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (!WeakRetained)
  {
    if (qword_100049588)
    {
      unsigned int v20 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Previous recognizer on other XPC connection is busy. Send sync cancel",  buf,  0xCu);
      }

      os_signpost_id_t v21 = os_signpost_id_generate(AFSiriLogContextSpeech);
      v22 = (os_log_s *)AFSiriLogContextSpeech;
      BOOL v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        uint64_t v24 = mach_continuous_time();
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = v24;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "ES: Previous Request Cancellation",  "%{public, signpost.description:begin_time}llu",  buf,  0xCu);
      }

      [(id)qword_1000495B8 cancelRecognition];
      unsigned int v25 = (os_log_s *)AFSiriLogContextSpeech;
      BOOL v26 = v25;
      if (v21 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
      {
        uint64_t v27 = mach_continuous_time();
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = v27;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  v21,  "ES: Previous Request Cancellation",  "%{public, signpost.description:end_time}llu",  buf,  0xCu);
      }

      v28 = (void *)qword_100049588;
      qword_100049588 = 0LL;
    }

    [v6 recognitionStart];
    self->_timeUntilRecognitionStartInMs = v29 * 1000.0;
    uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationName]);
    if (v30)
    {
      applicationName = (NSString *)objc_claimAutoreleasedReturnValue([v6 applicationName]);
      group = &self->_applicationName;
      objc_storeStrong((id *)&self->_applicationName, applicationName);
    }

    else
    {
      group = &self->_applicationName;
      applicationName = self->_applicationName;
      self->_applicationName = (NSString *)&stru_1000415D8;
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 overrides]);
    uint64_t v33 = v32;
    if (v32)
    {
      id v34 = [v32 mutableCopy];
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"continuousListening"]);

      if (v35)
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"continuousListening"]);
        unsigned int v330 = [v36 BOOLValue];

        [v34 removeObjectForKey:@"continuousListening"];
      }

      else
      {
        unsigned int v330 = 0;
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"shouldHandleCapitalization"]);

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"shouldHandleCapitalization"]);
        unsigned int v323 = [v38 BOOLValue];

        [v34 removeObjectForKey:@"shouldHandleCapitalization"];
      }

      else
      {
        unsigned int v323 = 0;
      }

      if ([v34 count])
      {
        id v341 = [v34 copy];

        uint64_t v33 = v341;
      }

      else
      {
        id v341 = 0LL;
      }
    }

    else
    {
      unsigned int v323 = 0;
      unsigned int v330 = 0;
      id v341 = 0LL;
    }

    unsigned int v325 = [v6 continuousListening];
    unsigned int v321 = [v6 shouldHandleCapitalization];
    v39 = (void *)objc_claimAutoreleasedReturnValue([v6 modelOverrideURL]);
    uint64_t v40 = sub_1000215AC(v341, v39);
    id v335 = (id)objc_claimAutoreleasedReturnValue(v40);

    id v41 = objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig);
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
    v339 = -[SFEntitledAssetConfig initWithLanguage:task:](v41, "initWithLanguage:task:", v42, v43);

    dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
    id obj = (__CFString *)objc_claimAutoreleasedReturnValue( -[ESConnection geoLMRegionIdWithLanguage:location:]( self,  "geoLMRegionIdWithLanguage:location:",  v44,  v45));

    location = (id *)&self->_recognizer;
    objc_storeWeak((id *)&self->_recognizer, 0LL);
    v344 = (void *)qword_1000495B8;
    if (!qword_1000495B8)
    {
      v58 = (os_log_s *)(id)qword_100049580;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s No cached recognizer.", buf, 0xCu);
      }

      goto LABEL_70;
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
    unsigned int v47 = [v344 isSpeakerCodeTrainingSupported:v46];

    if (v47) {
      [(id)qword_1000495B8 interruptTraining];
    }
    unsigned int v48 = qword_1000495C0 == 0;
    if (obj) {
      unsigned int v48 = objc_msgSend((id)qword_1000495C0, "isEqualToString:");
    }
    v49 = (void *)qword_1000495B0;
    v50 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
    if ([v49 isEqualToString:v50])
    {
      unsigned int v51 = [v335 isEqualToDictionary:qword_1000495D0];

      if (v51)
      {
        v52 = (os_log_s *)(id)qword_100049580;
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
        if (v48)
        {
          if (v53)
          {
            uint64_t v54 = objc_claimAutoreleasedReturnValue([v6 language]);
            v55 = (void *)v54;
            v56 = @"(none)";
            *(_DWORD *)buf = 136315651;
            *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            if (obj) {
              v56 = obj;
            }
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v54;
            *(_WORD *)&buf[22] = 2113;
            v392 = (uint64_t (*)(uint64_t, uint64_t))v56;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%s Cached recognizer for language: %{public}@, regionId: %{private}@ already loaded.",  buf,  0x20u);
          }

          v57 = 0LL;
        }

        else
        {
          if (v53)
          {
            v142 = (const __CFString *)qword_1000495C0;
            v143 = @"(none)";
            if (!qword_1000495C0) {
              v142 = @"(none)";
            }
            if (obj) {
              v143 = obj;
            }
            *(_DWORD *)buf = 136315907;
            *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = qword_1000495B0;
            *(_WORD *)&buf[22] = 2113;
            v392 = (uint64_t (*)(uint64_t, uint64_t))v142;
            *(_WORD *)v393 = 2113;
            *(void *)&v393[2] = v143;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%s Cached recognizer is for language: %{public}@, regionId: %{private}@, but this request specifies a diff erent regionId: %{private}@. Discarding the cached recognizer upon cooldown.",  buf,  0x2Au);
          }

          v57 = obj;
        }

        v144 = (void *)qword_1000495E8;
        qword_1000495E8 = (uint64_t)v57;

        v145 = (void *)qword_1000495B8;
        id v146 = objc_storeWeak(location, (id)qword_1000495B8);
        v340 = (void *)objc_claimAutoreleasedReturnValue([v145 modelInfo]);

        if (v340)
        {
          id v147 = objc_loadWeakRetained(location);
          BOOL v148 = v147 == 0LL;

          if (!v148)
          {
            unsigned int v333 = 0;
            id v75 = 0LL;
            goto LABEL_76;
          }

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 correctedText]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 recognizedTextInfo]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"userEditedText"]);
  if ([v6 length]) {
    [v9 length];
  }
}

- (void)addAudioPacket:(id)a3
{
}

- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = objc_alloc(&OBJC_CLASS___ESAudioPacketTimestamps);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v12 systemUptime];
  double v14 = v13;
  v15 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  unsigned int v20 = -[ESAudioPacketTimestamps initWithPacketRecordedTimeInTicks:packetReadyUpstreamTimeInTicks:packetReceivedTime:packetReceivedTimeInTicks:]( v11,  "initWithPacketRecordedTimeInTicks:packetReadyUpstreamTimeInTicks:packetReceivedTime:packetReceivedTimeInTicks:",  v10,  v9,  v16,  v14);

  uint64_t v17 = -[ESAudioPacket initWithData:packetTimestamps:]( objc_alloc(&OBJC_CLASS___ESAudioPacket),  "initWithData:packetTimestamps:",  v8,  v20);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (!WeakRetained)
  {
    -[NSMutableArray addObject:](self->_bufferedAudioPackets, "addObject:", v17);
    self->_bufferedAudioDataLength += (unint64_t)[v8 length];
    goto LABEL_5;
  }

  -[ESStoreAudioData addAudioPacket:](self->_storeAudioData, "addAudioPacket:", v8);
  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[ESConnection _audioDataPostRecognitionStart:](self, "_audioDataPostRecognitionStart:", v8));

  -[ESAudioPacket setData:](v17, "setData:", v19);
  if (v19)
  {
    -[ESConnection _processAudioPacket:](self, "_processAudioPacket:", v17);
    id v8 = (id)v19;
LABEL_5:
  }
}

- (void)finishAudio
{
  p_audioBuffer = &self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_audioBuffer);
    [v5 endAudio];
  }

  else
  {
    self->_bufferedAudioEnded = 1;
  }

- (void)stopAudioDecoding
{
  p_audioBuffer = &self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    v4 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[ESConnection stopAudioDecoding]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stopping audio decoding since RC has been accepted",  (uint8_t *)&v6,  0xCu);
    }

    id v5 = objc_loadWeakRetained((id *)p_audioBuffer);
    [v5 stopAudioDecoding];
  }

- (void)_processBufferedAudioPackets
{
  if (self->_bufferedRequestEagerResultData)
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v4 = self->_bufferedRequestEagerResultData;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = (double)((unint64_t)[*(id *)(*((void *)&v16 + 1) + 8 * (void)v8) unsignedLongValue] >> 1)
             / (double)self->_samplingRate
             * 1000.0
             - self->_timeUntilRecognitionStartInMs;
          if (v9 >= 0.0)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9 / 1000.0));
            -[NSMutableArray addObject:](v3, "addObject:", v10);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v6);
    }

    if (-[NSMutableArray count](v3, "count"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_recognizer);
      char v12 = objc_opt_respondsToSelector(WeakRetained, "requestEagerResult:");

      if ((v12 & 1) != 0)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_recognizer);
        [v13 requestEagerResult:v3];
      }
    }
  }

  bufferedAudioPackets = self->_bufferedAudioPackets;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100021520;
  v15[3] = &unk_100040DC0;
  v15[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](bufferedAudioPackets, "enumerateObjectsUsingBlock:", v15);
  self->_bufferedAudioDataLength = 0LL;
  -[NSMutableArray removeAllObjects](self->_bufferedRequestEagerResultData, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_bufferedAudioPackets, "removeAllObjects");
}

- (id)_recordedTimestampFromAudioTime:(float)a3
{
  firstAudioPacketRecordedTimeInTicks = self->_firstAudioPacketRecordedTimeInTicks;
  if (firstAudioPacketRecordedTimeInTicks)
  {
    id v5 = -[NSNumber unsignedLongLongValue](firstAudioPacketRecordedTimeInTicks, "unsignedLongLongValue");
    *(float *)&double v6 = a3;
    firstAudioPacketRecordedTimeInTicks = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v5[(void)+[CESRUtilities secondsToHostTime:]( &OBJC_CLASS___CESRUtilities,  "secondsToHostTime:",  v6)]));
  }

  return firstAudioPacketRecordedTimeInTicks;
}

- (id)_packetReadyUpstreamTimestampsFromAudioTime:(float)a3
{
  uint64_t v10 = 0LL;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10001FD04;
  double v14 = sub_10001FD14;
  v15 = -[NSNumber initWithUnsignedLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedLongLong:", 0LL);
  processedPacketsReadyUpstreamTimestampsBuffer = self->_processedPacketsReadyUpstreamTimestampsBuffer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100021484;
  v8[3] = &unk_100040DE8;
  float v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  -[NSMutableArray enumerateObjectsUsingBlock:]( processedPacketsReadyUpstreamTimestampsBuffer,  "enumerateObjectsUsingBlock:",  v8);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)_processAudioPacket:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 packetTimestamps]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 packetRecordedTimeInTicks]);
  [v6 packetReceivedTime];
  double v9 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 packetReceivedTimeInTicks]);
  if (!self->_firstAudioPacketRecordedTimeInTicks) {
    objc_storeStrong((id *)&self->_firstAudioPacketRecordedTimeInTicks, v7);
  }
  if (self->_firstAudioPacketReceivedTime == 2.22507386e-308)
  {
    self->_firstAudioPacketReceivedTime = v9;
    objc_storeStrong((id *)&self->_firstAudioPacketReceivedTimeInTicks, v10);
  }

  if (self->_firstAudioPacketTimeUntilFirstPartial == 2.22507386e-308) {
    self->_firstAudioPacketTimeUntilFirstPartial = v9;
  }
  self->_lastAudioPacketReceivedTime = v9;
  objc_storeStrong((id *)&self->_lastAudioPacketReceivedTimeInTicks, v10);
  unint64_t v11 = (unint64_t)[v5 length] >> 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);
  id v20 = v5;
  objc_msgSend(WeakRetained, "addAudioSamples:count:", objc_msgSend(v20, "bytes"), v11);

  -[ESConnection _updateAudioDuration:](self, "_updateAudioDuration:", v20);
  [v6 setCumulativeAudioDuration:self->_audioDurationMs / 1000.0];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 packetReadyUpstreamTimeInTicks]);
  if (v13) {
    -[NSMutableArray addObject:](self->_processedPacketsReadyUpstreamTimestampsBuffer, "addObject:", v13);
  }
  [v6 cumulativeAudioDuration];
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  if (v14) {
    -[NSMutableArray addObject:](self->_processedPacketsCumulativeAudioDurationBuffer, "addObject:", v14);
  }
  if (!self->_firstAudioPacketProcessed)
  {
    self->_firstAudioPacketProcessed = 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 packetReadyUpstreamTimeInTicks]);
    [v15 logFirstAudioPacketReadyUpstreamWithTimeInTicks:v16];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
    __int128 v18 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v17 logFirstAudioPacketProcessedWithTimeInTicks:v19];
  }
}

- (void)_updateAudioDuration:(id)a3
{
  self->_audioDurationMs = v4 + self->_audioDurationMs;
}

- (id)_audioDataPostRecognitionStart:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timeUntilRecognitionStartInMs <= 0.0)
  {
    id v9 = v4;
LABEL_6:
    double v8 = v9;
    goto LABEL_7;
  }

  +[CESRUtilities audioDurationInMs:samplingRate:]( &OBJC_CLASS___CESRUtilities,  "audioDurationInMs:samplingRate:",  v4,  self->_samplingRate);
  double v7 = self->_timeUntilRecognitionStartInMs - v6;
  self->_timeUntilRecognitionStartInMs = v7;
  if (v7 < 0.0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[CESRUtilities audioData:withBytesFromEnd:]( &OBJC_CLASS___CESRUtilities,  "audioData:withBytesFromEnd:",  v5,  +[CESRUtilities audioLengthInBytes:samplingRate:]( &OBJC_CLASS___CESRUtilities,  "audioLengthInBytes:samplingRate:",  self->_samplingRate,  fabs(v7))));
    goto LABEL_6;
  }

  double v8 = 0LL;
LABEL_7:

  return v8;
}

- (void)handlePostUpgradeSubscriptions
{
}

- (void)cleanupUnusedSubscriptions
{
}

- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  double v7 = (__CFString *)a3;
  double v8 = (void (**)(id, void *, void))a5;
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 offlineDictationProfileOverridePath]);

    if (v10)
    {
      id v26 = 0LL;
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v10,  0LL,  &v26));
      uint64_t v12 = (__CFString *)v26;
      id v13 = (os_log_s *)AFSiriLogContextSpeech;
      BOOL v14 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
          __int16 v29 = 2112;
          uint32_t v30 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Using override profile at %@",  buf,  0x16u);
        }

        v8[2](v8, v11, 0LL);

        goto LABEL_24;
      }

      if (v14)
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
        __int16 v29 = 2112;
        uint32_t v30 = 0LL;
        __int16 v31 = 2112;
        id v32 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Could not use override profile at %@: %@",  buf,  0x20u);
      }
    }
  }

  id v25 = 0LL;
  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CoreEmbeddedSpeechRecognizer dictionaryWithContentsProfilePathForLanguage:errorOut:]( &OBJC_CLASS___CoreEmbeddedSpeechRecognizer,  "dictionaryWithContentsProfilePathForLanguage:errorOut:",  v7,  &v25));
  uint64_t v10 = (__CFString *)v25;
  if (!v12) {
    goto LABEL_23;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString valueForKey:](v12, "valueForKey:", @"language"));
  unsigned int v16 = [v15 isEqual:v7];

  if ((v16 & 1) == 0)
  {
    __int128 v17 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = v17;
      uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", @"language"));
      *(_DWORD *)buf = 136315650;
      v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
      __int16 v29 = 2114;
      uint32_t v30 = v24;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Mismatch in speech profile language in content (%{public}@) and filename (%{public}@)",  buf,  0x20u);
    }
  }

  __int128 v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString valueForKey:](v12, "valueForKey:", @"version"));
  if ((-[__CFString isEqual:](v18, "isEqual:", @"2.0") & 1) == 0)
  {
    v22 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
      __int16 v29 = 2114;
      uint32_t v30 = v18;
      __int16 v31 = 2114;
      id v32 = @"2.0";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Profile version on disk (%{public}@) does not match the expected version (%{public}@)",  buf,  0x20u);
    }

    goto LABEL_23;
  }

  if (!v16)
  {
LABEL_23:
    v8[2](v8, 0LL, 0LL);
    goto LABEL_24;
  }

  __int128 v19 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
    __int16 v29 = 2112;
    uint32_t v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Successfully deserialized existing speech profile for %@",  buf,  0x16u);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString valueForKey:](v12, "valueForKey:", @"data"));
  os_signpost_id_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString valueForKey:](v12, "valueForKey:", @"assetPath"));
  ((void (**)(id, void *, void *))v8)[2](v8, v20, v21);

LABEL_24:
}

- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v27 = a5;
  uint64_t v12 = (void (**)(id, void))a6;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  id v36 = sub_10001FD04;
  uint64_t v37 = sub_10001FD14;
  id v38 = 0LL;
  id v13 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v10,  3LL);
  BOOL v14 = (id *)(v34 + 5);
  id obj = (id)v34[5];
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[ESConnection _userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]( self,  "_userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:",  v13,  v11,  0LL,  0LL,  0LL,  &obj));
  objc_storeStrong(v14, obj);
  if (v15)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
    [v16 logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:@"createSpeechProfileWithLanguage" language:v10];

    [v15 removeAllWords];
    __int128 v17 = (id *)(v34 + 5);
    id v31 = (id)v34[5];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v27,  0LL,  &v31));
    objc_storeStrong(v17, v31);
    if (v18)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectEnumerator]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 nextObject]);

      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100020EF8;
        v28[3] = &unk_100040E50;
        uint32_t v30 = &v33;
        id v22 = v15;
        id v29 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v28];
        if (v34[5])
        {
          v12[2](v12, 0LL);
        }

        else
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v22 dataProfile]);
          ((void (*)(void (**)(id, void), void *, void))v12[2])(v12, v26, 0LL);
        }

        BOOL v23 = v29;
      }

      else
      {
        NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not a dictionary: %@",  v20));
        uint64_t v40 = v23;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1102LL,  v24));
        ((void (*)(void (**)(id, void), void, void *))v12[2])(v12, 0LL, v25);
      }
    }

    else
    {
      ((void (*)(void (**)(id, void), void, uint64_t))v12[2])(v12, 0LL, v34[5]);
    }
  }

  else
  {
    ((void (*)(void (**)(id, void), void, uint64_t))v12[2])(v12, 0LL, v34[5]);
  }

  _Block_object_dispose(&v33, 8);
}

- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 existingProfile:(id)a5 existingAssetPath:(id)a6 completion:(id)a7
{
  id v7 = a7;
  double v8 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v9 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  id v13 = @"updateSpeechProfileWithLanguage is currently unsupported.";
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  id v11 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v9, 1102LL, v10);

  (*((void (**)(id, void, void, NSError *))v7 + 2))(v7, 0LL, 0LL, v11);
}

- (void)_scheduleCacheResetTimer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100049570);
  cacheResetTimer = self->_cacheResetTimer;
  self->_cacheResetTimer = v5;

  id v7 = self->_cacheResetTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100020E4C;
  v11[3] = &unk_100040E78;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  dispatch_source_set_event_handler((dispatch_source_t)v7, v11);
  dispatch_time_t v9 = dispatch_time(0LL, 120000000000LL);
  dispatch_source_set_timer((dispatch_source_t)self->_cacheResetTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume((dispatch_object_t)self->_cacheResetTimer);
  id v10 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v14 = "-[ESConnection _scheduleCacheResetTimer:]";
    __int16 v15 = 2048;
    uint64_t v16 = 120LL;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Cache reset scheduled for %zus.",  buf,  0x16u);
  }
}

- (void)_scheduleCompilationTimerForAssetType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  if (!self->_compilationTimerForAssetType)
  {
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    compilationTimerForAssetType = self->_compilationTimerForAssetType;
    self->_compilationTimerForAssetType = v7;
  }

  uint64_t v9 = SFEntitledAssetTypeToString(a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100049570);
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_100020D8C;
  __int128 v19 = &unk_100040EA0;
  id v12 = v10;
  id v20 = v12;
  uint64_t v21 = self;
  unint64_t v23 = a3;
  id v13 = v6;
  id v22 = v13;
  dispatch_source_set_event_handler(v11, &v16);
  -[NSMutableDictionary setObject:forKey:]( self->_compilationTimerForAssetType,  "setObject:forKey:",  v11,  v12,  v16,  v17,  v18,  v19);
  dispatch_time_t v14 = dispatch_time(0LL, 120000000000LL);
  dispatch_source_set_timer(v11, v14, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume(v11);
  __int16 v15 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v25 = "-[ESConnection _scheduleCompilationTimerForAssetType:completion:]";
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2048;
    uint64_t v29 = 120LL;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Model compilation for %@ assets scheduled for %zus.",  buf,  0x20u);
  }
}

- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ESConnection _redecodeQueue](self, "_redecodeQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100020460;
  v21[3] = &unk_100040F38;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  id v25 = self;
  id v26 = v15;
  unint64_t v27 = a6;
  id v17 = v12;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(v16, v21);
}

- (id)_userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 language]);
  unsigned int v17 = [(id)qword_100049620 isEqualToString:v16];
  if (v15 || (v17 ? (BOOL v18 = qword_100049628 == 0) : (BOOL v18 = 1), v18 || v10))
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:",  v13,  v14,  v15,  v10,  a7,  a8));
    if (!v15 && !v10)
    {
      objc_storeStrong((id *)&qword_100049628, v19);
      id v20 = [v16 copy];
      uint64_t v21 = (void *)qword_100049620;
      qword_100049620 = (uint64_t)v20;
    }
  }

  else
  {
    id v19 = (id)qword_100049628;
  }

  return v19;
}

- (id)_modelRootWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10 && AFIsInternalInstall())
  {
    id v12 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[ESConnection _modelRootWithAssetConfig:modelOverridePath:overrides:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Set model root to %@", buf, 0x16u);
    }

    id v13 = v10;
    id v14 = 0LL;
  }

  else
  {
    id v15 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[ESConnection _modelRootWithAssetConfig:modelOverridePath:overrides:error:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Use currently installed asset.", buf, 0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v20 = 0LL;
    id v13 = (id)objc_claimAutoreleasedReturnValue([v16 installedQuasarModelPathForAssetConfig:v9 error:&v20]);
    id v14 = v20;

    if (!v13)
    {
      if (a6)
      {
        uint64_t v17 = kAFAssistantErrorDomain;
        if (v14)
        {
          NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
          id v22 = v14;
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        }

        else
        {
          BOOL v18 = 0LL;
        }

        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  600LL,  v18));
        if (v14) {
      }
        }

      id v13 = 0LL;
    }
  }

  return v13;
}

- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  abort();
}

- (void)purgeInstalledAssetsExceptLanguages:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)qword_100049578;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100020340;
  v10[3] = &unk_100040E78;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)qword_100049578;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020250;
  block[3] = &unk_100040FB0;
  id v14 = v8;
  unint64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)requestEagerResult
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_audioDurationMs / 1000.0));
    -[NSMutableArray addObject:](v10, "addObject:", v4);

    p_recognizer = &self->_recognizer;
    id v6 = objc_loadWeakRetained((id *)p_recognizer);
    char v7 = objc_opt_respondsToSelector(v6, "requestEagerResult:");

    if ((v7 & 1) != 0)
    {
      id v8 = objc_loadWeakRetained((id *)p_recognizer);
      [v8 requestEagerResult:v10];
    }
  }

  else
  {
    bufferedRequestEagerResultData = self->_bufferedRequestEagerResultData;
    id v10 = -[NSNumber initWithUnsignedLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLong:",  self->_bufferedAudioDataLength);
    -[NSMutableArray addObject:](bufferedRequestEagerResultData, "addObject:");
  }
}

- (void)resetCacheWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  id v5 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ESConnection resetCacheWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Requesting cache reset.",  (uint8_t *)&v7,  0xCu);
  }

  if (qword_100049588)
  {
    id v6 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[ESConnection resetCacheWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Deferring cache reset due to active recognition.",  (uint8_t *)&v7,  0xCu);
    }

    -[ESConnection _scheduleCacheResetTimer:](self, "_scheduleCacheResetTimer:", v4);
  }

  else
  {
    +[ESConnection _cachedRecognizerCleanUp](&OBJC_CLASS___ESConnection, "_cachedRecognizerCleanUp");
    v4[2](v4, 0LL);
  }
}

- (void)compileAllAssetsWithCompletion:(id)a3
{
}

- (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  uint64_t v7 = SFEntitledAssetTypeToString(a3);
  id v38 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v8 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[ESConnection compileAllAssetsWithType:completion:]";
    __int16 v53 = 2112;
    id v54 = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Requesting model compilation for %@ assets.",  buf,  0x16u);
  }

  if (qword_100049588)
  {
    id v9 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[ESConnection compileAllAssetsWithType:completion:]";
      __int16 v53 = 2112;
      id v54 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Deferring model compilation for %@ assets due to active recognition.",  buf,  0x16u);
    }

    -[ESConnection _scheduleCompilationTimerForAssetType:completion:]( self,  "_scheduleCompilationTimerForAssetType:completion:",  a3,  v6);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
    [v10 logAssetsCompilationEventsWithPowerLogEvent:@"compileAllAssetsWithCompletion"];

    id v11 = objc_alloc_init(&OBJC_CLASS___SFEntitledAssetManager);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ESConnection _languagesToCompileForAssetType:assetManager:]( &OBJC_CLASS___ESConnection,  "_languagesToCompileForAssetType:assetManager:",  a3,  v11));
    if ([v12 count])
    {
      id v36 = self;
      uint64_t v37 = v6;
      NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      uint64_t v35 = v12;
      id v13 = v12;
      id v41 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
      if (v41)
      {
        uint64_t v14 = *(void *)v48;
        uint64_t v40 = *(void *)v48;
        do
        {
          unint64_t v15 = 0LL;
          do
          {
            if (*(void *)v48 != v14) {
              objc_enumerationMutation(v13);
            }
            id v16 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v15);
            id v17 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v16,  a3);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 installedAssetWithConfig:v17]);
            if (v18
              && (id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
                  unsigned __int8 v20 = [v19 fileExistsAtPath:v18],
                  v19,
                  (v20 & 1) != 0))
            {
              id v21 = v13;
              id v22 = v11;
              id v23 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  a3));
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v23]);

              __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              unsigned __int8 v26 = [v25 fileExistsAtPath:v24];

              if ((v26 & 1) != 0)
              {
                [v39 setObject:v24 forKey:v16];
              }

              else
              {
                __int16 v28 = (os_log_s *)AFSiriLogContextSpeech;
                if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v52 = "-[ESConnection compileAllAssetsWithType:completion:]";
                  __int16 v53 = 2112;
                  id v54 = v38;
                  __int16 v55 = 2112;
                  id v56 = v16;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s No accessible config for %@ asset: %@",  buf,  0x20u);
                }
              }

              id v11 = v22;
              id v13 = v21;
              uint64_t v14 = v40;
            }

            else
            {
              unint64_t v27 = (os_log_s *)AFSiriLogContextSpeech;
              if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v52 = "-[ESConnection compileAllAssetsWithType:completion:]";
                __int16 v53 = 2112;
                id v54 = v38;
                __int16 v55 = 2112;
                id v56 = v16;
                _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s No accessible root path for %@ asset: %@",  buf,  0x20u);
              }
            }

            unint64_t v15 = (char *)v15 + 1;
          }

          while (v41 != v15);
          id v41 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
        }

        while (v41);
      }

      uint64_t v29 = (void *)os_transaction_create("com.apple.siri.embeddedspeech.compilation");
      uint32_t v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ESConnection _sLowPrioritySerialQueue](v36, "_sLowPrioritySerialQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001FF38;
      block[3] = &unk_100041000;
      id v31 = v39;
      id v43 = v31;
      id v32 = v38;
      id v44 = v32;
      id v6 = v37;
      id v46 = v37;
      id v33 = v29;
      id v45 = v33;
      dispatch_async(v30, block);

      id v34 = (os_log_s *)qword_100049580;
      if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v52 = "-[ESConnection compileAllAssetsWithType:completion:]";
        __int16 v53 = 2112;
        id v54 = v32;
        __int16 v55 = 2112;
        id v56 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s Requested model compilation for %@ assets: %@",  buf,  0x20u);
      }

      id v12 = v35;
    }

    else if (v6)
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)compilePrimaryAssistantAssetWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  id v54 = sub_10001FD04;
  __int16 v55 = sub_10001FD14;
  id v56 = 0LL;
  uint64_t v5 = AFPreferencesMobileUserSessionLanguage();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    uint64_t v7 = SFEntitledAssetTypeToString(3LL);
    id v43 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
    id v8 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v6,  3LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFEntitledAssetConfig language](v8, "language"));

    id v10 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v64 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
      __int16 v65 = 2112;
      uint64_t v66 = v43;
      __int16 v67 = 2112;
      id v68 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Requesting model compilation for the primary %@ asset: %@",  buf,  0x20u);
    }

    id v11 = objc_alloc_init(&OBJC_CLASS___SFEntitledAssetManager);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 installedAssetWithConfig:v8]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v14 = [v13 fileExistsAtPath:v12];

      if ((v14 & 1) != 0)
      {
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v11 modelQualityTypeStatusStringWithConfig:v8]);
        if ([v42 isEqualToString:@"HQ"])
        {
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  3LL));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v15]);

          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned __int8 v18 = [v17 fileExistsAtPath:v16];

          if ((v18 & 1) != 0)
          {
            id v19 = (void *)os_transaction_create("com.apple.siri.embeddedspeech.compilation");
            unsigned __int8 v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ESConnection _sLowPrioritySerialQueue](self, "_sLowPrioritySerialQueue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10001FD1C;
            block[3] = &unk_100041028;
            id v21 = v43;
            id v45 = (__CFString *)v21;
            id v22 = v9;
            id v46 = v22;
            id v47 = v16;
            __int128 v50 = &v51;
            id v49 = v4;
            id v23 = v19;
            id v48 = v23;
            dispatch_async(v20, block);

            id v24 = (os_log_s *)qword_100049580;
            if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v64 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
              __int16 v65 = 2112;
              uint64_t v66 = v21;
              __int16 v67 = 2112;
              id v68 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Requested model compilation for the primary %@ asset: %@",  buf,  0x20u);
            }

            __int16 v25 = 0LL;
            goto LABEL_24;
          }

          __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No accessible config for the primary %@ asset: %@",  v43,  v9));
          NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
          v58 = v25;
          id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
          uint64_t v39 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  600LL,  v38));
          uint64_t v40 = (void *)v52[5];
          v52[5] = v39;

          id v41 = (os_log_s *)AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v64 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
            __int16 v65 = 2112;
            uint64_t v66 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
            if (!v4) {
              goto LABEL_24;
            }
          }

          else if (!v4)
          {
LABEL_24:

            goto LABEL_25;
          }

          (*((void (**)(id, uint64_t))v4 + 2))(v4, v52[5]);
          goto LABEL_24;
        }

        __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The primary %@ asset: %@, is ineligible for compilation.",  v43,  v9));
        NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
        uint64_t v60 = v25;
        id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
        uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  600LL,  v34));
        id v36 = (void *)v52[5];
        v52[5] = v35;

        uint64_t v37 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v64 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
          __int16 v65 = 2112;
          uint64_t v66 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
          if (!v4) {
            goto LABEL_25;
          }
        }

        else if (!v4)
        {
LABEL_25:

          goto LABEL_26;
        }

        (*((void (**)(id, uint64_t))v4 + 2))(v4, v52[5]);
        goto LABEL_25;
      }
    }

    __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No accessible root path for the primary %@ asset: %@",  v43,  v9));
    NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
    uint64_t v62 = v25;
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  600LL,  v26));
    __int16 v28 = (void *)v52[5];
    v52[5] = v27;

    uint64_t v29 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
      __int16 v65 = 2112;
      uint64_t v66 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (!v4) {
        goto LABEL_26;
      }
    }

    else if (!v4)
    {
LABEL_26:

      goto LABEL_27;
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, v52[5]);
    goto LABEL_26;
  }

  NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
  v70 = @"No language for the current user session.";
  uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
  uint64_t v31 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  0LL,  v30));
  id v32 = (void *)v52[5];
  v52[5] = v31;

  id v33 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
    __int16 v65 = 2112;
    uint64_t v66 = @"No language for the current user session.";
    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if (v4) {
LABEL_16:
  }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v52[5]);
LABEL_17:
  __int16 v25 = @"No language for the current user session.";
LABEL_27:
  _Block_object_dispose(&v51, 8);
}

- (void)deleteAllDESRecordsForDictationPersonalizationWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  if (v3)
  {
    id v4 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      id v6 = "-[ESConnection deleteAllDESRecordsForDictationPersonalizationWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Failed to delete DES Records because dodML is not supported for this device",  (uint8_t *)&v5,  0xCu);
    }

    v3[2](v3, 0LL);
  }
}

- (void)pauseRecognition
{
  v2 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ESConnection pauseRecognition]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }

  if (qword_1000495B8)
  {
    if ((objc_opt_respondsToSelector(qword_1000495B8, "pauseRecognition") & 1) != 0)
    {
      [(id)qword_1000495B8 pauseRecognition];
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
      id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
      int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      [v3 logPauseRecognitionWithTimeInTicks:v5];
    }
  }

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    unint64_t v15 = "-[ESConnection resumeRecognitionWithPrefixText:postfixText:selectedText:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }

  if (qword_1000495B8
    && (objc_opt_respondsToSelector(qword_1000495B8, "resumeRecognitionWithLeftContext:rightContext:selectedText:") & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
    id v12 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 logResumeRecognitionWithTimeInTicks:v13];

    [(id)qword_1000495B8 resumeRecognitionWithLeftContext:v7 rightContext:v8 selectedText:v9];
  }
}

- (void)forceCooldownIfIdleWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, BOOL))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  id v4 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ESConnection forceCooldownIfIdleWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = qword_100049588;
  if (qword_100049588)
  {
    int v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ESConnection forceCooldownIfIdleWithCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Not cooling down now because recognition is active",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    +[ESConnection _cancelCooldownTimer](&OBJC_CLASS___ESConnection, "_cancelCooldownTimer");
    +[ESConnection _cachedRecognizerCleanUp](&OBJC_CLASS___ESConnection, "_cachedRecognizerCleanUp");
  }

  if (v3) {
    v3[2](v3, v5 == 0);
  }
}

- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v17 = a7;
  unsigned __int8 v18 = v17;
  if (!self->_disableDeliveringAsrFeatures)
  {
    id v19 = (dispatch_queue_s *)qword_100049570;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10001FBE8;
    v20[3] = &unk_100041078;
    int64_t v23 = a4;
    int64_t v24 = a5;
    double v25 = a6;
    double v26 = a8;
    double v27 = a10;
    id v21 = v17;
    id v22 = self;
    int64_t v28 = a9;
    dispatch_async(v19, v20);
  }
}

- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4
{
  id v5 = a4;
  int v6 = (dispatch_queue_s *)qword_100049570;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001F4B0;
  v8[3] = &unk_100041050;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)speechRecognizer:(id)a3 didProduceLoggableMultiUserPackages:(id)a4
{
  id v5 = a4;
  int v6 = (dispatch_queue_s *)qword_100049570;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001F1E4;
  v8[3] = &unk_100041050;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)processPartialResultMetricsWithTokens:(id)a3 preITNTokens:(id)a4 timestamp:(double)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)qword_100049570;
  id v10 = a4;
  dispatch_assert_queue_V2(v9);
  id v11 = (void *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 136315394;
    id v34 = "-[ESConnection processPartialResultMetricsWithTokens:preITNTokens:timestamp:]";
    __int16 v35 = 2048;
    double v36 = COERCE_DOUBLE([v8 count]);
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s %lu results", buf, 0x16u);
  }

  if (self->_firstAudioPacketTimeUntilFirstPartial > 0.0)
  {
    id v13 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      firstAudioPacketRecordedTimeInTicks = self->_firstAudioPacketRecordedTimeInTicks;
      unint64_t v15 = v13;
      +[CESRUtilities hostTimeToSeconds:]( &OBJC_CLASS___CESRUtilities,  "hostTimeToSeconds:",  -[NSNumber unsignedLongLongValue](firstAudioPacketRecordedTimeInTicks, "unsignedLongLongValue"));
      *(_DWORD *)buf = 136315394;
      id v34 = "-[ESConnection processPartialResultMetricsWithTokens:preITNTokens:timestamp:]";
      __int16 v35 = 2048;
      double v36 = a5 - v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s EmbeddedSpeechMetric: first audio packet recorded to first partial result = %lf secs",  buf,  0x16u);

      id v13 = (void *)AFSiriLogContextSpeech;
    }

    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      double v17 = a5 - self->_firstAudioPacketTimeUntilFirstPartial;
      *(_DWORD *)buf = 136315394;
      id v34 = "-[ESConnection processPartialResultMetricsWithTokens:preITNTokens:timestamp:]";
      __int16 v35 = 2048;
      double v36 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_INFO,  "%s EmbeddedSpeechMetric: first audio packet received to first partial result = %lf secs",  buf,  0x16u);
    }

    self->_firstAudioPacketTimeUntilFirstPartial = 0.0;
  }

  partialResultsTimeList = self->_partialResultsTimeList;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
  -[NSMutableArray addObject:](partialResultsTimeList, "addObject:", v19);

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10001F058;
  v32[3] = &unk_1000410C8;
  uint8_t v32[4] = self;
  [v10 enumerateObjectsUsingBlock:v32];

  id v20 = [v8 count];
  id v21 = v20;
  double v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  uint64_t v29 = sub_10001F190;
  uint32_t v30 = &unk_1000410C8;
  id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v22 = v31;
  [v8 enumerateObjectsUsingBlock:&v27];
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler", v27, v28, v29, v30));
  int64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v21));
  double v25 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  double v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v23 logPartialResultGenerated:v22 ofSize:v24 timeInTicks:v26];

  ++self->_partialResultCount;
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v8 systemUptime];
  uint64_t v10 = v9;

  id v11 = (dispatch_queue_s *)qword_100049570;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001EF24;
  v14[3] = &unk_1000410F0;
  id v15 = v7;
  id v16 = v6;
  double v17 = self;
  uint64_t v18 = v10;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v11, v14);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResultPackage:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v6 systemUptime];
  uint64_t v8 = v7;

  uint64_t v9 = (dispatch_queue_s *)qword_100049570;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EDB4;
  block[3] = &unk_100041118;
  id v12 = v5;
  id v13 = self;
  uint64_t v14 = v8;
  id v10 = v5;
  dispatch_async(v9, block);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6
{
}

- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)qword_100049570;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001EBE0;
  v8[3] = &unk_100041050;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (id)dummyResultPackage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AFSpeechToken);
  [v5 setText:@"DUMMYTOKEN"];
  [v5 setStartTime:0.0];
  [v5 setEndTime:0.0];
  [v5 setSilenceStartTime:0.0];
  [v5 setRemoveSpaceAfter:0];
  [v5 setRemoveSpaceBefore:0];
  [v5 setPhoneSequence:&stru_1000415D8];
  [v5 setIpaPhoneSequence:&stru_1000415D8];
  id v6 = objc_alloc_init(&OBJC_CLASS___AFSpeechInterpretation);
  id v26 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  [v6 setTokens:v7];

  id v8 = objc_alloc(&OBJC_CLASS___AFSpeechPhrase);
  id v25 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v10 = [v8 initWithInterpretations:v9 isLowConfidence:0];

  id v11 = [[AFSpeechUtterance alloc] initWithInterpretationIndices:&off_1000430A0 confidenceScore:0];
  [v11 setSource:2];
  id v12 = objc_alloc(&OBJC_CLASS___AFSpeechRecognition);
  id v24 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v23 = v11;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  id v15 = [v12 initWithPhrases:v13 utterances:v14 processedAudioDuration:self->_processedAudioDuration];

  id v16 = objc_alloc(&OBJC_CLASS___AFSpeechPackage);
  id v17 = [v4 isFinal];
  [v4 utteranceStart];
  double v19 = v18;
  LOBYTE(v14) = [v4 recognitionPaused];

  LOBYTE(v22) = (_BYTE)v14;
  id v20 = -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:]( v16,  "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigato rResult:recognitionPaused:",  v15,  v15,  v15,  0LL,  v17,  0LL,  v19,  v22);

  return v20;
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)qword_100049570;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001EA70;
  v8[3] = &unk_100041050;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)qword_100049570;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E110;
  block[3] = &unk_100041180;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultMultiUserPackages:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)qword_100049570;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001DC14;
  v8[3] = &unk_100041050;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (id)statusForError:(id)a3
{
  BOOL v3 = @"RECOGNITION_SUCCESS";
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL));
    v13[0] = v5;
    v14[0] = @"RECOGNITION_FAILED";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 1LL));
    v13[1] = v6;
    v14[1] = @"RECOGNITION_SUCCESS";
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2LL));
    v13[2] = v7;
    v14[2] = @"RECOGNITION_CANCELLED";
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 3LL));
    v13[3] = v8;
    v14[3] = @"RECOGNITION_REJECTED";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));

    id v10 = [v4 code];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v11]);
  }

  return v3;
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)qword_100049570;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CF30;
  block[3] = &unk_100041180;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v6 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (dispatch_queue_s *)qword_100049570;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CE28;
  block[3] = &unk_100041118;
  double v12 = a4;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5
{
  id v5 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  [v6 logFrameProcessingReadyWithTimeInTicks:v7];
}

- (void)speechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (AFDeviceSupportsSiriUOD())
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001CAF8;
    v14[3] = &unk_100041210;
    id v8 = (id *)v15;
    v15[0] = v7;
    v15[1] = self;
    id v9 = v7;
    [v6 getFormatterWithBlock:v14];
  }

  else
  {
    id v10 = (dispatch_queue_s *)qword_100049570;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001CBB8;
    v12[3] = &unk_100041050;
    id v8 = (id *)v13;
    v13[0] = v7;
    v13[1] = self;
    id v11 = v7;
    dispatch_async(v10, v12);
  }
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ESConnection) == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.siri.ESConnection", 0LL);
    BOOL v3 = (void *)qword_100049570;
    qword_100049570 = (uint64_t)v2;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(global_queue);
    id v6 = (void *)qword_100049578;
    qword_100049578 = v5;
  }

+ (void)captureESStartTimeInTicks
{
  if (qword_100049598 != -1) {
    dispatch_once(&qword_100049598, &stru_100040CB8);
  }
}

+ (id)_speechRecognizerWithAssetConfig:(id)a3 enableITN:(BOOL)a4 isHighPriority:(BOOL)a5 error:(id *)a6
{
  BYTE1(v7) = a5;
  LOBYTE(v7) = 0;
  return objc_msgSend( a1,  "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSour ce:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:",  a3,  0,  a4,  0,  0,  1,  0,  v7,  0,  a6);
}

+ (id)_speechRecognizerWithAssetConfig:(id)a3 geoLMRegionId:(id)a4 enableITN:(BOOL)a5 overrides:(id)a6 modelOverrideURL:(id)a7 preloadModels:(BOOL)a8 requestSource:(id)a9 enableParallelLoading:(BOOL)a10 isHighPriority:(BOOL)a11 geoLMLoadedOut:(id *)a12 error:(id *)a13
{
  BOOL v139 = a8;
  id v16 = a3;
  id v17 = a4;
  id v144 = a6;
  id v18 = a7;
  id v146 = a9;
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v16 language]);
  os_signpost_id_t v20 = os_signpost_id_generate(AFSiriLogContextSpeech);
  id v21 = (os_log_s *)AFSiriLogContextSpeech;
  uint64_t v22 = v21;
  unint64_t v137 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 136315394;
    double v150 = "SiriX";
    __int16 v151 = 2080;
    double v152 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "ondevice_CreateRecognizer",  "%s %s",  buf,  0x16u);
  }

  os_signpost_id_t spid = v20;

  os_signpost_id_t v23 = os_signpost_id_generate(AFSiriLogContextSpeech);
  id v24 = (os_log_s *)AFSiriLogContextSpeech;
  id v25 = v24;
  unint64_t v135 = v23 - 1;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    uint64_t v26 = mach_continuous_time();
    *(_DWORD *)buf = 134349056;
    double v150 = (const char *)v26;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "ES: Recognizer Create",  "%{public, signpost.description:begin_time}llu",  buf,  0xCu);
  }

  os_signpost_id_t v129 = v23;

  v142 = v19;
  if (v18 && AFIsInternalInstall())
  {
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    id v30 = 0LL;
  }

  else
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    [v31 refreshAssetSetWithConfig:v16 regionId:v17];

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v148 = 0LL;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v32 installedModelInfoForAssetConfig:v16 error:&v148]);
    id v30 = v148;

    double v27 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"quasarModelPath"]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"type"]);
  }

  v145 = v17;
  if (!v27)
  {
    if (a13)
    {
      id v30 = v30;
      id v44 = 0LL;
      *a13 = v30;
    }

    else
    {
      id v44 = 0LL;
    }

    goto LABEL_102;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v33 systemUptime];
  double v35 = v34;

  uint64_t v36 = objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:@"mini.json"]);
  uint64_t v37 = (void *)qword_1000495A8;
  qword_1000495A8 = v36;

  v141 = v29;
  if ((+[CESRUtilities isFilePathValid:]( &OBJC_CLASS___CESRUtilities,  "isFilePathValid:",  qword_1000495A8) & 1) != 0)
  {
    id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v127 = v38;
    if (a10)
    {
      uint64_t v39 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloa"
               "dModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s ASR: enable parallel loading", buf, 0xCu);
      }

      id v38 = v127;
      -[NSMutableDictionary setValue:forKey:](v127, "setValue:forKey:", @"YES", @"enableParallelLoading");
    }

    id v126 = v18;
    if (v139)
    {
      uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything]( &OBJC_CLASS____EARSpeechRecognitionActiveConfiguration,  "activeConfigurationForEverything"));
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[ESConnection _bestGuessTaskStringsFromPreheatSource:]( &OBJC_CLASS___ESConnection,  "_bestGuessTaskStringsFromPreheatSource:",  v146));
      if (v40)
      {
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v133 taskTypeFilter]);
        __int16 v42 = v41;
        if (v41) {
          id v43 = v41;
        }
        else {
          id v43 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
        }
        NSErrorUserInfoKey v57 = v43;

        v58 = (void *)objc_claimAutoreleasedReturnValue([v57 setByAddingObjectsFromSet:v40]);
        [v133 setTaskTypeFilter:v58];

        NSErrorUserInfoKey v59 = (void *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          uint64_t v60 = v59;
          NSErrorUserInfoKey v61 = (char *)objc_claimAutoreleasedReturnValue([v133 taskTypeFilter]);
          *(_DWORD *)buf = 136315395;
          double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:prel"
                 "oadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
          __int16 v151 = 2113;
          double v152 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "%s ASR: filtering for tasks: %{private}@",  buf,  0x16u);

          id v38 = v127;
        }

        id v17 = v145;
      }

      if (v146) {
        -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", v146, @"preheatSource");
      }
    }

    else
    {
      id v51 = objc_alloc_init(&OBJC_CLASS____EARSpeechRecognitionActiveConfiguration);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      [v51 setSamplingRateFilter:v52];

      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      [v51 setTaskTypeFilter:v53];

      id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      [v51 setFarFieldFilter:v54];

      [v51 setDeviceIdFilter:0];
      __int16 v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      [v51 setAneContextFilter:v55];

      id v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      [v51 setCpuContextFilter:v56];

      id v38 = v127;
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      uint64_t v133 = v51;
      [v51 setGpuContextFilter:v40];
    }

    if (AFDeviceSupportsSiriMUX())
    {
      p_superclass = &OBJC_CLASS___ESAlignmentState.superclass;
      if (AFIsUODCapableHorsemanDevice())
      {
        unsigned __int8 v63 = +[CESRUtilities keepANEModelLoaded](&OBJC_CLASS___CESRUtilities, "keepANEModelLoaded");
        v64 = (os_log_s *)AFSiriLogContextSpeech;
        BOOL v65 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
        if ((v63 & 1) != 0)
        {
          if (v65)
          {
            *(_DWORD *)buf = 136315138;
            double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:pr"
                   "eloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "%s On-Device ASR: Keep ANE Models Loaded - Enabled. (ANE model is eagerly loaded and won't unload after re quest completion)",  buf,  0xCu);
          }

          uint64_t v66 = @"YES";
        }

        else
        {
          if (v65)
          {
            *(_DWORD *)buf = 136315138;
            double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:pr"
                   "eloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "%s On-Device ASR: Keep ANE Models Loaded - Disabled",  buf,  0xCu);
          }

          uint64_t v66 = @"NO";
        }

        -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", v66, @"keepANEModelLoaded");
        id v67 = CoreEmbeddedSpeechRecognizerTaskBeto;
      }

      else
      {
        id v67 = 0LL;
      }
    }

    else
    {
      id v67 = 0LL;
      p_superclass = (__objc2_class **)(&OBJC_CLASS___ESAlignmentState + 8);
    }

    uint64_t v68 = _AFPreferencesValueForKeyWithContext(@"ASR task for memory lock", @"com.apple.assistant", 0LL);
    NSErrorUserInfoKey v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v124 = v69;
    if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
    {
      id v71 = v69;
      id v72 = v67;
      id v67 = v71;
    }

    uint64_t v73 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      __int16 v151 = 2113;
      double v152 = (const char *)v67;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "%s ASR: taskForMemoryLock: %{private}@",  buf,  0x16u);
    }

    if (v67) {
      -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", v67, @"taskForMemoryLock");
    }
    int v125 = v67;
    double v132 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v75 = (void *)objc_claimAutoreleasedReturnValue([v74 installedHammerConfigFileForLanguage:v19]);

    if (v75)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
      unsigned int v77 = [v76 validateHammerConfigFile:v75];

      if (v77) {
        -[NSMutableArray addObject:](v132, "addObject:", v75);
      }

      id v17 = v145;
    }

    if (v17)
    {
      id v78 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
      v79 = (void *)objc_claimAutoreleasedReturnValue( [v78 installedGeoLMRegionSpecificAssetForLanguage:v19 regionId:v17 mainAssetConfig:p_superclass[181]]);

      if (v79)
      {
        -[NSMutableArray addObject:](v132, "addObject:", v79);
        if (a12) {
          *a12 = &off_100043050;
        }
      }
    }

    id v80 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      __int16 v151 = 2112;
      double v152 = (const char *)v132;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%s Override json files=%@", buf, 0x16u);
    }

    uint64_t v81 = _os_feature_enabled_impl("Siri", "dictation_emoji_recognition");
    else {
      int v83 = 0;
    }
    id v84 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      BOOL v85 = @"NO";
      if (v83) {
        BOOL v85 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      __int16 v151 = 2112;
      double v152 = (const char *)v85;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: isSpellingUseCase: %@",  buf,  0x16u);
      if (v83) {
        goto LABEL_68;
      }
    }

    else if (v83)
    {
LABEL_68:
      id v44 = -[_EARSpeechRecognizer initWithConfiguration:useQuasarFormatter:activeConfiguration:]( objc_alloc(&OBJC_CLASS____EARSpeechRecognizer),  "initWithConfiguration:useQuasarFormatter:activeConfiguration:",  p_superclass[181],  1LL,  v133);
LABEL_85:
      uint64_t v29 = v141;
      if (v44)
      {
        -[_EARSpeechRecognizer setHighPriority:](v44, "setHighPriority:", a11);
        -[_EARSpeechRecognizer setDetectUtterances:](v44, "setDetectUtterances:", 1LL);
        -[_EARSpeechRecognizer setRecognizeEagerCandidates:](v44, "setRecognizeEagerCandidates:", 1LL);
        -[_EARSpeechRecognizer setConcatenateUtterances:](v44, "setConcatenateUtterances:", 1LL);
        -[_EARSpeechRecognizer setModelType:](v44, "setModelType:", v141);
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        [v99 systemUptime];
        double v101 = v100 - v35;

        v102 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          id v103 = p_superclass[181];
          *(_DWORD *)buf = 136315650;
          double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:prel"
                 "oadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
          __int16 v151 = 2048;
          double v152 = *(const char **)&v101;
          __int16 v153 = 2112;
          int v154 = v103;
          _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_INFO,  "%s EmbeddedSpeechMetric: Created recognizer in %lf sec from %@",  buf,  0x20u);
        }

        +[AFAggregator logLocalRecognitionLoadedForLanguage:duration:]( &OBJC_CLASS___AFAggregator,  "logLocalRecognitionLoadedForLanguage:duration:",  v19,  v101);
        v104 = (os_log_s *)AFSiriLogContextSpeech;
        id v105 = v104;
        if (v137 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
        {
          *(_DWORD *)buf = 136315394;
          double v150 = "SiriX";
          __int16 v151 = 2080;
          double v152 = "enableTelemetry=YES";
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v105,  OS_SIGNPOST_INTERVAL_END,  spid,  "ondevice_CreateRecognizer",  "%s %s",  buf,  0x16u);
        }

        v106 = (os_log_s *)AFSiriLogContextSpeech;
        v107 = v106;
        if (v135 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
        {
          uint64_t v140 = mach_continuous_time();
          id v108 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( v38, "valueForKey:", @"keepANEModelLoaded"));
          id v138 = (const char *)[v108 UTF8String];
          id v143 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( v38, "valueForKey:", @"enableParallelLoading"));
          uint64_t v136 = (__objc2_class *)[v143 UTF8String];
          id v109 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( v38, "valueForKey:", @"preheatSource"));
          id v110 = [v109 UTF8String];
          id v111 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( v38, "valueForKey:", @"taskForMemoryLock"));
          id v112 = [v111 UTF8String];
          *(_DWORD *)buf = 134350338;
          double v150 = (const char *)v140;
          __int16 v151 = 2080;
          double v152 = v138;
          __int16 v153 = 2080;
          int v154 = v136;
          __int16 v155 = 1024;
          BOOL v156 = v139;
          __int16 v157 = 2080;
          id v158 = v110;
          __int16 v159 = 2080;
          id v160 = v112;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v107,  OS_SIGNPOST_INTERVAL_END,  v129,  "ES: Recognizer Create",  "%{public, signpost.description:end_time}llu keepANEModelLoaded = %s, enableParallelLoading = %s, preloadMode ls = %u, preheatSource = %s, taskForMemoryLock = %s",  buf,  0x3Au);

          id v38 = v127;
        }

        v113 = v44;
        uint64_t v29 = v141;
      }

      else
      {
        v114 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          v120 = (const char *)p_superclass[181];
          *(_DWORD *)buf = 136315394;
          double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:prel"
                 "oadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
          __int16 v151 = 2114;
          double v152 = v120;
          _os_log_error_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_ERROR,  "%s Failed to create recognizer from %{public}@",  buf,  0x16u);
        }

        if (a13)
        {
          uint64_t v115 = kAFAssistantErrorDomain;
          NSErrorUserInfoKey v161 = NSLocalizedDescriptionKey;
          double v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create recognizer from %@",  p_superclass[181]));
          v162 = v116;
          v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v162,  &v161,  1LL));
          uint64_t v118 = v115;
          uint64_t v29 = v141;
          *a13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v118,  1105LL,  v117));

          id v38 = v127;
        }
      }

      id v30 = 0LL;
      id v18 = v126;
      goto LABEL_102;
    }

    if (_os_feature_enabled_impl("Siri", "dictation_voice_commands"))
    {
      id v134 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:@"TP/voice-commands"]);
      uint64_t v86 = objc_claimAutoreleasedReturnValue([v134 stringByAppendingPathComponent:@"textfield-editing-suite.plist"]);
      id v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v86));
      id v147 = 0LL;
      id v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfURL:error:",  v87,  &v147));
      id v89 = v147;

      v123 = v89;
      if (v89)
      {
        id v90 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:prel"
                 "oadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
          __int16 v151 = 2112;
          double v152 = (const char *)v86;
          __int16 v153 = 2112;
          int v154 = 0LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_ERROR,  "%s Voice Command: Failed to read editing suite plist at path: %@, error: %@",  buf,  0x20u);
        }
      }

      v91 = (void *)v86;
      if (!v88) {
        goto LABEL_79;
      }
      id v92 = [[EARVoiceCommandSuite alloc] initWithPlistJSONDictionary:v88];
      if (!v92) {
        goto LABEL_79;
      }
      id v93 = v92;
      v94 = v88;
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v92));
      id v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v134,  1LL));
      v97 = -[EARVoiceCommandActiveSet initWithSuites:resourceBaseURL:]( objc_alloc(&OBJC_CLASS___EARVoiceCommandActiveSet),  "initWithSuites:resourceBaseURL:",  v95,  v96);

      p_superclass = (__objc2_class **)(&OBJC_CLASS___ESAlignmentState + 8);
      id v88 = v94;

      if (!v97)
      {
LABEL_79:
        v98 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:prel"
                 "oadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "%s Unable to locate or read dictation voice commands assets",  buf,  0xCu);
        }

        v97 = 0LL;
      }

      double v19 = v142;
    }

    else
    {
      v97 = 0LL;
    }

    LOBYTE(v122) = a5;
    LOWORD(v121) = 1;
    id v44 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:]( objc_alloc(&OBJC_CLASS____EARSpeechRecognizer),  "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableS peakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:",  p_superclass[181],  v144,  v132,  v19,  v133,  v38,  v121,  v97,  a1,  v122);

    goto LABEL_85;
  }

  id v45 = v18;
  uint64_t v46 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v163 = NSLocalizedDescriptionKey;
  id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No file at path: %@",  qword_1000495A8));
  v164 = v47;
  id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v164,  &v163,  1LL));
  id v49 = (char *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v46,  600LL,  v48));

  __int128 v50 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v150 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadMod"
           "els:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
    __int16 v151 = 2112;
    double v152 = v49;
    _os_log_fault_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_FAULT, "%s %@", buf, 0x16u);
  }

  id v30 = 0LL;
  id v44 = 0LL;
  id v18 = v45;
  uint64_t v29 = v141;
  double v19 = v142;
LABEL_102:

  return v44;
}

+ (id)_bestGuessTaskStringsFromPreheatSource:(id)a3
{
  id v3 = a3;
  id v4 = [v3 isEqualToString:CoreEmbeddedSpeechRecognizerSourceAssistant];
  if ((_DWORD)v4)
  {
    int v5 = AFIsHorseman(v4);
    id v6 = &CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
    if (v5) {
      id v6 = &CoreEmbeddedSpeechRecognizerTaskBeto;
    }
    goto LABEL_9;
  }

  id v7 = [v3 isEqualToString:CoreEmbeddedSpeechRecognizerSourceDictation];
  if ((_DWORD)v7 && (AFIsHorseman(v7) & 1) == 0)
  {
    id v6 = &CoreEmbeddedSpeechRecognizerTaskDictation;
LABEL_9:
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", *v6, 0LL));
    goto LABEL_10;
  }

  id v8 = 0LL;
LABEL_10:

  return v8;
}

+ (void)_discardCachedRecognizer
{
  dispatch_queue_t v2 = objc_autoreleasePoolPush();
  os_signpost_id_t v3 = os_signpost_id_generate(AFSiriLogContextSpeech);
  id v4 = (os_log_s *)AFSiriLogContextSpeech;
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v19 = 134349056;
    os_signpost_id_t v20 = (const char *)mach_continuous_time();
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  v3,  "ES: Previous Recognizer Unload",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v19,  0xCu);
  }

  id v6 = (void *)qword_1000495B8;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing]( &OBJC_CLASS____EARSpeechRecognitionActiveConfiguration,  "activeConfigurationForNothing"));
  [v6 setActiveConfiguration:v7];

  id v8 = (void *)qword_1000495B8;
  qword_1000495B8 = 0LL;

  id v9 = (os_log_s *)AFSiriLogContextSpeech;
  id v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v11 = mach_continuous_time();
    int v19 = 134349056;
    os_signpost_id_t v20 = (const char *)v11;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  v3,  "ES: Previous Recognizer Unload",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v19,  0xCu);
  }

  objc_autoreleasePoolPop(v2);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000495C8 allObjects]);
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      id v15 = (void *)qword_1000495C8;
      id v16 = v14;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);
      id v18 = [v17 count];
      int v19 = 136315394;
      os_signpost_id_t v20 = "+[ESConnection _discardCachedRecognizer]";
      __int16 v21 = 2048;
      id v22 = v18;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "%s sRecognizerTracker: Too many recognizers active: %lu",  (uint8_t *)&v19,  0x16u);
    }
  }

+ (void)_replaceCachedRecognizerIfNeeded
{
  uint64_t v2 = qword_1000495E8;
  if (qword_1000495B8) {
    BOOL v3 = qword_1000495E8 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id v4 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = (const __CFString *)qword_1000495C0;
      if (!qword_1000495C0) {
        int v5 = @"(none)";
      }
      *(_DWORD *)buf = 136315907;
      id v22 = "+[ESConnection _replaceCachedRecognizerIfNeeded]";
      __int16 v23 = 2114;
      uint64_t v24 = qword_1000495B0;
      __int16 v25 = 2113;
      uint64_t v26 = v5;
      __int16 v27 = 2113;
      uint64_t v28 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s On-Device ASR: Replacing the cached recognizer for language: %{public}@, regionId: %{private}@ to account for the pending regionId: %{private}@",  buf,  0x2Au);
    }

    if (AFDeviceSupportsSiriMUX( +[ESConnection _discardCachedRecognizer]( &OBJC_CLASS___ESConnection,  "_discardCachedRecognizer"))) {
      char v6 = AFIsUODCapableHorsemanDevice();
    }
    else {
      char v6 = 0;
    }
    id v7 = objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig);
    id v8 = -[SFEntitledAssetConfig initWithLanguage:assetType:](v7, "initWithLanguage:assetType:", qword_1000495B0, 3LL);
    id v19 = 0LL;
    os_signpost_id_t v20 = &off_100043068;
    BYTE1(v18) = 1;
    LOBYTE(v18) = v6;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]( &OBJC_CLASS___ESConnection,  "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSo urce:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:",  v8,  qword_1000495E8,  1LL,  qword_1000495D0,  0LL,  1LL,  0LL,  v18,  &v20,  &v19));
    id v10 = v20;
    id v11 = v19;
    double v12 = (void *)qword_1000495B8;
    qword_1000495B8 = v9;

    if (v11)
    {
      id v13 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "+[ESConnection _replaceCachedRecognizerIfNeeded]";
        __int16 v23 = 2112;
        uint64_t v24 = (uint64_t)v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Error replacing the cached recognizer: %@",  buf,  0x16u);
      }
    }

    objc_storeStrong((id *)&qword_1000495C0, (id)qword_1000495E8);
    byte_1000495D8 = [v10 BOOLValue];
    id v14 = (void *)qword_1000495E8;
    qword_1000495E8 = 0LL;

    id v15 = (void *)qword_1000495C8;
    if (!qword_1000495C8)
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      id v17 = (void *)qword_1000495C8;
      qword_1000495C8 = v16;

      id v15 = (void *)qword_1000495C8;
    }

    [v15 addObject:qword_1000495B8];
  }

+ (unint64_t)_cooldownTimerTimeoutSeconds
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Cooldown timeout for EAR", @"com.apple.assistant", 0LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unint64_t v5 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 120LL;
  }

  return v5;
}

+ (void)_scheduleCooldownTimer
{
  if (!qword_100049600)
  {
    if (!qword_100049608)
    {
      BOOL v3 = (os_log_s *)qword_100049580;
      if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        id v13 = "+[ESConnection _scheduleCooldownTimer]";
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Acquired os_transaction during cooldown start",  (uint8_t *)&v12,  0xCu);
      }

      uint64_t v4 = os_transaction_create("com.apple.siri.embeddedspeech.keepalive");
      unint64_t v5 = (void *)qword_100049608;
      qword_100049608 = v4;
    }

    dispatch_source_t v6 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100049570);
    id v7 = (void *)qword_100049600;
    qword_100049600 = (uint64_t)v6;

    dispatch_source_set_event_handler((dispatch_source_t)qword_100049600, &stru_100040EC0);
    unint64_t v8 = +[ESConnection _cooldownTimerTimeoutSeconds](&OBJC_CLASS___ESConnection, "_cooldownTimerTimeoutSeconds");
    uint64_t v9 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "+[ESConnection _scheduleCooldownTimer]";
      __int16 v14 = 2048;
      unint64_t v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s On-Device ASR: Cooldown scheduled for %zus.",  (uint8_t *)&v12,  0x16u);
    }

    id v10 = (dispatch_source_s *)qword_100049600;
    dispatch_time_t v11 = dispatch_time(0LL, 1000000000 * v8);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)qword_100049600);
  }

+ (void)_cancelCooldownTimer
{
  uint64_t v2 = (dispatch_source_s *)qword_100049600;
  if (qword_100049600)
  {
    BOOL v3 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      dispatch_source_t v6 = "+[ESConnection _cancelCooldownTimer]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
      uint64_t v2 = (dispatch_source_s *)qword_100049600;
    }

    dispatch_source_cancel(v2);
    uint64_t v4 = (void *)qword_100049600;
    qword_100049600 = 0LL;
  }

+ (void)_cooldownTimerFired
{
  BOOL v3 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v12 = "+[ESConnection _cooldownTimerFired]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (+[CESRUtilities cooldownDisabledForDevice]( &OBJC_CLASS___CESRUtilities,  "cooldownDisabledForDevice"))
  {
    id v10 = 0LL;
    unsigned __int8 v4 = +[CESRUtilities isCommonUserWithReason:]( &OBJC_CLASS___CESRUtilities,  "isCommonUserWithReason:",  &v10);
    id v5 = v10;
    if ((v4 & 1) != 0)
    {
      dispatch_source_t v6 = (os_log_s *)qword_100049580;
      if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        int v12 = "+[ESConnection _cooldownTimerFired]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s On-Device ASR: Cooldown is disabled.",  buf,  0xCu);
      }

      +[ESConnection _replaceCachedRecognizerIfNeeded](&OBJC_CLASS___ESConnection, "_replaceCachedRecognizerIfNeeded");
      [a1 _cancelCooldownTimer];
      goto LABEL_14;
    }

    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v12 = "+[ESConnection _cooldownTimerFired]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Overriding and cooling down for reason: %@",  buf,  0x16u);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  if (qword_1000495E8)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
    id v9 =  [v8 installedGeoLMRegionSpecificAssetForLanguage:qword_1000495B0 regionId:qword_1000495E8 mainAssetConfig:qword_1000495A8];
  }

  [a1 _cachedRecognizerCleanUp];
LABEL_14:
}

+ (void)_cachedRecognizerCleanUp
{
  BOOL v3 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "+[ESConnection _cachedRecognizerCleanUp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }

  unsigned __int8 v4 = (void *)qword_1000495B8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing]( &OBJC_CLASS____EARSpeechRecognitionActiveConfiguration,  "activeConfigurationForNothing"));
  [v4 setActiveConfiguration:v5];

  dispatch_source_t v6 = (void *)qword_1000495B8;
  qword_1000495B8 = 0LL;

  id v7 = (void *)qword_1000495B0;
  qword_1000495B0 = 0LL;

  unint64_t v8 = (void *)qword_1000495D0;
  qword_1000495D0 = 0LL;

  byte_1000495D8 = 0;
  id v9 = (void *)qword_1000495E0;
  qword_1000495E0 = 0LL;

  id v10 = (void *)qword_1000495A8;
  qword_1000495A8 = 0LL;

  dispatch_time_t v11 = (void *)qword_1000495C0;
  qword_1000495C0 = 0LL;

  [a1 _cancelCooldownTimer];
  int v12 = (void *)qword_100049608;
  qword_100049608 = 0LL;

  [a1 _clearPendingAnalyticsEvents];
  [a1 _clearPendingProfilerEvents];
  __int16 v13 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "+[ESConnection _cachedRecognizerCleanUp]";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Releasing all asset sets.",  (uint8_t *)&v15,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  [v14 releaseAssetSets];
}

+ (void)prepareToExit
{
  uint64_t v2 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "+[ESConnection prepareToExit]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Received termination signal. Cleaning up immediately",  (uint8_t *)&v4,  0xCu);
  }

  BOOL v3 = (void *)qword_100049608;
  qword_100049608 = 0LL;
}

+ (void)_addPendingAnalyticsEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  BOOL v3 = (void *)qword_100049610;
  if (!qword_100049610)
  {
    int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = (void *)qword_100049610;
    qword_100049610 = (uint64_t)v4;

    BOOL v3 = (void *)qword_100049610;
  }

  [v3 addObject:v6];
}

+ (void)_sendPendingAnalyticsEvents
{
  if ([(id)qword_100049610 count])
  {
    uint64_t v2 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      BOOL v3 = (void *)qword_100049610;
      int v4 = v2;
      int v7 = 136315394;
      unint64_t v8 = "+[ESConnection _sendPendingAnalyticsEvents]";
      __int16 v9 = 2048;
      id v10 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Sending %lu events", (uint8_t *)&v7, 0x16u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    id v6 = [(id)qword_100049610 copy];
    [v5 logEvents:v6];
  }

  +[ESConnection _clearPendingAnalyticsEvents](&OBJC_CLASS___ESConnection, "_clearPendingAnalyticsEvents");
}

+ (void)_clearPendingAnalyticsEvents
{
  uint64_t v2 = (void *)qword_100049610;
  qword_100049610 = 0LL;
}

+ (void)_addPendingProfilerPreheatEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  BOOL v3 = (void *)qword_1000495F0;
  if (!qword_1000495F0)
  {
    int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = (void *)qword_1000495F0;
    qword_1000495F0 = (uint64_t)v4;

    BOOL v3 = (void *)qword_1000495F0;
  }

  [v3 addObject:v6];
}

+ (void)_addPendingProfilerANEModelInitializationEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100049570);
  BOOL v3 = (void *)qword_100049618;
  if (!qword_100049618)
  {
    int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = (void *)qword_100049618;
    qword_100049618 = (uint64_t)v4;

    BOOL v3 = (void *)qword_100049618;
  }

  [v3 addObject:v6];
}

+ (void)_clearPendingProfilerEvents
{
  uint64_t v2 = (void *)qword_1000495F0;
  qword_1000495F0 = 0LL;

  [(id)qword_100049618 removeAllObjects];
  BOOL v3 = (void *)qword_100049618;
  qword_100049618 = 0LL;
}

+ (id)_languagesToCompileForAssetType:(unint64_t)a3 assetManager:(id)a4
{
  id v5 = a4;
  uint64_t v6 = SFEntitledAssetTypeToString(a3);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  if (a3 == 7)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 installedLanguagesForAssetType:7]);
    id v18 = [v17 mutableCopy];

    unint64_t v8 = v18;
  }

  else if (a3 == 3)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 installationStatusForLanguagesWithAssetType:3]);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys", 0));
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v15]);
        }

        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }

      while (v12);
    }
  }

  else
  {
    id v19 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v32 = "+[ESConnection _languagesToCompileForAssetType:assetManager:]";
      __int16 v33 = 2112;
      double v34 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s %@ assets do not support model compilation.",  buf,  0x16u);
    }
  }

  id v20 = [v8 count];
  uint64_t v21 = qword_100049580;
  BOOL v22 = os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_DWORD *)buf = 136315650;
      id v32 = "+[ESConnection _languagesToCompileForAssetType:assetManager:]";
      __int16 v33 = 2112;
      double v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v8;
      __int16 v23 = "%s %@ assets eligible for model compilation: %@";
      uint64_t v24 = (os_log_s *)v21;
      uint32_t v25 = 32;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
  }

  else if (v22)
  {
    *(_DWORD *)buf = 136315394;
    id v32 = "+[ESConnection _languagesToCompileForAssetType:assetManager:]";
    __int16 v33 = 2112;
    double v34 = v7;
    __int16 v23 = "%s No %@ assets eligible for model compilation.";
    uint64_t v24 = (os_log_s *)v21;
    uint32_t v25 = 22;
    goto LABEL_22;
  }

  return v8;
}

+ (void)didStartModelInitializing:(id)a3
{
  id v3 = a3;
  int v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (dispatch_queue_s *)qword_100049570;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100024DD0;
  v9[3] = &unk_100041050;
  id v10 = v5;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  dispatch_async(v6, v9);
}

+ (void)didFinishModelInitializing:(id)a3
{
  id v3 = a3;
  int v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (dispatch_queue_s *)qword_100049570;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100024D28;
  v9[3] = &unk_100041050;
  id v10 = v5;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  dispatch_async(v6, v9);
}

+ (id)getRecognizerQueue
{
  return (id)qword_100049570;
}

@end