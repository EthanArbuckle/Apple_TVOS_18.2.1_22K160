@interface CSAttSiriContConvController
+ (BOOL)_isAttentionNodeAvailable;
- (BOOL)_shouldConfigureAudioForContinuousConversation;
- (BOOL)_shouldDisableCCForAudioRecordType:(int64_t)a3;
- (BOOL)_useAttendingTimeoutInAsset:(float)a3;
- (BOOL)isAttending;
- (BOOL)isInAttendingState;
- (BOOL)shouldRunCCForAudioRecordContext:(id)a3;
- (BOOL)useGazeSignal;
- (CSAttSiriAttentionNode)attentionNode;
- (CSAttSiriContConvController)initWithAttSiriController:(id)a3;
- (CSAttSiriContConvController)initWithAttSiriController:(id)a3 supportAttentionLostAndGain:(BOOL)a4;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMagusLoggingNode)magusLoggingNode;
- (CSAttSiriMotionNode)motionNode;
- (CSAttSiriNode)gazeNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriTimer)attendingPendingStateTimer;
- (CSAttSiriTimer)attendingTimer;
- (CSAttSiriTimer)clientPendingTimer;
- (CSAudioRecordContext)audioRecordContext;
- (NSMutableDictionary)nodesCache;
- (NSString)prevStoppedMhId;
- (NSString)requestMHUUID;
- (OS_dispatch_queue)queue;
- (float)attendingTimeoutInSecs;
- (void)_applyGazeSignalMandate;
- (void)_configureAttendingTimeout;
- (void)_setupAttendingTimer;
- (void)_setupClientPendingTimer;
- (void)_setupGazeNodeWithAttSiriController:(id)a3;
- (void)_startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5;
- (void)_stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5;
- (void)_stopNodes;
- (void)_stopTimers;
- (void)attSiriNode:(id)a3 startSpeechProcessing:(unint64_t)a4;
- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)handleAttendingTimeout;
- (void)relayGazeEstimates:(CGPoint)a3 landmarks:(id)a4;
- (void)setAttSiriController:(id)a3;
- (void)setAttendingPendingStateTimer:(id)a3;
- (void)setAttendingTimeoutInSecs:(float)a3;
- (void)setAttendingTimer:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setClientPendingTimer:(id)a3;
- (void)setGazeNode:(id)a3;
- (void)setIsAttending:(BOOL)a3;
- (void)setMagusLoggingNode:(id)a3;
- (void)setMotionNode:(id)a3;
- (void)setNodesCache:(id)a3;
- (void)setPrevStoppedMhId:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setUseGazeSignal:(BOOL)a3;
- (void)startAttendingWithAudioRecordContext:(id)a3 attendingSiriRequestContext:(id)a4 withRequestId:(id)a5 shouldStartTimer:(BOOL)a6;
- (void)startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5;
- (void)startMagusLoggingForTriggerRequest;
- (void)stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5;
- (void)updateSiriOrbLocation:(CGRect)a3;
@end

@implementation CSAttSiriContConvController

- (CSAttSiriContConvController)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]( self,  "initWithAttSiriController:supportAttentionLostAndGain:",  v4,  +[CSAttSiriAttentionNode supportAttentionLostAndGain]( &OBJC_CLASS___CSAttSiriAttentionNode,  "supportAttentionLostAndGain"));

  return v5;
}

- (CSAttSiriContConvController)initWithAttSiriController:(id)a3 supportAttentionLostAndGain:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___CSAttSiriContConvController;
  v8 = -[CSAttSiriContConvController init](&v45, "init");
  v9 = v8;
  if (!v8)
  {
LABEL_27:
    v40 = v9;
    goto LABEL_28;
  }

  objc_storeStrong((id *)&v8->_attSiriController, a3);
  dispatch_queue_t v10 = dispatch_queue_create("AttSiriCCController queue", 0LL);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v10;

  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  nodesCache = v9->_nodesCache;
  v9->_nodesCache = (NSMutableDictionary *)v12;

  if (CSIsIOS(v14, v15))
  {
    -[CSAttSiriContConvController _applyGazeSignalMandate](v9, "_applyGazeSignalMandate");
    if (v4)
    {
      v16 = -[CSAttSiriAttentionNode initWithAttSiriController:]( objc_alloc(&OBJC_CLASS___CSAttSiriAttentionNode),  "initWithAttSiriController:",  v9->_attSiriController);
      attentionNode = v9->_attentionNode;
      v9->_attentionNode = v16;

      v18 = v9->_attentionNode;
      if (v18)
      {
        -[NSMutableDictionary setObject:forKey:](v9->_nodesCache, "setObject:forKey:", v18, &off_100238688);
      }

      else
      {
        v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v47 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s _attentionNode is nil!",  buf,  0xCu);
        }
      }
    }
  }

  v20 = objc_alloc_init(&OBJC_CLASS___CSAttSiriOSDNode);
  osdNode = v9->_osdNode;
  v9->_osdNode = v20;

  v22 = v9->_osdNode;
  if (v22)
  {
    -[NSMutableDictionary setObject:forKey:](v9->_nodesCache, "setObject:forKey:", v22, &off_1002386A0);
    v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v9->_osdNode;
      *(_DWORD *)buf = 136315394;
      v47 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
      __int16 v48 = 2112;
      v49 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s _osdNode:%@", buf, 0x16u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned __int8 v26 = [v25 isAttentiveSiriAudioLoggingEnabled];

    if ((v26 & 1) != 0)
    {
      v27 = -[CSAttSiriMagusLoggingNode initWithAttSiriController:]( objc_alloc(&OBJC_CLASS___CSAttSiriMagusLoggingNode),  "initWithAttSiriController:",  v9->_attSiriController);
      magusLoggingNode = v9->_magusLoggingNode;
      v9->_magusLoggingNode = v27;

      v29 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      id v30 = (id)os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v30)
      {
        v32 = v9->_magusLoggingNode;
        *(_DWORD *)buf = 136315394;
        v47 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
        __int16 v48 = 2112;
        v49 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Created _magusLoggingNode:%@",  buf,  0x16u);
      }

      v33 = v9->_magusLoggingNode;
      if (v33) {
        id v30 = -[NSMutableDictionary setObject:forKey:](v9->_nodesCache, "setObject:forKey:", v33, &off_1002386B8);
      }
      if (CSIsIOS(v30, v31))
      {
        v34 = -[CSAttSiriMotionNode initWithAttSiriController:]( objc_alloc(&OBJC_CLASS___CSAttSiriMotionNode),  "initWithAttSiriController:",  v9->_attSiriController);
        motionNode = v9->_motionNode;
        v9->_motionNode = v34;

        v36 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v9->_motionNode;
          *(_DWORD *)buf = 136315394;
          v47 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
          __int16 v48 = 2112;
          v49 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Created _motionNode:%@", buf, 0x16u);
        }

        v38 = v9->_motionNode;
        if (v38) {
          -[NSMutableDictionary setObject:forKey:](v9->_nodesCache, "setObject:forKey:", v38, &off_1002386D0);
        }
      }
    }

    else
    {
      v41 = v9->_magusLoggingNode;
      v9->_magusLoggingNode = 0LL;

      v42 = v9->_motionNode;
      v9->_motionNode = 0LL;
    }

    v9->_isAttending = 0;
    -[CSAttSiriContConvController _configureAttendingTimeout](v9, "_configureAttendingTimeout");
    v43 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s Created AttSiriCCController", buf, 0xCu);
    }

    goto LABEL_27;
  }

  v39 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s _osdNode is nil! Initialization failed!",  buf,  0xCu);
  }

  v40 = 0LL;
LABEL_28:

  return v40;
}

- (BOOL)isInAttendingState
{
  return self->_isAttending;
}

- (void)_setupGazeNodeWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[CSAttSiriContConvController _setupGazeNodeWithAttSiriController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }

  v6 = -[CSAttSiriIOSGazeNode initWithAttSiriController:]( objc_alloc(&OBJC_CLASS___CSAttSiriIOSGazeNode),  "initWithAttSiriController:",  v4);
  gazeNode = self->_gazeNode;
  self->_gazeNode = (CSAttSiriNode *)v6;

  v8 = self->_gazeNode;
  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->_nodesCache, "setObject:forKey:", v8, &off_1002386E8);
  }

  else
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[CSAttSiriContConvController _setupGazeNodeWithAttSiriController:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Gaze Node is nil!", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)shouldRunCCForAudioRecordContext:(id)a3
{
  if (-[CSAttSiriContConvController _shouldDisableCCForAudioRecordType:]( self,  "_shouldDisableCCForAudioRecordType:",  [a3 type]))
  {
    return 0;
  }

  else
  {
    return -[CSAttSiriContConvController _shouldConfigureAudioForContinuousConversation]( self,  "_shouldConfigureAudioForContinuousConversation");
  }

- (void)startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5
{
}

- (void)startAttendingWithAudioRecordContext:(id)a3 attendingSiriRequestContext:(id)a4 withRequestId:(id)a5 shouldStartTimer:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100060FE4;
  v14[3] = &unk_10022DB78;
  BOOL v18 = a6;
  id v15 = v10;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060F00;
  block[3] = &unk_10022D848;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)startMagusLoggingForTriggerRequest
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060EF4;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 startSpeechProcessing:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100060EE8;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_gazeNode)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100060E7C;
    block[3] = &unk_10022E7F8;
    void block[4] = self;
    id v11 = v6;
    unint64_t v12 = a4;
    dispatch_async(queue, block);
  }

  else
  {
    id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v14 = "-[CSAttSiriContConvController gazeTrackerFaceTrackingMetaDataUpdate:atMachAbsTime:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s gazeNode is nil!", buf, 0xCu);
    }
  }
}

- (void)relayGazeEstimates:(CGPoint)a3 landmarks:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  id v8 = v7;
  if (self->_gazeNode)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100060E10;
    v11[3] = &unk_10022C3E8;
    v11[4] = self;
    CGFloat v13 = x;
    CGFloat v14 = y;
    id v12 = v7;
    dispatch_async(queue, v11);
  }

  else
  {
    id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSAttSiriContConvController relayGazeEstimates:landmarks:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s gazeNode is nil!", buf, 0xCu);
    }
  }
}

- (void)updateSiriOrbLocation:(CGRect)a3
{
  if (self->_gazeNode)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100060DA0;
    block[3] = &unk_10022B588;
    void block[4] = self;
    CGRect v6 = a3;
    dispatch_async(queue, block);
  }

  else
  {
    id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CSAttSiriContConvController updateSiriOrbLocation:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s gazeNode is nil!", buf, 0xCu);
    }
  }

- (void)_startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAttending = self->_isAttending;
    requestMHUUID = self->_requestMHUUID;
    *(_DWORD *)buf = 136316162;
    uint64_t v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
    __int16 v32 = 1024;
    *(_DWORD *)v33 = isAttending;
    *(_WORD *)&v33[4] = 2112;
    *(void *)&v33[6] = requestMHUUID;
    *(_WORD *)&v33[14] = 2112;
    *(void *)&v33[16] = v10;
    __int16 v34 = 1024;
    BOOL v35 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s _isAttending:%u _requestMHUUID:%@ mhId:%@ startTimer:%u",  buf,  0x2Cu);
    id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double attendingTimeoutInSecs = self->_attendingTimeoutInSecs;
    *(_DWORD *)buf = 136315650;
    uint64_t v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
    __int16 v32 = 2048;
    *(double *)v33 = attendingTimeoutInSecs;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = 0x3FF0000000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s _attendingTimeoutInSecs:%f kCSAttSiriAttendingTimeoutMinVal:%f",  buf,  0x20u);
  }

  if (!self->_isAttending)
  {
    if (self->_prevStoppedMhId
      && objc_msgSend(v10, "isEqualToString:")
      && !-[CSAttSiriController getPendingActivationStatus](self->_attSiriController, "getPendingActivationStatus"))
    {
      unsigned __int8 v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
      __int16 v32 = 2112;
      *(void *)v33 = v10;
      BOOL v18 = "%s Ignoring attending start request for previously stopped MHId:%@";
    }

    else
    {
      objc_storeStrong((id *)&self->_audioRecordContext, a3);
      p_requestMHUUID = &self->_requestMHUUID;
      objc_storeStrong((id *)&self->_requestMHUUID, a4);
      -[CSAttSiriMagusLoggingNode setMhId:](self->_magusLoggingNode, "setMhId:", v10);
      -[CSAttSiriMagusLoggingNode setAudioRecordContext:]( self->_magusLoggingNode,  "setAudioRecordContext:",  self->_audioRecordContext);
      -[CSAttSiriMagusLoggingNode stop](self->_magusLoggingNode, "stop");
      -[CSAttSiriOSDNode resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:osdMode:]( self->_osdNode,  "resetForNewRequestWithRecordContext:endpointerSettings:voiceTriggerInfo:osdMode:",  self->_audioRecordContext,  0LL,  0LL,  1LL);
      -[CSAttSiriNode start](self->_gazeNode, "start");
      -[CSAttSiriAttentionNode start](self->_attentionNode, "start");
      -[CSAttSiriMotionNode start](self->_motionNode, "start");
      -[CSAttSiriMagusLoggingNode start](self->_magusLoggingNode, "start");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      char v23 = [v22 isGazeSimlModelEnabled] ^ 1;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController attSiriSvcListener](self->_attSiriController, "attSiriSvcListener"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100060CC0;
      v28[3] = &unk_10022EB30;
      char v29 = v23;
      v28[4] = self;
      [v24 notifyClientsWithBlock:v28];

      self->_BOOL isAttending = 1;
      if (v5) {
        -[CSAttSiriContConvController _setupAttendingTimer](self, "_setupAttendingTimer");
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSAttSiriStateMonitor sharedInstance](&OBJC_CLASS___CSAttSiriStateMonitor, "sharedInstance"));
      [v25 updateState:1];

      unsigned __int8 v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v27 = *p_requestMHUUID;
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
      __int16 v32 = 2112;
      *(void *)v33 = v27;
      BOOL v18 = "%s Started attending for request Id: %@";
    }

    v19 = v26;
    uint32_t v20 = 22;
    goto LABEL_20;
  }

  if (v5)
  {
    if (-[NSString isEqualToString:](self->_requestMHUUID, "isEqualToString:", v10))
    {
      -[CSAttSiriContConvController _setupAttendingTimer](self, "_setupAttendingTimer");
      BOOL v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Start/Restart attending timer",  buf,  0xCu);
      }
    }
  }

  id v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_requestMHUUID;
    *(_DWORD *)buf = 136315650;
    uint64_t v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
    __int16 v32 = 2112;
    *(void *)v33 = v17;
    *(_WORD *)&v33[8] = 2112;
    *(void *)&v33[10] = v10;
    BOOL v18 = "%s Already attending with id: %@, ignore new start attending request for id: %@";
    v19 = v16;
    uint32_t v20 = 32;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
  }

- (void)_stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    id v12 = "-[CSAttSiriContConvController _stopAttendingForRequestId:isReqCC:forceStop:]";
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s mhId:%@ isReqCC:%u forceStop:%u",  (uint8_t *)&v11,  0x22u);
  }

  objc_storeStrong((id *)&self->_prevStoppedMhId, a3);
  -[CSAttSiriContConvController _stopTimers](self, "_stopTimers");
  if (!v6) {
    -[CSAttSiriContConvController _stopNodes](self, "_stopNodes");
  }
  if (v5)
  {
    -[CSAttSiriOSDNode stop](self->_osdNode, "stop");
    -[CSAttSiriController handleEndOfAttendingForRequestId:]( self->_attSiriController,  "handleEndOfAttendingForRequestId:",  self->_requestMHUUID);
  }
}

- (void)_stopTimers
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSAttSiriContConvController _stopTimers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }

  -[CSAttSiriTimer cancelTimer](self->_attendingTimer, "cancelTimer");
  -[CSAttSiriTimer cancelTimer](self->_clientPendingTimer, "cancelTimer");
  attendingTimer = self->_attendingTimer;
  self->_attendingTimer = 0LL;

  clientPendingTimer = self->_clientPendingTimer;
  self->_clientPendingTimer = 0LL;

  audioRecordContext = self->_audioRecordContext;
  self->_audioRecordContext = 0LL;

  requestMHUUID = self->_requestMHUUID;
  self->_requestMHUUID = 0LL;

  self->_BOOL isAttending = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSAttSiriStateMonitor sharedInstance](&OBJC_CLASS___CSAttSiriStateMonitor, "sharedInstance"));
  [v8 updateState:0];
}

- (void)_stopNodes
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[CSAttSiriContConvController _stopNodes]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[CSAttSiriMagusLoggingNode stop](self->_magusLoggingNode, "stop");
  -[CSAttSiriNode stop](self->_gazeNode, "stop");
  -[CSAttSiriAttentionNode stop](self->_attentionNode, "stop");
  -[CSAttSiriMotionNode stop](self->_motionNode, "stop");
}

- (void)_setupClientPendingTimer
{
  clientPendingTimer = self->_clientPendingTimer;
  if (clientPendingTimer)
  {
    -[CSAttSiriTimer cancelTimer](clientPendingTimer, "cancelTimer");
    int v4 = self->_clientPendingTimer;
    self->_clientPendingTimer = 0LL;
  }

  BOOL v5 = -[CSAttSiriTimer initWithQueue:](objc_alloc(&OBJC_CLASS___CSAttSiriTimer), "initWithQueue:", 0LL);
  BOOL v6 = self->_clientPendingTimer;
  self->_clientPendingTimer = v5;

  objc_initWeak(&location, self);
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v13 = "-[CSAttSiriContConvController _setupClientPendingTimer]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Setup client pending timer", buf, 0xCu);
  }

  id v8 = self->_clientPendingTimer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100060C04;
  v9[3] = &unk_10022E920;
  objc_copyWeak(&v10, &location);
  -[CSAttSiriTimer setTimerForSecs:completionBlock:](v8, "setTimerForSecs:completionBlock:", v9, 10.0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldDisableCCForAudioRecordType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x14) & (0xFF18Du >> a3);
}

- (BOOL)_shouldConfigureAudioForContinuousConversation
{
  unsigned int v2 = +[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  unsigned int v4 = [v3 carPlayConnected];

  unsigned int v5 = +[CSUtils isBluetoothAudioDeviceConnected]( &OBJC_CLASS___CSUtils,  "isBluetoothAudioDeviceConnected");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  id v7 = [v6 hearstRouteStatus];

  if (v7) {
    BOOL v8 = v7 == (id)5;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  int v10 = v5 ^ 1 | v9;
  if ((v4 & 1) != 0) {
    int v10 = 0;
  }
  if (v2) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316418;
    __int16 v15 = "-[CSAttSiriContConvController _shouldConfigureAudioForContinuousConversation]";
    __int16 v16 = 1024;
    BOOL v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v2;
    __int16 v20 = 1024;
    unsigned int v21 = v4;
    __int16 v22 = 1024;
    unsigned int v23 = v5;
    __int16 v24 = 1024;
    int v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s ccSupported:%u --> isCCConfigEnabled:%u isCarplayConnected:%u isBluetoothDeviceConnected:%u isHearstConnected:%u",  (uint8_t *)&v14,  0x2Au);
  }

  return v11;
}

- (void)_applyGazeSignalMandate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100060A18;
  v4[3] = &unk_10022B5B0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 getMitigationAssetWithEndpointId:0 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_useAttendingTimeoutInAsset:(float)a3
{
  return fabsf(a3) < 0.0000001;
}

- (void)_configureAttendingTimeout
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  [v3 getAttendingTimeoutConfig];
  self->_double attendingTimeoutInSecs = v4;

  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double attendingTimeoutInSecs = self->_attendingTimeoutInSecs;
    *(_DWORD *)buf = 136315394;
    BOOL v11 = "-[CSAttSiriContConvController _configureAttendingTimeout]";
    __int16 v12 = 2048;
    double v13 = attendingTimeoutInSecs;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s attending timeout:%f", buf, 0x16u);
  }

  *(float *)&double v6 = self->_attendingTimeoutInSecs;
  if (-[CSAttSiriContConvController _useAttendingTimeoutInAsset:](self, "_useAttendingTimeoutInAsset:", v6))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000607F4;
    v9[3] = &unk_10022E340;
    void v9[4] = self;
    [v8 getMitigationAssetWithEndpointId:0 completion:v9];
  }

- (void)_setupAttendingTimer
{
  float attendingTimeoutInSecs = self->_attendingTimeoutInSecs;
  if (attendingTimeoutInSecs >= 1.0)
  {
    attendingTimer = self->_attendingTimer;
    if (attendingTimer)
    {
      -[CSAttSiriTimer cancelTimer](attendingTimer, "cancelTimer");
      double v6 = self->_attendingTimer;
      self->_attendingTimer = 0LL;
    }

    id v7 = -[CSAttSiriTimer initWithQueue:](objc_alloc(&OBJC_CLASS___CSAttSiriTimer), "initWithQueue:", 0LL);
    BOOL v8 = self->_attendingTimer;
    self->_attendingTimer = v7;

    objc_initWeak(&location, self);
    int v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = self->_attendingTimeoutInSecs;
      *(_DWORD *)buf = 136315394;
      BOOL v17 = "-[CSAttSiriContConvController _setupAttendingTimer]";
      __int16 v18 = 2048;
      double v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Setup attending timer for duration %f secs",  buf,  0x16u);
    }

    BOOL v11 = self->_attendingTimer;
    float v12 = self->_attendingTimeoutInSecs;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100060738;
    v13[3] = &unk_10022E920;
    objc_copyWeak(&v14, &location);
    -[CSAttSiriTimer setTimerForSecs:completionBlock:](v11, "setTimerForSecs:completionBlock:", v13, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v17 = "-[CSAttSiriContConvController _setupAttendingTimer]";
      __int16 v18 = 2048;
      double v19 = attendingTimeoutInSecs;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Not setting up attending timer. Timeout value set to :%f(sec)",  buf,  0x16u);
    }
  }

- (void)handleAttendingTimeout
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000606E0;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSAttSiriNode)gazeNode
{
  return self->_gazeNode;
}

- (void)setGazeNode:(id)a3
{
}

- (CSAttSiriAttentionNode)attentionNode
{
  return self->_attentionNode;
}

- (CSAttSiriOSDNode)osdNode
{
  return self->_osdNode;
}

- (NSMutableDictionary)nodesCache
{
  return self->_nodesCache;
}

- (void)setNodesCache:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  return self->_attSiriController;
}

- (void)setAttSiriController:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (CSAttSiriMotionNode)motionNode
{
  return self->_motionNode;
}

- (void)setMotionNode:(id)a3
{
}

- (CSAttSiriMagusLoggingNode)magusLoggingNode
{
  return self->_magusLoggingNode;
}

- (void)setMagusLoggingNode:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAttSiriTimer)clientPendingTimer
{
  return self->_clientPendingTimer;
}

- (void)setClientPendingTimer:(id)a3
{
}

- (CSAttSiriTimer)attendingPendingStateTimer
{
  return self->_attendingPendingStateTimer;
}

- (void)setAttendingPendingStateTimer:(id)a3
{
}

- (CSAttSiriTimer)attendingTimer
{
  return self->_attendingTimer;
}

- (void)setAttendingTimer:(id)a3
{
}

- (float)attendingTimeoutInSecs
{
  return self->_attendingTimeoutInSecs;
}

- (void)setAttendingTimeoutInSecs:(float)a3
{
  self->_float attendingTimeoutInSecs = a3;
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (void)setIsAttending:(BOOL)a3
{
  self->_BOOL isAttending = a3;
}

- (NSString)prevStoppedMhId
{
  return self->_prevStoppedMhId;
}

- (void)setPrevStoppedMhId:(id)a3
{
}

- (BOOL)useGazeSignal
{
  return self->_useGazeSignal;
}

- (void)setUseGazeSignal:(BOOL)a3
{
  self->_useGazeSignal = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)_isAttentionNodeAvailable
{
  return 1;
}

@end