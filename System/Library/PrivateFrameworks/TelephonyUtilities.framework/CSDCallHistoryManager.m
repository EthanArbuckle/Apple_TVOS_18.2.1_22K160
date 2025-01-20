@interface CSDCallHistoryManager
- (CSDCHManager)chManager;
- (CSDCallHistoryManager)init;
- (CSDCallHistoryManager)initWithCHManager:(id)a3;
- (CSDCallHistoryManager)initWithCHManager:(id)a3 queue:(id)a4;
- (CSDCallHistoryManagerDelegate)delegateController;
- (OS_dispatch_queue)queue;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)handleCallHistoryDatabaseChangedNotification:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4;
@end

@implementation CSDCallHistoryManager

- (CSDCallHistoryManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___CHManager);
  v4 = -[CSDCallHistoryManager initWithCHManager:](self, "initWithCHManager:", v3);

  return v4;
}

- (CSDCallHistoryManager)initWithCHManager:(id)a3
{
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = a3;

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callhistorymanager", v8);
  v11 = -[CSDCallHistoryManager initWithCHManager:queue:](self, "initWithCHManager:queue:", v9, v10);

  return v11;
}

- (CSDCallHistoryManager)initWithCHManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDCallHistoryManager;
  id v9 = -[CSDCallHistoryManager init](&v14, "init");
  if (v9)
  {
    dispatch_queue_t v10 = (CSDCallHistoryManagerDelegate *)objc_alloc_init(&OBJC_CLASS___TUDelegateController);
    delegateController = v9->_delegateController;
    v9->_delegateController = v10;

    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v9->_chManager, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v9 selector:"handleCallHistoryDatabaseChangedNotification:" name:kCallHistoryDatabaseChangedNotification object:0];
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:kCallHistoryDatabaseChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDCallHistoryManager;
  -[CSDCallHistoryManager dealloc](&v4, "dealloc");
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryManager delegateController](self, "delegateController"));
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryManager delegateController](self, "delegateController"));
  [v5 removeDelegate:v4];
}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100183D5C;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryManager delegateController](self, "delegateController"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100183E90;
  v13[3] = &unk_1003DC0C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateDelegatesUsingBlock:v13];
}

- (void)handleCallHistoryDatabaseChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = (id)objc_opt_class(self, v7);
    __int16 v13 = 2112;
    id v14 = v4;
    id v8 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryManager delegateController](self, "delegateController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100184094;
  v10[3] = &unk_1003DC0E8;
  v10[4] = self;
  [v9 enumerateDelegatesUsingBlock:v10];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCHManager)chManager
{
  return self->_chManager;
}

- (CSDCallHistoryManagerDelegate)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
}

@end