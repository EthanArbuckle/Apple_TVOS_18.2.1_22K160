@interface FidesSelfHelper
- (FidesSelfHelper)initWithExperimentId:(id)a3;
- (NSString)datapackVersion;
- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4;
- (id)_choiceInfosFromChoiceInfoDicts:(id)a3 privateTokens:(id)a4;
- (id)_decodingMetricsFromMetricsDict:(id)a3;
- (id)_decodingResultsWithAudioDict:(id)a3 privateTokensOut:(id *)a4;
- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5;
- (id)_plmMetricsFromPlmDict:(id)a3;
- (id)_resultInfosFromResultInfoDict:(id)a3 privateTokens:(id)a4;
- (id)_tokensFromTokenDict:(id)a3 privateTokens:(id)a4;
- (id)_tokensFromTokensArray:(id)a3 privateTokens:(id)a4;
- (id)_transcriptMetadataFromPopDict:(id)a3;
- (id)_utteranceInfosFromUtteranceInfoDict:(id)a3 privateTokens:(id)a4;
- (void)_wrapAndEmitTopLevelEvent:(id)a3;
- (void)logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:(id)a3;
- (void)logDictationPersonalizationExperimentStartedOrChanged;
- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3;
- (void)logUserEditExperimentStartedOrChanged;
- (void)setDatapackVersion:(id)a3;
@end

@implementation FidesSelfHelper

- (FidesSelfHelper)initWithExperimentId:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FidesSelfHelper;
  v6 = -[FidesSelfHelper init](&v15, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    dodmlId = v6->_dodmlId;
    v6->_dodmlId = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_experimentId, a3);
    v9 = (void *)AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      v10 = v6->_dodmlId;
      v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10, "UUIDString"));
      experimentId = v6->_experimentId;
      *(_DWORD *)buf = 136315650;
      v17 = "-[FidesSelfHelper initWithExperimentId:]";
      __int16 v18 = 2112;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = experimentId;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%s Fides SELF: Logging object created successfully: dodmlId=%@, experimentId=%@",  buf,  0x20u);
    }
  }

  return v6;
}

- (void)logUserEditExperimentStartedOrChanged
{
  id v4 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentStarted);
  [v4 setExists:1];
  id v3 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentContext);
  [v3 setStartedOrChanged:v4];
  -[FidesSelfHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v3);
}

- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v3 = a3;
  v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v29 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"confusionPairs"]);
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v7);
        id v9 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRConfusionPair);
        id v10 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRConfusionPairTier1);
        id v11 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
        v12 = objc_alloc(&OBJC_CLASS___NSUUID);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"asrSelfComponentIdentifier"]);
        v14 = -[NSUUID initWithUUIDString:](v12, "initWithUUIDString:", v13);
        id v15 = [v11 initWithNSUUID:v14];
        [v9 setAsrId:v15];

        [v8 removeObjectForKey:@"asrSelfComponentIdentifier"];
        v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"errorCode"]);
        v17 = v16;
        if (v16) {
          objc_msgSend(v9, "setErrorCode:", objc_msgSend(v16, "intValue"));
        }
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"recognizedPair"]);
        [v10 setRecognizedTokens:v18];

        v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"correctedPair"]);
        [v10 setCorrectedTokens:v19];

        -[NSMutableArray addObject:](v32, "addObject:", v9);
        -[NSMutableArray addObject:](v31, "addObject:", v10);

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v5);
  }

  __int16 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v21 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults);
  [v21 setDatapackVersion:self->_datapackVersion];
  [v21 setConfusionPairs:v32];
  -[NSMutableArray addObject:](v20, "addObject:", v21);
  id v22 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1);
  id v23 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v25 = [v23 initWithNSUUID:v24];

  [v22 setLinkId:v25];
  [v22 setConfusionPairs:v31];
  id v26 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentEnded);
  [v26 setRedecodingResults:v20];
  [v26 setLinkId:v25];
  id v27 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentContext);
  [v27 setEnded:v26];
  -[FidesSelfHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v27);
  -[FidesSelfHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v22);
}

- (void)logDictationPersonalizationExperimentStartedOrChanged
{
  id v5 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRPersonalizationExperimentStarted);
  [v5 setExists:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v3, "thermalState"));

  id v4 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRPersonalizationExperimentContext);
  [v4 setStartedOrChanged:v5];
  -[FidesSelfHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v4);
}

- (void)logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRPersonalizationExperimentEnded);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"languageMetadata"]);
  id v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    id v30 = v4;
    uint64_t v9 = *(void *)v37;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v36 + 1) + 8 * (void)i) objectForKeyedSubscript:@"status"]);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0
          && [v11 isEqualToString:@"Required Personalized LM not found"])
        {

          v13 = &off_8EC0;
          id v4 = v30;
          goto LABEL_13;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    id v4 = v30;
  }

  v13 = &off_8EA8;
LABEL_13:

  objc_msgSend(v5, "setExperimentStatusCode:", objc_msgSend(v13, "intValue"));
  [v5 setDatapackVersion:self->_datapackVersion];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"numAudio"]);
  objc_msgSend(v5, "setNumAudioFilesAvailable:", objc_msgSend(v14, "unsignedIntValue"));

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"numSelectedAudio"]);
  objc_msgSend(v5, "setNumAudioFilesSelected:", objc_msgSend(v15, "unsignedIntValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"textProcessingDuration"]);
  [v16 doubleValue];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 * 1000000000.0));
  objc_msgSend(v5, "setTextProcessingDurationInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

  [v4 removeObjectForKey:@"textProcessingDuration"];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v19, "thermalState"));

  id v35 = 0LL;
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _audioFileResultsFromResultDict:privateAudioFileResultsOut:]( self,  "_audioFileResultsFromResultDict:privateAudioFileResultsOut:",  v4,  &v35));
  id v21 = v35;
  [v5 setAudioFileResults:v20];

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"personalizedLM"]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[FidesSelfHelper _plmMetricsFromPlmDict:](self, "_plmMetricsFromPlmDict:", v22));
  [v5 setPersonalizedLanguageModelMetrics:v23];

  id v24 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRPersonalizationExperimentContext);
  [v24 setEnded:v5];
  -[FidesSelfHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v24);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v25 = v21;
  id v26 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v25);
        }
        -[FidesSelfHelper _wrapAndEmitTopLevelEvent:]( self,  "_wrapAndEmitTopLevelEvent:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)j));
      }

      id v27 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }

    while (v27);
  }
}

- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4
{
  id v4 = a3;
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v22 = v4;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"audioResults"]);
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v28)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v7 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRAudioFileResult);
        -[NSMutableArray addObject:](v27, "addObject:", v7);
        id v8 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
        uint64_t v9 = objc_alloc(&OBJC_CLASS___NSUUID);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"asrSelfComponentId"]);
        id v11 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v10);
        id v12 = [v8 initWithNSUUID:v11];

        [v6 removeObjectForKey:@"asrSelfComponentId"];
        [v7 setAsrId:v12];
        id v13 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        id v15 = [v13 initWithNSUUID:v14];

        [v7 setLinkId:v15];
        id v29 = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _decodingResultsWithAudioDict:privateTokensOut:]( self,  "_decodingResultsWithAudioDict:privateTokensOut:",  v6,  &v29));
        id v17 = v29;
        [v7 setDecodingResults:v16];

        id v18 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRAudioFileResultTier1);
        -[NSMutableArray addObject:](v26, "addObject:", v18);
        id v19 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRecognitionResultTier1);
        [v19 setLinkId:v15];
        [v19 setTokens:v17];

        [v18 setRecognitionResult:v19];
      }

      id v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v28);
  }

  if (a4) {
    *a4 = v26;
  }

  return v27;
}

- (id)_decodingResultsWithAudioDict:(id)a3 privateTokensOut:(id *)a4
{
  id v5 = a3;
  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"tokens"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"metrics"]);
  v40 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"uttInfos"]);

  __int128 v36 = v5;
  if (v9)
  {
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"uttInfos"]);
    goto LABEL_11;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"uttInfosCompressed"]);

  if (!v10)
  {
    __int128 v39 = 0LL;
    goto LABEL_11;
  }

  id v11 = objc_alloc(&OBJC_CLASS___NSData);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"uttInfosCompressed"]);
  id v13 = -[NSData initWithBase64EncodedString:options:](v11, "initWithBase64EncodedString:options:", v12, 0LL);

  id v48 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSData decompressedDataUsingAlgorithm:error:]( v13,  "decompressedDataUsingAlgorithm:error:",  3LL,  &v48));
  id v15 = v48;
  id v47 = 0LL;
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v14,  0LL,  &v47));
  id v16 = v47;
  id v17 = v16;
  if (!v15)
  {
    if (!v16) {
      goto LABEL_10;
    }
    id v18 = (os_log_s *)AFSiriLogContextFides;
    if (!os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v51 = "-[FidesSelfHelper _decodingResultsWithAudioDict:privateTokensOut:]";
    id v19 = "%s Fides SELF: Utterance Info could not be deserialized - it will not be logged.";
    goto LABEL_22;
  }

  id v18 = (os_log_s *)AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[FidesSelfHelper _decodingResultsWithAudioDict:privateTokensOut:]";
    id v19 = "%s Fides SELF: Utterance Info could not be decompressed - it will not be logged.";
LABEL_22:
    _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
  }

- (id)_decodingMetricsFromMetricsDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRDecodingMetrics);
  __int128 v33 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"WallRTF"]);
  [v5 floatValue];
  objc_msgSend(v4, "setWallRealTimeFactor:");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"AverageActiveTokensPerFrame"]);
  [v6 floatValue];
  objc_msgSend(v4, "setAverageActiveTokensPerFrame:");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"jitQueryDurationInMs"]);
  objc_msgSend(v4, "setJitQueryDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));

  [v33 removeObjectForKey:@"jitQueryDurationInMs"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"jitLmeDurationInMs"]);
  objc_msgSend(v4, "setJitLanguageModelEnrollmentDurationInMs:", objc_msgSend(v8, "unsignedLongLongValue"));

  [v33 removeObjectForKey:@"jitLmeDurationInMs"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v33 valueForKeyPath:@"jitDataStats.preprocessingCategoryCounts"]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_4ED8;
  v42[3] = &unk_82F0;
  id v10 = v4;
  id v43 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v42];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v33 valueForKeyPath:@"jitDataStats.postprocessingCategoryCounts"]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_4F64;
  v40[3] = &unk_82F0;
  id v31 = v10;
  id v41 = v31;
  [v11 enumerateKeysAndObjectsUsingBlock:v40];

  [v33 removeObjectForKey:@"jitDataStats"];
  double v32 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"lm_interp_weights"]);
  if (v32)
  {
    id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v32 componentsSeparatedByString:@";"]);
    id v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v37;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v14);
          id v16 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInterpolationWeightBundle);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsSeparatedByString:@":"]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:1]);
          [v18 doubleValue];
          id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

          id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:2]);
          [v20 doubleValue];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

          [v19 doubleValue];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22 * 1000000.0));
          objc_msgSend(v16, "setStartTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

          [v21 doubleValue];
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24 * 1000000.0));
          objc_msgSend(v16, "setEndTimeInNs:", objc_msgSend(v25, "unsignedLongLongValue"));

          id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsSeparatedByString:@","]);

          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 valueForKey:@"floatValue"]);
          [v16 setWeights:v28];

          -[NSMutableArray addObject:](v35, "addObject:", v16);
          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v12);
    }

    [v31 setLanguageModelInterpolationWeights:v35];
  }

  id v29 = v31;

  return v29;
}

- (id)_utteranceInfosFromUtteranceInfoDict:(id)a3 privateTokens:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v23 = v6;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v11);
          id v13 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRUtteranceInfo);
          -[NSMutableArray addObject:](v7, "addObject:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"results"]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _resultInfosFromResultInfoDict:privateTokens:]( self,  "_resultInfosFromResultInfoDict:privateTokens:",  v14,  v25));
          [v13 setResults:v15];

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"startMillis"]);
          [v16 doubleValue];
          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 * 1000000.0));
          objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

          id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"endMillis"]);
          [v19 doubleValue];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 * 1000000.0));
          objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v9);
    }

    id v6 = v23;
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_resultInfosFromResultInfoDict:(id)a3 privateTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
        id v15 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRResultInfo);
        -[NSMutableArray addObject:](v7, "addObject:", v15);
        [v15 setStageName:v13];
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"aligned"]);
        [v15 setIsAligned:v16 != 0];

        double v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"choices"]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _choiceInfosFromChoiceInfoDicts:privateTokens:]( self,  "_choiceInfosFromChoiceInfoDicts:privateTokens:",  v17,  v6));
        [v15 setChoices:v18];
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)_choiceInfosFromChoiceInfoDicts:(id)a3 privateTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRChoiceInfo);
        -[NSMutableArray addObject:](v8, "addObject:", v14);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"tokens"]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _tokensFromTokensArray:privateTokens:]( self,  "_tokensFromTokensArray:privateTokens:",  v15,  v7));
        [v14 setTokens:v16];

        double v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"graphCost"]);
        [v17 floatValue];
        objc_msgSend(v14, "setGraphCost:");

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"acousticCost"]);
        [v18 floatValue];
        objc_msgSend(v14, "setAcousticCost:");

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  return v8;
}

- (id)_tokensFromTokensArray:(id)a3 privateTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRTokenInfo);
        -[NSMutableArray addObject:](v32, "addObject:", v12);
        id v13 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRToken);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
        [v14 doubleValue];
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 * 1000000.0));
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));

        double v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:2]);
        [v17 doubleValue];
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18 * 1000000.0));
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

        double v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:3]);
        [v20 doubleValue];
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21 * 1000000.0));
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v22, "unsignedLongLongValue"));

        [v12 setToken:v13];
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:5]);
        [v23 floatValue];
        objc_msgSend(v12, "setAcousticCost:");

        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:6]);
        [v24 floatValue];
        objc_msgSend(v12, "setSilenceAcousticCost:");

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:7]);
        [v12 setNumBackoffs:v25];

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:8]);
        [v12 setLanguageModelCosts:v26];

        id v27 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRTokenTier1);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
        [v27 setText:v28];

        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:4]);
        [v27 setPhoneSequence:v29];

        if ([v6 containsObject:v27])
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v27));
        }

        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          [v6 addObject:v27];
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v8);
  }

  return v32;
}

- (id)_tokensFromTokenDict:(id)a3 privateTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v11);
        id v13 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRToken);
        -[NSMutableArray addObject:](v7, "addObject:", v13);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"startTime"]);
        [v14 doubleValue];
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 * 1000000000.0));
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));

        double v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"endTime"]);
        [v17 doubleValue];
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18 * 1000000000.0));
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

        double v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"removeSpaceAfter"]);
        objc_msgSend(v13, "setAppendSpaceAfter:", objc_msgSend(v20, "BOOLValue") ^ 1);

        double v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"silenceStartTime"]);
        [v21 doubleValue];
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22 * 1000000000.0));
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"confidence"]);
        objc_msgSend(v13, "setConfidence:", objc_msgSend(v24, "intValue"));

        id v25 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRTokenTier1);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"text"]);
        [v25 setText:v26];

        id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"phoneSequence"]);
        [v25 setPhoneSequence:v27];

        if ([v6 containsObject:v25])
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v25));
        }

        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          [v6 addObject:v25];
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v9);
  }

  return v7;
}

- (id)_plmMetricsFromPlmDict:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"train"]);
  id v6 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRTranscriptionMetrics);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"train"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FidesSelfHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v8));
  [v6 setTrain:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"test"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FidesSelfHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v11));
  [v6 setTest:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"dev"]);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[FidesSelfHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v14));
  v59 = v6;
  [v6 setDev:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"external"]);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[FidesSelfHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v17));
  [v6 setExternal:v18];

  id v19 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASREvaluationMetrics);
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"eval"]);
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"model-selection"]);
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"best-weight"]);
  [v22 floatValue];
  objc_msgSend(v19, "setBestWeight:");

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"totalTime"]);
  [v23 doubleValue];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24 * 1000.0));
  objc_msgSend(v19, "setTotalDurationInMs:", objc_msgSend(v25, "unsignedLongLongValue"));

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"times"]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _lmMetricsFromEvalDict:perplexityName:timesDict:]( self,  "_lmMetricsFromEvalDict:perplexityName:timesDict:",  v20,  @"train-ppl",  v26));
  [v19 setTrains:v27];

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"times"]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _lmMetricsFromEvalDict:perplexityName:timesDict:]( self,  "_lmMetricsFromEvalDict:perplexityName:timesDict:",  v20,  @"test-ppl",  v28));
  [v19 setTests:v29];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"times"]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _lmMetricsFromEvalDict:perplexityName:timesDict:]( self,  "_lmMetricsFromEvalDict:perplexityName:timesDict:",  v20,  @"dev-ppl",  v30));
  [v19 setDevs:v31];

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"times"]);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _lmMetricsFromEvalDict:perplexityName:timesDict:]( self,  "_lmMetricsFromEvalDict:perplexityName:timesDict:",  v20,  @"external-ppl",  v32));
  [v19 setExternals:v33];

  id v34 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRModelMetrics);
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"model"]);
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"times"]);
  [v34 setConfigName:0];
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"order"]);
  objc_msgSend(v34, "setNgramOrder:", objc_msgSend(v37, "unsignedIntValue"));

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"residualAdaptationWeight"]);
  [v38 floatValue];
  objc_msgSend(v34, "setResidualAdaptationWeight:");

  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"totalTime"]);
  [v39 doubleValue];
  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v40 * 1000.0));
  objc_msgSend(v34, "setTotalDurationInMs:", objc_msgSend(v41, "unsignedLongLongValue"));

  v42 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"training"]);
  [v42 doubleValue];
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v43 * 1000.0));
  objc_msgSend(v34, "setTrainingDurationInMs:", objc_msgSend(v44, "unsignedLongLongValue"));

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"conversion"]);
  [v45 doubleValue];
  id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v46 * 1000.0));
  objc_msgSend(v34, "setConversionDurationInMs:", objc_msgSend(v47, "unsignedLongLongValue"));

  id v48 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"optimization"]);
  [v48 doubleValue];
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v49 * 1000.0));
  objc_msgSend(v34, "setOptimizationDurationInMs:", objc_msgSend(v50, "unsignedLongLongValue"));

  v51 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"numStates"]);
  objc_msgSend(v34, "setNumFiniteStateTransducerStates:", objc_msgSend(v51, "unsignedIntValue"));

  [v35 removeObjectForKey:@"numStates"];
  v52 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"numArcs"]);
  objc_msgSend(v34, "setNumFiniteStateTransducerArcs:", objc_msgSend(v52, "unsignedIntValue"));

  [v35 removeObjectForKey:@"numArcs"];
  v53 = v4;
  v54 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"trainErrorCode"]);
  objc_msgSend(v34, "setModelTrainingStatusCode:", objc_msgSend(v54, "unsignedIntValue"));

  [v4 removeObjectForKey:@"trainErrorCode"];
  id v55 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics);
  [v55 setTranscriptionMetrics:v59];
  [v55 setEvaluationMetrics:v19];
  v56 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"userLanguage"]);

  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);
  objc_msgSend( v55,  "setUserLocale:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v57));

  [v55 setModelMetrics:v34];
  return v55;
}

- (id)_transcriptMetadataFromPopDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRTranscriptMetadata);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numDocumentsRejected"]);
  objc_msgSend(v4, "setNumDocumentsRejected:", objc_msgSend(v5, "unsignedIntValue"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numSentencesRejected"]);
  objc_msgSend(v4, "setNumSentencesRejected:", objc_msgSend(v6, "unsignedIntValue"));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numDocuments"]);
  objc_msgSend(v4, "setNumDocumentsAccepted:", objc_msgSend(v7, "unsignedIntValue"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numSentences"]);
  objc_msgSend(v4, "setNumSentencesAccepted:", objc_msgSend(v8, "unsignedIntValue"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numTokens"]);
  objc_msgSend(v4, "setNumTokensAccepted:", objc_msgSend(v9, "unsignedIntValue"));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numTokensOOV"]);
  objc_msgSend(v4, "setNumTokensOutOfVocabularyAccepted:", objc_msgSend(v10, "unsignedIntValue"));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numDocumentsDictated"]);
  objc_msgSend(v4, "setNumDocumentsDictated:", objc_msgSend(v11, "unsignedIntValue"));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numDocumentsTyped"]);
  objc_msgSend(v4, "setNumDocumentsTyped:", objc_msgSend(v12, "unsignedIntValue"));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numTokensDictated"]);
  objc_msgSend(v4, "setNumTokensDictated:", objc_msgSend(v13, "unsignedIntValue"));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numTokensTyped"]);
  objc_msgSend(v4, "setNumTokensTyped:", objc_msgSend(v14, "unsignedIntValue"));

  double v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numSentencesMungeRejected"]);
  objc_msgSend(v4, "setNumSentencesMungeRejected:", objc_msgSend(v15, "unsignedIntValue"));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numSentencesMungeChanged"]);
  objc_msgSend(v4, "setNumSentencesMungeChanged:", objc_msgSend(v16, "unsignedIntValue"));

  double v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numTokensEstimatedExamined"]);
  objc_msgSend(v4, "setNumTokensEstimatedExamined:", objc_msgSend(v17, "unsignedIntValue"));

  [v3 removeObjectForKey:@"numTokensEstimatedExamined"];
  return v4;
}

- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5
{
  id v7 = a4;
  id v36 = a5;
  __int128 v37 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:v7]);
  if (v8)
  {
    __int128 v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v33 = v8;
    id obj = v8;
    id v38 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v38)
    {
      uint64_t v34 = *(void *)v46;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v9;
          uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v10, v33));
          id v12 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRLanguageModelMetrics);
          -[NSMutableArray addObject:](v35, "addObject:", v12);
          [v10 floatValue];
          objc_msgSend(v12, "setLinearInterpolationWeight:");
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v37]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);
          [v14 doubleValue];
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 * 1000.0));
          objc_msgSend(v12, "setTotalDurationInMs:", objc_msgSend(v16, "unsignedLongLongValue"));

          double v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"utterances"]);
          objc_msgSend(v12, "setNumUtterances:", objc_msgSend(v17, "unsignedIntValue"));

          double v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"words"]);
          objc_msgSend(v12, "setNumWords:", objc_msgSend(v18, "unsignedIntValue"));

          id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"OOVs"]);
          objc_msgSend(v12, "setNumOutOfVocabularyWords:", objc_msgSend(v19, "unsignedIntValue"));

          double v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"invalidTokens"]);
          objc_msgSend(v12, "setNumInvalidTokens:", objc_msgSend(v20, "unsignedIntValue"));

          double v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"invalidUtterances"]);
          objc_msgSend(v12, "setNumInvalidUtterances:", objc_msgSend(v21, "unsignedIntValue"));

          double v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"PPL"]);
          [v22 floatValue];
          objc_msgSend(v12, "setPerplexity:");

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"PPL1"]);
          [v23 floatValue];
          objc_msgSend(v12, "setPerplexityOne:");

          double v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"ngramHits"]);
          id v26 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v42;
            do
            {
              for (i = 0LL; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v42 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
                id v31 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRNgramHits);
                -[NSMutableArray addObject:](v24, "addObject:", v31);
                [v31 setHits:v30];
              }

              id v27 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }

            while (v27);
          }

          [v12 setNgramHits:v24];
          uint64_t v9 = v40 + 1;
        }

        while ((id)(v40 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v38);
    }

    id v8 = v33;
  }

  else
  {
    __int128 v35 = 0LL;
  }

  return v35;
}

- (void)_wrapAndEmitTopLevelEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___DODMLSchemaDODMLClientEventMetadata);
  id v6 = [[SISchemaUUID alloc] initWithNSUUID:self->_dodmlId];
  [v5 setDodMlId:v6];
  [v5 setExperimentName:self->_experimentId];
  id v7 = objc_alloc_init(&OBJC_CLASS___DODMLSchemaDODMLClientEvent);
  [v7 setEventMetadata:v5];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___DODMLASRSchemaDODMLASRPersonalizationExperimentContext);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    [v7 setPersonalizationExperimentContext:v4];
LABEL_9:
    id v12 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      double v15 = v12;
      id v16 = (objc_class *)objc_opt_class(v4);
      double v17 = NSStringFromClass(v16);
      double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v19 = 136315394;
      double v20 = "-[FidesSelfHelper _wrapAndEmitTopLevelEvent:]";
      __int16 v21 = 2112;
      double v22 = v18;
      _os_log_debug_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "%s Fides SELF: Wrapping and logging an event of type %@",  (uint8_t *)&v19,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v13 emitMessage:v7];

    goto LABEL_12;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentContext);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
  {
    [v7 setUserEditExperimentContext:v4];
    goto LABEL_9;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
  {
    [v7 setUserEditExperimentEndedTier1:v4];
    goto LABEL_9;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___DODMLASRSchemaDODMLASRAudioFileResultTier1);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
  {
    [v7 setAudioFileResultTier1:v4];
    goto LABEL_9;
  }

  id v14 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315138;
    double v20 = "-[FidesSelfHelper _wrapAndEmitTopLevelEvent:]";
    _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%s Fides SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable me ssage type in the DODML ASR SELF schema.",  (uint8_t *)&v19,  0xCu);
  }

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (void)setDatapackVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end