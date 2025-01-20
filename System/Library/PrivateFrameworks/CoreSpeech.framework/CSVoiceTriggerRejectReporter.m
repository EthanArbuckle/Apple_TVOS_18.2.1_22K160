@interface CSVoiceTriggerRejectReporter
+ (id)sharedInstance;
- (CSVoiceTriggerRejectReporter)init;
- (OS_dispatch_queue)queue;
- (id)_checkForRejectWithScore:(id)a3 threshold:(id)a4 eventType:(unint64_t)a5 deltaTime:(double)a6;
- (id)_constructVTRejectEventFrom:(id)a3 withMhid:(id)a4;
- (id)_extractMetaDataEventFromEntry:(id)a3 currentTime:(double)a4;
- (id)_readEventFromBiome;
- (id)constructSELFEventFromEvents:(id)a3 withMhid:(id)a4;
- (void)_deleteAllEventsFromBiome;
- (void)_emitEvent:(id)a3;
- (void)reportVTRejectIfNeededForMHId:(id)a3;
- (void)setQueue:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
@end

@implementation CSVoiceTriggerRejectReporter

- (CSVoiceTriggerRejectReporter)init
{
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerRejectReporter;
    v4 = -[CSVoiceTriggerRejectReporter init](&v10, "init");
    if (v4)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(global_queue);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
      [v8 registerObserver:v4];
    }

    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)reportVTRejectIfNeededForMHId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100126CF8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)constructSELFEventFromEvents:(id)a3 withMhid:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___CSVTRejectDetectDataExtractor);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSince1970];
  double v10 = v9;

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    double v15 = (double)(unint64_t)v10;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerRejectReporter _extractMetaDataEventFromEntry:currentTime:]( self,  "_extractMetaDataEventFromEntry:currentTime:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)i),  v15));
        if (v17)
        {
          v18 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
            *(_DWORD *)buf = 136315394;
            v33 = "-[CSVoiceTriggerRejectReporter constructSELFEventFromEvents:withMhid:]";
            __int16 v34 = 2112;
            unint64_t v35 = (unint64_t)v20;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Extracted interested event: %@",  buf,  0x16u);
          }

          -[CSVTRejectDetectDataExtractor classifyEventWithMetaData:](v7, "classifyEventWithMetaData:", v17);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v13);
  }

  if (-[CSVTRejectDetectDataExtractor totalEventCount](v7, "totalEventCount"))
  {
    v21 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      unint64_t v23 = -[CSVTRejectDetectDataExtractor totalEventCount](v7, "totalEventCount");
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSVoiceTriggerRejectReporter constructSELFEventFromEvents:withMhid:]";
      __int16 v34 = 2048;
      unint64_t v35 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s Count of VT reject events detected: %lu",  buf,  0x16u);
    }

    v24 = v27;
    v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerRejectReporter _constructVTRejectEventFrom:withMhid:]( self,  "_constructVTRejectEventFrom:withMhid:",  v7,  v27));
  }

  else
  {
    v25 = 0LL;
    v24 = v27;
  }

  return v25;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v9)
  {
    v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      v19 = "-[CSVoiceTriggerRejectReporter siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v18, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 requestMHUUID]);
    -[CSVoiceTriggerRejectReporter reportVTRejectIfNeededForMHId:](self, "reportVTRejectIfNeededForMHId:", v17);
  }
}

- (id)_readEventFromBiome
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = objc_alloc_init(&OBJC_CLASS___BMSQLDatabase);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 executeQuery:@"SELECT * FROM \"Siri.VoiceTriggerStatistics\""]);
  uint64_t v5 = 2001LL;
  while ([v4 next])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 row]);
    [v2 addObject:v6];

    if (!--v5)
    {
      v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        id v13 = "-[CSVoiceTriggerRejectReporter _readEventFromBiome]";
        __int16 v14 = 2048;
        uint64_t v15 = 2000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Exiting after reading %lu entries",  (uint8_t *)&v12,  0x16u);
      }

      break;
    }
  }

  id v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = v8;
    id v10 = [v2 count];
    int v12 = 136315394;
    id v13 = "-[CSVoiceTriggerRejectReporter _readEventFromBiome]";
    __int16 v14 = 2048;
    uint64_t v15 = (uint64_t)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Read %lu entries from biome",  (uint8_t *)&v12,  0x16u);
  }

  return v2;
}

- (void)_deleteAllEventsFromBiome
{
  uint64_t v2 = BiomeLibrary(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 Siri]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 VoiceTriggerStatistics]);

  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pruner]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100126CDC;
  v9[3] = &unk_10022DEE0;
  v9[4] = &v10;
  [v6 deleteWithPolicy:@"Delete all VT stats" eventsPassingTest:v9];

  v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v11[3];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CSVoiceTriggerRejectReporter _deleteAllEventsFromBiome]";
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Cleaned up %lu entries", buf, 0x16u);
  }

  _Block_object_dispose(&v10, 8);
}

- (id)_constructVTRejectEventFrom:(id)a3 withMhid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHVoiceTriggerRejectDetected);
  objc_msgSend(v7, "setPhsRejectBeforeActivationCount:", objc_msgSend(v5, "spkrIdRejectCount"));
  objc_msgSend(v7, "setCheckerHSRejectBeforeActivationCount:", objc_msgSend(v5, "hsRejectCount"));
  objc_msgSend(v7, "setCheckerJSRejectBeforeActivationCount:", objc_msgSend(v5, "jsRejectCount"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 spkrIdScores]);
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 spkrIdScores]);
    [v7 setPhsRejectBeforeActivationScores:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 spkrIdTimeDelta]);
    [v7 setPhsRejectBeforeActivationTimeDiffInNs:v11];

    [v5 phsThreshold];
    objc_msgSend(v7, "setPhsThreshold:");
    [v5 pjsThreshold];
    objc_msgSend(v7, "setPjsThreshold:");
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 hsScores]);
  id v13 = [v12 count];

  if (v13)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 hsScores]);
    [v7 setCheckerHSRejectBeforeActivationScores:v14];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 hsTimeDelta]);
    [v7 setCheckerHSRejectBeforeActivationTimeDiffInNs:v15];

    [v5 hsThreshold];
    objc_msgSend(v7, "setCheckerHSThreshold:");
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 jsScores]);
  id v17 = [v16 count];

  if (v17)
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v5 jsScores]);
    [v7 setCheckerJSRejectBeforeActivationScores:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 jsTimeDelta]);
    [v7 setCheckerJSRejectBeforeActivationTimeDiffInNs:v19];

    [v5 jsThreshold];
    objc_msgSend(v7, "setCheckerJSThreshold:");
  }

  id v20 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v21 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  v22 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);

  id v23 = [v21 initWithNSUUID:v22];
  [v20 setMhId:v23];

  id v24 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  [v24 setEventMetadata:v20];
  [v24 setVoiceTriggerRejectDetected:v7];

  return v24;
}

- (void)_emitEvent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v4 emitMessage:v3];

  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSVoiceTriggerRejectReporter _emitEvent:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Emitting VTRejectDetected event",  (uint8_t *)&v6,  0xCu);
  }

- (id)_checkForRejectWithScore:(id)a3 threshold:(id)a4 eventType:(unint64_t)a5 deltaTime:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  uint64_t v12 = 0LL;
  if (v9 && v10)
  {
    [v9 floatValue];
    float v14 = v13;
    [v11 floatValue];
    if (v14 >= v15)
    {
      uint64_t v12 = 0LL;
    }

    else
    {
      __int16 v16 = objc_alloc(&OBJC_CLASS___CSVTRejectEventMetadata);
      [v9 floatValue];
      unsigned int v18 = v17;
      [v11 floatValue];
      LODWORD(v20) = v19;
      uint64_t v12 = -[CSVTRejectEventMetadata initWithEventType:score:threshold:deltaTime:]( v16,  "initWithEventType:score:threshold:deltaTime:",  a5,  COERCE_DOUBLE(v18 | 0x41CDCD6500000000LL),  v20,  a6 * 1000000000.0);
    }
  }

  return v12;
}

- (id)_extractMetaDataEventFromEntry:(id)a3 currentTime:(double)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"absoluteTimestamp"]);
  uint64_t v8 = v7;
  if (v7)
  {
    unint64_t v9 = (unint64_t)(a4 - (double)(unint64_t)[v7 unsignedLongLongValue]);
    if (v9 <= 0x3C)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"invocationTypeID"]);
      if (!v11)
      {
        id v10 = 0LL;
LABEL_20:

        goto LABEL_21;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"tdSpeakerRecognizerCombinedScore"]);
      if ([v11 isEqualToNumber:&off_100238DF0])
      {
        float v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"triggerScoreHS"]);
        float v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"keywordThresholdHS"]);
        float v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"tdSpeakerRecognizerCombinedThresholdHS"]);
        double v16 = (double)v9;
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerRejectReporter _checkForRejectWithScore:threshold:eventType:deltaTime:]( self,  "_checkForRejectWithScore:threshold:eventType:deltaTime:",  v13,  v14,  0LL,  (double)v9));
        if (!v17)
        {
          unsigned int v18 = self;
          int v19 = v12;
          double v20 = v15;
          uint64_t v21 = 2LL;
LABEL_13:
          id v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerRejectReporter _checkForRejectWithScore:threshold:eventType:deltaTime:]( v18,  "_checkForRejectWithScore:threshold:eventType:deltaTime:",  v19,  v20,  v21,  v16));
          id v10 = v23;
          if (v23)
          {
            id v24 = v23;
            int v22 = 1;
          }

          else
          {
            int v22 = 0;
          }

LABEL_17:
          if (v22)
          {
LABEL_19:

            goto LABEL_20;
          }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100280140 != -1) {
    dispatch_once(&qword_100280140, &stru_10022DEB8);
  }
  return (id)qword_100280138;
}

@end