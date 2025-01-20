@interface _DASActivityResultDependencyGroup
+ (id)groupFromDefaultsWithoutCreation:(id)a3;
+ (id)groupFromPersistence:(id)a3;
+ (void)resetDependenciesContainingSubstring:(id)a3;
- (BMStream)resultStream;
- (BOOL)deregisterProducer:(id)a3 error:(id *)a4;
- (BOOL)isDependencySatisfiedForActivity:(id)a3;
- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3;
- (BOOL)queue_isConsumerActivity:(id)a3;
- (BOOL)queue_isProducerActivity:(id)a3;
- (BOOL)registerProducer:(id)a3 error:(id *)a4;
- (BOOL)reportActivity:(id)a3 consumedResult:(id)a4 error:(id *)a5;
- (BOOL)reportActivity:(id)a3 producedResult:(id)a4 error:(id *)a5;
- (NSMutableDictionary)cumulativeResultConsumption;
- (NSMutableSet)consumers;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)resultIdentifier;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASActivity)producer;
- (_DASActivityResult)cumulativelyProducedResult;
- (_DASActivityResultDependencyGroup)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (id)queue_aggregateResultConsumptionForActivity:(id)a3;
- (int64_t)computeNumberOfAvailableResultsForActivity:(id)a3;
- (void)deregisterDependent:(id)a3;
- (void)handleActivitySubmission:(id)a3;
- (void)persistUpdatedResultConsumptionBy:(id)a3 result:(id)a4;
- (void)persistUpdatedResultProductionBy:(id)a3;
- (void)pruneConsumptionEventsForActivityIdentifier:(id)a3;
- (void)resetAccumulation;
- (void)setConsumers:(id)a3;
- (void)setCumulativeResultConsumption:(id)a3;
- (void)setCumulativelyProducedResult:(id)a3;
- (void)setLog:(id)a3;
- (void)setProducer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResultStream:(id)a3;
- (void)updateDependenciesPreClearedOnActivity:(id)a3 withValue:(BOOL)a4;
@end

@implementation _DASActivityResultDependencyGroup

+ (id)groupFromPersistence:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithIdentifier:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"DependencyGroupPersistence"));
  uint64_t v7 = BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ActivityScheduler]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 Dependency]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 Result]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 publisher]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10006E6A8;
  v28[3] = &unk_1001169E8;
  id v13 = v4;
  id v29 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 filterWithIsIncluded:v28]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10006E700;
  v26[3] = &unk_1001166A8;
  id v27 = v6;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10006E758;
  v22[3] = &unk_100116A10;
  id v23 = v27;
  id v15 = v5;
  id v24 = v15;
  id v25 = v13;
  id v16 = v13;
  id v17 = v27;
  id v18 = [v14 sinkWithCompletion:v26 receiveInput:v22];

  v19 = v25;
  id v20 = v15;

  return v20;
}

- (_DASActivityResultDependencyGroup)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS____DASActivityResultDependencyGroup;
  v6 = -[_DASActivityResultDependencyGroup init](&v30, "init");
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultIdentifier, a3);
    v8 = -[_DASActivityResult initWithIdentifier:]( objc_alloc(&OBJC_CLASS____DASActivityResult),  "initWithIdentifier:",  v5);
    cumulativelyProducedResult = v7->_cumulativelyProducedResult;
    v7->_cumulativelyProducedResult = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cumulativeResultConsumption = v7->_cumulativeResultConsumption;
    v7->_cumulativeResultConsumption = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    consumers = v7->_consumers;
    v7->_consumers = (NSMutableSet *)v12;

    producer = v7->_producer;
    v7->_producer = 0LL;

    uint64_t v15 = BiomeLibrary();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 ActivityScheduler]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 Dependency]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 Result]);
    resultStream = v7->_resultStream;
    v7->_resultStream = (BMStream *)v19;

    id v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.dasd.DependencyGroup.%@", v7->_resultIdentifier));
    v22 = (const char *)[v21 UTF8String];
    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_t v25 = dispatch_queue_create(v22, v24);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v25;

    os_log_t v27 = os_log_create("com.apple.duetactivityscheduler", "ResultDependencyGroup");
    log = v7->_log;
    v7->_log = v27;
  }

  return v7;
}

- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3
{
  resultStream = self->_resultStream;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream configuration](resultStream, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeConfig]);
  id v7 = [v6 protectionClass];

  id v8 = [v4 asBiomeProtectionClass];
  return v8 <= v7;
}

- (void)handleActivitySubmission:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006EB44;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)registerProducer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10006ECB4;
  uint64_t v19 = sub_10006ECC4;
  id v20 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006ECCC;
  v11[3] = &unk_100116A38;
  v11[4] = self;
  id v13 = &v21;
  v14 = &v15;
  id v8 = v6;
  id v12 = v8;
  dispatch_sync(queue, v11);
  if (!*((_BYTE *)v22 + 24) || v16[5])
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B6ED4();
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }

    if (a4) {
LABEL_5:
    }
      *a4 = (id) v16[5];
  }

- (void)deregisterDependent:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006EF30;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)deregisterProducer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10006ECB4;
  uint64_t v19 = sub_10006ECC4;
  id v20 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006F0A0;
  v11[3] = &unk_100116A60;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v21;
  v14 = &v15;
  dispatch_sync(queue, v11);
  if (!*((_BYTE *)v22 + 24) || v16[5])
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B6F40();
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }

    if (a4) {
LABEL_5:
    }
      *a4 = (id) v16[5];
  }

- (BOOL)isDependencySatisfiedForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dependencyForIdentifier:self->_resultIdentifier]);
  if (v5)
  {
    id v6 = objc_msgSend( v5,  "isSatisfiedByAvailableResultCount:",  -[_DASActivityResultDependencyGroup computeNumberOfAvailableResultsForActivity:]( self,  "computeNumberOfAvailableResultsForActivity:",  v4));
    -[_DASActivityResultDependencyGroup updateDependenciesPreClearedOnActivity:withValue:]( self,  "updateDependenciesPreClearedOnActivity:withValue:",  v4,  v6);
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

- (BOOL)reportActivity:(id)a3 consumedResult:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  os_log_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 1;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10006ECB4;
  char v24 = sub_10006ECC4;
  id v25 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006F428;
  block[3] = &unk_100116A88;
  block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v18 = &v20;
  uint64_t v19 = &v26;
  id v12 = v9;
  id v17 = v12;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v27 + 24))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B6FAC();
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    if (a5) {
LABEL_4:
    }
      *a5 = (id) v21[5];
  }

- (BOOL)reportActivity:(id)a3 producedResult:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  os_log_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 1;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10006ECB4;
  char v24 = sub_10006ECC4;
  id v25 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006F878;
  block[3] = &unk_100116AB0;
  block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v18 = &v20;
  id v12 = v9;
  id v17 = v12;
  uint64_t v19 = &v26;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v27 + 24))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B7020();
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    if (a5) {
LABEL_4:
    }
      *a5 = (id) v21[5];
  }

+ (void)resetDependenciesContainingSubstring:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BiomeLibrary();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ActivityScheduler]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 Dependency]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 Result]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 pruner]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006FB74;
  v11[3] = &unk_100116AD8;
  id v12 = v3;
  id v9 = v3;
  [v8 deleteEventsPassingTest:v11];
}

- (void)persistUpdatedResultProductionBy:(id)a3
{
  resultStream = self->_resultStream;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream pruner](resultStream, "pruner"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006FD30;
  v13[3] = &unk_100116AD8;
  v13[4] = self;
  [v6 deleteEventsPassingTest:v13];

  id v7 = objc_alloc(&OBJC_CLASS___BMActivitySchedulerDependencyResult);
  resultIdentifier = self->_resultIdentifier;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[_DASActivityResult count](self->_cumulativelyProducedResult, "count")));
  id v11 = [v7 initWithResultIdentifier:resultIdentifier activityIdentifier:v9 resultCount:v10 type:1];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_resultStream, "source"));
  [v12 sendEvent:v11];
}

- (void)persistUpdatedResultConsumptionBy:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  -[_DASActivityResultDependencyGroup pruneConsumptionEventsForActivityIdentifier:]( self,  "pruneConsumptionEventsForActivityIdentifier:",  v8);

  id v9 = objc_alloc(&OBJC_CLASS___BMActivitySchedulerDependencyResult);
  resultIdentifier = self->_resultIdentifier;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);

  id v12 = [v6 count];
  char v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
  id v15 = [v9 initWithResultIdentifier:resultIdentifier activityIdentifier:v11 resultCount:v13 type:2];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_resultStream, "source"));
  [v14 sendEvent:v15];
}

- (void)pruneConsumptionEventsForActivityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream pruner](self->_resultStream, "pruner"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006FF60;
  v7[3] = &unk_100116B00;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 deleteEventsPassingTest:v7];
}

- (BOOL)queue_isConsumerActivity:(id)a3
{
  return -[NSMutableSet containsObject:](self->_consumers, "containsObject:", a3);
}

- (BOOL)queue_isProducerActivity:(id)a3
{
  producer = self->_producer;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity name](producer, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)queue_aggregateResultConsumptionForActivity:(id)a3
{
  id v4 = a3;
  cumulativeResultConsumption = self->_cumulativeResultConsumption;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v7 = (_DASActivityResult *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cumulativeResultConsumption,  "objectForKeyedSubscript:",  v6));

  if (!v7)
  {
    id v7 = -[_DASActivityResult initWithIdentifier:]( objc_alloc(&OBJC_CLASS____DASActivityResult),  "initWithIdentifier:",  self->_resultIdentifier);
    id v8 = self->_cumulativeResultConsumption;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);
  }

  return v7;
}

- (int64_t)computeNumberOfAvailableResultsForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000701F4;
  block[3] = &unk_1001152D8;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)updateDependenciesPreClearedOnActivity:(id)a3 withValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 dependenciesPreCleared] & 1) == 0 && v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = log;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityResultDependencyGroup description](self, "description"));
      int v10 = 136315650;
      id v11 = "-[_DASActivityResultDependencyGroup updateDependenciesPreClearedOnActivity:withValue:]";
      __int16 v12 = 2112;
      char v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %@ dependency has been satisfied on %@, marking as pre-cleared",  (uint8_t *)&v10,  0x20u);
    }
  }

  objc_msgSend(v6, "setDependenciesPreCleared:", objc_msgSend(v6, "dependenciesPreCleared") | v4);
}

- (void)resetAccumulation
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000703BC;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)dictionary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  queue = (dispatch_queue_s *)self->_queue;
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1000706C0;
  id v17 = &unk_100115120;
  id v18 = self;
  id v6 = v3;
  id v19 = v6;
  id v7 = v4;
  id v20 = v7;
  dispatch_sync(queue, &v14);
  cumulativelyProducedResult = self->_cumulativelyProducedResult;
  v22[0] = self->_resultIdentifier;
  v21[0] = @"resultIdentifier";
  v21[1] = @"producedResults";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[_DASActivityResult count](cumulativelyProducedResult, "count", v14, v15, v16, v17, v18)));
  v22[1] = v9;
  v22[2] = v6;
  v21[2] = @"consumedResults";
  v21[3] = @"registeredConsumers";
  v22[3] = v7;
  v21[4] = @"registeredProducer";
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity name](self->_producer, "name"));
  id v11 = v10;
  if (!v10) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  void v22[4] = v11;
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  5LL));
  if (!v10) {

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithIdentifier:",  self->_resultIdentifier);
  id v6 = -[_DASActivityResult copyWithZone:](self->_cumulativelyProducedResult, "copyWithZone:", a3);
  [v5 setCumulativelyProducedResult:v6];

  id v7 = -[NSMutableDictionary copyWithZone:](self->_cumulativeResultConsumption, "copyWithZone:", a3);
  [v5 setCumulativeResultConsumption:v7];

  id v8 = -[NSMutableSet copyWithZone:](self->_consumers, "copyWithZone:", a3);
  [v5 setConsumers:v8];

  id v9 = -[_DASActivity copyWithZone:](self->_producer, "copyWithZone:", a3);
  [v5 setProducer:v9];

  return v5;
}

- (NSString)description
{
  id v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> Identifier: %@, ",  objc_opt_class(self),  self,  self->_resultIdentifier);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070A3C;
  block[3] = &unk_100115148;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  dispatch_sync(queue, block);
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  id v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> Identifier: %@, ",  objc_opt_class(self),  self,  self->_resultIdentifier);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070B50;
  block[3] = &unk_100115148;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  dispatch_sync(queue, block);
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (_DASActivityResult)cumulativelyProducedResult
{
  return (_DASActivityResult *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCumulativelyProducedResult:(id)a3
{
}

- (NSMutableDictionary)cumulativeResultConsumption
{
  return self->_cumulativeResultConsumption;
}

- (void)setCumulativeResultConsumption:(id)a3
{
}

- (NSMutableSet)consumers
{
  return self->_consumers;
}

- (void)setConsumers:(id)a3
{
}

- (_DASActivity)producer
{
  return self->_producer;
}

- (void)setProducer:(id)a3
{
}

- (BMStream)resultStream
{
  return self->_resultStream;
}

- (void)setResultStream:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)groupFromDefaultsWithoutCreation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"DependencyGroupPersistence"));
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v6 = BiomeLibrary();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ActivityScheduler]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 Dependency]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 Result]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 publisher]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100070EDC;
  v22[3] = &unk_1001169E8;
  id v12 = v4;
  id v23 = v12;
  char v13 = (void *)objc_claimAutoreleasedReturnValue([v11 filterWithIsIncluded:v22]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100070F34;
  v20[3] = &unk_1001166A8;
  id v14 = v5;
  id v21 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100070F8C;
  v19[3] = &unk_100116B28;
  v19[4] = &v24;
  id v15 = [v13 sinkWithCompletion:v20 shouldContinue:v19];

  if (*((_BYTE *)v25 + 24))
  {
    id v16 = [(id)objc_opt_class(a1) groupFromPersistence:v12];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    id v17 = 0LL;
  }

  _Block_object_dispose(&v24, 8);
  return v17;
}

@end