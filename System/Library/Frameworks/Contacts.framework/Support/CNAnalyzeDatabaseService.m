@interface CNAnalyzeDatabaseService
+ (id)log;
+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3 withName:(id)a4 qualityOfService:(unint64_t)a5;
+ (id)sharedInstance;
- (CNAnalyzeDatabaseService)init;
- (CNCancelable)analyzingToken;
- (CNCancelable)coalescingToken;
- (CNPublishingSubject)analyzer;
- (CNPublishingSubject)coalescer;
- (CNScheduler)highPriorityWorkQueue;
- (CNScheduler)lowPriorityWorkQueue;
- (id)interestedNotifications;
- (void)handleAnalyzingEvent:(id)a3;
- (void)handleCoalescedShouldAnalyzeEvent:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)setAnalyzer:(id)a3;
- (void)setAnalyzingToken:(id)a3;
- (void)setCoalescer:(id)a3;
- (void)setCoalescingToken:(id)a3;
@end

@implementation CNAnalyzeDatabaseService

+ (id)log
{
  if (qword_10001F5A0 != -1) {
    dispatch_once(&qword_10001F5A0, &stru_1000189F0);
  }
  return (id)qword_10001F5A8;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000085F0;
  block[3] = &unk_100018A10;
  block[4] = a1;
  if (qword_10001F5B0 != -1) {
    dispatch_once(&qword_10001F5B0, block);
  }
  return (id)qword_10001F5B8;
}

- (CNAnalyzeDatabaseService)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CNAnalyzeDatabaseService;
  v2 = -[CNAnalyzeDatabaseService init](&v28, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNSchedulerProvider defaultProvider](&OBJC_CLASS___CNSchedulerProvider, "defaultProvider"));
    id v6 = objc_msgSend( (id)objc_opt_class(v2, v4, v5),  "makeWorkQueueUsingSchedulerProvider:withName:qualityOfService:",  v3,  @"com.apple.contactsd.AnalyzeDatabase.lowpriority",  2);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    lowPriorityWorkQueue = v2->_lowPriorityWorkQueue;
    v2->_lowPriorityWorkQueue = (CNScheduler *)v7;

    id v11 = objc_msgSend( (id)objc_opt_class(v2, v9, v10),  "makeWorkQueueUsingSchedulerProvider:withName:qualityOfService:",  v3,  @"com.apple.contactsd.AnalyzeDatabase.highpriority",  4);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    highPriorityWorkQueue = v2->_highPriorityWorkQueue;
    v2->_highPriorityWorkQueue = (CNScheduler *)v12;

    v14 = objc_alloc_init(&OBJC_CLASS___CNPublishingSubject);
    analyzer = v2->_analyzer;
    v2->_analyzer = v14;

    v16 = v2->_analyzer;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[CNObserver observerWithWeakTarget:resultSelector:]( &OBJC_CLASS___CNObserver,  "observerWithWeakTarget:resultSelector:",  v2,  "handleAnalyzingEvent:"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[CNPublishingSubject subscribe:](v16, "subscribe:", v17));
    analyzingToken = v2->_analyzingToken;
    v2->_analyzingToken = (CNCancelable *)v18;

    v20 = objc_alloc_init(&OBJC_CLASS___CNPublishingSubject);
    coalescer = v2->_coalescer;
    v2->_coalescer = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue( -[CNPublishingSubject throttle:options:schedulerProvider:]( v2->_coalescer,  "throttle:options:schedulerProvider:",  1LL,  v3,  60.0));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[CNObserver observerWithWeakTarget:resultSelector:]( &OBJC_CLASS___CNObserver,  "observerWithWeakTarget:resultSelector:",  v2,  "handleCoalescedShouldAnalyzeEvent:"));
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 subscribe:v23]);
    coalescingToken = v2->_coalescingToken;
    v2->_coalescingToken = (CNCancelable *)v24;

    v26 = v2;
  }

  return v2;
}

+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3 withName:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6 = [a3 newSerialSchedulerWithName:a4];
  id v7 = [[CNQualityOfServiceSchedulerDecorator alloc] initWithScheduler:v6 qualityOfService:a5];

  return v7;
}

- (id)interestedNotifications
{
  v3[0] = @"__ABDataBaseChangedByOtherProcessNotification";
  v3[1] = @"com.apple.datamigrator.migrationDidFinish";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

- (void)handleNotificationName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNAnalyzeDatabaseService interestedNotifications](self, "interestedNotifications"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNAnalyzeDatabaseService lowPriorityWorkQueue](self, "lowPriorityWorkQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000891C;
    v8[3] = &unk_100018A38;
    v8[4] = self;
    [v7 performBlock:v8];
  }

- (void)handleCoalescedShouldAnalyzeEvent:(id)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2, a3), "log");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contactStore]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNAnalyzeDatabaseService lowPriorityWorkQueue](self, "lowPriorityWorkQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008A50;
  v11[3] = &unk_100018A60;
  id v12 = v5;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v5;
  [v8 performBlock:v11];
}

- (void)handleAnalyzingEvent:(id)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2, a3), "log");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contactStore]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNAnalyzeDatabaseService highPriorityWorkQueue](self, "highPriorityWorkQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008C20;
  v11[3] = &unk_100018A88;
  id v12 = v5;
  id v13 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 performBlock:v11];
}

- (CNPublishingSubject)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (CNCancelable)coalescingToken
{
  return self->_coalescingToken;
}

- (void)setCoalescingToken:(id)a3
{
}

- (CNPublishingSubject)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
}

- (CNCancelable)analyzingToken
{
  return self->_analyzingToken;
}

- (void)setAnalyzingToken:(id)a3
{
}

- (CNScheduler)lowPriorityWorkQueue
{
  return self->_lowPriorityWorkQueue;
}

- (CNScheduler)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (void).cxx_destruct
{
}

@end