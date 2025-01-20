@interface CSAttSiriAttendingAudioSrcNode
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAttendingAudioSrcNode)initWithAttSiriController:(id)a3;
- (CSAttSiriAttendingAudioSrcNode)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5;
- (CSAttSiriAttendingAudioSrcNode)initWithSpeechManager:(id)a3 audioStreamProvider:(id)a4 streamName:(id)a5 streamRequest:(id)a6;
- (CSAttSiriController)attSiriController;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSSpeechManager)speechManager;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (unint64_t)type;
- (void)_handleDidAudioStartWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleDidStop;
- (void)_handleDidStopStreamUnexpectedly;
- (void)addReceiver:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)cancelAudioStreamHold;
- (void)dealloc;
- (void)holdAudioStreamWithTimeout:(double)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4;
- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4;
@end

@implementation CSAttSiriAttendingAudioSrcNode

- (CSAttSiriAttendingAudioSrcNode)initWithAttSiriController:(id)a3
{
  v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSAttSiriAttendingAudioSrcNode initWithAttSiriController:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

  return 0LL;
}

- (CSAttSiriAttendingAudioSrcNode)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5
{
  return -[CSAttSiriAttendingAudioSrcNode initWithSpeechManager:audioStreamProvider:streamName:streamRequest:]( self,  "initWithSpeechManager:audioStreamProvider:streamName:streamRequest:",  0LL,  a3,  a4,  a5);
}

- (CSAttSiriAttendingAudioSrcNode)initWithSpeechManager:(id)a3 audioStreamProvider:(id)a4 streamName:(id)a5 streamRequest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CSAttSiriAttendingAudioSrcNode;
  v13 = -[CSAttSiriAttendingAudioSrcNode init](&v31, "init");
  if (v13)
  {
    v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create("CSAttSiriAttendingAudioSrcNode Attending queue", 0LL);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v14->_type = 5LL;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    receivers = v14->_receivers;
    v14->_receivers = (NSHashTable *)v17;

    v14->_isReady = 0;
    requiredNodes = v14->_requiredNodes;
    v14->_requiredNodes = 0LL;

    p_speechManager = (void **)&v14->_speechManager;
    objc_storeStrong((id *)&v14->_speechManager, a3);
    if (!v14->_speechManager)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
      v22 = *p_speechManager;
      *p_speechManager = (void *)v21;
    }

    id v23 = v11;
    if (v23) {
      goto LABEL_8;
    }
    v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSAttSiriAttendingAudioSrcNode initWithSpeechManager:audioStreamProvider:streamName:streamRequest:]";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s audioStreamProvider is nil, fetch audioProvider from context",  buf,  0xCu);
    }

    v25 = *p_speechManager;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 recordContext]);
    id v23 = (id)objc_claimAutoreleasedReturnValue([v25 audioProviderWithContext:v26 error:0]);

    if (v23)
    {
LABEL_8:
      v30.receiver = v14;
      v30.super_class = (Class)&OBJC_CLASS___CSAttSiriAttendingAudioSrcNode;
      v14 =  -[CSAttSiriAttendingAudioSrcNode initWithAudioStreamProvider:streamName:streamRequest:]( &v30,  "initWithAudioStreamProvider:streamName:streamRequest:",  v23,  @"CSAttSiriAttendingAudioSrcNode",  v12);

      v27 = v14;
    }

    else
    {
      v29 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CSAttSiriAttendingAudioSrcNode initWithSpeechManager:audioStreamProvider:streamName:streamRequest:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s attSiriAudioStreamProvider is nil!",  buf,  0xCu);
      }

      v27 = 0LL;
    }
  }

  else
  {
    v27 = 0LL;
  }

  return v27;
}

- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4
{
  v7[1] = 3221225472LL;
  v7[2] = sub_100016814;
  v7[3] = &unk_10022E6A0;
  v8 = self;
  id v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___CSAttSiriAttendingAudioSrcNode;
  v7[0] = _NSConcreteStackBlock;
  id v5 = v9;
  -[CSAttSiriAttendingAudioSrcNode startAudioStreamWithOption:completion:]( &v6,  "startAudioStreamWithOption:completion:",  a3,  v7);
}

- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4
{
  v7[1] = 3221225472LL;
  v7[2] = sub_100016724;
  v7[3] = &unk_10022E6A0;
  v8 = self;
  id v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___CSAttSiriAttendingAudioSrcNode;
  v7[0] = _NSConcreteStackBlock;
  id v5 = v9;
  -[CSAttSiriAttendingAudioSrcNode stopAudioStreamWithOption:completion:]( &v6,  "stopAudioStreamWithOption:completion:",  a3,  v7);
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:]( &OBJC_CLASS___CSAudioStreamHoldRequestOption,  "defaultOptionWithTimeout:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAttendingAudioSrcNode streamProvider](self, "streamProvider"));
  id v5 = [v4 holdAudioStreamWithDescription:@"CSAttSiriAttendingAudioSrcNode" option:v6];
}

- (void)cancelAudioStreamHold
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAttendingAudioSrcNode streamProvider](self, "streamProvider"));
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0LL;
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001660C;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000165F8;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAttSiriAttendingAudioSrcNode dealloc]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s CSAttSiriAttendingAudioSrcNode deallocated",  buf,  0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAttSiriAttendingAudioSrcNode;
  -[CSAttSiriAttendingAudioSrcNode dealloc](&v4, "dealloc");
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016548;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001642C;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[CSAudioPowerProvider sharedInstance](&OBJC_CLASS___CSAudioPowerProvider, "sharedInstance"));
  [v5 processAudioChunkForTV:v4];
}

- (void)_handleDidStop
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v15 = "-[CSAttSiriAttendingAudioSrcNode _handleDidStop]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = self->_receivers;
  id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "attSiriAudioSrcNodeDidStop:", self, (void)v9);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }
}

- (void)_handleDidStopStreamUnexpectedly
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAttendingAudioSrcNode delegate](self, "delegate"));
  [v3 attSiriAttendingAudioSrcNodeDidStopUnexpectedly:self];

  -[CSAttSiriAttendingAudioSrcNode _handleDidStop](self, "_handleDidStop");
}

- (void)_handleDidAudioStartWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v7 = self->_receivers;
  id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "attSiriAudioSrcNodeDidStartRecording:successfully:error:",  self,  v4,  v6,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
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

- (void)setMhId:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (void).cxx_destruct
{
}

@end