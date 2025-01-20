@interface CSAttSiriUresNode
+ (float)_extractLrnnScoreForResultCandidate:(id)a3;
- (BOOL)_isSpeechRecognizerTaskSupported:(id)a3;
- (BOOL)_shouldApplyAllowListOverride:(id)a3 withInputOrigin:(id)a4;
- (BOOL)_shouldRunMitigationForContext:(id)a3;
- (BOOL)_shouldRunMitigationForRequestContext:(id)a3 forTask:(id)a4;
- (BOOL)_supportsHybridSDSD;
- (BOOL)getLastMitigationResultForRequestId:(id)a3;
- (BOOL)getMitigationDecisionForRCId:(unint64_t)a3 forRequestId:(id)a4;
- (BOOL)isMedocFeatureEnabled;
- (BOOL)isReady;
- (BOOL)supportsHybridUnderstandingOnDevice;
- (BOOL)supportsUnderstandingOnDevice;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMitigatorDeletgate)mitigatorDelegate;
- (CSAttSiriNLDAClassifierNode)nldaClassifierNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSignalDataAggregatorProtocol)gazeNode;
- (CSAttSiriTCUGenerator)tcuGenerator;
- (CSAttSiriUresNode)init;
- (CSAttSiriUresNode)initWithAttSiriController:(id)a3;
- (CSAttSiriUresNode)initWithSupportsUOD:(BOOL)a3 supportsHybridUOD:(BOOL)a4 isMedocFeatureEnabled:(BOOL)a5;
- (CSOSTransaction)osTransaction;
- (NSArray)allowVocabList;
- (NSArray)requiredNodes;
- (NSArray)supportedInputOrigins;
- (NSHashTable)receivers;
- (NSMutableDictionary)requestIdToFeatsMapping;
- (NSString)configFile;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (SLUresMitigator)mitigator;
- (id)_decodeJsonFromFile:(id)a3;
- (id)_getRequestCtxForRequestId:(id)a3;
- (id)constructTCUIntendedInfoForRequestId:(id)a3 withResultCandidate:(id)a4;
- (id)getUresInputFeaturesForRequestId:(id)a3;
- (id)getUresInvocationTypeForRequestId:(id)a3;
- (unint64_t)allowListWordCountThreshold;
- (unint64_t)type;
- (void)_createMitigatorModelWithConfig:(id)a3;
- (void)_createModelAndRunInferenceForRcId:(unint64_t)a3 withRequestContext:(id)a4 withCompletion:(id)a5;
- (void)_fetchMitigationConfigForRecordCtx:(id)a3;
- (void)_holdTransactionForUresProcessing;
- (void)_logFinalMitigationDecisionToSelf:(BOOL)a3 forMhId:(id)a4;
- (void)_logLRNNFailMsgForMhId:(id)a3;
- (void)_logLatticeRNNResults:(id)a3 forMhId:(id)a4;
- (void)_logURESEndMessageWithScore:(float)a3 threshold:(float)a4 spkrIDThreshold:(float)a5 assetVersion:(id)a6 withMhId:(id)a7;
- (void)_logURESFailureMsgInput:(unint64_t)a3 forMhId:(id)a4;
- (void)_logURESResultsForInput:(id)a3 withOutput:(id)a4 forMhId:(id)a5;
- (void)_readAllowListVocabFromFile:(id)a3;
- (void)_releaseUresProcessingTransaction;
- (void)_runLRNNOnlyMitigationForRCId:(unint64_t)a3 speechPackage:(id)a4 requestId:(id)a5 completion:(id)a6;
- (void)_storeMitigationDecision:(BOOL)a3 forRCId:(unint64_t)a4 requestContext:(id)a5;
- (void)_updateInputFeats:(id)a3 forSignalsFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)_updateSupportedInputOrigins;
- (void)addReceiver:(id)a3;
- (void)asrStartedForRequestId:(id)a3 isRecognitionModeClassic:(BOOL)a4;
- (void)attSiriNode:(id)a3 didMitigate:(BOOL)a4 withScore:(float)a5 forRequestId:(id)a6 taskType:(id)a7;
- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4;
- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6;
- (void)attSiriNode:(id)a3 didUpdateWithSpeakerInfo:(id)a4 forReqId:(id)a5;
- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 multiUserSpeechPackage:(id)a5 topUserSpeechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8;
- (void)didReceiveTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6;
- (void)didStartRecognitionRequest:(id)a3 successfully:(BOOL)a4 isRecognitionModeClassic:(BOOL)a5 error:(id)a6;
- (void)getUresInvocationTypeForRequestId:(id)a3 withCompletion:(id)a4;
- (void)processResultCandidate:(id)a3 forRCId:(unint64_t)a4 forTask:(id)a5 forRequestId:(id)a6 completion:(id)a7;
- (void)registerGazeNode:(id)a3;
- (void)registerNLDAClassifierNode:(id)a3;
- (void)registerOSDNode:(id)a3;
- (void)registerSSRNode:(id)a3;
- (void)registerTCUGenerator:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setASRModelRootDirectory:(id)a3;
- (void)setAllowListWordCountThreshold:(unint64_t)a3;
- (void)setAllowVocabList:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setConfigFile:(id)a3;
- (void)setEndpointerFeatureEoS:(float)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setMitigator:(id)a3;
- (void)setMitigatorDelegate:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestIdToFeatsMapping:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSupportedInputOrigins:(id)a3;
- (void)startUresRequestWithAudioRecordContext:(id)a3 forRequestId:(id)a4 mhId:(id)a5 voiceTriggerInfo:(id)a6;
- (void)stop;
- (void)stopUresProcessingForRequest:(id)a3;
@end

@implementation CSAttSiriUresNode

- (CSAttSiriUresNode)init
{
  return -[CSAttSiriUresNode initWithSupportsUOD:supportsHybridUOD:isMedocFeatureEnabled:]( self,  "initWithSupportsUOD:supportsHybridUOD:isMedocFeatureEnabled:",  +[CSUtils supportsUnderstandingOnDevice](&OBJC_CLASS___CSUtils, "supportsUnderstandingOnDevice"),  +[CSUtils supportsHybridUnderstandingOnDevice](&OBJC_CLASS___CSUtils, "supportsHybridUnderstandingOnDevice"),  +[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled"));
}

- (CSAttSiriUresNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriUresNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriUresNode)initWithSupportsUOD:(BOOL)a3 supportsHybridUOD:(BOOL)a4 isMedocFeatureEnabled:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSAttSiriUresNode;
  v8 = -[CSAttSiriUresNode init](&v22, "init");
  v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_type = 8LL;
  v8->_supportsUnderstandingOnDevice = v7;
  v8->_supportsHybridUnderstandingOnDevice = v6;
  v8->_isMedocFeatureEnabled = a5;
  if (v7)
  {
    requiredNodes = v8->_requiredNodes;
    v11 = (NSArray *)&off_1002392C0;
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    requiredNodes = v8->_requiredNodes;
    v11 = (NSArray *)&off_1002392D8;
  }

  v8->_requiredNodes = v11;

LABEL_7:
  v9->_isReady = 0;
  dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
  dispatch_queue_t v14 = dispatch_queue_create("CSAttSiriUresNode queue", v13);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v14;

  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  receivers = v9->_receivers;
  v9->_receivers = (NSHashTable *)v16;

  uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  requestIdToFeatsMapping = v9->_requestIdToFeatsMapping;
  v9->_requestIdToFeatsMapping = (NSMutableDictionary *)v18;

  v20 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CSAttSiriUresNode initWithSupportsUOD:supportsHybridUOD:isMedocFeatureEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Created URES-AS node", buf, 0xCu);
  }

  return v9;
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001128BC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerOSDNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001128B0;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerGazeNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001128A4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerNLDAClassifierNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100112898;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerSSRNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011288C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerTCUGenerator:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100112880;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_receivers, "containsObject:", v4))
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CSAttSiriUresNodeDelegate])
    {
      -[NSHashTable addObject:](self->_receivers, "addObject:", v4);
    }

    else
    {
      v5 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        BOOL v7 = "-[CSAttSiriUresNode addReceiver:]";
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

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001127A0;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_getRequestCtxForRequestId:(id)a3
{
  requestIdToFeatsMapping = self->_requestIdToFeatsMapping;
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](requestIdToFeatsMapping, "objectForKeyedSubscript:"));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](requestIdToFeatsMapping, "allValues"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  }

  return v4;
}

- (id)getUresInvocationTypeForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10010E76C;
  uint64_t v16 = sub_10010E77C;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011268C;
  block[3] = &unk_10022D958;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)getUresInvocationTypeForRequestId:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011256C;
  block[3] = &unk_10022E7D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)startUresRequestWithAudioRecordContext:(id)a3 forRequestId:(id)a4 mhId:(id)a5 voiceTriggerInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100111E88;
  block[3] = &unk_10022E138;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  v24 = self;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(queue, block);
}

- (void)asrStartedForRequestId:(id)a3 isRecognitionModeClassic:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100111BDC;
  block[3] = &unk_10022ECA8;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_fetchMitigationConfigForRecordCtx:(id)a3
{
  id v4 = a3;
  prefetchedAsset = self->_prefetchedAsset;
  if (prefetchedAsset)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset allowKeywordsFile](prefetchedAsset, "allowKeywordsFile"));
    -[CSAttSiriUresNode _readAllowListVocabFromFile:](self, "_readAllowListVocabFromFile:", v6);

    id v7 = (NSString *)-[CSAsset allowListWordCountThreshold](self->_prefetchedAsset, "allowListWordCountThreshold");
    self->_allowListWordCountThreshold = (unint64_t)v7;
    id v8 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
      __int16 v19 = 2048;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s _allowListWordCountThreshold:%lu",  (uint8_t *)&v17,  0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getCategoryKeyWithRecordCtx:](self->_prefetchedAsset, "getCategoryKeyWithRecordCtx:", v4));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset mitigationConfigFileForCategory:]( self->_prefetchedAsset,  "mitigationConfigFileForCategory:",  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v12 = [v11 fileExistsAtPath:v10];

    if (v12)
    {
      objc_storeStrong((id *)&self->_configFile, v10);
      id v13 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        configFile = self->_configFile;
        int v17 = 136315394;
        id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
        __int16 v19 = 2114;
        id v20 = configFile;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Use config file at : %{public}@",  (uint8_t *)&v17,  0x16u);
      }

      -[CSAttSiriUresNode _updateSupportedInputOrigins](self, "_updateSupportedInputOrigins");
    }

    else
    {
      id v16 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
        __int16 v19 = 2114;
        id v20 = (NSString *)v10;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Mitigation file doesn't exist at %{public}@, don't use Siri Assets for mitigation",  (uint8_t *)&v17,  0x16u);
      }
    }
  }

  else
  {
    id v15 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Prefetched asset not set",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)stopUresProcessingForRequest:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100111ACC;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setASRModelRootDirectory:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100111974;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)getLastMitigationResultForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001116B4;
  block[3] = &unk_10022D958;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)getMitigationDecisionForRCId:(unint64_t)a3 forRequestId:(id)a4
{
  id v6 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  id v7 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAttSiriUresNode getMitigationDecisionForRCId:forRequestId:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s requestId: %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100111170;
  block[3] = &unk_10022D758;
  void block[4] = self;
  id v9 = v6;
  v24 = &v26;
  unint64_t v25 = a3;
  id v23 = v9;
  dispatch_sync(queue, block);
  id v10 = (dispatch_queue_s *)self->_queue;
  char v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1001113CC;
  int v17 = &unk_10022D758;
  id v18 = self;
  id v11 = v9;
  id v20 = &v26;
  unint64_t v21 = a3;
  id v19 = v11;
  dispatch_async(v10, &v14);
  -[CSAttSiriUresNode stopUresProcessingForRequest:]( self,  "stopUresProcessingForRequest:",  v11,  v14,  v15,  v16,  v17,  v18);
  BOOL v12 = *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (void)_logFinalMitigationDecisionToSelf:(BOOL)a3 forMhId:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHMitigationDecisionRecommended);
    [v6 setIsMitigationRecommended:v4];
    id v7 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
    id v9 = [v7 initWithNSUUID:v8];

    id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v10 setMhId:v9];
    id v11 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v11 setEventMetadata:v10];
    [v11 setFinalMitigationRecommendation:v6];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v12 emitMessage:v11];

    uint64_t v13 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[CSAttSiriUresNode _logFinalMitigationDecisionToSelf:forMhId:]";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Submit Final mitigation decision to SELF metrics for MH ID: %@",  (uint8_t *)&v15,  0x16u);
    }
  }

  else
  {
    char v14 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[CSAttSiriUresNode _logFinalMitigationDecisionToSelf:forMhId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)_logLatticeRNNResults:(id)a3 forMhId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
    id v9 = [v7 initWithNSUUID:v8];

    id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationStarted);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    [v10 setModelVersion:v11];

    id v12 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext);
    [v12 setStartedOrChanged:v10];
    id v13 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v13 setMhId:v9];
    id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v14 setMhId:v9];
    [v14 setEventMetadata:v13];
    [v14 setLatticeFalseTriggerMitigationEvaluationContext:v12];
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v15 emitMessage:v14];

    id v16 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationEnded);
    [v5 score];
    objc_msgSend(v16, "setScore:");
    [v5 threshold];
    objc_msgSend(v16, "setThreshold:");
    id v17 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext);

    [v17 setEnded:v16];
    id v18 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);

    [v18 setMhId:v9];
    id v19 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);

    [v19 setMhId:v9];
    [v19 setEventMetadata:v18];
    [v19 setLatticeFalseTriggerMitigationEvaluationContext:v17];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v20 emitMessage:v19];

    unint64_t v21 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      v24 = "-[CSAttSiriUresNode _logLatticeRNNResults:forMhId:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Submit LRNN SELF metrics for MH ID: %@",  (uint8_t *)&v23,  0x16u);
    }
  }

  else
  {
    id v22 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      v24 = "-[CSAttSiriUresNode _logLatticeRNNResults:forMhId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v23,  0xCu);
    }
  }
}

- (void)_logLRNNFailMsgForMhId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v3);

  id v11 = [v4 initWithNSUUID:v5];
  id v6 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationFailed);
  [v6 setErrorCode:1904];
  id v7 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext);
  [v7 setFailed:v6];
  id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  [v8 setMhId:v11];
  id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  [v9 setMhId:v11];
  [v9 setEventMetadata:v8];
  [v9 setLatticeFalseTriggerMitigationEvaluationContext:v7];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v10 emitMessage:v9];
}

- (void)_logURESEndMessageWithScore:(float)a3 threshold:(float)a4 spkrIDThreshold:(float)a5 assetVersion:(id)a6 withMhId:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  if (v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v12);
    id v15 = [v13 initWithNSUUID:v14];

    id v16 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUnintendedResponseSuppressionEnded);
    [v16 setModelVersion:v11];
    *(float *)&double v17 = a3;
    [v16 setScore:v17];
    *(float *)&double v18 = a4;
    [v16 setThreshold:v18];
    *(float *)&double v19 = a5;
    [v16 setSpeakerIDThreshold:v19];
    id v20 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUnintendedResponseSuppressionEvaluationContext);
    [v20 setEnded:v16];
    id v21 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v21 setMhId:v15];
    id v22 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v22 setMhId:v15];
    [v22 setUnintendedResponseSuppressionExecutionContext:v20];
    [v22 setEventMetadata:v21];
    int v23 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v23 emitMessage:v22];

    v24 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315394;
      v27 = "-[CSAttSiriUresNode _logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:]";
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Submit URES SELF metrics for MH ID: %@",  (uint8_t *)&v26,  0x16u);
    }
  }

  else
  {
    __int16 v25 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315138;
      v27 = "-[CSAttSiriUresNode _logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v26,  0xCu);
    }
  }
}

- (void)_logURESResultsForInput:(id)a3 withOutput:(id)a4 forMhId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v45 = self;
    id v11 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    id v13 = [v11 initWithNSUUID:v12];

    id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 acousticFTMScores]);
    [v15 floatValue];
    objc_msgSend(v14, "setScore:");

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 speechPackage]);
    id v17 = (id)objc_claimAutoreleasedReturnValue([v16 latticeMitigatorResult]);

    id v44 = v8;
    if (v17)
    {
      id v17 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHLatticeFalseTriggerMitigationEnded);
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v8 speechPackage]);
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 latticeMitigatorResult]);
      [v19 score];
      objc_msgSend(v17, "setScore:");
    }

    id v20 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUnintendedResponseSuppressionStarted);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 extractedFeats]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"numAsrRecords"]);
    objc_msgSend(v20, "setNumAsrRecords:", objc_msgSend(v22, "unsignedIntValue"));

    int v23 = (void *)objc_claimAutoreleasedReturnValue([v9 extractedFeats]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"numTokensTopPath"]);
    objc_msgSend(v20, "setNumTokensTopPath:", objc_msgSend(v24, "unsignedIntValue"));

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 extractedFeats]);
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"trailingSilenceDuration"]);
    [v26 floatValue];
    objc_msgSend( v20,  "setTrailingSilenceDurationInNs:",  +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

    v27 = v14;
    [v20 setAftmScore:v14];
    if (v17) {
      [v20 setLrnnScore:v17];
    }
    id v28 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUnintendedResponseSuppressionEvaluationContext);
    [v28 setStartedOrChanged:v20];
    id v29 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v29 setMhId:v13];
    id v30 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v30 setMhId:v13];
    [v30 setEventMetadata:v29];
    [v30 setUnintendedResponseSuppressionExecutionContext:v28];
    v31 = v13;
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v32 emitMessage:v30];

    [v9 score];
    int v34 = v33;
    [v9 threshold];
    int v36 = v35;
    [v9 speakerIDThreshold];
    int v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue([v9 assetVersion]);
    LODWORD(v40) = v34;
    LODWORD(v41) = v36;
    LODWORD(v42) = v38;
    -[CSAttSiriUresNode _logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:]( v45,  "_logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:",  v39,  v10,  v40,  v41,  v42);

    id v8 = v44;
  }

  else
  {
    v43 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CSAttSiriUresNode _logURESResultsForInput:withOutput:forMhId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  buf,  0xCu);
    }
  }
}

- (void)_logURESFailureMsgInput:(unint64_t)a3 forMhId:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);

  id v13 = [v6 initWithNSUUID:v7];
  id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUnintendedResponseSuppressionFailed);
  [v8 setErrorCode:a3];
  id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUnintendedResponseSuppressionEvaluationContext);
  [v9 setFailed:v8];
  id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  [v10 setMhId:v13];
  id v11 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  [v11 setMhId:v13];
  [v11 setEventMetadata:v10];
  [v11 setUnintendedResponseSuppressionExecutionContext:v9];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v12 emitMessage:v11];
}

- (void)_storeMitigationDecision:(BOOL)a3 forRCId:(unint64_t)a4 requestContext:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mitigationDecisions]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);

  if (v10)
  {
    id v11 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      id v16 = "-[CSAttSiriUresNode _storeMitigationDecision:forRCId:requestContext:]";
      __int16 v17 = 2050;
      unint64_t v18 = a4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Replacing already made decision for RCId: %{public}lu",  (uint8_t *)&v15,  0x16u);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 mitigationDecisions]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v12 setObject:v13 forKey:v14];

  [v7 setShouldUpdateMitigationResult:1];
}

- (void)_createModelAndRunInferenceForRcId:(unint64_t)a3 withRequestContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  -[CSAttSiriUresNode _createMitigatorModelWithConfig:](self, "_createMitigatorModelWithConfig:", self->_configFile);
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_10010E76C;
  v19[4] = sub_10010E77C;
  id v20 = 0LL;
  if (self->_mitigator)
  {
    id v10 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 mhId]);
      *(_DWORD *)buf = 136315650;
      id v22 = "-[CSAttSiriUresNode _createModelAndRunInferenceForRcId:withRequestContext:withCompletion:]";
      __int16 v23 = 2112;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s request-MHID:%@ requestCtx:%@",  buf,  0x20u);
    }

    mitigator = self->_mitigator;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 inputFeats]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100110DB0;
    v14[3] = &unk_10022D780;
    __int16 v17 = v19;
    id v16 = v9;
    v14[4] = self;
    unint64_t v18 = a3;
    id v15 = v8;
    -[SLUresMitigator processInputFeats:completion:](mitigator, "processInputFeats:completion:", v13, v14);
  }

  else
  {
    -[CSAttSiriUresNode _storeMitigationDecision:forRCId:requestContext:]( self,  "_storeMitigationDecision:forRCId:requestContext:",  0LL,  a3,  v8);
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }

  _Block_object_dispose(v19, 8);
}

- (BOOL)_shouldRunMitigationForRequestContext:(id)a3 forTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordCtx]);
  unsigned __int8 v9 = -[CSAttSiriUresNode _shouldRunMitigationForContext:](self, "_shouldRunMitigationForContext:", v8);

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 inputFeats]);
    id v11 = v10;
    if (v10
      && (id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 inputOrigin]), v12, v12))
    {
      supportedInputOrigins = self->_supportedInputOrigins;
      if (supportedInputOrigins
        && (id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 inputOrigin]),
            unsigned __int8 v15 = -[NSArray containsObject:](supportedInputOrigins, "containsObject:", v14),
            v14,
            (v15 & 1) == 0))
      {
        id v26 = (void *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
        {
          id v29 = v26;
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 inputOrigin]);
          int v31 = 136315394;
          __int16 v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
          __int16 v33 = 2114;
          id v34 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s UReS not supported for inputOrigin: %{public}@, abort",  (uint8_t *)&v31,  0x16u);
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 mhId]);
        id v22 = self;
        uint64_t v23 = 1906LL;
      }

      else
      {
        if (-[CSAttSiriUresNode _isSpeechRecognizerTaskSupported:](self, "_isSpeechRecognizerTaskSupported:", v7))
        {
          BOOL v16 = 1;
LABEL_14:

          goto LABEL_15;
        }

        __int16 v25 = (os_log_s *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315394;
          __int16 v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
          __int16 v33 = 2114;
          id v34 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Recognizer task: %{public}@ isn't support, don't run URES mitigator",  (uint8_t *)&v31,  0x16u);
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 mhId]);
        id v22 = self;
        uint64_t v23 = 1905LL;
      }
    }

    else
    {
      id v20 = (void *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        v27 = v20;
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v11 inputOrigin]);
        int v31 = 136315394;
        __int16 v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
        __int16 v33 = 2114;
        id v34 = v28;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Unable to get all required inputs for decision - (inputOrigin: %{public}@), abort",  (uint8_t *)&v31,  0x16u);
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 mhId]);
      id v22 = self;
      uint64_t v23 = 1901LL;
    }

    -[CSAttSiriUresNode _logURESFailureMsgInput:forMhId:](v22, "_logURESFailureMsgInput:forMhId:", v23, v21);

    BOOL v16 = 0;
    goto LABEL_14;
  }

  __int16 v17 = (void *)CSLogCategorySDSD;
  BOOL v16 = 0;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = v17;
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v6 recordCtx]);
    int v31 = 136315394;
    __int16 v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
    __int16 v33 = 2114;
    id v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Mitigation not supported for ctx: %{public}@",  (uint8_t *)&v31,  0x16u);

    BOOL v16 = 0;
  }

- (BOOL)_supportsHybridSDSD
{
  return !self->_supportsUnderstandingOnDevice && self->_supportsHybridUnderstandingOnDevice;
}

- (void)processResultCandidate:(id)a3 forRCId:(unint64_t)a4 forTask:(id)a5 forRequestId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100110708;
  v21[3] = &unk_10022D7A8;
  v21[4] = self;
  id v22 = v14;
  id v25 = v15;
  unint64_t v26 = a4;
  id v23 = v13;
  id v24 = v12;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(queue, v21);
}

- (void)_runLRNNOnlyMitigationForRCId:(unint64_t)a3 speechPackage:(id)a4 requestId:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, BOOL))a6;
  requestIdToFeatsMapping = self->_requestIdToFeatsMapping;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( requestIdToFeatsMapping,  "objectForKeyedSubscript:",  a5));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 latticeMitigatorResult]);
  [v14 score];
  float v16 = v15;
  double v17 = v15;

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 latticeMitigatorResult]);
  [v18 threshold];
  float v20 = v19;
  double v21 = v19;

  id v22 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315394;
    int v35 = "-[CSAttSiriUresNode _runLRNNOnlyMitigationForRCId:speechPackage:requestId:completion:]";
    __int16 v36 = 1024;
    LODWORD(v37) = v16 < v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s shouldMitigate = %d",  (uint8_t *)&v34,  0x12u);
  }

  if (v16 >= v20) {
    id v23 = @"requestNotMitigated";
  }
  else {
    id v23 = @"requestMitigated";
  }
  -[CSAttSiriUresNode _storeMitigationDecision:forRCId:requestContext:]( self,  "_storeMitigationDecision:forRCId:requestContext:",  v16 < v20,  a3,  v13);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 mhId]);
  LODWORD(v25) = -1.0;
  *(float *)&double v26 = v16;
  *(float *)&double v27 = v20;
  -[CSAttSiriUresNode _logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:]( self,  "_logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:",  @"16.1.1",  v24,  v26,  v27,  v25);

  id v28 = v23;
  v40[0] = @"score";
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
  v41[0] = v29;
  v41[1] = v28;
  v40[1] = @"decision";
  v40[2] = @"decisionValue";
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16 < v20));
  v41[2] = v30;
  v40[3] = @"threshold";
  int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
  v40[4] = @"assetVersion";
  v41[3] = v31;
  v41[4] = @"16.1.1";
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  5LL));

  __int16 v33 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315650;
    int v35 = "-[CSAttSiriUresNode _runLRNNOnlyMitigationForRCId:speechPackage:requestId:completion:]";
    __int16 v36 = 2114;
    int v37 = v32;
    __int16 v38 = 2050;
    unint64_t v39 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s Final mitigation result: %{public}@ for RCId: %{public}lu",  (uint8_t *)&v34,  0x20u);
  }

  if (v10) {
    v10[2](v10, v16 < v20);
  }
}

- (void)setEndpointerFeatureEoS:(float)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001104AC;
  v4[3] = &unk_10022E8F8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_createMitigatorModelWithConfig:(id)a3
{
  id v4 = a3;
  if (self->_mitigator)
  {
    float v5 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSAttSiriUresNode _createMitigatorModelWithConfig:]";
      id v6 = "%s Reusing existing mitigator instance";
      id v7 = v5;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  id v14 = 0LL;
  id v8 = -[SLUresMitigator initWithConfig:error:]( objc_alloc(&OBJC_CLASS___SLUresMitigator),  "initWithConfig:error:",  v4,  &v14);
  id v9 = v14;
  mitigator = self->_mitigator;
  self->_mitigator = v8;

  id v11 = (os_log_s *)CSLogCategorySDSD;
  if (self->_mitigator && !v9)
  {
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSAttSiriUresNode _createMitigatorModelWithConfig:]";
      id v6 = "%s Created URES Mitigator !";
      id v7 = v11;
      goto LABEL_8;
    }

- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11
{
  *(float *)&a5 = a5;
  -[CSAttSiriUresNode setEndpointerFeatureEoS:](self, "setEndpointerFeatureEoS:", a3, a4, a6, a8, a9, a10, a5, a7, a11);
}

- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001102A0;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)attSiriNode:(id)a3 didMitigate:(BOOL)a4 withScore:(float)a5 forRequestId:(id)a6 taskType:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010FDD8;
  v15[3] = &unk_10022D7D0;
  float v19 = a5;
  id v16 = v10;
  id v17 = v11;
  id v18 = self;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6
{
  id v8 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010FB7C;
  block[3] = &unk_10022E7F8;
  void block[4] = self;
  id v12 = v8;
  double v13 = a5;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didUpdateWithSpeakerInfo:(id)a4 forReqId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010F5C0;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (id)constructTCUIntendedInfoForRequestId:(id)a3 withResultCandidate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CSUtils isTCUSupported](&OBJC_CLASS___CSUtils, "isTCUSupported"))
  {
    uint64_t v30 = 0LL;
    int v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    __int16 v33 = sub_10010E76C;
    int v34 = sub_10010E77C;
    id v35 = 0LL;
    v28[0] = 0LL;
    v28[1] = v28;
    v28[2] = 0x3032000000LL;
    v28[3] = sub_10010E76C;
    v28[4] = sub_10010E77C;
    id v29 = 0LL;
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x2020000000LL;
    v27[3] = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010E9C8;
    block[3] = &unk_10022D7F8;
    id v9 = v6;
    id v21 = v9;
    id v22 = self;
    id v10 = v7;
    id v23 = v10;
    id v24 = v28;
    double v25 = v27;
    double v26 = &v30;
    dispatch_sync(queue, block);
    id v11 = (dispatch_queue_s *)self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10010EFD0;
    v14[3] = &unk_10022D820;
    id v18 = v28;
    id v15 = v9;
    id v16 = self;
    float v19 = v27;
    id v17 = v10;
    dispatch_async(v11, v14);
    id v12 = (id)v31[5];

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&v30, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (void)didStartRecognitionRequest:(id)a3 successfully:(BOOL)a4 isRecognitionModeClassic:(BOOL)a5 error:(id)a6
{
  if (a4) {
    -[CSAttSiriUresNode asrStartedForRequestId:isRecognitionModeClassic:]( self,  "asrStartedForRequestId:isRecognitionModeClassic:",  a3,  a5);
  }
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8
{
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 multiUserSpeechPackage:(id)a5 topUserSpeechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
  if (a6) {
    -[CSAttSiriUresNode processResultCandidate:forRCId:forTask:forRequestId:completion:]( self,  "processResultCandidate:forRCId:forTask:forRequestId:completion:",  a6,  a4,  a8,  a3,  0LL,  a7);
  }
}

- (void)didReceiveTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6
{
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010E7DC;
  block[3] = &unk_10022D848;
  BOOL v15 = a4;
  BOOL v16 = a6;
  id v13 = v9;
  id v14 = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)_holdTransactionForUresProcessing
{
  if (!self->_osTransaction)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ures ID - %@",  self->_mhId));
    id v4 = -[CSOSTransaction initWithDescription:](objc_alloc(&OBJC_CLASS___CSOSTransaction), "initWithDescription:", v3);
    osTransaction = self->_osTransaction;
    self->_osTransaction = v4;
  }

  id v6 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSAttSiriUresNode _holdTransactionForUresProcessing]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s OS transaction obtained for UReS inference",  buf,  0xCu);
  }

- (void)_releaseUresProcessingTransaction
{
  osTransaction = self->_osTransaction;
  id v4 = (os_log_s *)CSLogCategorySDSD;
  BOOL v5 = os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO);
  if (osTransaction)
  {
    if (v5)
    {
      int v6 = 136315138;
      id v7 = "-[CSAttSiriUresNode _releaseUresProcessingTransaction]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s OS transaction released after UReS inference",  (uint8_t *)&v6,  0xCu);
      osTransaction = self->_osTransaction;
    }

    self->_osTransaction = 0LL;
  }

  else if (v5)
  {
    int v6 = 136315138;
    id v7 = "-[CSAttSiriUresNode _releaseUresProcessingTransaction]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s osTransaction already released",  (uint8_t *)&v6,  0xCu);
  }

- (BOOL)_shouldRunMitigationForContext:(id)a3
{
  id v3 = a3;
  uint64_t v5 = CSIsCommunalDevice(v3, v4);
  BOOL v7 = (v5 & 1) == 0 && !CSIsWatch(v5, v6)
    || ([v3 isUIButtonPress] & 1) == 0
    && ([v3 isHomePressed] & 1) == 0
    && ([v3 isRemoraButtonPress] & 1) == 0
    && ([v3 isHearstDoubleTapTriggered] & 1) == 0;

  return v7;
}

- (void)_updateInputFeats:(id)a3 forSignalsFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  p_gazeNode = &self->_gazeNode;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gazeNode);
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    p_osdNode = &self->_osdNode;
    id v13 = objc_loadWeakRetained((id *)p_osdNode);

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_gazeNode);
      id v15 = [v14 hadSignalsFrom:a4 to:a5];

      [v8 setDidDetectGazeAtOrb:v15];
      id v16 = objc_loadWeakRetained((id *)p_osdNode);
      unsigned int v17 = [v16 hadSignalsFrom:a4 to:a5];

      [v8 setDidDetectVisualActivity:v15];
      id v18 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        float v20 = "-[CSAttSiriUresNode _updateInputFeats:forSignalsFrom:to:]";
        __int16 v21 = 1024;
        int v22 = (int)v15;
        __int16 v23 = 1024;
        unsigned int v24 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Updated gaze signal to %i and visual speech signal to %i",  (uint8_t *)&v19,  0x18u);
      }
    }
  }
}

- (void)_updateSupportedInputOrigins
{
  supportedInputOrigins = self->_supportedInputOrigins;
  self->_supportedInputOrigins = 0LL;

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriUresNode _decodeJsonFromFile:](self, "_decodeJsonFromFile:", self->_configFile));
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"supportedInputOrigins"]);

    uint64_t v4 = v9;
    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"supportedInputOrigins"]);
      BOOL v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6));
      id v8 = self->_supportedInputOrigins;
      self->_supportedInputOrigins = v7;

      uint64_t v4 = v9;
    }
  }
}

- (id)_decodeJsonFromFile:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", a3));
  if (v3)
  {
    id v10 = 0LL;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v3,  0LL,  &v10));
    id v5 = v10;
    if (v5)
    {
      uint64_t v6 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v12 = "-[CSAttSiriUresNode _decodeJsonFromFile:]";
        __int16 v13 = 2112;
        id v14 = v3;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s ERR: read metafile %@ failed with %{public}@ - defaulting to NO",  buf,  0x20u);
      }

      id v7 = 0LL;
    }

    else
    {
      id v7 = v4;
    }
  }

  else
  {
    id v8 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[CSAttSiriUresNode _decodeJsonFromFile:]";
      __int16 v13 = 2112;
      id v14 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s ERR: metaData is nil, defaulting to NO for %@",  buf,  0x16u);
    }

    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)_shouldApplyAllowListOverride:(id)a3 withInputOrigin:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToNumber:&off_100238DC0])
  {
    if (self->_allowVocabList)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 oneBestTranscript]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 oneBestTokenList]);
      if ((unint64_t)[v9 count] <= self->_allowListWordCountThreshold)
      {
        if (-[NSArray containsObject:](self->_allowVocabList, "containsObject:", v8))
        {
          id v14 = (os_log_s *)CSLogCategorySDSD;
          if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 136315394;
            unsigned int v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
            __int16 v18 = 2112;
            int v19 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Found transcript (%@) match in override list, don't mitigate",  (uint8_t *)&v16,  0x16u);
          }

          BOOL v13 = 1;
          goto LABEL_17;
        }
      }

      else
      {
        id v10 = (os_log_s *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
        {
          int v16 = 136315138;
          unsigned int v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Num tokens exceeds threshold, don't apply override",  (uint8_t *)&v16,  0xCu);
        }
      }

      BOOL v13 = 0;
LABEL_17:

      goto LABEL_18;
    }

    id v11 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      unsigned int v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
      id v12 = "%s Override vocab list not set";
      goto LABEL_10;
    }
  }

  else
  {
    id v11 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      unsigned int v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
      id v12 = "%s Override not applicable for non-magus inputOrigin";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, 0xCu);
    }
  }

  BOOL v13 = 0;
LABEL_18:

  return v13;
}

- (void)_readAllowListVocabFromFile:(id)a3
{
  id v4 = a3;
  id v17 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v4,  4LL,  &v17));
  id v6 = v17;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByCharactersInSet:v8]);

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    allowVocabList = self->_allowVocabList;
    p_allowVocabList = (id *)&self->_allowVocabList;
    id *p_allowVocabList = (id)v10;

    objc_storeStrong(p_allowVocabList, v9);
    BOOL v13 = (void *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *p_allowVocabList;
      __int16 v15 = v13;
      id v16 = [v14 count];
      *(_DWORD *)buf = 136315650;
      int v19 = "-[CSAttSiriUresNode _readAllowListVocabFromFile:]";
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2048;
      id v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Read SDSD override list from %{public}@ with %lu entries",  buf,  0x20u);
    }
  }
}

- (BOOL)_isSpeechRecognizerTaskSupported:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = [v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto];
  }

  return v4;
}

- (id)getUresInputFeaturesForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int16 v15 = sub_10010E76C;
  id v16 = sub_10010E77C;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010E784;
  block[3] = &unk_10022D958;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
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

- (CSAttSiriOSDNode)osdNode
{
  return (CSAttSiriOSDNode *)objc_loadWeakRetained((id *)&self->_osdNode);
}

- (CSAttSiriSignalDataAggregatorProtocol)gazeNode
{
  return (CSAttSiriSignalDataAggregatorProtocol *)objc_loadWeakRetained((id *)&self->_gazeNode);
}

- (CSAttSiriNLDAClassifierNode)nldaClassifierNode
{
  return (CSAttSiriNLDAClassifierNode *)objc_loadWeakRetained((id *)&self->_nldaClassifierNode);
}

- (CSAttSiriSSRNode)ssrNode
{
  return (CSAttSiriSSRNode *)objc_loadWeakRetained((id *)&self->_ssrNode);
}

- (CSAttSiriMitigatorDeletgate)mitigatorDelegate
{
  return (CSAttSiriMitigatorDeletgate *)objc_loadWeakRetained((id *)&self->_mitigatorDelegate);
}

- (void)setMitigatorDelegate:(id)a3
{
}

- (CSAttSiriTCUGenerator)tcuGenerator
{
  return (CSAttSiriTCUGenerator *)objc_loadWeakRetained((id *)&self->_tcuGenerator);
}

- (SLUresMitigator)mitigator
{
  return self->_mitigator;
}

- (void)setMitigator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setConfigFile:(id)a3
{
}

- (NSArray)supportedInputOrigins
{
  return self->_supportedInputOrigins;
}

- (void)setSupportedInputOrigins:(id)a3
{
}

- (CSOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (NSArray)allowVocabList
{
  return self->_allowVocabList;
}

- (void)setAllowVocabList:(id)a3
{
}

- (unint64_t)allowListWordCountThreshold
{
  return self->_allowListWordCountThreshold;
}

- (void)setAllowListWordCountThreshold:(unint64_t)a3
{
  self->_allowListWordCountThreshold = a3;
}

- (NSMutableDictionary)requestIdToFeatsMapping
{
  return self->_requestIdToFeatsMapping;
}

- (void)setRequestIdToFeatsMapping:(id)a3
{
}

- (BOOL)supportsUnderstandingOnDevice
{
  return self->_supportsUnderstandingOnDevice;
}

- (BOOL)supportsHybridUnderstandingOnDevice
{
  return self->_supportsHybridUnderstandingOnDevice;
}

- (BOOL)isMedocFeatureEnabled
{
  return self->_isMedocFeatureEnabled;
}

- (void).cxx_destruct
{
}

+ (float)_extractLrnnScoreForResultCandidate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  float v5 = -1.0;
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 latticeMitigatorResult]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 latticeMitigatorResult]);
      [v7 score];
      float v5 = v8;
    }
  }

  id v9 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "+[CSAttSiriUresNode _extractLrnnScoreForResultCandidate:]";
    __int16 v13 = 2050;
    double v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Setting lrnn score to %{public}.3f per speech package",  (uint8_t *)&v11,  0x16u);
  }

  return v5;
}

@end