@interface CSAttSiriMagusLoggingNode
- (BOOL)didStop;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMagusLoggingNode)initWithAttSiriController:(id)a3;
- (CSAudioFileWriter)audioFileWriter;
- (CSAudioRecordContext)audioRecordContext;
- (NSArray)requiredNodes;
- (NSMutableArray)attentionSignals;
- (NSMutableArray)gazeEstimationSignals;
- (NSMutableArray)gazeStateSignals;
- (NSMutableArray)motionSignals;
- (NSMutableArray)visualSpeechEstimationSignals;
- (NSMutableArray)visualSpeechFaceLandmarks;
- (NSMutableArray)visualSpeechQuery;
- (NSString)magusLogDirectory;
- (NSString)mhId;
- (NSString)startTimestampString;
- (NSString)stopTimestampString;
- (OS_dispatch_queue)queue;
- (id)_createAudioLogPathByFileName:(id)a3;
- (id)_createJsonLogPathBySignalType:(id)a3;
- (id)_timeStampString;
- (unint64_t)activationStartSampleCount;
- (unint64_t)previousLoggedSampleCount;
- (unint64_t)startMachAbsTime;
- (unint64_t)startSampleCount;
- (unint64_t)stopMachAbsTime;
- (unint64_t)stopSampleCount;
- (unint64_t)type;
- (void)_clearAudioFileWriterIfNeed;
- (void)_handleMagusStopLogging;
- (void)_logAttentionSignals;
- (void)_logFaceLandmarks;
- (void)_logGazeDetection;
- (void)_logGazeInstaneousSignals;
- (void)_logMetadata;
- (void)_logMotionSignals;
- (void)_logVisualSpeechEstimationSignals;
- (void)_logVisualSpeechQuerySignals;
- (void)_renameAudioFileNameWithRequestMHUUID;
- (void)_setupLogDirectory;
- (void)_startAudioLogging;
- (void)_writeAudioChunk:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4;
- (void)attSiriNode:(id)a3 didUpdateMotionSignal:(id)a4;
- (void)attSiriNode:(id)a3 didUpdateVisualSpeechProbability:(double)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6;
- (void)attSiriNode:(id)a3 hadVisualSpeechSignals:(BOOL)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6;
- (void)gazeInInterval:(BOOL)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5;
- (void)gazePointUpdate:(CGPoint)a3 areaOfInterest:(CGRect)a4 gazeState:(BOOL)a5 atTime:(unint64_t)a6;
- (void)setActivationStartSampleCount:(unint64_t)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAttentionSignals:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setDidStop:(BOOL)a3;
- (void)setGazeEstimationSignals:(id)a3;
- (void)setGazeStateSignals:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMagusLogDirectory:(id)a3;
- (void)setMhId:(id)a3;
- (void)setMotionSignals:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPreviousLoggedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartMachAbsTime:(unint64_t)a3;
- (void)setStartSampleCount:(unint64_t)a3;
- (void)setStartTimestampString:(id)a3;
- (void)setStopMachAbsTime:(unint64_t)a3;
- (void)setStopSampleCount:(unint64_t)a3;
- (void)setStopTimestampString:(id)a3;
- (void)setVisualSpeechEstimationSignals:(id)a3;
- (void)setVisualSpeechFaceLandmarks:(id)a3;
- (void)setVisualSpeechQuery:(id)a3;
- (void)start;
- (void)stop;
- (void)visualSpeechLandmarkUpdate:(id)a3 time:(unint64_t)a4;
@end

@implementation CSAttSiriMagusLoggingNode

- (CSAttSiriMagusLoggingNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSAttSiriMagusLoggingNode initWithAttSiriController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSAttSiriMagusLoggingNode;
  v6 = -[CSAttSiriMagusLoggingNode init](&v11, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSAttSiriMagusLoggingNode queue", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_isReady = 0;
    requiredNodes = v6->_requiredNodes;
    v6->_type = 17LL;
    v6->_requiredNodes = (NSArray *)&off_100239230;

    objc_storeWeak((id *)&v6->_attSiriController, v4);
    v6->_didStop = 1;
    -[CSAttSiriMagusLoggingNode _setupLogDirectory](v6, "_setupLogDirectory");
  }

  return v6;
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C468;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C3A4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setAudioRecordContext:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007C374;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007C368;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007C16C;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriNode:(id)a3 didUpdateMotionSignal:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007C160;
  v8[3] = &unk_10022EFD0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)gazePointUpdate:(CGPoint)a3 areaOfInterest:(CGRect)a4 gazeState:(BOOL)a5 atTime:(unint64_t)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007BEC0;
  v7[3] = &unk_10022B888;
  BOOL v10 = a5;
  CGPoint v8 = a3;
  CGRect v9 = a4;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)gazeInInterval:(BOOL)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007BD4C;
  v6[3] = &unk_10022B8B0;
  BOOL v7 = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = self;
  dispatch_async(queue, v6);
}

- (void)visualSpeechLandmarkUpdate:(id)a3 time:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007BC84;
    block[3] = &unk_10022E7F8;
    unint64_t v13 = a4;
    id v11 = v6;
    v12 = self;
    dispatch_async(queue, block);
  }

  else
  {
    CGRect v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAttSiriMagusLoggingNode visualSpeechLandmarkUpdate:time:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s faceLandmarks are nil!", buf, 0xCu);
    }
  }
}

- (void)_setupLogDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 mhLogDirectory]);
  magusLogDirectory = self->_magusLogDirectory;
  self->_magusLogDirectory = v5;

  if ([v3 fileExistsAtPath:self->_magusLogDirectory])
  {
    id v7 = 0LL;
  }

  else
  {
    CGPoint v8 = self->_magusLogDirectory;
    id v15 = 0LL;
    unsigned __int8 v9 = [v3 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v7 = v15;
    if ((v9 & 1) == 0)
    {
      BOOL v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_magusLogDirectory;
        unint64_t v13 = v10;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v17 = "-[CSAttSiriMagusLoggingNode _setupLogDirectory]";
        __int16 v18 = 2114;
        v19 = v12;
        __int16 v20 = 2114;
        v21 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Couldn't create magus logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      id v11 = self->_magusLogDirectory;
      self->_magusLogDirectory = (NSString *)@"/tmp";
    }
  }
}

- (id)_createAudioLogPathByFileName:(id)a3
{
  magusLogDirectory = self->_magusLogDirectory;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-vad.wav", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](magusLogDirectory, "stringByAppendingPathComponent:", v4));

  return v5;
}

- (id)_createJsonLogPathBySignalType:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.json",  self->_mhId,  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_magusLogDirectory,  "stringByAppendingPathComponent:",  v4));

  return v5;
}

- (void)_handleMagusStopLogging
{
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[CSAttSiriMagusLoggingNode _timeStampString](self, "_timeStampString"));
  stopTimestampString = self->_stopTimestampString;
  self->_stopTimestampString = v3;

  self->_stopMachAbsTime = mach_absolute_time();
  -[CSAttSiriMagusLoggingNode _stopAudioLogging](self, "_stopAudioLogging");
  -[CSAttSiriMagusLoggingNode _logMotionSignals](self, "_logMotionSignals");
  -[CSAttSiriMagusLoggingNode _logMetadata](self, "_logMetadata");
  -[CSAttSiriMagusLoggingNode _logGazeInstaneousSignals](self, "_logGazeInstaneousSignals");
  -[CSAttSiriMagusLoggingNode _logGazeDetection](self, "_logGazeDetection");
  -[CSAttSiriMagusLoggingNode _logAttentionSignals](self, "_logAttentionSignals");
  -[CSAttSiriMagusLoggingNode _logVisualSpeechEstimationSignals](self, "_logVisualSpeechEstimationSignals");
  -[CSAttSiriMagusLoggingNode _logVisualSpeechQuerySignals](self, "_logVisualSpeechQuerySignals");
  -[CSAttSiriMagusLoggingNode _logFaceLandmarks](self, "_logFaceLandmarks");
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    mhId = self->_mhId;
    int v7 = 136315394;
    CGPoint v8 = "-[CSAttSiriMagusLoggingNode _handleMagusStopLogging]";
    __int16 v9 = 2112;
    BOOL v10 = mhId;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Using MHId %@ for logging",  (uint8_t *)&v7,  0x16u);
  }

- (void)_startAudioLogging
{
  v3 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createAudioLogPathByFileName:]( self,  "_createAudioLogPathByFileName:",  self->_startTimestampString));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  id v6 = -[CSPlainAudioFileWriter initWithURL:](v3, "initWithURL:", v5);
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = v6;

  self->_previousLoggedSampleCount = 0LL;
}

- (void)_writeAudioChunk:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  if ((CSIsHorseman(v5, v6) & 1) == 0
    && +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter,  "convertToShortLPCMBufFromFloatLPCMBuf:",  v7));

    id v5 = (void *)v8;
  }

  audioFileWriter = self->_audioFileWriter;
  id v10 = v5;
  -[CSAudioFileWriter addSamples:numSamples:]( audioFileWriter,  "addSamples:numSamples:",  [v10 bytes],  objc_msgSend(v4, "numSamples"));
  if (!self->_previousLoggedSampleCount)
  {
    id v11 = [v4 startSampleCount];
    self->_startSampleCount = (unint64_t)v11;
    v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      id v15 = "-[CSAttSiriMagusLoggingNode _writeAudioChunk:]";
      __int16 v16 = 2050;
      id v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s audio logging start sample count %{public}llu",  (uint8_t *)&v14,  0x16u);
    }
  }

  id v13 = [v4 startSampleCount];
  self->_previousLoggedSampleCount = (unint64_t)v13 + (void)[v4 numSamples];
}

- (void)_renameAudioFileNameWithRequestMHUUID
{
  mhId = self->_mhId;
  if (!mhId)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v6 = self->_mhId;
    self->_mhId = v5;

    int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_mhId;
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[CSAttSiriMagusLoggingNode _renameAudioFileNameWithRequestMHUUID]";
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Generated requestMHUUID for magus: %@",  buf,  0x16u);
    }

    mhId = self->_mhId;
  }

  __int16 v9 = mhId;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createAudioLogPathByFileName:]( self,  "_createAudioLogPathByFileName:",  self->_startTimestampString));
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createAudioLogPathByFileName:]( self,  "_createAudioLogPathByFileName:",  v9));
  id v18 = 0LL;
  [v10 moveItemAtPath:v11 toPath:v12 error:&v18];
  id v13 = v18;

  if (v13)
  {
    int v14 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v15 = v14;
      __int16 v16 = (NSString *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createAudioLogPathByFileName:]( self,  "_createAudioLogPathByFileName:",  v9));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[CSAttSiriMagusLoggingNode _renameAudioFileNameWithRequestMHUUID]";
      __int16 v21 = 2114;
      v22 = v16;
      __int16 v23 = 2114;
      v24 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Couldn't rename to new path %{public}@ %{public}@",  buf,  0x20u);
    }
  }
}

- (void)_clearAudioFileWriterIfNeed
{
  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    -[CSAudioFileWriter endAudio](audioFileWriter, "endAudio");
    id v4 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;

    -[CSAttSiriMagusLoggingNode _renameAudioFileNameWithRequestMHUUID](self, "_renameAudioFileNameWithRequestMHUUID");
    unint64_t previousLoggedSampleCount = self->_previousLoggedSampleCount;
    self->_stopSampleCount = previousLoggedSampleCount;
    uint64_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[CSAttSiriMagusLoggingNode _clearAudioFileWriterIfNeed]";
      __int16 v9 = 2050;
      unint64_t v10 = previousLoggedSampleCount;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s audio logging end sample count %{public}llu",  (uint8_t *)&v7,  0x16u);
    }
  }

- (void)_logMotionSignals
{
  motionSignals = self->_motionSignals;
  if (motionSignals && -[NSMutableArray count](motionSignals, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"motion"));
    id v5 = self->_motionSignals;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      id v13 = self->_motionSignals;
      self->_motionSignals = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        id v17 = "-[CSAttSiriMagusLoggingNode _logMotionSignals]";
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize motion data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (void)_logMetadata
{
  audioRecordContext = self->_audioRecordContext;
  if (audioRecordContext) {
    id v4 = -[CSAudioRecordContext type](audioRecordContext, "type");
  }
  else {
    id v4 = 0LL;
  }
  uint64_t v24 = objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"metadata"));
  v31[0] = @"audioRecordType";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRecordContext recordTypeString:](&OBJC_CLASS___CSAudioRecordContext, "recordTypeString:", v4));
  startTimestampString = self->_startTimestampString;
  stopTimestampString = self->_stopTimestampString;
  v32[0] = v5;
  v32[1] = startTimestampString;
  v31[1] = @"startTimestamp";
  v31[2] = @"stopTimestamp";
  v32[2] = stopTimestampString;
  v31[3] = @"startMachAbsTime";
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_startMachAbsTime));
  v32[3] = v8;
  v31[4] = @"stopMachAbsTime";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_stopMachAbsTime));
  v32[4] = v9;
  v31[5] = @"startSampleCount";
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_startSampleCount));
  v32[5] = v10;
  v31[6] = @"stopSampleCount";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_stopSampleCount));
  v32[6] = v11;
  v31[7] = @"activationStartSampleCount";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_activationStartSampleCount));
  v32[7] = v12;
  v31[8] = @"productType";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceProductType](&OBJC_CLASS___CSUtils, "deviceProductType"));
  v32[8] = v13;
  v31[9] = @"productVersion";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceProductVersion](&OBJC_CLASS___CSUtils, "deviceProductVersion"));
  v32[9] = v14;
  v31[10] = @"buildVersion";
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceBuildVersion](&OBJC_CLASS___CSUtils, "deviceBuildVersion"));
  v32[10] = v15;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  11LL));

  id v26 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v16,  1LL,  &v26));
  id v18 = v26;
  id v19 = v18;
  if (!v17 || v18)
  {
    __int16 v21 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSAttSiriMagusLoggingNode _logMetadata]";
      __int16 v29 = 2114;
      v30 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize metadata data with err: %{public}@",  buf,  0x16u);
    }

    __int16 v20 = (void *)v24;
  }

  else
  {
    id v25 = 0LL;
    __int16 v20 = (void *)v24;
    [v17 writeToFile:v24 options:0 error:&v25];
    id v19 = v25;
  }
}

- (id)_timeStampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

- (void)_logGazeInstaneousSignals
{
  gazeEstimationSignals = self->_gazeEstimationSignals;
  if (gazeEstimationSignals && -[NSMutableArray count](gazeEstimationSignals, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"gazeEstimationLogs"));
    id v5 = self->_gazeEstimationSignals;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      id v13 = self->_gazeEstimationSignals;
      self->_gazeEstimationSignals = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        id v17 = "-[CSAttSiriMagusLoggingNode _logGazeInstaneousSignals]";
        __int16 v18 = 2114;
        id v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize gaze estimation data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (void)_logGazeDetection
{
  gazeStateSignals = self->_gazeStateSignals;
  if (gazeStateSignals && -[NSMutableArray count](gazeStateSignals, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"gazeStateLogs"));
    id v5 = self->_gazeStateSignals;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      id v13 = self->_gazeStateSignals;
      self->_gazeStateSignals = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        id v17 = "-[CSAttSiriMagusLoggingNode _logGazeDetection]";
        __int16 v18 = 2114;
        id v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize gaze state data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (void)_logFaceLandmarks
{
  visualSpeechFaceLandmarks = self->_visualSpeechFaceLandmarks;
  if (visualSpeechFaceLandmarks && -[NSMutableArray count](visualSpeechFaceLandmarks, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"visualSpeechFaceLandmarks"));
    id v5 = self->_visualSpeechFaceLandmarks;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      id v13 = self->_visualSpeechFaceLandmarks;
      self->_visualSpeechFaceLandmarks = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        id v17 = "-[CSAttSiriMagusLoggingNode _logFaceLandmarks]";
        __int16 v18 = 2114;
        id v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize visual speech faceLandmarks data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007BBA0;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_logAttentionSignals
{
  attentionSignals = self->_attentionSignals;
  if (attentionSignals && -[NSMutableArray count](attentionSignals, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"attentionSignal"));
    id v5 = self->_attentionSignals;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      id v13 = self->_attentionSignals;
      self->_attentionSignals = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        id v17 = "-[CSAttSiriMagusLoggingNode _logAttentionSignals]";
        __int16 v18 = 2114;
        id v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize attention data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (void)attSiriNode:(id)a3 didUpdateVisualSpeechProbability:(double)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6
{
  unint64_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v14 = "-[CSAttSiriMagusLoggingNode attSiriNode:didUpdateVisualSpeechProbability:startTime:endTime:]";
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    __int16 v17 = 2048;
    unint64_t v18 = a6;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s startTs:%llu endTs:%llu probability:%f",  buf,  0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007BA60;
  v12[3] = &unk_10022B8D8;
  v12[5] = a5;
  v12[6] = a6;
  *(double *)&v12[7] = a4;
  v12[4] = self;
  dispatch_async(queue, v12);
}

- (void)attSiriNode:(id)a3 hadVisualSpeechSignals:(BOOL)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6
{
  BOOL v8 = a4;
  unint64_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v15 = "-[CSAttSiriMagusLoggingNode attSiriNode:hadVisualSpeechSignals:startTime:endTime:]";
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    __int16 v18 = 2048;
    unint64_t v19 = a6;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s startTs:%llu endTs:%llu hadSignal:%u",  buf,  0x26u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007B920;
  v12[3] = &unk_10022B8B0;
  v12[5] = a5;
  v12[6] = a6;
  BOOL v13 = v8;
  v12[4] = self;
  dispatch_async(queue, v12);
}

- (void)_logVisualSpeechEstimationSignals
{
  visualSpeechEstimationSignals = self->_visualSpeechEstimationSignals;
  if (visualSpeechEstimationSignals && -[NSMutableArray count](visualSpeechEstimationSignals, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"visualSpeechEstimationSignal"));
    id v5 = self->_visualSpeechEstimationSignals;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_visualSpeechEstimationSignals;
      self->_visualSpeechEstimationSignals = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        unint64_t v17 = "-[CSAttSiriMagusLoggingNode _logVisualSpeechEstimationSignals]";
        __int16 v18 = 2114;
        unint64_t v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize _visualSpeechEstimationSignals data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (void)_logVisualSpeechQuerySignals
{
  visualSpeechQuery = self->_visualSpeechQuery;
  if (visualSpeechQuery && -[NSMutableArray count](visualSpeechQuery, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriMagusLoggingNode _createJsonLogPathBySignalType:]( self,  "_createJsonLogPathBySignalType:",  @"visualSpeechQuerySignal"));
    id v5 = self->_visualSpeechQuery;
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v15));
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0LL;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_visualSpeechQuery;
      self->_visualSpeechQuery = 0LL;
    }

    else
    {
      id v9 = v7;
      unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        unint64_t v17 = "-[CSAttSiriMagusLoggingNode _logVisualSpeechQuerySignals]";
        __int16 v18 = 2114;
        unint64_t v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize _visualSpeechQuery data with err: %{public}@",  buf,  0x16u);
      }
    }
  }

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (void)setRequiredNodes:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (unint64_t)previousLoggedSampleCount
{
  return self->_previousLoggedSampleCount;
}

- (void)setPreviousLoggedSampleCount:(unint64_t)a3
{
  self->_unint64_t previousLoggedSampleCount = a3;
}

- (NSString)magusLogDirectory
{
  return self->_magusLogDirectory;
}

- (void)setMagusLogDirectory:(id)a3
{
}

- (NSMutableArray)motionSignals
{
  return self->_motionSignals;
}

- (void)setMotionSignals:(id)a3
{
}

- (NSMutableArray)gazeEstimationSignals
{
  return self->_gazeEstimationSignals;
}

- (void)setGazeEstimationSignals:(id)a3
{
}

- (NSMutableArray)gazeStateSignals
{
  return self->_gazeStateSignals;
}

- (void)setGazeStateSignals:(id)a3
{
}

- (NSMutableArray)attentionSignals
{
  return self->_attentionSignals;
}

- (void)setAttentionSignals:(id)a3
{
}

- (NSMutableArray)visualSpeechEstimationSignals
{
  return self->_visualSpeechEstimationSignals;
}

- (void)setVisualSpeechEstimationSignals:(id)a3
{
}

- (NSMutableArray)visualSpeechQuery
{
  return self->_visualSpeechQuery;
}

- (void)setVisualSpeechQuery:(id)a3
{
}

- (NSMutableArray)visualSpeechFaceLandmarks
{
  return self->_visualSpeechFaceLandmarks;
}

- (void)setVisualSpeechFaceLandmarks:(id)a3
{
}

- (BOOL)didStop
{
  return self->_didStop;
}

- (void)setDidStop:(BOOL)a3
{
  self->_didStop = a3;
}

- (NSString)startTimestampString
{
  return self->_startTimestampString;
}

- (void)setStartTimestampString:(id)a3
{
}

- (NSString)stopTimestampString
{
  return self->_stopTimestampString;
}

- (void)setStopTimestampString:(id)a3
{
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (void)setStartSampleCount:(unint64_t)a3
{
  self->_startSampleCount = a3;
}

- (unint64_t)stopSampleCount
{
  return self->_stopSampleCount;
}

- (void)setStopSampleCount:(unint64_t)a3
{
  self->_stopSampleCount = a3;
}

- (unint64_t)activationStartSampleCount
{
  return self->_activationStartSampleCount;
}

- (void)setActivationStartSampleCount:(unint64_t)a3
{
  self->_activationStartSampleCount = a3;
}

- (unint64_t)startMachAbsTime
{
  return self->_startMachAbsTime;
}

- (void)setStartMachAbsTime:(unint64_t)a3
{
  self->_startMachAbsTime = a3;
}

- (unint64_t)stopMachAbsTime
{
  return self->_stopMachAbsTime;
}

- (void)setStopMachAbsTime:(unint64_t)a3
{
  self->_stopMachAbsTime = a3;
}

- (void).cxx_destruct
{
}

@end