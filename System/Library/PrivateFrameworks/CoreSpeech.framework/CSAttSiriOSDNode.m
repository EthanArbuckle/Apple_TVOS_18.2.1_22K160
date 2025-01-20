@interface CSAttSiriOSDNode
- (BOOL)didAddAudio;
- (BOOL)didTimestampFirstAudioPacket;
- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4;
- (BOOL)isReady;
- (CSAsset)currentAsset;
- (CSAsset)lipMovementVADAsset;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriOSDNode)init;
- (CSAttSiriOSDNode)initWithAttSiriController:(id)a3;
- (CSPlainAudioFileWriter)audioFileWriter;
- (NSArray)requiredNodes;
- (NSDate)firstAudioPacketTimestamp;
- (NSHashTable)receivers;
- (NSMutableArray)lipMovementSignalDataArray;
- (NSString)configFile;
- (NSString)mhId;
- (OSDAnalyzer)osdAnalyzer;
- (OS_dispatch_queue)apQueue;
- (OS_dispatch_queue)osdQueue;
- (OS_dispatch_queue)queue;
- (double)firstAudioSampleSensorTimestamp;
- (double)frameDurationMs;
- (id)_getSerialQueue:(id)a3 targetQueue:(id)a4;
- (unint64_t)audioStartSampleCount;
- (unint64_t)countOfConsecutiveBoron;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)fetchLastKnownConsecutiveBoronStartSampleCount;
- (unint64_t)firstAudioStartSampleCount;
- (unint64_t)lastKnownConsecutiveBoronStartSampleCount;
- (unint64_t)numOfChunksReceived;
- (unint64_t)numOfConsecutiveBoronActivationThreshold;
- (unint64_t)numSamplesProcessed;
- (unint64_t)osdMode;
- (unint64_t)type;
- (unint64_t)vtEndInSampleCount;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 faceTrackingDataUpdate:(id)a4 atMachAbsTime:(unint64_t)a5;
- (void)checkConsecutiveBoronSignalWithAudioChunk:(id)a3;
- (void)endpointerAssetManagerDidUpdateOSDAsset:(id)a3;
- (void)osdAnalyzer:(id)a3 didDetectEndOfSpeechAt:(double)a4;
- (void)osdAnalyzer:(id)a3 didDetectStartOfSpeechAt:(double)a4;
- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4;
- (void)removeReceiver:(id)a3;
- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5;
- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5 osdMode:(unint64_t)a6;
- (void)setApQueue:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setConfigFile:(id)a3;
- (void)setCountOfConsecutiveBoron:(unint64_t)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDidAddAudio:(BOOL)a3;
- (void)setDidTimestampFirstAudioPacket:(BOOL)a3;
- (void)setFirstAudioPacketTimestamp:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setFirstAudioStartSampleCount:(unint64_t)a3;
- (void)setFrameDurationMs:(double)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastKnownConsecutiveBoronStartSampleCount:(unint64_t)a3;
- (void)setLipMovementSignalDataArray:(id)a3;
- (void)setLipMovementVADAsset:(id)a3;
- (void)setMhId:(id)a3;
- (void)setNumOfChunksReceived:(unint64_t)a3;
- (void)setNumOfConsecutiveBoronActivationThreshold:(unint64_t)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setOsdMode:(unint64_t)a3;
- (void)setOsdQueue:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)stop;
@end

@implementation CSAttSiriOSDNode

- (CSAttSiriOSDNode)init
{
  if (+[CSUtils supportHybridEndpointer](&OBJC_CLASS___CSUtils, "supportHybridEndpointer"))
  {
    v41.receiver = self;
    v41.super_class = (Class)&OBJC_CLASS___CSAttSiriOSDNode;
    v3 = -[CSAttSiriOSDNode init](&v41, "init");
    v4 = v3;
    if (v3)
    {
      v3->_type = 0LL;
      unsigned int v5 = +[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported");
      v6 = (NSArray *)&off_100239260;
      requiredNodes = v4->_requiredNodes;
      if (v5) {
        v6 = (NSArray *)&off_100239248;
      }
      v4->_requiredNodes = v6;

      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      receivers = v4->_receivers;
      v4->_receivers = (NSHashTable *)v8;

      v4->_isReady = 0;
      v11 = 0LL;
      if ((+[CSUtils supportsDispatchWorkloop](&OBJC_CLASS___CSUtils, "supportsDispatchWorkloop") & 1) == 0) {
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils rootQueueWithFixedPriority:]( &OBJC_CLASS___CSUtils,  "rootQueueWithFixedPriority:",  kCSDefaultSerialQueueFixedPriority));
      }
      id v12 = objc_msgSend((id)objc_opt_class(v4, v10), "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.queue",  v14));

      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CSAttSiriOSDNode _getSerialQueue:targetQueue:](v4, "_getSerialQueue:targetQueue:", v15, v11));
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v16;

      id v19 = objc_msgSend((id)objc_opt_class(v4, v18), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lowercaseString]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.osdQueue",  v21));

      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CSAttSiriOSDNode _getSerialQueue:targetQueue:](v4, "_getSerialQueue:targetQueue:", v22, v11));
      osdQueue = v4->_osdQueue;
      v4->_osdQueue = (OS_dispatch_queue *)v23;

      id v26 = objc_msgSend((id)objc_opt_class(v4, v25), "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lowercaseString]);
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.apQueue",  v28));

      uint64_t v30 = objc_claimAutoreleasedReturnValue(-[CSAttSiriOSDNode _getSerialQueue:targetQueue:](v4, "_getSerialQueue:targetQueue:", v29, v11));
      apQueue = v4->_apQueue;
      v4->_apQueue = (OS_dispatch_queue *)v30;

      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      v4->_currentRequestSampleRate = (unint64_t)v32;
      v4->_vtEndInSampleCount = 0LL;
      v4->_numOfConsecutiveBoronActivationThreshold = 5LL;
      v33 = (dispatch_queue_s *)v4->_apQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000AB568;
      block[3] = &unk_10022F100;
      v34 = v4;
      v40 = v34;
      dispatch_async(v33, block);
      uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      lipMovementSignalDataArray = v34->_lipMovementSignalDataArray;
      v34->_lipMovementSignalDataArray = (NSMutableArray *)v35;
    }

    self = v4;
    v37 = self;
  }

  else
  {
    v37 = 0LL;
  }

  return v37;
}

- (CSAttSiriOSDNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[CSAttSiriOSDNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (id)_getSerialQueue:(id)a3 targetQueue:(id)a4
{
  unsigned int v5 = (dispatch_queue_s *)a4;
  if (v5) {
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2( (const char *)[a3 UTF8String], 0, v5);
  }
  else {
    dispatch_queue_t v6 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  a3,  kCSDefaultSerialQueueFixedPriority));
  }
  dispatch_queue_t v7 = v6;

  return v7;
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AB3E4;
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
  v7[2] = sub_1000AB310;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
  apQueue = (dispatch_queue_s *)self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AB25C;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AB198;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  v20[3] = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA9B8;
  block[3] = &unk_10022D958;
  id v19 = v20;
  void block[4] = self;
  id v9 = v7;
  id v18 = v9;
  dispatch_async_and_wait(queue, block);
  apQueue = (dispatch_queue_s *)self->_apQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000AAB54;
  v13[3] = &unk_10022F088;
  v13[4] = self;
  id v14 = v9;
  id v15 = v6;
  uint64_t v16 = v20;
  id v11 = v6;
  id v12 = v9;
  dispatch_async(apQueue, v13);

  _Block_object_dispose(v20, 8);
}

- (void)checkConsecutiveBoronSignalWithAudioChunk:(id)a3
{
  id v4 = a3;
  id v5 = objc_claimAutoreleasedReturnValue([v4 remoteVAD]);
  id v6 = [v5 bytes];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteVAD]);
  int v8 = [v7 length];

  if (v8 >= 1)
  {
    uint64_t v10 = 0LL;
    *(void *)&__int128 v9 = 136315394LL;
    __int128 v18 = v9;
    do
    {
      if (v6[v10]) {
        id v11 = (char *)-[CSAttSiriOSDNode countOfConsecutiveBoron](self, "countOfConsecutiveBoron") + 1;
      }
      else {
        id v11 = 0LL;
      }
      -[CSAttSiriOSDNode setCountOfConsecutiveBoron:](self, "setCountOfConsecutiveBoron:", v11, v18);
      unint64_t v12 = -[CSAttSiriOSDNode countOfConsecutiveBoron](self, "countOfConsecutiveBoron");
      if (v12 >= -[CSAttSiriOSDNode numOfConsecutiveBoronActivationThreshold]( self,  "numOfConsecutiveBoronActivationThreshold"))
      {
        -[CSAttSiriOSDNode setLastKnownConsecutiveBoronStartSampleCount:]( self,  "setLastKnownConsecutiveBoronStartSampleCount:",  [v4 startSampleCount]);
        v13 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
        {
          id v14 = v13;
          unint64_t v15 = -[CSAttSiriOSDNode lastKnownConsecutiveBoronStartSampleCount]( self,  "lastKnownConsecutiveBoronStartSampleCount");
          *(_DWORD *)buf = v18;
          v20 = "-[CSAttSiriOSDNode checkConsecutiveBoronSignalWithAudioChunk:]";
          __int16 v21 = 2048;
          unint64_t v22 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s update lastKnownConsecutiveBoronStartSampleCount to: %llu",  buf,  0x16u);
        }
      }

      ++v10;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteVAD]);
      signed int v17 = [v16 length];
    }

    while (v10 < v17);
  }
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  apQueue = (dispatch_queue_s *)self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA894;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5
{
}

- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5 osdMode:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  apQueue = (dispatch_queue_s *)self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA328;
  block[3] = &unk_10022E7F8;
  v24 = self;
  unint64_t v25 = a6;
  id v23 = v11;
  id v14 = v11;
  dispatch_async(apQueue, block);
  queue = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000AA798;
  v18[3] = &unk_10022EA98;
  id v19 = v10;
  id v20 = v12;
  __int16 v21 = self;
  id v16 = v12;
  id v17 = v10;
  dispatch_async_and_wait(queue, v18);
}

- (unint64_t)audioStartSampleCount
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AA314;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)fetchLastKnownConsecutiveBoronStartSampleCount
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  apQueue = (dispatch_queue_s *)self->_apQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AA300;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(apQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)endpointerAssetManagerDidUpdateOSDAsset:(id)a3
{
  id v4 = a3;
  apQueue = (dispatch_queue_s *)self->_apQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AA2F8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(apQueue, v7);
}

- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v9 = [v8 isEndpointEnhancedLoggingEnabled];

  if (v9)
  {
    id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "-[CSAttSiriOSDNode osdAnalyzer:didUpdateOSDFeatures:]";
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s %@ %@", buf, 0x20u);
    }
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000AA1D0;
  v13[3] = &unk_10022EFD0;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_async(queue, v13);
}

- (void)osdAnalyzer:(id)a3 didDetectStartOfSpeechAt:(double)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AA0AC;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)osdAnalyzer:(id)a3 didDetectEndOfSpeechAt:(double)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A9F88;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)attSiriNode:(id)a3 faceTrackingDataUpdate:(id)a4 atMachAbsTime:(unint64_t)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A9F48;
  block[3] = &unk_10022E7F8;
  void block[4] = self;
  id v11 = v7;
  unint64_t v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0;
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A9F3C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
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

- (NSString)mhId
{
  return self->_mhId;
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
}

- (OS_dispatch_queue)apQueue
{
  return self->_apQueue;
}

- (void)setApQueue:(id)a3
{
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numOfChunksReceived
{
  return self->_numOfChunksReceived;
}

- (void)setNumOfChunksReceived:(unint64_t)a3
{
  self->_numOfChunksReceived = a3;
}

- (BOOL)didAddAudio
{
  return self->_didAddAudio;
}

- (void)setDidAddAudio:(BOOL)a3
{
  self->_didAddAudio = a3;
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setOsdAnalyzer:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setConfigFile:(id)a3
{
  self->_configFile = (NSString *)a3;
}

- (NSDate)firstAudioPacketTimestamp
{
  return self->_firstAudioPacketTimestamp;
}

- (void)setFirstAudioPacketTimestamp:(id)a3
{
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (unint64_t)firstAudioStartSampleCount
{
  return self->_firstAudioStartSampleCount;
}

- (void)setFirstAudioStartSampleCount:(unint64_t)a3
{
  self->_firstAudioStartSampleCount = a3;
}

- (BOOL)didTimestampFirstAudioPacket
{
  return self->_didTimestampFirstAudioPacket;
}

- (void)setDidTimestampFirstAudioPacket:(BOOL)a3
{
  self->_didTimestampFirstAudioPacket = a3;
}

- (double)frameDurationMs
{
  return self->_frameDurationMs;
}

- (void)setFrameDurationMs:(double)a3
{
  self->_frameDurationMs = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)osdQueue
{
  return self->_osdQueue;
}

- (void)setOsdQueue:(id)a3
{
}

- (unint64_t)countOfConsecutiveBoron
{
  return self->_countOfConsecutiveBoron;
}

- (void)setCountOfConsecutiveBoron:(unint64_t)a3
{
  self->_countOfConsecutiveBoron = a3;
}

- (unint64_t)lastKnownConsecutiveBoronStartSampleCount
{
  return self->_lastKnownConsecutiveBoronStartSampleCount;
}

- (void)setLastKnownConsecutiveBoronStartSampleCount:(unint64_t)a3
{
  self->_lastKnownConsecutiveBoronStartSampleCount = a3;
}

- (unint64_t)numOfConsecutiveBoronActivationThreshold
{
  return self->_numOfConsecutiveBoronActivationThreshold;
}

- (void)setNumOfConsecutiveBoronActivationThreshold:(unint64_t)a3
{
  self->_numOfConsecutiveBoronActivationThreshold = a3;
}

- (unint64_t)osdMode
{
  return self->_osdMode;
}

- (void)setOsdMode:(unint64_t)a3
{
  self->_osdMode = a3;
}

- (CSAsset)lipMovementVADAsset
{
  return self->_lipMovementVADAsset;
}

- (void)setLipMovementVADAsset:(id)a3
{
}

- (NSMutableArray)lipMovementSignalDataArray
{
  return self->_lipMovementSignalDataArray;
}

- (void)setLipMovementSignalDataArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end