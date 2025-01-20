@interface RPMetrics
+ (id)sharedMetrics;
+ (id)sharedMetricsNoCreate;
- (NSMutableDictionary)awdlBrowseMetrics;
- (NSMutableDictionary)needsAWDLAdvertisementMetrics;
- (OS_dispatch_queue)dispatchQueue;
- (RPMetrics)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 timeBegin:(double)a7 timeEnd:(double)a8 bytesAdded:(unint64_t)a9 messagesAdded:(unint64_t)a10;
- (void)_reportMetrics;
- (void)activate;
- (void)invalidate;
- (void)logAWDLBrowseClient:(id)a3;
- (void)logNeedsAWDLAdvertisementClient:(id)a3 actionType:(unsigned __int8)a4 bluetoothType:(unsigned __int8)a5;
- (void)logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 ctx:(id *)a7;
- (void)setAwdlBrowseMetrics:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNeedsAWDLAdvertisementMetrics:(id)a3;
@end

@implementation RPMetrics

+ (id)sharedMetrics
{
  if (qword_1001334F8 != -1) {
    dispatch_once(&qword_1001334F8, &stru_100113908);
  }
  return (id)qword_1001334F0;
}

+ (id)sharedMetricsNoCreate
{
  return (id)qword_1001334F0;
}

- (RPMetrics)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RPMetrics;
  v2 = -[RPMetrics init](&v22, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    awdlBrowseMetrics = v3->_awdlBrowseMetrics;
    v3->_awdlBrowseMetrics = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    needsAWDLAdvertisementMetrics = v3->_needsAWDLAdvertisementMetrics;
    v3->_needsAWDLAdvertisementMetrics = v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);

    dispatch_queue_t v12 = dispatch_queue_create("RPMetrics", v11);
    reportQueue = v3->_reportQueue;
    v3->_reportQueue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v3->_reportQueue);
    reportTimer = v3->_reportTimer;
    v3->_reportTimer = (OS_dispatch_source *)v14;

    v16 = (dispatch_source_s *)v3->_reportTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006FB5C;
    handler[3] = &unk_1001110A8;
    v17 = v3;
    v21 = v17;
    dispatch_source_set_event_handler(v16, handler);
    CUDispatchTimerSet(v3->_reportTimer, 14400.0, 14400.0, -4.0);
    dispatch_resume((dispatch_object_t)v3->_reportTimer);
    v18 = v17;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  return 0LL;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006FBC4;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
}

- (void)invalidate
{
}

- (void)logAWDLBrowseClient:(id)a3
{
  id v4 = a3;
  reportQueue = (dispatch_queue_s *)self->_reportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006FD18;
  v7[3] = &unk_100111968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(reportQueue, v7);
}

- (void)logNeedsAWDLAdvertisementClient:(id)a3 actionType:(unsigned __int8)a4 bluetoothType:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  id v8 = a3;
  v9 = v8;
  if (v8 && v6 && v5)
  {
    reportQueue = (dispatch_queue_s *)self->_reportQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006FE6C;
    block[3] = &unk_100113950;
    char v14 = v6;
    char v15 = v5;
    id v12 = v8;
    v13 = self;
    dispatch_async(reportQueue, block);
  }
}

- (void)logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 ctx:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  unint64_t var1 = a7->var1;
  unint64_t v16 = CFDictionaryGetInt64(v13, @"length", 0LL) + var1;
  a7->unint64_t var1 = v16;
  unint64_t v17 = a7->var2 + 1;
  a7->var2 = v17;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double var0 = a7->var0;
  if (Current - a7->var0 >= 60.0)
  {
    a7->double var0 = Current;
    a7->unint64_t var1 = 0LL;
    a7->var2 = 0LL;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000700B8;
    block[3] = &unk_100113978;
    void block[4] = self;
    int v29 = a3;
    id v22 = v12;
    id v23 = v13;
    id v24 = v14;
    double v25 = var0;
    CFAbsoluteTime v26 = Current;
    unint64_t v27 = v16;
    unint64_t v28 = v17;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 timeBegin:(double)a7 timeEnd:(double)a8 bytesAdded:(unint64_t)a9 messagesAdded:(unint64_t)a10
{
  uint64_t v15 = *(void *)&a3;
  if (a7 == 0.0) {
    double v16 = a8;
  }
  else {
    double v16 = a7;
  }
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  int v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v17, @"appID");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v20, @"bytes");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v19, @"identifier");
  uint64_t NSNumber = NSDictionaryGetNSNumber(v18, @"dlt", 0LL);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v22, @"linkType");

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v23, @"messages");

  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v18, @"senderIDS", TypeID, 0LL);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  TypedValue,  @"senderID");
  CFAbsoluteTime v26 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  v16);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v26, @"timeBegin");

  unint64_t v27 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  a8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v27, @"timeEnd");

  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v28, @"type");

  if (qword_100133500 != -1) {
    dispatch_once(&qword_100133500, &stru_100113998);
  }
  if (qword_100133508 && dlsym((void *)qword_100133508, "PLLogRegisteredEvent"))
  {
    if (dword_100132360 <= 10
      && (dword_100132360 != -1 || _LogCategory_Initialize(&dword_100132360, 10LL)))
    {
      LogPrintF( &dword_100132360,  "-[RPMetrics _logReceivedMessageType:identifier:options:appID:timeBegin:timeEnd:bytesAdded:messagesAdded:]",  10LL,  "PowerLog: %@, %##@\n",  @"com.apple.rapport.receivedEvent",  v29);
    }

    off_1001323D0(91LL, (uint64_t)@"com.apple.rapport.receivedEvent", (uint64_t)v29, 0LL);
  }
}

- (void)_reportMetrics
{
  if (self->_sendReport)
  {
    v2 = self;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_awdlBrowseMetrics, "allKeys"));
    id v4 = [v3 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
          v40[0] = @"browseCount";
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_awdlBrowseMetrics, "objectForKey:", v8));
          v40[1] = @"client";
          v41[0] = v9;
          v41[1] = v8;
          dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));

          CUMetricsLog(@"com.apple.rapport.metrics.AWDL.browse", v10);
        }

        id v5 = [v3 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }

      while (v5);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_needsAWDLAdvertisementMetrics, "allKeys"));
    id v28 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v30;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@","]);
          v37[0] = @"advCount";
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_needsAWDLAdvertisementMetrics, "objectForKey:", v12));
          v38[0] = v14;
          v37[1] = @"actionType";
          uint64_t v15 = v2;
          double v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v16 intValue]));
          v38[1] = v17;
          v37[2] = @"bluetoothType";
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:1]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v18 intValue]));
          v38[2] = v19;
          v37[3] = @"client";
          v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:2]);
          v38[3] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  4LL));

          v2 = v15;
          CUMetricsLog(@"com.apple.rapport.metrics.needsAWDL.btAdv", v21);
        }

        id v28 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      }

      while (v28);
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    awdlBrowseMetrics = v2->_awdlBrowseMetrics;
    v2->_awdlBrowseMetrics = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    needsAWDLAdvertisementMetrics = v2->_needsAWDLAdvertisementMetrics;
    v2->_needsAWDLAdvertisementMetrics = (NSMutableDictionary *)v24;

    v2->_sendReport = 0;
  }

- (NSMutableDictionary)awdlBrowseMetrics
{
  return self->_awdlBrowseMetrics;
}

- (void)setAwdlBrowseMetrics:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)needsAWDLAdvertisementMetrics
{
  return self->_needsAWDLAdvertisementMetrics;
}

- (void)setNeedsAWDLAdvertisementMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end