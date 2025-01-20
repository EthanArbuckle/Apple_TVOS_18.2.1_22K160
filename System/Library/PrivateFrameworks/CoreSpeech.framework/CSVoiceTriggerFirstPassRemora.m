@interface CSVoiceTriggerFirstPassRemora
- (CSAdBlockerProviding)adblocker;
- (CSAsset)currentAsset;
- (CSAudioProvider)triggeredAudioProvider;
- (CSMyriadDeviceManager)myriadDeviceManager;
- (CSRemoraAdBlocker)remoraAdBlocker;
- (CSSecondPassProgressDelegate)secondPassProgressDelegate;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassRemora)init;
- (NSMutableDictionary)accessoryFirstPassGoodnessScores;
- (NSMutableDictionary)remoraSecondPassRequests;
- (NSMutableDictionary)triggeredAudioStreamHoldingByAccessoryId;
- (OS_dispatch_queue)queue;
- (void)_cancelAllAudioStreamHoldings;
- (void)_cancelAudioStreamHoldingForAccessoryWithId:(id)a3;
- (void)_createSecondPassRequestIfNecessaryForActivationEvent:(id)a3 completion:(id)a4;
- (void)_handleRemoraTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5;
- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 error:(id)a6 completion:(id)a7;
- (void)_requestStartAudioStreamProviderWithContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6;
- (void)_reset;
- (void)_setDeviceIds:(id)a3;
- (void)_setIsSecondPassing:(BOOL)a3 forDeviceId:(id)a4;
- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)adBlockerHasMatchWithVoiceTrigger:(BOOL)a3;
- (void)cancelSecondPassRunning;
- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4;
- (void)remoraAdBlockerHasMatch;
- (void)reset;
- (void)setAccessoryFirstPassGoodnessScores:(id)a3;
- (void)setAdblocker:(id)a3;
- (void)setConnectedDeviceIds:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMyriadDeviceManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoraAdBlocker:(id)a3;
- (void)setRemoraSecondPassRequests:(id)a3;
- (void)setSecondPassProgressDelegate:(id)a3;
- (void)setTriggeredAudioProvider:(id)a3;
- (void)setTriggeredAudioStreamHoldingByAccessoryId:(id)a3;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassRemora

- (CSVoiceTriggerFirstPassRemora)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassRemora;
  v2 = -[CSVoiceTriggerFirstPassRemora init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  @"com.apple.corespeech.firstpassremora",  kCSDefaultSerialQueueFixedPriority));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    remoraSecondPassRequests = v2->_remoraSecondPassRequests;
    v2->_remoraSecondPassRequests = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    accessoryFirstPassGoodnessScores = v2->_accessoryFirstPassGoodnessScores;
    v2->_accessoryFirstPassGoodnessScores = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    triggeredAudioStreamHoldingByAccessoryId = v2->_triggeredAudioStreamHoldingByAccessoryId;
    v2->_triggeredAudioStreamHoldingByAccessoryId = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[CSMyriadDeviceManager sharedInstance](&OBJC_CLASS___CSMyriadDeviceManager, "sharedInstance"));
    myriadDeviceManager = v2->_myriadDeviceManager;
    v2->_myriadDeviceManager = (CSMyriadDeviceManager *)v11;
  }

  return v2;
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011E508;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011E500;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_remoraSecondPassRequests, "objectEnumerator", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) reset];
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)setConnectedDeviceIds:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011E4F4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setRemoraAdBlocker:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011E4A8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setAdblocker:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011E45C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setDeviceIds:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      __int128 v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v7);
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10011E3F0;
        v13[3] = &unk_10022DC38;
        v13[4] = self;
        v13[5] = v8;
        dispatch_semaphore_t v14 = v9;
        uint64_t v11 = v9;
        [v10 getVoiceTriggerAssetWithEndpointId:v8 completion:v13];

        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        __int128 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }
}

- (void)_setIsSecondPassing:(BOOL)a3 forDeviceId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoraSecondPassRequests,  "objectForKeyedSubscript:",  v6));
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 setIsSecondPassRunning:v4];
      p_secondPassProgressDelegate = &self->_secondPassProgressDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);

      if (WeakRetained)
      {
        if (v4)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFirstPassRemora accessoryFirstPassGoodnessScores]( self,  "accessoryFirstPassGoodnessScores"));
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v6]);

          v13 = (os_log_s *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 136315651;
            v19 = "-[CSVoiceTriggerFirstPassRemora _setIsSecondPassing:forDeviceId:]";
            __int16 v20 = 2113;
            id v21 = v6;
            __int16 v22 = 2113;
            v23 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s First pass signal estimate for device %{private}@: %{private}@",  (uint8_t *)&v18,  0x20u);
          }

          [v12 doubleValue];
          double v15 = v14;
          id v16 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
          [v16 secondPassDidStartForClient:5 deviceId:v6 withFirstPassEstimate:v15];
        }

        else
        {
          id v17 = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
          [v17 secondPassDidStopForClient:5 deviceId:v6];
        }
      }
    }
  }
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011DAA8;
  block[3] = &unk_10022E7D0;
  double v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)_createSecondPassRequestIfNecessaryForActivationEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 activationInfo]);
  dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"firstPassGoodness"]);
  [v9 floatValue];
  float v11 = v10;

  myriadDeviceManager = self->_myriadDeviceManager;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
  -[CSMyriadDeviceManager myriadBoostScoreForAccessoryWithId:]( myriadDeviceManager,  "myriadBoostScoreForAccessoryWithId:",  v13);
  double v15 = v14;

  double v16 = v11;
  double v17 = v15 + v11;
  int v18 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
    *(_DWORD *)buf = 136316163;
    v71 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
    __int16 v72 = 2113;
    v73 = v20;
    __int16 v74 = 2049;
    double v75 = v17;
    __int16 v76 = 2049;
    double v77 = v16;
    __int16 v78 = 2049;
    double v79 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s accessory id %{private}@, ascore: %{private}f (raw=%{private}f, bump=%{private}f)",  buf,  0x34u);
  }

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_10011D958;
  v67[3] = &unk_10022DCD8;
  id v21 = v6;
  id v68 = v21;
  double v69 = v17;
  __int16 v22 = objc_retainBlock(v67);
  if (v21)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 activationInfo]);
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v21 activationInfo]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"firstPassGoodness"]);

      if (!v26)
      {
        uint64_t v56 = ((uint64_t (*)(void *))v22[2])(v22);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v56);
        remoraSecondPassRequests = self->_remoraSecondPassRequests;
        v58 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceId]);
        -[NSMutableDictionary setObject:forKey:](remoraSecondPassRequests, "setObject:forKey:", v52, v58);

        if (!v7) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
  }

  v60 = (uint64_t (**)(void))v22;
  v27 = [v21 hosttime];
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_remoraSecondPassRequests, "allKeys"));
  id v29 = [v28 countByEnumeratingWithState:&v63 objects:v82 count:16];
  if (!v29)
  {

    goto LABEL_29;
  }

  id v30 = v29;
  v61 = v21;
  v59 = v7;
  uint64_t v31 = *(void *)v64;
  char v62 = 1;
  do
  {
    for (i = 0LL; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v64 != v31) {
        objc_enumerationMutation(v28);
      }
      v33 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
      v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoraSecondPassRequests,  "objectForKeyedSubscript:",  v33,  v59));
      unsigned __int8 v35 = [v34 isCancelled];

      if ((v35 & 1) == 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoraSecondPassRequests,  "objectForKeyedSubscript:",  v33));
        v37 = [v36 timestamp];

        v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoraSecondPassRequests,  "objectForKeyedSubscript:",  v33));
        v39 = [v38 timestamp];
        int64_t v40 = v27 <= v37 ? v39 - v27 : v27 - v39;
        +[CSFTimeUtils hostTimeToTimeInterval:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToTimeInterval:", v40);
        double v42 = v41;

        if (v42 <= 0.349999994)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoraSecondPassRequests,  "objectForKeyedSubscript:",  v33));
          [v43 goodnessScore];
          double v45 = v44;

          if (v17 <= v45)
          {
            char v62 = 0;
          }

          else
          {
            v46 = (void *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              v47 = v46;
              v48 = (void *)objc_claimAutoreleasedReturnValue([v61 deviceId]);
              *(_DWORD *)buf = 136316419;
              v71 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
              __int16 v72 = 2113;
              v73 = v33;
              __int16 v74 = 2048;
              double v75 = v17;
              __int16 v76 = 2113;
              double v77 = *(double *)&v48;
              __int16 v78 = 2048;
              double v79 = v45;
              __int16 v80 = 2113;
              v81 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s Pre-Myriad is cancelling activation on device %{private}@ (activation goodness score: %f (deviceId: % {private}@), competing goodness score: %f (deviceId: %{private}@))",  buf,  0x3Eu);
            }

            v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoraSecondPassRequests,  "objectForKeyedSubscript:",  v33));
            [v49 cancelRequest];

            -[NSMutableDictionary removeObjectForKey:](self->_remoraSecondPassRequests, "removeObjectForKey:", v33);
            v50 = (os_log_s *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v71 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%s Stopping Remora adblocker because request was cancelled",  buf,  0xCu);
            }

            id WeakRetained = objc_loadWeakRetained((id *)&self->_remoraAdBlocker);
            [WeakRetained stopRemoraAdBlocker];
          }
        }
      }
    }

    id v30 = [v28 countByEnumeratingWithState:&v63 objects:v82 count:16];
  }

  while (v30);

  id v7 = v59;
  id v21 = v61;
  if ((v62 & 1) != 0)
  {
LABEL_29:
    __int16 v22 = v60;
    uint64_t v53 = v60[2](v60);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v54 = self->_remoraSecondPassRequests;
    v55 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceId]);
    -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v52, v55);

    if (!v7) {
      goto LABEL_31;
    }
LABEL_30:
    v7[2](v7, 0LL, v52);
    goto LABEL_31;
  }

  __int16 v22 = v60;
  if (v59)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  605LL,  0LL));
    ((void (**)(id, void *, void *))v59)[2](v59, v52, 0LL);
LABEL_31:
  }
}

- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8
{
  id v9 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10011D884;
  v12[3] = &unk_10022EFD0;
  id v13 = v9;
  double v14 = self;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)_handleRemoraTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  float v10 = +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:]( CSVoiceTriggerFirstPassMetrics,  "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:",  [v8 hosttime],  mach_absolute_time());
  v32 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceId]);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForRemoraVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForRemoraVoiceTriggerWithDeviceId:",  v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoraAdBlocker);
  [WeakRetained setRequestMHUUID:v12];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10011D500;
  v40[3] = &unk_10022E730;
  id v14 = v9;
  id v41 = v14;
  -[CSVoiceTriggerFirstPassRemora _requestStartAudioStreamProviderWithContext:secondPassRequest:startStreamOption:completion:]( self,  "_requestStartAudioStreamProviderWithContext:secondPassRequest:startStreamOption:completion:",  v33,  v14,  0LL,  v40);
  double v15 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = v15;
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceId]);
    *(_DWORD *)buf = 136315394;
    v43 = "-[CSVoiceTriggerFirstPassRemora _handleRemoraTriggerEvent:secondPassRequest:completion:]";
    __int16 v44 = 2112;
    double v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceId]);
  -[CSVoiceTriggerFirstPassRemora _setIsSecondPassing:forDeviceId:](self, "_setIsSecondPassing:forDeviceId:", 1LL, v18);

  objc_initWeak((id *)buf, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 secondChanceContext]);
  id v20 = [v19 shouldRunAsSecondChance];

  id v21 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceId]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 audioProvider]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 UUID]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v8 activationInfo]);
  v26 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:]( v21,  "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMe trics:rtModelRequestOptions:",  7LL,  v22,  v24,  v25,  v12,  v20,  v32,  0LL);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v14 voiceTriggerSecondPass]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10011D64C;
  v34[3] = &unk_10022DD00;
  objc_copyWeak(&v39, (id *)buf);
  id v28 = v14;
  id v35 = v28;
  id v29 = v8;
  id v36 = v29;
  id v30 = v31;
  v37 = self;
  id v38 = v30;
  [v27 handleVoiceTriggerSecondPassFrom:v26 completion:v34];

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v16 = (void (**)(id, void, id))a7;
  id v17 = [v12 result];
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 voiceTriggerEventInfo]);
  if (v17 == (id)4)
  {
    if (v16) {
      v16[2](v16, 0LL, v15);
    }
    goto LABEL_31;
  }

  v19 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
    *(_DWORD *)buf = 136316162;
    v50 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
    __int16 v51 = 1026;
    *(_DWORD *)v52 = (_DWORD)v17;
    *(_WORD *)&v52[4] = 2114;
    *(void *)&v52[6] = v18;
    __int16 v53 = 2114;
    id v54 = v14;
    __int16 v55 = 2114;
    uint64_t v56 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Second Pass Result, %{public}d, %{public}@, %{public}@, %{public}@",  buf,  0x30u);
  }

  unsigned __int8 v43 = [v13 isCancelled];
  if ((v43 & 1) != 0)
  {
    __int16 v22 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "%s VoiceTrigger Second Pass has been marked for cancellation.",  buf,  0xCu);
    }

    goto LABEL_25;
  }

  uint64_t v23 = v18;
  id v24 = v15;
  id v41 = v23;
  id v25 = [v23 mutableCopy];
  [v13 firstPassTriggerEndTime];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  double v42 = v25;
  [v25 setObject:v26 forKey:kVTEIFirstPassRemoraTriggerEndTime];

  if (v17 == (id)3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v31 = objc_opt_respondsToSelector(WeakRetained, "voiceTriggerDidDetectNearMiss:deviceId:");

    id v15 = v24;
    int v18 = v41;
    if ((v31 & 1) == 0) {
      goto LABEL_24;
    }
    id v32 = objc_loadWeakRetained((id *)&self->_delegate);
    [v32 voiceTriggerDidDetectNearMiss:v42 deviceId:v14];
LABEL_18:

    goto LABEL_24;
  }

  id v15 = v24;
  if (v17 == (id)2)
  {
    id v33 = objc_loadWeakRetained((id *)&self->_delegate);
    char v34 = objc_opt_respondsToSelector(v33, "voiceTriggerDidRejected:deviceId:");

    int v18 = v41;
    if ((v34 & 1) == 0) {
      goto LABEL_24;
    }
    id v32 = objc_loadWeakRetained((id *)&self->_delegate);
    [v32 voiceTriggerDidRejected:v42 deviceId:v14];
    goto LABEL_18;
  }

  int v18 = v41;
  if (v17 != (id)1)
  {
    id v35 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    id v32 = v35;
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
    *(_DWORD *)buf = 136315394;
    v50 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
    __int16 v51 = 2114;
    *(void *)v52 = v36;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  OS_LOG_TYPE_ERROR,  "%s VoiceTrigger Second Pass has failed : %{public}@",  buf,  0x16u);

    goto LABEL_18;
  }

  id v27 = objc_loadWeakRetained((id *)&self->_delegate);
  char location = objc_opt_respondsToSelector(v27, "voiceTriggerDidDetectKeyword:deviceId:completion:");

  id v28 = objc_loadWeakRetained((id *)&self->_delegate);
  id v29 = v28;
  if ((location & 1) != 0)
  {
    [v28 voiceTriggerDidDetectKeyword:v42 deviceId:v14 completion:0];
LABEL_23:

    goto LABEL_24;
  }

  char locationa = objc_opt_respondsToSelector(v28, "voiceTriggerDidDetectKeyword:deviceId:");

  if ((locationa & 1) != 0)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    [v29 voiceTriggerDidDetectKeyword:v42 deviceId:v14];
    goto LABEL_23;
  }

- (void)_requestStartAudioStreamProviderWithContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10011D330;
  v19[3] = &unk_10022E650;
  id v11 = a6;
  id v20 = v11;
  id v12 = objc_retainBlock(v19);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v18 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 audioProviderWithContext:v9 error:&v18]);
  id v15 = v18;

  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoraAdBlocker);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceId]);
    [WeakRetained startRemoraAdBlockerWithAudioProvider:v14 withAccessoryId:v17];

    [v10 setAudioProvider:v14];
  }

  ((void (*)(void *, BOOL, id))v12[2])(v12, v14 != 0LL, v15);
}

- (void)_cancelAudioStreamHoldingForAccessoryWithId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFirstPassRemora triggeredAudioStreamHoldingByAccessoryId]( self,  "triggeredAudioStreamHoldingByAccessoryId"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioStreamHolding]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 audioProvider]);
      if (v8 && v7)
      {
        id v9 = (os_log_s *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
        {
          int v10 = 136315395;
          id v11 = "-[CSVoiceTriggerFirstPassRemora _cancelAudioStreamHoldingForAccessoryWithId:]";
          __int16 v12 = 2113;
          id v13 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Cancelling audio stream hold for accessory: %{private}@",  (uint8_t *)&v10,  0x16u);
        }

        [v8 cancelAudioStreamHold:v7];
      }
    }
  }
}

- (void)_cancelAllAudioStreamHoldings
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_remoraSecondPassRequests, "objectEnumerator", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) cancelAudioStreamHold];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)cancelSecondPassRunning
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011D174;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011D098;
  block[3] = &unk_10022E7F8;
  id v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)remoraAdBlockerHasMatch
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011CFE0;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adBlockerHasMatchWithVoiceTrigger:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011CF10;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSSecondPassProgressDelegate)secondPassProgressDelegate
{
  return (CSSecondPassProgressDelegate *)objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
}

- (void)setSecondPassProgressDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)remoraSecondPassRequests
{
  return self->_remoraSecondPassRequests;
}

- (void)setRemoraSecondPassRequests:(id)a3
{
}

- (NSMutableDictionary)accessoryFirstPassGoodnessScores
{
  return self->_accessoryFirstPassGoodnessScores;
}

- (void)setAccessoryFirstPassGoodnessScores:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (NSMutableDictionary)triggeredAudioStreamHoldingByAccessoryId
{
  return self->_triggeredAudioStreamHoldingByAccessoryId;
}

- (void)setTriggeredAudioStreamHoldingByAccessoryId:(id)a3
{
}

- (CSAudioProvider)triggeredAudioProvider
{
  return self->_triggeredAudioProvider;
}

- (void)setTriggeredAudioProvider:(id)a3
{
}

- (CSMyriadDeviceManager)myriadDeviceManager
{
  return self->_myriadDeviceManager;
}

- (void)setMyriadDeviceManager:(id)a3
{
}

- (CSRemoraAdBlocker)remoraAdBlocker
{
  return (CSRemoraAdBlocker *)objc_loadWeakRetained((id *)&self->_remoraAdBlocker);
}

- (CSAdBlockerProviding)adblocker
{
  return (CSAdBlockerProviding *)objc_loadWeakRetained((id *)&self->_adblocker);
}

- (void).cxx_destruct
{
}

@end