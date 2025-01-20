@interface MRDProactivePrepareForSetQueueSender
- (MRDProactivePrepareForSetQueueSender)init;
- (id)systemMediaAppPlayerPathForNotification:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_initialize;
- (void)_onQueue_sendPrepareForSetQueueTo:(id)a3 reason:(id)a4 type:(int64_t)a5;
- (void)dealloc;
- (void)handleFirstLaunchAfterBootIfNeeded;
- (void)registerForChanges;
- (void)unregisterForChanges;
@end

@implementation MRDProactivePrepareForSetQueueSender

- (MRDProactivePrepareForSetQueueSender)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRDProactivePrepareForSetQueueSender;
  v2 = -[MRDProactivePrepareForSetQueueSender init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v8;

    -[MRDProactivePrepareForSetQueueSender _initialize](v3, "_initialize");
  }

  return v3;
}

- (void)_initialize
{
  uint64_t v3 = _MRLogForCategory(2LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    dispatch_queue_attr_t v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDPPFSQS] <%p> Initializing",  (uint8_t *)&v5,  0xCu);
  }

  -[MRDProactivePrepareForSetQueueSender handleFirstLaunchAfterBootIfNeeded](self, "handleFirstLaunchAfterBootIfNeeded");
  -[MRDProactivePrepareForSetQueueSender registerForChanges](self, "registerForChanges");
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(2LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDPPFSQS] <%p> Deallocating.", buf, 0xCu);
  }

  -[MRDProactivePrepareForSetQueueSender unregisterForChanges](self, "unregisterForChanges");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDProactivePrepareForSetQueueSender;
  -[MRDProactivePrepareForSetQueueSender dealloc](&v5, "dealloc");
}

- (void)registerForChanges
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
}

- (void)unregisterForChanges
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011C648;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (id)systemMediaAppPlayerPathForNotification:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMROriginActiveNowPlayingPlayerPathUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 origin]);
  if (v8 || (id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin])) != 0)
  {
    v9 = objc_alloc(&OBJC_CLASS___MRClient);
    v10 = -[MRClient initWithBundleIdentifier:]( v9,  "initWithBundleIdentifier:",  kMRMediaRemoteSystemMediaApplicationDisplayIdentifier);
    objc_super v11 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v8,  v10,  0LL);
  }

  else
  {
    objc_super v11 = 0LL;
  }

  return v11;
}

- (void)handleFirstLaunchAfterBootIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011CB20;
  block[3] = &unk_100399250;
  block[4] = self;
  if (qword_1003FE050 != -1) {
    dispatch_once(&qword_1003FE050, block);
  }
}

- (void)_onQueue_sendPrepareForSetQueueTo:(id)a3 reason:(id)a4 type:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v26[0] = kMRMediaRemoteOptionPrepareForSetQueueIsProactive;
  v26[1] = kMRMediaRemoteOptionPrepareForSetQueueProactiveReason;
  v27[0] = &__kCFBooleanTrue;
  v27[1] = v8;
  v26[2] = MRMediaRemoteOptionPrepareForSetQueueProactiveReasonType;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  v27[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v12 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"proactivePrepareForSetQueue",  v8);
  v14 = v12;
  if (v7) {
    -[NSMutableString appendFormat:](v12, "appendFormat:", @" for %@", v7);
  }
  uint64_t v15 = _MRLogForCategory(10LL, v13);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10011CF80;
  v21[3] = &unk_1003999E8;
  id v22 = v8;
  id v23 = v11;
  id v19 = v11;
  id v20 = v8;
  MRMediaRemoteSendCommandToPlayerWithResult(132LL, v10, v7, 1LL, v18, v21);
}

- (void).cxx_destruct
{
}

@end