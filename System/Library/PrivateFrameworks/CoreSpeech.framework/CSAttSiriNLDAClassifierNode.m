@interface CSAttSiriNLDAClassifierNode
- (BOOL)_isRequestBPWithCtx:(id)a3;
- (BOOL)_shouldCreateODLDProcessor:(id)a3;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriNLDAClassifierNode)init;
- (CSAttSiriNLDAClassifierNode)initWithAttSiriController:(id)a3;
- (CSAudioRecordContext)recordCtx;
- (CSOSTransaction)osTransaction;
- (NSArray)cachedTokens;
- (NSArray)requiredNodes;
- (NSData)cachedEmbedding;
- (NSNumber)cachedInitialAnchor;
- (NSString)anchorRequestId;
- (NSString)mhId;
- (NSString)prevRequestId;
- (NSString)requestId;
- (OS_dispatch_queue)queue;
- (SLODLDInputContext)inputCtx;
- (SLODLDProcessor)odldProcessor;
- (SLODLDProcessorResult)prevResult;
- (id)_createInputContextForRecordCtx:(id)a3;
- (id)processSpeechPackageSync:(id)a3;
- (unint64_t)type;
- (void)_clearContextForNewTurn;
- (void)_holdTransactionForNldaProcessing;
- (void)_logMHOdldFalseTriggerMitigationScores:(id)a3 withOdldScores:(float)a4 withOdldScoreThreshold:(float)a5 withSocialScore:(float)a6 withAnchorRequestId:(id)a7 withAnchorSocialScore:(float)a8 withPrevRequestId:(id)a9 withConversationalScore:(float)a10 withSuccess:(BOOL)a11;
- (void)_releaseNldaProcessingTransaction;
- (void)_saveContextForMitigationDecision:(BOOL)a3 forRequestId:(id)a4 isFinal:(BOOL)a5;
- (void)_updateContextForRecordCtx:(id)a3;
- (void)informMitigationDecision:(BOOL)a3 forRequestId:(id)a4 isFinal:(BOOL)a5;
- (void)setAnchorRequestId:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setCachedEmbedding:(id)a3;
- (void)setCachedInitialAnchor:(id)a3;
- (void)setCachedTokens:(id)a3;
- (void)setInputCtx:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setOdldProcessor:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPrevRequestId:(id)a3;
- (void)setPrevResult:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordCtx:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)startWithRecordContext:(id)a3 withRequestId:(id)a4;
- (void)stop;
@end

@implementation CSAttSiriNLDAClassifierNode

- (CSAttSiriNLDAClassifierNode)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSAttSiriNLDAClassifierNode;
  v2 = -[CSAttSiriNLDAClassifierNode init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    requiredNodes = v2->_requiredNodes;
    v2->_type = 12LL;
    v2->_requiredNodes = (NSArray *)&off_1002392A8;

    v3->_isReady = 0;
    dispatch_queue_t v5 = dispatch_queue_create("CSAttSiriNLDANode queue", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = (dispatch_queue_s *)v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001000B4;
    block[3] = &unk_10022F100;
    v11 = v3;
    dispatch_async(v7, block);
    v8 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSAttSiriNLDAClassifierNode init]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Created NLDA-AS node", buf, 0xCu);
    }
  }

  return v3;
}

- (CSAttSiriNLDAClassifierNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = -[CSAttSiriNLDAClassifierNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)startWithRecordContext:(id)a3 withRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSAttSiriNLDAClassifierNode startWithRecordContext:withRequestId:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s RequestId: %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FFD90;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FFCD0;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FFCC4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FFC00;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)processSpeechPackageSync:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000FF95C;
  v16 = sub_1000FF96C;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FF974;
  block[3] = &unk_10022D958;
  void block[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  dispatch_sync(queue, block);
  if (-[CSAttSiriNLDAClassifierNode _isRequestBPWithCtx:](self, "_isRequestBPWithCtx:", self->_recordCtx)) {
    id v7 = 0LL;
  }
  else {
    id v7 = (id)v13[5];
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_shouldCreateODLDProcessor:(id)a3
{
  prefetchedAsset = self->_prefetchedAsset;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getInputoriginFromRecordType:withAsset:]( &OBJC_CLASS___CSUtils,  "getInputoriginFromRecordType:withAsset:",  v5,  prefetchedAsset));
  unsigned __int8 v7 = -[CSAttSiriNLDAClassifierNode _isRequestBPWithCtx:](self, "_isRequestBPWithCtx:", v5);

  if (v6) {
    char v8 = v7 ^ 1;
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_isRequestBPWithCtx:(id)a3
{
  id v4 = a3;
  if (v4 && self->_prefetchedAsset)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getInputoriginFromRecordType:withAsset:]( &OBJC_CLASS___CSUtils,  "getInputoriginFromRecordType:withAsset:",  v4));
    else {
      LOBYTE(v6) = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = (os_log_s *)CSLogCategorySDSD;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[CSAttSiriNLDAClassifierNode _isRequestBPWithCtx:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Unable to determine request origin",  (uint8_t *)&v9,  0xCu);
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (void)_holdTransactionForNldaProcessing
{
  if (!self->_osTransaction)
  {
    v3 = -[CSOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CSOSTransaction),  "initWithDescription:",  @"nlda-bert model");
    osTransaction = self->_osTransaction;
    self->_osTransaction = v3;
  }

  id v5 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[CSAttSiriNLDAClassifierNode _holdTransactionForNldaProcessing]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s OS transaction obtained for NLDA inference",  (uint8_t *)&v6,  0xCu);
  }

- (void)_releaseNldaProcessingTransaction
{
  osTransaction = self->_osTransaction;
  id v4 = (os_log_s *)CSLogCategorySDSD;
  BOOL v5 = os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO);
  if (osTransaction)
  {
    if (v5)
    {
      int v6 = 136315138;
      unsigned __int8 v7 = "-[CSAttSiriNLDAClassifierNode _releaseNldaProcessingTransaction]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s OS transaction released after NLDA inference",  (uint8_t *)&v6,  0xCu);
      osTransaction = self->_osTransaction;
    }

    self->_osTransaction = 0LL;
  }

  else if (v5)
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[CSAttSiriNLDAClassifierNode _releaseNldaProcessingTransaction]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s osTransaction already released",  (uint8_t *)&v6,  0xCu);
  }

- (void)informMitigationDecision:(BOOL)a3 forRequestId:(id)a4 isFinal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  int v9 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v18 = "-[CSAttSiriNLDAClassifierNode informMitigationDecision:forRequestId:isFinal:]";
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    __int16 v23 = 1024;
    BOOL v24 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s RequestId: %@, didMitigate: %d, isFinal: %d",  buf,  0x22u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FF790;
  block[3] = &unk_10022D848;
  id v13 = v8;
  uint64_t v14 = self;
  BOOL v15 = v6;
  BOOL v16 = v5;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)_logMHOdldFalseTriggerMitigationScores:(id)a3 withOdldScores:(float)a4 withOdldScoreThreshold:(float)a5 withSocialScore:(float)a6 withAnchorRequestId:(id)a7 withAnchorSocialScore:(float)a8 withPrevRequestId:(id)a9 withConversationalScore:(float)a10 withSuccess:(BOOL)a11
{
  BOOL v11 = a11;
  id v20 = a3;
  id v21 = a7;
  id v22 = a9;
  if (self->_mhId)
  {
    id v23 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    BOOL v24 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_mhId);
    id v25 = [v23 initWithNSUUID:v24];

    id v26 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHOdldFalseTriggerMitigated);
    [v26 setModelVersion:v20];
    *(float *)&double v27 = a4;
    [v26 setOdldScore:v27];
    *(float *)&double v28 = a5;
    [v26 setOdldScoreThreshold:v28];
    if (v11) {
      uint64_t v29 = 0LL;
    }
    else {
      uint64_t v29 = 1953LL;
    }
    [v26 setErrorCode:v29];
    id v30 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    v31 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v22);
    id v32 = [v30 initWithNSUUID:v31];
    [v26 setPreviousRequestId:v32];

    id v33 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    v34 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v21);
    id v35 = [v33 initWithNSUUID:v34];
    [v26 setAnchorRequestId:v35];

    *(float *)&double v36 = a6;
    [v26 setSocialScore:v36];
    *(float *)&double v37 = a8;
    [v26 setAnchorSocialScore:v37];
    *(float *)&double v38 = a10;
    [v26 setConversationalOdldScore:v38];
    id v39 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v39 setMhId:v25];
    id v40 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v40 setMhId:v25];
    [v40 setEventMetadata:v39];
    [v40 setOdldFalseTriggerMitigated:v26];
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v41 emitMessage:v40];

    v42 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      mhId = self->_mhId;
      int v45 = 136316162;
      v46 = "-[CSAttSiriNLDAClassifierNode _logMHOdldFalseTriggerMitigationScores:withOdldScores:withOdldScoreThreshold:w"
            "ithSocialScore:withAnchorRequestId:withAnchorSocialScore:withPrevRequestId:withConversationalScore:withSuccess:]";
      __int16 v47 = 2112;
      v48 = mhId;
      __int16 v49 = 2048;
      double v50 = a4;
      __int16 v51 = 2048;
      double v52 = a6;
      __int16 v53 = 2048;
      double v54 = a10;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%s Submit ODLD False Trigger Mitigation score msg to SELF metrics for MH ID: %@, OdldScore: %f, SocialScore: %f, conversationalScore: %f",  (uint8_t *)&v45,  0x34u);
    }
  }

  else
  {
    v44 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = 136315138;
      v46 = "-[CSAttSiriNLDAClassifierNode _logMHOdldFalseTriggerMitigationScores:withOdldScores:withOdldScoreThreshold:w"
            "ithSocialScore:withAnchorRequestId:withAnchorSocialScore:withPrevRequestId:withConversationalScore:withSuccess:]";
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v45,  0xCu);
    }
  }
}

- (id)_createInputContextForRecordCtx:(id)a3
{
  id v4 = a3;
  -[CSAttSiriNLDAClassifierNode _updateContextForRecordCtx:](self, "_updateContextForRecordCtx:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getInputoriginFromRecordType:withAsset:]( &OBJC_CLASS___CSUtils,  "getInputoriginFromRecordType:withAsset:",  v4,  self->_prefetchedAsset));

  BOOL v6 = -[SLODLDInputContext initWithInputOrigin:inputAnchor:prevTokens:prevEmb:]( objc_alloc(&OBJC_CLASS___SLODLDInputContext),  "initWithInputOrigin:inputAnchor:prevTokens:prevEmb:",  v5,  self->_cachedInitialAnchor,  self->_cachedTokens,  self->_cachedEmbedding);
  return v6;
}

- (void)_updateContextForRecordCtx:(id)a3
{
  prefetchedAsset = self->_prefetchedAsset;
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getInputoriginFromRecordType:withAsset:]( &OBJC_CLASS___CSUtils,  "getInputoriginFromRecordType:withAsset:",  v5,  prefetchedAsset));
  LODWORD(prefetchedAsset) = [v5 isContinuousConversationTriggerlessAnnounce];

  if ((_DWORD)prefetchedAsset
    && (+[CSUtils supportMedocAnnounce](&OBJC_CLASS___CSUtils, "supportMedocAnnounce") & 1) != 0
    || v6 && ([v6 isEqualToNumber:&off_100238CE8] & 1) == 0)
  {
    -[CSAttSiriNLDAClassifierNode _clearContextForNewTurn](self, "_clearContextForNewTurn");
    unsigned __int8 v7 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "-[CSAttSiriNLDAClassifierNode _updateContextForRecordCtx:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Clear context for new anchor request",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_clearContextForNewTurn
{
  prevResult = self->_prevResult;
  self->_prevResult = 0LL;

  cachedTokens = self->_cachedTokens;
  self->_cachedTokens = 0LL;

  cachedEmbedding = self->_cachedEmbedding;
  self->_cachedEmbedding = 0LL;

  cachedInitialAnchor = self->_cachedInitialAnchor;
  self->_cachedInitialAnchor = (NSNumber *)&off_100238D00;

  prevRequestId = self->_prevRequestId;
  self->_prevRequestId = 0LL;

  anchorRequestId = self->_anchorRequestId;
  self->_anchorRequestId = 0LL;
}

- (void)_saveContextForMitigationDecision:(BOOL)a3 forRequestId:(id)a4 isFinal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (!v5 || v6)
  {
    if (v6)
    {
      BOOL v24 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315138;
        id v30 = "-[CSAttSiriNLDAClassifierNode _saveContextForMitigationDecision:forRequestId:isFinal:]";
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring context for mitigated request",  (uint8_t *)&v29,  0xCu);
      }
    }
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SLODLDInputContext inputOrigin](self->_inputCtx, "inputOrigin"));
    unsigned __int8 v10 = [v9 isEqualToNumber:&off_100238CE8];

    if ((v10 & 1) == 0)
    {
      -[SLODLDProcessorResult outputAnchor](self->_prevResult, "outputAnchor");
      BOOL v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      cachedInitialAnchor = self->_cachedInitialAnchor;
      self->_cachedInitialAnchor = v11;

      id v13 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = self->_cachedInitialAnchor;
        int v29 = 136315394;
        id v30 = "-[CSAttSiriNLDAClassifierNode _saveContextForMitigationDecision:forRequestId:isFinal:]";
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Saving initial anchor %@",  (uint8_t *)&v29,  0x16u);
      }

      objc_storeStrong((id *)&self->_anchorRequestId, self->_requestId);
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[SLODLDProcessorResult outputEmb](self->_prevResult, "outputEmb"));

    if (v15)
    {
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[SLODLDProcessorResult outputEmb](self->_prevResult, "outputEmb"));
      id v17 = (NSData *)[v16 copy];
      cachedEmbedding = self->_cachedEmbedding;
      self->_cachedEmbedding = v17;
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SLODLDProcessorResult tokens](self->_prevResult, "tokens"));
    id v20 = (NSArray *)[v19 copy];
    cachedTokens = self->_cachedTokens;
    self->_cachedTokens = v20;

    id v22 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      prevResult = self->_prevResult;
      int v29 = 136315394;
      id v30 = "-[CSAttSiriNLDAClassifierNode _saveContextForMitigationDecision:forRequestId:isFinal:]";
      __int16 v31 = 2112;
      id v32 = prevResult;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s Saving context from prev result %@",  (uint8_t *)&v29,  0x16u);
    }

    objc_storeStrong((id *)&self->_prevRequestId, self->_requestId);
  }

  if (v5)
  {
    inputCtx = self->_inputCtx;
    self->_inputCtx = 0LL;

    recordCtx = self->_recordCtx;
    self->_recordCtx = 0LL;

    double v27 = self->_prevResult;
    self->_prevResult = 0LL;

    double v28 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315138;
      id v30 = "-[CSAttSiriNLDAClassifierNode _saveContextForMitigationDecision:forRequestId:isFinal:]";
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s Clearing inputCtx for final mitigation decision",  (uint8_t *)&v29,  0xCu);
    }
  }
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (NSString)anchorRequestId
{
  return self->_anchorRequestId;
}

- (void)setAnchorRequestId:(id)a3
{
}

- (SLODLDProcessor)odldProcessor
{
  return self->_odldProcessor;
}

- (void)setOdldProcessor:(id)a3
{
}

- (CSAudioRecordContext)recordCtx
{
  return self->_recordCtx;
}

- (void)setRecordCtx:(id)a3
{
}

- (SLODLDInputContext)inputCtx
{
  return self->_inputCtx;
}

- (void)setInputCtx:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (NSNumber)cachedInitialAnchor
{
  return self->_cachedInitialAnchor;
}

- (void)setCachedInitialAnchor:(id)a3
{
}

- (NSData)cachedEmbedding
{
  return self->_cachedEmbedding;
}

- (void)setCachedEmbedding:(id)a3
{
}

- (NSArray)cachedTokens
{
  return self->_cachedTokens;
}

- (void)setCachedTokens:(id)a3
{
}

- (SLODLDProcessorResult)prevResult
{
  return self->_prevResult;
}

- (void)setPrevResult:(id)a3
{
}

- (NSString)prevRequestId
{
  return self->_prevRequestId;
}

- (void)setPrevRequestId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end