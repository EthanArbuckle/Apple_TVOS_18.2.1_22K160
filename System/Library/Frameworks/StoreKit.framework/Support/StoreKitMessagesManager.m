@interface StoreKitMessagesManager
+ (id)sharedManager;
- (BOOL)addMessage:(id)a3 error:(id *)a4;
- (BOOL)addMessageStatus:(id)a3 forBundleID:(id)a4 accountID:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7 error:(id *)a8;
- (StoreKitMessagesManager)init;
- (id)_removeStoreKitMessageForAccount:(id)a3 bundleID:(id)a4 type:(int64_t)a5 logKey:(id)a6;
- (id)databaseStore;
- (id)messageInfoForClient:(id)a3 messageType:(id)a4;
- (id)revocationsForClient:(id)a3;
- (void)_recordPotentialMessageWithURL:(id)a3 type:(int64_t)a4 allowsDeveloperControl:(BOOL)a5 client:(id)a6;
- (void)askToShowMessageForClient:(id)a3 message:(id)a4 pendingURL:(id)a5 connection:(id)a6;
- (void)displayMessageForMessageInfo:(id)a3 client:(id)a4;
- (void)displayMessageWithType:(id)a3 forClient:(id)a4 connection:(id)a5;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4;
- (void)recordMessageDisplayEventWithType:(int64_t)a3 messageType:(int64_t)a4 client:(id)a5;
- (void)revokeProductIdentifiers:(id)a3 forBundleID:(id)a4 accountID:(id)a5;
@end

@implementation StoreKitMessagesManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D244;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032EA68 != -1) {
    dispatch_once(&qword_10032EA68, block);
  }
  return (id)qword_10032EA60;
}

- (StoreKitMessagesManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___StoreKitMessagesManager;
  v2 = -[StoreKitMessagesManager init](&v16, "init");
  if (v2)
  {
    if (qword_10032EAB8 != -1) {
      dispatch_once(&qword_10032EAB8, &stru_1002E9800);
    }
    v3 = (os_log_s *)qword_10032EA70;
    if (os_log_type_enabled((os_log_t)qword_10032EA70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registering StoreKit Messages push consumer",  v15,  2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PushService sharedInstance](&OBJC_CLASS___PushService, "sharedInstance"));
    [v4 registerConsumer:v2 forActionType:30];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PushService sharedInstance](&OBJC_CLASS___PushService, "sharedInstance"));
    [v5 registerConsumer:v2 forActionType:32];

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.StoreKit.ShowMessages", v7);
    showMessageQueue = v2->_showMessageQueue;
    v2->_showMessageQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.appstored.StoreKit.MessageAccountObserver", v11);
    accountObserverQueue = v2->_accountObserverQueue;
    v2->_accountObserverQueue = (OS_dispatch_queue *)v12;
  }

  return v2;
}

- (id)databaseStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (StoreKitMessagesDatabaseStore *)objc_loadWeakRetained((id *)&v2->_databaseStore);
  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[Environment sharedInstance](&OBJC_CLASS___Environment, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userDatabase]);
    WeakRetained = -[SQLiteDatabaseStore initWithDatabase:]( objc_alloc(&OBJC_CLASS___StoreKitMessagesDatabaseStore),  "initWithDatabase:",  v5);
    objc_storeWeak((id *)&v2->_databaseStore, WeakRetained);
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)addMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10005D7D4;
  v33 = sub_10005D7E4;
  id v34 = 0LL;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesManager databaseStore](self, "databaseStore"));
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    v25 = sub_10005D7EC;
    v26 = &unk_1002E96C8;
    id v8 = v6;
    id v27 = v8;
    v28 = &v29;
    [v7 modifyUsingTransaction:&v23];

    if (v30[5])
    {
      if (qword_10032EAB8 != -1) {
        dispatch_once(&qword_10032EAB8, &stru_1002E9800);
      }
      v9 = (os_log_s *)(id)qword_10032EA78;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v30[5];
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userID", v23, v24, v25, v26));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
        *(_DWORD *)buf = 138543875;
        uint64_t v36 = v17;
        __int16 v37 = 2113;
        v38 = v18;
        __int16 v39 = 2114;
        v40 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error inserting message info: %{public}@ for DSID: %{private}@, bundle ID: %{public}@",  buf,  0x20u);
      }
    }

    dispatch_queue_attr_t v10 = v27;
  }

  else
  {
    v11 = objc_alloc(&OBJC_CLASS___NSError);
    dispatch_queue_t v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", ASDErrorDomain, 740LL, 0LL);
    dispatch_queue_attr_t v10 = (void *)v30[5];
    v30[5] = (uint64_t)v12;
  }

  v13 = v30;
  if (a4 && v30[5])
  {
    if (qword_10032EAB8 != -1) {
      dispatch_once(&qword_10032EAB8, &stru_1002E9800);
    }
    v14 = (os_log_s *)(id)qword_10032EA78;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v30[5];
      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 userID]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      *(_DWORD *)buf = 138543875;
      uint64_t v36 = v20;
      __int16 v37 = 2113;
      v38 = v21;
      __int16 v39 = 2114;
      v40 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Error inserting message info: %{public}@ for DSID: %{private}@, bundle ID: %{public}@",  buf,  0x20u);
    }

    *a4 = (id) v30[5];
    v13 = v30;
  }

  BOOL v15 = v13[5] != 0;
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)addMessageStatus:(id)a3 forBundleID:(id)a4 accountID:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = -[StoreKitMessageInfo initWithUserID:bundleID:status:allowDeveloperControl:messageType:]( objc_alloc(&OBJC_CLASS___StoreKitMessageInfo),  "initWithUserID:bundleID:status:allowDeveloperControl:messageType:",  v14,  v15,  v16,  v10,  a7);

  LOBYTE(a8) = -[StoreKitMessagesManager addMessage:error:](self, "addMessage:error:", v17, a8);
  return (char)a8;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v7 accountID]);
  if ([v7 actionType] == (id)30)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 valueForUserInfoKey:@"2"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForUserInfoKey:@"9"]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        id v13 = objc_msgSend(v7, "valueForUserInfoKey:", @"11", v11);
      }

      else
      {
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v11, v18) & 1) != 0)
        {
          v19 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
          -[NSNumberFormatter setNumberStyle:](v19, "setNumberStyle:", 1LL);
          uint64_t v37 = objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v19, "numberFromString:", v11));

          id v13 = objc_msgSend(v7, "valueForUserInfoKey:", @"11", v37);
        }

        else
        {
          id v13 = objc_msgSend(v7, "valueForUserInfoKey:", @"11", &off_100302858);
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v21 && (objc_opt_respondsToSelector(v21, "BOOLValue") & 1) != 0) {
        uint64_t v22 = (uint64_t)[v21 BOOLValue];
      }
      else {
        uint64_t v22 = 1LL;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForUserInfoKey:@"12"]);

      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
      {
        uint64_t v25 = (uint64_t)[v23 integerValue];
      }

      else
      {
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v23, v26) & 1) != 0)
        {
          id v27 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
          -[NSNumberFormatter setNumberStyle:](v27, "setNumberStyle:", 1LL);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v27, "numberFromString:", v23));
          uint64_t v29 = v28;
          if (v28) {
            uint64_t v25 = (uint64_t)[v28 integerValue];
          }
          else {
            uint64_t v25 = 2LL;
          }
        }

        else
        {
          uint64_t v25 = 2LL;
        }
      }

      if (qword_10032EAB8 != -1) {
        dispatch_once(&qword_10032EAB8, &stru_1002E9800);
      }
      v30 = (os_log_s *)qword_10032EA78;
      if (os_log_type_enabled((os_log_t)qword_10032EA78, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = @"false";
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = self;
        if ((_DWORD)v22) {
          uint64_t v31 = @"true";
        }
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v54 = v8;
        *(_WORD *)v55 = 2112;
        *(void *)&v55[2] = v36;
        *(_WORD *)&v55[10] = 2112;
        *(void *)&v55[12] = v31;
        __int16 v56 = 2048;
        uint64_t v57 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Received StoreKit message for bundleID: %@ accountID: %@ status: %@ allowDeveloperControl: %@ type: %ld",  buf,  0x3Eu);
      }

      v32 = -[StoreKitMessageInfo initWithUserID:bundleID:status:allowDeveloperControl:messageType:]( objc_alloc(&OBJC_CLASS___StoreKitMessageInfo),  "initWithUserID:bundleID:status:allowDeveloperControl:messageType:",  v8,  v9,  v36,  v22,  v25);
      if (v32)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v54 = sub_10005D7D4;
        *(void *)v55 = sub_10005D7E4;
        *(void *)&v55[8] = 0LL;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesManager databaseStore](self, "databaseStore"));
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_10005DF10;
        v42[3] = &unk_1002E96C8;
        v43 = v32;
        v44 = buf;
        [v33 modifyUsingTransaction:v42];

        if (*(void *)(*(void *)&buf[8] + 40LL))
        {
          if (qword_10032EAB8 != -1) {
            dispatch_once(&qword_10032EAB8, &stru_1002E9800);
          }
          id v34 = (os_log_s *)qword_10032EA78;
          if (os_log_type_enabled((os_log_t)qword_10032EA78, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = *(void *)(*(void *)&buf[8] + 40LL);
            *(_DWORD *)v45 = 138544130;
            uint64_t v46 = v35;
            __int16 v47 = 2112;
            v48 = v8;
            __int16 v49 = 2112;
            id v50 = v9;
            __int16 v51 = 2112;
            v52 = v36;
            _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Error inserting message info: %{public}@ for DSID: %@, bundle ID: %@, status: %@",  v45,  0x2Au);
          }
        }

        _Block_object_dispose(buf, 8);
      }

      id v9 = v23;
    }

    else
    {
      if (qword_10032EAB8 != -1) {
        dispatch_once(&qword_10032EAB8, &stru_1002E9800);
      }
      id v16 = (os_log_s *)qword_10032EA78;
      if (os_log_type_enabled((os_log_t)qword_10032EA78, OS_LOG_TYPE_ERROR)) {
        sub_1002624BC((uint64_t)self, v16, v17);
      }
    }

- (id)messageInfoForClient:(id)a3 messageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "objc_clientType") == 3)
  {
    id v8 = &off_100302858;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
    id v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_DSID"));

    if (!v8) {
      goto LABEL_11;
    }
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10005D7D4;
  uint64_t v29 = sub_10005D7E4;
  id v30 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesManager databaseStore](self, "databaseStore"));
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10005E22C;
  uint64_t v20 = &unk_1002E96F0;
  uint64_t v24 = &v25;
  v11 = v8;
  id v21 = v11;
  id v12 = v6;
  id v22 = v12;
  id v23 = v7;
  [v10 readUsingSession:&v17];

  id v13 = (void *)v26[5];
  if (!v13)
  {
    if (qword_10032EAB8 != -1) {
      dispatch_once(&qword_10032EAB8, &stru_1002E9800);
    }
    id v14 = (os_log_s *)(id)qword_10032EA78;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestBundleID", v17, v18, v19, v20, v21, v22));
      *(_DWORD *)buf = 138478083;
      v32 = v11;
      __int16 v33 = 2114;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No message in database for DSID: %{private}@, bundle ID: %{public}@",  buf,  0x16u);
    }

    id v13 = (void *)v26[5];
  }

  id v8 = v13;

  _Block_object_dispose(&v25, 8);
LABEL_11:

  return v8;
}

- (id)revocationsForClient:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "objc_clientType") == 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager testAccountID](&OBJC_CLASS___OctaneManager, "testAccountID"));
    if (v5)
    {
LABEL_3:
      uint64_t v34 = 0LL;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x3032000000LL;
      uint64_t v37 = sub_10005D7D4;
      v38 = sub_10005D7E4;
      id v39 = 0LL;
      uint64_t v28 = 0LL;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x3032000000LL;
      uint64_t v31 = sub_10005D7D4;
      v32 = sub_10005D7E4;
      id v33 = 0LL;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesManager databaseStore](self, "databaseStore"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10005E640;
      v24[3] = &unk_1002E9718;
      uint64_t v27 = &v28;
      id v7 = v5;
      id v25 = v7;
      id v8 = v4;
      id v26 = v8;
      [v6 readUsingSession:v24];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10005E6BC;
      v21[3] = &unk_1002E9740;
      id v9 = v7;
      id v22 = v9;
      id v10 = v8;
      id v23 = v10;
      [v6 modifyUsingTransaction:v21];
      if ([(id)v29[5] count])
      {
        v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v12 = (void *)v35[5];
        v35[5] = (uint64_t)v11;

        id v13 = (void *)v29[5];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10005E718;
        v20[3] = &unk_1002E9768;
        v20[4] = &v34;
        [v13 enumerateObjectsUsingBlock:v20];
      }

      else
      {
        if (qword_10032EAB8 != -1) {
          dispatch_once(&qword_10032EAB8, &stru_1002E9800);
        }
        uint64_t v17 = (os_log_s *)(id)qword_10032EA78;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 requestBundleID]);
          *(_DWORD *)buf = 138478083;
          id v41 = v9;
          __int16 v42 = 2114;
          v43 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No revocations in database for DSID: %{private}@, bundleID: %{public}@",  buf,  0x16u);
        }
      }

      id v16 = (id)v35[5];

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v34, 8);

      goto LABEL_17;
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_DSID"));

    if (v5) {
      goto LABEL_3;
    }
  }

  if (qword_10032EAB8 != -1) {
    dispatch_once(&qword_10032EAB8, &stru_1002E9800);
  }
  id v15 = (void *)qword_10032EA78;
  if (os_log_type_enabled((os_log_t)qword_10032EA78, OS_LOG_TYPE_ERROR)) {
    sub_100262568(v15, v4);
  }
  id v16 = 0LL;
LABEL_17:

  return v16;
}

- (void)revokeProductIdentifiers:(id)a3 forBundleID:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesManager databaseStore](self, "databaseStore"));
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10005E890;
  uint64_t v20 = &unk_1002E97B8;
  id v16 = v8;
  id v21 = v16;
  id v12 = v10;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  [v11 modifyUsingTransaction:&v17];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager testAccountID](&OBJC_CLASS___OctaneManager, "testAccountID"));
  LODWORD(v8) = [v12 isEqualToNumber:v14];

  if ((_DWORD)v8)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection octaneConnectionForBundleID:]( &OBJC_CLASS___StoreKitServiceConnection,  "octaneConnectionForBundleID:",  v13,  v16,  v17,  v18,  v19,  v20,  v21,  v22));
    [v15 checkForMessages];
  }
}

- (void)_recordPotentialMessageWithURL:(id)a3 type:(int64_t)a4 allowsDeveloperControl:(BOOL)a5 client:(id)a6
{
  if (a3)
  {
    if (a5) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 4LL;
    }
    -[StoreKitMessagesManager recordMessageDisplayEventWithType:messageType:client:]( self,  "recordMessageDisplayEventWithType:messageType:client:",  v6,  a4,  a6);
  }

- (void).cxx_destruct
{
}

- (id)_removeStoreKitMessageForAccount:(id)a3 bundleID:(id)a4 type:(int64_t)a5 logKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_10005D7D4;
  uint64_t v29 = sub_10005D7E4;
  id v30 = 0LL;
  if (qword_10032EAB8 != -1) {
    dispatch_once(&qword_10032EAB8, &stru_1002E9800);
  }
  id v13 = (os_log_s *)qword_10032EA78;
  if (os_log_type_enabled((os_log_t)qword_10032EA78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Removing message info for %{public}@",  buf,  0x16u);
  }

  if (v10 && v11)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesManager databaseStore](self, "databaseStore"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10005EDD4;
    v20[3] = &unk_1002E97E0;
    id v21 = v10;
    id v22 = v11;
    id v23 = &v25;
    int64_t v24 = a5;
    [v14 modifyUsingTransaction:v20];
  }

  id v15 = (void *)v26[5];
  if (v15)
  {
    if (qword_10032EAB8 != -1) {
      dispatch_once(&qword_10032EAB8, &stru_1002E9800);
    }
    id v16 = (os_log_s *)qword_10032EA78;
    if (os_log_type_enabled((os_log_t)qword_10032EA78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v26[5];
      *(_DWORD *)buf = 138543874;
      id v32 = v12;
      __int16 v33 = 2114;
      id v34 = v11;
      __int16 v35 = 2114;
      uint64_t v36 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Failed to remove message info for %{public}@: %{public}@",  buf,  0x20u);
    }

    id v15 = (void *)v26[5];
  }

  id v17 = v15;
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)recordMessageDisplayEventWithType:(int64_t)a3 messageType:(int64_t)a4 client:(id)a5
{
  id v9 = a5;
  id v10 = self;
  sub_1000EB888(a3, a4, a5);
}

- (void)displayMessageWithType:(id)a3 forClient:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1000EB9F0();
}

- (void)askToShowMessageForClient:(id)a3 message:(id)a4 pendingURL:(id)a5 connection:(id)a6
{
  uint64_t v11 = sub_10007B1FC((uint64_t *)&unk_10032A1C0);
  __chkstk_darwin(v11);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v14 = type metadata accessor for URL(0LL);
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v14 = type metadata accessor for URL(0LL);
    uint64_t v15 = 1LL;
  }

  sub_10007D0AC((uint64_t)v13, v15, 1LL, v14);
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  uint64_t v19 = self;
  sub_1000ED058();

  sub_100085298((uint64_t)v13, (uint64_t *)&unk_10032A1C0);
}

- (void)displayMessageForMessageInfo:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000EDDDC();
}

@end