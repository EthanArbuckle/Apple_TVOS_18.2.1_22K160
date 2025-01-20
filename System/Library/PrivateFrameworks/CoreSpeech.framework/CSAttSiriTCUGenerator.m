@interface CSAttSiriTCUGenerator
- (BOOL)_shouldDropPackage:(id)a3;
- (BOOL)_shouldProcessResultCandidateForTask:(id)a3;
- (BOOL)isMultiUserRequest;
- (BOOL)isSDSDAftmOperational;
- (BOOL)requestInProcess;
- (BOOL)shouldEnforceLastEagerRCSelection;
- (BOOL)shouldRefreshScores;
- (BOOL)trpCandidateDelivered;
- (BOOL)trpDetectDelivered;
- (BOOL)trpDetectSelected;
- (BOOL)useEndpointerSignal;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriTCUCache)tcuCache;
- (CSAttSiriTCUGenerator)init;
- (CSAttSiriTCUGeneratorDelegate)delegate;
- (CSAttSiriUresNode)uresNode;
- (CSEndpointDelayReporter)epdDelayReporter;
- (CSEndpointerMetrics)endpointerMetrics;
- (CSIntuitiveConvRequestHandler)requestHandler;
- (CSTCUPruner)TCUPruner;
- (CSTrpTcuMapper)tcuTrpMapper;
- (NSHashTable)executionStateReceivers;
- (NSHashTable)recognitionTaskCompletionReceivers;
- (NSHashTable)tcuReceivers;
- (NSMutableArray)multiUserTrpIdList;
- (NSMutableDictionary)multiUserTrpCache;
- (NSNumber)requestInvocationType;
- (NSString)firstTRPIdForSegment;
- (NSString)lastTRPIdForSegment;
- (NSString)mhId;
- (NSString)requestId;
- (NSUUID)turnIdentifier;
- (OS_dispatch_queue)queue;
- (id)_generateNewTRPId;
- (id)_generateSingleTCU:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5;
- (id)_generateTCUs:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5;
- (id)_generateTCUsFromExistingTCUs:(id)a3;
- (int64_t)_getPhraseTypeFromUresInvocationType:(id)a3;
- (int64_t)speechEvent;
- (void)_deliverTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6;
- (void)_deliverTRPCandidatePackage:(id)a3;
- (void)_deliverTRPDetected:(id)a3 withTRPId:(id)a4;
- (void)_doTrpTcuMappingWithTrpid:(id)a3 speechPackage:(id)a4 forceTrpSelection:(BOOL)a5;
- (void)_emitSpeechStopDetectedWithTrpId:(id)a3 withHostTime:(unint64_t)a4;
- (void)_emitTRPCreatedEventWithTRPId:(id)a3 withResultCandidateId:(id)a4 withRequestId:(id)a5;
- (void)_emitTRPRequestLinkEventWithTRPId:(id)a3 withRequestId:(id)a4;
- (void)_enforceLastEagerRCSelection;
- (void)_generateTCUCandidateWithRefershedScoresForTrpIdAsync:(id)a3;
- (void)_processMultiUserResultCandidate:(id)a3 withId:(id)a4 isScoreRefreshAllowed:(BOOL)a5;
- (void)_processResultCandidate:(id)a3 withId:(id)a4 uresInvocationType:(id)a5 isScoreRefreshAllowed:(BOOL)a6;
- (void)_reportEndpointMetrics:(id)a3 forTrpId:(id)a4;
- (void)_reset;
- (void)_sendSelectedTrpId:(id)a3 endpointerMetrics:(id)a4;
- (void)_updateRefreshScoresForPackage:(id)a3;
- (void)_updateTcuCache:(id)a3;
- (void)addRecognitionTaskCompletionReceiver:(id)a3;
- (void)addTCUReceiver:(id)a3;
- (void)addTRPCandidateExecutionStateReceiver:(id)a3;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)didReceiveFinalResultWithRequestId:(id)a3 multiUserSpeechPackage:(id)a4 taskName:(id)a5;
- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 taskName:(id)a5;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 multiUserSpeechPackage:(id)a5 topUserSpeechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)processReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4;
- (void)processTCUUpdateMessage:(id)a3;
- (void)registerEndpointerNode:(id)a3;
- (void)registerEndpointerProxy:(id)a3;
- (void)registerUresNode:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setEndpointerMetrics:(id)a3;
- (void)setEpdDelayReporter:(id)a3;
- (void)setExecutionStateReceivers:(id)a3;
- (void)setFirstTRPIdForSegment:(id)a3;
- (void)setIsMultiUserRequest:(BOOL)a3;
- (void)setIsSDSDAftmOperational:(BOOL)a3;
- (void)setLastTRPIdForSegment:(id)a3;
- (void)setMhId:(id)a3;
- (void)setMultiUserTrpCache:(id)a3;
- (void)setMultiUserTrpIdList:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecognitionTaskCompletionReceivers:(id)a3;
- (void)setRequestHandler:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequestInProcess:(BOOL)a3;
- (void)setRequestInvocationType:(id)a3;
- (void)setShouldEnforceLastEagerRCSelection:(BOOL)a3;
- (void)setShouldRefreshScores:(BOOL)a3;
- (void)setSpeechEvent:(int64_t)a3;
- (void)setTCUPruner:(id)a3;
- (void)setTcuCache:(id)a3;
- (void)setTcuReceivers:(id)a3;
- (void)setTcuTrpMapper:(id)a3;
- (void)setTrpCandidateDelivered:(BOOL)a3;
- (void)setTrpDetectDelivered:(BOOL)a3;
- (void)setTrpDetectSelected:(BOOL)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUseEndpointerSignal:(BOOL)a3;
- (void)startWithRecordContext:(id)a3 withRequestId:(id)a4;
- (void)updateAFTMOperationalStatus:(BOOL)a3 forRequestId:(id)a4;
- (void)updateInvocationType:(id)a3 forRequestId:(id)a4;
@end

@implementation CSAttSiriTCUGenerator

- (CSAttSiriTCUGenerator)init
{
  if ((+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled") & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___CSAttSiriTCUGenerator;
    v3 = -[CSAttSiriTCUGenerator init](&v29, "init");
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("CSAttSiriTCUGenerator queue", 0LL);
      v5 = (void *)*((void *)v3 + 8);
      *((void *)v3 + 8) = v4;

      v3[8] = 0;
      v6 = (void *)*((void *)v3 + 9);
      *((void *)v3 + 9) = 0LL;

      v7 = (void *)*((void *)v3 + 10);
      *((void *)v3 + 10) = 0LL;

      *((void *)v3 + 13) = 0LL;
      v8 = objc_alloc_init(&OBJC_CLASS___CSAttSiriTCUCache);
      v9 = (void *)*((void *)v3 + 14);
      *((void *)v3 + 14) = v8;

      *(_WORD *)(v3 + 9) = 0;
      v3[11] = 0;
      v10 = objc_alloc_init(&OBJC_CLASS___CSTCUPruner);
      v11 = (void *)*((void *)v3 + 12);
      *((void *)v3 + 12) = v10;

      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      v13 = (void *)*((void *)v3 + 15);
      *((void *)v3 + 15) = v12;

      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      v15 = (void *)*((void *)v3 + 16);
      *((void *)v3 + 16) = v14;

      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      v17 = (void *)*((void *)v3 + 17);
      *((void *)v3 + 17) = v16;

      v3[12] = 0;
      v18 = (void *)*((void *)v3 + 11);
      *((void *)v3 + 11) = 0LL;

      v19 = (void *)*((void *)v3 + 19);
      *((void *)v3 + 19) = 0LL;

      v3[13] = 1;
      v20 = -[CSTrpTcuMapper initWithQueue:]( objc_alloc(&OBJC_CLASS___CSTrpTcuMapper),  "initWithQueue:",  *((void *)v3 + 8));
      v21 = (void *)*((void *)v3 + 20);
      *((void *)v3 + 20) = v20;

      *((_WORD *)v3 + 7) = 257;
      v22 = (void *)*((void *)v3 + 21);
      *((void *)v3 + 21) = 0LL;

      v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v24 = (void *)*((void *)v3 + 22);
      *((void *)v3 + 22) = v23;

      v3[16] = 0;
      v25 = (os_log_s *)CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[CSAttSiriTCUGenerator init]";
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s Created CSAttSiriTCUGenerator node",  buf,  0xCu);
      }
    }

    self = v3;
    v26 = self;
  }

  else
  {
    v27 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSAttSiriTCUGenerator init]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s Medoc feature flag disabled!", buf, 0xCu);
    }

    v26 = 0LL;
  }

  return v26;
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8BE0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerUresNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8B18;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startWithRecordContext:(id)a3 withRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F89D8;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8984;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateAFTMOperationalStatus:(BOOL)a3 forRequestId:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F883C;
  block[3] = &unk_10022ECA8;
  id v10 = v6;
  v11 = self;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)updateInvocationType:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F86F0;
  block[3] = &unk_10022EA98;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)addTCUReceiver:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F85C8;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addTRPCandidateExecutionStateReceiver:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8540;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addRecognitionTaskCompletionReceiver:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F84B8;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)processTCUUpdateMessage:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F81CC;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)processReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
}

- (void)_reset
{
  v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CSAttSiriTCUGenerator _reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }

  -[CSAttSiriTCUCache clearTcuCache](self->_tcuCache, "clearTcuCache");
  firstTRPIdForSegment = self->_firstTRPIdForSegment;
  self->_firstTRPIdForSegment = 0LL;

  lastTRPIdForSegment = self->_lastTRPIdForSegment;
  self->_lastTRPIdForSegment = 0LL;

  self->_speechEvent = 0LL;
  *(_DWORD *)&self->_requestInProcess = 0;
  endpointerMetrics = self->_endpointerMetrics;
  self->_endpointerMetrics = 0LL;

  *(_WORD *)&self->_shouldEnforceLastEagerRCSelection = 257;
  self->_useEndpointerSignal = 1;
  turnIdentifier = self->_turnIdentifier;
  self->_turnIdentifier = 0LL;

  -[NSMutableArray removeAllObjects](self->_multiUserTrpIdList, "removeAllObjects");
  self->_isMultiUserRequest = 0;
  -[CSTrpTcuMapper resetForNewRequest](self->_tcuTrpMapper, "resetForNewRequest");
}

- (BOOL)_shouldProcessResultCandidateForTask:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging] & 1) != 0
    || [v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation];
  v5 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CSAttSiriTCUGenerator _shouldProcessResultCandidateForTask:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s generateTcuTrpForResultCandidate:%u",  (uint8_t *)&v7,  0x12u);
  }

  return v4;
}

- (void)_processMultiUserResultCandidate:(id)a3 withId:(id)a4 isScoreRefreshAllowed:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s requestId: %@", buf, 0x16u);
  }

  if (v7)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator _generateNewTRPId](self, "_generateNewTRPId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (!self->_multiUserTrpCache)
    {
      id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      multiUserTrpCache = self->_multiUserTrpCache;
      self->_multiUserTrpCache = v12;
    }

    self->_isMultiUserRequest = 1;
    uint64_t v54 = 0LL;
    v55 = &v54;
    uint64_t v56 = 0x2020000000LL;
    char v57 = 0;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v64 = sub_1000F27FC;
    v65 = sub_1000F280C;
    id v66 = 0LL;
    uint64_t v50 = 0LL;
    v51 = &v50;
    uint64_t v52 = 0x2020000000LL;
    char v53 = 0;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000F7C7C;
    v44[3] = &unk_10022D480;
    v47 = &v54;
    v48 = buf;
    v44[4] = self;
    v49 = &v50;
    id v14 = v8;
    id v45 = v14;
    id v15 = v11;
    id v46 = v15;
    [v7 enumerateKeysAndObjectsUsingBlock:v44];
    if (*((_BYTE *)v51 + 24))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_multiUserTrpIdList, "lastObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSTrpTcuMapper getMatchingRelaxedEPMetricsForTrp:]( self->_tcuTrpMapper,  "getMatchingRelaxedEPMetricsForTrp:",  v16));
      v18 = (os_log_s *)CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136315394;
        *(void *)&v67[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
        *(_WORD *)&v67[12] = 2112;
        *(void *)&v67[14] = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s matchingEPMetrics:%@", v67, 0x16u);
      }

      if (v17) {
        -[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]( self,  "_sendSelectedTrpId:endpointerMetrics:",  v16,  v17);
      }
    }

    else
    {
      uint64_t v58 = 0LL;
      v59 = &v58;
      uint64_t v60 = 0x2050000000LL;
      v20 = (void *)qword_100280030;
      uint64_t v61 = qword_100280030;
      if (!qword_100280030)
      {
        *(void *)v67 = _NSConcreteStackBlock;
        *(void *)&v67[8] = 3221225472LL;
        *(void *)&v67[16] = sub_1000F8068;
        v68 = &unk_10022E990;
        v69 = &v58;
        sub_1000F8068((uint64_t)v67);
        v20 = (void *)v59[3];
      }

      v35 = v10;
      v21 = v20;
      _Block_object_dispose(&v58, 8);
      id v22 = objc_alloc(v21);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_1000F80D4;
      v40[3] = &unk_10022D4A8;
      id v23 = v35;
      id v41 = v23;
      id v24 = v14;
      id v42 = v24;
      id v43 = v15;
      id v25 = [v22 initWithBuilder:v40];
      v26 = v25;
      if (v24 && v25)
      {
        -[NSMutableArray addObject:](self->_multiUserTrpIdList, "addObject:", v23);
        -[NSMutableDictionary setValue:forKey:](self->_multiUserTrpCache, "setValue:forKey:", v26, v24);
        id v33 = v23;
        id v34 = v8;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator tcuReceivers](self, "tcuReceivers"));
        id v28 = [v27 countByEnumeratingWithState:&v36 objects:v62 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v37;
          do
          {
            for (i = 0LL; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v37 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
              if ((objc_opt_respondsToSelector(v31, "didGenerateMultiUserTRPCandidatePackage:") & 1) != 0) {
                [v31 didGenerateMultiUserTRPCandidatePackage:v26];
              }
            }

            id v28 = [v27 countByEnumeratingWithState:&v36 objects:v62 count:16];
          }

          while (v28);
        }

        id v8 = v34;
        self->_trpCandidateDelivered = 1;
        if (*((_BYTE *)v55 + 24)) {
          -[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]( self,  "_doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:",  v33,  *(void *)(*(void *)&buf[8] + 40LL),  1LL);
        }
      }

      else
      {
        v32 = (os_log_s *)CSLogCategoryRequest;
        if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v67 = 136315138;
          *(void *)&v67[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s multiUserTrpCandidate failed to initialize. Bail out!",  v67,  0xCu);
        }
      }

      BOOL v10 = v35;
      uint64_t v16 = v41;
    }

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v54, 8);
  }

  else
  {
    v19 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Speech package is nil - bailing out",  buf,  0xCu);
    }
  }
}

- (void)_processResultCandidate:(id)a3 withId:(id)a4 uresInvocationType:(id)a5 isScoreRefreshAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    unsigned int v15 = [v10 isFinal];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 rawRecognition]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 oneBestTranscript]);
    *(_DWORD *)buf = 136315906;
    __int128 v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
    __int16 v38 = 1024;
    *(_DWORD *)__int128 v39 = v15;
    *(_WORD *)&v39[4] = 2112;
    *(void *)&v39[6] = v17;
    *(_WORD *)&v39[14] = 1024;
    *(_DWORD *)&v39[16] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s isFinal:%u utterance:%@ isScoreRefreshAllowed:%u",  buf,  0x22u);
  }

  if (-[CSAttSiriTCUGenerator _shouldDropPackage:](self, "_shouldDropPackage:", v10))
  {
    v18 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Duplicate package - needs to be dropped",  buf,  0xCu);
    }
  }

  else if (v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator _generateNewTRPId](self, "_generateNewTRPId"));
    objc_storeStrong((id *)&self->_lastTRPIdForSegment, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]( self,  "_generateTCUs:withRequestID:uresInvocationType:",  v10,  v11,  v12));
    v21 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      lastTRPIdForSegment = self->_lastTRPIdForSegment;
      *(_DWORD *)buf = 136315650;
      __int128 v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      __int16 v38 = 2112;
      *(void *)__int128 v39 = lastTRPIdForSegment;
      *(_WORD *)&v39[8] = 2112;
      *(void *)&v39[10] = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s TRPId:%@ TCUPackage:%@", buf, 0x20u);
    }

    id v23 = [objc_alloc((Class)sub_1000F7A10()) initWithTrpCandidateId:self->_lastTRPIdForSegment requestId:self->_requestId tcuList:v20];
    id v24 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      __int16 v38 = 2112;
      *(void *)__int128 v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s TRPCandidateInfo :%@", buf, 0x16u);
    }

    id v25 = [v10 resultCandidateId];
    TCUPruner = self->_TCUPruner;
    id v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    v30 = sub_1000F7AC4;
    v31 = &unk_10022D4D0;
    v32 = self;
    id v33 = v11;
    id v34 = v25;
    BOOL v35 = v6;
    -[CSTCUPruner processTRPCandidateInfo:requestId:withCompletion:]( TCUPruner,  "processTRPCandidateInfo:requestId:withCompletion:",  v23,  v33,  &v28);
    -[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]( self,  "_doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:",  self->_lastTRPIdForSegment,  v10,  0LL,  v28,  v29,  v30,  v31,  v32);
  }

  else
  {
    v27 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Speech package is nil - bailing out",  buf,  0xCu);
    }
  }
}

- (void)_doTrpTcuMappingWithTrpid:(id)a3 speechPackage:(id)a4 forceTrpSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_useEndpointerSignal)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSTrpTcuMapper processTRPWithId:withSpeechPackage:enforceTrpSelection:]( self->_tcuTrpMapper,  "processTRPWithId:withSpeechPackage:enforceTrpSelection:",  v8,  v9,  v5));
    id v11 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      id v14 = "-[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s matchingEPMetrics:%@",  (uint8_t *)&v13,  0x16u);
    }

    if (v10) {
      -[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]( self,  "_sendSelectedTrpId:endpointerMetrics:",  v8,  v10);
    }
  }

  else
  {
    id v12 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Don't run TCU selection for manual endpointing mode",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)_sendSelectedTrpId:(id)a3 endpointerMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s Sending selected TRPId %@ to delegates",  (uint8_t *)&v11,  0x16u);
    id v8 = (os_log_s *)CSLogCategoryRequest;
  }

  BOOL trpDetectDelivered = self->_trpDetectDelivered;
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (trpDetectDelivered)
  {
    if (v10)
    {
      int v11 = 136315394;
      id v12 = "-[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Ignore TRP selection for trpId: %@, since TRPDetect is already sent",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    if (v10)
    {
      int v11 = 136315394;
      id v12 = "-[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Received selected trpId: %@ sending TRPDetect msg",  (uint8_t *)&v11,  0x16u);
    }

    -[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:](self, "_deliverTRPDetected:withTRPId:", v7, v6);
  }
}

- (void)_enforceLastEagerRCSelection
{
  id v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSAttSiriTCUGenerator _enforceLastEagerRCSelection]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Force select last Eager RC",  (uint8_t *)&v6,  0xCu);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriTCUCache getTCUPackageWithTrpId:]( self->_tcuCache,  "getTCUPackageWithTrpId:",  self->_lastTRPIdForSegment));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 speechPackage]);
  self->_shouldRefreshScores = 0;
  -[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]( self,  "_doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:",  self->_lastTRPIdForSegment,  v5,  1LL);
}

- (BOOL)_shouldDropPackage:(id)a3
{
  unsigned int v4 = [a3 isFinal];
  unint64_t v5 = -[CSAttSiriTCUCache cachedTCUCount](self->_tcuCache, "cachedTCUCount");
  int v6 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    BOOL trpDetectDelivered = self->_trpDetectDelivered;
    int v9 = 136315906;
    BOOL v10 = "-[CSAttSiriTCUGenerator _shouldDropPackage:]";
    __int16 v11 = 1024;
    BOOL v12 = trpDetectDelivered;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    __int16 v15 = 1024;
    BOOL v16 = v5 != 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s trpDetectDelivered:%u isFinalRC:%u anyCachedRC:%u",  (uint8_t *)&v9,  0x1Eu);
  }

  BOOL result = self->_trpDetectDelivered;
  if (!self->_trpDetectDelivered && ((v4 ^ 1) & 1) == 0)
  {
    BOOL result = 0;
    if (self->_shouldEnforceLastEagerRCSelection)
    {
      if (v5)
      {
        -[CSAttSiriTCUGenerator _enforceLastEagerRCSelection](self, "_enforceLastEagerRCSelection");
        return 1;
      }
    }
  }

  return result;
}

- (void)_updateTcuCache:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[CSAttSiriTCUGenerator _updateTcuCache:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s trpCandidateInfo:%@", buf, 0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tcuList]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F7920;
  v7[3] = &unk_10022D4F8;
  void v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)_deliverTRPCandidatePackage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[CSAttSiriTCUGenerator _deliverTRPCandidatePackage:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s trpCandidateInfo:%@", buf, 0x16u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator tcuReceivers](self, "tcuReceivers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "didGenerateTRPCandidatePackage:") & 1) != 0) {
          [v11 didGenerateTRPCandidatePackage:v4];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  self->_trpCandidateDelivered = 1;
}

- (void)_deliverTRPDetected:(id)a3 withTRPId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v27 = v6;
  if (self->_shouldRefreshScores)
  {
    id v8 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Trigger new TCU candidate for trpId: %@",  buf,  0x16u);
    }

    -[CSAttSiriTCUGenerator _generateTCUCandidateWithRefershedScoresForTrpIdAsync:]( self,  "_generateTCUCandidateWithRefershedScoresForTrpIdAsync:",  v7);
    self->_shouldRefreshScores = 0;
  }

  else
  {
    if (v6)
    {
      id v9 = [v6 endpointBufferHostTime];
      [v6 totalAudioRecorded];
      double v11 = v10;
    }

    else
    {
      id v9 = (id)mach_absolute_time();
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriTCUCache getTCUPackageWithTrpId:]( self->_tcuCache,  "getTCUPackageWithTrpId:",  self->_lastTRPIdForSegment));
      [v12 endAudioTimeStampInMs];
      double v14 = v13;
      [v12 startAudioTimeStampInMs];
      double v11 = v14 - v15;
    }

    double v16 = (double)(unint64_t)v9;
    v17 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      double v38 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s trpDetectGenerationTime:%f totalRecordAudio:%f ",  buf,  0x20u);
    }

    uint64_t v32 = 0LL;
    id v33 = &v32;
    uint64_t v34 = 0x2050000000LL;
    v18 = (void *)qword_100280038;
    uint64_t v35 = qword_100280038;
    if (!qword_100280038)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1000F78B4;
      double v38 = COERCE_DOUBLE(&unk_10022E990);
      __int128 v39 = &v32;
      sub_1000F78B4((uint64_t)buf);
      v18 = (void *)v33[3];
    }

    __int16 v19 = v18;
    _Block_object_dispose(&v32, 8);
    id v20 = [[v19 alloc] initWithGeneratedHostTime:(unint64_t)v16 lastTRPCandidateId:v7 trpDetectedAudioTimeStamp:self->_requestId requestId:v11];
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator tcuReceivers](self, "tcuReceivers"));
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v25, "didGenerateTRPDetector:") & 1) != 0) {
            [v25 didGenerateTRPDetector:v20];
          }
        }

        id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }

      while (v22);
    }

    -[CSAttSiriTCUGenerator _emitSpeechStopDetectedWithTrpId:withHostTime:]( self,  "_emitSpeechStopDetectedWithTrpId:withHostTime:",  v7,  [v27 endpointHostTime]);
    self->_BOOL trpDetectDelivered = 1;
    if (v27)
    {
      -[CSAttSiriTCUGenerator _reportEndpointMetrics:forTrpId:](self, "_reportEndpointMetrics:forTrpId:", v27, v7);
    }

    else
    {
      v26 = (os_log_s *)CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Not reporting EPD due to nil endpointerMetrics",  buf,  0xCu);
      }
    }
  }
}

- (void)_deliverTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  __int128 v12 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v25 = "-[CSAttSiriTCUGenerator _deliverTCUUpdateForTCUId:withTCUAccepted:forRequestId:isFinal:]";
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 1024;
    BOOL v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Publishing update for requestId: %{public}@ tcuAccepted: %d",  buf,  0x1Cu);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator tcuReceivers](self, "tcuReceivers", 0LL));
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v18, "didReceiveTCUUpdateForTCUId:withTCUAccepted:forRequestId:isFinal:") & 1) != 0) {
          [v18 didReceiveTCUUpdateForTCUId:v10 withTCUAccepted:v8 forRequestId:v11 isFinal:v6];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v15);
  }
}

- (id)_generateNewTRPId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (id)_generateTCUs:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

  id v14 = v8;
  [v10 utteranceStart];
  double v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 recognition]);
  [v17 processedAudioDuration];
  double v19 = v16 + v18;

  id v20 = objc_alloc((Class)sub_1000F76D8());
  int64_t speechEvent = self->_speechEvent;
  int64_t v22 = -[CSAttSiriTCUGenerator _getPhraseTypeFromUresInvocationType:]( self,  "_getPhraseTypeFromUresInvocationType:",  v9);

  uint64_t v23 = (NSMutableArray *)[v20 initWithTcuId:v13 requestId:v14 tcuState:1 speechEvent:speechEvent voiceTriggerPhraseType:v22 siriIntendedInfo:0 prevTCU Ids:v16 startAudioTimeStampInMs:v19 endAudioTimeStampInMs:0 speechPackage:v10];
  id v24 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v30 = "-[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]";
    __int16 v31 = 2112;
    uint64_t v32 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s newTCUObject :%@", buf, 0x16u);
  }

  if (v23)
  {
    -[NSMutableArray addObject:](v11, "addObject:", v23);
    id v25 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v30 = "-[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]";
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s TCUCandidateList :%@", buf, 0x16u);
    }

    __int16 v26 = v11;
  }

  else
  {
    id v27 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v30 = "-[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to create TCU Object!",  buf,  0xCu);
    }

    __int16 v26 = 0LL;
  }

  return v26;
}

- (id)_generateSingleTCU:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

  id v13 = v8;
  [v10 utteranceStart];
  double v15 = v14;
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v10 recognition]);
  [v16 processedAudioDuration];
  double v18 = v15 + v17;

  id v19 = objc_alloc((Class)sub_1000F76D8());
  int64_t speechEvent = self->_speechEvent;
  int64_t v21 = -[CSAttSiriTCUGenerator _getPhraseTypeFromUresInvocationType:]( self,  "_getPhraseTypeFromUresInvocationType:",  v9);

  id v22 = [v19 initWithTcuId:v12 requestId:v13 tcuState:1 speechEvent:speechEvent voiceTriggerPhraseType:v21 siriIntendedInfo:0 prevTCUIds:v15 startAudioTime StampInMs:v18 endAudioTimeStampInMs:0 speechPackage:v10];
  uint64_t v23 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v27 = "-[CSAttSiriTCUGenerator _generateSingleTCU:withRequestID:uresInvocationType:]";
    __int16 v28 = 2112;
    id v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s newTCUObject :%@", buf, 0x16u);
  }

  if (!v22)
  {
    id v24 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[CSAttSiriTCUGenerator _generateSingleTCU:withRequestID:uresInvocationType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Failed to create TCU Object!",  buf,  0xCu);
    }
  }

  return v22;
}

- (int64_t)_getPhraseTypeFromUresInvocationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:&off_100238C88])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToNumber:&off_100238CA0])
  {
    int64_t v4 = 2LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (void)_generateTCUCandidateWithRefershedScoresForTrpIdAsync:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F75B4;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_updateRefreshScoresForPackage:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 tcuList]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 siriIntendedInfo]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 invocationType]);
  if (!v7) {
    goto LABEL_10;
  }
  int64_t speechEvent = self->_speechEvent;

  if (speechEvent == 5) {
    goto LABEL_10;
  }
  id v9 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isSDSDAftmOperational = self->_isSDSDAftmOperational;
    int v14 = 136315394;
    double v15 = "-[CSAttSiriTCUGenerator _updateRefreshScoresForPackage:]";
    __int16 v16 = 1024;
    BOOL v17 = isSDSDAftmOperational;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s isAftmModelOperational:%u",  (uint8_t *)&v14,  0x12u);
  }

  BOOL v11 = self->_isSDSDAftmOperational;
  if (v11)
  {
    [v6 aftmScore];
    if (v12 < 0.0)
    {
      id v13 = (os_log_s *)CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        double v15 = "-[CSAttSiriTCUGenerator _updateRefreshScoresForPackage:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s AFTM score is nil, needs TCU refresh",  (uint8_t *)&v14,  0xCu);
      }

      BOOL v11 = 1;
      goto LABEL_11;
    }

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v7 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000F7500;
  v10[3] = &unk_10022EFD0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)registerEndpointerProxy:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F74F4;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F73C4;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F7150;
  block[3] = &unk_10022E048;
  BOOL v18 = a7;
  double v16 = a4;
  void block[4] = self;
  id v15 = v11;
  int64_t v17 = a5;
  id v13 = v11;
  dispatch_async(queue, block);
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000F7078;
  v18[3] = &unk_10022E368;
  id v19 = v13;
  id v20 = self;
  id v21 = v12;
  id v22 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  dispatch_async(queue, v18);
}

- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 taskName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F6FA0;
  v15[3] = &unk_10022E368;
  id v16 = v10;
  id v17 = self;
  id v18 = v9;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 multiUserSpeechPackage:(id)a5 topUserSpeechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
  id v10 = a3;
  id v11 = a5;
  if ((+[CSUtils isMultiUserMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMultiUserMedocFeatureEnabled") & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F6EB8;
    block[3] = &unk_10022EA98;
    id v15 = v11;
    id v16 = self;
    id v17 = v10;
    dispatch_async(queue, block);
  }

  else
  {
    id v13 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSAttSiriTCUGenerator didReceiveResultCandidateWithRequestId:rcId:multiUserSpeechPackage:topUserSpeechPack"
            "age:duration:taskName:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s MultiuserMedoc is disabled", buf, 0xCu);
    }
  }
}

- (void)didReceiveFinalResultWithRequestId:(id)a3 multiUserSpeechPackage:(id)a4 taskName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((+[CSUtils isMultiUserMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMultiUserMedocFeatureEnabled") & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000F6DC4;
    v13[3] = &unk_10022E368;
    id v14 = v9;
    id v15 = v10;
    id v16 = self;
    id v17 = v8;
    dispatch_async(queue, v13);
  }

  else
  {
    id v12 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSAttSiriTCUGenerator didReceiveFinalResultWithRequestId:multiUserSpeechPackage:taskName:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s MultiuserMedoc is disabled", buf, 0xCu);
    }
  }
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F6BA0;
  block[3] = &unk_10022E968;
  id v20 = v10;
  int64_t v21 = a5;
  void block[4] = self;
  id v18 = v12;
  id v19 = v11;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (void)_emitTRPRequestLinkEventWithTRPId:(id)a3 withRequestId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    id v17 = "-[CSAttSiriTCUGenerator _emitTRPRequestLinkEventWithTRPId:withRequestId:]";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s emitting SELF logging event TRPRequestLink with TRPId: %@, requestId: %@",  (uint8_t *)&v16,  0x20u);
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___SISchemaTRPRequestLink);
  [v8 setSource:2];
  id v9 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
  id v11 = [v9 initWithNSUUID:v10];
  [v8 setTrpId:v11];

  id v12 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v13 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  id v14 = [v12 initWithNSUUID:v13];
  [v8 setRequestId:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v15 emitMessage:v8];
}

- (void)_emitTRPCreatedEventWithTRPId:(id)a3 withResultCandidateId:(id)a4 withRequestId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315906;
    uint64_t v23 = "-[CSAttSiriTCUGenerator _emitTRPCreatedEventWithTRPId:withResultCandidateId:withRequestId:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s emitting SELF logging event TRPCreated with TRPId: %@, resultCandidateId: %@, requestId: %@",  (uint8_t *)&v22,  0x2Au);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHTRPCreated);
  id v13 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
  id v15 = [v13 initWithNSUUID:v14];
  [v12 setTrpId:v15];

  [v12 setResultCandidateId:v9];
  id v16 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  id v17 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v18 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_mhId);
  id v20 = [v18 initWithNSUUID:v19];
  [v17 setMhId:v20];

  [v16 setEventMetadata:v17];
  [v16 setTrpCreated:v12];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v21 emitMessage:v16];
}

- (void)_emitSpeechStopDetectedWithTrpId:(id)a3 withHostTime:(unint64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F6960;
  block[3] = &unk_10022E7F8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_reportEndpointMetrics:(id)a3 forTrpId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUGenerator tcuReceivers](self, "tcuReceivers", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if (v13
          && (objc_opt_respondsToSelector( *(void *)(*((void *)&v33 + 1) + 8LL * (void)i),  "attSiriNode:selectedTRPId:withMetrics:") & 1) != 0)
        {
          [v13 attSiriNode:self selectedTRPId:v7 withMetrics:v6];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v10);
  }

  if (!self->_isMultiUserRequest)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriTCUCache getTCUPackageWithTrpId:](self->_tcuCache, "getTCUPackageWithTrpId:", v7));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 speechPackage]);
    goto LABEL_18;
  }

  multiUserTrpCache = self->_multiUserTrpCache;
  if (multiUserTrpCache && self->_requestId)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](multiUserTrpCache, "objectForKeyedSubscript:"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 trpCandidateList]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 tcuList]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 speechPackage]);

LABEL_18:
    v37[0] = @"leadingSilence";
    +[CSAttSiriSpeechPackageHelper getFirstTokenLeadingSilenceFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getFirstTokenLeadingSilenceFromSpeechPackage:",  v20);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23 * 1000.0));
    v38[0] = v24;
    v37[1] = @"trailingSilence";
    +[CSAttSiriSpeechPackageHelper getLastTokenTrailingSilenceFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenTrailingSilenceFromSpeechPackage:",  v20);
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25 * 1000.0));
    v38[1] = v26;
    v37[2] = @"endTime";
    +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenEndTimeFromSpeechPackage:",  v20);
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27 * 1000.0));
    v38[2] = v28;
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));

    -[CSEndpointDelayReporter setStopRecordingHostTime:]( self->_epdDelayReporter,  "setStopRecordingHostTime:",  mach_absolute_time());
    epdDelayReporter = self->_epdDelayReporter;
    [v6 totalAudioRecorded];
    -[CSEndpointDelayReporter setEndpointTimeInMs:](epdDelayReporter, "setEndpointTimeInMs:");
    -[CSEndpointDelayReporter setEndpointBufferHostTime:]( self->_epdDelayReporter,  "setEndpointBufferHostTime:",  [v6 endpointBufferHostTime]);
    __int16 v31 = self->_epdDelayReporter;
    +[CSAttSiriSpeechPackageHelper getLastTokenSilenceStartFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenSilenceStartFromSpeechPackage:",  v20);
    -[CSEndpointDelayReporter setUserSpeakingEndedTimeInMs:](v31, "setUserSpeakingEndedTimeInMs:", v32 * 1000.0);
    -[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:withTrpId:]( self->_epdDelayReporter,  "setSpeechRecognizedContext:withEndpointerMetrics:withTrpId:",  v29,  v6,  v7);
    -[CSEndpointDelayReporter reportEndpointDelayIfNeed](self->_epdDelayReporter, "reportEndpointDelayIfNeed");

    goto LABEL_19;
  }

  id v21 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
  {
    requestId = self->_requestId;
    *(_DWORD *)buf = 136315394;
    v40 = "-[CSAttSiriTCUGenerator _reportEndpointMetrics:forTrpId:]";
    __int16 v41 = 2112;
    id v42 = requestId;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s No Valid MultiUser TRPCache found for Multiuser requestId(%@), Bailing out!",  buf,  0x16u);
  }

- (id)_generateTCUsFromExistingTCUs:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[CSAttSiriTCUGenerator _generateTCUsFromExistingTCUs:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s new TCU Object is nil!",  (uint8_t *)&v6,  0xCu);
    }
  }

  return 0LL;
}

- (CSIntuitiveConvRequestHandler)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
}

- (CSAttSiriTCUGeneratorDelegate)delegate
{
  return (CSAttSiriTCUGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriUresNode)uresNode
{
  return (CSAttSiriUresNode *)objc_loadWeakRetained((id *)&self->_uresNode);
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return (CSAttSiriEndpointerNode *)objc_loadWeakRetained((id *)&self->_endpointerNode);
}

- (void)registerEndpointerNode:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)firstTRPIdForSegment
{
  return self->_firstTRPIdForSegment;
}

- (void)setFirstTRPIdForSegment:(id)a3
{
}

- (NSString)lastTRPIdForSegment
{
  return self->_lastTRPIdForSegment;
}

- (void)setLastTRPIdForSegment:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (CSTCUPruner)TCUPruner
{
  return self->_TCUPruner;
}

- (void)setTCUPruner:(id)a3
{
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (void)setSpeechEvent:(int64_t)a3
{
  self->_int64_t speechEvent = a3;
}

- (CSAttSiriTCUCache)tcuCache
{
  return self->_tcuCache;
}

- (void)setTcuCache:(id)a3
{
}

- (BOOL)requestInProcess
{
  return self->_requestInProcess;
}

- (void)setRequestInProcess:(BOOL)a3
{
  self->_requestInProcess = a3;
}

- (BOOL)trpCandidateDelivered
{
  return self->_trpCandidateDelivered;
}

- (void)setTrpCandidateDelivered:(BOOL)a3
{
  self->_trpCandidateDelivered = a3;
}

- (BOOL)trpDetectSelected
{
  return self->_trpDetectSelected;
}

- (void)setTrpDetectSelected:(BOOL)a3
{
  self->_trpDetectSelected = a3;
}

- (BOOL)trpDetectDelivered
{
  return self->_trpDetectDelivered;
}

- (void)setTrpDetectDelivered:(BOOL)a3
{
  self->_BOOL trpDetectDelivered = a3;
}

- (BOOL)shouldRefreshScores
{
  return self->_shouldRefreshScores;
}

- (void)setShouldRefreshScores:(BOOL)a3
{
  self->_shouldRefreshScores = a3;
}

- (NSHashTable)tcuReceivers
{
  return self->_tcuReceivers;
}

- (void)setTcuReceivers:(id)a3
{
}

- (NSHashTable)executionStateReceivers
{
  return self->_executionStateReceivers;
}

- (void)setExecutionStateReceivers:(id)a3
{
}

- (NSHashTable)recognitionTaskCompletionReceivers
{
  return self->_recognitionTaskCompletionReceivers;
}

- (void)setRecognitionTaskCompletionReceivers:(id)a3
{
}

- (CSEndpointDelayReporter)epdDelayReporter
{
  return self->_epdDelayReporter;
}

- (void)setEpdDelayReporter:(id)a3
{
}

- (CSEndpointerMetrics)endpointerMetrics
{
  return self->_endpointerMetrics;
}

- (void)setEndpointerMetrics:(id)a3
{
}

- (BOOL)shouldEnforceLastEagerRCSelection
{
  return self->_shouldEnforceLastEagerRCSelection;
}

- (void)setShouldEnforceLastEagerRCSelection:(BOOL)a3
{
  self->_shouldEnforceLastEagerRCSelection = a3;
}

- (CSTrpTcuMapper)tcuTrpMapper
{
  return self->_tcuTrpMapper;
}

- (void)setTcuTrpMapper:(id)a3
{
}

- (BOOL)isSDSDAftmOperational
{
  return self->_isSDSDAftmOperational;
}

- (void)setIsSDSDAftmOperational:(BOOL)a3
{
  self->_BOOL isSDSDAftmOperational = a3;
}

- (BOOL)useEndpointerSignal
{
  return self->_useEndpointerSignal;
}

- (void)setUseEndpointerSignal:(BOOL)a3
{
  self->_useEndpointerSignal = a3;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (NSMutableArray)multiUserTrpIdList
{
  return self->_multiUserTrpIdList;
}

- (void)setMultiUserTrpIdList:(id)a3
{
}

- (NSMutableDictionary)multiUserTrpCache
{
  return self->_multiUserTrpCache;
}

- (void)setMultiUserTrpCache:(id)a3
{
}

- (BOOL)isMultiUserRequest
{
  return self->_isMultiUserRequest;
}

- (void)setIsMultiUserRequest:(BOOL)a3
{
  self->_isMultiUserRequest = a3;
}

- (NSNumber)requestInvocationType
{
  return self->_requestInvocationType;
}

- (void)setRequestInvocationType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end