@interface CSModelBenchmarker
- (BOOL)_setupAudioInjectionEngineWithAudioURL:(id)a3;
- (CSAudioInjectionEngine)audioInjectionEngine;
- (CSModelBenchmarker)init;
- (CSSyncKeywordAnalyzerQuasar)vtSecondPassAnalyzer;
- (EARSyncPSRAudioProcessor)psrAudioProcessor;
- (NSString)tempCacheDirectoryForMil2Bnns;
- (OSDAnalyzer)osdAnalyzer;
- (OS_dispatch_queue)modelExeQueue;
- (OS_dispatch_queue)queue;
- (SLODLDProcessor)odldModelAnalyzer;
- (id)completion;
- (int64_t)inferenceTimeSpan;
- (int64_t)totalNumberSamples;
- (unint64_t)allFramesInferenceLatency;
- (void)_onDeviceCompilationWithConfigFile:(id)a3 locale:(id)a4 modelType:(int64_t)a5;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5;
- (void)benchmarkOnDeviceCompilationCleanup:(id)a3;
- (void)novDetectAnalyzer;
- (void)pingpong:(id)a3 completion:(id)a4;
- (void)reset;
- (void)runAudioInjectionOnly:(id)a3 completion:(id)a4;
- (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6;
- (void)runNCModelWithConfig:(id)a3 completion:(id)a4;
- (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6;
- (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6;
- (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5;
- (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6;
- (void)setAllFramesInferenceLatency:(unint64_t)a3;
- (void)setAllProcessorsAsNil;
- (void)setAudioInjectionEngine:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setInferenceTimeSpan:(int64_t)a3;
- (void)setModelExeQueue:(id)a3;
- (void)setNovDetectAnalyzer:(void *)a3;
- (void)setOdldModelAnalyzer:(id)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setPsrAudioProcessor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTempCacheDirectoryForMil2Bnns:(id)a3;
- (void)setTotalNumberSamples:(int64_t)a3;
- (void)setVtSecondPassAnalyzer:(id)a3;
@end

@implementation CSModelBenchmarker

- (CSModelBenchmarker)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSModelBenchmarker;
  v2 = -[CSModelBenchmarker init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSBenchMarker Queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_totalNumberSamples = 0LL;
    v2->_inferenceTimeSpan = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 getOnDeviceCompilationCacheDirectoryForBenchmark]);
    tempCacheDirectoryForMil2Bnns = v2->_tempCacheDirectoryForMil2Bnns;
    v2->_tempCacheDirectoryForMil2Bnns = (NSString *)v6;

    v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSModelBenchmarker init]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarker init", buf, 0xCu);
    }
  }

  return v2;
}

- (void)pingpong:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    objc_super v10 = "-[CSModelBenchmarker pingpong:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }

  if (v6)
  {
    id v8 = [v5 copy];
    v6[2](v6, v8);
  }
}

- (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100078CD0;
  block[3] = &unk_10022B7D0;
  block[4] = self;
  id v20 = v10;
  id v22 = v11;
  id v23 = v13;
  id v21 = v12;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100078A04;
  block[3] = &unk_10022B7D0;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000787F0;
  v15[3] = &unk_10022E288;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000784C8;
  v16[3] = &unk_10022E288;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(queue, v16);
}

- (void)runNCModelWithConfig:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v23 = (void (**)(id, void *))a4;
  -[CSModelBenchmarker _onDeviceCompilationWithConfigFile:locale:modelType:]( self,  "_onDeviceCompilationWithConfigFile:locale:modelType:",  v6,  @"agnosticLocale",  3LL);
  id v25 = 0LL;
  id v22 = -[SLUresMitigator initWithConfig:error:]( objc_alloc(&OBJC_CLASS___SLUresMitigator),  "initWithConfig:error:",  v6,  &v25);
  id v7 = v25;
  if (v7)
  {
    -[CSModelBenchmarker reset](self, "reset");
    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSModelBenchmarker runNCModelWithConfig:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s model init error: %@", buf, 0x16u);
    }

    v36 = @"reason";
    id v9 = (SLUresMitigatorIpFeats *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription", v22));
    v37 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  2001LL,  v10));
    v23[2](v23, v11);
  }

  else
  {
    id v9 = -[SLUresMitigatorIpFeats initWithDefaults]( objc_alloc(&OBJC_CLASS___SLUresMitigatorIpFeats),  "initWithDefaults");
    -[SLUresMitigatorIpFeats setSpeechPackage:](v9, "setSpeechPackage:", 0LL);
    -[SLUresMitigatorIpFeats setInputOrigin:](v9, "setInputOrigin:", &off_100238760);
    -[SLUresMitigatorIpFeats setAcousticFTMScores:](v9, "setAcousticFTMScores:", &off_100238760);
    -[SLUresMitigatorIpFeats setBoronScore:](v9, "setBoronScore:", &off_100238760);
    -[SLUresMitigatorIpFeats setSpeakerIDScore:](v9, "setSpeakerIDScore:", &off_100238748);
    -[SLUresMitigatorIpFeats setDidDetectAttention:](v9, "setDidDetectAttention:", 1LL);
    -[SLUresMitigatorIpFeats setDidDetectAttention:](v9, "setDidDetectAttention:", 1LL);
    -[SLUresMitigatorIpFeats setDidDetectGazeAtOrb:](v9, "setDidDetectGazeAtOrb:", 1LL);
    -[SLUresMitigatorIpFeats setDidDetectVisualActivity:](v9, "setDidDetectVisualActivity:", 1LL);
    -[SLUresMitigatorIpFeats setIsAirpodsConnected:](v9, "setIsAirpodsConnected:", 0LL);
    -[SLUresMitigatorIpFeats setTimeSinceLastQuery:](v9, "setTimeSinceLastQuery:", 1.0);
    -[SLUresMitigatorIpFeats setDecisionStage:](v9, "setDecisionStage:", 1LL);
    -[SLUresMitigatorIpFeats setPrevStageOutput:](v9, "setPrevStageOutput:", 0LL);
    -[SLUresMitigatorIpFeats setEosLikelihood:](v9, "setEosLikelihood:", 0LL);
    -[SLUresMitigatorIpFeats setNldaScore:](v9, "setNldaScore:", &off_1002382B0);
    -[SLUresMitigatorIpFeats setLrnnScore:](v9, "setLrnnScore:", &off_1002382B0);
    -[SLUresMitigatorIpFeats setLrnnThreshold:](v9, "setLrnnThreshold:", &off_1002382C0);
    -[SLUresMitigatorIpFeats setEmbeddingScore:](v9, "setEmbeddingScore:", &off_1002382C0);
    -[SLUresMitigatorIpFeats setExternalLrnnScale:](v9, "setExternalLrnnScale:", &off_100238748);
    -[SLUresMitigatorIpFeats setExternalLrnnOffset:](v9, "setExternalLrnnOffset:", &off_100238760);
    uint64_t v12 = mach_absolute_time();
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v33 = sub_1000784A0;
    v34 = sub_1000784B0;
    id v35 = 0LL;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000784B8;
    v24[3] = &unk_10022B7A8;
    v24[4] = buf;
    -[SLUresMitigator processInputFeats:completion:](v22, "processInputFeats:completion:", v9, v24);
    id v13 = v6;
    uint64_t v14 = mach_absolute_time();
    os_signpost_id_t v15 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    id v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    id v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)v26 = 134349570;
      uint64_t v27 = v12;
      __int16 v28 = 2080;
      v29 = "SiriX";
      __int16 v30 = 2080;
      v31 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "allFramesProcessingLatency",  "%{public, signpost.description:begin_time}llu, %s %s",  v26,  0x20u);
    }

    id v6 = v13;
    self->_allFramesInferenceLatency += v14 - v12;
    id v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    id v19 = v18;
    if (v15 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
    {
      unint64_t v20 = self->_allFramesInferenceLatency + v12;
      *(_DWORD *)v26 = 134349570;
      uint64_t v27 = v20;
      __int16 v28 = 2080;
      v29 = "SiriX";
      __int16 v30 = 2080;
      v31 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v15,  "allFramesProcessingLatency",  "%{public, signpost.description:end_time}llu, %s %s",  v26,  0x20u);
    }

    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      -[CSModelBenchmarker reset](self, "reset");
      if (v23) {
        v23[2](v23, 0LL);
      }
    }

    else
    {
      -[CSModelBenchmarker reset](self, "reset");
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  2002LL,  0LL));
      v23[2](v23, v21);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100078218;
  block[3] = &unk_10022B7D0;
  id v22 = v12;
  id v23 = v13;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(queue, block);
}

- (void)runAudioInjectionOnly:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000780F4;
  block[3] = &unk_10022E7D0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)benchmarkOnDeviceCompilationCleanup:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  tempCacheDirectoryForMil2Bnns = self->_tempCacheDirectoryForMil2Bnns;
  id v10 = 0LL;
  [v5 removeItemAtPath:tempCacheDirectoryForMil2Bnns error:&v10];
  id v7 = v10;

  id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_tempCacheDirectoryForMil2Bnns;
    *(_DWORD *)buf = 136315650;
    id v12 = "-[CSModelBenchmarker benchmarkOnDeviceCompilationCleanup:]";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s clean up benchmark cached bnnsir directory: %@ with error: %@",  buf,  0x20u);
  }

  v4[2](v4, v7);
}

- (void)reset
{
  id completion = self->_completion;
  self->_id completion = 0LL;

  self->_allFramesInferenceLatency = 0LL;
  self->_inferenceTimeSpan = 0LL;
}

- (void)setAllProcessorsAsNil
{
  psrAudioProcessor = self->_psrAudioProcessor;
  self->_psrAudioProcessor = 0LL;

  vtSecondPassAnalyzer = self->_vtSecondPassAnalyzer;
  self->_vtSecondPassAnalyzer = 0LL;

  osdAnalyzer = self->_osdAnalyzer;
  self->_osdAnalyzer = 0LL;

  odldModelAnalyzer = self->_odldModelAnalyzer;
  self->_odldModelAnalyzer = 0LL;

  audioInjectionEngine = self->_audioInjectionEngine;
  self->_audioInjectionEngine = 0LL;

  if (self->_novDetectAnalyzer)
  {
    nd_close();
    self->_novDetectAnalyzer = 0LL;
  }

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100077E4C;
  v12[3] = &unk_10022EFD0;
  id v13 = v9;
  uint64_t v14 = self;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100077A74;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_onDeviceCompilationWithConfigFile:(id)a3 locale:(id)a4 modelType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:modelType:]( &OBJC_CLASS___CSOnDeviceCompilationUtils,  "readMilFilePathFromConfig:modelType:",  v8,  a5));
  id v11 = +[CSOnDeviceCompilationUtils getBackendTypeFromModelFile:]( &OBJC_CLASS___CSOnDeviceCompilationUtils,  "getBackendTypeFromModelFile:",  v10);
  if (v11 == (id)2)
  {
LABEL_6:
    id v14 = 0LL;
    goto LABEL_7;
  }

  if (v11 != (id)1)
  {
    __int16 v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[CSModelBenchmarker _onDeviceCompilationWithConfigFile:locale:modelType:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s No Valid backend for compilation is found for model file: %@ from config: %@",  buf,  0x20u);
    }

    goto LABEL_6;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSOnDeviceCompilationHandler sharedHandler]( &OBJC_CLASS___CSOnDeviceCompilationHandler,  "sharedHandler"));
  tempCacheDirectoryForMil2Bnns = self->_tempCacheDirectoryForMil2Bnns;
  id v16 = 0LL;
  [v12 compileUsingConfig:v8 locale:v9 compileDirectory:tempCacheDirectoryForMil2Bnns modelType:a5 errOut:&v16];
  id v14 = v16;

LABEL_7:
}

- (BOOL)_setupAudioInjectionEngineWithAudioURL:(id)a3
{
  audioInjectionEngine = self->_audioInjectionEngine;
  id v5 = a3;
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmMonoInterleavedASBD");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000778B8;
  v8[3] = &unk_10022B838;
  v8[4] = self;
  unsigned int v6 = -[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]( audioInjectionEngine,  "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:",  v5,  v9,  &stru_10022B810,  v8,  COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));

  if (v6)
  {
    -[CSAudioInjectionEngine setDelegate:](self->_audioInjectionEngine, "setDelegate:", self);
    -[CSAudioInjectionEngine start](self->_audioInjectionEngine, "start");
    -[CSAudioInjectionEngine startAudioStreamWithOption:]( self->_audioInjectionEngine,  "startAudioStreamWithOption:",  0LL);
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSSyncKeywordAnalyzerQuasar)vtSecondPassAnalyzer
{
  return self->_vtSecondPassAnalyzer;
}

- (void)setVtSecondPassAnalyzer:(id)a3
{
}

- (EARSyncPSRAudioProcessor)psrAudioProcessor
{
  return self->_psrAudioProcessor;
}

- (void)setPsrAudioProcessor:(id)a3
{
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setOsdAnalyzer:(id)a3
{
}

- (SLODLDProcessor)odldModelAnalyzer
{
  return self->_odldModelAnalyzer;
}

- (void)setOdldModelAnalyzer:(id)a3
{
}

- (void)novDetectAnalyzer
{
  return self->_novDetectAnalyzer;
}

- (void)setNovDetectAnalyzer:(void *)a3
{
  self->_novDetectAnalyzer = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (CSAudioInjectionEngine)audioInjectionEngine
{
  return self->_audioInjectionEngine;
}

- (void)setAudioInjectionEngine:(id)a3
{
}

- (OS_dispatch_queue)modelExeQueue
{
  return self->_modelExeQueue;
}

- (void)setModelExeQueue:(id)a3
{
}

- (unint64_t)allFramesInferenceLatency
{
  return self->_allFramesInferenceLatency;
}

- (void)setAllFramesInferenceLatency:(unint64_t)a3
{
  self->_allFramesInferenceLatency = a3;
}

- (int64_t)totalNumberSamples
{
  return self->_totalNumberSamples;
}

- (void)setTotalNumberSamples:(int64_t)a3
{
  self->_totalNumberSamples = a3;
}

- (int64_t)inferenceTimeSpan
{
  return self->_inferenceTimeSpan;
}

- (void)setInferenceTimeSpan:(int64_t)a3
{
  self->_inferenceTimeSpan = a3;
}

- (NSString)tempCacheDirectoryForMil2Bnns
{
  return self->_tempCacheDirectoryForMil2Bnns;
}

- (void)setTempCacheDirectoryForMil2Bnns:(id)a3
{
}

- (void).cxx_destruct
{
}

@end