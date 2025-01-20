@interface PurchaseHistoryManager
- (PurchaseHistoryManager)init;
- (void)_handleAccountChangedNotification;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PurchaseHistoryManager

- (PurchaseHistoryManager)init
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___PurchaseHistoryManager;
  v2 = -[PurchaseHistoryManager init](&v33, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PurchaseHistoryDatabaseStore);
    id v4 = sub_100185934((uint64_t)&OBJC_CLASS___Environment);
    v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v4);
    v6 = sub_100185AB8(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = -[SQLiteDatabaseStore initWithDatabase:](v3, "initWithDatabase:", v7);
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AppStoreFoundation.PurchaseHistoryManager", v11);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v12;

    id v14 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    bag = v2->_bag;
    v2->_bag = (URLBag *)v15;

    id v17 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    LOBYTE(v5) = [v18 isHRNMode];

    if ((v5 & 1) == 0)
    {
      uint64_t v19 = ASDLogHandleForCategory(14LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_opt_class(v2, v21);
        id v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 hashedDescription]);
        *(_DWORD *)buf = 138412546;
        v35 = v22;
        __int16 v36 = 2114;
        v37 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@]: Begin observing, current account: %{public}@",  buf,  0x16u);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver sharedInstance](&OBJC_CLASS___ActiveAccountObserver, "sharedInstance"));
      [v26 addObserver:v2 selector:"_handleAccountChangedNotification" name:@"AccountStorePrimaryAccountDidChange" object:v27];

      id v28 = sub_10028ECBC((uint64_t)&OBJC_CLASS___PushService);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      sub_10028EF00((uint64_t)v29, v2, 1LL);
    }

    v2->_commandRunning = 0;
    v30 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    commandStack = v2->_commandStack;
    v2->_commandStack = v30;
  }

  return v2;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001C8094;
  v12[3] = &unk_1003E9FD0;
  id v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  sub_10022ED10(dispatchQueue, v12);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001C8588;
  v9[3] = &unk_1003E9D48;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  sub_10022ED10(dispatchQueue, v9);
}

- (void)_handleAccountChangedNotification
{
  uint64_t v3 = ASDLogHandleForCategory(14LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = (id)objc_opt_class(self, v5);
    id v6 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@]: Updating after account changed",  buf,  0xCu);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C8930;
  block[3] = &unk_1003E9880;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end