@interface CSIntuitiveConvRequestHandler
- (BOOL)_isRequestIdCurrent:(id)a3;
- (BOOL)audioSessionMonitoringInProgress;
- (BOOL)isPromptRequestImpending;
- (BOOL)supportTCU;
- (CSAsset)mitigationAsset;
- (CSAsset)vtAsset;
- (CSAttSiriAFTMNode)aFTMNode;
- (CSAttSiriAssetDownloadPromptIOS)downloadPrompter;
- (CSAttSiriAudioCoordinator)audioCoordinator;
- (CSAttSiriAudioMetricsNode)audioMetricsNode;
- (CSAttSiriAudioSrcNode)audioSrcNode;
- (CSAttSiriBridgeMessageHandler)bridgeMessageHandler;
- (CSAttSiriContinuityEndDetector)continuityEndDetector;
- (CSAttSiriEagerMitigator)eagerMitigator;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriMagusSupportedPolicy)magusSupportedPolicy;
- (CSAttSiriNLDAClassifierNode)nldaClassifierNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriRCHandler)rcHandler;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSpeechRecognitionNode)speechRecognitionNode;
- (CSAttSiriTCUGenerator)tcuGenerator;
- (CSAttSiriUresNode)uresNode;
- (CSAttendingHintProviding)hintProvider;
- (CSAttendingStatesMessageHandling)attendingStatesMessageHandler;
- (CSAudioRecordContext)audioRecordContext;
- (CSAudioSessionInfoProvider)audioSessionInfoProvider;
- (CSAudioStream)siriClientStream;
- (CSEndpointDetectedSelfLogger)endpointDetectedSelfLogger;
- (CSIntuitiveConvAudioCaptureMonitor)intuitiveConvAudioCaptureMonitor;
- (CSIntuitiveConvRequestHandler)init;
- (CSIntuitiveConvRequestHandler)initWithAudioSrcNode:(id)a3 endpointerNode:(id)a4 osdNode:(id)a5 ssrNode:(id)a6 speechRecognitionNode:(id)a7 uresNode:(id)a8 needsSSRNode:(BOOL)a9 aFtmNode:(id)a10 speechManager:(id)a11 siriEnabledMonitor:(id)a12 siriClientBehaviorMonitor:(id)a13 intuitiveConvAudioCaptureMonitor:(id)a14 rcHandler:(id)a15 tcuGenerator:(id)a16 continuityEndDetector:(id)a17 bridgeMessageHandler:(id)a18 audioCoordinator:(id)a19 magusSupportedPolicy:(id)a20 supportsAcousticProgressiveChecker:(BOOL)a21 supportsUnderstandingOnDevice:(BOOL)a22 requireASROnDevice:(BOOL)a23 supportsHybridUnderstandingOnDevice:(BOOL)a24 supportsLogger:(BOOL)a25 supportTCU:(BOOL)a26 audioSessionInfoProvider:(id)a27;
- (CSIntuitiveConvRequestHandlerDelegate)requestHandlerDelegate;
- (CSIntuitiveConversationLogger)signalsLogger;
- (CSOSTransaction)attSiriTransaction;
- (CSSiriAudioMessageRequestHandler)audioMessageRequestHandler;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSiriEnabledMonitor)siriEnabledMonitor;
- (CSSpeechManager)speechManager;
- (NSMapTable)nodesCache;
- (NSString)currentRequestId;
- (NSString)dismissedRequestId;
- (NSString)recordingEventUUIDToIgnore;
- (NSString)requestMHUUID;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueueForASR;
- (id)_createRequestLinkInfo:(id)a3 component:(int)a4;
- (id)_recordContextForContinuousConversation;
- (id)_startStreamOption;
- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3;
- (id)fetchRecordingEventUUIDToIgnore;
- (id)getAsrProxyObj;
- (id)getAudioMessageServiceProxyObj;
- (id)getEndpointerProxyObj;
- (id)getRcHandlerProxyObj;
- (id)getSsrProxyObj;
- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_attendingDismissalAndBlockHelper;
- (void)_configureAllNodes;
- (void)_fetchMitigationAssets;
- (void)_fetchRequiredAssetsForRecordContext:(id)a3;
- (void)_fetchVoiceTriggerAssets;
- (void)_generateStartAttendingHint:(id)a3 attendingDecision:(BOOL)a4;
- (void)_handleClientDidStartStreamWithOption:(id)a3 successfully:(BOOL)a4;
- (void)_handleClientDidStopWithOption:(id)a3;
- (void)_handleClientPreparedAudioStream:(id)a3 successfully:(BOOL)a4;
- (void)_handleClientWillStartStreamWithContext:(id)a3 option:(id)a4;
- (void)_handleClientWillStopStreamWithReason:(unint64_t)a3 stopStreamOption:(id)a4;
- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5;
- (void)_handleStopProcessingForRequestId:(id)a3;
- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3;
- (void)_startMonitoringAudioSession;
- (void)_stopMonitoringAudioSession;
- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attendingXpcDisconnection;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)dismissAttendingRequested;
- (void)emitRequestLinkEventForMHUUID:(id)a3 withRequestId:(id)a4;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 fetchedAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStartAudioCaptureWithContext:(id)a4 option:(id)a5;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStopAudioCaptureReason:(unint64_t)a4;
- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5;
- (void)setAFTMNode:(id)a3;
- (void)setAttSiriTransaction:(id)a3;
- (void)setAttendingStatesMessageHandler:(id)a3;
- (void)setAudioCoordinator:(id)a3;
- (void)setAudioMessageRequestHandler:(id)a3;
- (void)setAudioMetricsNode:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAudioSessionInfoProvider:(id)a3;
- (void)setAudioSessionMonitoringInProgress:(BOOL)a3;
- (void)setAudioSrcNode:(id)a3;
- (void)setBridgeMessageHandler:(id)a3;
- (void)setContinuityEndDetector:(id)a3;
- (void)setCurrentRequestId:(id)a3;
- (void)setDismissedRequestId:(id)a3;
- (void)setDownloadPrompter:(id)a3;
- (void)setEagerMitigator:(id)a3;
- (void)setEndpointDetectedSelfLogger:(id)a3;
- (void)setEndpointerNode:(id)a3;
- (void)setHintProvider:(id)a3;
- (void)setIntuitiveConvAudioCaptureMonitor:(id)a3;
- (void)setIsPromptRequestImpending:(BOOL)a3;
- (void)setMagusSupportedPolicy:(id)a3;
- (void)setMitigationAsset:(id)a3;
- (void)setNldaClassifierNode:(id)a3;
- (void)setNodesCache:(id)a3;
- (void)setOsdNode:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRcHandler:(id)a3;
- (void)setRecordingEventUUIDToIgnore:(id)a3;
- (void)setRequestHandlerDelegate:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setSignalsLogger:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSiriClientStream:(id)a3;
- (void)setSiriEnabledMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSpeechRecognitionNode:(id)a3;
- (void)setSsrNode:(id)a3;
- (void)setSupportTCU:(BOOL)a3;
- (void)setTargetQueueForASR:(id)a3;
- (void)setTcuGenerator:(id)a3;
- (void)setUresNode:(id)a3;
- (void)setVtAsset:(id)a3;
- (void)setup;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5 withEventUUID:(id)a6;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5 withEventUUID:(id)a6;
- (void)siriPromptWillStart;
- (void)siriUIDismissed;
- (void)start;
@end

@implementation CSIntuitiveConvRequestHandler

- (CSIntuitiveConvRequestHandler)init
{
  uint64_t v3 = CSIsCommunalDevice(self, a2);
  if ((v3 & 1) != 0 || (CSIsIOS(v3, v4) & 1) != 0) {
    char v5 = 1;
  }
  else {
    char v5 = CSIsMac();
  }
  unsigned __int8 v6 = +[CSUtils supportAcousticProgressiveChecker]( &OBJC_CLASS___CSUtils,  "supportAcousticProgressiveChecker");
  unsigned __int8 v7 = +[CSUtils supportsUnderstandingOnDevice](&OBJC_CLASS___CSUtils, "supportsUnderstandingOnDevice");
  unsigned __int8 v8 = +[CSUtils supportsSpeechRecognitionOnDevice]( &OBJC_CLASS___CSUtils,  "supportsSpeechRecognitionOnDevice");
  unsigned __int8 v9 = +[CSUtils supportsHybridUnderstandingOnDevice]( &OBJC_CLASS___CSUtils,  "supportsHybridUnderstandingOnDevice");
  unsigned __int8 v10 = +[CSUtils supportsLogger](&OBJC_CLASS___CSUtils, "supportsLogger");
  BYTE5(v13) = +[CSUtils isTCUSupported](&OBJC_CLASS___CSUtils, "isTCUSupported");
  BYTE4(v13) = v10;
  BYTE3(v13) = v9;
  BYTE2(v13) = v8;
  BYTE1(v13) = v7;
  LOBYTE(v13) = v6;
  LOBYTE(v12) = v5;
  return -[CSIntuitiveConvRequestHandler initWithAudioSrcNode:endpointerNode:osdNode:ssrNode:speechRecognitionNode:uresNode:needsSSRNode:aFtmNode:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:intuitiveConvAudioCaptureMonitor:rcHandler:tcuGenerator:continuityEndDetector:bridgeMessageHandler:audioCoordinator:magusSupportedPolicy:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:supportsLogger:supportTCU:audioSessionInfoProvider:]( self,  "initWithAudioSrcNode:endpointerNode:osdNode:ssrNode:speechRecognitionNode:uresNode:needsSSRNode:aFtmNode:spee chManager:siriEnabledMonitor:siriClientBehaviorMonitor:intuitiveConvAudioCaptureMonitor:rcHandler:tcuGenerato r:continuityEndDetector:bridgeMessageHandler:audioCoordinator:magusSupportedPolicy:supportsAcousticProgressiv eChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:supportsLogger: supportTCU:audioSessionInfoProvider:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v12,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v13,  0LL);
}

- (CSIntuitiveConvRequestHandler)initWithAudioSrcNode:(id)a3 endpointerNode:(id)a4 osdNode:(id)a5 ssrNode:(id)a6 speechRecognitionNode:(id)a7 uresNode:(id)a8 needsSSRNode:(BOOL)a9 aFtmNode:(id)a10 speechManager:(id)a11 siriEnabledMonitor:(id)a12 siriClientBehaviorMonitor:(id)a13 intuitiveConvAudioCaptureMonitor:(id)a14 rcHandler:(id)a15 tcuGenerator:(id)a16 continuityEndDetector:(id)a17 bridgeMessageHandler:(id)a18 audioCoordinator:(id)a19 magusSupportedPolicy:(id)a20 supportsAcousticProgressiveChecker:(BOOL)a21 supportsUnderstandingOnDevice:(BOOL)a22 requireASROnDevice:(BOOL)a23 supportsHybridUnderstandingOnDevice:(BOOL)a24 supportsLogger:(BOOL)a25 supportTCU:(BOOL)a26 audioSessionInfoProvider:(id)a27
{
  id v32 = a3;
  id v33 = a4;
  id v105 = a5;
  id v99 = a6;
  id v98 = a7;
  id v97 = a8;
  id v34 = a10;
  v35 = v33;
  id v36 = a11;
  id v37 = a12;
  id v38 = a13;
  id v39 = a14;
  id v40 = a15;
  id v41 = a16;
  id v101 = a17;
  id v100 = a18;
  id v104 = a19;
  id v103 = a20;
  id v102 = a27;
  v106.receiver = self;
  v106.super_class = (Class)&OBJC_CLASS___CSIntuitiveConvRequestHandler;
  v42 = -[CSIntuitiveConvRequestHandler init](&v106, "init");
  if (v42)
  {
    dispatch_queue_t v43 = dispatch_queue_create("CSIntuitiveConvRequestHandler queue", 0LL);
    queue = v42->_queue;
    v42->_queue = (OS_dispatch_queue *)v43;

    uint64_t v45 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"targetQueue for ASR",  33LL));
    targetQueueForASR = v42->_targetQueueForASR;
    v42->_targetQueueForASR = (OS_dispatch_queue *)v45;

    uint64_t v47 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    nodesCache = v42->_nodesCache;
    v42->_nodesCache = (NSMapTable *)v47;

    v42->_supportTCU = a26;
    if (v32) {
      v49 = (CSAttSiriAudioSrcNode *)v32;
    }
    else {
      v49 = -[CSAttSiriAudioSrcNode initWithTargetQueue:]( objc_alloc(&OBJC_CLASS___CSAttSiriAudioSrcNode),  "initWithTargetQueue:",  v42->_targetQueueForASR);
    }
    audioSrcNode = v42->_audioSrcNode;
    v42->_audioSrcNode = v49;

    if (v104) {
      v51 = (CSAttSiriAudioCoordinator *)v104;
    }
    else {
      v51 = -[CSAttSiriAudioCoordinator initWithTargetQueue:]( objc_alloc(&OBJC_CLASS___CSAttSiriAudioCoordinator),  "initWithTargetQueue:",  v42->_targetQueueForASR);
    }
    audioCoordinator = v42->_audioCoordinator;
    v42->_audioCoordinator = v51;

    if (v35) {
      v53 = v35;
    }
    else {
      v53 = objc_alloc_init(&OBJC_CLASS___CSAttSiriEndpointerNode);
    }
    endpointerNode = v42->_endpointerNode;
    v42->_endpointerNode = v53;

    if (a9)
    {
      if (v99) {
        v55 = (CSAttSiriSSRNode *)v99;
      }
      else {
        v55 = objc_alloc_init(&OBJC_CLASS___CSAttSiriSSRNode);
      }
      ssrNode = v42->_ssrNode;
      v42->_ssrNode = v55;
    }

    if (a23 || a24)
    {
      if (v98) {
        v57 = (CSAttSiriSpeechRecognitionNode *)v98;
      }
      else {
        v57 = objc_alloc_init(&OBJC_CLASS___CSAttSiriSpeechRecognitionNode);
      }
      speechRecognitionNode = v42->_speechRecognitionNode;
      v42->_speechRecognitionNode = v57;
    }

    if (a22 || a24)
    {
      if (v97) {
        v59 = (CSAttSiriUresNode *)v97;
      }
      else {
        v59 = objc_alloc_init(&OBJC_CLASS___CSAttSiriUresNode);
      }
      uresNode = v42->_uresNode;
      v42->_uresNode = v59;

      v61 = objc_alloc_init(&OBJC_CLASS___CSAttSiriNLDAClassifierNode);
      nldaClassifierNode = v42->_nldaClassifierNode;
      v42->_nldaClassifierNode = v61;

      if (v40) {
        v63 = (CSAttSiriRCHandler *)v40;
      }
      else {
        v63 = -[CSAttSiriRCHandler initWithEndpointerNode:uresNode:]( objc_alloc(&OBJC_CLASS___CSAttSiriRCHandler),  "initWithEndpointerNode:uresNode:",  v42->_endpointerNode,  v42->_uresNode);
      }
      rcHandler = v42->_rcHandler;
      v42->_rcHandler = v63;
    }

    if (a21)
    {
      if (v34) {
        v65 = (CSAttSiriAFTMNode *)v34;
      }
      else {
        v65 = objc_alloc_init(&OBJC_CLASS___CSAttSiriAFTMNode);
      }
      aFTMNode = v42->_aFTMNode;
      v42->_aFTMNode = v65;
    }

    if (v105) {
      v67 = (CSAttSiriOSDNode *)v105;
    }
    else {
      v67 = objc_alloc_init(&OBJC_CLASS___CSAttSiriOSDNode);
    }
    osdNode = v42->_osdNode;
    v42->_osdNode = v67;

    if (v42->_supportTCU)
    {
      if (v41) {
        v69 = (CSAttSiriTCUGenerator *)v41;
      }
      else {
        v69 = objc_alloc_init(&OBJC_CLASS___CSAttSiriTCUGenerator);
      }
      tcuGenerator = v42->_tcuGenerator;
      v42->_tcuGenerator = v69;
    }

    if (v101) {
      v71 = (CSAttSiriContinuityEndDetector *)v101;
    }
    else {
      v71 = objc_alloc_init(&OBJC_CLASS___CSAttSiriContinuityEndDetector);
    }
    continuityEndDetector = v42->_continuityEndDetector;
    v42->_continuityEndDetector = v71;

    if (v100) {
      v73 = (CSAttSiriBridgeMessageHandler *)v100;
    }
    else {
      v73 = -[CSAttSiriBridgeMessageHandler initWithSpeechRecognitionNode:tcuGenerator:supportTCU:]( objc_alloc(&OBJC_CLASS___CSAttSiriBridgeMessageHandler),  "initWithSpeechRecognitionNode:tcuGenerator:supportTCU:",  v42->_speechRecognitionNode,  v42->_tcuGenerator,  a26);
    }
    bridgeMessageHandler = v42->_bridgeMessageHandler;
    v42->_bridgeMessageHandler = v73;

    if (v36) {
      v75 = (CSSpeechManager *)v36;
    }
    else {
      v75 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    }
    speechManager = v42->_speechManager;
    v42->_speechManager = v75;

    if (v37) {
      v77 = (CSSiriEnabledMonitor *)v37;
    }
    else {
      v77 = (CSSiriEnabledMonitor *)objc_claimAutoreleasedReturnValue( +[CSSiriEnabledMonitor sharedInstance]( &OBJC_CLASS___CSSiriEnabledMonitor,  "sharedInstance"));
    }
    siriEnabledMonitor = v42->_siriEnabledMonitor;
    v42->_siriEnabledMonitor = v77;

    if (v38) {
      v79 = (CSSiriClientBehaviorMonitor *)v38;
    }
    else {
      v79 = (CSSiriClientBehaviorMonitor *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    }
    siriClientBehaviorMonitor = v42->_siriClientBehaviorMonitor;
    v42->_siriClientBehaviorMonitor = v79;

    if (v39) {
      v81 = (CSIntuitiveConvAudioCaptureMonitor *)v39;
    }
    else {
      v81 = (CSIntuitiveConvAudioCaptureMonitor *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
    }
    intuitiveConvAudioCaptureMonitor = v42->_intuitiveConvAudioCaptureMonitor;
    v42->_intuitiveConvAudioCaptureMonitor = v81;

    if (a25)
    {
      v83 = objc_alloc_init(&OBJC_CLASS___CSIntuitiveConversationLogger);
      signalsLogger = v42->_signalsLogger;
      v42->_signalsLogger = v83;

      -[CSIntuitiveConversationLogger start](v42->_signalsLogger, "start");
    }

    v85 = objc_alloc_init(&OBJC_CLASS___CSSiriAudioMessageRequestHandler);
    audioMessageRequestHandler = v42->_audioMessageRequestHandler;
    v42->_audioMessageRequestHandler = v85;

    v87 = objc_alloc_init(&OBJC_CLASS___CSEndpointDetectedSelfLogger);
    endpointDetectedSelfLogger = v42->_endpointDetectedSelfLogger;
    v42->_endpointDetectedSelfLogger = v87;

    if (v103) {
      v89 = (CSAttSiriMagusSupportedPolicy *)v103;
    }
    else {
      v89 = (CSAttSiriMagusSupportedPolicy *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMagusSupportedPolicy sharedInstance]( &OBJC_CLASS___CSAttSiriMagusSupportedPolicy,  "sharedInstance"));
    }
    magusSupportedPolicy = v42->_magusSupportedPolicy;
    v42->_magusSupportedPolicy = v89;

    if (v102) {
      v91 = (CSAudioSessionInfoProvider *)v102;
    }
    else {
      v91 = (CSAudioSessionInfoProvider *)objc_claimAutoreleasedReturnValue( +[CSAudioSessionInfoProvider sharedInstance]( &OBJC_CLASS___CSAudioSessionInfoProvider,  "sharedInstance"));
    }
    audioSessionInfoProvider = v42->_audioSessionInfoProvider;
    v42->_audioSessionInfoProvider = v91;

    v42->_audioSessionMonitoringInProgress = 0;
    if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
    {
      v93 = objc_alloc_init(&OBJC_CLASS___CSAttSiriAudioMetricsNode);
      audioMetricsNode = v42->_audioMetricsNode;
      v42->_audioMetricsNode = v93;
    }
  }

  return v42;
}

- (id)getEndpointerProxyObj
{
  return self->_endpointerNode;
}

- (id)getAsrProxyObj
{
  return self->_bridgeMessageHandler;
}

- (id)getSsrProxyObj
{
  return self->_ssrNode;
}

- (id)getRcHandlerProxyObj
{
  return self->_rcHandler;
}

- (id)getAudioMessageServiceProxyObj
{
  return self->_audioMessageRequestHandler;
}

- (void)setup
{
  uint64_t v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[CSIntuitiveConvRequestHandler setup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[CSSiriClientBehaviorMonitor registerObserver:](self->_siriClientBehaviorMonitor, "registerObserver:", self);
  -[CSIntuitiveConvAudioCaptureMonitor registerObserver:]( self->_intuitiveConvAudioCaptureMonitor,  "registerObserver:",  self);
  -[CSSiriEnabledMonitor addObserver:](self->_siriEnabledMonitor, "addObserver:", self);
  -[CSAudioSessionInfoProvider registerObserver:](self->_audioSessionInfoProvider, "registerObserver:", self);
}

- (void)start
{
  uint64_t v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v7 = "-[CSIntuitiveConvRequestHandler start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034628;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_configureAllNodes
{
  if (self->_bridgeMessageHandler)
  {
    -[CSAttSiriSpeechRecognitionNode addResultCandidateReceiver:]( self->_speechRecognitionNode,  "addResultCandidateReceiver:");
    -[CSAttSiriSpeechRecognitionNode addSpeechRecognitionReceiver:]( self->_speechRecognitionNode,  "addSpeechRecognitionReceiver:",  self->_bridgeMessageHandler);
    -[CSAttSiriEndpointerNode addReceiver:](self->_endpointerNode, "addReceiver:", self->_bridgeMessageHandler);
    uint64_t v3 = -[CSAttSiriAssetDownloadPromptIOS initWithDelegate:]( objc_alloc(&OBJC_CLASS___CSAttSiriAssetDownloadPromptIOS),  "initWithDelegate:",  self->_bridgeMessageHandler);
    downloadPrompter = self->_downloadPrompter;
    self->_downloadPrompter = v3;
  }

  if (self->_supportTCU)
  {
    -[CSAttSiriTCUGenerator addTCUReceiver:](self->_tcuGenerator, "addTCUReceiver:", self->_continuityEndDetector);
    -[CSAttSiriTCUGenerator addTCUReceiver:](self->_tcuGenerator, "addTCUReceiver:", self->_bridgeMessageHandler);
    -[CSAttSiriContinuityEndDetector addContinuityDetectionReceiver:]( self->_continuityEndDetector,  "addContinuityDetectionReceiver:",  self->_bridgeMessageHandler);
    -[CSAttSiriTCUGenerator setDelegate:](self->_tcuGenerator, "setDelegate:", self->_endpointerNode);
    -[CSAttSiriTCUGenerator addTCUReceiver:](self->_tcuGenerator, "addTCUReceiver:", self->_uresNode);
    -[CSAttSiriTCUGenerator addTRPCandidateExecutionStateReceiver:]( self->_tcuGenerator,  "addTRPCandidateExecutionStateReceiver:",  self->_continuityEndDetector);
  }

  audioSrcNode = self->_audioSrcNode;
  if (audioSrcNode) {
    -[CSAttSiriAudioSrcNode setDelegate:](audioSrcNode, "setDelegate:", self);
  }
  if (self->_audioCoordinator)
  {
    -[CSAttSiriAudioSrcNode addReceiver:](self->_audioSrcNode, "addReceiver:");
    -[CSAttSiriEndpointerNode addReceiver:](self->_endpointerNode, "addReceiver:", self->_audioCoordinator);
    -[CSSiriClientBehaviorMonitor registerObserver:]( self->_siriClientBehaviorMonitor,  "registerObserver:",  self->_audioCoordinator);
    -[CSIntuitiveConvAudioCaptureMonitor registerObserver:]( self->_intuitiveConvAudioCaptureMonitor,  "registerObserver:",  self->_audioCoordinator);
  }

  endpointerNode = self->_endpointerNode;
  if (endpointerNode)
  {
    -[CSAttSiriEndpointerNode setDelegate:](endpointerNode, "setDelegate:", self);
    -[CSAttSiriOSDNode addReceiver:](self->_osdNode, "addReceiver:", self->_endpointerNode);
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:", self->_endpointerNode);
    -[CSAttSiriSpeechRecognitionNode addEndpointFeatureReceiver:]( self->_speechRecognitionNode,  "addEndpointFeatureReceiver:",  self->_endpointerNode);
    -[CSAttSiriSpeechRecognitionNode addResultCandidateReceiver:]( self->_speechRecognitionNode,  "addResultCandidateReceiver:",  self->_endpointerNode);
    -[CSAttSiriRCHandler addResultCandidateReceiver:]( self->_rcHandler,  "addResultCandidateReceiver:",  self->_endpointerNode);
  }

  if (self->_osdNode)
  {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
    +[CSUtils isContinuousConversationSupported](&OBJC_CLASS___CSUtils, "isContinuousConversationSupported");
  }

  if (self->_ssrNode) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
  speechRecognitionNode = self->_speechRecognitionNode;
  if (speechRecognitionNode)
  {
    -[CSAttSiriSpeechRecognitionNode registerEndpointerNode:]( speechRecognitionNode,  "registerEndpointerNode:",  self->_endpointerNode);
    -[CSAttSiriSpeechRecognitionNode registerSSRNode:](self->_speechRecognitionNode, "registerSSRNode:", self->_ssrNode);
    -[CSAttSiriSpeechRecognitionNode addSpeechRecognitionReceiver:]( self->_speechRecognitionNode,  "addSpeechRecognitionReceiver:",  self->_attendingStatesMessageHandler);
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:", self->_speechRecognitionNode);
    -[CSAttSiriEndpointerNode addReceiver:](self->_endpointerNode, "addReceiver:", self->_speechRecognitionNode);
  }

  if (self->_uresNode)
  {
    if (+[CSUtils supportsUnderstandingOnDevice](&OBJC_CLASS___CSUtils, "supportsUnderstandingOnDevice"))
    {
      -[CSAttSiriUresNode registerSSRNode:](self->_uresNode, "registerSSRNode:", self->_ssrNode);
      -[CSAttSiriUresNode registerOSDNode:](self->_uresNode, "registerOSDNode:", self->_osdNode);
      -[CSAttSiriSpeechRecognitionNode addReceiver:](self->_speechRecognitionNode, "addReceiver:", self->_uresNode);
      -[CSAttSiriAFTMNode addReceiver:](self->_aFTMNode, "addReceiver:", self->_uresNode);
      -[CSAttSiriOSDNode addReceiver:](self->_osdNode, "addReceiver:", self->_uresNode);
      -[CSAttSiriSSRNode addReceiver:](self->_ssrNode, "addReceiver:", self->_uresNode);
      -[CSAttSiriNLDAClassifierNode addReceiver:](self->_nldaClassifierNode, "addReceiver:", self->_uresNode);
      -[CSAttSiriSpeechRecognitionNode addEndpointFeatureReceiver:]( self->_speechRecognitionNode,  "addEndpointFeatureReceiver:",  self->_uresNode);
      -[CSAttSiriSpeechRecognitionNode addSpeechRecognitionReceiver:]( self->_speechRecognitionNode,  "addSpeechRecognitionReceiver:",  self->_uresNode);
      -[CSAttSiriTCUGenerator registerUresNode:](self->_tcuGenerator, "registerUresNode:", self->_uresNode);
      if (self->_supportTCU)
      {
        unsigned __int8 v8 = objc_alloc_init(&OBJC_CLASS___CSAttSiriEagerMitigator);
        eagerMitigator = self->_eagerMitigator;
        self->_eagerMitigator = v8;

        -[CSAttSiriUresNode addReceiver:](self->_uresNode, "addReceiver:", self->_eagerMitigator);
      }
    }
  }

  if (self->_nldaClassifierNode) {
    -[CSAttSiriUresNode registerNLDAClassifierNode:](self->_uresNode, "registerNLDAClassifierNode:");
  }
  if (self->_tcuGenerator)
  {
    -[CSAttSiriEndpointerNode addReceiver:](self->_endpointerNode, "addReceiver:");
    -[CSAttSiriSpeechRecognitionNode addResultCandidateReceiver:]( self->_speechRecognitionNode,  "addResultCandidateReceiver:",  self->_tcuGenerator);
    -[CSAttSiriSpeechRecognitionNode addRecognitionTaskCompletionReceiver:]( self->_speechRecognitionNode,  "addRecognitionTaskCompletionReceiver:",  self->_tcuGenerator);
    -[CSAttSiriContinuityEndDetector addContinuityDetectionReceiver:]( self->_continuityEndDetector,  "addContinuityDetectionReceiver:",  self->_tcuGenerator);
    -[CSAttSiriEndpointerNode registerEndpointerProxyAt:]( self->_endpointerNode,  "registerEndpointerProxyAt:",  self->_tcuGenerator);
    -[CSAttSiriRCHandler addResultCandidateReceiver:]( self->_rcHandler,  "addResultCandidateReceiver:",  self->_tcuGenerator);
    -[CSAttSiriUresNode registerTCUGenerator:](self->_uresNode, "registerTCUGenerator:", self->_tcuGenerator);
  }

  if (self->_continuityEndDetector)
  {
    -[CSAttSiriTCUGenerator addRecognitionTaskCompletionReceiver:]( self->_tcuGenerator,  "addRecognitionTaskCompletionReceiver:");
    -[CSAttSiriContinuityEndDetector addRecognitionTaskCompletionReceiver:]( self->_continuityEndDetector,  "addRecognitionTaskCompletionReceiver:",  self->_attendingStatesMessageHandler);
    -[CSAttSiriContinuityEndDetector addRecognitionTaskCompletionReceiver:]( self->_continuityEndDetector,  "addRecognitionTaskCompletionReceiver:",  self->_bridgeMessageHandler);
  }

  if (self->_aFTMNode
    && +[CSUtils supportsUnderstandingOnDevice](&OBJC_CLASS___CSUtils, "supportsUnderstandingOnDevice"))
  {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:", self->_aFTMNode);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v11 = [v10 isAttentiveSiriAudioLoggingEnabled];

  if (v11 && self->_signalsLogger) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
  if (self->_audioMessageRequestHandler) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
  endpointDetectedSelfLogger = self->_endpointDetectedSelfLogger;
  if (endpointDetectedSelfLogger)
  {
    -[CSEndpointDetectedSelfLogger registerEndpointerNode:]( endpointDetectedSelfLogger,  "registerEndpointerNode:",  self->_endpointerNode);
    -[CSAttSiriEndpointerNode addReceiver:](self->_endpointerNode, "addReceiver:", self->_endpointDetectedSelfLogger);
    -[CSAttSiriTCUGenerator addRecognitionTaskCompletionReceiver:]( self->_tcuGenerator,  "addRecognitionTaskCompletionReceiver:",  self->_endpointDetectedSelfLogger);
    -[CSAttSiriTCUGenerator addTCUReceiver:](self->_tcuGenerator, "addTCUReceiver:", self->_endpointDetectedSelfLogger);
    -[CSEndpointDetectedSelfLogger setup](self->_endpointDetectedSelfLogger, "setup");
  }

  if (self->_audioMetricsNode) {
    -[CSAttSiriAudioCoordinator addReceiver:](self->_audioCoordinator, "addReceiver:");
  }
}

- (void)setRequestHandlerDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100034560;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStartAudioCaptureWithContext:(id)a4 option:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034550;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003447C;
  block[3] = &unk_10022ECA8;
  BOOL v14 = a4;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 willStopAudioCaptureReason:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003446C;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100034460;
  v9[3] = &unk_10022EFD0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 fetchedAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034450;
  block[3] = &unk_10022ECA8;
  void block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5 withEventUUID:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100034324;
  v16[3] = &unk_10022E368;
  id v17 = v10;
  v18 = self;
  id v19 = v11;
  id v20 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(queue, v16);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000342E0;
  v15[3] = &unk_10022DB78;
  v15[4] = self;
  id v16 = v11;
  id v17 = v10;
  BOOL v18 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, v15);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5 withEventUUID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000342A0;
  v14[3] = &unk_10022C908;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  unint64_t v17 = a5;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034260;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034250;
  block[3] = &unk_10022ECA8;
  void block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034240;
  block[3] = &unk_10022ECA8;
  void block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)_handleClientWillStartStreamWithContext:(id)a3 option:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "-[CSIntuitiveConvRequestHandler _handleClientWillStartStreamWithContext:option:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s context : %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = (NSString *)objc_claimAutoreleasedReturnValue([v7 siriSessionUUID]);
  currentRequestId = self->_currentRequestId;
  self->_currentRequestId = v9;

  id v11 = (CSAudioRecordContext *)[v6 copy];
  audioRecordContext = self->_audioRecordContext;
  self->_audioRecordContext = v11;

  -[CSIntuitiveConvRequestHandler _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]( self,  "_handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:",  self->_audioRecordContext,  v7,  0LL);
  if (self->_siriClientStream) {
    -[CSIntuitiveConvRequestHandler _setupAudioSrcNodeWithSiriClientStream:]( self,  "_setupAudioSrcNodeWithSiriClientStream:");
  }
  id v13 = -[CSAttendingStopHintInfo initWithOrigin:reason:]( objc_alloc(&OBJC_CLASS___CSAttendingStopHintInfo),  "initWithOrigin:reason:",  1LL,  1LL);
  -[CSAttendingHintProviding postAttendingStopHintWithInfo:](self->_hintProvider, "postAttendingStopHintWithInfo:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 requestMHUUID]);
  -[CSIntuitiveConvRequestHandler emitRequestLinkEventForMHUUID:withRequestId:]( self,  "emitRequestLinkEventForMHUUID:withRequestId:",  v14,  self->_currentRequestId);
}

- (void)_handleClientDidStartStreamWithOption:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v6 requestMHUUID]);
    requestMHUUID = self->_requestMHUUID;
    self->_requestMHUUID = v8;

    id v10 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_requestMHUUID;
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[CSIntuitiveConvRequestHandler _handleClientDidStartStreamWithOption:successfully:]";
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s _requestMHUUID set to :%@ option:%@",  buf,  0x20u);
    }

    -[CSAttSiriAFTMNode setMhId:](self->_aFTMNode, "setMhId:", self->_requestMHUUID);
    -[CSAttSiriSSRNode setMhId:](self->_ssrNode, "setMhId:", self->_requestMHUUID);
    -[CSAttSiriSpeechRecognitionNode setMhId:](self->_speechRecognitionNode, "setMhId:", self->_requestMHUUID);
    -[CSIntuitiveConversationLogger setMhId:](self->_signalsLogger, "setMhId:", self->_requestMHUUID);
    -[CSAttSiriTCUGenerator setMhId:](self->_tcuGenerator, "setMhId:", self->_requestMHUUID);
    -[CSAttSiriEndpointerNode setMhId:](self->_endpointerNode, "setMhId:", self->_requestMHUUID);
    -[CSEndpointDetectedSelfLogger setMhId:](self->_endpointDetectedSelfLogger, "setMhId:", self->_requestMHUUID);
    -[CSAttSiriOSDNode setMhId:](self->_osdNode, "setMhId:", self->_requestMHUUID);
    audioSrcNode = self->_audioSrcNode;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000340B4;
    v15[3] = &unk_10022ABF8;
    v15[4] = self;
    -[CSAttSiriAudioSrcNode fetchRoutesWithCompletion:](audioSrcNode, "fetchRoutesWithCompletion:", v15);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 siriSessionUUID]);
    -[CSIntuitiveConvRequestHandler _handleStopProcessingForRequestId:](self, "_handleStopProcessingForRequestId:", v13);

    id v14 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "-[CSIntuitiveConvRequestHandler _handleClientDidStartStreamWithOption:successfully:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Skip asking audioSrcNode to record since Siri client failed to start audio",  buf,  0xCu);
    }
  }
}

- (void)_handleClientWillStopStreamWithReason:(unint64_t)a3 stopStreamOption:(id)a4
{
}

- (void)_handleClientDidStopWithOption:(id)a3
{
  id v4 = a3;
  char v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 requestId]);
  id v6 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v4 description]);
    int v16 = 136315650;
    __int16 v17 = "-[CSIntuitiveConvRequestHandler _handleClientDidStopWithOption:]";
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s stopOption : %{public}@, stopOptionRequestId : %{public}@",  (uint8_t *)&v16,  0x20u);
  }

  if (-[CSIntuitiveConvRequestHandler _isRequestIdCurrent:](self, "_isRequestIdCurrent:", v5))
  {
    -[CSIntuitiveConvRequestHandler _handleStopProcessingForRequestId:](self, "_handleStopProcessingForRequestId:", v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStream startStreamOption](self->_siriClientStream, "startStreamOption"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);

    dismissedRequestId = self->_dismissedRequestId;
    unsigned int v12 = 1;
    if (dismissedRequestId && v10) {
      unsigned int v12 = !-[NSString isEqualToString:](dismissedRequestId, "isEqualToString:", v10);
    }
    if ([v4 stopRecordingReason] == (id)5) {
      uint64_t v13 = 0LL;
    }
    else {
      uint64_t v13 = [v4 supportsMagus] & v12;
    }
    -[CSIntuitiveConvRequestHandler _generateStartAttendingHint:attendingDecision:]( self,  "_generateStartAttendingHint:attendingDecision:",  v10,  v13);
  }

  else
  {
    id v14 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      currentRequestId = self->_currentRequestId;
      int v16 = 136315650;
      __int16 v17 = "-[CSIntuitiveConvRequestHandler _handleClientDidStopWithOption:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = currentRequestId;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Stop received for invalid requestId:%@, currentRequestId:%@",  (uint8_t *)&v16,  0x20u);
    }
  }
}

- (void)_generateStartAttendingHint:(id)a3 attendingDecision:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    int v13 = 136315650;
    id v14 = "-[CSIntuitiveConvRequestHandler _generateStartAttendingHint:attendingDecision:]";
    __int16 v15 = 2112;
    id v16 = v6;
    if (v4) {
      id v8 = @"YES";
    }
    __int16 v17 = 2112;
    __int16 v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s rootRequestId : %@, shouldStartAttending : %@",  (uint8_t *)&v13,  0x20u);
  }

  if (v4)
  {
    id v9 = objc_alloc(&OBJC_CLASS___CSAttendingStartHintInfo);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSIntuitiveConvRequestHandler _recordContextForContinuousConversation]( self,  "_recordContextForContinuousConversation"));
    id v11 = -[CSAttendingStartHintInfo initWithOrigin:reason:recordContext:rootRequestId:mhUUID:]( v9,  "initWithOrigin:reason:recordContext:rootRequestId:mhUUID:",  1LL,  1LL,  v10,  v6,  self->_requestMHUUID);

    -[CSAttendingHintProviding postAttendingStartHintWithInfo:]( self->_hintProvider,  "postAttendingStartHintWithInfo:",  v11);
  }

  else
  {
    if (v6)
    {
      dismissedRequestId = self->_dismissedRequestId;
      if (dismissedRequestId) {
        -[NSString isEqualToString:](dismissedRequestId, "isEqualToString:", v6);
      }
    }

    id v11 = -[CSAttendingMagusNotSupportedHintInfo initWithOrigin:reason:rootRequestId:]( objc_alloc(&OBJC_CLASS___CSAttendingMagusNotSupportedHintInfo),  "initWithOrigin:reason:rootRequestId:",  1LL,  1LL,  v6);
    -[CSAttendingHintProviding postAttendingMagusNotSupportedHintWithInfo:]( self->_hintProvider,  "postAttendingMagusNotSupportedHintWithInfo:",  v11);
    -[CSAttSiriAssetDownloadPromptIOS checkIfNewAssetRequiredGivenCurrentVTAsset:mitigationAsset:]( self->_downloadPrompter,  "checkIfNewAssetRequiredGivenCurrentVTAsset:mitigationAsset:",  self->_vtAsset,  self->_mitigationAsset);
  }
}

- (id)_recordContextForContinuousConversation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSSiriClientBehaviorMonitor recordRoute](self->_siriClientBehaviorMonitor, "recordRoute"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSSiriClientBehaviorMonitor deviceId](self->_siriClientBehaviorMonitor, "deviceId"));
  if (-[CSAudioRecordContext isContinuousConversation]( self->_audioRecordContext,  "isContinuousConversation")) {
    id v5 = -[CSAudioRecordContext copy](self->_audioRecordContext, "copy");
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForContinuousConversationWithRecordRoute:deviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForContinuousConversationWithRecordRoute:deviceId:",  v3,  v4));
  }
  id v6 = v5;

  return v6;
}

- (void)_handleClientPreparedAudioStream:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4)
  {
    objc_storeStrong((id *)&self->_siriClientStream, a3);
    id v8 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      int v13 = "-[CSIntuitiveConvRequestHandler _handleClientPreparedAudioStream:successfully:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Cached siri client stream, attach after nodes start",  (uint8_t *)&v12,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStream streamRequest](self->_siriClientStream, "streamRequest"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordContext]);
    -[CSIntuitiveConvRequestHandler _fetchRequiredAssetsForRecordContext:]( self,  "_fetchRequiredAssetsForRecordContext:",  v10);
  }

  else
  {
    id v11 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      int v13 = "-[CSIntuitiveConvRequestHandler _handleClientPreparedAudioStream:successfully:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Skip asking audioSrcNode to prepare since Siri client failed to prepare audio",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSIntuitiveConvRequestHandler CSSiriEnabledMonitor:didReceiveEnabled:]";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Siri enabled : %{public}d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003409C;
  v8[3] = &unk_10022EFA8;
  BOOL v9 = v4;
  v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033FE8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)dismissAttendingRequested
{
  uint64_t v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v9 = "-[CSIntuitiveConvRequestHandler dismissAttendingRequested]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Triggering asset refresh at Siri UI dismissal",  buf,  0xCu);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
  [v4 triggerAssetRefresh];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  [v5 triggerAssetRefresh];

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033FE0;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)attendingXpcDisconnection
{
  uint64_t v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v9 = "-[CSIntuitiveConvRequestHandler attendingXpcDisconnection]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Triggering asset refresh due to XPC disconnection",  buf,  0xCu);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
  [v4 triggerAssetRefresh];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  [v5 triggerAssetRefresh];

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033FD8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_attendingDismissalAndBlockHelper
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStream startStreamOption](self->_siriClientStream, "startStreamOption"));
  BOOL v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 siriSessionUUID]);
  dismissedRequestId = self->_dismissedRequestId;
  self->_dismissedRequestId = v4;

  id v6 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = self->_dismissedRequestId;
    int v9 = 136315394;
    id v10 = "-[CSIntuitiveConvRequestHandler _attendingDismissalAndBlockHelper]";
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s dismissed requestId : %@",  (uint8_t *)&v9,  0x16u);
  }

  id v8 = -[CSAttendingStopHintInfo initWithOrigin:reason:]( objc_alloc(&OBJC_CLASS___CSAttendingStopHintInfo),  "initWithOrigin:reason:",  1LL,  4LL);
  -[CSAttendingHintProviding postAttendingStopHintWithInfo:](self->_hintProvider, "postAttendingStopHintWithInfo:", v8);
  -[CSIntuitiveConvRequestHandler _stopMonitoringAudioSession](self, "_stopMonitoringAudioSession");
  -[CSAttSiriSSRNode handleSiriSessionEnd](self->_ssrNode, "handleSiriSessionEnd");
}

- (void)siriUIDismissed
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033F7C;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriPromptWillStart
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033EC8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  audioSrcNode = self->_audioSrcNode;
  if (audioSrcNode)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100033CEC;
    v6[3] = &unk_10022ABF8;
    v6[4] = self;
    -[CSAttSiriAudioSrcNode fetchRoutesWithCompletion:](audioSrcNode, "fetchRoutesWithCompletion:", v6, a4);
  }

- (void)_startMonitoringAudioSession
{
  if (!self->_audioSessionMonitoringInProgress)
  {
    uint64_t v3 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSIntuitiveConvRequestHandler _startMonitoringAudioSession]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXSessionMonitor sharedInstance](&OBJC_CLASS___CSMXSessionMonitor, "sharedInstance"));
    [v4 addObserver:self];

    self->_audioSessionMonitoringInProgress = 1;
  }

- (void)_stopMonitoringAudioSession
{
  if (self->_audioSessionMonitoringInProgress)
  {
    uint64_t v3 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSIntuitiveConvRequestHandler _stopMonitoringAudioSession]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXSessionMonitor sharedInstance](&OBJC_CLASS___CSMXSessionMonitor, "sharedInstance"));
    [v4 removeObserver:self];

    self->_audioSessionMonitoringInProgress = 0;
  }

- (void)_fetchMitigationAssets
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100033B44;
  v4[3] = &unk_10022E340;
  v4[4] = self;
  [v3 getMitigationAssetWithEndpointId:0 completion:v4];
}

- (void)_fetchVoiceTriggerAssets
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100033958;
  v4[3] = &unk_10022E340;
  v4[4] = self;
  [v3 getVoiceTriggerAssetWithEndpointId:0 completion:v4];
}

- (void)_fetchRequiredAssetsForRecordContext:(id)a3
{
  if (([a3 isDictation] & 1) == 0)
  {
    -[CSIntuitiveConvRequestHandler _fetchVoiceTriggerAssets](self, "_fetchVoiceTriggerAssets");
    -[CSIntuitiveConvRequestHandler _fetchMitigationAssets](self, "_fetchMitigationAssets");
  }

- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[CSIntuitiveConvRequestHandler _setupAudioSrcNodeWithSiriClientStream:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  -[CSAttSiriAudioCoordinator reset](self->_audioCoordinator, "reset");
  -[CSAttSiriAudioSrcNode attachToMasterStream:name:completion:]( self->_audioSrcNode,  "attachToMasterStream:name:completion:",  v4,  @"CSIntuitiveConvRequestHandler",  &stru_10022AC18);
}

- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v44 = "-[CSIntuitiveConvRequestHandler _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
    __int16 v45 = 2112;
    id v46 = v8;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s recordContext:%@, streamOptions:%@",  buf,  0x20u);
  }

  if ([v8 isVoiceTriggered])
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEventInfoProvider sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEventInfoProvider,  "sharedInstance"));
    id v42 = 0LL;
    [v12 fetchVoiceTriggerInfoWithAudioContext:v8 resultVoiceTriggerInfo:&v42 resultRTSTriggerInfo:0];
    id v13 = v42;
  }

  else
  {
    id v13 = 0LL;
  }

  if ([v8 type] == (id)17 || objc_msgSend(v8, "type") == (id)18)
  {
    id v14 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[CSIntuitiveConvRequestHandler _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Skip processing for remora requests!",  buf,  0xCu);
    }
  }

  else
  {
    -[CSAttSiriOSDNode setPrefetchedAsset:](self->_osdNode, "setPrefetchedAsset:", self->_mitigationAsset);
    -[CSAttSiriUresNode setPrefetchedAsset:](self->_uresNode, "setPrefetchedAsset:", self->_mitigationAsset);
    -[CSAttSiriEagerMitigator setPrefetchedAsset:](self->_eagerMitigator, "setPrefetchedAsset:", self->_mitigationAsset);
    -[CSAttSiriSpeechRecognitionNode prepareToStartSpeechRequestWithStartStreamOption:audioRecordContext:voiceTriggerInfo:]( self->_speechRecognitionNode,  "prepareToStartSpeechRequestWithStartStreamOption:audioRecordContext:voiceTriggerInfo:",  v9,  v8,  v13);
    -[CSAttSiriSpeechRecognitionNode start](self->_speechRecognitionNode, "start");
    id v37 = -[CSEndpointerSettings initWithDisableEndpointer:]( [CSEndpointerSettings alloc],  "initWithDisableEndpointer:",  [v9 disableEndpointer]);
    -[CSAttSiriOSDNode resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:]( self->_osdNode,  "resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:",  v8);
    endpointerNode = self->_endpointerNode;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    -[CSAttSiriEndpointerNode resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]( endpointerNode,  "resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:",  (unint64_t)v16,  v8,  v9,  v13);
    tcuGenerator = self->_tcuGenerator;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);
    -[CSAttSiriTCUGenerator startWithRecordContext:withRequestId:]( tcuGenerator,  "startWithRecordContext:withRequestId:",  v8,  v18);

    -[CSEndpointDetectedSelfLogger reset](self->_endpointDetectedSelfLogger, "reset");
    -[CSAttSiriContinuityEndDetector setUpWithContinuityEndUsage:]( self->_continuityEndDetector,  "setUpWithContinuityEndUsage:",  [v8 isDictation] ^ 1);
    eagerMitigator = self->_eagerMitigator;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);
    -[CSAttSiriEagerMitigator requestStartedWithId:forRecordContext:]( eagerMitigator,  "requestStartedWithId:forRecordContext:",  v20,  v8);

    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[CSAsset getCategoryKeyWithRecordCtx:](self->_mitigationAsset, "getCategoryKeyWithRecordCtx:", v8));
    if ((CSIsCommunalDevice(v21, v22) & 1) != 0
      || -[CSAsset shouldRunSpkrIdForCategory:]( self->_mitigationAsset,  "shouldRunSpkrIdForCategory:",  v21))
    {
      -[CSAttSiriSSRNode setPrefetchedAsset:](self->_ssrNode, "setPrefetchedAsset:", self->_vtAsset);
      ssrNode = self->_ssrNode;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);
      -[CSAttSiriSSRNode resetForNewRequestWithRecordContext:voiceTriggerInfo:withReqId:]( ssrNode,  "resetForNewRequestWithRecordContext:voiceTriggerInfo:withReqId:",  v8,  v13,  v24);
    }

    v25 = @"AcousticSLTaskTypeVoiceTrigger";
    v26 = @"AcousticSLTaskTypeVoiceTrigger";
    if ([v8 isContinuousConversation])
    {
      v25 = @"AcousticSLTaskTypeContConv";
      v27 = @"AcousticSLTaskTypeContConv";
    }

    -[CSAttSiriAFTMNode setPrefetchedAsset:](self->_aFTMNode, "setPrefetchedAsset:", self->_mitigationAsset, v21);
    aFTMNode = self->_aFTMNode;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10003366C;
    v38[3] = &unk_10022AC40;
    id v39 = v8;
    id v40 = self;
    id v30 = v9;
    id v41 = v30;
    -[CSAttSiriAFTMNode startRequestWithContext:withVtei:taskType:withRequestId:completion:]( aFTMNode,  "startRequestWithContext:withVtei:taskType:withRequestId:completion:",  v39,  v13,  v25,  v29,  v38);

    signalsLogger = self->_signalsLogger;
    audioRecordContext = self->_audioRecordContext;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v30 siriSessionUUID]);
    -[CSIntuitiveConversationLogger startLoggingWithAudioRecordContext:requestId:]( signalsLogger,  "startLoggingWithAudioRecordContext:requestId:",  audioRecordContext,  v33);

    if (+[CSUtils supportsAudioMessage](&OBJC_CLASS___CSUtils, "supportsAudioMessage"))
    {
      audioMessageRequestHandler = self->_audioMessageRequestHandler;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v30 siriSessionUUID]);
      -[CSSiriAudioMessageRequestHandler startLoggingWithRequestId:recordContext:]( audioMessageRequestHandler,  "startLoggingWithRequestId:recordContext:",  v35,  self->_audioRecordContext);
    }
  }
}

- (void)_handleStopProcessingForRequestId:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[CSIntuitiveConvRequestHandler _handleStopProcessingForRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s requestId:%@", (uint8_t *)&v8, 0x16u);
  }

  if (-[CSIntuitiveConvRequestHandler _isRequestIdCurrent:](self, "_isRequestIdCurrent:", v4))
  {
    -[CSAttSiriEndpointerNode stop](self->_endpointerNode, "stop");
    -[CSAttSiriOSDNode stop](self->_osdNode, "stop");
    -[CSAttSiriAFTMNode stop](self->_aFTMNode, "stop");
    -[CSAttSiriSSRNode stop](self->_ssrNode, "stop");
    -[CSAttSiriEagerMitigator requestEndedForId:](self->_eagerMitigator, "requestEndedForId:", self->_currentRequestId);
  }

  else
  {
    int v6 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      currentRequestId = self->_currentRequestId;
      int v8 = 136315650;
      id v9 = "-[CSIntuitiveConvRequestHandler _handleStopProcessingForRequestId:]";
      __int16 v10 = 2112;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = currentRequestId;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Stop received for invalid requestId:%@, currentRequestId:%@",  (uint8_t *)&v8,  0x20u);
    }
  }
}

- (BOOL)_isRequestIdCurrent:(id)a3
{
  if (a3) {
    return -[NSString isEqualToString:](self->_currentRequestId, "isEqualToString:");
  }
  else {
    return 1;
  }
}

- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSIntuitiveConvRequestHandler queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000335B8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (id)_startStreamOption
{
  return -[CSIntuitiveConvRequestHandler _startStreamOptionWithMachAbsTime:]( self,  "_startStreamOptionWithMachAbsTime:",  mach_absolute_time());
}

- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
  [v4 setRequestHistoricalAudioDataWithHostTime:1];
  [v4 setStartRecordingHostTime:a3];
  [v4 setRequireSingleChannelLookup:1];
  [v4 setSelectedChannel:0];
  return v4;
}

- (void)emitRequestLinkEventForMHUUID:(id)a3 withRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSIntuitiveConvRequestHandler _createRequestLinkInfo:component:]( self,  "_createRequestLinkInfo:component:",  v7,  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSIntuitiveConvRequestHandler _createRequestLinkInfo:component:]( self,  "_createRequestLinkInfo:component:",  v6,  9LL));
  id v10 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLink);
  [v10 setSource:v8];
  [v10 setTarget:v9];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v11 emitMessage:v10];

  __int16 v12 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    id v14 = "-[CSIntuitiveConvRequestHandler emitRequestLinkEventForMHUUID:withRequestId:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Emit link msg for mhId %@ with reqId %@",  (uint8_t *)&v13,  0x20u);
  }
}

- (id)_createRequestLinkInfo:(id)a3 component:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);

  id v8 = [v6 initWithNSUUID:v7];
  id v9 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLinkInfo);
  [v9 setUuid:v8];
  [v9 setComponent:v4];

  return v9;
}

- (id)fetchRecordingEventUUIDToIgnore
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10003358C;
  id v10 = sub_10003359C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000335A4;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CSIntuitiveConvRequestHandlerDelegate)requestHandlerDelegate
{
  return self->_requestHandlerDelegate;
}

- (CSAttendingHintProviding)hintProvider
{
  return self->_hintProvider;
}

- (void)setHintProvider:(id)a3
{
}

- (CSAttendingStatesMessageHandling)attendingStatesMessageHandler
{
  return self->_attendingStatesMessageHandler;
}

- (void)setAttendingStatesMessageHandler:(id)a3
{
}

- (NSMapTable)nodesCache
{
  return self->_nodesCache;
}

- (void)setNodesCache:(id)a3
{
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return self->_endpointerNode;
}

- (void)setEndpointerNode:(id)a3
{
}

- (CSAttSiriOSDNode)osdNode
{
  return self->_osdNode;
}

- (void)setOsdNode:(id)a3
{
}

- (CSAttSiriSpeechRecognitionNode)speechRecognitionNode
{
  return self->_speechRecognitionNode;
}

- (void)setSpeechRecognitionNode:(id)a3
{
}

- (CSAttSiriUresNode)uresNode
{
  return self->_uresNode;
}

- (void)setUresNode:(id)a3
{
}

- (CSAttSiriAudioSrcNode)audioSrcNode
{
  return self->_audioSrcNode;
}

- (void)setAudioSrcNode:(id)a3
{
}

- (CSAttSiriSSRNode)ssrNode
{
  return self->_ssrNode;
}

- (void)setSsrNode:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)targetQueueForASR
{
  return self->_targetQueueForASR;
}

- (void)setTargetQueueForASR:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSOSTransaction)attSiriTransaction
{
  return self->_attSiriTransaction;
}

- (void)setAttSiriTransaction:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSIntuitiveConvAudioCaptureMonitor)intuitiveConvAudioCaptureMonitor
{
  return self->_intuitiveConvAudioCaptureMonitor;
}

- (void)setIntuitiveConvAudioCaptureMonitor:(id)a3
{
}

- (CSAudioStream)siriClientStream
{
  return self->_siriClientStream;
}

- (void)setSiriClientStream:(id)a3
{
}

- (CSAsset)mitigationAsset
{
  return self->_mitigationAsset;
}

- (void)setMitigationAsset:(id)a3
{
}

- (CSAsset)vtAsset
{
  return self->_vtAsset;
}

- (void)setVtAsset:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSiriEnabledMonitor)siriEnabledMonitor
{
  return self->_siriEnabledMonitor;
}

- (void)setSiriEnabledMonitor:(id)a3
{
}

- (CSAttSiriAFTMNode)aFTMNode
{
  return self->_aFTMNode;
}

- (void)setAFTMNode:(id)a3
{
}

- (CSAttSiriNLDAClassifierNode)nldaClassifierNode
{
  return self->_nldaClassifierNode;
}

- (void)setNldaClassifierNode:(id)a3
{
}

- (CSAttSiriRCHandler)rcHandler
{
  return self->_rcHandler;
}

- (void)setRcHandler:(id)a3
{
}

- (CSAttSiriTCUGenerator)tcuGenerator
{
  return self->_tcuGenerator;
}

- (void)setTcuGenerator:(id)a3
{
}

- (CSAttSiriContinuityEndDetector)continuityEndDetector
{
  return self->_continuityEndDetector;
}

- (void)setContinuityEndDetector:(id)a3
{
}

- (CSAttSiriBridgeMessageHandler)bridgeMessageHandler
{
  return self->_bridgeMessageHandler;
}

- (void)setBridgeMessageHandler:(id)a3
{
}

- (CSSiriAudioMessageRequestHandler)audioMessageRequestHandler
{
  return self->_audioMessageRequestHandler;
}

- (void)setAudioMessageRequestHandler:(id)a3
{
}

- (CSEndpointDetectedSelfLogger)endpointDetectedSelfLogger
{
  return self->_endpointDetectedSelfLogger;
}

- (void)setEndpointDetectedSelfLogger:(id)a3
{
}

- (CSAttSiriAudioCoordinator)audioCoordinator
{
  return self->_audioCoordinator;
}

- (void)setAudioCoordinator:(id)a3
{
}

- (CSAttSiriAssetDownloadPromptIOS)downloadPrompter
{
  return self->_downloadPrompter;
}

- (void)setDownloadPrompter:(id)a3
{
}

- (CSAttSiriEagerMitigator)eagerMitigator
{
  return self->_eagerMitigator;
}

- (void)setEagerMitigator:(id)a3
{
}

- (CSAttSiriAudioMetricsNode)audioMetricsNode
{
  return self->_audioMetricsNode;
}

- (void)setAudioMetricsNode:(id)a3
{
}

- (CSIntuitiveConversationLogger)signalsLogger
{
  return self->_signalsLogger;
}

- (void)setSignalsLogger:(id)a3
{
}

- (BOOL)supportTCU
{
  return self->_supportTCU;
}

- (void)setSupportTCU:(BOOL)a3
{
  self->_supportTCU = a3;
}

- (NSString)dismissedRequestId
{
  return self->_dismissedRequestId;
}

- (void)setDismissedRequestId:(id)a3
{
}

- (NSString)currentRequestId
{
  return self->_currentRequestId;
}

- (void)setCurrentRequestId:(id)a3
{
}

- (NSString)recordingEventUUIDToIgnore
{
  return self->_recordingEventUUIDToIgnore;
}

- (void)setRecordingEventUUIDToIgnore:(id)a3
{
}

- (CSAttSiriMagusSupportedPolicy)magusSupportedPolicy
{
  return self->_magusSupportedPolicy;
}

- (void)setMagusSupportedPolicy:(id)a3
{
}

- (BOOL)audioSessionMonitoringInProgress
{
  return self->_audioSessionMonitoringInProgress;
}

- (void)setAudioSessionMonitoringInProgress:(BOOL)a3
{
  self->_audioSessionMonitoringInProgress = a3;
}

- (CSAudioSessionInfoProvider)audioSessionInfoProvider
{
  return self->_audioSessionInfoProvider;
}

- (void)setAudioSessionInfoProvider:(id)a3
{
}

- (BOOL)isPromptRequestImpending
{
  return self->_isPromptRequestImpending;
}

- (void)setIsPromptRequestImpending:(BOOL)a3
{
  self->_isPromptRequestImpending = a3;
}

- (void).cxx_destruct
{
}

@end