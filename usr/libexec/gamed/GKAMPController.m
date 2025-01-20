@interface GKAMPController
+ (id)controller;
- (AMSBag)bag;
- (AMSMetrics)metrics;
- (BOOL)isSetup;
- (GKAMPController)initWithHasAcknowledgedLatestGDPRBlock:(id)a3 bagChanged:(id)a4;
- (GKMultiplayerActivityEventFilter)mafEventFilter;
- (NSDictionary)metadata;
- (OS_dispatch_queue)serialQueue;
- (_TtC14GameDaemonCore17GKMetricsPipeline)metricsPipeline;
- (id)bagChanged;
- (id)hasAcknowledgedLatestGDPRBlock;
- (void)createBagIfNecessary;
- (void)getBagWithCompletion:(id)a3;
- (void)reportClickStreamEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4;
- (void)reportFriendInviteActivityEventAtStage:(unint64_t)a3 hostApp:(id)a4;
- (void)reportLoadUrlMetricsEventWithMetricsFields:(id)a3;
- (void)reportMetricsEventWithTopic:(id)a3 hostAppBundleId:(id)a4 shouldFlush:(id)a5 metricsFields:(id)a6;
- (void)reportMultiplayerActivityEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4;
- (void)reportPerformanceEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4;
- (void)reportURLSessionEventWithTask:(id)a3 metrics:(id)a4;
- (void)setBag:(id)a3;
- (void)setBagChanged:(id)a3;
- (void)setHasAcknowledgedLatestGDPRBlock:(id)a3;
- (void)setMafEventFilter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMetricsPipeline:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setupAsyncWithStoreBag:(id)a3 withCompletion:(id)a4;
- (void)tearDown;
- (void)updateMetadataWithLocalPlayer:(id)a3;
@end

@implementation GKAMPController

+ (id)controller
{
  if (qword_1002BB730 != -1) {
    dispatch_once(&qword_1002BB730, &stru_100272E40);
  }
  return (id)qword_1002BB728;
}

- (GKAMPController)initWithHasAcknowledgedLatestGDPRBlock:(id)a3 bagChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GKAMPController;
  v8 = -[GKAMPController init](&v17, "init");
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id hasAcknowledgedLatestGDPRBlock = v8->_hasAcknowledgedLatestGDPRBlock;
    v8->_id hasAcknowledgedLatestGDPRBlock = v9;

    id v11 = objc_retainBlock(v7);
    id bagChanged = v8->_bagChanged;
    v8->_id bagChanged = v11;

    metadata = v8->_metadata;
    v8->_metadata = (NSDictionary *)&__NSDictionary0__struct;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.GameKit.ampController.serialQueue", 0LL);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v14;
  }

  return v8;
}

- (void)getBagWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100101D30;
  v7[3] = &unk_10026B310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createBagIfNecessary
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
    id v8 = dispatch_queue_get_label(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKAMPController createBagIfNecessary]",  label,  v8,  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/AMP/GKAMPController.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]",  v10,  "-[GKAMPController createBagIfNecessary]",  [v12 UTF8String],  91));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController bag](self, "bag"));
  if (!v14)
  {
    v16 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v17 = (id)GKOSLoggers(v15);
      v16 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Creating bag", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"GameCenterD",  @"1"));
    -[GKAMPController setBag:](self, "setBag:", v18);

    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[GKAMPController bagChanged](self, "bagChanged"));
    v19[2]();
  }

- (void)setupAsyncWithStoreBag:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100102110;
  block[3] = &unk_10026B148;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)updateMetadataWithLocalPlayer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = -[GKMetricsIntBucketer initWithBuckets:]( objc_alloc(&OBJC_CLASS___GKMetricsIntBucketer),  "initWithBuckets:",  &off_100288700);
    id v6 = -[GKMetricsIntBucketer initWithBuckets:]( objc_alloc(&OBJC_CLASS___GKMetricsIntBucketer),  "initWithBuckets:",  &off_100288718);
    v20[0] = @"friendCount";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  -[GKMetricsIntBucketer clamp:](v5, "clamp:", [v4 numberOfFriends])));
    v20[1] = @"gameCount";
    v21[0] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  -[GKMetricsIntBucketer clamp:](v6, "clamp:", [v4 numberOfGames])));
    v21[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    -[GKAMPController setMetadata:](self, "setMetadata:", v9);

    id v11 = (void *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v12 = (id)GKOSLoggers(v10);
      id v11 = (void *)os_log_GKGeneral;
    }

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      id v13 = v11;
      dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metadata](self, "metadata"));
      int v18 = 138412290;
      v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Updated metrics with metadata: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    id v15 = -[GKAMPController setMetadata:](self, "setMetadata:", 0LL);
    v16 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v17 = (id)GKOSLoggers(v15);
      v16 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Reset metrics metadata", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)tearDown
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
    id v8 = dispatch_queue_get_label(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKAMPController tearDown]",  label,  v8,  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/AMP/GKAMPController.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]",  v10,  "-[GKAMPController tearDown]",  [v12 UTF8String],  153));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  BOOL v14 = -[GKAMPController isSetup](self, "isSetup");
  if (v14)
  {
    id v15 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v16 = (id)GKOSLoggers(v14);
      id v15 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tearing down metrics", buf, 2u);
    }

    -[GKAMPController setMetricsPipeline:](self, "setMetricsPipeline:", 0LL);
    -[GKAMPController setMetrics:](self, "setMetrics:", 0LL);
  }

- (BOOL)isSetup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metricsPipeline](self, "metricsPipeline"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metrics](self, "metrics"));
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)reportMetricsEventWithTopic:(id)a3 hostAppBundleId:(id)a4 shouldFlush:(id)a5 metricsFields:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = v13;
  id v15 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v16 = (id)GKOSLoggers(v13);
    id v15 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Metrics event added to queue", v18, 2u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metricsPipeline](self, "metricsPipeline"));
  objc_msgSend( v17,  "processEventWithTopic:shouldFlush:metricsFields:hostAppBundleId:completionHandler:",  v10,  objc_msgSend(v12, "BOOLValue"),  v14,  v11,  &stru_100272EE0);
}

- (void)reportClickStreamEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
}

- (void)reportPerformanceEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
}

- (void)reportMultiplayerActivityEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController mafEventFilter](self, "mafEventFilter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001029D0;
  v10[3] = &unk_100270F68;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 filterEventWithMetricsFields:v7 completionHandler:v10];
}

- (void)reportLoadUrlMetricsEventWithMetricsFields:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metadata](self, "metadata"));
  [v4 addEntriesFromDictionary:v5];

  uint64_t v6 = GKDaemonIdentifier;
  v9[0] = @"app";
  v9[1] = @"topic";
  uint64_t v7 = GKReporterGCPerformanceTopic;
  v10[0] = GKDaemonIdentifier;
  v10[1] = GKReporterGCPerformanceTopic;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  [v4 addEntriesFromDictionary:v8];

  -[GKAMPController reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:]( self,  "reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:",  v7,  v6,  &__kCFBooleanFalse,  v4);
}

- (void)reportFriendInviteActivityEventAtStage:(unint64_t)a3 hostApp:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[GKFriendInviteActivityEvent metricsFieldsForStage:hostApp:]( &OBJC_CLASS___GKFriendInviteActivityEvent,  "metricsFieldsForStage:hostApp:",  a3,  v6));
  id v8 = (void *)v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (void *)os_log_GKFriending;
  if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKFriendInviteActivityEvent stringForStage:]( &OBJC_CLASS___GKFriendInviteActivityEvent,  "stringForStage:",  a3));
    int v13 = 138412290;
    BOOL v14 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "GKAMPController: Reporting inviteActivity stage %@",  (uint8_t *)&v13,  0xCu);
  }

  -[GKAMPController reportClickStreamEventWithHostAppBundleId:metricsFields:]( self,  "reportClickStreamEventWithHostAppBundleId:metricsFields:",  v6,  v8);
}

- (AMSBag)bag
{
  return (AMSBag *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBag:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMetadata:(id)a3
{
}

- (AMSMetrics)metrics
{
  return (AMSMetrics *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMetrics:(id)a3
{
}

- (_TtC14GameDaemonCore17GKMetricsPipeline)metricsPipeline
{
  return (_TtC14GameDaemonCore17GKMetricsPipeline *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMetricsPipeline:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (id)hasAcknowledgedLatestGDPRBlock
{
  return self->_hasAcknowledgedLatestGDPRBlock;
}

- (void)setHasAcknowledgedLatestGDPRBlock:(id)a3
{
}

- (id)bagChanged
{
  return self->_bagChanged;
}

- (void)setBagChanged:(id)a3
{
}

- (GKMultiplayerActivityEventFilter)mafEventFilter
{
  return self->_mafEventFilter;
}

- (void)setMafEventFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)reportURLSessionEventWithTask:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10017C694(v6, v7);
}

@end