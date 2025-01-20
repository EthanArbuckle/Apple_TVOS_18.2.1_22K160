@interface IDSOpportunisticDeliveryController
- (BOOL)diceRoll;
- (BOOL)sendOpportunisticData:(id)a3 toDestination:(id)a4;
- (IDSDAccountController)accountController;
- (IDSOpportunisticCache)cache;
- (IDSOpportunisticDeliveryController)init;
- (IDSOpportunisticDeliveryController)initWithCache:(id)a3 accountController:(id)a4;
- (OS_dispatch_queue)opportunisticQueue;
- (void)addOpportunisticData:(id)a3 serviceName:(id)a4 accountUniqueID:(id)a5 identifier:(id)a6 options:(id)a7 completion:(id)a8;
- (void)removeOpportunisticDataForIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)sendOpportunisticDataIfNeededToDestination:(id)a3 completion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCache:(id)a3;
- (void)setOpportunisticQueue:(id)a3;
@end

@implementation IDSOpportunisticDeliveryController

- (IDSOpportunisticDeliveryController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSOpportunisticCache);
  v4 = -[IDSOpportunisticDeliveryController initWithCache:accountController:]( self,  "initWithCache:accountController:",  v3,  0LL);

  return v4;
}

- (IDSOpportunisticDeliveryController)initWithCache:(id)a3 accountController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSOpportunisticDeliveryController;
  v9 = -[IDSOpportunisticDeliveryController init](&v13, "init");
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ids.opportunisticdeliverycontroller", 0LL);
    opportunisticQueue = v9->_opportunisticQueue;
    v9->_opportunisticQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v9->_accountController, a4);
  }

  return v9;
}

- (IDSDAccountController)accountController
{
  accountController = self->_accountController;
  if (accountController) {
    return accountController;
  }
  else {
    return (IDSDAccountController *)(id)objc_claimAutoreleasedReturnValue( +[IDSDAccountController sharedInstance]( &OBJC_CLASS___IDSDAccountController,  "sharedInstance"));
  }
}

- (void)addOpportunisticData:(id)a3 serviceName:(id)a4 accountUniqueID:(id)a5 identifier:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  opportunisticQueue = (dispatch_queue_s *)self->_opportunisticQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A080;
  block[3] = &unk_1008F7B88;
  id v28 = v17;
  id v29 = v15;
  id v30 = v16;
  id v31 = v18;
  id v32 = v14;
  v33 = self;
  id v34 = v19;
  id v21 = v19;
  id v22 = v14;
  id v23 = v18;
  id v24 = v16;
  id v25 = v15;
  id v26 = v17;
  dispatch_async(opportunisticQueue, block);
}

- (void)removeOpportunisticDataForIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  opportunisticQueue = (dispatch_queue_s *)self->_opportunisticQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004A29C;
  v15[3] = &unk_1008F7BB0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(opportunisticQueue, v15);
}

- (BOOL)diceRoll
{
  uint32_t v2 = arc4random_uniform(0x64u);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ids-opportunistic-send-percentage"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    signed int v7 = [v4 intValue];
    uint64_t v8 = v7;
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetched Opportunistic Send Percentage from Bag {opportunisticSendPercentage: %d}",  (uint8_t *)v11,  8u);
    }
  }

  else
  {
    uint64_t v8 = 10LL;
  }

  return v8 > v2;
}

- (void)sendOpportunisticDataIfNeededToDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  opportunisticQueue = (dispatch_queue_s *)self->_opportunisticQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A568;
  block[3] = &unk_1008F7BD8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(opportunisticQueue, block);
}

- (BOOL)sendOpportunisticData:(id)a3 toDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOpportunisticDeliveryController accountController](self, "accountController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountUniqueID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accountWithUniqueID:v9]);

  if (v10)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    v50[0] = @"i";
    v50[1] = @"s";
    v51[0] = v11;
    v51[1] = v32;
    v50[2] = @"d";
    v51[2] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  3LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    uint64_t v13 = IDSGetUUIDData();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    id v15 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    [v15 setAccountUUID:v16];

    [v15 setMessage:v33];
    [v15 setCommand:&off_100946840];
    [v15 setPriority:300];
    [v15 setFireAndForget:1];
    [v15 setEncryptPayload:1];
    [v15 setDestinations:v7];
    [v15 setAlwaysSkipSelf:1];
    [v15 setMessageUUID:v14];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10004AA90;
    v43[3] = &unk_1008F7C00;
    id v17 = v11;
    id v44 = v17;
    id v18 = v14;
    id v45 = v18;
    id v19 = objc_retainBlock(v43);
    uint64_t v21 = im_primary_queue(v19, v20);
    id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004ABC0;
    block[3] = &unk_1008F7C50;
    id v36 = v10;
    id v37 = v15;
    id v38 = v17;
    id v39 = v18;
    id v42 = v19;
    id v40 = v32;
    id v41 = v7;
    id v23 = v32;
    id v24 = v18;
    id v25 = v17;
    id v26 = v19;
    id v27 = v15;
    dispatch_async(v22, block);
  }

  else
  {
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v6 accountUniqueID]);
      *(_DWORD *)buf = 138412546;
      v47 = v29;
      __int16 v48 = 2112;
      v49 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Failed to find account for opportunistic send {identifier: %@, accountUniqueID: %@}",  buf,  0x16u);
    }

    [v6 markInvalid];
  }

  return v10 != 0LL;
}

- (OS_dispatch_queue)opportunisticQueue
{
  return self->_opportunisticQueue;
}

- (void)setOpportunisticQueue:(id)a3
{
}

- (IDSOpportunisticCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void)setAccountController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end