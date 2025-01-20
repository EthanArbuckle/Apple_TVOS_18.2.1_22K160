@interface CSAttSiriEndpointerNode
- (BOOL)_shouldSendEndpointerSignalByOperationMode;
- (BOOL)getUsesAutomaticEndpointing;
- (BOOL)isNNVAD;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriEndpointerNode)init;
- (CSAttSiriEndpointerNode)initWithAttSiriController:(id)a3;
- (CSAttSiriEndpointerNodeDelegate)delegate;
- (CSAudioRecordContext)audioRecordContext;
- (CSConnectionListener)endpointerListener;
- (CSEndpointLatencyInfo)endpointLatencyInfo;
- (CSEndpointerProxy)proxy;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (NSString)requestId;
- (OS_dispatch_queue)endpointLatencyQueue;
- (OS_dispatch_queue)queue;
- (double)postVoiceTriggerSilence;
- (id)endpointerModelVersion;
- (unint64_t)endPointAnalyzerType;
- (unint64_t)lastAudioChunkHostTime;
- (unint64_t)type;
- (void)_emitStoppedListeningForSpeechContinuationWithTrpId:(id)a3;
- (void)_reportHardEndpointToXPCClientWithTime:(double)a3 endpointerMetrics:(id)a4;
- (void)_sendEndpointEventDelegateAtTime:(double)a3 eventType:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didUpdateAnchorMachAbsTime:(unint64_t)a4 numSamplesProcessedBeforeAnchorTime:(unint64_t)a5 isAnchorTimeBuffered:(BOOL)a6 audioDeliveryHostTimeDelta:(unint64_t)a7;
- (void)attSiriNode:(id)a3 didUpdateFirstAudioPacketTimestamp:(id)a4 firstAudioSampleSensorTimestamp:(unint64_t)a5 firstAudioStartSampleCount:(unint64_t)a6;
- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6;
- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 multiUserSpeechPackage:(id)a5 topUserSpeechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8;
- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6;
- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)getEndPointAnalyzerTypeWithReply:(id)a3;
- (void)getEndpointerModelVersionWithReply:(id)a3;
- (void)getPostVoiceTriggerSilenceWithReply:(id)a3;
- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processASRFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10 fromServer:(BOOL)a11;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)processSpeechPackage:(id)a3 taskName:(id)a4;
- (void)processTaskString:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)registerEndpointerProxyAt:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6;
- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointLatencyInfo:(id)a3;
- (void)setEndpointLatencyQueue:(id)a3;
- (void)setEndpointerListener:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setIsNNVAD:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastAudioChunkHostTime:(unint64_t)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)stop;
- (void)stopEndpointer;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSAttSiriEndpointerNode

- (CSAttSiriEndpointerNode)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSAttSiriEndpointerNode;
  v2 = -[CSAttSiriEndpointerNode init](&v18, "init");
  if (v2)
  {
    v3 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CSAttSiriEndpointerNode init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }

    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttSiriEndpointerNode queue",  33LL));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, -2);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("CSAttSiriEndpointerNode Latency Queue", v7);
    endpointLatencyQueue = v2->_endpointLatencyQueue;
    v2->_endpointLatencyQueue = (OS_dispatch_queue *)v8;

    v2->_type = 1LL;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    receivers = v2->_receivers;
    v2->_receivers = (NSHashTable *)v10;

    *(_WORD *)&v2->_isReady = 0;
    unsigned int v12 = +[CSUtils supportHybridEndpointer](&OBJC_CLASS___CSUtils, "supportHybridEndpointer");
    v13 = (NSArray *)&off_1002391B8;
    requiredNodes = v2->_requiredNodes;
    if (v12) {
      v13 = (NSArray *)&off_1002391A0;
    }
    v2->_requiredNodes = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___CSEndpointerProxy);
    proxy = v2->_proxy;
    v2->_proxy = v15;

    -[CSEndpointerProxy setEndpointerDelegate:](v2->_proxy, "setEndpointerDelegate:", v2);
    -[CSEndpointerProxy setEndpointerImplDelegate:](v2->_proxy, "setEndpointerImplDelegate:", v2);
  }

  return v2;
}

- (CSAttSiriEndpointerNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriEndpointerNode init](self, "init");
  dispatch_queue_attr_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021540;
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
  v7[2] = sub_10002146C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
}

- (void)registerEndpointerProxyAt:(id)a3
{
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  -[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]( self->_proxy,  "resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:",  a3,  v10,  v11,  v12);
  self->_isNNVAD = -[CSEndpointerProxy endPointAnalyzerType](self->_proxy, "endPointAnalyzerType") == 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021288;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v14 = v10;
  id v25 = v14;
  id v15 = v11;
  id v26 = v15;
  dispatch_async(queue, block);
  endpointLatencyQueue = (dispatch_queue_s *)self->_endpointLatencyQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000212DC;
  v20[3] = &unk_10022E368;
  v20[4] = self;
  id v21 = v15;
  id v22 = v14;
  id v23 = v12;
  id v17 = v12;
  id v18 = v14;
  id v19 = v15;
  dispatch_async(endpointLatencyQueue, v20);
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
}

- (void)setActiveChannel:(unint64_t)a3
{
}

- (void)stopEndpointer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021278;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
}

- (id)endpointerModelVersion
{
  return -[CSEndpointerProxy endpointerModelVersion](self->_proxy, "endpointerModelVersion");
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
}

- (void)updateEndpointerThreshold:(float)a3
{
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
}

- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4
{
}

- (void)setStartWaitTime:(double)a3
{
}

- (void)setEndWaitTime:(double)a3
{
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
}

- (BOOL)getUsesAutomaticEndpointing
{
  return (char *)-[CSEndpointerProxy fetchCurrentEndpointerOperationMode]( self->_proxy,  "fetchCurrentEndpointerOperationMode")
       - 3 < (char *)2;
}

- (BOOL)_shouldSendEndpointerSignalByOperationMode
{
  unint64_t v2 = -[CSEndpointerProxy fetchCurrentEndpointerOperationMode](self->_proxy, "fetchCurrentEndpointerOperationMode");
  return (v2 < 5) & (0x19u >> v2);
}

- (double)postVoiceTriggerSilence
{
  return result;
}

- (unint64_t)endPointAnalyzerType
{
  return -[CSEndpointerProxy endPointAnalyzerType](self->_proxy, "endPointAnalyzerType");
}

- (void)getEndpointerModelVersionWithReply:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSEndpointerProxy endpointerModelVersion](proxy, "endpointerModelVersion"));
  (*((void (**)(id, void, id))a3 + 2))(v5, 0LL, v6);
}

- (void)getPostVoiceTriggerSilenceWithReply:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  -[CSEndpointerProxy postVoiceTriggerSilence](proxy, "postVoiceTriggerSilence");
  (*((void (**)(id, void))a3 + 2))(v5, 0LL);
}

- (void)getEndPointAnalyzerTypeWithReply:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  (*((void (**)(id, void, unint64_t))a3 + 2))( v5,  0LL,  -[CSEndpointerProxy endPointAnalyzerType](proxy, "endPointAnalyzerType"));
}

- (void)processASRFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10 fromServer:(BOOL)a11
{
  BOOL v11 = a11;
  id v20 = a8;
  id v21 = a6;
  id v22 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:]( objc_alloc(&OBJC_CLASS___CSASRFeatures),  "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDu rationInMilliseconds:acousticEndpointerScore:",  a3,  a4,  v21,  v20,  a9,  a5,  a7,  a10);

  -[CSEndpointerProxy processASRFeatures:fromServer:](self->_proxy, "processASRFeatures:fromServer:", v22, v11);
}

- (void)processTaskString:(id)a3
{
}

- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11
{
  BOOL v12 = a10;
  id v20 = a8;
  id v21 = a6;
  id v22 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:]( objc_alloc(&OBJC_CLASS___CSASRFeatures),  "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDu rationInMilliseconds:acousticEndpointerScore:",  a3,  a4,  v21,  v20,  a9,  a5,  a7,  a11);

  -[CSEndpointerProxy processASRFeatures:fromServer:](self->_proxy, "processASRFeatures:fromServer:", v22, v12);
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8
{
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 multiUserSpeechPackage:(id)a5 topUserSpeechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
}

- (void)processSpeechPackage:(id)a3 taskName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___CSASRFeatures);
  id v9 = [v7 numOneBestTokensExcludingTriggerPhrase];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 endOfSentenceLikelihood]);
  [v10 doubleValue];
  double v12 = v11;
  +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenEndTimeFromSpeechPackage:",  v7);
  double v14 = v13;

  id v15 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:]( v8,  "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDu rationInMilliseconds:acousticEndpointerScore:",  v9,  50LL,  0LL,  v6,  (uint64_t)(v14 * 1000.0),  v12,  0.0,  0.0);
  -[CSEndpointerProxy processRCFeatures:](self->_proxy, "processRCFeatures:", v15);
}

- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6
{
  if (!self->_isNNVAD) {
    -[CSEndpointerProxy processOSDFeatures:withFrameDurationMs:withMHID:]( self->_proxy,  "processOSDFeatures:withFrameDurationMs:withMHID:",  a4,  a6,  a5);
  }
}

- (void)attSiriNode:(id)a3 didUpdateFirstAudioPacketTimestamp:(id)a4 firstAudioSampleSensorTimestamp:(unint64_t)a5 firstAudioStartSampleCount:(unint64_t)a6
{
  if (!self->_isNNVAD) {
    -[CSEndpointerProxy processFirstAudioPacketTimestamp:firstAudioSampleSensorTimestamp:]( self->_proxy,  "processFirstAudioPacketTimestamp:firstAudioSampleSensorTimestamp:",  a4,  a5);
  }
}

- (void)attSiriNode:(id)a3 didUpdateAnchorMachAbsTime:(unint64_t)a4 numSamplesProcessedBeforeAnchorTime:(unint64_t)a5 isAnchorTimeBuffered:(BOOL)a6 audioDeliveryHostTimeDelta:(unint64_t)a7
{
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  if (self->_isNNVAD) {
    -[CSEndpointerProxy processAudioSamplesAsynchronously:](self->_proxy, "processAudioSamplesAsynchronously:", v5);
  }
  endpointLatencyQueue = (dispatch_queue_s *)self->_endpointLatencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000211DC;
  block[3] = &unk_10022EFD0;
  id v7 = v5;
  id v13 = v7;
  double v14 = self;
  dispatch_async(endpointLatencyQueue, block);
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002124C;
  v10[3] = &unk_10022EFD0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  endpointLatencyQueue = (dispatch_queue_s *)self->_endpointLatencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000211A8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(endpointLatencyQueue, block);
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  id v7 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021198;
  block[3] = &unk_10022E7F8;
  double v12 = a4;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6
{
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000210D8;
  v12[3] = &unk_10022C3E8;
  id v13 = v9;
  double v14 = self;
  int64_t v15 = a6;
  double v16 = a4;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100020F3C;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_reportHardEndpointToXPCClientWithTime:(double)a3 endpointerMetrics:(id)a4
{
  id v6 = a4;
  id v7 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriEndpointerNode endpointerListener](self, "endpointerListener"));
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSAttSiriEndpointerNode _reportHardEndpointToXPCClientWithTime:endpointerMetrics:]";
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s endpointerListener: %@", buf, 0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v6 metricsCopyWithRequestId:self->_requestId lastAudioChunkHostTime:self->_lastAudioChunkHostTime]);
  if ((objc_opt_respondsToSelector(self->_endpointerListener, "notifyClientsWithBlock:") & 1) != 0)
  {
    endpointerListener = self->_endpointerListener;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100020F2C;
    v23[3] = &unk_10022ED40;
    double v25 = a3;
    id v24 = v10;
    -[CSConnectionListener notifyClientsWithBlock:](endpointerListener, "notifyClientsWithBlock:", v23);
  }

  BOOL v12 = -[CSAttSiriEndpointerNode getUsesAutomaticEndpointing](self, "getUsesAutomaticEndpointing");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriEndpointerNode delegate](self, "delegate"));
  [v13 attSiriNode:self didDetectHardEndpointAtTime:v6 withMetrics:v12 usesAutomaticEndPointing:a3];

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriEndpointerNode receivers](self, "receivers", 0LL));
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) attSiriNode:self didDetectHardEndpointAtTime:v6 withMetrics:v12 usesAutomaticEndPointing:a3];
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }

    while (v16);
  }
}

- (void)_sendEndpointEventDelegateAtTime:(double)a3 eventType:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  BOOL v9 = -[CSAttSiriEndpointerNode _shouldSendEndpointerSignalByOperationMode]( self,  "_shouldSendEndpointerSignalByOperationMode");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector( v12,  "attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:");

    if ((v13 & 1) != 0)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriEndpointerNode delegate](self, "delegate"));
      [v14 attSiriNode:self didDetectEndpointEventAtTime:a4 eventType:v8 withMetrics:v9 useEndpointerSignal:a3];
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriEndpointerNode receivers](self, "receivers", 0LL));
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      __int128 v19 = 0LL;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        __int128 v20 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v19);
        if (v20
          && (objc_opt_respondsToSelector( *(void *)(*((void *)&v21 + 1) + 8LL * (void)v19),  "attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:") & 1) != 0)
        {
          [v20 attSiriNode:self didDetectEndpointEventAtTime:a4 eventType:v8 withMetrics:v9 useEndpointerSignal:a3];
        }

        __int128 v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v17);
  }
}

- (void)_emitStoppedListeningForSpeechContinuationWithTrpId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020D0C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100020C5C;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
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

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSConnectionListener)endpointerListener
{
  return self->_endpointerListener;
}

- (void)setEndpointerListener:(id)a3
{
}

- (CSAttSiriEndpointerNodeDelegate)delegate
{
  return (CSAttSiriEndpointerNodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (CSEndpointerProxy)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)endpointLatencyQueue
{
  return self->_endpointLatencyQueue;
}

- (void)setEndpointLatencyQueue:(id)a3
{
}

- (BOOL)isNNVAD
{
  return self->_isNNVAD;
}

- (void)setIsNNVAD:(BOOL)a3
{
  self->_isNNVAD = a3;
}

- (CSEndpointLatencyInfo)endpointLatencyInfo
{
  return self->_endpointLatencyInfo;
}

- (void)setEndpointLatencyInfo:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (unint64_t)lastAudioChunkHostTime
{
  return self->_lastAudioChunkHostTime;
}

- (void)setLastAudioChunkHostTime:(unint64_t)a3
{
  self->_lastAudioChunkHostTime = a3;
}

- (void).cxx_destruct
{
}

@end