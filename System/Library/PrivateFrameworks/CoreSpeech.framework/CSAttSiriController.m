@interface CSAttSiriController
- (BOOL)_shouldFetchMitigationAssets;
- (BOOL)boronScore;
- (BOOL)deferredActivation;
- (BOOL)deferredAsrResults;
- (BOOL)getPendingActivationStatus;
- (BOOL)isCurrentRequestCCTriggered;
- (BOOL)isDeferredActivationEnabled;
- (BOOL)pendingActivationProcessing;
- (BOOL)shouldSkipAttending;
- (CSAsset)mitigationAsset;
- (CSAsset)vtAsset;
- (CSAttSiriAFTMNode)aFTMNode;
- (CSAttSiriAsrNode)asrNode;
- (CSAttSiriAttendingAudioSrcNode)attendingAudioNode;
- (CSAttSiriAudioSessionStateClient)siriStateClient;
- (CSAttSiriAudioSrcNode)audioSrcNode;
- (CSAttSiriContConvController)ccController;
- (CSAttSiriController)init;
- (CSAttSiriController)initWithEndpointerNode:(id)a3 osdNode:(id)a4 ssrNode:(id)a5 asrNode:(id)a6 uresNode:(id)a7 needsSSRNode:(BOOL)a8 aFtmNode:(id)a9 speechDetectionNode:(id)a10 ccController:(id)a11 isContinuousConverationEnabled:(BOOL)a12 speechManager:(id)a13 siriEnabledMonitor:(id)a14 siriClientBehaviorMonitor:(id)a15 rcHandler:(id)a16 supportsAcousticProgressiveChecker:(BOOL)a17 supportsUnderstandingOnDevice:(BOOL)a18 requireASROnDevice:(BOOL)a19 supportsHybridUnderstandingOnDevice:(BOOL)a20;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriNLDAClassifierNode)nldaClassifierNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriRCHandler)rcHandler;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSpeechDetectionNode)speechDetectionNode;
- (CSAttSiriUresNode)uresNode;
- (CSAudioRecordContext)audioRecordContext;
- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor;
- (CSAudioStartStreamOption)siriClientAudioStartStreamOption;
- (CSAudioStream)siriClientStream;
- (CSConnectionListener)attSiriSvcListener;
- (CSOSTransaction)attSiriTransaction;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSiriEnabledMonitor)siriEnabledMonitor;
- (CSSpeechManager)speechManager;
- (NSMapTable)nodesCache;
- (NSString)requestMHUUID;
- (OS_dispatch_queue)mitigationAssetFetchQueue;
- (OS_dispatch_queue)queue;
- (id)_startStreamOption;
- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3;
- (id)getNodeOfType:(unint64_t)a3;
- (id)getRequestMHUUID;
- (int64_t)hearstRouteStatus;
- (unint64_t)activationStartSampleId;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_detachAttendingStreamAndAttachSiriClientStream;
- (void)_detachSiriClientStreamAndAttachAttendingStream;
- (void)_fetchMitigationAssets;
- (void)_fetchRequiredAssets;
- (void)_fetchVoiceTriggerAssets;
- (void)_forceBuildGraph:(BOOL)a3;
- (void)_handleCCTriggeredRequestStart;
- (void)_handleCCTriggeredRequestStop;
- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5;
- (void)_handleStopProcessing;
- (void)_holdAttSiriTransactionIfNeeded;
- (void)_prepareAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4;
- (void)_receivedHearstRoutedEvent:(int64_t)a3;
- (void)_reconfigureRequiredNodes:(id)a3 enforceAttendingAudioNode:(BOOL)a4;
- (void)_releaseAttSiriTransactionIfNeeded;
- (void)_resetAttendingState;
- (void)_setPendingActivationStatus:(BOOL)a3;
- (void)_setupAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4;
- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3;
- (void)_startAudioStreamForContinuousConversation:(id)a3 withStartStreamOption:(id)a4;
- (void)_startProcessingContinuousConversationRequest:(unint64_t)a3;
- (void)_tearDownBuildGraph:(id)a3;
- (void)_triggerSiriActivation;
- (void)attSiriAttendingAudioSrcNodeDidStopUnexpectedly:(id)a3;
- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attSiriNode:(id)a3 didDetectSpeechWithTriggerInfo:(id)a4;
- (void)attSiriNodeDidNotDetectSpeechWithTimeout;
- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4;
- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)handleAttendingAudioStopUnexpectedly;
- (void)handleAudioStopUnexpectedly;
- (void)handleEndOfAttendingForRequestId:(id)a3;
- (void)handleOrbTransition;
- (void)notifySiriSessionStateChange:(BOOL)a3;
- (void)resetAttendingState;
- (void)setAFTMNode:(id)a3;
- (void)setActivationStartSampleId:(unint64_t)a3;
- (void)setAsrNode:(id)a3;
- (void)setAttSiriSvcListener:(id)a3;
- (void)setAttSiriTransaction:(id)a3;
- (void)setAttendingAudioNode:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAudioRouteChangeMonitor:(id)a3;
- (void)setAudioSrcNode:(id)a3;
- (void)setBoronScore:(BOOL)a3;
- (void)setCcController:(id)a3;
- (void)setDeferredActivation:(BOOL)a3;
- (void)setDeferredAsrResults:(BOOL)a3;
- (void)setEndpointerNode:(id)a3;
- (void)setHearstRouteStatus:(int64_t)a3;
- (void)setMitigationAsset:(id)a3;
- (void)setMitigationAssetFetchQueue:(id)a3;
- (void)setNldaClassifierNode:(id)a3;
- (void)setNodesCache:(id)a3;
- (void)setOsdNode:(id)a3;
- (void)setPendingActivationProcessing:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRcHandler:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setShouldSkipAttending:(BOOL)a3;
- (void)setSiriClientAudioStartStreamOption:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSiriClientStream:(id)a3;
- (void)setSiriEnabledMonitor:(id)a3;
- (void)setSiriStateClient:(id)a3;
- (void)setSpeechDetectionNode:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSsrNode:(id)a3;
- (void)setUresNode:(id)a3;
- (void)setVtAsset:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)siriMitigator:(id)a3 mitigationDecision:(unint64_t)a4;
- (void)start;
- (void)startAttendingWithContext:(id)a3;
- (void)startSpeechProcessing:(unint64_t)a3;
- (void)stopAttendingWithContext:(id)a3;
- (void)triggerSiriActivation;
- (void)updateSiriOrbLocation:(CGRect)a3;
@end

@implementation CSAttSiriController

- (CSAttSiriController)init
{
  id v3 = +[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled");
  if ((v3 & 1) != 0)
  {
    v5 = 0LL;
  }

  else
  {
    if ((CSIsCommunalDevice(v3, v4) & 1) != 0) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = CSIsAppleSiliconMac();
    }
    unsigned __int8 v7 = +[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported");
    unsigned __int8 v8 = +[CSUtils supportAcousticProgressiveChecker]( &OBJC_CLASS___CSUtils,  "supportAcousticProgressiveChecker");
    unsigned __int8 v9 = +[CSUtils supportsUnderstandingOnDevice]( &OBJC_CLASS___CSUtils,  "supportsUnderstandingOnDevice");
    if ((+[CSUtils supportsSpeechRecognitionOnDevice]( &OBJC_CLASS___CSUtils,  "supportsSpeechRecognitionOnDevice") & 1) != 0) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = +[CSUtils supportVoiceID](&OBJC_CLASS___CSUtils, "supportVoiceID");
    }
    BYTE3(v13) = +[CSUtils supportsHybridUnderstandingOnDevice]( &OBJC_CLASS___CSUtils,  "supportsHybridUnderstandingOnDevice");
    BYTE2(v13) = v10;
    BYTE1(v13) = v9;
    LOBYTE(v13) = v8;
    LOBYTE(v12) = v7;
    self =  -[CSAttSiriController initWithEndpointerNode:osdNode:ssrNode:asrNode:uresNode:needsSSRNode:aFtmNode:speechDetectionNode:ccController:isContinuousConverationEnabled:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:rcHandler:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnderstandingOnDevice:]( self,  "initWithEndpointerNode:osdNode:ssrNode:asrNode:uresNode:needsSSRNode:aFtmNode:speechDetectionNode:ccContr oller:isContinuousConverationEnabled:speechManager:siriEnabledMonitor:siriClientBehaviorMonitor:rcHandler :supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevice:supportsHybridUnders tandingOnDevice:",  0LL,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  v12,  0LL,  0LL,  0LL,  0LL,  v13);
    v5 = self;
  }

  return v5;
}

- (CSAttSiriController)initWithEndpointerNode:(id)a3 osdNode:(id)a4 ssrNode:(id)a5 asrNode:(id)a6 uresNode:(id)a7 needsSSRNode:(BOOL)a8 aFtmNode:(id)a9 speechDetectionNode:(id)a10 ccController:(id)a11 isContinuousConverationEnabled:(BOOL)a12 speechManager:(id)a13 siriEnabledMonitor:(id)a14 siriClientBehaviorMonitor:(id)a15 rcHandler:(id)a16 supportsAcousticProgressiveChecker:(BOOL)a17 supportsUnderstandingOnDevice:(BOOL)a18 requireASROnDevice:(BOOL)a19 supportsHybridUnderstandingOnDevice:(BOOL)a20
{
  BOOL v91 = a8;
  id v24 = a3;
  id v25 = a4;
  id v97 = a5;
  id v96 = a6;
  id v95 = a7;
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  id v29 = a13;
  v30 = v24;
  id v31 = a14;
  id v32 = a15;
  id v33 = a16;
  v100.receiver = self;
  v100.super_class = (Class)&OBJC_CLASS___CSAttSiriController;
  v34 = -[CSAttSiriController init](&v100, "init");
  if (!v34) {
    goto LABEL_59;
  }
  v94 = v25;
  dispatch_queue_t v35 = dispatch_queue_create("AttSiriController queue", 0LL);
  queue = v34->_queue;
  v34->_queue = (OS_dispatch_queue *)v35;

  dispatch_queue_attr_t v37 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  v89 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v37);
  dispatch_queue_t v38 = dispatch_queue_create("AttSiriController mitigation asset fetch queue", v89);
  mitigationAssetFetchQueue = v34->_mitigationAssetFetchQueue;
  v34->_mitigationAssetFetchQueue = (OS_dispatch_queue *)v38;

  uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
  nodesCache = v34->_nodesCache;
  v34->_nodesCache = (NSMapTable *)v40;

  v34->_activationStartSampleId = 0LL;
  -[CSAttSiriController setPendingActivationProcessing:](v34, "setPendingActivationProcessing:", 0LL);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v34->_deferredActivation = [v42 isDeferredActivationEnabled];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v34->_deferredAsrResults = [v43 isDeferredAsrResultsEnabled];

  v90 = v30;
  if (v30) {
    v44 = v30;
  }
  else {
    v44 = objc_alloc_init(&OBJC_CLASS___CSAttSiriEndpointerNode);
  }
  endpointerNode = v34->_endpointerNode;
  v34->_endpointerNode = v44;

  -[CSAttSiriEndpointerNode setDelegate:](v34->_endpointerNode, "setDelegate:", v34);
  -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_endpointerNode, &off_100238B98);
  if (v91)
  {
    if (v97) {
      v46 = (CSAttSiriSSRNode *)v97;
    }
    else {
      v46 = objc_alloc_init(&OBJC_CLASS___CSAttSiriSSRNode);
    }
    ssrNode = v34->_ssrNode;
    v34->_ssrNode = v46;

    -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_ssrNode, &off_100238BB0, v89);
  }

  id v48 = v26;
  if (a19 || a20)
  {
    if (v96) {
      v49 = (CSAttSiriAsrNode *)v96;
    }
    else {
      v49 = objc_alloc_init(&OBJC_CLASS___CSAttSiriAsrNode);
    }
    asrNode = v34->_asrNode;
    v34->_asrNode = v49;

    -[CSAttSiriAsrNode registerEndpointerNode:](v34->_asrNode, "registerEndpointerNode:", v34->_endpointerNode);
    -[CSAttSiriAsrNode registerSSRNode:](v34->_asrNode, "registerSSRNode:", v34->_ssrNode);
    -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_asrNode, &off_100238BC8);
  }

  id v92 = v27;
  id v51 = v28;
  id v25 = v94;
  if (a18 || a20)
  {
    if (v95) {
      v52 = (CSAttSiriUresNode *)v95;
    }
    else {
      v52 = objc_alloc_init(&OBJC_CLASS___CSAttSiriUresNode);
    }
    uresNode = v34->_uresNode;
    v34->_uresNode = v52;

    -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_uresNode, &off_100238BE0);
    -[CSAttSiriUresNode setMitigatorDelegate:](v34->_uresNode, "setMitigatorDelegate:", v34);
    v54 = objc_alloc_init(&OBJC_CLASS___CSAttSiriNLDAClassifierNode);
    nldaClassifierNode = v34->_nldaClassifierNode;
    v34->_nldaClassifierNode = v54;

    -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_nldaClassifierNode, &off_100238BF8);
    -[CSAttSiriUresNode registerNLDAClassifierNode:]( v34->_uresNode,  "registerNLDAClassifierNode:",  v34->_nldaClassifierNode);
    -[CSAttSiriAsrNode registerUresNode:](v34->_asrNode, "registerUresNode:", v34->_uresNode);
    -[CSAttSiriUresNode registerSSRNode:](v34->_uresNode, "registerSSRNode:", v34->_ssrNode);
    if (v33) {
      v56 = (CSAttSiriRCHandler *)v33;
    }
    else {
      v56 = -[CSAttSiriRCHandler initWithEndpointerNode:uresNode:]( objc_alloc(&OBJC_CLASS___CSAttSiriRCHandler),  "initWithEndpointerNode:uresNode:",  v34->_endpointerNode,  v34->_uresNode);
    }
    rcHandler = v34->_rcHandler;
    v34->_rcHandler = v56;
  }

  if (a17)
  {
    if (v26) {
      v58 = (CSAttSiriAFTMNode *)v26;
    }
    else {
      v58 = objc_alloc_init(&OBJC_CLASS___CSAttSiriAFTMNode);
    }
    aFTMNode = v34->_aFTMNode;
    v34->_aFTMNode = v58;

    -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_aFTMNode, &off_100238C10);
  }

  v34->_boronScore = 0;
  if (a12)
  {
    if (v28) {
      v60 = (CSAttSiriContConvController *)v28;
    }
    else {
      v60 = -[CSAttSiriContConvController initWithAttSiriController:]( objc_alloc(&OBJC_CLASS___CSAttSiriContConvController),  "initWithAttSiriController:",  v34);
    }
    ccController = v34->_ccController;
    v34->_ccController = v60;

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContConvController nodesCache](v34->_ccController, "nodesCache"));
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472LL;
    v98[2] = sub_1000EF368;
    v98[3] = &unk_10022D1A8;
    v64 = v34;
    v99 = v64;
    [v63 enumerateKeysAndObjectsUsingBlock:v98];

    -[CSAttSiriContConvController setNodesCache:](v34->_ccController, "setNodesCache:", 0LL);
    uint64_t v65 = objc_claimAutoreleasedReturnValue(-[CSAttSiriContConvController osdNode](v34->_ccController, "osdNode"));
    osdNode = v64->_osdNode;
    v64->_osdNode = (CSAttSiriOSDNode *)v65;

    if (CSIsIOS(v67, v68))
    {
      v69 = v64->_uresNode;
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContConvController gazeNode](v34->_ccController, "gazeNode"));
      -[CSAttSiriUresNode registerGazeNode:](v69, "registerGazeNode:", v70);

      id v26 = v48;
    }

    -[CSAttSiriUresNode registerOSDNode:](v64->_uresNode, "registerOSDNode:", v64->_osdNode, v89);
    id v71 = -[CSAttSiriUresNode registerNLDAClassifierNode:]( v64->_uresNode,  "registerNLDAClassifierNode:",  v64->_nldaClassifierNode);
    v64->_shouldSkipAttending = 0;
    id v25 = v94;
    if (CSIsHorseman(v71, v72))
    {
      v73 = -[CSAttSiriAudioSessionStateClient initWithDelegate:]( objc_alloc(&OBJC_CLASS___CSAttSiriAudioSessionStateClient),  "initWithDelegate:",  v64);
      siriStateClient = v64->_siriStateClient;
      v64->_siriStateClient = v73;

      v75 = v64->_siriStateClient;
      v76 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (v75)
      {
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v102 = "-[CSAttSiriController initWithEndpointerNode:osdNode:ssrNode:asrNode:uresNode:needsSSRNode:aFtmNode:spe"
                 "echDetectionNode:ccController:isContinuousConverationEnabled:speechManager:siriEnabledMonitor:siriClien"
                 "tBehaviorMonitor:rcHandler:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASRO"
                 "nDevice:supportsHybridUnderstandingOnDevice:]";
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "%s initialized SiriSession State client",  buf,  0xCu);
        }
      }

      else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[CSAttSiriController initWithEndpointerNode:osdNode:ssrNode:asrNode:uresNode:needsSSRNode:aFtmNode:speec"
               "hDetectionNode:ccController:isContinuousConverationEnabled:speechManager:siriEnabledMonitor:siriClientBeh"
               "aviorMonitor:rcHandler:supportsAcousticProgressiveChecker:supportsUnderstandingOnDevice:requireASROnDevic"
               "e:supportsHybridUnderstandingOnDevice:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "%s Failed to start SiriSession State client!",  buf,  0xCu);
      }
    }

    id v28 = v51;
    id v27 = v92;
    if (!v92) {
      goto LABEL_48;
    }
  }

  else
  {
    if (v94) {
      v61 = v94;
    }
    else {
      v61 = objc_alloc_init(&OBJC_CLASS___CSAttSiriOSDNode);
    }
    v77 = v34->_osdNode;
    v34->_osdNode = v61;
    id v27 = v92;

    -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_osdNode, &off_100238C28);
    if (!v92)
    {
LABEL_48:
      v78 = objc_alloc_init(&OBJC_CLASS___CSAttSiriSpeechDetectionNode);
      goto LABEL_49;
    }
  }

  v78 = (CSAttSiriSpeechDetectionNode *)v27;
LABEL_49:
  speechDetectionNode = v34->_speechDetectionNode;
  v34->_speechDetectionNode = v78;

  -[CSAttSiriSpeechDetectionNode setDelegate:](v34->_speechDetectionNode, "setDelegate:", v34);
  -[NSMapTable setObject:forKey:](v34->_nodesCache, "setObject:forKey:", v34->_speechDetectionNode, &off_100238C40);
  -[CSAttSiriSpeechDetectionNode registerOSDNode:](v34->_speechDetectionNode, "registerOSDNode:", v34->_osdNode);
  if (v29) {
    v80 = (CSSpeechManager *)v29;
  }
  else {
    v80 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  }
  speechManager = v34->_speechManager;
  v34->_speechManager = v80;

  if (v31) {
    v82 = (CSSiriEnabledMonitor *)v31;
  }
  else {
    v82 = (CSSiriEnabledMonitor *)objc_claimAutoreleasedReturnValue( +[CSSiriEnabledMonitor sharedInstance]( &OBJC_CLASS___CSSiriEnabledMonitor,  "sharedInstance"));
  }
  siriEnabledMonitor = v34->_siriEnabledMonitor;
  v34->_siriEnabledMonitor = v82;

  if (v32) {
    v84 = (CSSiriClientBehaviorMonitor *)v32;
  }
  else {
    v84 = (CSSiriClientBehaviorMonitor *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
  }
  siriClientBehaviorMonitor = v34->_siriClientBehaviorMonitor;
  v34->_siriClientBehaviorMonitor = v84;

  -[CSSiriClientBehaviorMonitor registerObserver:](v34->_siriClientBehaviorMonitor, "registerObserver:", v34);
  uint64_t v86 = objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  audioRouteChangeMonitor = v34->_audioRouteChangeMonitor;
  v34->_audioRouteChangeMonitor = (CSAudioRouteChangeMonitor *)v86;

  v30 = v90;
LABEL_59:

  return v34;
}

- (id)getNodeOfType:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned __int8 v10 = sub_1000ED220;
  v11 = sub_1000ED230;
  id v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EF2FC;
  block[3] = &unk_10022D9D0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_async_and_wait(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EF264;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isDeferredActivationEnabled
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EF250;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCurrentRequestCCTriggered
{
  char v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSAttSiriController isCurrentRequestCCTriggered]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EF21C;
  v7[3] = &unk_10022EF80;
  v7[4] = self;
  v7[5] = &buf;
  dispatch_sync(queue, v7);
  char v5 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);
  _Block_object_dispose(&buf, 8);
  return v5;
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    v17 = "-[CSAttSiriController siriClientBehaviorMonitor:willStartStreamWithContext:option:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s context : %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EEF90;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EEB48;
  block[3] = &unk_10022DC10;
  block[4] = self;
  id v19 = v11;
  BOOL v22 = a5;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000EEB3C;
  v6[3] = &unk_10022F020;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EEA8C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 fetchedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE930;
  block[3] = &unk_10022ECA8;
  BOOL v12 = a5;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 preparedSiriClientAudioStream:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE7D4;
  block[3] = &unk_10022ECA8;
  BOOL v12 = a5;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)CSSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v11 = "-[CSAttSiriController CSSiriEnabledMonitor:didReceiveEnabled:]";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Siri enabled : %{public}d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EE7C0;
  v8[3] = &unk_10022EFA8;
  BOOL v9 = v4;
  v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)siriMitigator:(id)a3 mitigationDecision:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1) {
      -[CSAttSiriController _resetAttendingState](self, "_resetAttendingState");
    }
  }

  else
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EE7B8;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(v7, block);
  }
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE774;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectSpeechWithTriggerInfo:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EE6E4;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriNodeDidNotDetectSpeechWithTimeout
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE6A4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifySiriSessionStateChange:(BOOL)a3
{
  if (CSIsHorseman(self, a2))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000EE5CC;
    v6[3] = &unk_10022EFA8;
    BOOL v7 = a3;
    v6[4] = self;
    dispatch_async(queue, v6);
  }

- (void)_tearDownBuildGraph:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requiredNodes", 0));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_nodesCache,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9)));
        id v11 = v10;
        if (v10) {
          [v10 removeReceiver:v4];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  [v4 setIsReady:0];
}

- (void)_reconfigureRequiredNodes:(id)a3 enforceAttendingAudioNode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v47 = "-[CSAttSiriController _reconfigureRequiredNodes:enforceAttendingAudioNode:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v31 = v6;
  if ([v6 isContinuousConversation])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned __int8 v9 = [v8 isDeferredActivationEnabled];

    if ((v9 & 1) == 0 && !v4) {
      goto LABEL_6;
    }
  }

  else if (!v4)
  {
LABEL_6:
    char v10 = &off_100238C58;
    goto LABEL_9;
  }

  char v10 = &off_100238C70;
LABEL_9:
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  obj = self->_nodesCache;
  id v12 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v53,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v43;
    uint64_t v32 = *(void *)v43;
    id v33 = self;
    do
    {
      uint64_t v15 = 0LL;
      id v34 = v13;
      do
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v15;
        id v16 = *(void **)(*((void *)&v42 + 1) + 8 * v15);
        if (([v16 isEqual:&off_100238C40] & 1) == 0)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_nodesCache, "objectForKey:", v16));
          if (v17)
          {
            __int16 v18 = v17;
            -[CSAttSiriController _tearDownBuildGraph:](self, "_tearDownBuildGraph:", v17);
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            v36 = v18;
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 requiredNodes]);
            id v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
            if (v20)
            {
              id v21 = v20;
              char v22 = 0;
              uint64_t v23 = *(void *)v39;
              do
              {
                for (i = 0LL; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v39 != v23) {
                    objc_enumerationMutation(v19);
                  }
                  id v25 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
                  if (([v25 isEqual:&off_100238C58] & 1) != 0
                    || ([v25 isEqual:&off_100238C70] & 1) != 0)
                  {
                    if ((v22 & 1) == 0) {
                      -[NSMutableArray addObject:](v11, "addObject:", v10);
                    }
                    char v22 = 1;
                  }

                  else
                  {
                    -[NSMutableArray addObject:](v11, "addObject:", v25);
                  }
                }

                id v21 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
              }

              while (v21);
            }

            id v26 = -[NSMutableArray copy](v11, "copy");
            [v36 setRequiredNodes:v26];

            -[NSMutableArray removeAllObjects](v11, "removeAllObjects");
            id v27 = (void *)CSLogContextFacilityCoreSpeech;
            BOOL v28 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
            id v17 = v36;
            uint64_t v14 = v32;
            self = v33;
            id v13 = v34;
            if (v28)
            {
              id v29 = v27;
              v30 = (void *)objc_claimAutoreleasedReturnValue([v36 requiredNodes]);
              *(_DWORD *)__int128 buf = 136315650;
              v47 = "-[CSAttSiriController _reconfigureRequiredNodes:enforceAttendingAudioNode:]";
              __int16 v48 = 2112;
              v49 = v36;
              __int16 v50 = 2112;
              id v51 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s currDp:%@ newRequiredNodes:%@",  buf,  0x20u);

              id v17 = v36;
            }
          }
        }

        uint64_t v15 = v37 + 1;
      }

      while ((id)(v37 + 1) != v13);
      id v13 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v53,  16LL);
    }

    while (v13);
  }
}

- (void)_forceBuildGraph:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  obj = self->_nodesCache;
  id v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v39,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&__int128 v6 = 136315394LL;
    __int128 v22 = v6;
    uint64_t v23 = *(void *)v31;
    do
    {
      unsigned __int8 v9 = 0LL;
      id v24 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        char v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_nodesCache,  "objectForKey:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v9),  v22));
        else {
          BOOL v11 = 0;
        }
        if (!v11)
        {
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 requiredNodes]);
          id v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (!v13)
          {

            [v10 setIsReady:1];
LABEL_23:
            id v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = v22;
              dispatch_queue_t v35 = "-[CSAttSiriController _forceBuildGraph:]";
              __int16 v36 = 2112;
              uint64_t v37 = v10;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s %@ is ready", buf, 0x16u);
            }

            goto LABEL_25;
          }

          id v14 = v13;
          BOOL v15 = v3;
          uint64_t v16 = *(void *)v27;
          char v17 = 1;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v12);
              }
              id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_nodesCache,  "objectForKey:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i)));
              id v20 = v19;
              if (v19) {
                [v19 addReceiver:v10];
              }
              else {
                char v17 = 0;
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }

          while (v14);

          [v10 setIsReady:v17 & 1];
          BOOL v3 = v15;
          uint64_t v8 = v23;
          id v7 = v24;
          if ((v17 & 1) != 0) {
            goto LABEL_23;
          }
        }

- (void)_fetchMitigationAssets
{
  mitigationAssetFetchQueue = (dispatch_queue_s *)self->_mitigationAssetFetchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE314;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(mitigationAssetFetchQueue, block);
}

- (void)_fetchVoiceTriggerAssets
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000EE0DC;
  v4[3] = &unk_10022E340;
  v4[4] = self;
  [v3 getVoiceTriggerAssetWithEndpointId:0 completion:v4];
}

- (BOOL)_shouldFetchMitigationAssets
{
  if ((AFDeviceSupportsFullSiriUOD(self, a2) & 1) != 0) {
    return 1;
  }
  else {
    return AFDeviceSupportsHybridUOD();
  }
}

- (void)_fetchRequiredAssets
{
  if (-[CSAttSiriController _shouldFetchMitigationAssets](self, "_shouldFetchMitigationAssets")) {
    -[CSAttSiriController _fetchMitigationAssets](self, "_fetchMitigationAssets");
  }
}

- (void)_setupAudioSrcNodeWithSiriClientStream:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    unsigned __int8 v9 = "-[CSAttSiriController _setupAudioSrcNodeWithSiriClientStream:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s siriClientStream:%@", (uint8_t *)&v8, 0x16u);
  }

  __int128 v6 = -[CSAttSiriAudioSrcNode initWithTargetQueue:]( objc_alloc(&OBJC_CLASS___CSAttSiriAudioSrcNode),  "initWithTargetQueue:",  0LL);
  -[CSAttSiriAudioSrcNode setDelegate:](v6, "setDelegate:", self);
  if (v6)
  {
    -[NSMapTable setObject:forKey:](self->_nodesCache, "setObject:forKey:", v6, &off_100238C58);
    -[CSAttSiriController setAudioSrcNode:](self, "setAudioSrcNode:", v6);
    -[CSAttSiriController _forceBuildGraph:](self, "_forceBuildGraph:", 1LL);
    -[CSAttSiriController _detachAttendingStreamAndAttachSiriClientStream]( self,  "_detachAttendingStreamAndAttachSiriClientStream");
    -[CSAttSiriAudioSrcNode attachToMasterStream:name:completion:]( v6,  "attachToMasterStream:name:completion:",  v4,  @"CSAttSiriAudioSrcNode",  &stru_10022D208);
  }

  else
  {
    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      unsigned __int8 v9 = "-[CSAttSiriController _setupAudioSrcNodeWithSiriClientStream:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Failed to setup audioSrcNode",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_setupAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4
{
  speechManager = self->_speechManager;
  id v7 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSpeechManager audioProviderWithUUID:](speechManager, "audioProviderWithUUID:", a4));
  unsigned __int8 v9 = -[CSAttSiriAttendingAudioSrcNode initWithAudioStreamProvider:streamName:streamRequest:]( objc_alloc(&OBJC_CLASS___CSAttSiriAttendingAudioSrcNode),  "initWithAudioStreamProvider:streamName:streamRequest:",  v8,  0LL,  v7);

  -[CSAttSiriAttendingAudioSrcNode setDelegate:](v9, "setDelegate:", self);
  if (v9)
  {
    -[NSMapTable setObject:forKey:](self->_nodesCache, "setObject:forKey:", v9, &off_100238C70);
    -[CSAttSiriAttendingAudioSrcNode setIsWeakStream:](v9, "setIsWeakStream:", 0LL);
    -[CSAttSiriController setAttendingAudioNode:](self, "setAttendingAudioNode:", v9);
    -[CSAttSiriController _forceBuildGraph:](self, "_forceBuildGraph:", 1LL);
    __int16 v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      BOOL v15 = "-[CSAttSiriController _setupAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Attached attending audio src node",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    id v11 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([0 localizedDescription]);
      int v14 = 136315394;
      BOOL v15 = "-[CSAttSiriController _setupAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
      __int16 v16 = 2114;
      char v17 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to setup audioSrcNode : %{public}@",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)_prepareAttendingAudioSrcNodeWithStreamRequest:(id)a3 audioProviderUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    char v17 = "-[CSAttSiriController _prepareAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s streamRequest:%@", buf, 0x16u);
  }

  -[CSAttSiriController _setupAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]( self,  "_setupAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:",  v6,  v7);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController attendingAudioNode](self, "attendingAudioNode"));
  id v15 = 0LL;
  [v9 prepareAudioStreamSyncWithRequest:v6 error:&v15];
  id v10 = v15;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController attendingAudioNode](self, "attendingAudioNode"));
  if (!v11 || v10)
  {
    id v12 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
      *(_DWORD *)__int128 buf = 136315394;
      char v17 = "-[CSAttSiriController _prepareAttendingAudioSrcNodeWithStreamRequest:audioProviderUUID:]";
      __int16 v18 = 2114;
      id v19 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Failed to prepare audioSrcNode : %{public}@",  buf,  0x16u);
    }
  }
}

- (void)_detachSiriClientStreamAndAttachAttendingStream
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSAttSiriController _detachSiriClientStreamAndAttachAttendingStream]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[CSAttSiriAudioSrcNode removeReceiver:](self->_audioSrcNode, "removeReceiver:", self->_osdNode);
  -[CSAttSiriAttendingAudioSrcNode addReceiver:](self->_attendingAudioNode, "addReceiver:", self->_osdNode);
}

- (void)_detachAttendingStreamAndAttachSiriClientStream
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSAttSiriController _detachAttendingStreamAndAttachSiriClientStream]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[CSAttSiriAttendingAudioSrcNode removeReceiver:](self->_attendingAudioNode, "removeReceiver:", self->_osdNode);
  -[CSAttSiriAudioSrcNode addReceiver:](self->_audioSrcNode, "addReceiver:", self->_osdNode);
}

- (void)_handleStartProcessingWithRecordContext:(id)a3 withAudioStartStreamOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v32 = "-[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if ([v8 isVoiceTriggered])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEventInfoProvider sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEventInfoProvider,  "sharedInstance"));
    id v30 = 0LL;
    [v12 fetchVoiceTriggerInfoWithAudioContext:v8 resultVoiceTriggerInfo:&v30 resultRTSTriggerInfo:0];
    id v13 = v30;
  }

  else
  {
    id v13 = 0LL;
  }

  if ([v8 type] == (id)17 || objc_msgSend(v8, "type") == (id)18)
  {
    int v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v32 = "-[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Skip processing for remora requests!",  buf,  0xCu);
    }
  }

  else
  {
    if (+[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported")) {
      -[CSAttSiriController _reconfigureRequiredNodes:enforceAttendingAudioNode:]( self,  "_reconfigureRequiredNodes:enforceAttendingAudioNode:",  v8,  0LL);
    }
    self->_shouldSkipAttending = 0;
    -[CSAttSiriController _holdAttSiriTransactionIfNeeded](self, "_holdAttSiriTransactionIfNeeded");
    endpointerNode = self->_endpointerNode;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    -[CSAttSiriEndpointerNode resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]( endpointerNode,  "resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:",  (unint64_t)v16,  v8,  v9,  v13);
    -[CSAttSiriOSDNode setPrefetchedAsset:](self->_osdNode, "setPrefetchedAsset:", self->_mitigationAsset);
    -[CSAttSiriUresNode setPrefetchedAsset:](self->_uresNode, "setPrefetchedAsset:", self->_mitigationAsset);
    __int128 v29 = -[CSEndpointerSettings initWithDisableEndpointer:]( [CSEndpointerSettings alloc],  "initWithDisableEndpointer:",  [v9 disableEndpointer]);
    -[CSAttSiriOSDNode resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:]( self->_osdNode,  "resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:",  v8);
    -[CSAttSiriAsrNode prepareToStartSpeechRequestWithStartStreamOption:audioRecordContext:voiceTriggerInfo:]( self->_asrNode,  "prepareToStartSpeechRequestWithStartStreamOption:audioRecordContext:voiceTriggerInfo:",  v9,  v8,  v13);
    char v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getCategoryKeyWithRecordCtx:](self->_mitigationAsset, "getCategoryKeyWithRecordCtx:", v8));
    if ((CSIsCommunalDevice(v17, v18) & 1) != 0
      || -[CSAsset shouldRunSpkrIdForCategory:]( self->_mitigationAsset,  "shouldRunSpkrIdForCategory:",  v17))
    {
      -[CSAttSiriSSRNode setPrefetchedAsset:](self->_ssrNode, "setPrefetchedAsset:", self->_vtAsset);
      ssrNode = self->_ssrNode;
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);
      -[CSAttSiriSSRNode resetForNewRequestWithRecordContext:voiceTriggerInfo:withReqId:]( ssrNode,  "resetForNewRequestWithRecordContext:voiceTriggerInfo:withReqId:",  v8,  v13,  v20);
    }

    id v21 = @"AcousticSLTaskTypeVoiceTrigger";
    __int128 v22 = @"AcousticSLTaskTypeVoiceTrigger";
    if ([v8 isContinuousConversation])
    {
      id v21 = @"AcousticSLTaskTypeContConv";
      uint64_t v23 = @"AcousticSLTaskTypeContConv";
    }

    -[CSAttSiriAFTMNode setPrefetchedAsset:](self->_aFTMNode, "setPrefetchedAsset:", self->_mitigationAsset);
    aFTMNode = self->_aFTMNode;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 siriSessionUUID]);
    -[CSAttSiriAFTMNode startRequestWithContext:withVtei:taskType:withRequestId:completion:]( aFTMNode,  "startRequestWithContext:withVtei:taskType:withRequestId:completion:",  v8,  v13,  v21,  v25,  &stru_10022D228);

    __int128 v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      BOOL deferredActivation = self->_deferredActivation;
      BOOL deferredAsrResults = self->_deferredAsrResults;
      *(_DWORD *)__int128 buf = 136315650;
      __int128 v32 = "-[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]";
      __int16 v33 = 1024;
      BOOL v34 = deferredActivation;
      __int16 v35 = 1024;
      BOOL v36 = deferredAsrResults;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s enabled feature: _deferredActivation:%u _deferredAsrResults:%u",  buf,  0x18u);
    }

    -[CSAttSiriController _handleCCTriggeredRequestStart](self, "_handleCCTriggeredRequestStart");
    if (+[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported")) {
      -[CSAttSiriController _forceBuildGraph:](self, "_forceBuildGraph:", 1LL);
    }
  }
}

- (void)_handleStopProcessing
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v19 = "-[CSAttSiriController _handleStopProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  -[CSAttSiriEndpointerNode stop](self->_endpointerNode, "stop");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAttSiriStateMonitor sharedInstance](&OBJC_CLASS___CSAttSiriStateMonitor, "sharedInstance"));
  unsigned __int8 v5 = [v4 isAttending];

  if ((v5 & 1) == 0) {
    -[CSAttSiriOSDNode stop](self->_osdNode, "stop");
  }
  -[CSAttSiriAFTMNode stop](self->_aFTMNode, "stop");
  -[CSAttSiriSSRNode stop](self->_ssrNode, "stop");
  -[CSAttSiriController _handleCCTriggeredRequestStop](self, "_handleCCTriggeredRequestStop");
  if (!self->_shouldSkipAttending
    && -[CSAttSiriContConvController shouldRunCCForAudioRecordContext:]( self->_ccController,  "shouldRunCCForAudioRecordContext:",  self->_audioRecordContext)
    && -[CSAttSiriAttendingAudioSrcNode isStreaming](self->_attendingAudioNode, "isStreaming"))
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v19 = "-[CSAttSiriController _handleStopProcessing]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Don't stop audioStream, continue listening for CC",  buf,  0xCu);
    }

    -[CSAttSiriController _detachSiriClientStreamAndAttachAttendingStream]( self,  "_detachSiriClientStreamAndAttachAttendingStream");
    id v7 = +[CSUtils isIOSDeviceSupportingBargeIn](&OBJC_CLASS___CSUtils, "isIOSDeviceSupportingBargeIn");
    if ((v7 & 1) != 0 || CSIsHorseman(v7, v8))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
      id v10 = (char *)[v9 phoneCallState];

      if ((unint64_t)(v10 - 2) >= 3)
      {
        -[CSAttSiriContConvController startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]( self->_ccController,  "startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:",  self->_audioRecordContext,  self->_requestMHUUID,  CSIsHorseman(v11, v12));
      }

      else
      {
        id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v19 = "-[CSAttSiriController _handleStopProcessing]";
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s skip since isRequestDuringActiveCall = YES",  buf,  0xCu);
        }
      }
    }
  }

  else
  {
    siriClientAudioStartStreamOption = self->_siriClientAudioStartStreamOption;
    self->_siriClientAudioStartStreamOption = 0LL;

    audioRecordContext = self->_audioRecordContext;
    self->_audioRecordContext = 0LL;

    attendingAudioNode = self->_attendingAudioNode;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000EDEA4;
    v17[3] = &unk_10022E730;
    v17[4] = self;
    -[CSAttSiriAttendingAudioSrcNode stopAudioStreamWithOption:completion:]( attendingAudioNode,  "stopAudioStreamWithOption:completion:",  0LL,  v17);
  }

- (void)_holdAttSiriTransactionIfNeeded
{
  if (!self->_attSiriTransaction)
  {
    BOOL v3 = -[CSOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CSOSTransaction),  "initWithDescription:",  @"attSiri transaction");
    attSiriTransaction = self->_attSiriTransaction;
    self->_attSiriTransaction = v3;
  }

- (void)_releaseAttSiriTransactionIfNeeded
{
  attSiriTransaction = self->_attSiriTransaction;
  if (attSiriTransaction)
  {
    self->_attSiriTransaction = 0LL;
  }

  else
  {
    BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      unsigned __int8 v5 = "-[CSAttSiriController _releaseAttSiriTransactionIfNeeded]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s attSiriTransaction already released",  (uint8_t *)&v4,  0xCu);
    }
  }

- (void)attSiriAttendingAudioSrcNodeDidStopUnexpectedly:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EDDE4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStopUnexpectedly:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EDD34;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startAttendingWithContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v12 = "-[CSAttSiriController startAttendingWithContext:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ctx: %{public}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EDAB0;
  v8[3] = &unk_10022EFD0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)stopAttendingWithContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v12 = "-[CSAttSiriController stopAttendingWithContext:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ctx: %{public}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000ED950;
  v8[3] = &unk_10022EFD0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)updateSiriOrbLocation:(CGRect)a3
{
}

- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4
{
}

- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSAttSiriController gazeEstimates:landmarks:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }

  -[CSAttSiriContConvController relayGazeEstimates:landmarks:]( self->_ccController,  "relayGazeEstimates:landmarks:",  v7,  x,  y);
}

- (void)handleOrbTransition
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSAttSiriController attSiriSvcListener](self, "attSiriSvcListener"));
  [v2 notifyClientsWithBlock:&stru_10022D248];
}

- (void)handleEndOfAttendingForRequestId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000ED750;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleCCTriggeredRequestStart
{
  id v3 = -[CSAudioRecordContext isContinuousConversation](self->_audioRecordContext, "isContinuousConversation");
  -[CSAttSiriContConvController stopAttendingForRequestId:isReqCC:forceStop:]( self->_ccController,  "stopAttendingForRequestId:isReqCC:forceStop:",  self->_requestMHUUID,  v3,  0LL);
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSAttSiriController _handleCCTriggeredRequestStart]";
    __int16 v9 = 1024;
    int v10 = (int)v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s isReqCC:%u", (uint8_t *)&v7, 0x12u);
  }

  ccController = self->_ccController;
  if ((_DWORD)v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContConvController attentionNode](ccController, "attentionNode"));
    [v6 addReceiver:self->_uresNode];
  }

  else
  {
    -[CSAttSiriContConvController startMagusLoggingForTriggerRequest]( ccController,  "startMagusLoggingForTriggerRequest");
  }

- (void)_handleCCTriggeredRequestStop
{
  if ((-[CSAudioRecordContext isContinuousConversation]( self->_audioRecordContext,  "isContinuousConversation") & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSAttSiriContConvController attentionNode](self->_ccController, "attentionNode"));
    [v4 removeReceiver:self->_uresNode];
  }

  else
  {
    id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v6 = "-[CSAttSiriController _handleCCTriggeredRequestStop]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Nothing to do ", buf, 0xCu);
    }
  }

- (id)_startStreamOption
{
  return -[CSAttSiriController _startStreamOptionWithMachAbsTime:]( self,  "_startStreamOptionWithMachAbsTime:",  mach_absolute_time());
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

- (void)startSpeechProcessing:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000ED5B4;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_triggerSiriActivation
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL deferredActivation = self->_deferredActivation;
    BOOL pendingActivationProcessing = self->_pendingActivationProcessing;
    int v8 = 136315650;
    __int16 v9 = "-[CSAttSiriController _triggerSiriActivation]";
    __int16 v10 = 1024;
    BOOL v11 = deferredActivation;
    __int16 v12 = 1024;
    BOOL v13 = pendingActivationProcessing;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s _deferredActivation:%u _pendingActivationProcessing:%u",  (uint8_t *)&v8,  0x18u);
  }

  if (!self->_deferredActivation)
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v8 = 136315138;
    __int16 v9 = "-[CSAttSiriController _triggerSiriActivation]";
    int v7 = "%s deferredActivation not enabled!";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 0xCu);
    return;
  }

  if (self->_pendingActivationProcessing)
  {
    -[CSAttSiriContConvController triggerActivation:]( self->_ccController,  "triggerActivation:",  self->_activationStartSampleId);
    self->_activationStartSampleId = 0LL;
    return;
  }

  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315138;
    __int16 v9 = "-[CSAttSiriController _triggerSiriActivation]";
    int v7 = "%s _pendingActivationProcessing not set!";
    goto LABEL_11;
  }

- (void)_setPendingActivationStatus:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSAttSiriController _setPendingActivationStatus:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s status:%u", (uint8_t *)&v6, 0x12u);
  }

  self->_BOOL pendingActivationProcessing = v3;
}

- (void)_startAudioStreamForContinuousConversation:(id)a3 withStartStreamOption:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    attendingAudioNode = self->_attendingAudioNode;
    *(_DWORD *)__int128 buf = 136315650;
    BOOL v13 = "-[CSAttSiriController _startAudioStreamForContinuousConversation:withStartStreamOption:]";
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    char v17 = attendingAudioNode;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s startOption:%@ _attendingAudioNode:%@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000ED414;
  v10[3] = &unk_10022EFD0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);
}

- (void)_startProcessingContinuousConversationRequest:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  int v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  requestMHUUID = self->_requestMHUUID;
  self->_requestMHUUID = v6;

  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioRecordContext deviceId](self->_audioRecordContext, "deviceId"));
  id v9 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForContinuousConversation]( &OBJC_CLASS___CSAudioRecordContext,  "contextForContinuousConversation"));
  audioRecordContext = self->_audioRecordContext;
  self->_audioRecordContext = v9;

  -[CSAudioRecordContext setDeviceId:](self->_audioRecordContext, "setDeviceId:", v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
  [v11 setStartRecordingSampleCount:a3];
  [v11 setRequestHistoricalAudioDataSampleCount:1];
  [v11 setRequestHistoricalAudioDataWithHostTime:0];
  [v11 setRequestMHUUID:self->_requestMHUUID];
  [v11 setSiriSessionUUID:self->_requestMHUUID];
  [v11 setDisableRCSelection:1];
  __int16 v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = self->_audioRecordContext;
    __int16 v14 = self->_requestMHUUID;
    *(_DWORD *)__int128 buf = 136315650;
    id v20 = "-[CSAttSiriController _startProcessingContinuousConversationRequest:]";
    __int16 v21 = 2112;
    __int128 v22 = v13;
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s recordContext:%@ _requestMHUUID:%@",  buf,  0x20u);
  }

  id v15 = self->_audioRecordContext;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000ED290;
  v17[3] = &unk_10022D270;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  -[CSAttSiriController _handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:]( self,  "_handleStartProcessingWithRecordContext:withAudioStartStreamOptions:completion:",  v15,  v16,  v17);
}

- (void)_resetAttendingState
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL deferredActivation = self->_deferredActivation;
    BOOL pendingActivationProcessing = self->_pendingActivationProcessing;
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v14 = "-[CSAttSiriController _resetAttendingState]";
    __int16 v15 = 1024;
    BOOL v16 = deferredActivation;
    __int16 v17 = 1024;
    BOOL v18 = pendingActivationProcessing;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s _deferredActivation:%u _pendingActivationProcessing:%u",  buf,  0x18u);
  }

  if (!self->_deferredActivation)
  {
    id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v14 = "-[CSAttSiriController _resetAttendingState]";
    __int16 v10 = "%s deferredActivation not enabled!";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    return;
  }

  if (self->_pendingActivationProcessing)
  {
    -[CSAttSiriController _setPendingActivationStatus:](self, "_setPendingActivationStatus:", 0LL);
    int v6 = -[CSAttSiriRequestContext initWithRequestSource:]( objc_alloc(&OBJC_CLASS___CSAttSiriRequestContext),  "initWithRequestSource:",  0LL);
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000ED260;
    v11[3] = &unk_10022EFD0;
    v11[4] = self;
    __int16 v12 = v6;
    __int16 v8 = v6;
    dispatch_async(queue, v11);

    return;
  }

  id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v14 = "-[CSAttSiriController _resetAttendingState]";
    __int16 v10 = "%s _pendingActivationProcessing not set!";
    goto LABEL_11;
  }

- (BOOL)getPendingActivationStatus
{
  uint64_t v9 = 0LL;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL pendingActivationProcessing = self->_pendingActivationProcessing;
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v14 = "-[CSAttSiriController getPendingActivationStatus]";
    __int16 v15 = 1024;
    BOOL v16 = pendingActivationProcessing;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _pendingActivationProcessing:%u", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000ED24C;
  v8[3] = &unk_10022EF80;
  void v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(queue, v8);
  char v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)getRequestMHUUID
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000ED220;
  __int16 v10 = sub_1000ED230;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000ED238;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000ED138;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_receivedHearstRoutedEvent:(int64_t)a3
{
  if (self->_hearstRouteStatus != a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSAttSiriStateMonitor sharedInstance](&OBJC_CLASS___CSAttSiriStateMonitor, "sharedInstance"));
    unsigned int v6 = [v5 isAttending];

    if (v6)
    {
      int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        uint64_t v9 = "-[CSAttSiriController _receivedHearstRoutedEvent:]";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Routed device changed during attending, stop attending",  (uint8_t *)&v8,  0xCu);
      }

      -[CSAttSiriContConvController stopAttendingForRequestId:isReqCC:forceStop:]( self->_ccController,  "stopAttendingForRequestId:isReqCC:forceStop:",  self->_requestMHUUID,  1LL,  1LL);
    }
  }

  self->_hearstRouteStatus = a3;
}

- (void)handleAudioStopUnexpectedly
{
  id v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttSiriController handleAudioStopUnexpectedly]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "%s Calling unimplemented [CSAttSiriController handleAudioStopUnexpectedly]",  (uint8_t *)&v3,  0xCu);
  }

- (void)resetAttendingState
{
  id v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttSiriController resetAttendingState]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "%s Calling unimplemented [CSAttSiriController resetAttendingState]",  (uint8_t *)&v3,  0xCu);
  }

- (void)triggerSiriActivation
{
  id v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttSiriController triggerSiriActivation]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "%s Calling unimplemented [CSAttSiriController triggerSiriActivation]",  (uint8_t *)&v3,  0xCu);
  }

- (void)handleAttendingAudioStopUnexpectedly
{
  id v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttSiriController handleAttendingAudioStopUnexpectedly]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "%s Calling unimplemented [CSAttSiriController handleAttendingAudioStopUnexpectedly]",  (uint8_t *)&v3,  0xCu);
  }

- (CSConnectionListener)attSiriSvcListener
{
  return self->_attSiriSvcListener;
}

- (void)setAttSiriSvcListener:(id)a3
{
}

- (CSAttSiriRCHandler)rcHandler
{
  return self->_rcHandler;
}

- (void)setRcHandler:(id)a3
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

- (CSAttSiriAsrNode)asrNode
{
  return self->_asrNode;
}

- (void)setAsrNode:(id)a3
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

- (OS_dispatch_queue)mitigationAssetFetchQueue
{
  return self->_mitigationAssetFetchQueue;
}

- (void)setMitigationAssetFetchQueue:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioStartStreamOption)siriClientAudioStartStreamOption
{
  return self->_siriClientAudioStartStreamOption;
}

- (void)setSiriClientAudioStartStreamOption:(id)a3
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

- (CSAttSiriSpeechDetectionNode)speechDetectionNode
{
  return self->_speechDetectionNode;
}

- (void)setSpeechDetectionNode:(id)a3
{
}

- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor
{
  return self->_audioRouteChangeMonitor;
}

- (void)setAudioRouteChangeMonitor:(id)a3
{
}

- (int64_t)hearstRouteStatus
{
  return self->_hearstRouteStatus;
}

- (void)setHearstRouteStatus:(int64_t)a3
{
  self->_hearstRouteStatus = a3;
}

- (CSAttSiriContConvController)ccController
{
  return self->_ccController;
}

- (void)setCcController:(id)a3
{
}

- (CSAttSiriAttendingAudioSrcNode)attendingAudioNode
{
  return self->_attendingAudioNode;
}

- (void)setAttendingAudioNode:(id)a3
{
}

- (BOOL)boronScore
{
  return self->_boronScore;
}

- (void)setBoronScore:(BOOL)a3
{
  self->_boronScore = a3;
}

- (BOOL)pendingActivationProcessing
{
  return self->_pendingActivationProcessing;
}

- (void)setPendingActivationProcessing:(BOOL)a3
{
  self->_BOOL pendingActivationProcessing = a3;
}

- (unint64_t)activationStartSampleId
{
  return self->_activationStartSampleId;
}

- (void)setActivationStartSampleId:(unint64_t)a3
{
  self->_activationStartSampleId = a3;
}

- (BOOL)deferredActivation
{
  return self->_deferredActivation;
}

- (void)setDeferredActivation:(BOOL)a3
{
  self->_BOOL deferredActivation = a3;
}

- (BOOL)deferredAsrResults
{
  return self->_deferredAsrResults;
}

- (void)setDeferredAsrResults:(BOOL)a3
{
  self->_BOOL deferredAsrResults = a3;
}

- (BOOL)shouldSkipAttending
{
  return self->_shouldSkipAttending;
}

- (void)setShouldSkipAttending:(BOOL)a3
{
  self->_shouldSkipAttending = a3;
}

- (CSAttSiriAudioSessionStateClient)siriStateClient
{
  return self->_siriStateClient;
}

- (void)setSiriStateClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end