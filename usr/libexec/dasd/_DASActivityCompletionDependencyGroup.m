@interface _DASActivityCompletionDependencyGroup
+ (id)groupFromPersistence:(id)a3;
+ (id)groupFromPersistenceWithoutCreation:(id)a3;
+ (void)resetDependenciesContainingSubstring:(id)a3;
- (BMStream)completionStream;
- (BOOL)hasDependencyRun;
- (BOOL)isDependencySatisfiedForActivity:(id)a3;
- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3;
- (NSMutableSet)dependents;
- (NSMutableSet)haveRunActivities;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)trackedActivityIdentifier;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASActivityCompletionDependencyGroup)initWithTrackedActivityIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (void)deregisterDependent:(id)a3;
- (void)handleActivitySubmission:(id)a3;
- (void)persistActivityDidConsume:(id)a3;
- (void)persistTrackedActivityDidRun:(id)a3;
- (void)pruneStreamOfGroup;
- (void)reportDependentActivityDidRun:(id)a3;
- (void)reportTrackedActivityDidRun:(id)a3;
- (void)resetAccumulation;
- (void)setCompletionStream:(id)a3;
- (void)setDependents:(id)a3;
- (void)setHasDependencyRun:(BOOL)a3;
- (void)setHaveRunActivities:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateStreamForTrackedActivityDidRun:(id)a3;
@end

@implementation _DASActivityCompletionDependencyGroup

+ (id)groupFromPersistence:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithTrackedActivityIdentifier:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"DependencyGroupPersistence"));
  uint64_t v7 = BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ActivityScheduler]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 Dependency]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 Completion]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 publisher]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100071784;
  v26[3] = &unk_1001169E8;
  id v27 = v4;
  id v13 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 filterWithIsIncluded:v26]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000717DC;
  v24[3] = &unk_1001166A8;
  id v25 = v6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100071834;
  v21[3] = &unk_100116B50;
  id v22 = v25;
  id v15 = v5;
  id v23 = v15;
  id v16 = v25;
  id v17 = [v14 sinkWithCompletion:v24 receiveInput:v21];

  v18 = v23;
  id v19 = v15;

  return v19;
}

- (_DASActivityCompletionDependencyGroup)initWithTrackedActivityIdentifier:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS____DASActivityCompletionDependencyGroup;
  v6 = -[_DASActivityCompletionDependencyGroup init](&v27, "init");
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trackedActivityIdentifier, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    dependents = v7->_dependents;
    v7->_dependents = (NSMutableSet *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    haveRunActivities = v7->_haveRunActivities;
    v7->_haveRunActivities = (NSMutableSet *)v10;

    v7->_hasDependencyRun = 0;
    uint64_t v12 = BiomeLibrary();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ActivityScheduler]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 Dependency]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 Completion]);
    completionStream = v7->_completionStream;
    v7->_completionStream = (BMStream *)v16;

    id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.dasd.CompletionDependencyGroup.%@", v5));
    id v19 = (const char *)[v18 UTF8String];
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create(v19, v21);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v22;

    os_log_t v24 = os_log_create("com.apple.duetactivityscheduler", "CompletionDependencyGroup");
    log = v7->_log;
    v7->_log = v24;
  }

  return v7;
}

- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3
{
  completionStream = self->_completionStream;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream configuration](completionStream, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeConfig]);
  id v7 = [v6 protectionClass];

  id v8 = [v4 asBiomeProtectionClass];
  return v8 <= v7;
}

- (void)handleActivitySubmission:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    trackedActivityIdentifier = self->_trackedActivityIdentifier;
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[_DASActivityCompletionDependencyGroup handleActivitySubmission:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = trackedActivityIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Adding %@ to tracked dependents for %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100071C20;
  v9[3] = &unk_100115148;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(queue, v9);
}

- (void)deregisterDependent:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    trackedActivityIdentifier = self->_trackedActivityIdentifier;
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[_DASActivityCompletionDependencyGroup deregisterDependent:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = trackedActivityIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Removing %@ from tracked dependents for %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100071D48;
  v9[3] = &unk_100115148;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(queue, v9);
}

- (void)reportTrackedActivityDidRun:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100071DD0;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)reportDependentActivityDidRun:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100071E84;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)isDependencySatisfiedForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100071FA0;
  block[3] = &unk_1001154E8;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(queue, block);
  BOOL hasDependencyRun = 0;
  if (!*((_BYTE *)v13 + 24)) {
    BOOL hasDependencyRun = self->_hasDependencyRun;
  }

  _Block_object_dispose(&v12, 8);
  return hasDependencyRun;
}

- (void)resetAccumulation
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007204C;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)dictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  queue = (dispatch_queue_s *)self->_queue;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_100072208;
  char v15 = &unk_100115120;
  uint64_t v16 = self;
  id v17 = v3;
  id v18 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(queue, &v12);
  trackedActivityIdentifier = self->_trackedActivityIdentifier;
  v19[0] = @"trackedActivityIdentifier";
  v19[1] = @"dependents";
  v20[0] = trackedActivityIdentifier;
  v20[1] = v7;
  v20[2] = v6;
  v19[2] = @"haveRunIdentifiers";
  v19[3] = @"hasDependencyRun";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_hasDependencyRun,  v12,  v13,  v14,  v15,  v16));
  v20[3] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));

  return v10;
}

+ (void)resetDependenciesContainingSubstring:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BiomeLibrary();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ActivityScheduler]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 Dependency]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 Completion]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 pruner]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100072484;
  v11[3] = &unk_100116AD8;
  id v12 = v3;
  id v9 = v3;
  [v8 deleteEventsPassingTest:v11];
}

- (void)updateStreamForTrackedActivityDidRun:(id)a3
{
  id v4 = a3;
  -[_DASActivityCompletionDependencyGroup pruneStreamOfGroup](self, "pruneStreamOfGroup");
  -[_DASActivityCompletionDependencyGroup persistTrackedActivityDidRun:](self, "persistTrackedActivityDidRun:", v4);
}

- (void)pruneStreamOfGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream pruner](self->_completionStream, "pruner"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000725D8;
  v4[3] = &unk_100116AD8;
  v4[4] = self;
  [v3 deleteEventsPassingTest:v4];
}

- (void)persistTrackedActivityDidRun:(id)a3
{
  id v5 = [[BMActivitySchedulerDependencyCompletion alloc] initWithIdentifier:self->_trackedActivityIdentifier consumerIdentifier:0 type:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_completionStream, "source"));
  [v4 sendEvent:v5];
}

- (void)persistActivityDidConsume:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___BMActivitySchedulerDependencyCompletion);
  trackedActivityIdentifier = self->_trackedActivityIdentifier;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  id v9 = [v5 initWithIdentifier:trackedActivityIdentifier consumerIdentifier:v7 type:2];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_completionStream, "source"));
  [v8 sendEvent:v9];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithTrackedActivityIdentifier:",  self->_trackedActivityIdentifier);
  id v6 = -[NSMutableSet copyWithZone:](self->_dependents, "copyWithZone:", a3);
  [v5 setDependents:v6];

  id v7 = -[NSMutableSet copyWithZone:](self->_haveRunActivities, "copyWithZone:", a3);
  [v5 setHaveRunActivities:v7];

  [v5 setHasDependencyRun:self->_hasDependencyRun];
  return v5;
}

- (NSString)description
{
  id v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> Identifier: %@, ",  objc_opt_class(self),  self,  self->_trackedActivityIdentifier);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072888;
  block[3] = &unk_100115148;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  dispatch_sync(queue, block);
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  id v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> Identifier: %@, ",  objc_opt_class(self),  self,  self->_trackedActivityIdentifier);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000729B4;
  block[3] = &unk_100115148;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  dispatch_sync(queue, block);
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)trackedActivityIdentifier
{
  return self->_trackedActivityIdentifier;
}

- (NSMutableSet)dependents
{
  return self->_dependents;
}

- (void)setDependents:(id)a3
{
}

- (NSMutableSet)haveRunActivities
{
  return self->_haveRunActivities;
}

- (void)setHaveRunActivities:(id)a3
{
}

- (BOOL)hasDependencyRun
{
  return self->_hasDependencyRun;
}

- (void)setHasDependencyRun:(BOOL)a3
{
  self->_BOOL hasDependencyRun = a3;
}

- (BMStream)completionStream
{
  return self->_completionStream;
}

- (void)setCompletionStream:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
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

+ (id)groupFromPersistenceWithoutCreation:(id)a3
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
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 Completion]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 publisher]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100072D10;
  v22[3] = &unk_1001169E8;
  id v12 = v4;
  id v23 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 filterWithIsIncluded:v22]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100072D68;
  v20[3] = &unk_1001166A8;
  id v14 = v5;
  id v21 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100072DC0;
  v19[3] = &unk_100116B28;
  void v19[4] = &v24;
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