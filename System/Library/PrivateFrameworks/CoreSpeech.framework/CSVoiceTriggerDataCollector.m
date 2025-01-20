@interface CSVoiceTriggerDataCollector
+ (id)sharedInstance;
- (CSVoiceTriggerDataCollector)init;
- (NSArray)privacyApprovedFields;
- (NSDate)lastVTDisableDate;
- (NSDate)lastVTEnableDate;
- (NSMutableArray)vteiList;
- (OS_dispatch_queue)queue;
- (id)_filteredVTEIArray;
- (id)fetchVoiceTriggerHeartBeatMetrics;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_createAndSubmitRejectLoggingDictWithSource:(id)a3 withPHSAcceptInfo:(id)a4;
- (void)_submitToggleReport;
- (void)addVTAcceptEntryAndSubmit:(id)a3;
- (void)addVTRejectEntry:(id)a3 truncateData:(BOOL)a4;
- (void)setLastVTDisableDate:(id)a3;
- (void)setLastVTEnableDate:(id)a3;
- (void)setPrivacyApprovedFields:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVteiList:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
@end

@implementation CSVoiceTriggerDataCollector

- (CSVoiceTriggerDataCollector)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerDataCollector;
  v2 = -[CSVoiceTriggerDataCollector init](&v16, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerDataCollector", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 5LL);
    vteiList = v2->_vteiList;
    v2->_vteiList = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    [v7 registerObserver:v2];

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
    [v8 addObserver:v2];

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
    if ([v9 isEnabled])
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      lastVTEnableDate = v2->_lastVTEnableDate;
      v2->_lastVTEnableDate = (NSDate *)v10;
    }

    else
    {
      lastVTEnableDate = v2->_lastVTEnableDate;
      v2->_lastVTEnableDate = 0LL;
    }

    lastVTDisableDate = v2->_lastVTDisableDate;
    v2->_lastVTDisableDate = 0LL;

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  kVTEIconfigVersion,  kVTEIbuildVersion,  kVTEItotalSamplesAtEndOfCapture,  kVTEItriggerScore,  kVTEIrecognizerScore,  0LL));
    objc_storeStrong((id *)&v2->_privacyApprovedFields, v13);
    v14 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSVoiceTriggerDataCollector init]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Created CSVoiceTriggerDataCollector",  buf,  0xCu);
    }
  }

  return v2;
}

- (id)fetchVoiceTriggerHeartBeatMetrics
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100029E94;
  uint64_t v10 = sub_100029EA4;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029EAC;
  block[3] = &unk_10022E990;
  block[4] = &v6;
  dispatch_sync(queue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addVTRejectEntry:(id)a3 truncateData:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029C20;
  block[3] = &unk_10022ECA8;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)addVTAcceptEntryAndSubmit:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100029BCC;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_filteredVTEIArray
{
  uint64_t v3 = mach_absolute_time();
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  obj = self->_vteiList;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
  if (!v4) {
    goto LABEL_14;
  }
  id v6 = v4;
  uint64_t v7 = *(void *)v25;
  *(void *)&__int128 v5 = 136315650LL;
  __int128 v21 = v5;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", @"dcTriggerEndMachTime", v21));
      id v11 = [v10 unsignedIntegerValue];

      +[CSFTimeUtils hostTimeToTimeInterval:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToTimeInterval:", v3 - (void)v11);
      double v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));
      [v14 removeObjectForKey:@"dcTriggerEndMachTime"];
      if (v13 <= 30.0)
      {
        [v22 addObject:v14];
        v18 = (os_log_s *)CSLogCategoryVT;
        if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = v21;
        v29 = "-[CSVoiceTriggerDataCollector _filteredVTEIArray]";
        __int16 v30 = 2048;
        id v31 = v11;
        __int16 v32 = 2048;
        double v33 = v13;
        objc_super v16 = v18;
        v17 = "%s Collecting VT/PHS reject event from time: %llu, delta %f secs";
      }

      else
      {
        v15 = (os_log_s *)CSLogCategoryVT;
        if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = v21;
        v29 = "-[CSVoiceTriggerDataCollector _filteredVTEIArray]";
        __int16 v30 = 2048;
        id v31 = v11;
        __int16 v32 = 2048;
        double v33 = v13;
        objc_super v16 = v15;
        v17 = "%s Rejecting VT/PHS reject event from time: %llu, delta %f secs";
      }

      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
LABEL_12:
    }

    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
  }

  while (v6);
LABEL_14:

  if ([v22 count]) {
    id v19 = [v22 copy];
  }
  else {
    id v19 = 0LL;
  }

  return v19;
}

- (void)_createAndSubmitRejectLoggingDictWithSource:(id)a3 withPHSAcceptInfo:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerDataCollector _filteredVTEIArray](self, "_filteredVTEIArray"));
  if ([v8 count])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v10 = @"unkown";
    if (v6) {
      id v10 = v6;
    }
    id v11 = v10;
    [v9 setObject:v11 forKey:kVTEISiriActivationRecordType];
    double v12 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v9 setObject:v13 forKey:kVTEItriggerEndMachTime];

    [v9 setObject:v8 forKey:kVTEIRejectInfoList];
    if (v7) {
      [v9 setObject:v7 forKey:kVTEIPHSAcceptEventInfo];
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v14 logEventWithType:4709 context:v9];

    v15 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      vteiList = self->_vteiList;
      v17 = v15;
      int v20 = 136315650;
      __int128 v21 = "-[CSVoiceTriggerDataCollector _createAndSubmitRejectLoggingDictWithSource:withPHSAcceptInfo:]";
      __int16 v22 = 2048;
      id v23 = -[NSMutableArray count](vteiList, "count");
      __int16 v24 = 2112;
      __int128 v25 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Submitting %lu VT/PHS reject logs for siri record type %@",  (uint8_t *)&v20,  0x20u);
    }
  }

  v18 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 5LL);
  id v19 = self->_vteiList;
  self->_vteiList = v18;
}

- (void)_submitToggleReport
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerStatistics sharedInstance](&OBJC_CLASS___CSVoiceTriggerStatistics, "sharedInstance"));
  id v4 = [v3 getPHSRejectCount];

  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerStatistics sharedInstance](&OBJC_CLASS___CSVoiceTriggerStatistics, "sharedInstance"));
  id v6 = [v5 getVTRejectCount];

  vteiList = self->_vteiList;
  if (vteiList
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](vteiList, "lastObject")),
        v8,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_vteiList, "lastObject"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kVTEIsatNumberTrainingUtterances]);
    id v11 = [v10 unsignedIntegerValue];
  }

  else
  {
    id v11 = 0LL;
  }

  v22[0] = kVTEIsatNumberTrainingUtterances;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
  v23[0] = v12;
  v22[1] = kVTEILastConsecutiveVTRejects;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
  v23[1] = v13;
  v22[2] = kVTEILastConsecutivePHSRejects;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v23[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));

  objc_super v16 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    id v19 = "-[CSVoiceTriggerDataCollector _submitToggleReport]";
    __int16 v20 = 2112;
    __int128 v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Submitting VT toggle analytics: %@",  (uint8_t *)&v18,  0x16u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v17 logEventWithType:4708 context:v15];
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v9 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029B3C;
  block[3] = &unk_10022ECA8;
  BOOL v15 = a5;
  id v13 = v9;
  v14 = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100029978;
  v5[3] = &unk_10022EFA8;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (NSMutableArray)vteiList
{
  return self->_vteiList;
}

- (void)setVteiList:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)lastVTEnableDate
{
  return self->_lastVTEnableDate;
}

- (void)setLastVTEnableDate:(id)a3
{
}

- (NSDate)lastVTDisableDate
{
  return self->_lastVTDisableDate;
}

- (void)setLastVTDisableDate:(id)a3
{
}

- (NSArray)privacyApprovedFields
{
  return self->_privacyApprovedFields;
}

- (void)setPrivacyApprovedFields:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FCA8 != -1) {
    dispatch_once(&qword_10027FCA8, &stru_10022A938);
  }
  return (id)qword_10027FCB0;
}

@end