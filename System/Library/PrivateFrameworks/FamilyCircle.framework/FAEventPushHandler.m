@interface FAEventPushHandler
- (BOOL)shouldProcess:(id)a3;
- (FAEventPushHandler)init;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (void)_deliverNotificationWithResponse:(id)a3 payload:(id)a4;
- (void)process:(id)a3;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
@end

@implementation FAEventPushHandler

- (FAEventPushHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FAEventPushHandler;
  v2 = -[FAEventPushHandler init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"f_delete",  @"f_member_upd",  @"f_child_transfer_apr",  @"f_child_transfer_req",  @"f_member_add",  @"f_member_invite",  0LL));
    events = v2->_events;
    v2->_events = (NSSet *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("family_push_detail_request", v6);
    networkingQueue = v2->_networkingQueue;
    v2->_networkingQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (BOOL)shouldProcess:(id)a3
{
  events = self->_events;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 event]);
  LOBYTE(events) = -[NSSet containsObject:](events, "containsObject:", v4);

  return (char)events;
}

- (void)process:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CacheUpdate:Processing family event push",  buf,  2u);
  }

  networkingQueue = (dispatch_queue_s *)self->_networkingQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100016800;
  v10[3] = &unk_1000420B0;
  id v11 = v4;
  v12 = self;
  id v9 = v4;
  dispatch_async(networkingQueue, v10);
}

- (void)_deliverNotificationWithResponse:(id)a3 payload:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[FANotificationBuilder buildNotificationWithResponse:payload:]( &OBJC_CLASS___FANotificationBuilder,  "buildNotificationWithResponse:payload:",  a3,  a4));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[FAPushHelperService sharedInstance](&OBJC_CLASS___FAPushHelperService, "sharedInstance"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 familyNotifier]);

    uint64_t v9 = _FALogSystem(v7, v8);
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      v12 = v4;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Dispatching new FAFamilyNotification %@ to notifier %@",  (uint8_t *)&v11,  0x16u);
    }

    [v6 deliverNotification:v4];
  }
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return self->_familyRefreshActivityScheduler;
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end