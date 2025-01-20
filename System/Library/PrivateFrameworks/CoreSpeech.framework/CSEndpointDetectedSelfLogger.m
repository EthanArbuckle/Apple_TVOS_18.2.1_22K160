@interface CSEndpointDetectedSelfLogger
+ (id)_decodeFeaturesAtEndpoint:(id)a3 endpointerModelType:(int64_t)a4;
+ (void)emitEndpointDetectedEventWithEndpointerMetrics:(id)a3 withEndpointerModelType:(int64_t)a4 withTrpId:(id)a5 withMhID:(id)a6;
- (BOOL)localSRDisabled;
- (BOOL)trpDetectDelivered;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSEndpointDetectedSelfLogger)init;
- (CSEndpointerMetrics)cachedRelaxedEndpointerMetrics;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)registerEndpointerNode:(id)a3;
- (void)reset;
- (void)setCachedRelaxedEndpointerMetrics:(id)a3;
- (void)setLocalSRDisabled:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setTrpDetectDelivered:(BOOL)a3;
- (void)setup;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5;
@end

@implementation CSEndpointDetectedSelfLogger

- (CSEndpointDetectedSelfLogger)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSEndpointDetectedSelfLogger;
  v2 = -[CSEndpointDetectedSelfLogger init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSEndpointDetectedSelfLogger queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_localSRDisabled = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[CSSiriClientBehaviorMonitor sharedInstance](&OBJC_CLASS___CSSiriClientBehaviorMonitor, "sharedInstance"));
    siriClientBehaviorMonitor = v2->_siriClientBehaviorMonitor;
    v2->_siriClientBehaviorMonitor = (CSSiriClientBehaviorMonitor *)v5;

    cachedRelaxedEndpointerMetrics = v2->_cachedRelaxedEndpointerMetrics;
    v2->_cachedRelaxedEndpointerMetrics = 0LL;
  }

  v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSEndpointDetectedSelfLogger init]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Created CSEndpointDetectedSelfLogger",  buf,  0xCu);
  }

  return v2;
}

- (void)setup
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7EB8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerEndpointerNode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D7E04;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7D44;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v7 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D7C74;
  v10[3] = &unk_10022EFD0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v9 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7BB4;
  block[3] = &unk_10022E7F8;
  id v13 = v9;
  int64_t v14 = a5;
  block[4] = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7ADC;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7A08;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5
{
  id v6 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D7950;
  v9[3] = &unk_10022EFD0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v8 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D7898;
  v11[3] = &unk_10022EFD0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
{
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return (CSAttSiriEndpointerNode *)objc_loadWeakRetained((id *)&self->_endpointerNode);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)localSRDisabled
{
  return self->_localSRDisabled;
}

- (void)setLocalSRDisabled:(BOOL)a3
{
  self->_localSRDisabled = a3;
}

- (BOOL)trpDetectDelivered
{
  return self->_trpDetectDelivered;
}

- (void)setTrpDetectDelivered:(BOOL)a3
{
  self->_trpDetectDelivered = a3;
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSEndpointerMetrics)cachedRelaxedEndpointerMetrics
{
  return self->_cachedRelaxedEndpointerMetrics;
}

- (void)setCachedRelaxedEndpointerMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)emitEndpointDetectedEventWithEndpointerMetrics:(id)a3 withEndpointerModelType:(int64_t)a4 withTrpId:(id)a5 withMhID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 featuresAtEndpoint]);
  id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointDetected);
  v50 = (void *)v13;
  unint64_t v47 = a4;
  v49 = (void *)objc_claimAutoreleasedReturnValue([a1 _decodeFeaturesAtEndpoint:v13 endpointerModelType:a4]);
  objc_msgSend(v14, "setEndpointFeaturesAtEndpoint:");
  id v15 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointerTimeoutMetadata);
  objc_msgSend(v15, "setIsTimeout:", objc_msgSend(v10, "isRequestTimeOut"));
  v48 = v15;
  [v14 setTimeoutMetadata:v15];
  id v16 = [v10 firstAudioSampleSensorTimestamp];
  [v10 blkHepAudioOrigin];
  double v18 = v17;
  [v10 vtExtraAudioAtStartInMs];
  double v20 = v19;
  unsigned int v46 = [v10 isAnchorTimeBuffered];
  id v21 = objc_alloc_init(&OBJC_CLASS___SISchemaVersion);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v10 assetConfigVersion]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsSeparatedByString:@"."]);

  if ([v23 count] == (id)2)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
    objc_msgSend(v21, "setMajor:", objc_msgSend(v24, "intValue"));

    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
    objc_msgSend(v21, "setMinor:", objc_msgSend(v25, "intValue"));
  }

  v51 = v12;
  [v14 setEndpointModelConfigVersion:v21];
  unint64_t v26 = (unint64_t)[v10 endpointerType];
  v27 = v11;
  if (v26 > 4) {
    uint64_t v28 = 0LL;
  }
  else {
    uint64_t v28 = dword_10018B270[v26];
  }
  [v14 setEndpointerType:v28];
  v29 = (void *)objc_claimAutoreleasedReturnValue([v10 asrFeatureLatencyDistribution]);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:withScaleFactor:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHStatisticDistributionInfoFromDictionary:withScaleFactor:",  v29,  1000.0));

  [v10 totalAudioRecorded];
  *(float *)&double v31 = v31;
  objc_msgSend( v14,  "setEndpointAudioDurationInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v31));
  objc_msgSend( v14,  "setFirstBufferTimeInNs:",  +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v16));
  objc_msgSend( v14,  "setEndpointedBufferTimeInNs:",  +[CSFTimeUtils hostTimeToNs:]( CSFTimeUtils,  "hostTimeToNs:",  objc_msgSend(v10, "endpointBufferHostTime")));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v10 additionalMetrics]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"EndpointerDecisionLagMs"]);
  [v33 floatValue];
  objc_msgSend( v14,  "setEndpointerDecisionLagInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:"));

  v34 = (void *)objc_claimAutoreleasedReturnValue([v10 additionalMetrics]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"ExtraDelayMs"]);
  [v35 floatValue];
  objc_msgSend( v14,  "setExtraDelayInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:"));

  [v14 setDerivedBufferTimeFromHistoricalAudio:v46];
  *(float *)&double v36 = v20;
  objc_msgSend( v14,  "setAudioSkippedDurationInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v36));
  *(float *)&double v37 = v18;
  objc_msgSend( v14,  "setEndpointResetPositionInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v37));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v10 osdFeaturesAtEndpoint]);
  [v38 silenceProbability];
  *(float *)&double v39 = v39;
  [v14 setEndpointerScore:v39];

  [v14 setAsrFeatureLatencyDistribution:v30];
  if (v27)
  {
    id v40 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    v41 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v27);
    id v42 = [v40 initWithNSUUID:v41];
    [v14 setTrpId:v42];
  }

  if (v47 <= 2) {
    objc_msgSend(v14, "setTrpDetectionType:");
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  v51));
  [v43 setEndpointDetected:v14];
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v44 emitMessage:v43];

  v45 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v53 = "+[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:]";
    __int16 v54 = 2112;
    v55 = v51;
    __int16 v56 = 2112;
    v57 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@, TRP ID: %@",  buf,  0x20u);
  }
}

+ (id)_decodeFeaturesAtEndpoint:(id)a3 endpointerModelType:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)[v5 count];
  unint64_t v7 = v6;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 2)
    {
      v48 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v50 = 136315906;
        v51 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
        __int16 v52 = 2048;
        uint64_t v53 = 6LL;
        __int16 v54 = 2048;
        uint64_t v55 = 2LL;
        __int16 v56 = 2048;
        uint64_t v57 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s Legacy endpointer feature count should always be %lu or %lu (timeout case), instead got %lu",  (uint8_t *)&v50,  0x2Au);
      }

      goto LABEL_20;
    }
  }

  else if (v6 > 0xD || ((1LL << v6) & 0x2844) == 0)
  {
    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v50 = 136316418;
      v51 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
      __int16 v52 = 2048;
      uint64_t v53 = 6LL;
      __int16 v54 = 2048;
      uint64_t v55 = 2LL;
      __int16 v56 = 2048;
      uint64_t v57 = 11LL;
      __int16 v58 = 2048;
      uint64_t v59 = 13LL;
      __int16 v60 = 2048;
      unint64_t v61 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Endpointer feature count should always be %lu, %lu (timeout case), %lu (EEP), or %lu (AEP), instead got %lu",  (uint8_t *)&v50,  0x3Eu);
      id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v50 = 136315394;
      v51 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v50, 0x16u);
    }

@end