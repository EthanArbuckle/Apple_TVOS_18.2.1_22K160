@interface CSSpeechRecognitionSelfHelper
- (BOOL)_isNonTier1Message:(id)a3;
- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3;
- (BOOL)isSamplingForDictation;
- (BOOL)isTier1LoggingAllowedForCurrentRequest;
- (CSSpeechRecognitionSelfHelper)initWithAsrId:(id)a3 taskName:(id)a4 isSamplingForDictation:(BOOL)a5;
- (NSString)taskName;
- (NSUUID)asrId;
- (void)logAssistantSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5;
- (void)logDictationSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5;
- (void)logSampledAudioFileStoredSuccessfully;
- (void)logSampledAudioFileStoredWithError:(id)a3;
- (void)logSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5;
- (void)setAsrId:(id)a3;
- (void)setIsSamplingForDictation:(BOOL)a3;
- (void)setIsTier1LoggingAllowedForCurrentRequest:(BOOL)a3;
- (void)setTaskName:(id)a3;
- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4;
@end

@implementation CSSpeechRecognitionSelfHelper

- (CSSpeechRecognitionSelfHelper)initWithAsrId:(id)a3 taskName:(id)a4 isSamplingForDictation:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSSpeechRecognitionSelfHelper;
  v11 = -[CSSpeechRecognitionSelfHelper init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asrId, a3);
    objc_storeStrong((id *)&v12->_taskName, a4);
    v12->_isSamplingForDictation = a5;
    v12->_isTier1LoggingAllowedForCurrentRequest = -[CSSpeechRecognitionSelfHelper _isTier1LoggingAllowedForCurrentRequestWithTask:]( v12,  "_isTier1LoggingAllowedForCurrentRequestWithTask:",  v10);
  }

  return v12;
}

- (void)logSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5
{
  if (self->_isSamplingForDictation) {
    -[CSSpeechRecognitionSelfHelper logDictationSamplingEventStatus:requestId:error:]( self,  "logDictationSamplingEventStatus:requestId:error:",  a3,  a4,  a5);
  }
  else {
    -[CSSpeechRecognitionSelfHelper logAssistantSamplingEventStatus:requestId:error:]( self,  "logAssistantSamplingEventStatus:requestId:error:",  a3,  a4,  a5);
  }
}

- (void)logAssistantSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5
{
  if (a3) {
    -[CSSpeechRecognitionSelfHelper logSampledAudioFileStoredWithError:](self, "logSampledAudioFileStoredWithError:");
  }
  else {
    -[CSSpeechRecognitionSelfHelper logSampledAudioFileStoredSuccessfully]( self,  "logSampledAudioFileStoredSuccessfully");
  }
}

- (void)logSampledAudioFileStoredSuccessfully
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStored);
  [v3 setExists:1];
  -[CSSpeechRecognitionSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v3,  0LL);
}

- (void)logSampledAudioFileStoredWithError:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStorageFailed);
  if (!v13) {
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
  if ([v5 isEqualToString:CSErrorDomain]
    && (unint64_t)[v13 code] >= 0x92F)
  {
    id v6 = [v13 code];

    if ((unint64_t)v6 <= 0x932)
    {
      unint64_t v7 = (unint64_t)[v13 code] - 2351;
      if (v7 > 3) {
        uint64_t v8 = 0LL;
      }
      else {
        uint64_t v8 = dword_10018B3B0[v7];
      }
      [v4 setSampledAudioStorageFailureReason:v8];
      goto LABEL_11;
    }
  }

  else
  {
  }

  objc_msgSend(v4, "setErrorCode:", objc_msgSend(v13, "code"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
  [v4 setErrorDomain:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:NSUnderlyingErrorKey]);

  if (v11)
  {
    objc_msgSend(v4, "setUnderlyingErrorCode:", objc_msgSend(v11, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    [v4 setUnderlyingErrorDomain:v12];
  }

LABEL_11:
  -[CSSpeechRecognitionSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v4,  0LL);
}

- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[CSSpeechRecognitionSelfHelper _isNonTier1Message:](self, "_isNonTier1Message:", v6);
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
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPreheatContext, v14);
    if ((objc_opt_isKindOfClass(v6, v15) & 1) != 0)
    {
      [v13 setPreheatContext:v6];
    }

    else
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRRequestContext, v16);
      if ((objc_opt_isKindOfClass(v6, v17) & 1) != 0)
      {
        [v13 setRequestContext:v6];
      }

      else
      {
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated, v18);
        if ((objc_opt_isKindOfClass(v6, v19) & 1) != 0)
        {
          [v13 setPartialResultGenerated:v6];
        }

        else
        {
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPackageGenerated, v20);
          if ((objc_opt_isKindOfClass(v6, v21) & 1) != 0)
          {
            [v13 setPackageGenerated:v6];
          }

          else
          {
            uint64_t v23 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRRecognitionResultTier1, v22);
            if ((objc_opt_isKindOfClass(v6, v23) & 1) != 0)
            {
              [v13 setRecognitionResultTier1:v6];
            }

            else
            {
              uint64_t v25 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated, v24);
              if ((objc_opt_isKindOfClass(v6, v25) & 1) != 0)
              {
                [v13 setFinalResultGenerated:v6];
              }

              else
              {
                uint64_t v27 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRIntermediateUtteranceInfoTier1, v26);
                if ((objc_opt_isKindOfClass(v6, v27) & 1) != 0)
                {
                  [v13 setIntermediateUtteranceInfoTier1:v6];
                }

                else
                {
                  uint64_t v29 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRInitializationContext, v28);
                  if ((objc_opt_isKindOfClass(v6, v29) & 1) != 0)
                  {
                    [v13 setInitializationContext:v6];
                  }

                  else
                  {
                    uint64_t v31 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAssetLoadContext, v30);
                    if ((objc_opt_isKindOfClass(v6, v31) & 1) != 0)
                    {
                      [v13 setAssetLoadContext:v6];
                    }

                    else
                    {
                      uint64_t v33 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext, v32);
                      if ((objc_opt_isKindOfClass(v6, v33) & 1) != 0)
                      {
                        [v13 setLanguageModelEnrollmentContext:v6];
                      }

                      else
                      {
                        uint64_t v35 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEndedTier1, v34);
                        if ((objc_opt_isKindOfClass(v6, v35) & 1) != 0)
                        {
                          [v13 setJitLanguageModelEnrollmentEndedTier1:v6];
                        }

                        else
                        {
                          uint64_t v37 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext, v36);
                          if ((objc_opt_isKindOfClass(v6, v37) & 1) != 0)
                          {
                            [v13 setAudioPacketArrivalContext:v6];
                          }

                          else
                          {
                            uint64_t v39 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed, v38);
                            if ((objc_opt_isKindOfClass(v6, v39) & 1) != 0)
                            {
                              [v13 setFirstAudioPacketProcessed:v6];
                            }

                            else
                            {
                              uint64_t v41 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived,  v40);
                              if ((objc_opt_isKindOfClass(v6, v41) & 1) != 0)
                              {
                                [v13 setFinalAudioPacketContainingSpeechReceived:v6];
                              }

                              else
                              {
                                uint64_t v43 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStored, v42);
                                if ((objc_opt_isKindOfClass(v6, v43) & 1) != 0)
                                {
                                  [v13 setSampledAudioFileStored:v6];
                                }

                                else
                                {
                                  uint64_t v45 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStorageFailed, v44);
                                  if ((objc_opt_isKindOfClass(v6, v45) & 1) != 0)
                                  {
                                    [v13 setSampledAudioFileStorageFailed:v6];
                                  }

                                  else
                                  {
                                    uint64_t v47 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRAppleNeuralEngineCompilationContext,  v46);
                                    if ((objc_opt_isKindOfClass(v6, v47) & 1) != 0)
                                    {
                                      [v13 setAppleNeuralEngineCompilationContext:v6];
                                    }

                                    else
                                    {
                                      uint64_t v49 = objc_opt_class(&OBJC_CLASS___ASRSchemaASREmbeddedSpeechProcessContext, v48);
                                      if ((objc_opt_isKindOfClass(v6, v49) & 1) != 0)
                                      {
                                        [v13 setEmbeddedSpeechProcessContext:v6];
                                      }

                                      else
                                      {
                                        uint64_t v51 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateContext, v50);
                                        if ((objc_opt_isKindOfClass(v6, v51) & 1) != 0)
                                        {
                                          [v13 setActiveConfigUpdateContext:v6];
                                        }

                                        else
                                        {
                                          uint64_t v53 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext,  v52);
                                          if ((objc_opt_isKindOfClass(v6, v53) & 1) != 0)
                                          {
                                            [v13 setAppleNeuralEngineModelInitializationContext:v6];
                                          }

                                          else
                                          {
                                            uint64_t v55 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRAudioSpeechPacketArrivalContext,  v54);
                                            if ((objc_opt_isKindOfClass(v6, v55) & 1) != 0)
                                            {
                                              [v13 setAudioSpeechPacketArrivalContext:v6];
                                            }

                                            else
                                            {
                                              uint64_t v57 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived,  v56);
                                              if ((objc_opt_isKindOfClass(v6, v57) & 1) != 0)
                                              {
                                                [v13 setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:v6];
                                              }

                                              else
                                              {
                                                uint64_t v59 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRFrameProcessingReady,  v58);
                                                if ((objc_opt_isKindOfClass(v6, v59) & 1) != 0)
                                                {
                                                  [v13 setFrameProcessingReady:v6];
                                                }

                                                else
                                                {
                                                  uint64_t v61 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRLeadingSilenceProcessed,  v60);
                                                  if ((objc_opt_isKindOfClass(v6, v61) & 1) != 0)
                                                  {
                                                    [v13 setLeadingSilenceProcessed:v6];
                                                  }

                                                  else
                                                  {
                                                    uint64_t v63 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed,  v62);
                                                    if ((objc_opt_isKindOfClass(v6, v63) & 1) != 0)
                                                    {
                                                      [v13 setFirstSecondAfterLeadingSilenceProcessed:v6];
                                                    }

                                                    else
                                                    {
                                                      uint64_t v65 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded,  v64);
                                                      if ((objc_opt_isKindOfClass(v6, v65) & 1) != 0)
                                                      {
                                                        [v13 setFirstAudioPacketRecorded:v6];
                                                      }

                                                      else
                                                      {
                                                        uint64_t v67 = objc_opt_class( &OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream,  v66);
                                                        if ((objc_opt_isKindOfClass(v6, v67) & 1) == 0)
                                                        {
                                                          v76 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                                                          if (os_log_type_enabled( CSLogContextFacilityCoreSpeech,  OS_LOG_TYPE_ERROR))
                                                          {
                                                            int v77 = 136315138;
                                                            v78 = "-[CSSpeechRecognitionSelfHelper wrapAndEmitTopLevelEve"
                                                                  "nt:timestampInTicks:]";
                                                            _os_log_error_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "%s SELF: Failed trying to wrap and emit top-level ASR even t because event type was not mapped to loggable message ty pe in the ASR SELF schema.",  (uint8_t *)&v77,  0xCu);
                                                          }

                                                          goto LABEL_66;
                                                        }

                                                        [v13 setAudioPacketContainingEndOfFirstWordReadyUpstream:v6];
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

    v68 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      v71 = v68;
      v73 = (objc_class *)objc_opt_class(v6, v72);
      v74 = NSStringFromClass(v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
      int v77 = 136315394;
      v78 = "-[CSSpeechRecognitionSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]";
      __int16 v79 = 2112;
      v80 = v75;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEBUG,  "%s SELF: Wrapping and logging an event of type %@",  (uint8_t *)&v77,  0x16u);
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    v70 = v69;
    if (v7) {
      objc_msgSend(v69, "emitMessage:timestamp:", v13, objc_msgSend(v7, "unsignedLongLongValue"));
    }
    else {
      [v69 emitMessage:v13];
    }

LABEL_66:
  }
}

- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3
{
  uint64_t v3 = CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
  uint64_t v4 = CoreEmbeddedSpeechRecognizerTaskSiriDictation;
  uint64_t v5 = CoreEmbeddedSpeechRecognizerTaskBeto;
  uint64_t v6 = CoreEmbeddedSpeechRecognizerTaskBetoDictation;
  id v7 = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, v4, v5, v6, 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  CoreEmbeddedSpeechRecognizerTaskDictation,  CoreEmbeddedSpeechRecognizerTaskWebSearch,  0LL));
  unsigned __int8 v10 = [v8 containsObject:v7];
  LODWORD(v4) = [v9 containsObject:v7];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  LOBYTE(v5) = [v11 isDictationHIPAACompliant];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
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
  id v3 = a3;
  uint64_t v37 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPreheatContext, v4);
  uint64_t v36 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRRequestContext, v5);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated, v6);
  uint64_t v34 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRPackageGenerated, v7);
  uint64_t v33 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated, v8);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRInitializationContext, v9);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAssetLoadContext, v11);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext, v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext, v15);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed, v17);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived, v19);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStored, v21);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRSampledAudioFileStorageFailed, v23);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded, v25);
  uint64_t v28 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v37,  v36,  v35,  v34,  v33,  v10,  v12,  v14,  v16,  v18,  v20,  v22,  v24,  v26,  objc_opt_class(&OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream, v27),  0LL);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  uint64_t v31 = objc_opt_class(v3, v30);

  LOBYTE(v3) = [v29 containsObject:v31];
  return (char)v3;
}

- (void)logDictationSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    v34[0] = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate date]( &OBJC_CLASS___NSDate,  "date",  @"dictationUIInteractionIdentifier",  @"unixTime"));
    [v10 timeIntervalSince1970];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v34[1] = v11;
    v33[2] = @"samplingDate";
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities samplingDateAsString]( &OBJC_CLASS___AFDictationSamplingUtilities,  "samplingDateAsString"));
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (const __CFString *)v12;
    }
    else {
      uint64_t v14 = &stru_10022F858;
    }
    v34[2] = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
    uint64_t v16 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v15);

    if (a3 == 1)
    {
      if (v8)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 code]));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v19,  @"errorCode");

        uint64_t v20 = objc_claimAutoreleasedReturnValue([v8 domain]);
        uint64_t v21 = (void *)v20;
        if (v20) {
          uint64_t v22 = (const __CFString *)v20;
        }
        else {
          uint64_t v22 = &stru_10022F858;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v22,  @"errorDomain");

        uint64_t v23 = objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
        uint64_t v24 = (void *)v23;
        if (v23) {
          uint64_t v25 = (const __CFString *)v23;
        }
        else {
          uint64_t v25 = @"UNDEFINED";
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v25,  @"description");

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:NSUnderlyingErrorKey]);

        if (v27)
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v27 code]));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v28,  @"underlyingErrorCode");

          uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 domain]);
          uint64_t v30 = (void *)v29;
          if (v29) {
            uint64_t v31 = (const __CFString *)v29;
          }
          else {
            uint64_t v31 = &stru_10022F858;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v31,  @"underlyingErrorDomain");
        }
      }

      uint64_t v17 = @"failed";
    }

    else if (a3)
    {
      uint64_t v17 = &stru_10022F858;
    }

    else
    {
      uint64_t v17 = @"success";
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, @"status");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v32 logEventWithType:2224 context:v16];
  }

  else
  {
    uint64_t v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[CSSpeechRecognitionSelfHelper logDictationSamplingEventStatus:requestId:error:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to log sampling event since requestId is nil",  buf,  0xCu);
    }
  }
}

- (NSUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
}

- (BOOL)isSamplingForDictation
{
  return self->_isSamplingForDictation;
}

- (void)setIsSamplingForDictation:(BOOL)a3
{
  self->_isSamplingForDictation = a3;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

- (BOOL)isTier1LoggingAllowedForCurrentRequest
{
  return self->_isTier1LoggingAllowedForCurrentRequest;
}

- (void)setIsTier1LoggingAllowedForCurrentRequest:(BOOL)a3
{
  self->_BOOL isTier1LoggingAllowedForCurrentRequest = a3;
}

- (void).cxx_destruct
{
}

@end