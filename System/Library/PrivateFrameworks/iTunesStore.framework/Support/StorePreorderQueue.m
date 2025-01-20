@interface StorePreorderQueue
+ (id)sharedPreorderQueue;
+ (void)cancelPreordersWithMessage:(id)a3 connection:(id)a4;
+ (void)checkQueueWithMessage:(id)a3 connection:(id)a4;
+ (void)getPreordersWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)registerManagerWithMessage:(id)a3 connection:(id)a4;
- (StorePreorderQueue)init;
- (id)_clientForConnection:(id)a3;
- (id)_copyPreorderAccountIdentifiers;
- (id)_preorderQueryWithAccountID:(id)a3 database:(id)a4;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_handleCheckQueueFinish:(id)a3;
- (void)_handleLoadQueueFinish:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_sendChangeNotificationForKinds:(id)a3;
- (void)addPreordersWithItems:(id)a3 accountID:(id)a4;
- (void)checkPreorderQueue;
- (void)dealloc;
- (void)removePreordersWithPreorderIdentifiers:(id)a3;
@end

@implementation StorePreorderQueue

- (StorePreorderQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___StorePreorderQueue;
  v2 = -[StorePreorderQueue init](&v5, "init");
  if (v2)
  {
    v2->_clients = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.StorePreorderQueue", 0LL);
    v3 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    v2->_operationQueue = v3;
    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:](v3, "setAdjustsMaxConcurrentOperationCount:", 0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addKeepAliveOperationQueue:", v2->_operationQueue);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_clientDisconnectNotification:",  @"XPCClientDisconnectNotification",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "removeKeepAliveOperationQueue:",  self->_operationQueue);
  -[ISOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StorePreorderQueue;
  -[StorePreorderQueue dealloc](&v3, "dealloc");
}

+ (id)sharedPreorderQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D1154;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3378 != -1) {
    dispatch_once(&qword_1003A3378, block);
  }
  return (id)qword_1003A3370;
}

- (void)addPreordersWithItems:(id)a3 accountID:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D11F4;
  v4[3] = &unk_10034DCB0;
  v4[4] = a3;
  v4[5] = a4;
  v4[6] = self;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingTransactionBlock:",  v4);
}

- (void)checkPreorderQueue
{
  if (!objc_msgSend(-[ISOperationQueue operations](self->_operationQueue, "operations"), "count"))
  {
    id v3 = -[StorePreorderQueue _copyPreorderAccountIdentifiers](self, "_copyPreorderAccountIdentifiers");
    id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v5 = [v4 shouldLog];
    else {
      LODWORD(v6) = v5;
    }
    v7 = (os_log_s *)[v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      uint64_t v6 = v6;
    }
    else {
      v6 &= 2u;
    }
    if ((_DWORD)v6)
    {
      int v25 = 138412546;
      uint64_t v26 = objc_opt_class(self);
      __int16 v27 = 2048;
      id v28 = [v3 count];
      uint64_t v9 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Checking preorder queue for %lu accounts",  &v25,  22);
      if (v9)
      {
        v10 = (void *)v9;
        v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
        free(v10);
        v18 = v11;
        *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
      }
    }

    if (objc_msgSend(v3, "count", v8, v18))
    {
      v12 = objc_alloc_init(&OBJC_CLASS___CancelPreordersOperation);
      -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);

      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v13 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v3);
            }
            v17 = -[CheckPreorderQueueOperation initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___CheckPreorderQueueOperation),  "initWithAccountIdentifier:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472LL;
            v19[2] = sub_1000D17B4;
            v19[3] = &unk_10034AE70;
            v19[4] = self;
            v19[5] = v17;
            -[CheckPreorderQueueOperation setCompletionBlock:](v17, "setCompletionBlock:", v19);
            -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);
          }

          id v14 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v14);
      }
    }
  }

- (void)removePreordersWithPreorderIdentifiers:(id)a3
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D1900;
  v8[3] = &unk_10034DD00;
  v8[4] = a3;
  v8[5] = v5;
  v8[6] = &v9;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingTransactionBlock:",  v8);
  if (*((_BYTE *)v10 + 24) && -[NSMutableSet count](v5, "count"))
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D1B30;
    block[3] = &unk_10034AE70;
    block[4] = self;
    void block[5] = v5;
    dispatch_async(dispatchQueue, block);
  }

  _Block_object_dispose(&v9, 8);
}

+ (void)cancelPreordersWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D1BB0;
  v4[3] = &unk_10034DD50;
  v4[5] = a3;
  objc_msgSend( +[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)checkQueueWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D2204;
  v4[3] = &unk_10034DD78;
  objc_msgSend( +[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"),  "_handleMessage:connection:usingBlock:",  a3,  a4,  v4);
}

+ (void)getPreordersWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D23FC;
  v4[3] = &unk_10034DDA0;
  objc_msgSend( +[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)observeXPCServer:(id)a3
{
}

+ (void)registerManagerWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D2884;
  v4[3] = &unk_10034DDC8;
  v4[5] = a3;
  objc_msgSend( +[StorePreorderQueue sharedPreorderQueue](StorePreorderQueue, "sharedPreorderQueue"),  "_handleMessage:connection:usingBlock:",  a3,  a4,  v4);
}

- (void)_clientDisconnectNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D2C48;
  v4[3] = &unk_10034AE70;
  void v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (id)_clientForConnection:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  clients = self->_clients;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(clients);
      }
      v10 = *(PreorderQueueClient **)(*((void *)&v16 + 1) + 8 * v9);
      id v11 = -[XPCClient copyInputConnection](v10, "copyInputConnection");
      id v12 = v11;
      if (v11) {
        xpc_release(v11);
      }
      if (v12 == a3 && v10 != 0LL) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }

  else
  {
LABEL_15:
    v10 = -[XPCClient initWithInputConnection:]( objc_alloc(&OBJC_CLASS___PreorderQueueClient),  "initWithInputConnection:",  a3);
    -[NSMutableArray addObject:](self->_clients, "addObject:", v10);
    id v14 = v10;
  }

  return v10;
}

- (id)_copyPreorderAccountIdentifiers
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D2FE4;
  v5[3] = &unk_10034DDF0;
  v5[4] = v2;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "readUsingTransactionBlock:",  v5);
  id v3 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if (v3) {
    -[NSMutableSet addObject:](v2, "addObject:", [v3 uniqueIdentifier]);
  }
  return v2;
}

- (void)_handleCheckQueueFinish:(id)a3
{
  if ([a3 success])
  {
    id v5 = [a3 accountIdentifier];
    id v6 = [a3 numberOfPreordersInQueue];
    if (v6)
    {
      id v7 = v6;
      *(void *)__int128 v21 = 0LL;
      *(void *)&v21[8] = v21;
      *(void *)&v21[16] = 0x2020000000LL;
      char v22 = 0;
      if (objc_msgSend( objc_msgSend( +[SSAccountStore defaultStore](SSAccountStore, "defaultStore"),  "accountWithUniqueIdentifier:",  v5),  "isAuthenticated"))
      {
        *(_BYTE *)(*(void *)&v21[8] + 24LL) = 1;
      }

      else
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000D344C;
        v19[3] = &unk_10034DE18;
        v19[4] = self;
        v19[5] = v5;
        void v19[6] = v21;
        v19[7] = v7;
        objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "readUsingTransactionBlock:",  v19);
        if (!*(_BYTE *)(*(void *)&v21[8] + 24LL))
        {
LABEL_19:
          _Block_object_dispose(v21, 8);
          return;
        }
      }

      __int128 v16 = -[LoadPreorderQueueOperation initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___LoadPreorderQueueOperation),  "initWithAccountIdentifier:",  v5);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000D34A4;
      v18[3] = &unk_10034AE70;
      v18[4] = self;
      v18[5] = v16;
      -[LoadPreorderQueueOperation setCompletionBlock:](v16, "setCompletionBlock:", v18);
      -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16);

      goto LABEL_19;
    }

    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    id v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      *(_DWORD *)__int128 v21 = 138412546;
      *(void *)&v21[4] = objc_opt_class(self);
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v5;
      uint64_t v13 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Deleting all preorders for account: %@",  v21,  22);
      if (v13)
      {
        id v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        __int128 v17 = v15;
        *(void *)&double v12 = SSFileLog(v8, @"%@").n128_u64[0];
      }
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000D3410;
    v20[3] = &unk_10034B9E0;
    v20[4] = self;
    v20[5] = v5;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v12, v17),  "modifyUsingTransactionBlock:",  v20);
  }

- (void)_handleLoadQueueFinish:(id)a3
{
  if ([a3 success])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000D354C;
    v5[3] = &unk_10034B9E0;
    v5[4] = a3;
    void v5[5] = self;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingTransactionBlock:",  v5);
  }

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D3D5C;
  v10[3] = &unk_10034DE40;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a3;
  v10[7] = a5;
  dispatch_async(dispatchQueue, v10);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D3E2C;
  v10[3] = &unk_10034DE68;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_async(dispatchQueue, v10);
}

- (id)_preorderQueryWithAccountID:(id)a3 database:(id)a4
{
  return +[PreorderEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PreorderEntity,  "queryWithDatabase:predicate:",  a4,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"store_account_id",  a3));
}

- (void)_sendChangeNotificationForKinds:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  clients = self->_clients;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(clients);
        }
        unsigned int v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

@end