@interface ESProfiler
+ (id)sharedProfiler;
- (CESRSignpostHelper)signpostHelper;
- (ESProfiler)initWithESSelfHelper:(id)a3 signpostHelper:(id)a4;
- (ESSelfHelper)selfHelper;
- (id)powerLogEventDictionaryWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5 applicationName:(id)a6;
- (id)timestampInTicksForAudioProcessed:(double)a3;
- (void)logActiveConfigUpdateEndedWithTimeInTicks:(id)a3;
- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAotLmeEndedWithTimeInTicks:(id)a3;
- (void)logAotLmeStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAppleNeuralEngineModelInitializationEndedWithTimeInTicks:(id)a3 fileName:(id)a4;
- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3 fileName:(id)a4;
- (void)logAssetsCompilationEventsWithPowerLogEvent:(id)a3;
- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3;
- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logESStartWithTimeInTicks:(id)a3;
- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalResultGeneratedWithEARPackage:(id)a3 firstSeenPartialResultTokens:(id)a4 partialResultOffset:(unint64_t)a5 timeInTicks:(id)a6;
- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logFirstAudioPacketProcessedWithTimeInTicks:(id)a3;
- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3;
- (void)logFrameProcessingReadyWithTimeInTicks:(id)a3;
- (void)logInitializationEndedWithTimeInTicks:(id)a3 isSpeechRecognizerCreated:(BOOL)a4;
- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3 cachedRecognizerExisted:(BOOL)a4 newRecognizerCreated:(BOOL)a5;
- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4;
- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4;
- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3 timeInTicks:(id)a4;
- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4 timeInTicks:(id)a5;
- (void)logPartialResultGenerated:(id)a3 ofSize:(id)a4 timeInTicks:(id)a5;
- (void)logPauseRecognitionWithTimeInTicks:(id)a3;
- (void)logPendingANEModelInitializationContextEvents:(id)a3;
- (void)logPendingPreheatContextEvents:(id)a3;
- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3;
- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logPreheatOnlyEventsWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5;
- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 allItnRunIntervals:(id)a22 allSecondaryPassIntervals:(id)a23 powerLogEvent:(id)a24 aneUsed:(id)a25 language:(id)a26 modelVersion:(id)a27 applicationName:(id)a28;
- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12 applicationName:(id)a13 powerLogEvent:(id)a14;
- (void)logResumeRecognitionWithTimeInTicks:(id)a3;
- (void)logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:(id)a3 language:(id)a4;
- (void)logTotalAudioProcessedOfDuration:(double)a3 timeInTicks:(id)a4;
- (void)setESSelfHelper:(id)a3;
@end

@implementation ESProfiler

- (ESProfiler)initWithESSelfHelper:(id)a3 signpostHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ESProfiler;
  v9 = -[ESProfiler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_selfHelper, a3);
    objc_storeStrong((id *)&v10->_signpostHelper, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    audioDurationProcessingTimestampInTicks = v10->_audioDurationProcessingTimestampInTicks;
    v10->_audioDurationProcessingTimestampInTicks = v11;
  }

  return v10;
}

- (void)setESSelfHelper:(id)a3
{
  id v5 = a3;
  -[NSMutableArray removeAllObjects](self->_audioDurationProcessingTimestampInTicks, "removeAllObjects");
}

- (id)timestampInTicksForAudioProcessed:(double)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013C00;
  block[3] = &unk_100040BF8;
  block[4] = self;
  if (qword_100049560 != -1) {
    dispatch_once(&qword_100049560, block);
  }
  unint64_t v5 = vcvtad_u64_f64(a3 / *(double *)&qword_100049568);
  if ((unint64_t)-[NSMutableArray count](self->_audioDurationProcessingTimestampInTicks, "count") <= v5)
  {
LABEL_6:
    id v7 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( self->_audioDurationProcessingTimestampInTicks,  "objectAtIndex:",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:1]);
  }

  return v7;
}

- (id)powerLogEventDictionaryWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5 applicationName:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (__CFString *)a3;
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  objc_super v14 = v13;
  if (v12) {
    v15 = v12;
  }
  else {
    v15 = @"undefined ASR event";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, CESRPowerLogEventString);

  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v9, @"Language");
  }
  if (v10) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v10, @"ModelVersion");
  }
  if (v11) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v11,  @"ApplicationName");
  }

  return v14;
}

- (void)logPreheatOnlyEventsWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[ESProfiler powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:]( self,  "powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:",  a3,  a4,  a5,  0LL));
  +[CESRUtilities logToPowerLogForEventCategory:eventDictionary:]( &OBJC_CLASS___CESRUtilities,  "logToPowerLogForEventCategory:eventDictionary:",  @"ESConnection",  v5);
}

- (void)logPendingPreheatContextEvents:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logPendingPreheatContextEvents:](self->_selfHelper, "logPendingPreheatContextEvents:", v4);
  if (self->_signpostHelper)
  {
    if ([v4 count] == (id)2)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preheatContext]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 startedOrChanged]);
      unsigned int v8 = [v7 exists];

      if (!v8)
      {
LABEL_24:

        goto LABEL_25;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 timestampInTicks]);
      id v10 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v9 unsignedLongLongValue]);

      os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextSpeech);
      v12 = (os_log_s *)AFSiriLogContextSpeech;
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        int v28 = 134349056;
        v29 = v10;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "ondevice_preheat_time",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v28,  0xCu);
      }

      -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v11,  @"ondevice_preheat_time");
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 preheatContext]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 ended]);
      if (v16)
      {
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v15 failed]);

        if (!v18)
        {
LABEL_23:

          goto LABEL_24;
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v15 ended]);

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v15 ended]);
        else {
          v21 = @"AlreadyLoaded";
        }
      }

      else
      {
        v21 = @"Failed";
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v15 timestampInTicks]);
      v23 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v22 unsignedLongLongValue]);

      v24 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ondevice_preheat_time");
      v25 = (os_log_s *)AFSiriLogContextSpeech;
      v26 = v25;
      if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        id v27 = -[__CFString UTF8String](v21, "UTF8String");
        int v28 = 134349314;
        v29 = v23;
        __int16 v30 = 2080;
        id v31 = v27;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v24,  "ondevice_preheat_time",  "%{public, signpost.description:end_time}llu Status=%s",  (uint8_t *)&v28,  0x16u);
      }

      goto LABEL_23;
    }

    if ([v4 count])
    {
      v17 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        id v5 = v17;
        int v28 = 136315394;
        v29 = "-[ESProfiler logPendingPreheatContextEvents:]";
        __int16 v30 = 2048;
        id v31 = [v4 count];
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "%s Unexpected pending preheat event count %lu",  (uint8_t *)&v28,  0x16u);
LABEL_25:
      }
    }
  }
}

- (void)logAssetsCompilationEventsWithPowerLogEvent:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[ESProfiler powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:]( self,  "powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:",  a3,  0LL,  0LL,  0LL));
  +[CESRUtilities logToPowerLogForEventCategory:eventDictionary:]( &OBJC_CLASS___CESRUtilities,  "logToPowerLogForEventCategory:eventDictionary:",  @"ESConnection",  v3);
}

- (void)logPendingANEModelInitializationContextEvents:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logPendingANEModelInitializationContextEvents:]( self->_selfHelper,  "logPendingANEModelInitializationContextEvents:",  v4);
  if (self->_signpostHelper)
  {
    if ([v4 count] == (id)2)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 startedOrChanged]);
      unsigned int v7 = [v6 exists];

      if (v7)
      {
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 timestampInTicks]);
        id v9 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v8 unsignedLongLongValue]);

        os_signpost_id_t v10 = os_signpost_id_generate(AFSiriLogContextSpeech);
        os_signpost_id_t v11 = (os_log_s *)AFSiriLogContextSpeech;
        v12 = v11;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          id v13 = objc_claimAutoreleasedReturnValue([v5 fileName]);
          int v25 = 134349314;
          v26 = v9;
          __int16 v27 = 2080;
          id v28 = [v13 UTF8String];
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "ES: ANE Model Init",  "%{public, signpost.description:begin_time}llu FileName=%s",  (uint8_t *)&v25,  0x16u);
        }

        -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v10,  @"ES: ANE Model Init");
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 ended]);
        unsigned int v16 = [v15 exists];

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 timestampInTicks]);
          v18 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v17 unsignedLongLongValue]);

          v19 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ES: ANE Model Init");
          v20 = (os_log_s *)AFSiriLogContextSpeech;
          v21 = v20;
          if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            id v22 = objc_claimAutoreleasedReturnValue([v14 fileName]);
            id v23 = [v22 UTF8String];
            int v25 = 134349314;
            v26 = v18;
            __int16 v27 = 2080;
            id v28 = v23;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v19,  "ES: ANE Model Init",  "%{public, signpost.description:end_time}llu FileName=%s",  (uint8_t *)&v25,  0x16u);
          }
        }
      }

      goto LABEL_16;
    }

    if ([v4 count])
    {
      v24 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        id v5 = v24;
        int v25 = 136315394;
        v26 = "-[ESProfiler logPendingANEModelInitializationContextEvents:]";
        __int16 v27 = 2048;
        id v28 = [v4 count];
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "%s Unexpected pending ane model initialization event count %lu",  (uint8_t *)&v25,  0x16u);
LABEL_16:
      }
    }
  }
}

- (void)logESStartWithTimeInTicks:(id)a3
{
}

- (void)logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:(id)a3 language:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[ESProfiler powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:]( self,  "powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:",  a3,  a4,  0LL,  0LL));
  +[CESRUtilities logToPowerLogForEventCategory:eventDictionary:]( &OBJC_CLASS___CESRUtilities,  "logToPowerLogForEventCategory:eventDictionary:",  @"ESConnection",  v4);
}

- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3 cachedRecognizerExisted:(BOOL)a4 newRecognizerCreated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  -[ESSelfHelper logInitializationStartedOrChangedWithTimeInTicks:]( self->_selfHelper,  "logInitializationStartedOrChangedWithTimeInTicks:",  v8);
  if (self->_signpostHelper)
  {
    id v9 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v8 unsignedLongLongValue]);
    os_signpost_id_t v10 = os_signpost_id_generate(AFSiriLogContextSpeech);
    os_signpost_id_t v11 = (os_log_s *)AFSiriLogContextSpeech;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      int v14 = 134349568;
      id v15 = v9;
      __int16 v16 = 1024;
      BOOL v17 = v6;
      __int16 v18 = 1024;
      BOOL v19 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "ES: Engine Init",  "%{public, signpost.description:begin_time}llu cachedRecognizerExisted = %u, newRecognizerCreated = %u",  (uint8_t *)&v14,  0x18u);
    }

    -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v10,  @"ES: Engine Init");
  }

  pid_t v13 = getpid();
  proc_pid_rusage(v13, 6, (rusage_info_t *)&self->usage_start);
}

- (void)logInitializationEndedWithTimeInTicks:(id)a3 isSpeechRecognizerCreated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[ESSelfHelper logInitializationEndedIsSpeechRecognizerCreated:]( self->_selfHelper,  "logInitializationEndedIsSpeechRecognizerCreated:",  v4);
  if (self->_signpostHelper)
  {
    id v7 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v6 unsignedLongLongValue]);
    id v8 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ES: Engine Init");
    id v9 = (os_log_s *)AFSiriLogContextSpeech;
    os_signpost_id_t v10 = v9;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v11 = 134349056;
      id v12 = v7;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v8,  "ES: Engine Init",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[ESSelfHelper logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:]( self->_selfHelper,  "logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:",  v6);
  if (self->_signpostHelper)
  {
    id v8 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v6 unsignedLongLongValue]);
    os_signpost_id_t v9 = os_signpost_id_generate(AFSiriLogContextSpeech);
    os_signpost_id_t v10 = (os_log_s *)AFSiriLogContextSpeech;
    int v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      int v12 = 134349314;
      id v13 = v8;
      __int16 v14 = 2080;
      id v15 = [v7 UTF8String];
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "ES: ANE Model Init",  "%{public, signpost.description:begin_time}llu FileName=%s",  (uint8_t *)&v12,  0x16u);
    }

    -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v9,  @"ES: ANE Model Init");
  }
}

- (void)logAppleNeuralEngineModelInitializationEndedWithTimeInTicks:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[ESSelfHelper logAppleNeuralEngineModelInitializationEnded]( self->_selfHelper,  "logAppleNeuralEngineModelInitializationEnded");
  if (self->_signpostHelper)
  {
    id v8 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v6 unsignedLongLongValue]);
    os_signpost_id_t v9 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ES: ANE Model Init");
    os_signpost_id_t v10 = (os_log_s *)AFSiriLogContextSpeech;
    int v11 = v10;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      int v12 = 134349314;
      id v13 = v8;
      __int16 v14 = 2080;
      id v15 = [v7 UTF8String];
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v9,  "ES: ANE Model Init",  "%{public, signpost.description:end_time}llu FileName=%s",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logActiveConfigUpdateStartedOrChangedWithTimeInTicks:]( self->_selfHelper,  "logActiveConfigUpdateStartedOrChangedWithTimeInTicks:",  v4);
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    id v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "ES: Update Active Config",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v9,  0xCu);
    }

    -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v6,  @"ES: Update Active Config");
  }
}

- (void)logActiveConfigUpdateEndedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logActiveConfigUpdateEnded](self->_selfHelper, "logActiveConfigUpdateEnded");
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ES: Update Active Config");
    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    id v8 = v7;
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v6,  "ES: Update Active Config",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logJitLmeStartedOrChangedWithTimeInTicks:]( self->_selfHelper,  "logJitLmeStartedOrChangedWithTimeInTicks:",  v4);
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    id v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "ES: JIT Profile Build Load",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v9,  0xCu);
    }

    -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v6,  @"ES: JIT Profile Build Load");
  }
}

- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3 timeInTicks:(id)a4
{
  id v6 = a4;
  -[ESSelfHelper logJitLmeEndedAndEndedTier1WithDialogContext:]( self->_selfHelper,  "logJitLmeEndedAndEndedTier1WithDialogContext:",  a3);
  if (self->_signpostHelper)
  {
    id v7 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v6 unsignedLongLongValue]);
    id v8 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ES: JIT Profile Build Load");
    int v9 = (os_log_s *)AFSiriLogContextSpeech;
    id v10 = v9;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v11 = 134349056;
      id v12 = v7;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v8,  "ES: JIT Profile Build Load",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)logAotLmeStartedOrChangedWithTimeInTicks:(id)a3
{
  if (self->_signpostHelper)
  {
    id v4 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [a3 unsignedLongLongValue]);
    os_signpost_id_t v5 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v6 = (os_log_s *)AFSiriLogContextSpeech;
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v8 = 134349056;
      id v9 = v4;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "ES: AOT Profile Load",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v8,  0xCu);
    }

    -[CESRSignpostHelper storeSignpostId:forEventName:]( self->_signpostHelper,  "storeSignpostId:forEventName:",  v5,  @"ES: AOT Profile Load");
  }

- (void)logAotLmeEndedWithTimeInTicks:(id)a3
{
  if (self->_signpostHelper)
  {
    id v4 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [a3 unsignedLongLongValue]);
    os_signpost_id_t v5 = (char *)-[CESRSignpostHelper fetchAndDestroySignpostIdForEventName:]( self->_signpostHelper,  "fetchAndDestroySignpostIdForEventName:",  @"ES: AOT Profile Load");
    id v6 = (os_log_s *)AFSiriLogContextSpeech;
    id v7 = v6;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v8 = 134349056;
      id v9 = v4;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v5,  "ES: AOT Profile Load",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logAudioPacketArrivalStartedOrChangedWithTimeInTicks:]( self->_selfHelper,  "logAudioPacketArrivalStartedOrChangedWithTimeInTicks:",  v4);
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    int v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  v6,  "ES: First Audio Packet",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logAudioPacketArrivalEndedWithTimeInTicks:]( self->_selfHelper,  "logAudioPacketArrivalEndedWithTimeInTicks:",  v4);
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    int v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  v6,  "ES: Last Audio Packet",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3
{
}

- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3
{
}

- (void)logFirstAudioPacketProcessedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  -[ESSelfHelper logFirstAudioPacketProcessed](self->_selfHelper, "logFirstAudioPacketProcessed");
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = (os_log_s *)AFSiriLogContextSpeech;
    int v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  v6,  "ES: First Audio Packet Process",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3
{
}

- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
}

- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
  id v8 = a3;
  -[ESSelfHelper logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:loggableSharedUserId:earPackage:]( self->_selfHelper,  "logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:loggableSharedUserId:earPackage:",  v8,  a4,  a5);
  if (self->_signpostHelper)
  {
    id v9 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v8 unsignedLongLongValue]);
    os_signpost_id_t v10 = os_signpost_id_generate(AFSiriLogContextSpeech);
    int v11 = (os_log_s *)AFSiriLogContextSpeech;
    id v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      int v13 = 134349056;
      id v14 = v9;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  v10,  "ES: Last Speech Audio Packet",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)logFrameProcessingReadyWithTimeInTicks:(id)a3
{
  if (self->_signpostHelper)
  {
    id v4 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [a3 unsignedLongLongValue]);
    os_signpost_id_t v5 = os_signpost_id_generate(AFSiriLogContextSpeech);
    os_signpost_id_t v6 = (os_log_s *)AFSiriLogContextSpeech;
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v8 = 134349056;
      id v9 = v4;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  v5,  "ES: Frame Processing Ready",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v8,  0xCu);
    }
  }

  -[ESSelfHelper logFrameProcessingReady](self->_selfHelper, "logFrameProcessingReady", a3);
}

- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12 applicationName:(id)a13 powerLogEvent:(id)a14
{
  id v21 = a12;
  id v22 = a11;
  id v23 = a10;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a5;
  id v28 = a4;
  id v31 = a3;
  v29 = (void *)objc_claimAutoreleasedReturnValue( -[ESProfiler powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:]( self,  "powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:",  a14,  v28,  v27,  a13));
  +[CESRUtilities logToPowerLogForEventCategory:eventDictionary:]( &OBJC_CLASS___CESRUtilities,  "logToPowerLogForEventCategory:eventDictionary:",  @"ESConnection",  v29);

  LOBYTE(v30) = a9;
  -[ESSelfHelper logRequestStartedOrChangedWithTask:modelLocale:modelVersion:isHighQualityAsset:hammerVersion:geoLanguageModelRegion:geoLanguageModelLoaded:speechProfileAgeInSec:dictationUIInteractionId:portraitExperimentVariantName:]( self->_selfHelper,  "logRequestStartedOrChangedWithTask:modelLocale:modelVersion:isHighQualityAsset:hammerVersion:geoLanguageModelRegion: geoLanguageModelLoaded:speechProfileAgeInSec:dictationUIInteractionId:portraitExperimentVariantName:",  v31,  v28,  v27,  v26,  v25,  v24,  v30,  v23,  v22,  v21);
}

- (void)logPartialResultGenerated:(id)a3 ofSize:(id)a4 timeInTicks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[ESSelfHelper logPartialResultGenerated](self->_selfHelper, "logPartialResultGenerated");
  if (self->_signpostHelper)
  {
    id v11 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v10 unsignedLongLongValue]);
    os_signpost_id_t v12 = os_signpost_id_generate(AFSiriLogContextSpeech);
    int v13 = (os_log_s *)AFSiriLogContextSpeech;
    id v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v15 = 134349570;
      id v16 = v11;
      __int16 v17 = 2080;
      id v18 = [v8 UTF8String];
      __int16 v19 = 1024;
      unsigned int v20 = [v9 unsignedIntValue];
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  v12,  "ES: Partial Recognition",  "%{public, signpost.description:event_time}lluWords=%s, WordCount=%u",  (uint8_t *)&v15,  0x1Cu);
    }
  }
}

- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4
{
}

- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4 timeInTicks:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  -[ESSelfHelper logPackageGeneratedAndRecognitionResultTier1WithEARPackage:loggableSharedUserId:]( self->_selfHelper,  "logPackageGeneratedAndRecognitionResultTier1WithEARPackage:loggableSharedUserId:",  v8,  a4);
  if (self->_signpostHelper)
  {
    id v10 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v9 unsignedLongLongValue]);
    uint64_t v11 = earPackageResultCandidateId(v8);
    os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    os_signpost_id_t v13 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v14 = (os_log_s *)AFSiriLogContextSpeech;
    int v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 recognition]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v23 oneBest]);
      id v16 = objc_claimAutoreleasedReturnValue( +[CESRUtilities earTokensToString:]( &OBJC_CLASS___CESRUtilities, "earTokensToString:"));
      id v17 = [v16 UTF8String];
      unsigned int v18 = [v8 isFinal];
      unsigned int v19 = [v8 firstResultAfterResume];
      unsigned __int8 v20 = [v8 isFinal];
      uint64_t v21 = -1LL;
      if ((v20 & 1) == 0 && v12) {
        uint64_t v21 = (uint64_t)[v12 unsignedLongValue];
      }
      *(_DWORD *)buf = 134350082;
      id v25 = v10;
      __int16 v26 = 2080;
      id v27 = v17;
      __int16 v28 = 1024;
      unsigned int v29 = v18;
      __int16 v30 = 1024;
      unsigned int v31 = v19;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  v13,  "ES: Package Recognition",  "%{public, signpost.description:event_time}lluOneBest=%s, isFinal=%u, isAfterResume=%u, rcId=%ld",  buf,  0x2Cu);
    }
  }
}

- (void)logFinalResultGeneratedWithEARPackage:(id)a3 firstSeenPartialResultTokens:(id)a4 partialResultOffset:(unint64_t)a5 timeInTicks:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v58 = a6;
  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 recognition]);
  os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 oneBest]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  [v14 start];
  double v16 = v15;

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ESProfiler timestampInTicksForAudioProcessed:](self, "timestampInTicksForAudioProcessed:", 0.0));
  uint64_t v59 = objc_claimAutoreleasedReturnValue(-[ESProfiler timestampInTicksForAudioProcessed:](self, "timestampInTicksForAudioProcessed:", v16));
  v61 = (void *)objc_claimAutoreleasedReturnValue( -[ESProfiler timestampInTicksForAudioProcessed:]( self,  "timestampInTicksForAudioProcessed:",  v16 + 1.0));
  v57 = v10;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 preITNRecognition]);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 oneBest]);
  v56 = v11;
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities alignedPartialResultIndicesForTokens:firstSeenPartialResultTokens:]( &OBJC_CLASS___CESRUtilities,  "alignedPartialResultIndicesForTokens:firstSeenPartialResultTokens:",  v18,  v11));

  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v21 = v19;
  id v22 = [v21 countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v63 != v24) {
          objc_enumerationMutation(v21);
        }
        __int16 v26 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        if ([v26 isEqualToNumber:&off_100043038])
        {
          [v20 addObject:v26];
        }

        else
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v26 unsignedIntegerValue] + a5));
          [v20 addObject:v27];
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v62 objects:v76 count:16];
    }

    while (v23);
  }

  -[ESSelfHelper logFinalResultGeneratedWithEARPackage:correctAlignedPartialResultIndexList:]( self->_selfHelper,  "logFinalResultGeneratedWithEARPackage:correctAlignedPartialResultIndexList:",  v10,  v20);
  __int16 v28 = (void *)v59;
  if (v59) {
    -[ESSelfHelper logLeadingSilenceProcessedWithTimestampInTicks:]( self->_selfHelper,  "logLeadingSilenceProcessedWithTimestampInTicks:",  v59);
  }
  unsigned int v29 = v58;
  __int16 v30 = v61;
  if (v61) {
    -[ESSelfHelper logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:]( self->_selfHelper,  "logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:",  v61);
  }
  if (self->_signpostHelper)
  {
    id v31 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v58 unsignedLongLongValue]);
    uint64_t v32 = earPackageResultCandidateId(v57);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    os_signpost_id_t v34 = os_signpost_id_generate(AFSiriLogContextSpeech);
    v35 = (os_log_s *)AFSiriLogContextSpeech;
    v36 = v35;
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue([v57 recognition]);
      v54 = (void *)objc_claimAutoreleasedReturnValue([v55 oneBest]);
      id v53 = objc_claimAutoreleasedReturnValue( +[CESRUtilities earTokensToString:]( &OBJC_CLASS___CESRUtilities, "earTokensToString:"));
      id v52 = [v53 UTF8String];
      unsigned int v51 = [v57 isFinal];
      unsigned int v37 = [v57 firstResultAfterResume];
      unsigned __int8 v38 = [v57 isFinal];
      uint64_t v39 = -1LL;
      if ((v38 & 1) == 0 && v33) {
        uint64_t v39 = (uint64_t)[v33 unsignedLongValue];
      }
      *(_DWORD *)buf = 134350082;
      id v67 = v31;
      __int16 v68 = 2080;
      id v69 = v52;
      __int16 v70 = 1024;
      unsigned int v71 = v51;
      __int16 v72 = 1024;
      unsigned int v73 = v37;
      __int16 v74 = 2048;
      uint64_t v75 = v39;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_EVENT,  v34,  "ES: Final Recognition",  "%{public, signpost.description:event_time}llu OneBest=%s, isFinal=%u, isAfterResume=%u, rcId=%ld",  buf,  0x2Cu);
    }

    __int16 v28 = (void *)v59;
    __int16 v30 = v61;
  }

  if (v28)
  {
    id v40 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v60 unsignedLongLongValue]);
    id v41 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v28 unsignedLongLongValue]);
    os_signpost_id_t v42 = os_signpost_id_generate(AFSiriLogContextSpeech);
    v43 = (os_log_s *)AFSiriLogContextSpeech;
    v44 = v43;
    if (v42 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v45 = (os_log_s *)AFSiriLogContextSpeech;
    }

    else
    {
      if (os_signpost_enabled(v43))
      {
        *(_DWORD *)buf = 134349056;
        id v67 = v40;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_BEGIN,  v42,  "ES: Leading Silence Process",  "%{public, signpost.description:begin_time}llu",  buf,  0xCu);
      }

      v45 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_signpost_enabled(v45))
      {
        *(_DWORD *)buf = 134349056;
        id v67 = v41;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v45,  OS_SIGNPOST_INTERVAL_END,  v42,  "ES: Leading Silence Process",  "%{public, signpost.description:end_time}llu",  buf,  0xCu);
      }
    }

    __int16 v30 = v61;
    if (v61)
    {
      id v46 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [v61 unsignedLongLongValue]);
      os_signpost_id_t v47 = os_signpost_id_generate(AFSiriLogContextSpeech);
      v48 = (os_log_s *)AFSiriLogContextSpeech;
      v49 = v48;
      if (v47 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v50 = (os_log_s *)AFSiriLogContextSpeech;
      }

      else
      {
        if (os_signpost_enabled(v48))
        {
          *(_DWORD *)buf = 134349056;
          id v67 = v41;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_INTERVAL_BEGIN,  v47,  "ES: First Speech Second Process",  "%{public, signpost.description:begin_time}llu",  buf,  0xCu);
        }

        v50 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_signpost_enabled(v50))
        {
          *(_DWORD *)buf = 134349056;
          id v67 = v46;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_INTERVAL_END,  v47,  "ES: First Speech Second Process",  "%{public, signpost.description:end_time}llu",  buf,  0xCu);
        }

        unsigned int v29 = v58;
      }

      __int16 v30 = v61;
    }
  }
}

- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 allItnRunIntervals:(id)a22 allSecondaryPassIntervals:(id)a23 powerLogEvent:(id)a24 aneUsed:(id)a25 language:(id)a26 modelVersion:(id)a27 applicationName:(id)a28
{
  id v65 = a3;
  id v66 = a4;
  id v67 = a5;
  id v68 = a6;
  id v78 = a7;
  id v79 = a8;
  id v80 = a9;
  id v69 = a10;
  id v81 = a13;
  id v70 = a14;
  id v71 = a15;
  id v72 = a16;
  id v73 = a17;
  id v74 = a21;
  id v77 = a22;
  id v76 = a23;
  id v34 = a24;
  id v75 = a25;
  id v35 = a26;
  id v36 = a27;
  id v37 = a28;
  __int128 v62 = v34;
  __int128 v63 = v35;
  __int128 v64 = v36;
  unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue( -[ESProfiler powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:]( self,  "powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:",  v34,  v35,  v36,  v37));
  +[CESRUtilities logToPowerLogForEventCategory:eventDictionary:]( &OBJC_CLASS___CESRUtilities,  "logToPowerLogForEventCategory:eventDictionary:",  @"ESConnection",  v38);

  pid_t v39 = getpid();
  proc_pid_rusage(v39, 6, buffer);
  rusage_info_t v40 = buffer[31];
  uint64_t ri_instructions = self->usage_start.ri_instructions;
  uint64_t v96 = 0LL;
  v97 = (double *)&v96;
  uint64_t v98 = 0x2020000000LL;
  uint64_t v99 = 0LL;
  uint64_t v92 = 0LL;
  v93 = &v92;
  uint64_t v94 = 0x2020000000LL;
  int v95 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_10001381C;
  v91[3] = &unk_100040C20;
  v91[4] = self;
  v91[5] = &v96;
  v91[6] = &v92;
  [v77 enumerateObjectsUsingBlock:v91];
  double v42 = v97[3];
  uint64_t v87 = 0LL;
  v88 = (double *)&v87;
  uint64_t v89 = 0x2020000000LL;
  uint64_t v90 = 0LL;
  uint64_t v83 = 0LL;
  v84 = &v83;
  uint64_t v85 = 0x2020000000LL;
  int v86 = 0;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_100013A08;
  v82[3] = &unk_100040C20;
  v43 = self;
  v82[4] = self;
  v82[5] = &v87;
  v82[6] = &v83;
  [v76 enumerateObjectsUsingBlock:v82];
  double v44 = v88[3];
  selfHelper = self->_selfHelper;
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v42 * 1000000000.0));
  os_signpost_id_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v93 + 6)));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v44 * 1000000000.0));
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v84 + 6)));
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)(((unint64_t)v40 - ri_instructions) / 0xF4240)));
  BYTE2(v61) = a20;
  LOWORD(v61) = __PAIR16__(a19, a18);
  LOWORD(v60) = __PAIR16__(a12, a11);
  -[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]( selfHelper,  "logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInterpolat ionWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled :utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDurati onInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalIT NDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:",  v65,  v66,  v67,  v68,  v78,  v79,  v80,  v69,  v60,  v81,  v70,  v71,  v72,  v73,  v61,  v74,  v46,  v47,  v48,  v49,  v50,  v75);

  if (v43->_signpostHelper)
  {
    os_signpost_id_t v51 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v52 = (os_log_s *)AFSiriLogContextSpeech;
    id v53 = v52;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      uint64_t v54 = mach_continuous_time();
      [v78 floatValue];
      float v56 = v55;
      id v57 = [v80 unsignedLongLongValue];
      id v58 = [v79 unsignedLongLongValue];
      [v81 floatValue];
      *(_DWORD *)buf = 134350080;
      uint64_t v101 = v54;
      __int16 v102 = 2048;
      double v103 = v56;
      __int16 v104 = 2048;
      id v105 = v57;
      __int16 v106 = 2048;
      uint64_t v107 = 1000LL * (void)v58;
      __int16 v108 = 2048;
      double v109 = v59;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v53,  OS_SIGNPOST_EVENT,  v51,  "ES: Engine Complete",  "%{public, signpost.description:event_time}llu SNR = %f, AudioDurationMs = %llu, RecognitionDurationMs = %llu, CPU RTF = %f",  buf,  0x34u);
    }
  }

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);
}

- (void)logTotalAudioProcessedOfDuration:(double)a3 timeInTicks:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v9[0] = v7;
  v9[1] = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  -[NSMutableArray addObject:](self->_audioDurationProcessingTimestampInTicks, "addObject:", v8);
}

- (void)logPauseRecognitionWithTimeInTicks:(id)a3
{
  id v3 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [a3 unsignedLongLongValue]);
  os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextSpeech);
  os_signpost_id_t v5 = (os_log_s *)AFSiriLogContextSpeech;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    id v8 = v3;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  v4,  "ES: Pause Recognition",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)logResumeRecognitionWithTimeInTicks:(id)a3
{
  id v3 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  [a3 unsignedLongLongValue]);
  os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextSpeech);
  os_signpost_id_t v5 = (os_log_s *)AFSiriLogContextSpeech;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    id v8 = v3;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  v4,  "ES: Resume Recognition",  "%{public, signpost.description:event_time}llu",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3
{
}

- (ESSelfHelper)selfHelper
{
  return self->_selfHelper;
}

- (CESRSignpostHelper)signpostHelper
{
  return self->_signpostHelper;
}

- (void).cxx_destruct
{
}

+ (id)sharedProfiler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013D64;
  block[3] = &unk_100040BF8;
  id v9 = objc_alloc_init(&OBJC_CLASS___CESRSignpostHelper);
  uint64_t v2 = qword_100049558;
  id v3 = v9;
  os_signpost_id_t v4 = v3;
  if (v2 == -1)
  {
    os_signpost_id_t v5 = v3;
  }

  else
  {
    dispatch_once(&qword_100049558, block);
    os_signpost_id_t v5 = v9;
  }

  id v6 = (id)qword_100049550;

  return v6;
}

@end