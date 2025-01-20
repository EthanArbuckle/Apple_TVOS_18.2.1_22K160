@interface CMSLogger
+ (id)_LoggingQueue;
- (BOOL)_checkDictionary:(id)a3 forKeyType:(Class)a4 andValueType:(Class)a5;
- (NSDictionary)entryRenamingDictionary;
- (NSString)logIdentity;
- (NSString)occuranceLog;
- (NSString)performanceLog;
- (double)reportFrequency;
- (id)_loggerStorage;
- (id)createNewSessionForType:(id)a3 withMetadata:(id)a4;
- (id)defaultSession;
- (id)initForIdentity:(id)a3;
- (id)sendEvent;
- (void)_fileMetrics;
- (void)_loadAnalyticsData;
- (void)_saveAnalyticsData;
- (void)_sumbitFromSessionType:(id)a3 withMetadata:(id)a4 withEventDurations:(id)a5 withEventOccurance:(id)a6;
- (void)setEntryRenamingDictionary:(id)a3;
- (void)setOccuranceLog:(id)a3;
- (void)setPerformanceLog:(id)a3;
- (void)setReportFrequency:(double)a3;
- (void)setSendEvent:(id)a3;
@end

@implementation CMSLogger

+ (id)_LoggingQueue
{
  if (qword_100024460 != -1) {
    dispatch_once(&qword_100024460, &stru_10001CAE0);
  }
  return (id)qword_100024468;
}

- (id)initForIdentity:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CMSLogger;
  v5 = -[CMSLogger init](&v24, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    logIdentity = v5->_logIdentity;
    v5->_logIdentity = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.Performance",  v5->_logIdentity));
    performanceLog = v5->_performanceLog;
    v5->_performanceLog = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.Occurance",  v5->_logIdentity));
    occuranceLog = v5->_occuranceLog;
    v5->_occuranceLog = (NSString *)v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    performanceData = v5->performanceData;
    v5->performanceData = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    performanceDataCount = v5->performanceDataCount;
    v5->performanceDataCount = v14;

    v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    metadata = v5->metadata;
    v5->metadata = v16;

    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    occuranceData = v5->occuranceData;
    v5->occuranceData = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastTransitTimestamp = v5->_lastTransitTimestamp;
    v5->_lastTransitTimestamp = (NSDate *)v20;

    -[CMSLogger _loadAnalyticsData](v5, "_loadAnalyticsData");
    id sendEvent = v5->_sendEvent;
    v5->_id sendEvent = &stru_10001CB20;
  }

  return v5;
}

- (double)reportFrequency
{
  return result;
}

- (void)setReportFrequency:(double)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D4A0;
  block[3] = &unk_10001CB70;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (id)sendEvent
{
  return objc_retainBlock(self->_sendEvent);
}

- (void)setSendEvent:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](&OBJC_CLASS___CMSLogger, "_LoggingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000D690;
  v7[3] = &unk_10001CB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)defaultSession
{
  return -[CMSLogger createNewSessionForType:withMetadata:]( self,  "createNewSessionForType:withMetadata:",  &stru_10001D0F8,  &__NSDictionary0__struct);
}

- (id)createNewSessionForType:(id)a3 withMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CMSLoggingSession initForType:withMetadata:]( objc_alloc(&OBJC_CLASS___CMSLoggingSession),  "initForType:withMetadata:",  v7,  v6);

  [v8 setBelongedLogger:self];
  return v8;
}

- (void)_sumbitFromSessionType:(id)a3 withMetadata:(id)a4 withEventDurations:(id)a5 withEventOccurance:(id)a6
{
  performanceData = self->performanceData;
  id v11 = a6;
  id v12 = a5;
  id v26 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](performanceData, "objectForKeyedSubscript:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->performanceDataCount,  "objectForKeyedSubscript:",  v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v14));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10000DA14;
  v33[3] = &unk_10001CBC0;
  id v34 = v14;
  id v35 = v15;
  id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));
  id v37 = v16;
  id v17 = v16;
  id v18 = v36;
  id v19 = v15;
  id v27 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v33];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"Count"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v20 unsignedIntegerValue] + 1));
  [v17 setObject:v21 forKeyedSubscript:@"Count"];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->performanceData, "setObject:forKeyedSubscript:", v17, v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->performanceDataCount,  "setObject:forKeyedSubscript:",  v18,  v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->occuranceData, "objectForKeyedSubscript:", v13));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10000DB5C;
  v30[3] = &unk_10001CBE8;
  id v31 = v22;
  id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v22));
  id v32 = v23;
  id v24 = v22;
  [v11 enumerateKeysAndObjectsUsingBlock:v30];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000DC08;
  v28[3] = &unk_10001CC10;
  id v29 = v23;
  id v25 = v23;
  [v24 enumerateKeysAndObjectsUsingBlock:v28];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->occuranceData, "setObject:forKeyedSubscript:", v25, v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->metadata, "setObject:forKeyedSubscript:", v26, v13);

  -[CMSLogger _saveAnalyticsData](self, "_saveAnalyticsData");
}

- (void)_fileMetrics
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](&OBJC_CLASS___CMSLogger, "_LoggingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DCF0;
  block[3] = &unk_10001C890;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)_loggerStorage
{
  v3 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.Metrics",  self->_logIdentity));
  v5 = -[NSUserDefaults initWithSuiteName:](v3, "initWithSuiteName:", v4);

  return v5;
}

- (void)_saveAnalyticsData
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CMSLogger _loggerStorage](self, "_loggerStorage"));
  [v3 setObject:self->_lastTransitTimestamp forKey:@"lastTransitTimestamp"];
  [v3 setObject:self->performanceData forKey:@"performanceData"];
  [v3 setObject:self->performanceDataCount forKey:@"performanceDataCount"];
  [v3 setObject:self->occuranceData forKey:@"occuranceData"];
  [v3 setObject:self->metadata forKey:@"metadata"];
  -[NSTimer timeInterval](self->reportTimer, "timeInterval");
  objc_msgSend(v3, "setDouble:forKey:", @"ReportInterval");
  [v3 synchronize];
}

- (BOOL)_checkDictionary:(id)a3 forKeyType:(Class)a4 andValueType:(Class)a5
{
  id v7 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000E35C;
  v9[3] = &unk_10001CC60;
  v9[5] = a4;
  v9[6] = a5;
  v9[4] = &v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
  LOBYTE(a5) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)a5;
}

- (void)_loadAnalyticsData
{
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[CMSLogger _loggerStorage](self, "_loggerStorage"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"lastTransitTimestamp"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    objc_storeStrong((id *)&self->_lastTransitTimestamp, v3);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"performanceData"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:]( self,  "_checkDictionary:forKeyType:andValueType:",  v5,  v7,  objc_opt_class(&OBJC_CLASS___NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->performanceData, "addEntriesFromDictionary:", v5);
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"performanceDataCount"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:]( self,  "_checkDictionary:forKeyType:andValueType:",  v8,  v10,  objc_opt_class(&OBJC_CLASS___NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->performanceDataCount, "addEntriesFromDictionary:", v8);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"occuranceData"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:]( self,  "_checkDictionary:forKeyType:andValueType:",  v11,  v13,  objc_opt_class(&OBJC_CLASS___NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->occuranceData, "addEntriesFromDictionary:", v11);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"metadata"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:]( self,  "_checkDictionary:forKeyType:andValueType:",  v14,  v16,  objc_opt_class(&OBJC_CLASS___NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->metadata, "addEntriesFromDictionary:", v14);
    }
  }

  [v18 doubleForKey:@"ReportInterval"];
  if (v17 > 0.0) {
    -[CMSLogger setReportFrequency:](self, "setReportFrequency:");
  }
}

- (NSString)logIdentity
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)performanceLog
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPerformanceLog:(id)a3
{
}

- (NSString)occuranceLog
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOccuranceLog:(id)a3
{
}

- (NSDictionary)entryRenamingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setEntryRenamingDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end