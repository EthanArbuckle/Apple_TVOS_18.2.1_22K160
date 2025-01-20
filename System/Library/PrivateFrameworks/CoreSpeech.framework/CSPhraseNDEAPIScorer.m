@interface CSPhraseNDEAPIScorer
- (BOOL)hasReceivedNDEAPIResult;
- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI;
- (CSPhraseNDEAPIScorer)initWithAsset:(id)a3 assetConfig:(id)a4 firstPassSource:(unint64_t)a5 activeChannel:(unint64_t)a6 siriLanguage:(id)a7 shouldEnableShadowMicScore:(BOOL)a8 rtmodelRequestOptions:(id)a9;
- (CSPhraseNDEAPIScorerDelegate)delegate;
- (CSShadowMicScoreCreator)shadowMicScoreCreator;
- (NSMutableData)dataBufferNDEAPI;
- (double)currentShadowMicScore;
- (float)shadowMicScoreThresholdForVAD;
- (id)_rtModelFromAsset:(id)a3 requestOptions:(id)a4 forSiriLanguage:(id)a5 withPhraseCount:(unint64_t)a6;
- (unint64_t)dataBufferPositionNDEAPI;
- (unint64_t)hearstNumberOfBytesPerChunk;
- (unint64_t)hearstNumberOfSamplesPerChunk;
- (unsigned)hasReceivedEarlyDetectNDEAPIResult;
- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)processAudioChunk:(id)a3 activeChannel:(unint64_t)a4;
- (void)reset;
- (void)setDataBufferNDEAPI:(id)a3;
- (void)setDataBufferPositionNDEAPI:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasReceivedEarlyDetectNDEAPIResult:(unsigned __int8)a3;
- (void)setHasReceivedNDEAPIResult:(BOOL)a3;
- (void)setHearstNumberOfBytesPerChunk:(unint64_t)a3;
- (void)setHearstNumberOfSamplesPerChunk:(unint64_t)a3;
- (void)setKeywordAnalyzerNDEAPI:(id)a3;
- (void)setShadowMicScoreCreator:(id)a3;
@end

@implementation CSPhraseNDEAPIScorer

- (CSPhraseNDEAPIScorer)initWithAsset:(id)a3 assetConfig:(id)a4 firstPassSource:(unint64_t)a5 activeChannel:(unint64_t)a6 siriLanguage:(id)a7 shouldEnableShadowMicScore:(BOOL)a8 rtmodelRequestOptions:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___CSPhraseNDEAPIScorer;
  v18 = -[CSPhraseNDEAPIScorer init](&v35, "init");
  v19 = v18;
  if (v18)
  {
    if (v9 && v18->_shadowMicScoreThresholdForVAD != -1.0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 accessoryInfo]);
      unsigned __int8 v21 = [v20 supportsAlwaysOnAccelerometer];

      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v15 wearerDetectionConfig]);
        [v22 shadowMicScoreThreshold];
        v19->_shadowMicScoreThresholdForVAD = v23;

        v24 = objc_alloc_init(&OBJC_CLASS___CSShadowMicScoreCreator);
        shadowMicScoreCreator = v19->_shadowMicScoreCreator;
        v19->_shadowMicScoreCreator = v24;
      }
    }

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    dataBufferNDEAPI = v19->_dataBufferNDEAPI;
    v19->_dataBufferNDEAPI = v26;

    v19->_dataBufferPositionNDEAPI = 0LL;
    v19->_hasReceivedEarlyDetectNDEAPIResult = 0;
    v19->_hearstNumberOfBytesPerChunk = +[CSConfig hearstNumberOfBytesPerChunk]( &OBJC_CLASS___CSConfig,  "hearstNumberOfBytesPerChunk");
    v19->_hearstNumberOfSamplesPerChunk = +[CSConfig hearstNumberOfSamplesPerChunk]( &OBJC_CLASS___CSConfig,  "hearstNumberOfSamplesPerChunk");
    v28 = (void *)objc_claimAutoreleasedReturnValue([v15 phraseConfigs]);
    v29 = (void *)objc_claimAutoreleasedReturnValue( -[CSPhraseNDEAPIScorer _rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:]( v19,  "_rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:",  v14,  v17,  v16,  [v28 count]));

    v30 = objc_alloc(&OBJC_CLASS___CSKeywordAnalyzerNDEAPI);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 modelData]);
    v32 = -[CSKeywordAnalyzerNDEAPI initWithBlob:](v30, "initWithBlob:", v31);
    keywordAnalyzerNDEAPI = v19->_keywordAnalyzerNDEAPI;
    v19->_keywordAnalyzerNDEAPI = v32;

    -[CSKeywordAnalyzerNDEAPI setActiveChannel:](v19->_keywordAnalyzerNDEAPI, "setActiveChannel:", a6);
    -[CSKeywordAnalyzerNDEAPI setDelegate:](v19->_keywordAnalyzerNDEAPI, "setDelegate:", v19);
  }

  return v19;
}

- (void)reset
{
  self->_hasReceivedNDEAPIResult = 0;
  -[CSKeywordAnalyzerNDEAPI reset](self->_keywordAnalyzerNDEAPI, "reset");
}

- (void)processAudioChunk:(id)a3 activeChannel:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataForChannel:a4]);
  -[CSShadowMicScoreCreator addDataToBuffer:](self->_shadowMicScoreCreator, "addDataToBuffer:", v7);
  if (self->_shadowMicScoreCreator)
  {
    if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter,  "convertToShortLPCMBufFromFloatLPCMBuf:",  v7));
      if ([v8 length]) {
        -[NSMutableData appendData:](self->_dataBufferNDEAPI, "appendData:", v8);
      }
    }

    else
    {
      -[NSMutableData appendData:](self->_dataBufferNDEAPI, "appendData:", v7);
    }

    while ((char *)-[NSMutableData length](self->_dataBufferNDEAPI, "length") - self->_dataBufferPositionNDEAPI >= (char *)self->_hearstNumberOfBytesPerChunk)
    {
      __chkstk_darwin();
      v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      -[NSMutableData getBytes:range:]( self->_dataBufferNDEAPI,  "getBytes:range:",  v11,  self->_dataBufferPositionNDEAPI,  self->_hearstNumberOfBytesPerChunk);
      id v12 =  -[CSKeywordAnalyzerNDEAPI processAudioBytes:withNumberOfSamples:]( self->_keywordAnalyzerNDEAPI,  "processAudioBytes:withNumberOfSamples:",  v11,  self->_hearstNumberOfSamplesPerChunk);
      self->_dataBufferPositionNDEAPI += self->_hearstNumberOfBytesPerChunk;
    }
  }

  else
  {
    id v9 = -[CSKeywordAnalyzerNDEAPI processAudioChunk:](self->_keywordAnalyzerNDEAPI, "processAudioChunk:", v6);
  }
}

- (double)currentShadowMicScore
{
  return result;
}

- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEarlyDetect] && !self->_hasReceivedEarlyDetectNDEAPIResult)
  {
    id v13 = [v8 samplesFed];
    id v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[CSPhraseNDEAPIScorer keywordAnalyzerNDEAPI:hasResultAvailable:forChannel:]";
      __int16 v17 = 1026;
      int v18 = (int)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s EarlyDetectSample = %{public}d",  (uint8_t *)&v15,  0x12u);
    }

    -[CSShadowMicScoreCreator setBestEarlyDetectSample:](self->_shadowMicScoreCreator, "setBestEarlyDetectSample:", v13);
    self->_hasReceivedEarlyDetectNDEAPIResult = 1;
  }

  else if (!self->_hasReceivedNDEAPIResult)
  {
    self->_hasReceivedNDEAPIResult = 1;
    id v9 = [v8 bestStart];
    id v10 = [v8 bestEnd];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:self bestStartSampleCount:v9 bestEndSampleCount:v10];

    id v12 = [v8 samplesFed];
    -[CSShadowMicScoreCreator setBestStartDetectSample:](self->_shadowMicScoreCreator, "setBestStartDetectSample:", v9);
    -[CSShadowMicScoreCreator setBestEndDetectSample:](self->_shadowMicScoreCreator, "setBestEndDetectSample:", v12);
    [v7 reset];
  }
}

- (id)_rtModelFromAsset:(id)a3 requestOptions:(id)a4 forSiriLanguage:(id)a5 withPhraseCount:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100140A48;
  v18[3] = &unk_10022E880;
  id v19 = v9;
  id v20 = v10;
  unint64_t v21 = a6;
  id v13 = v10;
  id v14 = v9;
  int v15 = -[CSVoiceTriggerRTModelRequestOptions initWithCSRTModelRequestOptions:builder:]( v12,  "initWithCSRTModelRequestOptions:builder:",  v14,  v18);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 latestHearstRTModelWithRequestOptions:v15]);

  return v16;
}

- (CSPhraseNDEAPIScorerDelegate)delegate
{
  return (CSPhraseNDEAPIScorerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (float)shadowMicScoreThresholdForVAD
{
  return self->_shadowMicScoreThresholdForVAD;
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI
{
  return self->_keywordAnalyzerNDEAPI;
}

- (void)setKeywordAnalyzerNDEAPI:(id)a3
{
}

- (BOOL)hasReceivedNDEAPIResult
{
  return self->_hasReceivedNDEAPIResult;
}

- (void)setHasReceivedNDEAPIResult:(BOOL)a3
{
  self->_hasReceivedNDEAPIResult = a3;
}

- (CSShadowMicScoreCreator)shadowMicScoreCreator
{
  return self->_shadowMicScoreCreator;
}

- (void)setShadowMicScoreCreator:(id)a3
{
}

- (NSMutableData)dataBufferNDEAPI
{
  return self->_dataBufferNDEAPI;
}

- (void)setDataBufferNDEAPI:(id)a3
{
}

- (unint64_t)dataBufferPositionNDEAPI
{
  return self->_dataBufferPositionNDEAPI;
}

- (void)setDataBufferPositionNDEAPI:(unint64_t)a3
{
  self->_dataBufferPositionNDEAPI = a3;
}

- (unsigned)hasReceivedEarlyDetectNDEAPIResult
{
  return self->_hasReceivedEarlyDetectNDEAPIResult;
}

- (void)setHasReceivedEarlyDetectNDEAPIResult:(unsigned __int8)a3
{
  self->_hasReceivedEarlyDetectNDEAPIResult = a3;
}

- (unint64_t)hearstNumberOfBytesPerChunk
{
  return self->_hearstNumberOfBytesPerChunk;
}

- (void)setHearstNumberOfBytesPerChunk:(unint64_t)a3
{
  self->_hearstNumberOfBytesPerChunk = a3;
}

- (unint64_t)hearstNumberOfSamplesPerChunk
{
  return self->_hearstNumberOfSamplesPerChunk;
}

- (void)setHearstNumberOfSamplesPerChunk:(unint64_t)a3
{
  self->_hearstNumberOfSamplesPerChunk = a3;
}

- (void).cxx_destruct
{
}

@end