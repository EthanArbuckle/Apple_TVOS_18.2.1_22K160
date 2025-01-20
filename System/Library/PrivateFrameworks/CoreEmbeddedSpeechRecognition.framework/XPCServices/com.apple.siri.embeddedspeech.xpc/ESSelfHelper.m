@interface ESSelfHelper
+ (id)createANEModelInitializationEndedEventWithTimeStamp:(id)a3 fileName:(id)a4;
+ (id)createANEModelInitializationStartedEventWithTimeStamp:(id)a3 fileName:(id)a4;
+ (id)createPreheatEndedEventWithPreheatAlreadyDone:(BOOL)a3;
+ (id)createPreheatFailedEvent;
+ (id)createPreheatStartedOrChangedEvent;
+ (void)_logRequestLinkWithRequestId:(id)a3 asrId:(id)a4;
+ (void)initializeSharedPowerLoggerIfNeeded;
+ (void)logPowerSnapshotForProcessEnded;
+ (void)logPowerSnapshotForProcessStarted;
- (BOOL)_isLoggingAllowedForCurrentRequestWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4;
- (BOOL)_isNonTier1Message:(id)a3;
- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3;
- (BOOL)continuousListeningEnabled;
- (ESSelfHelper)initWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4 requestId:(id)a5 language:(id)a6 asrId:(id)a7;
- (NSNumber)personalizedLmAgeInSec;
- (NSNumber)personalizedLmWeight;
- (NSString)recognitionTask;
- (NSString)unrepairedPostItn;
- (NSUUID)asrId;
- (NSUUID)requestId;
- (void)logActiveConfigUpdateEnded;
- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAppleNeuralEngineModelInitializationEnded;
- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3;
- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logESStartWithTimeInTicks:(id)a3;
- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalResultGeneratedWithEARPackage:(id)a3 correctAlignedPartialResultIndexList:(id)a4;
- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logFirstAudioPacketProcessed;
- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3;
- (void)logFrameProcessingReady;
- (void)logInitializationEndedIsSpeechRecognizerCreated:(BOOL)a3;
- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4;
- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4 unrepairedPostItn:(id)a5 loggableSharedUserId:(id)a6;
- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4;
- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3;
- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logLeadingSilenceProcessedWithTimestampInTicks:(id)a3;
- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4;
- (void)logPartialResultGenerated;
- (void)logPendingANEModelInitializationContextEvents:(id)a3;
- (void)logPendingPreheatContextEvents:(id)a3;
- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3;
- (void)logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:(id)a3;
- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 totalITNDurationInNs:(id)a22 totalITNRuns:(id)a23 totalSecondaryPassDurationInNs:(id)a24 totalSecondaryPasses:(id)a25 cpuInstructionsInMillionsPerSecond:(id)a26 aneUsed:(id)a27;
- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12;
- (void)logSampledAudioFileStoredSuccessfully;
- (void)logSampledAudioFileStoredWithError:(id)a3 customFailureReason:(int64_t)a4;
- (void)setContinuousListeningEnabled:(BOOL)a3;
- (void)setPersonalizedLmAgeInSec:(id)a3;
- (void)setPersonalizedLmWeight:(id)a3;
- (void)setUnrepairedPostItn:(id)a3;
- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4;
@end

@implementation ESSelfHelper

- (ESSelfHelper)initWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4 requestId:(id)a5 language:(id)a6 asrId:(id)a7
{
  BOOL v10 = a4;
  v13 = (NSUUID *)a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___ESSelfHelper;
  v17 = -[ESSelfHelper init](&v44, "init");
  v18 = v17;
  if (!v17)
  {
LABEL_9:
    v22 = 0LL;
    goto LABEL_25;
  }

  if (!-[ESSelfHelper _isLoggingAllowedForCurrentRequestWithTask:isSpeechAPIRequest:]( v17,  "_isLoggingAllowedForCurrentRequestWithTask:isSpeechAPIRequest:",  v13,  v10))
  {
    v20 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v21 = @"NO";
      *(_DWORD *)buf = 136315650;
      v46 = "-[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]";
      __int16 v47 = 2112;
      v48 = v13;
      if (v10) {
        v21 = @"YES";
      }
      __int16 v49 = 2112;
      v50 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s SELF: Logging disabled because it is not allowed for the current request. recognitionTask=%@, isSpeechAPIRequest=%@",  buf,  0x20u);
    }

    goto LABEL_9;
  }

  if (v16)
  {
    v19 = (NSUUID *)v16;
  }

  else
  {
    v23 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]";
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s SELF: asrId is nil, creating a new UUID for this request.",  buf,  0xCu);
    }

    v19 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  }

  asrId = v18->_asrId;
  v18->_asrId = v19;

  v25 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v14);
  requestId = v18->_requestId;
  v18->_requestId = v25;

  objc_storeStrong((id *)&v18->_recognitionTask, a3);
  v27 = -[_EAREmojiRecognition initWithLanguage:]( objc_alloc(&OBJC_CLASS____EAREmojiRecognition),  "initWithLanguage:",  v15);
  emojiUtils = v18->_emojiUtils;
  v18->_emojiUtils = v27;

  v18->_isTier1LoggingAllowedForCurrentRequest = -[ESSelfHelper _isTier1LoggingAllowedForCurrentRequestWithTask:]( v18,  "_isTier1LoggingAllowedForCurrentRequestWithTask:",  v13);
  v29 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    v40 = v18->_asrId;
    v41 = v18->_requestId;
    recognitionTask = v18->_recognitionTask;
    if (v10) {
      v30 = @"YES";
    }
    else {
      v30 = @"NO";
    }
    v39 = v30;
    v43 = v29;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    else {
      v31 = @"NO";
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    uint64_t Name = AFSiriDataSharingOptInStatusGetName([v32 siriDataSharingOptInStatus]);
    uint64_t v34 = objc_claimAutoreleasedReturnValue(Name);
    v35 = (void *)v34;
    if (v18->_isTier1LoggingAllowedForCurrentRequest) {
      v36 = @"YES";
    }
    else {
      v36 = @"NO";
    }
    *(_DWORD *)buf = 136316930;
    v46 = "-[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]";
    __int16 v47 = 2112;
    v48 = v40;
    __int16 v49 = 2112;
    v50 = (const __CFString *)v41;
    __int16 v51 = 2112;
    v52 = recognitionTask;
    __int16 v53 = 2112;
    v54 = v39;
    __int16 v55 = 2112;
    v56 = v31;
    __int16 v57 = 2112;
    uint64_t v58 = v34;
    __int16 v59 = 2112;
    v60 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%s SELF: Logging object created successfully (logging allowed for current request). asrId=%@, requestId=%@, recogn itionTask=%@, isSpeechAPIRequest=%@, isHipaaCompliant=%@, siriOptInStatus=%@, isTier1LoggingAllowed=%@",  buf,  0x52u);
  }

  +[ESSelfHelper _logRequestLinkWithRequestId:asrId:]( &OBJC_CLASS___ESSelfHelper,  "_logRequestLinkWithRequestId:asrId:",  v18->_requestId,  v18->_asrId);
  v22 = v18;
LABEL_25:

  return v22;
}

- (BOOL)_isLoggingAllowedForCurrentRequestWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging] & 1) != 0
    || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation] & 1) != 0
    || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation]
      ? (BOOL v6 = !v4)
      : (BOOL v6 = 0),
        v6
     || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch] & 1) != 0
     || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskTshot] & 1) != 0
     || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto] & 1) != 0))
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    unsigned __int8 v7 = [v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBetoDictation];
  }

  return v7;
}

- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3
{
  uint64_t v3 = CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
  uint64_t v4 = CoreEmbeddedSpeechRecognizerTaskSiriDictation;
  uint64_t v5 = CoreEmbeddedSpeechRecognizerTaskBeto;
  uint64_t v6 = CoreEmbeddedSpeechRecognizerTaskBetoDictation;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, v4, v5, v6, 0LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  CoreEmbeddedSpeechRecognizerTaskDictation,  CoreEmbeddedSpeechRecognizerTaskWebSearch,  0LL));
  unsigned __int8 v10 = [v8 containsObject:v7];
  LODWORD(v4) = [v9 containsObject:v7];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  LOBYTE(v5) = [v11 isDictationHIPAACompliant];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v13 = [v12 siriDataSharingOptInStatus];

  char v14 = (v13 == (id)1) & ~(_BYTE)v5;
  if (!(_DWORD)v4) {
    char v14 = v10;
  }
  if ((v10 & 1) != 0) {
    BOOL v15 = v10;
  }
  else {
    BOOL v15 = v14;
  }

  return v15;
}

- (BOOL)_isNonTier1Message:(id)a3
{
  id v23 = a3;
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPreheatContext);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRRequestContext);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPackageGenerated);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRInitializationContext);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAssetLoadContext);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStored);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStorageFailed);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketReadyUpstream);
  id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  v21,  v20,  v19,  v18,  v17,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream),  0LL);
  char v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = objc_opt_class(v23);

  LOBYTE(v15) = [v14 containsObject:v15];
  return v15;
}

- (void)logPendingPreheatContextEvents:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preheatContext]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 preheatContext]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 timestampInTicks]);
        -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v10,  v12);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 powerSnapshot]);
        char v14 = (void *)objc_claimAutoreleasedReturnValue([v9 powerEventContext]);
        [v13 logWithEventContext:v14 asrIdentifier:self->_asrId];
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }
}

- (void)logPendingANEModelInitializationContextEvents:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 timestampInTicks]);
        -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v9,  v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)logESStartWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASREmbeddedSpeechProcessStarted);
  [v6 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASREmbeddedSpeechProcessContext);
  [v5 setStartedOrChanged:v6];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInitializationStarted);
  [v8 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInitializationContext);
  [v5 setStartedOrChanged:v8];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrInitializationStartedOrChangedEventContext context]( &OBJC_CLASS___SPIAsrInitializationStartedOrChangedEventContext,  "context"));
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logInitializationEndedIsSpeechRecognizerCreated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInitializationEnded);
  [v8 setExists:1];
  [v8 setIsSpeechRecognizerCreated:v3];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInitializationContext);
  [v5 setEnded:v8];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v5,  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrInitializationEndedEventContext context]( &OBJC_CLASS___SPIAsrInitializationEndedEventContext,  "context"));
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateStarted);
  [v8 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateContext);
  [v5 setStartedOrChanged:v8];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrAssetLoadStartedOrChangedEventContext context]( &OBJC_CLASS___SPIAsrAssetLoadStartedOrChangedEventContext,  "context"));
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logActiveConfigUpdateEnded
{
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateEnded);
  [v6 setExists:1];
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateContext);
  [v3 setEnded:v6];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v3,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SPIAsrAssetLoadEndedEventContext context](&OBJC_CLASS___SPIAsrAssetLoadEndedEventContext, "context"));
  [v4 logWithEventContext:v5 asrIdentifier:self->_asrId];
}

- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationStarted);
  [v6 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setStartedOrChanged:](v5, "setStartedOrChanged:", v6);
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logAppleNeuralEngineModelInitializationEnded
{
  id v4 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationEnded);
  [v4 setExists:1];
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setEnded:](v3, "setEnded:", v4);
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v3,  0LL);
}

- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentStarted);
  [v6 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext);
  [v5 setStartedOrChanged:v6];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEndedTier1);
  id v5 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = [v5 initWithNSUUID:v6];

  [v10 setLinkId:v7];
  [v10 setDialogContexts:v4];

  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEnded);
  [v8 setLinkId:v7];
  id v9 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext);
  [v9 setEnded:v8];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v10,  0LL);
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v9,  0LL);
}

- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalStarted);
  [v8 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext);
  [v5 setStartedOrChanged:v8];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrAudioPacketArrivalStartedOrChangedEventContext context]( &OBJC_CLASS___SPIAsrAudioPacketArrivalStartedOrChangedEventContext,  "context"));
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalEnded);
  [v8 setExists:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext);
  [v5 setEnded:v8];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrAudioPacketArrivalEndedEventContext context]( &OBJC_CLASS___SPIAsrAudioPacketArrivalEndedEventContext,  "context"));
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketReadyUpstream);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logFirstAudioPacketProcessed
{
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v5,  0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrFirstAudioPacketProcessedEventContext context]( &OBJC_CLASS___SPIAsrFirstAudioPacketProcessedEventContext,  "context"));
  [v3 logWithEventContext:v4 asrIdentifier:self->_asrId];
}

- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
  id v5 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketArrivalStarted);
  [v7 setExists:1];
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketArrivalContext);
  [v6 setStartedOrChanged:v7];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v6, v5);
}

- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived);
  [v6 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v6, v5);
}

- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream);
  if ([v9 isFinal])
  {
    __int128 v11 = @"-1";
  }

  else
  {
    uint64_t v12 = earPackageResultCandidateId(v9);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v13)
    {
      uint64_t v14 = earPackageResultCandidateId(v9);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      __int128 v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
    }

    else
    {
      __int128 v11 = @"-1";
    }
  }

  [v10 setResultCandidateId:v11];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v17 = [v16 longLivedIdentifierUploadingEnabled];

  if (v17) {
    [v10 setLoggableSharedUserId:v8];
  }
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v10,  v18);
}

- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived);
  [v10 setExists:1];
  uint64_t v11 = earPackageResultCandidateId(v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned __int8 v13 = [v9 isFinal];

  uint64_t v14 = @"-1";
  if ((v13 & 1) == 0 && v12) {
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
  }
  [v10 setResultCandidateId:v14];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v16 = [v15 longLivedIdentifierUploadingEnabled];

  if (v16) {
    [v10 setLoggableSharedUserId:v8];
  }
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v10,  v17);
}

- (void)logFrameProcessingReady
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFrameProcessingReady);
  [v3 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v3,  0LL);
}

- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a6;
  id v17 = a10;
  id v18 = a11;
  id v19 = a12;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRStarted);
  if (v37)
  {
    id v24 = v37;
    if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging])
    {
      uint64_t v25 = 1LL;
    }

    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation])
    {
      uint64_t v25 = 2LL;
    }

    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch])
    {
      uint64_t v25 = 3LL;
    }

    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskTshot])
    {
      uint64_t v25 = 4LL;
    }

    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation])
    {
      uint64_t v25 = 5LL;
    }

    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto])
    {
      uint64_t v25 = 7LL;
    }

    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBetoDictation])
    {
      uint64_t v25 = 8LL;
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    [v23 setTask:v25];
  }

  if (v36)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);
    objc_msgSend( v23,  "setModelLocale:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v26));
  }

  if (v35) {
    objc_msgSend(v23, "setIsHighQualityAsset:", objc_msgSend(v35, "BOOLValue"));
  }
  if (v18)
  {
    v27 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v18);
    if (v27)
    {
      id v28 = [[SISchemaUUID alloc] initWithNSUUID:v27];
      [v23 setDictationUiInteractionId:v28];
    }
  }

  if (v17)
  {
    [v17 doubleValue];
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29 * 1000000000.0));
    objc_msgSend(v23, "setSpeechProfileAgeInNs:", objc_msgSend(v30, "unsignedLongLongValue"));
  }

  else
  {
    [v23 setSpeechProfileAgeInNs:0x7FFFFFFFFFFFFFFFLL];
  }

  [v23 setDatapackVersion:v22];

  [v23 setHammerVersion:v21];
  [v23 setGeoLanguageModelRegion:v20];

  [v23 setGeoLanguageModelLoaded:a9];
  [v23 setPortraitExperimentVariantName:v19];

  id v31 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRequestContext);
  [v31 setStartedOrChanged:v23];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v31,  0LL);
  v32 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrRequestStartedOrChangedEventContext context]( &OBJC_CLASS___SPIAsrRequestStartedOrChangedEventContext,  "context"));
  [v32 logWithEventContext:v33 asrIdentifier:self->_asrId];
}

- (void)logLeadingSilenceProcessedWithTimestampInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRLeadingSilenceProcessed);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:](self, "wrapAndEmitTopLevelEvent:timestampInTicks:", v5, v4);
}

- (void)logPartialResultGenerated
{
  id v5 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated);
  [v5 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v5,  0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrPartialResultGeneratedEventContext context]( &OBJC_CLASS___SPIAsrPartialResultGeneratedEventContext,  "context"));
  [v3 logWithEventContext:v4 asrIdentifier:self->_asrId];
}

- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4
{
}

- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4 unrepairedPostItn:(id)a5 loggableSharedUserId:(id)a6
{
  id v10 = a6;
  if (self->_isTier1LoggingAllowedForCurrentRequest)
  {
    id v16 = v10;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRIntermediateUtteranceInfoTier1);
    [v14 setPhoneticMatchInput:v13];

    [v14 setPhoneticMatchOutput:v12];
    [v14 setUnrepairedPostItn:v11];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    LODWORD(v11) = [v15 longLivedIdentifierUploadingEnabled];

    if ((_DWORD)v11) {
      [v14 setLoggableSharedUserId:v16];
    }
    -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v14,  0LL);

    id v10 = v16;
  }
}

- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v30 recognition]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 interpretationIndices]);
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPackageGenerated);
    objc_msgSend(v10, "setIsFinal:", objc_msgSend(v30, "isFinal"));
    BOOL isTier1LoggingAllowedForCurrentRequest = self->_isTier1LoggingAllowedForCurrentRequest;
    emojiUtils = self->_emojiUtils;
    id v31 = 0LL;
    id v32 = 0LL;
    id v13 = v30;
    id v14 = emojiUtils;
    id v15 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPackage);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 preITNRecognition]);
    id v17 = sub_1000088A4(isTier1LoggingAllowedForCurrentRequest, v16, v14, &v32);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v15 setRawRecognition:v18];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 recognition]);
    id v20 = sub_1000088A4(isTier1LoggingAllowedForCurrentRequest, v19, v14, &v31);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    [v15 setPostItn:v21];
    id v22 = v32;
    id v23 = v31;
    [v10 setPackage:v15];

    uint64_t v24 = earPackageResultCandidateId(v13);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    unsigned __int8 v26 = [v13 isFinal];
    v27 = @"-1";
    if ((v26 & 1) == 0 && v25) {
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 stringValue]);
    }
    [v10 setResultCandidateId:v27];
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v29 = [v28 longLivedIdentifierUploadingEnabled];

    if (v29) {
      [v10 setLoggableSharedUserId:v6];
    }
    -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v10,  0LL);
    self->_packageLogged = 1;
    if (self->_isTier1LoggingAllowedForCurrentRequest)
    {
      -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v22,  0LL);
      -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v23,  0LL);
    }
  }
}

- (void)logFinalResultGeneratedWithEARPackage:(id)a3 correctAlignedPartialResultIndexList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 correctPartialResultIndexList]);
  [v7 setCorrectPartialResultIndexLists:v8];

  v40 = v7;
  v41 = v6;
  [v7 setCorrectAlignedPartialResultIndexLists:v6];
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 preITNRecognition]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 oneBest]);

  id v13 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        [v17 silenceStart];
        double v19 = v18;
        [v5 utteranceStart];
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 + v20));
        -[NSMutableArray addObject:](v9, "addObject:", v21);

        [v17 silenceStart];
        double v23 = v22;
        [v5 utteranceStart];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23 + v24));
        [v25 doubleValue];
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26 * 1000000000.0));
        -[NSMutableArray addObject:](v10, "addObject:", v27);
      }

      id v14 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }

    while (v14);
  }

  [v40 setTokenSilenceStartTimeInNsLists:v10];
  objc_msgSend(v40, "setIsAfterResume:", objc_msgSend(v5, "firstResultAfterResume"));
  id v28 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    log = v28;
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v5 correctPartialResultIndexList]);
    id v37 = objc_claimAutoreleasedReturnValue([v31 componentsJoinedByString:@","]);
    id v32 = [v37 UTF8String];
    id v33 = objc_claimAutoreleasedReturnValue([v41 componentsJoinedByString:@","]);
    id v34 = [v33 UTF8String];
    id v35 = objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( v9, "componentsJoinedByString:", @","));
    id v36 = [v35 UTF8String];
    *(_DWORD *)buf = 136315906;
    __int16 v47 = "-[ESSelfHelper logFinalResultGeneratedWithEARPackage:correctAlignedPartialResultIndexList:]";
    __int16 v48 = 2080;
    id v49 = v32;
    __int16 v50 = 2080;
    id v51 = v34;
    __int16 v52 = 2080;
    id v53 = v36;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s SELF: Correct Partial Result Index List is %s, Correct Aligned Partial Result Index List is %s, Silence Start Time List is %s",  buf,  0x2Au);
  }

  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v40,  0LL);
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrFinalResultGeneratedEventContext context]( &OBJC_CLASS___SPIAsrFinalResultGeneratedEventContext,  "context"));
  [v29 logWithEventContext:v30 asrIdentifier:self->_asrId];
}

- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 totalITNDurationInNs:(id)a22 totalITNRuns:(id)a23 totalSecondaryPassDurationInNs:(id)a24 totalSecondaryPasses:(id)a25 cpuInstructionsInMillionsPerSecond:(id)a26 aneUsed:(id)a27
{
  id v97 = a3;
  id v99 = a4;
  id v85 = a5;
  id v102 = a6;
  id v86 = a7;
  id v100 = a8;
  id v101 = a9;
  id v87 = a10;
  id v88 = a13;
  id v89 = a14;
  id v90 = a15;
  id v98 = a16;
  id v91 = a17;
  id v92 = a21;
  id v93 = a22;
  id v94 = a23;
  id v81 = a24;
  id v83 = a25;
  id v95 = a26;
  id v96 = a27;
  id v32 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRecognitionMetrics);
  personalizedLmAgeInSec = self->_personalizedLmAgeInSec;
  v103 = v32;
  if (personalizedLmAgeInSec)
  {
    -[NSNumber doubleValue](personalizedLmAgeInSec, "doubleValue", v81, v83);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v34 * 1000000000.0));
    objc_msgSend(v32, "setPersonalizedLanguageModelAgeInNs:", objc_msgSend(v35, "unsignedLongLongValue"));
  }

  personalizedLmWeight = self->_personalizedLmWeight;
  if (personalizedLmWeight)
  {
    -[NSNumber floatValue](personalizedLmWeight, "floatValue");
    objc_msgSend(v32, "setPersonalizedLanguageModelWeight:");
  }

  if (v85)
  {
    [v85 floatValue];
    objc_msgSend(v32, "setAverageActiveTokensPerFrame:");
  }

  if (v86)
  {
    [v86 floatValue];
    objc_msgSend(v32, "setSignalToNoiseRatioInDecibels:");
  }

  if (v100)
  {
    [v100 doubleValue];
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v37 * 1000000000.0));
    objc_msgSend(v32, "setRecognitionDurationInNs:", objc_msgSend(v38, "unsignedLongLongValue"));
  }

  if (v101)
  {
    [v101 doubleValue];
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v39 * 1000000.0));
    objc_msgSend(v32, "setAudioDurationInNs:", objc_msgSend(v40, "unsignedLongLongValue"));
  }

  if (v87) {
    objc_msgSend(v32, "setEagerEnabled:", objc_msgSend(v87, "BOOLValue"));
  }
  if (v88)
  {
    [v88 floatValue];
    objc_msgSend(v32, "setCpuRealTimeFactor:");
  }

  if (v89)
  {
    [v89 floatValue];
    [v32 setNumLanguageModelEnrollmentDataStreams:v41];
  }

  if (v96)
  {
    else {
      uint64_t v42 = 1LL;
    }
  }

  else
  {
    uint64_t v42 = 0LL;
  }

  objc_msgSend(v32, "setRecognitionHardware:", v42, v81);
  [v32 setUtteranceDetectionEnabled:a11];
  [v32 setUtteranceConcatenationEnabled:a12];
  [v32 setContinuousListeningEnabled:self->_continuousListeningEnabled];
  [v32 setPhoneticMatchDecoderName:v90];
  objc_msgSend( v32,  "setInverseTextNormalizationDurationForFinalResultInNs:",  objc_msgSend(v91, "unsignedLongLongValue"));
  objc_msgSend(v32, "setInverseTextNormalizationDurationInNs:", objc_msgSend(v93, "unsignedLongLongValue"));
  objc_msgSend(v32, "setNumberOfInverseTextNormalizationRuns:", objc_msgSend(v94, "unsignedIntValue"));
  [v95 doubleValue];
  [v32 setCpuInstructionsInMillionsPerSecond:(unint64_t)v43];
  id v44 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASREmojiMetrics);
  [v44 setIsEmojiPersonalizationUsed:a18];
  [v44 setIsEmojiDisambiguationUsed:a19];
  [v44 setIsEmojiExpectedButNotRecognized:a20];
  [v44 setRecognizedEmojis:v92];
  v84 = v44;
  [v32 setEmojiMetrics:v44];
  if (v99)
  {
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v99 componentsSeparatedByString:@"::"]);
    id v46 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRecognizerComponents);
    __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:0]);
    [v46 setFrontend:v47];

    __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:1]);
    [v46 setDecoder:v48];

    id v49 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:2]);
    [v46 setDecodable:v49];

    [v32 setRecognizerComponents:v46];
  }

  if (v102)
  {
    __int16 v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v112 = 0u;
    __int128 v113 = 0u;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v102 componentsSeparatedByString:@";"]);
    id v51 = [obj countByEnumeratingWithState:&v110 objects:v115 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v111;
      do
      {
        for (i = 0LL; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v111 != v52) {
            objc_enumerationMutation(obj);
          }
          v54 = *(void **)(*((void *)&v110 + 1) + 8LL * (void)i);
          id v55 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInterpolationWeightBundle);
          v56 = (void *)objc_claimAutoreleasedReturnValue([v54 componentsSeparatedByString:@":"]);
          __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:1]);
          [v57 doubleValue];
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

          __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:2]);
          [v59 doubleValue];
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

          [v58 doubleValue];
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v61 * 1000000.0));
          objc_msgSend(v55, "setStartTimeInNs:", objc_msgSend(v62, "unsignedLongLongValue"));

          [v60 doubleValue];
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v63 * 1000000.0));
          objc_msgSend(v55, "setEndTimeInNs:", objc_msgSend(v64, "unsignedLongLongValue"));

          v65 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:0]);
          v66 = (void *)objc_claimAutoreleasedReturnValue([v65 componentsSeparatedByString:@","]);

          v67 = (void *)objc_claimAutoreleasedReturnValue([v66 valueForKey:@"floatValue"]);
          [v55 setWeights:v67];

          -[NSMutableArray addObject:](v50, "addObject:", v55);
        }

        id v51 = [obj countByEnumeratingWithState:&v110 objects:v115 count:16];
      }

      while (v51);
    }

    [v103 setLanguageModelInterpolationWeights:v50];
  }

  if (v98)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    id v69 = v98;
    id v70 = [v69 countByEnumeratingWithState:&v106 objects:v114 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v107;
      do
      {
        for (j = 0LL; j != v70; j = (char *)j + 1)
        {
          if (*(void *)v107 != v71) {
            objc_enumerationMutation(v69);
          }
          [*(id *)(*((void *)&v106 + 1) + 8 * (void)j) doubleValue];
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v73 * 1000000000.0));
          [v68 addObject:v74];
        }

        id v70 = [v69 countByEnumeratingWithState:&v106 objects:v114 count:16];
      }

      while (v70);
    }

    [v103 setPausedAudioDurationsInNs:v68];
  }

  id v75 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRequestContext);
  if (!v97)
  {
    if (self->_packageLogged)
    {
      id v76 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASREnded);
      [v76 setMetrics:v103];
      [v75 setEnded:v76];
      v77 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFra"
               "me:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationM"
               "s:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:p"
               "honeticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUs"
               "ed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassD"
               "urationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
        v78 = "%s SELF: Logging ASRRequestContext->ended in SELF based on success status from recognizer.";
        goto LABEL_59;
      }
    }

    else
    {
      id v76 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRCancelled);
      [v76 setReason:3];
      [v76 setMetrics:v103];
      [v75 setCancelled:v76];
      v77 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFra"
               "me:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationM"
               "s:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:p"
               "honeticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUs"
               "ed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassD"
               "urationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
        v78 = "%s SELF: Logging ASRRequestContext->cancelled with reason RECOGNITION_REJECTED in SELF because nothing was"
              " recognized (SpeechNoMatch).";
        goto LABEL_59;
      }
    }

- (void)logSampledAudioFileStoredSuccessfully
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStored);
  [v3 setExists:1];
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v3,  0LL);
}

- (void)logSampledAudioFileStoredWithError:(id)a3 customFailureReason:(int64_t)a4
{
  id v12 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStorageFailed);
  if (v12)
  {
    objc_msgSend(v6, "setErrorCode:", objc_msgSend(v12, "code"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
    [v6 setErrorDomain:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:NSUnderlyingErrorKey]);

    if (v9)
    {
      objc_msgSend(v6, "setUnderlyingErrorCode:", objc_msgSend(v9, "code"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      [v6 setUnderlyingErrorDomain:v10];
    }
  }

  else
  {
    else {
      uint64_t v11 = 0LL;
    }
    [v6 setSampledAudioStorageFailureReason:v11];
  }

  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v6,  0LL);
}

- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[ESSelfHelper _isNonTier1Message:](self, "_isNonTier1Message:", v6);
  BOOL isTier1LoggingAllowedForCurrentRequest = self->_isTier1LoggingAllowedForCurrentRequest;
  int v10 = objc_opt_respondsToSelector(v6, "deleteLinkId");
  if ((v8 & 1) != 0 || isTier1LoggingAllowedForCurrentRequest)
  {
    if (!isTier1LoggingAllowedForCurrentRequest && ((v10 ^ 1) & 1) == 0) {
      ((void (*)(id, const char *))[v6 methodForSelector:"deleteLinkId"])( v6,  "deleteLinkId");
    }
    id v11 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRClientEventMetadata);
    id v12 = [[SISchemaUUID alloc] initWithNSUUID:self->_asrId];
    [v11 setAsrId:v12];
    id v13 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRClientEvent);
    [v13 setEventMetadata:v11];
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPreheatContext);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
    {
      [v13 setPreheatContext:v6];
    }

    else
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRRequestContext);
      if ((objc_opt_isKindOfClass(v6, v15) & 1) != 0)
      {
        [v13 setRequestContext:v6];
      }

      else
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated);
        if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
        {
          [v13 setPartialResultGenerated:v6];
        }

        else
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPackageGenerated);
          if ((objc_opt_isKindOfClass(v6, v17) & 1) != 0)
          {
            [v13 setPackageGenerated:v6];
          }

          else
          {
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRRecognitionResultTier1);
            if ((objc_opt_isKindOfClass(v6, v18) & 1) != 0)
            {
              [v13 setRecognitionResultTier1:v6];
            }

            else
            {
              uint64_t v19 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated);
              if ((objc_opt_isKindOfClass(v6, v19) & 1) != 0)
              {
                [v13 setFinalResultGenerated:v6];
              }

              else
              {
                uint64_t v20 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRIntermediateUtteranceInfoTier1);
                if ((objc_opt_isKindOfClass(v6, v20) & 1) != 0)
                {
                  [v13 setIntermediateUtteranceInfoTier1:v6];
                }

                else
                {
                  uint64_t v21 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRInitializationContext);
                  if ((objc_opt_isKindOfClass(v6, v21) & 1) != 0)
                  {
                    [v13 setInitializationContext:v6];
                  }

                  else
                  {
                    uint64_t v22 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAssetLoadContext);
                    if ((objc_opt_isKindOfClass(v6, v22) & 1) != 0)
                    {
                      [v13 setAssetLoadContext:v6];
                    }

                    else
                    {
                      uint64_t v23 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext);
                      if ((objc_opt_isKindOfClass(v6, v23) & 1) != 0)
                      {
                        [v13 setLanguageModelEnrollmentContext:v6];
                      }

                      else
                      {
                        uint64_t v24 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEndedTier1);
                        if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
                        {
                          [v13 setJitLanguageModelEnrollmentEndedTier1:v6];
                        }

                        else
                        {
                          uint64_t v25 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext);
                          if ((objc_opt_isKindOfClass(v6, v25) & 1) != 0)
                          {
                            [v13 setAudioPacketArrivalContext:v6];
                          }

                          else
                          {
                            uint64_t v26 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed);
                            if ((objc_opt_isKindOfClass(v6, v26) & 1) != 0)
                            {
                              [v13 setFirstAudioPacketProcessed:v6];
                            }

                            else
                            {
                              uint64_t v27 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived);
                              if ((objc_opt_isKindOfClass(v6, v27) & 1) != 0)
                              {
                                [v13 setFinalAudioPacketContainingSpeechReceived:v6];
                              }

                              else
                              {
                                uint64_t v28 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStored);
                                if ((objc_opt_isKindOfClass(v6, v28) & 1) != 0)
                                {
                                  [v13 setSampledAudioFileStored:v6];
                                }

                                else
                                {
                                  uint64_t v29 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStorageFailed);
                                  if ((objc_opt_isKindOfClass(v6, v29) & 1) != 0)
                                  {
                                    [v13 setSampledAudioFileStorageFailed:v6];
                                  }

                                  else
                                  {
                                    uint64_t v30 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineCompilationContext);
                                    if ((objc_opt_isKindOfClass(v6, v30) & 1) != 0)
                                    {
                                      [v13 setAppleNeuralEngineCompilationContext:v6];
                                    }

                                    else
                                    {
                                      uint64_t v31 = objc_opt_class(&OBJC_CLASS___ASRSchemaASREmbeddedSpeechProcessContext);
                                      if ((objc_opt_isKindOfClass(v6, v31) & 1) != 0)
                                      {
                                        [v13 setEmbeddedSpeechProcessContext:v6];
                                      }

                                      else
                                      {
                                        uint64_t v32 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateContext);
                                        if ((objc_opt_isKindOfClass(v6, v32) & 1) != 0)
                                        {
                                          [v13 setActiveConfigUpdateContext:v6];
                                        }

                                        else
                                        {
                                          uint64_t v33 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
                                          if ((objc_opt_isKindOfClass(v6, v33) & 1) != 0)
                                          {
                                            [v13 setAppleNeuralEngineModelInitializationContext:v6];
                                          }

                                          else
                                          {
                                            uint64_t v34 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketArrivalContext);
                                            if ((objc_opt_isKindOfClass(v6, v34) & 1) != 0)
                                            {
                                              [v13 setAudioSpeechPacketArrivalContext:v6];
                                            }

                                            else
                                            {
                                              uint64_t v35 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived);
                                              if ((objc_opt_isKindOfClass(v6, v35) & 1) != 0)
                                              {
                                                [v13 setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:v6];
                                              }

                                              else
                                              {
                                                uint64_t v36 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFrameProcessingReady);
                                                if ((objc_opt_isKindOfClass(v6, v36) & 1) != 0)
                                                {
                                                  [v13 setFrameProcessingReady:v6];
                                                }

                                                else
                                                {
                                                  uint64_t v37 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRLeadingSilenceProcessed);
                                                  if ((objc_opt_isKindOfClass(v6, v37) & 1) != 0)
                                                  {
                                                    [v13 setLeadingSilenceProcessed:v6];
                                                  }

                                                  else
                                                  {
                                                    uint64_t v38 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed);
                                                    if ((objc_opt_isKindOfClass(v6, v38) & 1) != 0)
                                                    {
                                                      [v13 setFirstSecondAfterLeadingSilenceProcessed:v6];
                                                    }

                                                    else
                                                    {
                                                      uint64_t v39 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded);
                                                      if ((objc_opt_isKindOfClass(v6, v39) & 1) != 0)
                                                      {
                                                        [v13 setFirstAudioPacketRecorded:v6];
                                                      }

                                                      else
                                                      {
                                                        uint64_t v40 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream);
                                                        if ((objc_opt_isKindOfClass(v6, v40) & 1) != 0)
                                                        {
                                                          [v13 setAudioPacketContainingEndOfFirstWordReadyUpstream:v6];
                                                        }

                                                        else
                                                        {
                                                          uint64_t v41 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketReadyUpstream);
                                                          if ((objc_opt_isKindOfClass(v6, v41) & 1) != 0)
                                                          {
                                                            [v13 setFirstAudioPacketReadyUpstream:v6];
                                                          }

                                                          else
                                                          {
                                                            uint64_t v42 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream);
                                                            if ((objc_opt_isKindOfClass(v6, v42) & 1) == 0)
                                                            {
                                                              __int16 v50 = (os_log_s *)AFSiriLogContextSpeech;
                                                              if (os_log_type_enabled( AFSiriLogContextSpeech,  OS_LOG_TYPE_ERROR))
                                                              {
                                                                int v51 = 136315138;
                                                                uint64_t v52 = "-[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]";
                                                                _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable me ssage type in the ASR SELF schema.",  (uint8_t *)&v51,  0xCu);
                                                              }

                                                              goto LABEL_70;
                                                            }

                                                            [v13 setFinalAudioPacketContainingSpeechReadyUpstream:v6];
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    double v43 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      id v46 = v43;
      __int16 v47 = (objc_class *)objc_opt_class(v6);
      __int16 v48 = NSStringFromClass(v47);
      id v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      int v51 = 136315394;
      uint64_t v52 = "-[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]";
      __int16 v53 = 2112;
      v54 = v49;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "%s SELF: Wrapping and logging an event of type %@",  (uint8_t *)&v51,  0x16u);
    }

    id v44 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    __int128 v45 = v44;
    if (v7) {
      objc_msgSend(v44, "emitMessage:timestamp:", v13, objc_msgSend(v7, "unsignedLongLongValue"));
    }
    else {
      [v44 emitMessage:v13];
    }

LABEL_70:
  }
}

- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___AIMLExperimentationAnalyticsManager);
    if (([v4 containsObject:@"PeopleSuggesterTop20"] & 1) != 0
      || [v4 containsObject:@"NoBoosting"])
    {
      id v6 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"043fda7b-2fc0-489e-8cce-319c22dcf3ba");
      [v5 emitTriggerForCodePathID:v6 requestID:self->_requestId completionHandler:&stru_1000409B8];

      id v7 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 136315394;
        id v11 = "-[ESSelfHelper logPersonalizationExperimentTriggersForExperimentIds:]";
        __int16 v12 = 2112;
        id v13 = @"043fda7b-2fc0-489e-8cce-319c22dcf3ba";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s SELF: Emitting trigger log for Contact Boosting (codePathId=%@)",  (uint8_t *)&v10,  0x16u);
      }
    }

    if (([v4 containsObject:@"RandomSongTitleSelection"] & 1) != 0
      || [v4 containsObject:@"PlayCountSongTitleSelection"])
    {
      unsigned __int8 v8 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"eb18055e-87c4-44c2-ab94-9275bec61c52");
      [v5 emitTriggerForCodePathID:v8 requestID:self->_requestId completionHandler:&stru_1000409B8];

      id v9 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 136315394;
        id v11 = "-[ESSelfHelper logPersonalizationExperimentTriggersForExperimentIds:]";
        __int16 v12 = 2112;
        id v13 = @"eb18055e-87c4-44c2-ab94-9275bec61c52";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s SELF: Emitting trigger log for Music Ranking Strategy (codePathId=%@)",  (uint8_t *)&v10,  0x16u);
      }
    }
  }
}

- (NSUUID)asrId
{
  return self->_asrId;
}

- (NSUUID)requestId
{
  return self->_requestId;
}

- (NSString)recognitionTask
{
  return self->_recognitionTask;
}

- (NSString)unrepairedPostItn
{
  return self->_unrepairedPostItn;
}

- (void)setUnrepairedPostItn:(id)a3
{
}

- (NSNumber)personalizedLmWeight
{
  return self->_personalizedLmWeight;
}

- (void)setPersonalizedLmWeight:(id)a3
{
}

- (NSNumber)personalizedLmAgeInSec
{
  return self->_personalizedLmAgeInSec;
}

- (void)setPersonalizedLmAgeInSec:(id)a3
{
}

- (BOOL)continuousListeningEnabled
{
  return self->_continuousListeningEnabled;
}

- (void)setContinuousListeningEnabled:(BOOL)a3
{
  self->_continuousListeningEnabled = a3;
}

- (void).cxx_destruct
{
}

+ (void)_logRequestLinkWithRequestId:(id)a3 asrId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLinkInfo);
  id v8 = [[SISchemaUUID alloc] initWithNSUUID:v6];
  [v7 setUuid:v8];

  [v7 setComponent:8];
  id v9 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLinkInfo);
  id v10 = [[SISchemaUUID alloc] initWithNSUUID:v5];
  [v9 setUuid:v10];

  [v9 setComponent:1];
  id v11 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLink);
  [v11 setSource:v7];
  [v11 setTarget:v9];
  __int16 v12 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    uint64_t v15 = "+[ESSelfHelper _logRequestLinkWithRequestId:asrId:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s SELF: Emitting request link message with asrId=%@ and requestID=%@",  (uint8_t *)&v14,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v13 emitMessage:v11];
}

+ (id)createPreheatStartedOrChangedEvent
{
  id v2 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPreheatStarted);
  [v2 setExists:1];
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPreheatContext);
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[ASRSchemaASRPreheatContext setTimestampInTicks:](v3, "setTimestampInTicks:", v5);
  -[ASRSchemaASRPreheatContext setStartedOrChanged:](v3, "setStartedOrChanged:", v2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v7 = objc_alloc(&OBJC_CLASS___ESSelfPreheatWithPowerContainer);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrPreheatStartedOrChangedEventContext context]( &OBJC_CLASS___SPIAsrPreheatStartedOrChangedEventContext,  "context"));
  id v9 = -[ESSelfPreheatWithPowerContainer initWithPreheatContext:powerSnapshot:powerEventContext:]( v7,  "initWithPreheatContext:powerSnapshot:powerEventContext:",  v3,  v6,  v8);

  return v9;
}

+ (id)createPreheatFailedEvent
{
  id v2 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPreheatFailed);
  [v2 setExists:1];
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPreheatContext);
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[ASRSchemaASRPreheatContext setTimestampInTicks:](v3, "setTimestampInTicks:", v5);
  -[ASRSchemaASRPreheatContext setFailed:](v3, "setFailed:", v2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v7 = objc_alloc(&OBJC_CLASS___ESSelfPreheatWithPowerContainer);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SPIAsrPreheatFailedEventContext context](&OBJC_CLASS___SPIAsrPreheatFailedEventContext, "context"));
  id v9 = -[ESSelfPreheatWithPowerContainer initWithPreheatContext:powerSnapshot:powerEventContext:]( v7,  "initWithPreheatContext:powerSnapshot:powerEventContext:",  v3,  v6,  v8);

  return v9;
}

+ (id)createPreheatEndedEventWithPreheatAlreadyDone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPreheatEnded);
  id v5 = v4;
  if (v3) {
    uint64_t v6 = 2LL;
  }
  else {
    uint64_t v6 = 1LL;
  }
  if (v3) {
    id v7 = (id *)&OBJC_CLASS___SPIAsrPreheatEndedAlreadyDoneEventContext_ptr;
  }
  else {
    id v7 = (id *)&OBJC_CLASS___SPIAsrPreheatEndedSuccessEventContext_ptr;
  }
  [v4 setStatus:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*v7 context]);
  id v9 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPreheatContext);
  id v10 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[ASRSchemaASRPreheatContext setTimestampInTicks:](v9, "setTimestampInTicks:", v11);
  -[ASRSchemaASRPreheatContext setEnded:](v9, "setEnded:", v5);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v13 = -[ESSelfPreheatWithPowerContainer initWithPreheatContext:powerSnapshot:powerEventContext:]( objc_alloc(&OBJC_CLASS___ESSelfPreheatWithPowerContainer),  "initWithPreheatContext:powerSnapshot:powerEventContext:",  v9,  v12,  v8);

  return v13;
}

+ (id)createANEModelInitializationStartedEventWithTimeStamp:(id)a3 fileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationStarted);
  [v7 setExists:1];
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setFileName:](v8, "setFileName:", v5);

  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setTimestampInTicks:](v8, "setTimestampInTicks:", v6);
  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setStartedOrChanged:](v8, "setStartedOrChanged:", v7);

  return v8;
}

+ (id)createANEModelInitializationEndedEventWithTimeStamp:(id)a3 fileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationEnded);
  [v7 setExists:1];
  id v8 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setTimestampInTicks:](v8, "setTimestampInTicks:", v6);

  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setFileName:](v8, "setFileName:", v5);
  -[ASRSchemaASRAppleNeuralEngineModelInitializationContext setEnded:](v8, "setEnded:", v7);

  return v8;
}

+ (void)initializeSharedPowerLoggerIfNeeded
{
  if (!qword_100049530)
  {
    id v2 = [[SPIPowerLogger alloc] initWithCurrentProcess];
    BOOL v3 = (void *)qword_100049530;
    qword_100049530 = (uint64_t)v2;
  }

+ (void)logPowerSnapshotForProcessStarted
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SPIProcessStartedEventContext context](&OBJC_CLASS___SPIProcessStartedEventContext, "context"));
  [v3 logWithEventContext:v2];
}

+ (void)logPowerSnapshotForProcessEnded
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SPIProcessEndedEventContext context](&OBJC_CLASS___SPIProcessEndedEventContext, "context"));
  [v3 logWithEventContext:v2];
}

@end