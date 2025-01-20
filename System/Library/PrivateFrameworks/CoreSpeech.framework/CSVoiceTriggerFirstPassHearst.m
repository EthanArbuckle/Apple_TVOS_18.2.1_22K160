@interface CSVoiceTriggerFirstPassHearst
- (CSAsset)currentAsset;
- (CSAudioProvider)triggeredAudioProvider;
- (CSAudioStreamHolding)triggeredAudioStreamHolding;
- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor;
- (CSPhoneCallStateMonitor)phoneCallStateMonitor;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerAirPodWearerDetectionConfig)airpodWearerConfig;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerEnabledMonitor)voiceTriggerEnabledMonitor;
- (CSVoiceTriggerFirstPassHearst)init;
- (CSVoiceTriggerFirstPassHearst)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 phoneCallStateMonitor:(id)a6 otherAppRecordingStateMonitor:(id)a7;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseEnabledStatus;
- (NSArray)phrasesToSkipBoronDecisionMaking;
- (NSMutableDictionary)hearstSecondPassRequests;
- (OS_dispatch_queue)queue;
- (float)minimumPhraseLengthForVADGating;
- (float)remoteMicVADMyriadThreshold;
- (float)remoteMicVADThreshold;
- (unint64_t)phoneCallState;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)_cancelAllAudioStreamHoldings;
- (void)_handleRemoteMicVADEventWithSecondPassRequest:(id)a3;
- (void)_handleRemoteMicVoiceTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5;
- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 requestOption:(id)a6 error:(id)a7 completion:(id)a8;
- (void)_requestStartAudioStreamWitContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)reset;
- (void)setAirpodWearerConfig:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHearstSecondPassRequests:(id)a3;
- (void)setMinimumPhraseLengthForVADGating:(float)a3;
- (void)setMultiPhraseEnabledStatus:(id)a3;
- (void)setOtherAppRecordingStateMonitor:(id)a3;
- (void)setPhoneCallState:(unint64_t)a3;
- (void)setPhoneCallStateMonitor:(id)a3;
- (void)setPhrasesToSkipBoronDecisionMaking:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteMicVADMyriadThreshold:(float)a3;
- (void)setRemoteMicVADThreshold:(float)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setTriggeredAudioProvider:(id)a3;
- (void)setTriggeredAudioStreamHolding:(id)a3;
- (void)setVoiceTriggerEnabledMonitor:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassHearst

- (CSVoiceTriggerFirstPassHearst)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 phoneCallStateMonitor:(id)a6 otherAppRecordingStateMonitor:(id)a7
{
  id v47 = a3;
  id v46 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassHearst;
  v16 = -[CSVoiceTriggerFirstPassHearst init](&v50, "init");
  v17 = v16;
  if (v16)
  {
    p_speechManager = (void **)&v16->_speechManager;
    objc_storeStrong((id *)&v16->_speechManager, a3);
    if (!v17->_speechManager)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
      v20 = *p_speechManager;
      *p_speechManager = (void *)v19;
    }

    p_voiceTriggerEnabledMonitor = (void **)&v17->_voiceTriggerEnabledMonitor;
    objc_storeStrong((id *)&v17->_voiceTriggerEnabledMonitor, a4);
    if (!v17->_voiceTriggerEnabledMonitor)
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
      v23 = *p_voiceTriggerEnabledMonitor;
      *p_voiceTriggerEnabledMonitor = (void *)v22;
    }

    p_siriClientBehaviorMonitor = (void **)&v17->_siriClientBehaviorMonitor;
    objc_storeStrong((id *)&v17->_siriClientBehaviorMonitor, a5);
    if (!v17->_siriClientBehaviorMonitor)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[CSSiriClientBehaviorMonitor sharedInstance](&OBJC_CLASS___CSSiriClientBehaviorMonitor, "sharedInstance"));
      v26 = *p_siriClientBehaviorMonitor;
      *p_siriClientBehaviorMonitor = (void *)v25;
    }

    dispatch_queue_t v27 = dispatch_queue_create("VoiceTriggerFirstPassHearst Queue", 0LL);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v27;

    v29 = (dispatch_object_s *)v17->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v29, v31);

    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    hearstSecondPassRequests = v17->_hearstSecondPassRequests;
    v17->_hearstSecondPassRequests = (NSMutableDictionary *)v32;

    p_phoneCallStateMonitor = (void **)&v17->_phoneCallStateMonitor;
    objc_storeStrong((id *)&v17->_phoneCallStateMonitor, a6);
    phoneCallStateMonitor = v17->_phoneCallStateMonitor;
    if (!phoneCallStateMonitor)
    {
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
      v37 = *p_phoneCallStateMonitor;
      *p_phoneCallStateMonitor = (void *)v36;

      phoneCallStateMonitor = *p_phoneCallStateMonitor;
    }

    [phoneCallStateMonitor addObserver:v17];
    v38 = (dispatch_queue_s *)v17->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E8DB4;
    block[3] = &unk_10022F100;
    v39 = v17;
    v49 = v39;
    dispatch_async(v38, block);
    p_otherAppRecordingStateMonitor = (void **)&v39->_otherAppRecordingStateMonitor;
    objc_storeStrong((id *)&v39->_otherAppRecordingStateMonitor, a7);
    if (!v39->_otherAppRecordingStateMonitor)
    {
      uint64_t v41 = objc_claimAutoreleasedReturnValue( +[CSOtherAppRecordingStateMonitor sharedInstance]( &OBJC_CLASS___CSOtherAppRecordingStateMonitor,  "sharedInstance"));
      v42 = *p_otherAppRecordingStateMonitor;
      *p_otherAppRecordingStateMonitor = (void *)v41;
    }

    v43 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerUserSelectedPhrase),  "initWithEndpointId:",  0LL);
    multiPhraseEnabledStatus = v39->_multiPhraseEnabledStatus;
    v39->_multiPhraseEnabledStatus = v43;
  }

  return v17;
}

- (CSVoiceTriggerFirstPassHearst)init
{
  return -[CSVoiceTriggerFirstPassHearst initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:phoneCallStateMonitor:otherAppRecordingStateMonitor:]( self,  "initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:phoneCallStateMonitor:otherAppReco rdingStateMonitor:",  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8D00;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8CF8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_hearstSecondPassRequests, "objectEnumerator", 0LL));
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

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E8CEC;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    [v5 logAssetVersionForInsight];
    objc_storeStrong((id *)&self->_currentAsset, a3);
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:]( &OBJC_CLASS___CSVoiceTriggerSecondPassConfigDecoder,  "decodeConfigFrom:forFirstPassSource:",  self->_currentAsset,  3LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 wearerDetectionConfig]);
    [v8 threshold];
    self->_remoteMicVADThreshold = v9;

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 wearerDetectionConfig]);
    [v10 myriadThreshold];
    self->_remoteMicVADMyriadThreshold = v11;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 wearerDetectionConfig]);
    [v12 minimumPhraseLength];
    self->_minimumPhraseLengthForVADGating = v13;

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 wearerDetectionConfig]);
    id v15 = (NSArray *)objc_claimAutoreleasedReturnValue([v14 phrasesToSkipBoronDecisionMaking]);
    phrasesToSkipBoronDecisionMaking = self->_phrasesToSkipBoronDecisionMaking;
    self->_phrasesToSkipBoronDecisionMaking = v15;

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_hearstSecondPassRequests, "objectEnumerator", 0LL));
    id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)i) setAsset:v6];
        }

        id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v19);
    }

    -[CSVoiceTriggerFirstPassHearst _reset](self, "_reset");
  }

  else
  {
    uint64_t v22 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CSVoiceTriggerFirstPassHearst _setAsset:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s asset is nil, stop initialization",  buf,  0xCu);
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
  block[2] = sub_1000E83D8;
  block[3] = &unk_10022E7D0;
  id v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E83D0;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8320;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleRemoteMicVADEventWithSecondPassRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    [v4 remoteMicVADScore];
    double remoteMicVADThreshold = self->_remoteMicVADThreshold;
    double remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    int v17 = 136315906;
    id v18 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVADEventWithSecondPassRequest:]";
    __int16 v19 = 2050;
    double v20 = v9;
    __int16 v21 = 2050;
    double v22 = remoteMicVADThreshold;
    __int16 v23 = 2050;
    double v24 = remoteMicVADMyriadThreshold;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Handle Remote Mic VAD Event : remoteMicVADScore is %{public}f, remoteMicVADThreshold is %{public}f, remoteMicVA DMyriadThreshold is %{public}f",  (uint8_t *)&v17,  0x2Au);
  }

  [v4 remoteMicVADScore];
  if (v10 >= self->_remoteMicVADMyriadThreshold) {
    +[CSMyriadNotifier notifyInEarMyriadTrigger](&OBJC_CLASS___CSMyriadNotifier, "notifyInEarMyriadTrigger");
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v12 = [v11 shouldOverwriteRemoteVADScore];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    [v13 overwritingRemoteVADScore];
    objc_msgSend(v4, "setRemoteMicVADScore:");

    id v14 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      [v4 remoteMicVADScore];
      int v17 = 136315394;
      id v18 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVADEventWithSecondPassRequest:]";
      __int16 v19 = 2050;
      double v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Remote VAD Score overwritten to %{public}f",  (uint8_t *)&v17,  0x16u);
    }
  }
}

- (void)_handleRemoteMicVoiceTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  float v9 = +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:]( CSVoiceTriggerFirstPassMetrics,  "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:",  [v7 hosttime],  mach_absolute_time());
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v9);
  float v10 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceId]);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForHearstVoiceTriggerWithDeviceId:",  v10));

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000E7D64;
  v48[3] = &unk_10022EFF8;
  v48[4] = self;
  id v11 = v8;
  id v49 = v11;
  -[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:",  v37,  v11,  0LL,  v48);
  unsigned int v12 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceId]);
    *(_DWORD *)buf = 136315394;
    v51 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:]";
    __int16 v52 = 2112;
    v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  [v11 setIsSecondPassRunning:1];
  objc_initWeak((id *)buf, self);
  id v15 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000E7EAC;
  v46[3] = &unk_10022D0F0;
  v46[4] = self;
  id v16 = v7;
  id v47 = v16;
  int v17 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](v15, "initWithMutableBuilder:", v46);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 secondChanceContext]);
  id v19 = [v18 shouldRunAsSecondChance];

  double v20 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceId]);
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v11 audioProvider]);
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUID]);
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v16 activationInfo]);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  __int128 v26 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:]( v20,  "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMe trics:rtModelRequestOptions:",  3LL,  v21,  v23,  v24,  v25,  v19,  v36,  v17);

  if (-[CSVoiceTriggerRTModelRequestOptions allowMph](v17, "allowMph"))
  {
    dispatch_queue_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptions accessoryInfo](v17, "accessoryInfo"));
    id v28 = [v27 supportsJustSiri];
  }

  else
  {
    id v28 = 0LL;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v11 voiceTriggerSecondPass]);
  [v29 setSupportsMultiPhraseDetection:v28];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v11 voiceTriggerSecondPass]);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000E802C;
  v39[3] = &unk_10022D118;
  objc_copyWeak(&v45, (id *)buf);
  id v31 = v11;
  id v40 = v31;
  id v32 = v16;
  id v41 = v32;
  v33 = v26;
  v42 = v33;
  id v34 = v35;
  v43 = self;
  id v44 = v34;
  [v30 handleVoiceTriggerSecondPassFrom:v33 completion:v39];

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 requestOption:(id)a6 error:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void, id))a8;
  id v20 = [v14 result];
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 voiceTriggerEventInfo]);
  uint64_t v86 = (uint64_t)v20;
  if (v20 == (id)4)
  {
    if (v19) {
      v19[2](v19, 0LL, v18);
    }
    goto LABEL_49;
  }

  v84 = v19;
  double v22 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = v22;
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
    *(_DWORD *)buf = 136316162;
    v100 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
    __int16 v101 = 1026;
    *(_DWORD *)v102 = v86;
    *(_WORD *)&v102[4] = 2114;
    *(void *)&v102[6] = v21;
    *(_WORD *)&v102[14] = 2114;
    *(void *)&v102[16] = v16;
    *(_WORD *)&v102[24] = 2114;
    *(void *)&v102[26] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s Second Pass Result, %{public}d, %{public}@, %{public}@, %{public}@",  buf,  0x30u);
  }

  v85 = v18;
  if (v21)
  {
    uint64_t v25 = kVTEITriggeredPh;
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kVTEITriggeredPh]);

    if (v26)
    {
      id v82 = v17;
      id v83 = v16;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      dispatch_queue_t v27 = self->_phrasesToSkipBoronDecisionMaking;
      id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v95,  v107,  16LL);
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v96;
        id v81 = v15;
        while (2)
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v96 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v25, v81));
            LODWORD(v32) = [v32 isEqualToString:v33];

            if ((_DWORD)v32)
            {
              v59 = (void *)CSLogCategoryVT;
              if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
              {
                v60 = v59;
                v61 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v25]);
                *(_DWORD *)buf = 136315394;
                v100 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:"
                       "error:completion:]";
                __int16 v101 = 2112;
                *(void *)v102 = v61;
                _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring boron based decision making as triggered phrase %@",  buf,  0x16u);
              }

              id v15 = v81;
              id v17 = v82;
              id v16 = v83;
              goto LABEL_31;
            }
          }

          id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v95,  v107,  16LL);
          id v15 = v81;
          if (v29) {
            continue;
          }
          break;
        }
      }

      id v17 = v82;
      id v16 = v83;
    }
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kVTEItriggerEndSeconds]);
  [v34 floatValue];
  float v36 = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kVTEIShadowMicScoreThresholdForVAD]);
  [v37 doubleValue];
  uint64_t v39 = v38;

  id v40 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kVTEIShadowMicScore]);
  [v40 doubleValue];
  uint64_t v42 = v41;

  v43 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v44 = v43;
    [v15 remoteMicVADScore];
    double remoteMicVADThreshold = self->_remoteMicVADThreshold;
    double minimumPhraseLengthForVADGating = self->_minimumPhraseLengthForVADGating;
    *(_DWORD *)buf = 136316674;
    v100 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
    __int16 v101 = 2050;
    *(double *)v102 = v47;
    *(_WORD *)&v102[8] = 2050;
    *(double *)&v102[10] = remoteMicVADThreshold;
    *(_WORD *)&v102[18] = 2050;
    *(double *)&v102[20] = v36;
    *(_WORD *)&v102[28] = 2050;
    *(double *)&v102[30] = minimumPhraseLengthForVADGating;
    __int16 v103 = 2050;
    uint64_t v104 = v42;
    __int16 v105 = 2050;
    uint64_t v106 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s remoteMicVADScore : %{public}f, remoteMicVADThreshold : %{public}f, triggerEndSeconds : %{public}f, minPhraseLe ngth : %{public}f shadowMicScore: %{public}f shadowMicScoreThreshold: %{public}f",  buf,  0x48u);
  }

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_1000E7B08;
  v91[3] = &unk_10022D180;
  uint64_t v93 = v39;
  uint64_t v94 = v42;
  v92 = &stru_10022D158;
  v48 = objc_retainBlock(v91);
  id v49 = (void *)objc_claimAutoreleasedReturnValue([v17 rtModelRequestOptions]);
  objc_super v50 = (void *)objc_claimAutoreleasedReturnValue([v49 accessoryInfo]);
  unsigned int v51 = [v50 supportsAlwaysOnAccelerometer];

  id v52 = [v15 remoteMicVADScore];
  if (v51)
  {
    if (!sub_1000E7C24(v52, v53, self->_remoteMicVADThreshold)) {
      goto LABEL_27;
    }
  }

  else if (!((unsigned int (*)(void *))v48[2])(v48))
  {
    goto LABEL_27;
  }

  if (v86 == 1)
  {
    v54 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v54;
      [v15 remoteMicVADScore];
      double v56 = self->_remoteMicVADThreshold;
      double v57 = self->_minimumPhraseLengthForVADGating;
      *(_DWORD *)buf = 136316162;
      v100 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
      __int16 v101 = 2050;
      *(double *)v102 = v58;
      *(_WORD *)&v102[8] = 2050;
      *(double *)&v102[10] = v56;
      *(_WORD *)&v102[18] = 2050;
      *(double *)&v102[20] = v36;
      *(_WORD *)&v102[28] = 2050;
      *(double *)&v102[30] = v57;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s Trigger is rejected since remoteMicVADScore is %{public}f, remoteMicVADThreshold is %{public}f, triggerEndSec onds is %{public}f, minPhraseLength is %{public}f",  buf,  0x34u);
    }

    uint64_t v86 = 9LL;
  }

- (void)_requestStartAudioStreamWitContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v9 = a4;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000E7AF4;
  v31[3] = &unk_10022E650;
  id v10 = a6;
  id v32 = v10;
  id v11 = a3;
  unsigned int v12 = objc_retainBlock(v31);
  speechManager = self->_speechManager;
  id v30 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager audioProviderWithContext:error:]( speechManager,  "audioProviderWithContext:error:",  v11,  &v30));

  id v15 = v30;
  if (v14)
  {
    [v9 setAudioProvider:v14];
    id v16 = objc_alloc_init(&OBJC_CLASS___CSAudioStreamRequest);
    -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v16, "setRequiresHistoricalBuffer:", 1LL);
    id v18 = (objc_class *)objc_opt_class(v16, v17);
    id v19 = NSStringFromClass(v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v29 = 0LL;
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 audioStreamWithRequest:v16 streamName:v20 error:&v29]);
    id v22 = v29;

    if (!v21)
    {
      __int16 v23 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v27 = v23;
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        id v34 = "-[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]";
        __int16 v35 = 2114;
        float v36 = v28;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to get audio stream : %{public}@",  buf,  0x16u);
      }
    }

    ((void (*)(void *, BOOL, id))v12[2])(v12, v21 != 0LL, v22);
  }

  else
  {
    double v24 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v24;
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      id v34 = "-[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]";
      __int16 v35 = 2114;
      float v36 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Getting audio stream provider has failed : %{public}@",  buf,  0x16u);
    }

    ((void (*)(void *, void, id))v12[2])(v12, 0LL, v15);
  }
}

- (void)_cancelAllAudioStreamHoldings
{
  if (self->_triggeredAudioStreamHolding)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearst triggeredAudioProvider](self, "triggeredAudioProvider"));
    [v3 cancelAudioStreamHold:self->_triggeredAudioStreamHolding];

    triggeredAudioStreamHolding = self->_triggeredAudioStreamHolding;
    self->_triggeredAudioStreamHolding = 0LL;

    triggeredAudioProvider = self->_triggeredAudioProvider;
    self->_triggeredAudioProvider = 0LL;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_hearstSecondPassRequests, "objectEnumerator", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) cancelAudioStreamHold];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)hearstSecondPassRequests
{
  return self->_hearstSecondPassRequests;
}

- (void)setHearstSecondPassRequests:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSVoiceTriggerAirPodWearerDetectionConfig)airpodWearerConfig
{
  return self->_airpodWearerConfig;
}

- (void)setAirpodWearerConfig:(id)a3
{
}

- (float)remoteMicVADThreshold
{
  return self->_remoteMicVADThreshold;
}

- (void)setRemoteMicVADThreshold:(float)a3
{
  self->_double remoteMicVADThreshold = a3;
}

- (float)remoteMicVADMyriadThreshold
{
  return self->_remoteMicVADMyriadThreshold;
}

- (void)setRemoteMicVADMyriadThreshold:(float)a3
{
  self->_double remoteMicVADMyriadThreshold = a3;
}

- (float)minimumPhraseLengthForVADGating
{
  return self->_minimumPhraseLengthForVADGating;
}

- (void)setMinimumPhraseLengthForVADGating:(float)a3
{
  self->_double minimumPhraseLengthForVADGating = a3;
}

- (NSArray)phrasesToSkipBoronDecisionMaking
{
  return self->_phrasesToSkipBoronDecisionMaking;
}

- (void)setPhrasesToSkipBoronDecisionMaking:(id)a3
{
}

- (CSAudioStreamHolding)triggeredAudioStreamHolding
{
  return self->_triggeredAudioStreamHolding;
}

- (void)setTriggeredAudioStreamHolding:(id)a3
{
}

- (CSAudioProvider)triggeredAudioProvider
{
  return self->_triggeredAudioProvider;
}

- (void)setTriggeredAudioProvider:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSPhoneCallStateMonitor)phoneCallStateMonitor
{
  return self->_phoneCallStateMonitor;
}

- (void)setPhoneCallStateMonitor:(id)a3
{
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_phoneCallState = a3;
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSVoiceTriggerEnabledMonitor)voiceTriggerEnabledMonitor
{
  return self->_voiceTriggerEnabledMonitor;
}

- (void)setVoiceTriggerEnabledMonitor:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseEnabledStatus
{
  return self->_multiPhraseEnabledStatus;
}

- (void)setMultiPhraseEnabledStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end