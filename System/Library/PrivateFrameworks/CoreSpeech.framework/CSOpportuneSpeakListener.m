@interface CSOpportuneSpeakListener
- (BOOL)_popRemoteVADSignal;
- (BOOL)_shouldReportBoron;
- (BOOL)isMediaPlayingNow;
- (CSAudioRecordContext)latestContext;
- (CSAudioSessionProviding)audioSessionProvider;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioStreamProvider;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSOpportuneSpeakListener)init;
- (CSOpportuneSpeakListenerDelegate)delegate;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSPGEndpointAnalyzer)spgEndpointAnalyzer;
- (NSMutableArray)remoteVADAlignBuffer;
- (OS_dispatch_queue)alignBufferQueue;
- (int)remoteVADSPGRatio;
- (unint64_t)remoteVADAlignCount;
- (unint64_t)runningSampleCount;
- (void)_addRemoteVADSignal:(BOOL)a3;
- (void)_resetAlignBuffer;
- (void)_startRequestWithCompletion:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)setAlignBufferQueue:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioSessionProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvider:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMediaPlayingNow:(BOOL)a3;
- (void)setLatestContext:(id)a3;
- (void)setRemoteVADAlignBuffer:(id)a3;
- (void)setRemoteVADAlignCount:(unint64_t)a3;
- (void)setRemoteVADSPGRatio:(int)a3;
- (void)setRunningSampleCount:(unint64_t)a3;
- (void)setSpgEndpointAnalyzer:(id)a3;
- (void)spgEndpointAnalyzer:(id)a3 hasSilenceScoreEstimate:(double)a4 clientProcessedAudioTimeMS:(float)a5;
- (void)startListenWithOption:(id)a3 completion:(id)a4;
- (void)stopListenWithCompletion:(id)a3;
- (void)stopListenWithStateReset:(BOOL)a3 completion:(id)a4;
@end

@implementation CSOpportuneSpeakListener

- (CSOpportuneSpeakListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSOpportuneSpeakListener;
  v2 = -[CSOpportuneSpeakListener init](&v13, "init");
  if (v2)
  {
    if (!+[CSUtils supportOpportuneSpeakListener](&OBJC_CLASS___CSUtils, "supportOpportuneSpeakListener"))
    {
      v11 = 0LL;
      goto LABEL_6;
    }

    dispatch_queue_t v3 = dispatch_queue_create("RemoteVAD Align Queue", 0LL);
    alignBufferQueue = v2->_alignBufferQueue;
    v2->_alignBufferQueue = (OS_dispatch_queue *)v3;

    v5 = -[CSSPGEndpointAnalyzer initWithAnalyzeMode]( objc_alloc(&OBJC_CLASS___CSSPGEndpointAnalyzer),  "initWithAnalyzeMode");
    spgEndpointAnalyzer = v2->_spgEndpointAnalyzer;
    v2->_spgEndpointAnalyzer = v5;

    -[CSSPGEndpointAnalyzer setDelegate:](v2->_spgEndpointAnalyzer, "setDelegate:", v2);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    remoteVADAlignBuffer = v2->_remoteVADAlignBuffer;
    v2->_remoteVADAlignBuffer = (NSMutableArray *)v7;

    v2->_remoteVADAlignCount = 0LL;
    v2->_runningSampleCount = 0LL;
    v9 = objc_alloc_init(&OBJC_CLASS___CSAudioTimeConverter);
    audioTimeConverter = v2->_audioTimeConverter;
    v2->_audioTimeConverter = v9;
  }

  v11 = v2;
LABEL_6:

  return v11;
}

- (void)startListenWithOption:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10006A30C;
  v33[3] = &unk_10022E650;
  id v7 = a4;
  id v34 = v7;
  v8 = objc_retainBlock(v33);
  v9 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSOpportuneSpeakListener startListenWithOption:completion:]";
    __int16 v37 = 2114;
    v38 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Start Listening request with deviceId : %{public}@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v13 = [v12 opportuneSpeakingFileLoggingIsEnabled];

  if (v13)
  {
    +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedWithRemoteVADASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmNonInterleavedWithRemoteVADASBD");
    +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedWithRemoteVADASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInterleavedWithRemoteVADASBD");
    v14 = (CSPlainAudioFileWriter *)objc_claimAutoreleasedReturnValue( +[CSAudioFileManager createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:outputFormat:]( &OBJC_CLASS___CSAudioFileManager,  "createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:outputFormat:",  v32,  v31));
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v14;
  }

  else
  {
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakListenerDeviceManager sharedManager]( &OBJC_CLASS___CSOpportuneSpeakListenerDeviceManager,  "sharedManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
    [v17 setDeviceId:v18];

    v19 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
    v20 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForHearstVoiceTriggerWithDeviceId:",  v19));
    latestContext = self->_latestContext;
    self->_latestContext = v20;
  }

  else
  {
    if ([v6 opportuneSpeakListeningType])
    {
      if ([v6 opportuneSpeakListeningType] != (id)1) {
        goto LABEL_14;
      }
      v22 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForOpportuneSpeakerListenerWithCall]( &OBJC_CLASS___CSAudioRecordContext,  "contextForOpportuneSpeakerListenerWithCall"));
    }

    else
    {
      v22 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForOpportuneSpeakerListener]( &OBJC_CLASS___CSAudioRecordContext,  "contextForOpportuneSpeakerListener"));
    }

    v19 = self->_latestContext;
    self->_latestContext = v22;
  }

LABEL_14:
  alignBufferQueue = (dispatch_queue_s *)self->_alignBufferQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A320;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(alignBufferQueue, block);
  v24 = -[CSXPCClient initWithType:](objc_alloc(&OBJC_CLASS___CSXPCClient), "initWithType:", 1LL);
  -[CSXPCClient connect](v24, "connect");
  v25 = self->_latestContext;
  id v29 = 0LL;
  unsigned __int8 v26 = -[CSXPCClient prepareAudioProviderWithContext:clientType:error:]( v24,  "prepareAudioProviderWithContext:clientType:error:",  v25,  2LL,  &v29);
  id v27 = v29;
  if ((v26 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_audioStreamProvider, v24);
    objc_storeStrong((id *)&self->_audioSessionProvider, v24);
    if (self->_audioStreamProvider)
    {
      -[CSOpportuneSpeakListener _startRequestWithCompletion:](self, "_startRequestWithCompletion:", v8);
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1004LL,  0LL));
      ((void (*)(void *, void, void *))v8[2])(v8, 0LL, v28);
    }
  }

  else
  {
    ((void (*)(void *, void, id))v8[2])(v8, 0LL, v27);
  }
}

- (void)_resetAlignBuffer
{
  self->_remoteVADAlignCount = 0LL;
}

- (void)_startRequestWithCompletion:(id)a3
{
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10006A138;
  v28[3] = &unk_10022E650;
  id v4 = a3;
  id v29 = v4;
  v5 = objc_retainBlock(v28);
  if (self->_audioStreamProvider)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  self->_latestContext));
    [v6 setRequiresHistoricalBuffer:1];
    audioStreamProvider = self->_audioStreamProvider;
    v9 = (objc_class *)objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v27 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioStreamProviding audioStreamWithRequest:streamName:error:]( audioStreamProvider,  "audioStreamWithRequest:streamName:error:",  v6,  v11,  &v27));
    id v13 = v27;

    if (v12)
    {
      -[CSOpportuneSpeakListener setAudioStream:](self, "setAudioStream:", v12);
      [v12 setDelegate:self];
      -[CSSPGEndpointAnalyzer start](self->_spgEndpointAnalyzer, "start");
      if (-[CSSPGEndpointAnalyzer getFrameDurationMs](self->_spgEndpointAnalyzer, "getFrameDurationMs") >= 1)
      {
        +[CSConfig remoteVADDuration](&OBJC_CLASS___CSConfig, "remoteVADDuration");
        self->_int remoteVADSPGRatio = (int)(float)((float)(v14 * 1000.0)
                                              / (float)-[CSSPGEndpointAnalyzer getFrameDurationMs]( self->_spgEndpointAnalyzer,  "getFrameDurationMs"));
        v15 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          +[CSConfig remoteVADDuration](&OBJC_CLASS___CSConfig, "remoteVADDuration");
          int v18 = (int)(float)(v17 * 1000.0);
          unsigned int v19 = -[CSSPGEndpointAnalyzer getFrameDurationMs]( self->_spgEndpointAnalyzer,  "getFrameDurationMs");
          int remoteVADSPGRatio = self->_remoteVADSPGRatio;
          *(_DWORD *)buf = 136315906;
          v31 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]";
          __int16 v32 = 1026;
          *(_DWORD *)v33 = v18;
          *(_WORD *)&void v33[4] = 1026;
          *(_DWORD *)&v33[6] = v19;
          __int16 v34 = 1026;
          int v35 = remoteVADSPGRatio;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s remoteVADDuration = %{public}d, spgDuration = %{public}d, _int remoteVADSPGRatio = %{public}d",  buf,  0x1Eu);
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10006A250;
      v25[3] = &unk_10022E6A0;
      v25[4] = self;
      unsigned __int8 v26 = v5;
      [v12 startAudioStreamWithOption:v21 completion:v25];
    }

    else
    {
      v22 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v31 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]";
        __int16 v32 = 2114;
        *(void *)v33 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s AudioStreamRequest has failed : %{public}@",  buf,  0x16u);
      }

      ((void (*)(void *, void, id))v5[2])(v5, 0LL, v13);
    }
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1004LL,  0LL));
    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v13);
  }
}

- (void)stopListenWithStateReset:(BOOL)a3 completion:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100069FAC;
  v13[3] = &unk_10022E6A0;
  v13[4] = self;
  id v5 = a4;
  id v14 = v5;
  id v6 = objc_retainBlock(v13);
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSOpportuneSpeakListener stopListenWithStateReset:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Request stop CSOpportuneSpeakListener",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSOpportuneSpeakListener audioStream](self, "audioStream"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSOpportuneSpeakListener audioStream](self, "audioStream"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006A0D8;
    v11[3] = &unk_10022E6A0;
    v11[4] = self;
    v12 = v6;
    [v9 stopAudioStreamWithOption:0 completion:v11];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1003LL,  0LL));
    ((void (*)(void *, void, void *))v6[2])(v6, 0LL, v10);
  }
}

- (void)stopListenWithCompletion:(id)a3
{
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "opportuneSpeakListener:didStopUnexpectedly:");

  if ((v6 & 1) != 0)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 opportuneSpeakListener:self didStopUnexpectedly:1];
  }

  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  id v6 = [v5 numSamples];
  audioTimeConverter = self->_audioTimeConverter;
  unint64_t v8 = (unint64_t)v6 + self->_runningSampleCount;
  self->_runningSampleCount = v8;
  -[CSAudioTimeConverter processSampleCount:hostTime:]( audioTimeConverter,  "processSampleCount:hostTime:",  v8,  [v5 hostTime]);
  spgEndpointAnalyzer = self->_spgEndpointAnalyzer;
  v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "dataForChannel:",  +[CSConfig channelForProcessedInput](CSConfig, "channelForProcessedInput")));
  -[CSSPGEndpointAnalyzer addAudio:numSamples:]( spgEndpointAnalyzer,  "addAudio:numSamples:",  v10,  [v5 numSamples]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteVAD]);
  if (v11)
  {
    id v12 = objc_claimAutoreleasedReturnValue([v5 remoteVAD]);
    id v13 = (unsigned __int8 *)[v12 bytes];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteVAD]);
    int v15 = [v14 length];

    if (v15 >= 1)
    {
      uint64_t v16 = 0LL;
      do
      {
        int v17 = v13[v16];
        int v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
        unsigned __int8 v19 = [v18 opportuneSpeakListenerBypassEnabled];

        alignBufferQueue = (dispatch_queue_s *)self->_alignBufferQueue;
        if (v17) {
          char v21 = 1;
        }
        else {
          char v21 = v19;
        }
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100069F9C;
        v32[3] = &unk_10022EFA8;
        v32[4] = self;
        char v33 = v21;
        dispatch_async(alignBufferQueue, v32);
        ++v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteVAD]);
        signed int v23 = [v22 length];
      }

      while (v16 < v23);
    }

    if (self->_audioFileWriter)
    {
      +[CSConfig remoteVADDuration](&OBJC_CLASS___CSConfig, "remoteVADDuration");
      float v25 = v24;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      unint64_t v27 = (unint64_t)(float)(v25 * v26);
      LODWORD(v28) = 1176256512;
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 dataWithRemoteVADWithScaleFactor:v27 numAudioSamplesPerRemoteVAD:v28]);
      v30 = v29;
      if (v29)
      {
        -[CSPlainAudioFileWriter addSamples:numSamples:]( self->_audioFileWriter, "addSamples:numSamples:", [v29 bytes], objc_msgSend(v5, "numSamples"));
      }

      else
      {
        v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          int v35 = "-[CSOpportuneSpeakListener audioStreamProvider:audioBufferAvailable:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Audio coming from DoAP should contains RemoteVAD",  buf,  0xCu);
        }
      }
    }
  }
}

- (void)_addRemoteVADSignal:(BOOL)a3
{
  if (self->_remoteVADSPGRatio >= 1)
  {
    BOOL v3 = a3;
    int v5 = 0;
    do
    {
      remoteVADAlignBuffer = self->_remoteVADAlignBuffer;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
      -[NSMutableArray addObject:](remoteVADAlignBuffer, "addObject:", v7);

      ++v5;
    }

    while (v5 < self->_remoteVADSPGRatio);
  }

- (BOOL)_popRemoteVADSignal
{
  id v3 = -[NSMutableArray count](self->_remoteVADAlignBuffer, "count");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_remoteVADAlignBuffer, "objectAtIndex:", 0LL));
    unsigned __int8 v5 = [v4 BOOLValue];

    -[NSMutableArray removeObjectAtIndex:](self->_remoteVADAlignBuffer, "removeObjectAtIndex:", 0LL);
    LOBYTE(v3) = v5;
  }

  return (char)v3;
}

- (BOOL)_shouldReportBoron
{
  unint64_t remoteVADAlignCount = self->_remoteVADAlignCount;
  self->_unint64_t remoteVADAlignCount = remoteVADAlignCount + 1;
  return remoteVADAlignCount & (-[CSAudioRecordContext type](self->_latestContext, "type") != (id)19);
}

- (void)spgEndpointAnalyzer:(id)a3 hasSilenceScoreEstimate:(double)a4 clientProcessedAudioTimeMS:(float)a5
{
  id v8 = a3;
  uint64_t v32 = 0LL;
  char v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  alignBufferQueue = (dispatch_queue_s *)self->_alignBufferQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069F58;
  block[3] = &unk_10022CCA8;
  block[4] = self;
  void block[5] = &v32;
  block[6] = &v28;
  dispatch_sync(alignBufferQueue, block);
  if (*((_BYTE *)v33 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector(WeakRetained, "opportuneSpeakListener:hasRemoteVADAvailable:");

    if ((v11 & 1) != 0)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 opportuneSpeakListener:self hasRemoteVADAvailable:*((unsigned __int8 *)v29 + 24)];
    }
  }

  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  id v14 = -[CSAudioTimeConverter hostTimeFromSampleCount:]( self->_audioTimeConverter,  "hostTimeFromSampleCount:",  (unint64_t)(float)((float)(v13 / 1000.0) * a5));
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v16 = [v15 opportuneSpeakListenerBypassEnabled];

  id v17 = objc_loadWeakRetained((id *)&self->_delegate);
  char v18 = objc_opt_respondsToSelector(v17, "opportuneSpeakListener:hasVADAvailable:withHostTime:");

  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  id v21 = v19;
  uint64_t v22 = (a4 <= 0.150000006) | v16;
  if ((v18 & 1) != 0)
  {
    *(float *)&double v20 = (float)(unint64_t)v14;
    [v19 opportuneSpeakListener:self hasVADAvailable:v22 withHostTime:v20];
  }

  else
  {
    char v23 = objc_opt_respondsToSelector(v19, "opportuneSpeakListener:hasVADAvailable:");

    if ((v23 & 1) == 0) {
      goto LABEL_9;
    }
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    [v21 opportuneSpeakListener:self hasVADAvailable:v22];
  }

LABEL_9:
  float v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = *((unsigned __int8 *)v29 + 24);
    int v26 = *((unsigned __int8 *)v33 + 24);
    *(_DWORD *)buf = 136315906;
    __int16 v37 = "-[CSOpportuneSpeakListener spgEndpointAnalyzer:hasSilenceScoreEstimate:clientProcessedAudioTimeMS:]";
    __int16 v38 = 1026;
    int v39 = v25;
    __int16 v40 = 1026;
    int v41 = v26;
    __int16 v42 = 2050;
    double v43 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s boronScore : %{public}d, reportBoron : %{public}d, slienceScore : %{public}lf",  buf,  0x22u);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

- (CSOpportuneSpeakListenerDelegate)delegate
{
  return (CSOpportuneSpeakListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (CSSPGEndpointAnalyzer)spgEndpointAnalyzer
{
  return self->_spgEndpointAnalyzer;
}

- (void)setSpgEndpointAnalyzer:(id)a3
{
}

- (int)remoteVADSPGRatio
{
  return self->_remoteVADSPGRatio;
}

- (void)setRemoteVADSPGRatio:(int)a3
{
  self->_int remoteVADSPGRatio = a3;
}

- (CSAudioStreamProviding)audioStreamProvider
{
  return self->_audioStreamProvider;
}

- (void)setAudioStreamProvider:(id)a3
{
}

- (CSAudioSessionProviding)audioSessionProvider
{
  return self->_audioSessionProvider;
}

- (void)setAudioSessionProvider:(id)a3
{
}

- (CSAudioRecordContext)latestContext
{
  return self->_latestContext;
}

- (void)setLatestContext:(id)a3
{
}

- (BOOL)isMediaPlayingNow
{
  return self->_isMediaPlayingNow;
}

- (void)setIsMediaPlayingNow:(BOOL)a3
{
  self->_isMediaPlayingNow = a3;
}

- (NSMutableArray)remoteVADAlignBuffer
{
  return self->_remoteVADAlignBuffer;
}

- (void)setRemoteVADAlignBuffer:(id)a3
{
}

- (unint64_t)remoteVADAlignCount
{
  return self->_remoteVADAlignCount;
}

- (void)setRemoteVADAlignCount:(unint64_t)a3
{
  self->_unint64_t remoteVADAlignCount = a3;
}

- (OS_dispatch_queue)alignBufferQueue
{
  return self->_alignBufferQueue;
}

- (void)setAlignBufferQueue:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (unint64_t)runningSampleCount
{
  return self->_runningSampleCount;
}

- (void)setRunningSampleCount:(unint64_t)a3
{
  self->_runningSampleCount = a3;
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end