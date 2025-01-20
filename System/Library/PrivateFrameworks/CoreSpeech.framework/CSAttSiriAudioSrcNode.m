@interface CSAttSiriAudioSrcNode
- (BOOL)isBuiltInRoute;
- (BOOL)isJarvisRoute;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAudioSrcNode)initWithAttSiriController:(id)a3;
- (CSAttSiriAudioSrcNode)initWithTargetQueue:(id)a3;
- (CSAttSiriAudioSrcNodeDelegate)delegate;
- (CSAttSiriController)attSiriController;
- (CSAudioTandemStream)tandemStream;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSMutableDictionary)decodersForTV;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (id)_fetchAudioDecoderForTV:(unsigned int)a3;
- (unint64_t)decoderProcessedSampleCountForTV;
- (unint64_t)type;
- (void)_handleDidAudioStartWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleDidStop;
- (void)addReceiver:(id)a3;
- (void)attachToMasterStream:(id)a3 name:(id)a4 completion:(id)a5;
- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)fetchRoutesWithCompletion:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3;
- (void)setDecodersForTV:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setTandemStream:(id)a3;
@end

@implementation CSAttSiriAudioSrcNode

- (CSAttSiriAudioSrcNode)initWithTargetQueue:(id)a3
{
  v4 = (dispatch_queue_s *)a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSAttSiriAudioSrcNode;
  v5 = -[CSAttSiriAudioSrcNode init](&v14, "init");
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("CSAttSiriAudioSrcNode Queue", 0LL, v4);
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("CSAttSiriAudioSrcNode queue", 0LL);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v5->_type = 4LL;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    receivers = v5->_receivers;
    v5->_receivers = (NSHashTable *)v8;

    v5->_isReady = 0;
    requiredNodes = v5->_requiredNodes;
    v5->_requiredNodes = 0LL;

    if (CSIsTV())
    {
      v5->_decoderProcessedSampleCountForTV = 0LL;
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      decodersForTV = v5->_decodersForTV;
      v5->_decodersForTV = (NSMutableDictionary *)v11;
    }
  }

  return v5;
}

- (CSAttSiriAudioSrcNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriAudioSrcNode initWithTargetQueue:](self, "initWithTargetQueue:", 0LL);
  dispatch_queue_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)attachToMasterStream:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000B4830;
  v22[3] = &unk_10022E650;
  id v10 = a5;
  id v23 = v10;
  uint64_t v11 = objc_retainBlock(v22);
  if (v8)
  {
    v12 = -[CSAudioTandemStream initWithMasterAudioStream:name:]( objc_alloc(&OBJC_CLASS___CSAudioTandemStream),  "initWithMasterAudioStream:name:",  v8,  v9);
    if (v12)
    {
      v13 = v12;
      objc_super v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAudioSrcNode queue](self, "queue"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000B4844;
      v19[3] = &unk_10022E7D0;
      v19[4] = self;
      v15 = v13;
      v20 = v15;
      v21 = v11;
      dispatch_async(v14, v19);
    }

    else
    {
      v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[CSAttSiriAudioSrcNode attachToMasterStream:name:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Fail to create tandemStream",  buf,  0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  960LL,  0LL));
      ((void (*)(void *, void, void *))v11[2])(v11, 0LL, v18);

      v15 = 0LL;
    }
  }

  else
  {
    v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CSAttSiriAudioSrcNode attachToMasterStream:name:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to create tendemStream due to missing master stream",  buf,  0xCu);
    }

    v15 = (CSAudioTandemStream *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    ((void (*)(void *, void, CSAudioTandemStream *))v11[2])(v11, 0LL, v15);
  }
}

- (BOOL)isBuiltInRoute
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000B4728;
  v16 = sub_1000B4738;
  id v17 = 0LL;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000B4728;
  id v10 = sub_1000B4738;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B47A8;
  block[3] = &unk_10022CCA8;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v6;
  dispatch_sync(queue, block);
  unsigned __int8 v3 = +[CSUtils isBuiltInRouteWithRecordRoute:playbackRoute:]( &OBJC_CLASS___CSUtils,  "isBuiltInRouteWithRecordRoute:playbackRoute:",  v13[5],  v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  return v3;
}

- (BOOL)isJarvisRoute
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000B4728;
  id v10 = sub_1000B4738;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B4740;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unsigned __int8 v3 = +[CSUtils isJarvisAudioRouteWithRecordRoute:]( &OBJC_CLASS___CSUtils,  "isJarvisAudioRouteWithRecordRoute:",  v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)fetchRoutesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B4680;
  v7[3] = &unk_10022EB58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B4570;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
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
  v7[2] = sub_1000B4564;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  unsigned __int8 v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAttSiriAudioSrcNode dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CSAttSiriAudioSrcNode deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAttSiriAudioSrcNode;
  -[CSAttSiriAudioSrcNode dealloc](&v4, "dealloc");
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B4478;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B4364;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B428C;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10
{
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioTimeConverterPool sharedInstance](&OBJC_CLASS___CSAudioTimeConverterPool, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 defaultConverter]);
  [v14 processSampleCount:self->_decoderProcessedSampleCountForTV hostTime:a7];

  unint64_t v15 = ((unint64_t)[v12 length] >> 2) / a10;
  id v16 = objc_alloc(&OBJC_CLASS___CSAudioChunk);
  uint64_t v17 = +[CSConfig inputRecordingSampleByteDepth](&OBJC_CLASS___CSConfig, "inputRecordingSampleByteDepth");
  unint64_t decoderProcessedSampleCountForTV = self->_decoderProcessedSampleCountForTV;
  LOBYTE(v26) = +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat");
  LOBYTE(v25) = a9;
  id v19 = [v16 initWithData:v12 numChannels:a10 numSamples:v15 sampleByteDepth:v17 startSampleCount:decoderProcessedSampleCountForTV hostTime:a7 arrivalHostTimeToAudioRecorder:a8 w asBuffered:v25 remoteVAD:0 isFloat:v26];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v20 = self->_receivers;
  id v21 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      v24 = 0LL;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)v24) attSiriAudioSrcNodeLPCMRecordBufferAvailable:self audioChunk:v19];
        v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    }

    while (v22);
  }

  self->_decoderProcessedSampleCountForTV += v15;
}

- (void)_handleDidStop
{
  unsigned __int8 v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v15 = "-[CSAttSiriAudioSrcNode _handleDidStop]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  objc_super v4 = self->_receivers;
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

- (id)_fetchAudioDecoderForTV:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  decodersForTV = self->_decodersForTV;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](decodersForTV, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    id v8 = self->_decodersForTV;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9));
LABEL_10:

    return v10;
  }

  if ((_DWORD)v3 == 1869641075)
  {
    id v11 = objc_alloc(&OBJC_CLASS___CSAudioDecoder);
    +[CSFAudioStreamBasicDescriptionFactory opusASBD](&OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory, "opusASBD");
    +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
    __int128 v12 = &v19;
    __int128 v13 = &v18;
    goto LABEL_7;
  }

  if ((_DWORD)v3 == 1936745848)
  {
    id v11 = objc_alloc(&OBJC_CLASS___CSAudioDecoder);
    +[CSFAudioStreamBasicDescriptionFactory speexASBD](&OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory, "speexASBD");
    +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
    __int128 v12 = &v21;
    __int128 v13 = (uint64_t *)&v20;
LABEL_7:
    id v10 = [v11 initWithInASBD:v12 outASBD:v13];
    __int128 v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[CSAttSiriAudioSrcNode _fetchAudioDecoderForTV:]";
      __int16 v24 = 1026;
      int v25 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Create audioDecoder for audioFormat %{public}u",  buf,  0x12u);
    }

    [v10 setDelegate:self];
    __int128 v15 = self->_decodersForTV;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v10, v9);
    goto LABEL_10;
  }

  uint64_t v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[CSAttSiriAudioSrcNode _fetchAudioDecoderForTV:]";
    __int16 v24 = 1026;
    int v25 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Unexpected audioFormat for ATV : %{public}u",  buf,  0x12u);
  }

  return 0LL;
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

- (CSAttSiriAudioSrcNodeDelegate)delegate
{
  return (CSAttSiriAudioSrcNodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
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

- (NSMutableDictionary)decodersForTV
{
  return self->_decodersForTV;
}

- (void)setDecodersForTV:(id)a3
{
}

- (unint64_t)decoderProcessedSampleCountForTV
{
  return self->_decoderProcessedSampleCountForTV;
}

- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3
{
  self->_unint64_t decoderProcessedSampleCountForTV = a3;
}

- (CSAudioTandemStream)tandemStream
{
  return self->_tandemStream;
}

- (void)setTandemStream:(id)a3
{
}

- (void).cxx_destruct
{
}

@end