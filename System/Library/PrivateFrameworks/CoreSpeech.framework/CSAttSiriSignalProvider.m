@interface CSAttSiriSignalProvider
+ (id)sharedProvider;
- (BOOL)audioRequested;
- (CSAttSiriOSDProvider)osdProvider;
- (CSAttSiriSignalProvider)init;
- (CSAudioStream)audioStream;
- (CSAudioStreamHolding)audioStreamHolding;
- (NSMapTable)observerAndOptions;
- (OS_dispatch_queue)queue;
- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3;
- (unint64_t)_observersCount;
- (void)_cancelAudioStreamHold;
- (void)_deliverSignalProviderDidStopUnexpectedly;
- (void)_holdAudioStreamWithTimeout:(double)a3;
- (void)_resetAudioStreamObserverContext;
- (void)_startAudioStreamingWithSignalOptions:(id)a3 completion:(id)a4;
- (void)_stopAllAnalyzers;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)cancelAudioStreamHoldingIfNeeded;
- (void)fetchStartSpeechWithOwnVoiceVadByProcessedAudioInMs:(double)a3 fetchOwnVoiceVADSignal:(BOOL)a4 prependAudioDuration:(double)a5 speechDetectSampleCountThreshold:(unint64_t)a6 completion:(id)a7;
- (void)osdProvider:(id)a3 silenceFramesCountMs:(double)a4 silenceProbability:(double)a5 silenceDurationMs:(double)a6 processedAudioMs:(double)a7 deviceHasBoronEnabled:(BOOL)a8 latestBoronActiveSampleCount:(int64_t)a9;
- (void)setAudioRequested:(BOOL)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setObserverAndOptions:(id)a3;
- (void)setOsdProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)startWithSignalOptions:(id)a3 observer:(id)a4 completion:(id)a5;
- (void)stopWithObserver:(id)a3 holdAudioStream:(BOOL)a4;
@end

@implementation CSAttSiriSignalProvider

- (CSAttSiriSignalProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSAttSiriSignalProvider;
  v2 = -[CSAttSiriSignalProvider init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttSiriSignalProvider Queue",  33LL));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_audioRequested = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    observerAndOptions = v2->_observerAndOptions;
    v2->_observerAndOptions = (NSMapTable *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___CSAttSiriOSDProvider);
    osdProvider = v2->_osdProvider;
    v2->_osdProvider = v7;

    -[CSAttSiriOSDProvider setDelegate:](v2->_osdProvider, "setDelegate:", v2);
  }

  return v2;
}

- (void)startWithSignalOptions:(id)a3 observer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100049CF4;
  v15[3] = &unk_10022E288;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)_startAudioStreamingWithSignalOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 audioStreamRequest]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 audioStreamRequest]);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 attendingOptions]);
    v11 = objc_alloc(&OBJC_CLASS___CSAudioRecordContext);
    id v12 = [v10 recordType];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceId]);
    id v14 = -[CSAudioRecordContext initWithRecordType:deviceId:](v11, "initWithRecordType:deviceId:", v12, v13);

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v14));
  }

  [v9 setClientIdentity:3];
  [v9 setRequestListeningMicIndicatorLock:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 recordContext]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 audioProviderWithContext:v16 error:0]);

  if (v17)
  {
    v18 = -[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]( objc_alloc(&OBJC_CLASS___CSAudioStream),  "initWithAudioStreamProvider:streamName:streamRequest:",  v17,  @"CSAttSiriAttendingAudioStream",  v9);
    audioStream = self->_audioStream;
    self->_audioStream = v18;

    -[CSAudioStream setDelegate:](self->_audioStream, "setDelegate:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 attendingOptions]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSignalProvider _startStreamOptionWithMachAbsTime:]( self,  "_startStreamOptionWithMachAbsTime:",  [v20 startAttendingHostTime]));

    v22 = self->_audioStream;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100049C0C;
    v24[3] = &unk_10022E6A0;
    v24[4] = self;
    id v25 = v7;
    -[CSAudioStream startAudioStreamWithOption:completion:](v22, "startAudioStreamWithOption:completion:", v21, v24);

LABEL_10:
    goto LABEL_11;
  }

  v23 = (os_log_s *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSAttSiriSignalProvider _startAudioStreamingWithSignalOptions:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s attSiriAudioStreamProvider is nil!",  buf,  0xCu);
  }

  -[CSAttSiriSignalProvider _resetAudioStreamObserverContext](self, "_resetAudioStreamObserverContext");
  if (v7)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  2104LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v21);
    goto LABEL_10;
  }

- (void)stopWithObserver:(id)a3 holdAudioStream:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049818;
  block[3] = &unk_10022ECA8;
  id v10 = v6;
  v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)fetchStartSpeechWithOwnVoiceVadByProcessedAudioInMs:(double)a3 fetchOwnVoiceVADSignal:(BOOL)a4 prependAudioDuration:(double)a5 speechDetectSampleCountThreshold:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100049448;
  v15[3] = &unk_10022B110;
  BOOL v20 = a4;
  double v17 = a3;
  double v18 = a5;
  unint64_t v19 = a6;
  void v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  dispatch_async(queue, v15);
}

- (void)cancelAudioStreamHoldingIfNeeded
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049440;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049380;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_deliverSignalProviderDidStopUnexpectedly
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSignalProvider observerAndOptions](self, "observerAndOptions"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 keyEnumerator]);

  uint64_t v3 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      if ((objc_opt_respondsToSelector(v4, "attSiriSignalProviderDidStopUnexpectedly") & 1) != 0) {
        [v4 attSiriSignalProviderDidStopUnexpectedly];
      }
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v6 nextObject]);

      v4 = (void *)v5;
    }

    while (v5);
  }
}

- (void)_stopAllAnalyzers
{
  osdProvider = self->_osdProvider;
  if (osdProvider) {
    -[CSAttSiriOSDProvider stopAnalysisAndReset](osdProvider, "stopAnalysisAndReset");
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000491E4;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
}

- (void)osdProvider:(id)a3 silenceFramesCountMs:(double)a4 silenceProbability:(double)a5 silenceDurationMs:(double)a6 processedAudioMs:(double)a7 deviceHasBoronEnabled:(BOOL)a8 latestBoronActiveSampleCount:(int64_t)a9
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004908C;
  block[3] = &unk_10022B158;
  void block[4] = self;
  *(double *)&void block[5] = a4;
  *(double *)&block[6] = a5;
  *(double *)&block[7] = a6;
  *(double *)&block[8] = a7;
  BOOL v11 = a8;
  block[9] = a9;
  dispatch_async(queue, block);
}

- (void)_resetAudioStreamObserverContext
{
  uint64_t v3 = (os_log_s *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSAttSiriSignalProvider _resetAudioStreamObserverContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }

  self->_audioRequested = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSignalProvider observerAndOptions](self, "observerAndOptions"));
  [v4 removeAllObjects];
}

- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
  [v4 setStartRecordingHostTime:a3];
  [v4 setRequireSingleChannelLookup:1];
  [v4 setSelectedChannel:0];
  return v4;
}

- (unint64_t)_observersCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSignalProvider observerAndOptions](self, "observerAndOptions"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyEnumerator]);

  v4 = 0LL;
  unint64_t v5 = -1LL;
  do
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 nextObject]);

    ++v5;
    v4 = (void *)v6;
  }

  while (v6);

  return v5;
}

- (void)_holdAudioStreamWithTimeout:(double)a3
{
  unint64_t v5 = (os_log_s *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    BOOL v11 = "-[CSAttSiriSignalProvider _holdAudioStreamWithTimeout:]";
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s timeout = %.2f", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [[CSAudioStreamHoldRequestOption alloc] initWithTimeout:6 clientIdentity:0 requireRecordModeLock:1 requireListeningMicIndicatorLock:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStream streamProvider](self->_audioStream, "streamProvider"));
  id v8 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue( [v7 holdAudioStreamWithDescription:@"CSAttSiriAttendingAudioStream" option:v6]);
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v8;
}

- (void)_cancelAudioStreamHold
{
  uint64_t v3 = (os_log_s *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSAttSiriSignalProvider _cancelAudioStreamHold]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStream streamProvider](self->_audioStream, "streamProvider"));
  [v4 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0LL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAttSiriOSDProvider)osdProvider
{
  return self->_osdProvider;
}

- (void)setOsdProvider:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (NSMapTable)observerAndOptions
{
  return self->_observerAndOptions;
}

- (void)setObserverAndOptions:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (BOOL)audioRequested
{
  return self->_audioRequested;
}

- (void)setAudioRequested:(BOOL)a3
{
  self->_audioRequested = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedProvider
{
  if (qword_10027FD60 != -1) {
    dispatch_once(&qword_10027FD60, &stru_10022B070);
  }
  return (id)qword_10027FD58;
}

@end