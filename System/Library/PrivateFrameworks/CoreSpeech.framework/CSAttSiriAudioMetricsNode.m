@interface CSAttSiriAudioMetricsNode
- (AudioStreamBasicDescription)_defaultASBD;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAudioMetricsNode)init;
- (CSAttSiriAudioMetricsNode)initWithAttSiriController:(id)a3;
- (CSAttSiriController)attSiriController;
- (CSAudioCircularBuffer)audioBuffer;
- (CSOSTransaction)transaction;
- (NSArray)requiredNodes;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (unint64_t)lastForwardedSampleCount;
- (unint64_t)type;
- (unsigned)numFramesPerBuffer;
- (void)_handleDidStop;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)setAttSiriController:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastForwardedSampleCount:(unint64_t)a3;
- (void)setMhId:(id)a3;
- (void)setNumFramesPerBuffer:(unsigned int)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation CSAttSiriAudioMetricsNode

- (CSAttSiriAudioMetricsNode)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSAttSiriAudioMetricsNode;
  v2 = -[CSAttSiriAudioMetricsNode init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, -2);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("CSAttSiriAudioMetricsNode Queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    +[CSConfig inputRecordingBufferDuration](&OBJC_CLASS___CSConfig, "inputRecordingBufferDuration");
    double v8 = v7;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v2->_numFramesPerBuffer = (v8 * v9);
    v2->_lastForwardedSampleCount = 0LL;
  }

  return v2;
}

- (CSAttSiriAudioMetricsNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = -[CSAttSiriAudioMetricsNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067254;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006724C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100067110;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_handleDidStop
{
  audioBuffer = self->_audioBuffer;
  if (audioBuffer)
  {
    self->_audioBuffer = 0LL;
  }

  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0LL;
  }

- (AudioStreamBasicDescription)_defaultASBD
{
  if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat")) {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmFloatASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmFloatASBD");
  }
  else {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
  }
  __int128 v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
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

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (void)setRequiredNodes:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unsigned)numFramesPerBuffer
{
  return self->_numFramesPerBuffer;
}

- (void)setNumFramesPerBuffer:(unsigned int)a3
{
  self->_numFramesPerBuffer = a3;
}

- (CSAudioCircularBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (void)setLastForwardedSampleCount:(unint64_t)a3
{
  self->_lastForwardedSampleCount = a3;
}

- (CSOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end