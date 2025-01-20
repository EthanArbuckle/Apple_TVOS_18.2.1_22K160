@interface SubscriptionEntitlementsCoordinator
+ (id)sharedInstance;
- (SubscriptionEntitlementsCoordinator)init;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setCachedSubscriptionEntitlements:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5;
@end

@implementation SubscriptionEntitlementsCoordinator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10026467C;
  block[3] = &unk_1003E9EA8;
  block[4] = a1;
  if (qword_100462498 != -1) {
    dispatch_once(&qword_100462498, block);
  }
  return (id)qword_100462490;
}

- (SubscriptionEntitlementsCoordinator)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SubscriptionEntitlementsCoordinator;
  v2 = -[SubscriptionEntitlementsCoordinator init](&v19, "init");
  if (v2)
  {
    dispatch_queue_t v3 = sub_10022ED60("com.apple.appstored.SubscriptionEntitlementsCoordinator.network", QOS_CLASS_DEFAULT);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = sub_10022ED60("com.apple.appstored.SubscriptionEntitlementsCoordinator", QOS_CLASS_DEFAULT);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    completionHandlersBySegment = v2->_completionHandlersBySegment;
    v2->_completionHandlersBySegment = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver sharedInstance](&OBJC_CLASS___ActiveAccountObserver, "sharedInstance"));
    [v11 addObserver:v2 selector:"_handleAccountStoreDidChangeNotification:" name:@"AccountStorePrimaryAccountDidChange" object:v12];

    id v13 = sub_10028ECBC((uint64_t)&OBJC_CLASS___PushService);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    sub_10028EF00((uint64_t)v14, v2, 17LL);

    v15 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100264818;
    block[3] = &unk_1003E9880;
    v18 = v2;
    dispatch_async(v15, block);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver sharedInstance](&OBJC_CLASS___ActiveAccountObserver, "sharedInstance"));
  [v3 removeObserver:self name:@"AccountStorePrimaryAccountDidChange" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SubscriptionEntitlementsCoordinator;
  -[SubscriptionEntitlementsCoordinator dealloc](&v5, "dealloc");
}

- (void)setCachedSubscriptionEntitlements:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100265B98;
  v13[3] = &unk_1003EF100;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = (void **)a4;
  v36 = (void (**)(id, void))a5;
  id v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  v37 = v7;
  if (self->_lastAccountID
    && (id v9 = sub_10025F578(v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9),
        unsigned int v11 = [v10 isEqualToNumber:self->_lastAccountID],
        v10,
        v11))
  {
    uint64_t v12 = ASDLogHandleForCategory(37LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@] Clearing cached subscription entitlements after push notification",  buf,  0xCu);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v14 = [&off_10040DE88 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(&off_10040DE88);
          }
          id v18 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)v17), "unsignedIntegerValue", v36, v37);
          id v19 = sub_100264D64(self, (unint64_t)v18, v8);
          id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
          dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_1002659CC;
          v44 = &unk_1003EC880;
          v45 = self;
          id v47 = v18;
          id v22 = v20;
          id v46 = v22;
          dispatch_sync(dispatchQueue, buf);

          v23 = objc_alloc_init(&OBJC_CLASS___SubscriptionRequestInfo);
          v25 = v23;
          if (v23)
          {
            objc_setProperty_atomic(v23, v24, v22, 16LL);
            v25->_segment = (unint64_t)v18;
          }

          v26 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v29 = v27;
          if (v25)
          {
            objc_setProperty_atomic(v25, v28, v27, 32LL);

            v25->_ignoreCaches = 0;
            *(_WORD *)&v25->_notifyExternal = 257;
          }

          else
          {
          }

          sub_100265614((uint64_t)self, v25, &stru_1003EF190);

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v30 = [&off_10040DE88 countByEnumeratingWithState:&v38 objects:v42 count:16];
        id v15 = v30;
      }

      while (v30);
    }
  }

  else
  {
    uint64_t v31 = ASDLogHandleForCategory(37LL);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      lastAccountID = self->_lastAccountID;
      v34 = sub_10025F578(v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = lastAccountID;
      *(_WORD *)&buf[22] = 2114;
      v44 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%@] Not clearing cached subscription entitlements after push notification. lastAccountID: %{public}@ messageAcc ountID: %{public}@",  buf,  0x20u);
    }
  }

  v36[2](v36, 0LL);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v5 = ASDLogHandleForCategory(37LL);
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Updating after account changed", buf, 0xCu);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002684FC;
  v9[3] = &unk_1003E9DC0;
  v10 = v4;
  unsigned int v11 = self;
  id v8 = v4;
  dispatch_async(dispatchQueue, v9);
}

- (void).cxx_destruct
{
}

@end