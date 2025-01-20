@interface CSAttSiriAFTMNode
- (BOOL)_shouldHandleMitigationDecision:(BOOL)a3;
- (BOOL)isReady;
- (BOOL)isShadowModeEnabled;
- (BOOL)makeStandaloneMitigation;
- (BOOL)sessionInProgress;
- (CSAsset)currentAsset;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAFTMNode)init;
- (CSAttSiriAFTMNode)initWithAttSiriController:(id)a3;
- (CSAttSiriController)attSiriController;
- (CSAudioRecordContext)context;
- (NSArray)requiredNodes;
- (NSArray)thresholds;
- (NSHashTable)receivers;
- (NSString)configFile;
- (NSString)mhId;
- (NSString)requestId;
- (NSString)taskName;
- (OS_dispatch_queue)queue;
- (SLProgressiveCheckerAnalyzer)acousticAnalyzer;
- (SLProgressiveCheckerResult)latestResult;
- (id)_createResultDict;
- (unint64_t)supportedRecordType;
- (unint64_t)type;
- (void)_addAudio:(id)a3;
- (void)_handleAFTMResults:(id)a3;
- (void)_logAFTMEndMsgWithScore:(float)a3 analyzedSamples:(unint64_t)a4;
- (void)_logAFTMStartMsg:(id)a3 taskType:(id)a4;
- (void)_logResultToVTDirectory;
- (void)_reportResultToAnalytics;
- (void)_reset;
- (void)_setAsset:(id)a3 forTask:(id)a4;
- (void)_startRequestWithContext:(id)a3 withVtei:(id)a4 withRequestId:(id)a5 completion:(id)a6;
- (void)_startRequestWithContext:(id)a3 withVtei:(id)a4 withVTAssets:(id)a5 taskType:(id)a6 withRequestId:(id)a7 completion:(id)a8;
- (void)addAudio:(id)a3;
- (void)addReceiver:(id)a3;
- (void)analyzer:(id)a3 hasFinalResult:(id)a4;
- (void)analyzer:(id)a3 hasPartialResult:(id)a4;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)endAudio;
- (void)removeReceiver:(id)a3;
- (void)setAcousticAnalyzer:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setConfigFile:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setIsShadowModeEnabled:(BOOL)a3;
- (void)setLatestResult:(id)a3;
- (void)setMakeStandaloneMitigation:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSessionInProgress:(BOOL)a3;
- (void)setSupportedRecordType:(unint64_t)a3;
- (void)setTaskName:(id)a3;
- (void)setThresholds:(id)a3;
- (void)startRequestWithContext:(id)a3 withVtei:(id)a4 taskType:(id)a5 withRequestId:(id)a6 completion:(id)a7;
- (void)startRequestWithContext:(id)a3 withVtei:(id)a4 withVTAssets:(id)a5 taskType:(id)a6 withRequestId:(id)a7 completion:(id)a8;
- (void)stop;
@end

@implementation CSAttSiriAFTMNode

- (CSAttSiriAFTMNode)init
{
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___CSAttSiriAFTMNode;
    v4 = -[CSAttSiriAFTMNode init](&v15, "init");
    v5 = v4;
    if (v4)
    {
      requiredNodes = v4->_requiredNodes;
      v4->_type = 9LL;
      v4->_requiredNodes = (NSArray *)&off_100239290;

      v5->_isReady = 0;
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      receivers = v5->_receivers;
      v5->_receivers = (NSHashTable *)v7;

      dispatch_queue_t v9 = dispatch_queue_create("AcousticSL", 0LL);
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v9;

      v5->_sessionInProgress = 0;
      v5->_supportedRecordType = 0LL;
      v5->_makeStandaloneMitigation = CSIsHorseman(v11, v12);
      v13 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[CSAttSiriAFTMNode init]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Created AFTM-AS node", buf, 0xCu);
      }
    }

    self = v5;
    v3 = self;
  }

  return v3;
}

- (CSAttSiriAFTMNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriAFTMNode init](self, "init");
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
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CSAttSiriAFTMNodeDelegate])
    {
      -[NSHashTable addObject:](self->_receivers, "addObject:", v4);
    }

    else
    {
      v5 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315394;
        uint64_t v7 = "-[CSAttSiriAFTMNode addReceiver:]";
        __int16 v8 = 2112;
        id v9 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Unsupported receiver: %@",  (uint8_t *)&v6,  0x16u);
      }
    }
  }
}

- (void)removeReceiver:(id)a3
{
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D558C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D54C8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRequestWithContext:(id)a3 withVtei:(id)a4 withVTAssets:(id)a5 taskType:(id)a6 withRequestId:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D54B0;
  block[3] = &unk_10022CE30;
  block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(queue, block);
}

- (void)_startRequestWithContext:(id)a3 withVtei:(id)a4 withVTAssets:(id)a5 taskType:(id)a6 withRequestId:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (([v14 isVoiceTriggered] & 1) != 0
    || ([v14 isContinuousConversation] & 1) != 0)
  {
    -[CSAttSiriAFTMNode _setAsset:forTask:](self, "_setAsset:forTask:", v16, v17);
    -[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withRequestId:completion:]( self,  "_startRequestWithContext:withVtei:withRequestId:completion:",  v14,  v15,  v18,  v19);
  }

  else
  {
    v20 = (void *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      int v22 = 136315394;
      id v23 = "-[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withVTAssets:taskType:withRequestId:completion:]";
      __int16 v24 = 2048;
      id v25 = [v14 type];
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Don't run AFTM for recordType: %lld",  (uint8_t *)&v22,  0x16u);
    }

    (*((void (**)(id, void, void))v19 + 2))(v19, 0LL, 0LL);
  }
}

- (void)startRequestWithContext:(id)a3 withVtei:(id)a4 taskType:(id)a5 withRequestId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000D5378;
  v23[3] = &unk_10022E0B0;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D536C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)endAudio
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D5364;
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
  v8[2] = sub_1000D5358;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D5350;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setAsset:(id)a3 forTask:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_currentAsset = &self->_currentAsset;
  objc_storeStrong((id *)&self->_currentAsset, a3);
  objc_storeStrong((id *)&self->_taskName, a4);
  if ([v8 isEqualToString:@"AcousticSLTaskTypeVoiceTrigger"])
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue([v7 progCheckerConfigFile]);
    configFile = self->_configFile;
    self->_configFile = v10;

    self->_unint64_t supportedRecordType = (unint64_t)[v7 supportedInputOrigins];
    id v12 = (NSArray *)objc_claimAutoreleasedReturnValue([v7 checkerThresholds]);
    thresholds = self->_thresholds;
    self->_thresholds = v12;

    self->_BOOL isShadowModeEnabled = [v7 progCheckerShadowMode];
  }

  else if ([v8 isEqualToString:@"AcousticSLTaskTypeContConv"])
  {
    id v14 = (NSString *)objc_claimAutoreleasedReturnValue([v7 contConvConfigFile]);
    id v15 = self->_configFile;
    self->_configFile = v14;

    self->_unint64_t supportedRecordType = -1LL;
    id v16 = (NSArray *)objc_claimAutoreleasedReturnValue([v7 contConvThresholds]);
    id v17 = self->_thresholds;
    self->_thresholds = v16;

    self->_BOOL isShadowModeEnabled = 1;
  }

  id v18 = self->_configFile;
  if (v18 && self->_supportedRecordType && self->_thresholds)
  {
    id v19 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315650;
      id v26 = "-[CSAttSiriAFTMNode _setAsset:forTask:]";
      __int16 v27 = 2114;
      unint64_t v28 = (unint64_t)v18;
      __int16 v29 = 2114;
      id v30 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Reading config from: %{public}@ for task %{public}@",  (uint8_t *)&v25,  0x20u);
      id v19 = (os_log_s *)CSLogCategorySDSD;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t supportedRecordType = self->_supportedRecordType;
      int v25 = 136315394;
      id v26 = "-[CSAttSiriAFTMNode _setAsset:forTask:]";
      __int16 v27 = 2050;
      unint64_t v28 = supportedRecordType;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Configured recording types: %{public}lu",  (uint8_t *)&v25,  0x16u);
      id v19 = (os_log_s *)CSLogCategorySDSD;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = self->_thresholds;
      int v25 = 136315394;
      id v26 = "-[CSAttSiriAFTMNode _setAsset:forTask:]";
      __int16 v27 = 2114;
      unint64_t v28 = (unint64_t)v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Thresholds read: %{public}@",  (uint8_t *)&v25,  0x16u);
      id v19 = (os_log_s *)CSLogCategorySDSD;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isShadowModeEnabled = self->_isShadowModeEnabled;
      int v25 = 136315394;
      id v26 = "-[CSAttSiriAFTMNode _setAsset:forTask:]";
      __int16 v27 = 1026;
      LODWORD(v28) = isShadowModeEnabled;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Shadow Mode: %{public}d",  (uint8_t *)&v25,  0x12u);
    }
  }

  else
  {
    id v23 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315650;
      id v26 = "-[CSAttSiriAFTMNode _setAsset:forTask:]";
      __int16 v27 = 2114;
      unint64_t v28 = (unint64_t)v18;
      __int16 v29 = 2114;
      id v30 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Invalid FTM config read from configFile %{public}@ for task %{public}@",  (uint8_t *)&v25,  0x20u);
    }

    id v24 = *p_currentAsset;
    *p_currentAsset = 0LL;
  }
}

- (void)_startRequestWithContext:(id)a3 withVtei:(id)a4 withRequestId:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, uint64_t, void))a6;
  id v15 = (void *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = (SLProgressiveCheckerAnalyzer *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext recordTypeString:]( CSAudioRecordContext,  "recordTypeString:",  [v11 type]));
    unint64_t supportedRecordType = self->_supportedRecordType;
    taskName = self->_taskName;
    *(_DWORD *)buf = 136315906;
    v50 = "-[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withRequestId:completion:]";
    __int16 v51 = 2114;
    v52 = v17;
    __int16 v53 = 2050;
    unint64_t v54 = supportedRecordType;
    __int16 v55 = 2114;
    v56 = taskName;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Received start request for record type: %{public}@, supportedRecordTypes: %{public}lx taskName %{public}@",  buf,  0x2Au);

    id v15 = (void *)CSLogCategorySDSD;
  }

  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL sessionInProgress = self->_sessionInProgress;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withRequestId:completion:]";
    __int16 v51 = 1024;
    LODWORD(v52) = sessionInProgress;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%s session in progress:%u",  buf,  0x12u);
  }

  if (self->_sessionInProgress) {
    -[CSAttSiriAFTMNode _reset](self, "_reset");
  }
  if (self->_currentAsset)
  {
    unint64_t v21 = self->_supportedRecordType;
    if ((v21 & (1 << (char)[v11 type])) != 0)
    {
      id v22 = objc_alloc(&OBJC_CLASS___SLProgressiveCheckerAnalyzer);
      configFile = self->_configFile;
      id v48 = 0LL;
      id v24 = -[SLProgressiveCheckerAnalyzer initWithConfig:withDelegate:error:]( v22,  "initWithConfig:withDelegate:error:",  configFile,  self,  &v48);
      int v25 = (SLProgressiveCheckerAnalyzer *)v48;
      acousticAnalyzer = self->_acousticAnalyzer;
      self->_acousticAnalyzer = v24;

      if (self->_acousticAnalyzer && !v25)
      {
        uint64_t v27 = objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
        unsigned int v28 = +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat");
        uint64_t v29 = 2LL;
        if (!v28) {
          uint64_t v29 = 0LL;
        }
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getInputoriginFromRecordType:withAsset:]( &OBJC_CLASS___CSUtils,  "getInputoriginFromRecordType:withAsset:",  v11,  self->_currentAsset,  v29));
        id v46 = v13;
        v44 = v30;
        if ([v30 unsignedIntegerValue])
        {
          if ([v30 unsignedIntegerValue] == (id)4)
          {
            uint64_t v31 = 5LL;
          }

          else if ([v30 unsignedIntegerValue] == (id)3)
          {
            uint64_t v31 = 6LL;
          }

          else
          {
            uint64_t v31 = 2LL;
          }
        }

        else
        {
          uint64_t v31 = 4LL;
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v45 = (void *)v27;
        [v33 setObject:v27 forKey:kSLLanguageCode];
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v31));
        [v33 setObject:v34 forKey:kSLInvocationType];

        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v43));
        [v33 setObject:v35 forKey:kSLAudioSourceOption];

        if (v12) {
          [v33 setObject:v12 forKey:kSLVoiceTriggerEventInfo];
        }
        id v47 = 0LL;
        id v36 = [[SLProgressiveCheckerContext alloc] initWithContext:v33 error:&v47];
        v37 = (SLProgressiveCheckerAnalyzer *)v47;
        int v25 = v37;
        if (v36 && !v37)
        {
          -[SLProgressiveCheckerAnalyzer startNewRequestWithContext:]( self->_acousticAnalyzer,  "startNewRequestWithContext:",  v36);
          self->_BOOL sessionInProgress = 1;
          latestResult = self->_latestResult;
          self->_latestResult = 0LL;

          objc_storeStrong((id *)&self->_context, a3);
          objc_storeStrong((id *)&self->_requestId, a5);
          v39 = (os_log_s *)CSLogCategorySDSD;
          if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
          {
            v40 = self->_acousticAnalyzer;
            *(_DWORD *)buf = 136315650;
            v50 = "-[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withRequestId:completion:]";
            __int16 v51 = 2114;
            v52 = v40;
            __int16 v53 = 2114;
            unint64_t v54 = (unint64_t)v33;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%s Created SLProgressiveCheckerAnalyzer %{public}@ with context %{public}@",  buf,  0x20u);
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));
          -[CSAttSiriAFTMNode _logAFTMStartMsg:taskType:](self, "_logAFTMStartMsg:taskType:", v41, self->_taskName);

          if (v14) {
            v14[2](v14, 1LL, 0LL);
          }
          goto LABEL_34;
        }

        v42 = (os_log_s *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withRequestId:completion:]";
          __int16 v51 = 2114;
          v52 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s Unable to create progressive checker context with error:%{public}@",  buf,  0x16u);
          if (!v14) {
            goto LABEL_34;
          }
        }

        else if (!v14)
        {
LABEL_34:

          id v13 = v46;
          goto LABEL_35;
        }

        ((void (**)(id, uint64_t, SLProgressiveCheckerAnalyzer *))v14)[2](v14, 0LL, v25);
        goto LABEL_34;
      }

      id v32 = (os_log_s *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[CSAttSiriAFTMNode _startRequestWithContext:withVtei:withRequestId:completion:]";
        __int16 v51 = 2114;
        v52 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s Unable to create progressive checker with error:%{public}@",  buf,  0x16u);
        if (!v14) {
          goto LABEL_35;
        }
      }

      else if (!v14)
      {
LABEL_35:

        goto LABEL_36;
      }

      ((void (**)(id, uint64_t, SLProgressiveCheckerAnalyzer *))v14)[2](v14, 0LL, v25);
      goto LABEL_35;
    }
  }

- (void)_addAudio:(id)a3
{
  id v4 = a3;
  if (self->_sessionInProgress)
  {
    uint64_t v5 = qword_10027FFC0;
    if (0xCCCCCCCCCCCCCCCDLL * qword_10027FFC0 <= 0x3333333333333333LL)
    {
      id v6 = (void *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
      {
        id v7 = v6;
        int v10 = 136315650;
        id v11 = "-[CSAttSiriAFTMNode _addAudio:]";
        __int16 v12 = 1026;
        unsigned int v13 = [v4 numSamples];
        __int16 v14 = 2050;
        uint64_t v15 = qword_10027FFC0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s CSAcousticProxy has received %{public}d samples, heartbeat = %{public}lld",  (uint8_t *)&v10,  0x1Cu);

        uint64_t v5 = qword_10027FFC0;
      }
    }

    qword_10027FFC0 = v5 + 1;
    acousticAnalyzer = self->_acousticAnalyzer;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dataForChannel:0]);
    -[SLProgressiveCheckerAnalyzer addAudio:](acousticAnalyzer, "addAudio:", v9);
  }
}

- (void)_reset
{
  v3 = (os_log_s *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSAttSiriAFTMNode _reset]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Siri session ended, stoping acoustic checker",  (uint8_t *)&v4,  0xCu);
  }

  -[SLProgressiveCheckerAnalyzer endAudio](self->_acousticAnalyzer, "endAudio");
  self->_BOOL sessionInProgress = 0;
}

- (BOOL)_shouldHandleMitigationDecision:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  if (-[NSString isEqualToString:](self->_taskName, "isEqualToString:", @"AcousticSLTaskTypeContConv")
    || self->_isShadowModeEnabled)
  {
    return 0;
  }

  return self->_makeStandaloneMitigation;
}

- (void)_handleAFTMResults:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_latestResult, a3);
    [v5 score];
    float v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_thresholds, "firstObject"));
    [v8 floatValue];
    float v10 = v9;
    BOOL v11 = v7 < v9;

    if (-[CSAttSiriAFTMNode _shouldHandleMitigationDecision:](self, "_shouldHandleMitigationDecision:", v11))
    {
      __int16 v12 = (void *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = v12;
        [v5 score];
        double v15 = v14;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_thresholds, "objectAtIndexedSubscript:", 0LL));
        [v16 floatValue];
        *(_DWORD *)buf = 136315650;
        id v36 = "-[CSAttSiriAFTMNode _handleAFTMResults:]";
        __int16 v37 = 2050;
        double v38 = v15;
        __int16 v39 = 2050;
        double v40 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Cancelling Siri request, score: %{public}.3f, threshold: %{public}.3f",  buf,  0x20u);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriLauncher sharedLauncher](&OBJC_CLASS___CSSiriLauncher, "sharedLauncher"));
      [v18 deactivateSiriActivationConnectionWithReason:3 withOptions:0 withContext:0];
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v19 = self->_receivers;
    id v20 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v24, "attSiriNode:didMitigate:withScore:forRequestId:taskType:") & 1) != 0)
          {
            -[SLProgressiveCheckerResult score](self->_latestResult, "score", (void)v30);
            objc_msgSend( v24,  "attSiriNode:didMitigate:withScore:forRequestId:taskType:",  self,  v7 < v10,  self->_requestId,  self->_taskName);
          }
        }

        id v21 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
      }

      while (v21);
    }

    -[SLProgressiveCheckerResult score](self->_latestResult, "score");
    int v26 = v25;
    id v27 = -[SLProgressiveCheckerResult analyzedSamples](self->_latestResult, "analyzedSamples");
    LODWORD(v28) = v26;
    -[CSAttSiriAFTMNode _logAFTMEndMsgWithScore:analyzedSamples:]( self,  "_logAFTMEndMsgWithScore:analyzedSamples:",  v27,  v28);
    -[CSAttSiriAFTMNode _reportResultToAnalytics](self, "_reportResultToAnalytics");
    -[CSAttSiriAFTMNode _logResultToVTDirectory](self, "_logResultToVTDirectory");
  }

  else
  {
    uint64_t v29 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v36 = "-[CSAttSiriAFTMNode _handleAFTMResults:]";
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Empty result", buf, 0xCu);
    }
  }
}

- (void)analyzer:(id)a3 hasFinalResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D51D0;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)analyzer:(id)a3 hasPartialResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D5060;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_logAFTMStartMsg:(id)a3 taskType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_mhId)
  {
    id v8 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_mhId);
    id v10 = [v8 initWithNSUUID:v9];

    id v11 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAcousticFalseTriggerMitigationStarted);
    [v11 setModelVersion:v6];
    else {
      uint64_t v12 = 1LL;
    }
    [v11 setMitigationType:v12];
    id v13 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext);
    [v13 setStartedOrChanged:v11];
    id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v14 setMhId:v10];
    id v15 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v15 setMhId:v10];
    [v15 setEventMetadata:v14];
    [v15 setAcousticFalseTriggerMitigationEvaluationContext:v13];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v16 emitMessage:v15];

    float v17 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      int v20 = 136315394;
      id v21 = "-[CSAttSiriAFTMNode _logAFTMStartMsg:taskType:]";
      __int16 v22 = 2112;
      id v23 = mhId;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Submit AFTM Start Msg to SELF metrics for MH ID: %@",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    id v19 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "-[CSAttSiriAFTMNode _logAFTMStartMsg:taskType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v20,  0xCu);
    }
  }
}

- (void)_logAFTMEndMsgWithScore:(float)a3 analyzedSamples:(unint64_t)a4
{
  if (self->_mhId)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_mhId);
    id v9 = [v7 initWithNSUUID:v8];

    id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated);
    *(float *)&double v11 = a3;
    [v10 setScore:v11];
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    objc_msgSend( v10,  "setAudioDurationInNs:",  +[CSFTimeUtils convertSampleCountToNs:sampleRate:]( CSFTimeUtils,  "convertSampleCountToNs:sampleRate:",  a4));
    id v12 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext);
    [v12 setScoreGenerated:v10];
    id v13 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v13 setMhId:v9];
    id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v14 setMhId:v9];
    [v14 setEventMetadata:v13];
    [v14 setAcousticFalseTriggerMitigationEvaluationContext:v12];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v15 emitMessage:v14];

    id v16 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      mhId = self->_mhId;
      int v19 = 136315394;
      int v20 = "-[CSAttSiriAFTMNode _logAFTMEndMsgWithScore:analyzedSamples:]";
      __int16 v21 = 2112;
      __int16 v22 = mhId;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Submit AFTM ScoreGenerated Msg to SELF metrics for MH ID: %@",  (uint8_t *)&v19,  0x16u);
    }
  }

  else
  {
    id v18 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      int v20 = "-[CSAttSiriAFTMNode _logAFTMEndMsgWithScore:analyzedSamples:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v19,  0xCu);
    }
  }

- (void)_logResultToVTDirectory
{
  if (CSIsInternalBuild(self))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v4 = [v3 fileLoggingIsEnabled];

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAFTMNode _createResultDict](self, "_createResultDict"));
      if (v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 voiceTriggerAudioLogDirectory]);

        if ([v6 fileExistsAtPath:v8])
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingString:]( self->_mhId,  "stringByAppendingString:",  @"-SL.json"));
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v9]);
          id v18 = 0LL;
          double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  3LL,  &v18));
          id v12 = v18;
          if (v12)
          {
            id v13 = (void *)CSLogCategorySDSD;
            if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = v13;
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
              *(_DWORD *)buf = 136315394;
              int v20 = "-[CSAttSiriAFTMNode _logResultToVTDirectory]";
              __int16 v21 = 2114;
              __int16 v22 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Error writing out AcousticSL info meta: %{public}@",  buf,  0x16u);
            }
          }

          else
          {
            [v11 writeToFile:v10 atomically:0];
          }

          float v17 = (os_log_s *)CSLogCategorySDSD;
          if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            int v20 = "-[CSAttSiriAFTMNode _logResultToVTDirectory]";
            __int16 v21 = 2114;
            __int16 v22 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Saving AcousticSL results at %{public}@",  buf,  0x16u);
          }
        }

        else
        {
          id v16 = (os_log_s *)CSLogCategorySDSD;
          if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            int v20 = "-[CSAttSiriAFTMNode _logResultToVTDirectory]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Assistant audio log not available",  buf,  0xCu);
          }
        }
      }
    }
  }

- (id)_createResultDict
{
  if (!self->_latestResult || !self->_context || !-[NSArray count](self->_thresholds, "count")) {
    return 0LL;
  }
  v13[0] = @"SLAssetVersion";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));
  v14[0] = v3;
  v13[1] = @"SLScore";
  -[SLProgressiveCheckerResult score](self->_latestResult, "score");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v14[1] = v4;
  v13[2] = @"SLAnalyzedSamples";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[SLProgressiveCheckerResult analyzedSamples](self->_latestResult, "analyzedSamples")));
  v14[2] = v5;
  v13[3] = @"SLCheckerType";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[SLProgressiveCheckerResult resultType](self->_latestResult, "resultType")));
  v14[3] = v6;
  v13[4] = @"SLThreshold";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_thresholds, "objectAtIndexedSubscript:", 0LL));
  [v7 floatValue];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v14[4] = v8;
  v13[5] = @"SLInputOriginType";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[CSAudioRecordContext type](self->_context, "type")));
  v13[6] = @"SLTaskName";
  taskName = self->_taskName;
  v14[5] = v9;
  v14[6] = taskName;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  7LL));

  return v11;
}

- (void)_reportResultToAnalytics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAFTMNode _createResultDict](self, "_createResultDict"));
  if (v2)
  {
    v3 = (os_log_s *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "-[CSAttSiriAFTMNode _reportResultToAnalytics]";
      __int16 v8 = 2112;
      id v9 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Submitting AcousticFTM analytics: %@",  (uint8_t *)&v6,  0x16u);
    }

    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    id v5 = [v2 copy];
    [v4 logEventWithType:4713 context:v5];
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

- (void)setMhId:(id)a3
{
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setConfigFile:(id)a3
{
}

- (SLProgressiveCheckerAnalyzer)acousticAnalyzer
{
  return self->_acousticAnalyzer;
}

- (void)setAcousticAnalyzer:(id)a3
{
}

- (NSArray)thresholds
{
  return self->_thresholds;
}

- (void)setThresholds:(id)a3
{
}

- (unint64_t)supportedRecordType
{
  return self->_supportedRecordType;
}

- (void)setSupportedRecordType:(unint64_t)a3
{
  self->_unint64_t supportedRecordType = a3;
}

- (BOOL)sessionInProgress
{
  return self->_sessionInProgress;
}

- (void)setSessionInProgress:(BOOL)a3
{
  self->_BOOL sessionInProgress = a3;
}

- (BOOL)isShadowModeEnabled
{
  return self->_isShadowModeEnabled;
}

- (void)setIsShadowModeEnabled:(BOOL)a3
{
  self->_BOOL isShadowModeEnabled = a3;
}

- (BOOL)makeStandaloneMitigation
{
  return self->_makeStandaloneMitigation;
}

- (void)setMakeStandaloneMitigation:(BOOL)a3
{
  self->_makeStandaloneMitigation = a3;
}

- (SLProgressiveCheckerResult)latestResult
{
  return self->_latestResult;
}

- (void)setLatestResult:(id)a3
{
}

- (CSAudioRecordContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end