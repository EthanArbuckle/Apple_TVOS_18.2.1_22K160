@interface CSVoiceTriggerStatistics
+ (id)sharedInstance;
- (CSVoiceTriggerStatistics)init;
- (double)getLastPHSRejectTime;
- (double)lastPHSReject;
- (id)getVoiceTriggerDailyMetadata;
- (id)getVoiceTriggerStatistics;
- (int)_convertToFirstPassSource:(id)a3;
- (unint64_t)consecutivePHSRejects;
- (unint64_t)firstPassTriggerCount;
- (unint64_t)getPHSRejectCount;
- (unint64_t)getVTRejectCount;
- (unint64_t)triggerCount;
- (void)clearFalseFirstPassTriggersPerHour;
- (void)clearFirstPassTriggerCount;
- (void)clearTriggerCount;
- (void)increaseFalseFirstPassTriggersPerHour;
- (void)increaseTriggerCount;
- (void)incrementFirstPassTriggerCount;
- (void)incrementPHSRejectCount;
- (void)incrementVTRejectCount;
- (void)resetPHSRejectCount;
- (void)resetVTEstimationStatistics;
- (void)setConsecutivePHSRejects:(unint64_t)a3;
- (void)setLastPHSReject:(double)a3;
- (void)updateVTEstimationStatistics:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
@end

@implementation CSVoiceTriggerStatistics

- (CSVoiceTriggerStatistics)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerStatistics;
  id v2 = -[CSVoiceTriggerStatistics init](&v18, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerStatistics queue", 0LL);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    *((void *)v2 + 1) = 0LL;
    *((void *)v2 + 3) = 0LL;
    *((void *)v2 + 5) = 0LL;
    *((_WORD *)v2 + 36) = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v6 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v8 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v7;

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 2));
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    v11 = (dispatch_source_s *)*((void *)v2 + 6);
    dispatch_time_t v12 = dispatch_time(0LL, 0x34630B80000LL);
    dispatch_source_set_timer(v11, v12, 0x34630B80000uLL, 0xDF8476000uLL);
    objc_initWeak(&location, v2);
    v13 = (dispatch_source_s *)*((void *)v2 + 6);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000D6FC0;
    v15[3] = &unk_10022E920;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return (CSVoiceTriggerStatistics *)v2;
}

- (void)increaseFalseFirstPassTriggersPerHour
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6F54;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearFalseFirstPassTriggersPerHour
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6F48;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)increaseTriggerCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6F2C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearTriggerCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6F20;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)triggerCount
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D6F0C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetPHSRejectCount
{
  self->_consecutivePHSRejects = 0LL;
}

- (double)getLastPHSRejectTime
{
  return self->_lastPHSReject;
}

- (unint64_t)getPHSRejectCount
{
  return self->_consecutivePHSRejects;
}

- (void)incrementPHSRejectCount
{
  self->_lastPHSReject = v3;
}

- (void)incrementVTRejectCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6EF8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)getVTRejectCount
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D6EE4;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)incrementFirstPassTriggerCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6ED0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearFirstPassTriggerCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6EC4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)firstPassTriggerCount
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D6EB0;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateVTEstimationStatistics:(id)a3
{
  id v4 = a3;
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) == 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000D6470;
    v6[3] = &unk_10022EFD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (void)resetVTEstimationStatistics
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6458;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int)_convertToFirstPassSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessor])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessorWithRingtone] & 1) != 0 || (objc_msgSend( v3,  "isEqualToString:",  kVTEIFirstPassTriggeredFromApplicationProcessorWithConnectedCall))
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromAlwaysOnProcessor])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromHearst])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromJarvis])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromRemora])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromHearstAP])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromWatch])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromDarwin])
  {
    int v4 = 10;
  }

  else
  {
    int v4 = [v3 isEqualToString:kVTEIFirstPassTriggeredFromDefault];
  }

  return v4;
}

- (id)getVoiceTriggerStatistics
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000D63A8;
  v10 = sub_1000D63B8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D640C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getVoiceTriggerDailyMetadata
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000D63A8;
  v10 = sub_1000D63B8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D63C0;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
}

- (unint64_t)consecutivePHSRejects
{
  return self->_consecutivePHSRejects;
}

- (void)setConsecutivePHSRejects:(unint64_t)a3
{
  self->_consecutivePHSRejects = a3;
}

- (double)lastPHSReject
{
  return self->_lastPHSReject;
}

- (void)setLastPHSReject:(double)a3
{
  self->_lastPHSReject = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FFD0 != -1) {
    dispatch_once(&qword_10027FFD0, &stru_10022CE50);
  }
  return (id)qword_10027FFC8;
}

@end