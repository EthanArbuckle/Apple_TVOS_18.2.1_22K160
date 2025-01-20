@interface _DASAppResumePLLogger
+ (id)applicationBundleIDForExecutableName:(id)a3;
+ (id)sharedInstance;
+ (id)topPredictionsFromScores:(id)a3;
- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5;
- (BOOL)powerLogExists;
- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4;
- (NSDate)lastReportedDate;
- (NSUserDefaults)defaults;
- (OS_os_log)log;
- (_CDContextualKeyPath)inferredCarryStatusKeyPath;
- (_DASAppResumePLLogger)init;
- (id)appsFromProactiveSuggestions;
- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4;
- (id)concatenateEventsPrivate:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setInferredCarryStatusKeyPath:(id)a3;
- (void)setLastReportedDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPowerLogExists:(BOOL)a3;
@end

@implementation _DASAppResumePLLogger

- (_DASAppResumePLLogger)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____DASAppResumePLLogger;
  v2 = -[_DASAppResumePLLogger init](&v19, "init");
  if (!v2)
  {
LABEL_6:
    v14 = v2;
    goto LABEL_10;
  }

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](&OBJC_CLASS____DASDaemonLogger, "logForCategory:", @"appResume"));
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  BOOL v5 = dlopen_preflight((const char *)[@"/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog" UTF8String]);
  v2->_powerLogExists = v5;
  if (v5)
  {
    v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    defaults = v2->_defaults;
    v2->_defaults = v6;

    -[NSUserDefaults doubleForKey:](v2->_defaults, "doubleForKey:", @"appResumePredictionsReportedDate");
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    lastReportedDate = v2->_lastReportedDate;
    v2->_lastReportedDate = (NSDate *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v2->_lastReportedDate;
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Last reported date for App predictions to PowerLog is %@",  buf,  0xCu);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/das/inferredCarryStatus"));
    inferredCarryStatusKeyPath = v2->_inferredCarryStatusKeyPath;
    v2->_inferredCarryStatusKeyPath = (_CDContextualKeyPath *)v12;

    -[_DASAppResumePLLogger initializeCarryStatusLogging](v2, "initializeCarryStatusLogging");
    goto LABEL_6;
  }

  v15 = v2->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (NSDate *)[@"/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog" UTF8String];
    *(_DWORD *)buf = 136315138;
    v21 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Powerlog library at %s does not exist",  buf,  0xCu);
  }

  v14 = 0LL;
LABEL_10:

  return v14;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011BA4;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157510 != -1) {
    dispatch_once(&qword_100157510, block);
  }
  return (id)qword_100157508;
}

+ (id)topPredictionsFromScores:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysSortedByValueUsingComparator:&stru_1001151B0]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((unint64_t)[v3 count] > 9)
  {
    int v6 = 10;
  }

  else
  {
    int v6 = [v3 count];
    if (v6 < 1) {
      goto LABEL_7;
    }
  }

  uint64_t v7 = 0LL;
  uint64_t v8 = v6;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v7]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v7]);
    [v5 setObject:v10 forKeyedSubscript:v11];

    ++v7;
  }

  while (v8 != v7);
LABEL_7:

  return v5;
}

+ (id)applicationBundleIDForExecutableName:(id)a3
{
  return 0LL;
}

- (id)appsFromProactiveSuggestions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASAppResumePLLogger topPredictionsFromScores:]( &OBJC_CLASS____DASAppResumePLLogger,  "topPredictionsFromScores:",  v2));

  return v3;
}

- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4
{
  unsigned __int8 v5 = -[_DASAppResumePLLogger deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:]( self,  "deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:",  a3,  a4,  14.0);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B11AC(v5, log);
  }
  return v5;
}

- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5
{
  return 1;
}

- (id)concatenateEventsPrivate:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    id v4 = v3;
    goto LABEL_16;
  }

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int v5 = [v3 count];
  int v6 = v5 - 1;
  if (v5 < 2)
  {
    if (v5 != 1) {
      goto LABEL_16;
    }
LABEL_18:
    v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
    [v4 addObject:v27];

    goto LABEL_16;
  }

  v29 = v4;
  do
  {
    unsigned int v32 = v6;
    uint64_t v7 = (v6 - 1);
    uint64_t v8 = v7 + 1;
    int v30 = v6 - 1;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v8]);
      id v10 = [v9 integerValue];
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v7]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 endDate]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v7]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 startDate]);
      unsigned int v16 = [v13 isEqualToDate:v15];

      if (!v16) {
        goto LABEL_11;
      }
      --v7;
      if ((int)--v8 <= 0)
      {
        LODWORD(v7) = -1;
        goto LABEL_11;
      }
    }

LABEL_11:
    if ((int)v7 >= v30)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v32]);
      LODWORD(v7) = v30;
    }

    else
    {
      uint64_t v17 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v32]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v33 stream]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v17]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v31 startDate]);
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:(int)v7 + 1]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 endDate]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v17]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v17]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 metadata]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:value:metadata:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:value:metadata:",  v28,  v18,  v20,  v22,  v24));
    }

    id v4 = v29;
    [v29 addObject:v25];

    int v6 = v7;
  }

  while ((int)v7 > 0);
  if (!(_DWORD)v7) {
    goto LABEL_18;
  }
LABEL_16:

  return v4;
}

- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4
{
  if (a4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([a3 reverseObjectEnumerator]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAppResumePLLogger concatenateEventsPrivate:](self, "concatenateEventsPrivate:", v6));
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAppResumePLLogger concatenateEventsPrivate:](self, "concatenateEventsPrivate:", a3));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 reverseObjectEnumerator]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  }

  return v7;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDContextualKeyPath)inferredCarryStatusKeyPath
{
  return self->_inferredCarryStatusKeyPath;
}

- (void)setInferredCarryStatusKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end