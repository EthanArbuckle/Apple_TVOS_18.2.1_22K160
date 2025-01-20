@interface CSAttSiriSpeechDetectionNode
- (BOOL)canActivate;
- (BOOL)didActivate;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriSpeechDetectionNode)init;
- (CSAttSiriSpeechDetectionNode)initWithAttSiriController:(id)a3;
- (CSAttSiriSpeechDetectionNodeDelegate)delegate;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (double)firstSpeechFrameAudioTsInMs;
- (unint64_t)startDetectionTime;
- (unint64_t)type;
- (void)_startActivation;
- (void)addReceiver:(id)a3;
- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6;
- (void)registerOSDNode:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setCanActivate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setFirstSpeechFrameAudioTsInMs:(double)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartDetectionTime:(unint64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation CSAttSiriSpeechDetectionNode

- (CSAttSiriSpeechDetectionNode)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSAttSiriSpeechDetectionNode;
  v2 = -[CSAttSiriSpeechDetectionNode init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttSiriSpeechDetectionNode queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_type = 13LL;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    receivers = v2->_receivers;
    v2->_receivers = (NSHashTable *)v5;

    v2->_isReady = 0;
    requiredNodes = v2->_requiredNodes;
    v2->_requiredNodes = (NSArray *)&off_1002391E8;
  }

  return v2;
}

- (CSAttSiriSpeechDetectionNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CSAttSiriSpeechDetectionNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_receivers, "containsObject:", v4))
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CSAttSiriSpeechDetectionNodeDelegate])
    {
      -[NSHashTable addObject:](self->_receivers, "addObject:", v4);
    }

    else
    {
      uint64_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        v7 = "-[CSAttSiriSpeechDetectionNode addReceiver:]";
        __int16 v8 = 2112;
        id v9 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Unsupported receiver: %@",  (uint8_t *)&v6,  0x16u);
      }
    }
  }
}

- (void)removeReceiver:(id)a3
{
}

- (void)registerOSDNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D394;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D370;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D364;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002D1B0;
  v10[3] = &unk_10022EFD0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)_startActivation
{
  if (!self->_didActivate)
  {
    self->_didActivate = 1;
    if ((self->_firstSpeechFrameAudioTsInMs + -700.0) / 1000.0 >= 0.0) {
      double v3 = (self->_firstSpeechFrameAudioTsInMs + -700.0) / 1000.0;
    }
    else {
      double v3 = 0.0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_osdNode);
    double v5 = (double)(unint64_t)[WeakRetained audioStartSampleCount];
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    unint64_t v7 = (unint64_t)(v5 + v3 * v6);

    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[CSAttSiriSpeechDetectionNode _startActivation]";
      __int16 v17 = 2048;
      unint64_t v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s startPtAbsSampleId: %llu",  (uint8_t *)&v15,  0x16u);
    }

    uint64_t v9 = CSMachAbsoluteTimeAddTimeInterval( -[CSAttSiriSpeechDetectionNode startDetectionTime](self, "startDetectionTime"),  v3);
    v10 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      unint64_t v12 = -[CSAttSiriSpeechDetectionNode startDetectionTime](self, "startDetectionTime");
      int v15 = 136315650;
      v16 = "-[CSAttSiriSpeechDetectionNode _startActivation]";
      __int16 v17 = 2048;
      unint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s audio started at %llu, speech started at: %llu",  (uint8_t *)&v15,  0x20u);
    }

    v13 = objc_alloc_init(&OBJC_CLASS___CSAttSiriAttendingTriggerEventInfo);
    -[CSAttSiriAttendingTriggerEventInfo setTriggerMachTime:](v13, "setTriggerMachTime:", v9);
    -[CSAttSiriAttendingTriggerEventInfo setTriggerAbsStartSampleId:](v13, "setTriggerAbsStartSampleId:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechDetectionNode delegate](self, "delegate"));
    [v14 attSiriNode:self didDetectSpeechWithTriggerInfo:v13];
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

- (void)setMhId:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAttSiriSpeechDetectionNodeDelegate)delegate
{
  return (CSAttSiriSpeechDetectionNodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)startDetectionTime
{
  return self->_startDetectionTime;
}

- (void)setStartDetectionTime:(unint64_t)a3
{
  self->_startDetectionTime = a3;
}

- (CSAttSiriOSDNode)osdNode
{
  return (CSAttSiriOSDNode *)objc_loadWeakRetained((id *)&self->_osdNode);
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

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (BOOL)canActivate
{
  return self->_canActivate;
}

- (void)setCanActivate:(BOOL)a3
{
  self->_canActivate = a3;
}

- (double)firstSpeechFrameAudioTsInMs
{
  return self->_firstSpeechFrameAudioTsInMs;
}

- (void)setFirstSpeechFrameAudioTsInMs:(double)a3
{
  self->_firstSpeechFrameAudioTsInMs = a3;
}

- (void).cxx_destruct
{
}

@end