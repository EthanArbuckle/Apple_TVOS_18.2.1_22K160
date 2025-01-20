@interface PurchaseController
+ (id)sharedController;
+ (void)addPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)cancelPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)connectClientWithMessage:(id)a3 connection:(id)a4;
+ (void)finishPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)getPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)insertPurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)movePurchasesWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
- (BOOL)_cancelPurchasesWithBatchIdentifier:(int64_t)a3 client:(id)a4 response:(id)a5;
- (PurchaseController)init;
- (id)_authenticationOperationQueue;
- (id)_clientForMessage:(id)a3 connection:(id)a4;
- (id)_clientForUniqueIdentifier:(int64_t)a3;
- (id)_newEncodedPurchaseEntityPropertiesWithResponse:(id)a3;
- (id)_newPurchaseIdentifiersFromEncodedArray:(id)a3;
- (id)_newPurchasesFromEncodedArray:(id)a3 client:(id)a4;
- (id)_newResponsesToPurchasesForClient:(id)a3 inDatabase:(id)a4;
- (id)_placeholderAppPathForBundleIdentifier:(id)a3;
- (id)_purchaseOperationQueue;
- (void)_addEncodedPurchases:(id)a3 forClient:(id)a4;
- (void)_addPurchases:(id)a3 forClient:(id)a4;
- (void)_authenticateForPurchases:(id)a3 client:(id)a4;
- (void)_beginPurchaseBatch:(id)a3 forClient:(id)a4;
- (void)_cancelEncodedPurchases:(id)a3 forClient:(id)a4;
- (void)_cancelPurchasesForLackOfDiskSpace:(id)a3 client:(id)a4;
- (void)_checkStoreDownloadQueuesForPurchase:(id)a3 response:(id)a4;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_connectClient:(id)a3 withOutputConnection:(id)a4;
- (void)_dispatchAsync:(id)a3;
- (void)_enqueueNextPurchase;
- (void)_filterPurchases:(id)a3 withTransaction:(id)a4 block:(id)a5;
- (void)_finishAuthenticationRequestForBatchIdentifier:(int64_t)a3 client:(id)a4 withAccountID:(id)a5 error:(id)a6;
- (void)_finishEncodedPurchaseIdentifiers:(id)a3 forClient:(id)a4;
- (void)_finishPurchaseRequestForClientUniqueID:(int64_t)a3 withResponse:(id)a4;
- (void)_garbageCollectInflightPurchases;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_insertEncodedPurchases:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5;
- (void)_markInFlightCanceledPurchaseIdentifier:(id)a3;
- (void)_moveEncodedPurchaseIDs:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5;
- (void)_sendAuthenticateRequestForClientUniqueID:(int64_t)a3 withContext:(id)a4 responseHandler:(id)a5;
- (void)_showNotEnoughDiskSpaceDialogForPurchases:(id)a3;
- (void)_showPurchasesFailedDialogWithFirstTitle:(id)a3 count:(int64_t)a4;
- (void)addPurchases:(id)a3;
- (void)beginPurchaseBatch:(id)a3;
- (void)cancelPurchasesForDownloadsWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation PurchaseController

- (PurchaseController)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PurchaseController;
  v2 = -[PurchaseController init](&v4, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.PurchaseController", 0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_clientDisconnectNotification:",  @"XPCClientDisconnectNotification",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  id v4 = +[Daemon daemon](&OBJC_CLASS___Daemon, "daemon");
  v5 = v4;
  if (self->_authenticationOperationQueue)
  {
    objc_msgSend(v4, "removeKeepAliveOperationQueue:");
  }

  if (self->_purchaseOperationQueue)
  {
    objc_msgSend(v5, "removeKeepAliveOperationQueue:");
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PurchaseController;
  -[PurchaseController dealloc](&v6, "dealloc");
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016320C;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3588 != -1) {
    dispatch_once(&qword_1003A3588, block);
  }
  return (id)qword_1003A3580;
}

- (void)addPurchases:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100163280;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)beginPurchaseBatch:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001632E0;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)cancelPurchasesForDownloadsWithIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100163340;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100163A0C;
  v2[3] = &unk_10034AE98;
  v2[4] = self;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v2);
}

+ (void)addPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100163A88;
  v4[3] = &unk_10034FFA0;
  v4[4] = a3;
  objc_msgSend( +[PurchaseController sharedController](PurchaseController, "sharedController"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)cancelPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100163B98;
  v4[3] = &unk_10034FFA0;
  void v4[5] = a3;
  objc_msgSend( +[PurchaseController sharedController](PurchaseController, "sharedController"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)connectClientWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100163CA4;
  v4[3] = &unk_10034FFA0;
  v4[4] = a3;
  objc_msgSend( +[PurchaseController sharedController](PurchaseController, "sharedController"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)getPurchasesWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)finishPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016406C;
  v4[3] = &unk_10034FFA0;
  v4[4] = a3;
  objc_msgSend( +[PurchaseController sharedController](PurchaseController, "sharedController"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)insertPurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016417C;
  v4[3] = &unk_10034FFA0;
  v4[4] = a3;
  objc_msgSend( +[PurchaseController sharedController](PurchaseController, "sharedController"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)movePurchasesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001642A4;
  v4[3] = &unk_10034FFA0;
  v4[4] = a3;
  objc_msgSend( +[PurchaseController sharedController](PurchaseController, "sharedController"),  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

+ (void)observeXPCServer:(id)a3
{
}

- (void)_addEncodedPurchases:(id)a3 forClient:(id)a4
{
  id v6 = -[PurchaseController _newPurchasesFromEncodedArray:client:](self, "_newPurchasesFromEncodedArray:client:", a3);
  -[PurchaseController _addPurchases:forClient:](self, "_addPurchases:forClient:", v6, a4);
}

- (void)_cancelEncodedPurchases:(id)a3 forClient:(id)a4
{
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_array)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v17 = 138412802;
      uint64_t v18 = objc_opt_class(self);
      __int16 v19 = 2048;
      size_t count = xpc_array_get_count(a3);
      __int16 v21 = 2112;
      id v22 = a4;
      uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Cancel %zu purchases for client: %@",  &v17,  32);
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        v15 = v14;
        *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
      }
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100164648;
    v16[3] = &unk_100350058;
    v16[4] = a3;
    v16[5] = self;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v11, v15),  "modifyUsingPurchaseTransactionBlock:",  v16);
  }

- (void)_connectClient:(id)a3 withOutputConnection:(id)a4
{
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    *(_DWORD *)uint64_t v18 = 138412546;
    *(void *)&v18[4] = objc_opt_class(self);
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = a3;
    uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Connected purchase manager: %@",  v18,  22);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      v16 = v14;
      *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
    }
  }

  BOOL v15 = objc_msgSend(a3, "outputConnection", v11, v16) == 0;
  [a3 setOutputConnectionWithConnection:a4];
  [a3 ackConnection];
  if (v15 && [a3 finishesPurchases])
  {
    *(void *)uint64_t v18 = 0LL;
    *(void *)&v18[8] = v18;
    *(void *)&v18[16] = 0x3052000000LL;
    __int16 v19 = sub_100163954;
    v20 = sub_100163964;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001649D0;
    v17[3] = &unk_10034FF78;
    v17[5] = a3;
    v17[6] = v18;
    v17[4] = self;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "readUsingTransactionBlock:",  v17);
    if ([*(id *)(*(void *)&v18[8] + 40) count]) {
      [a3 sendResponses:*(void *)(*(void *)&v18[8] + 40)];
    }

    _Block_object_dispose(v18, 8);
  }

- (void)_finishEncodedPurchaseIdentifiers:(id)a3 forClient:(id)a4
{
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_array)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v17 = 138412802;
      uint64_t v18 = objc_opt_class(self);
      __int16 v19 = 2048;
      size_t count = xpc_array_get_count(a3);
      __int16 v21 = 2112;
      id v22 = a4;
      uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Finishing: %zu purchases for client: %@",  &v17,  32);
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        BOOL v15 = v14;
        *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
      }
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100164BFC;
    v16[3] = &unk_100350080;
    v16[4] = a3;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v11, v15),  "modifyUsingPurchaseTransactionBlock:",  v16);
  }

- (void)_insertEncodedPurchases:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5
{
  id v8 = -[PurchaseController _newPurchasesFromEncodedArray:client:]( self,  "_newPurchasesFromEncodedArray:client:",  a3,  a5);
  if ([v8 count])
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    uint64_t v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      *(_DWORD *)v45 = 138412802;
      *(void *)&v45[4] = objc_opt_class(self);
      *(_WORD *)&v45[12] = 2048;
      *(void *)&v45[14] = [v8 count];
      *(_WORD *)&v45[22] = 2112;
      id v46 = a5;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Inserting %lu purchases for client: %@",  v45,  32);
      if (v13)
      {
        v14 = (void *)v13;
        BOOL v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v28 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    *(void *)v45 = 0LL;
    *(void *)&v45[8] = v45;
    *(void *)&v45[16] = 0x3052000000LL;
    id v46 = sub_100163954;
    v47 = sub_100163964;
    uint64_t v48 = 0LL;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x3052000000LL;
    v36 = sub_100163954;
    v37 = sub_100163964;
    uint64_t v38 = 0LL;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10016512C;
    v32[3] = &unk_1003500D0;
    v32[4] = self;
    v32[5] = v8;
    v32[8] = &v33;
    v32[9] = a4;
    v32[6] = a5;
    v32[7] = v45;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v28),  "modifyUsingPurchaseTransactionBlock:",  v32);
    if ([*(id *)(*(void *)&v45[8] + 40) count])
    {
      id v16 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v16) {
        id v16 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v17) = [v16 shouldLog];
      unsigned int v18 = [v16 shouldLogToDisk];
      __int16 v19 = (os_log_s *)[v16 OSLogObject];
      v20 = v19;
      if (v18) {
        LODWORD(v17) = v17 | 2;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v17;
      }
      else {
        v17 &= 2u;
      }
      if ((_DWORD)v17)
      {
        uint64_t v22 = objc_opt_class(self);
        id v23 = [*(id *)(*(void *)&v45[8] + 40) count];
        int v39 = 138412802;
        uint64_t v40 = v22;
        __int16 v41 = 2048;
        id v42 = v23;
        __int16 v43 = 2112;
        id v44 = a5;
        LODWORD(v30) = 32;
        uint64_t v24 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%@: Skipping %ld existing purchases from client: %@",  &v39,  v30);
        if (v24)
        {
          v25 = (void *)v24;
          v26 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
          free(v25);
          v29 = v26;
          *(void *)&double v21 = SSFileLog(v16, @"%@").n128_u64[0];
        }
      }

      v27 = *(void **)(*(void *)&v45[8] + 40LL);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1001653A0;
      v31[3] = &unk_1003500F8;
      v31[4] = a5;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v31, v21, v29);
    }

    -[PurchaseController _authenticateForPurchases:client:](self, "_authenticateForPurchases:client:", v34[5], a5);
    -[PurchaseController _enqueueNextPurchase](self, "_enqueueNextPurchase");

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(v45, 8);
  }
}

- (void)_markInFlightCanceledPurchaseIdentifier:(id)a3
{
  id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)[v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v15 = 138412546;
    uint64_t v16 = objc_opt_class(self);
    __int16 v17 = 2112;
    id v18 = a3;
    uint64_t v10 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Canceled inflight purchase: %@",  &v15,  22);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      v14 = v12;
      *(void *)&double v9 = SSFileLog(v5, @"%@").n128_u64[0];
    }
  }

  inflightCanceledIdentifiers = self->_inflightCanceledIdentifiers;
  if (!inflightCanceledIdentifiers)
  {
    inflightCanceledIdentifiers = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    self->_inflightCanceledIdentifiers = inflightCanceledIdentifiers;
  }

  -[NSMutableSet addObject:](inflightCanceledIdentifiers, "addObject:", a3, v9, v14);
}

- (void)_moveEncodedPurchaseIDs:(id)a3 afterPurchaseID:(int64_t)a4 forClient:(id)a5
{
  id v7 = -[PurchaseController _newPurchaseIdentifiersFromEncodedArray:]( self,  "_newPurchaseIdentifiersFromEncodedArray:",  a3,  a4,  a5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100165654;
  v8[3] = &unk_100350120;
  v8[4] = v7;
  v8[5] = a4;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v8);
  -[PurchaseController _enqueueNextPurchase](self, "_enqueueNextPurchase");
}

- (id)_newResponsesToPurchasesForClient:(id)a3 inDatabase:(id)a4
{
  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11[0] = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"client_id",  [a3 uniqueIdentifier]);
  v11[1] = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"state",  2LL);
  uint64_t v10 = @"order_id";
  v9[0] = @"encoded_data";
  v9[1] = @"encoded_error";
  v9[2] = @"encoded_response";
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001657F0;
  v8[3] = &unk_10034ADA8;
  v8[4] = v6;
  objc_msgSend( +[PurchaseEntity queryWithDatabase:predicate:orderingProperties:]( PurchaseEntity,  "queryWithDatabase:predicate:orderingProperties:",  a4,  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)),  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1)),  "enumeratePersistentIDsAndProperties:count:usingBlock:",  v9,  3,  v8);
  return v6;
}

- (void)_clientDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PurchaseManagerClient);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    if ([v4 finishesPurchases])
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100165980;
      v7[3] = &unk_10034AE70;
      v7[4] = self;
      v7[5] = v4;
      dispatch_async(dispatchQueue, v7);
    }
  }

- (void)_addPurchases:(id)a3 forClient:(id)a4
{
  if ([a3 count])
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    uint64_t v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      *(_DWORD *)__int16 v43 = 138412802;
      *(void *)&v43[4] = objc_opt_class(self);
      *(_WORD *)&v43[12] = 2048;
      *(void *)&v43[14] = [a3 count];
      *(_WORD *)&v43[22] = 2112;
      id v44 = a4;
      uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "[%@]: Adding %lu purchases from client: %@",  v43,  32);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        v26 = v13;
        SSFileLog(v7, @"%@");
      }
    }

    *(void *)__int16 v43 = 0LL;
    *(void *)&v43[8] = v43;
    *(void *)&v43[16] = 0x3052000000LL;
    id v44 = sub_100163954;
    v45 = sub_100163964;
    uint64_t v46 = 0LL;
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x3052000000LL;
    v34 = sub_100163954;
    uint64_t v35 = sub_100163964;
    uint64_t v36 = 0LL;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100165DAC;
    v30[3] = &unk_100350148;
    v30[4] = self;
    v30[5] = a3;
    v30[7] = v43;
    v30[8] = &v31;
    v30[6] = a4;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v26),  "modifyUsingPurchaseTransactionBlock:",  v30);
    if ([*(id *)(*(void *)&v43[8] + 40) count])
    {
      id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v14) {
        id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v15) = [v14 shouldLog];
      unsigned int v16 = [v14 shouldLogToDisk];
      __int16 v17 = (os_log_s *)[v14 OSLogObject];
      id v18 = v17;
      if (v16) {
        LODWORD(v15) = v15 | 2;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = v15;
      }
      else {
        v15 &= 2u;
      }
      if ((_DWORD)v15)
      {
        uint64_t v20 = objc_opt_class(self);
        id v21 = [*(id *)(*(void *)&v43[8] + 40) count];
        int v37 = 138412802;
        uint64_t v38 = v20;
        __int16 v39 = 2048;
        id v40 = v21;
        __int16 v41 = 2112;
        id v42 = a4;
        LODWORD(v28) = 32;
        uint64_t v22 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Skipping %ld existing purchases from client: %@",  &v37,  v28);
        if (v22)
        {
          id v23 = (void *)v22;
          uint64_t v24 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v22, 4LL);
          free(v23);
          v27 = v24;
          *(void *)&double v19 = SSFileLog(v14, @"%@").n128_u64[0];
        }
      }

      v25 = *(void **)(*(void *)&v43[8] + 40LL);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10016601C;
      v29[3] = &unk_1003500F8;
      v29[4] = a4;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v29, v19, v27);
    }

    if ([(id)v32[5] count]) {
      -[PurchaseController _beginPurchaseBatch:forClient:](self, "_beginPurchaseBatch:forClient:", v32[5], a4);
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v43, 8);
  }

- (void)_authenticateForPurchases:(id)a3 client:(id)a4
{
  if (SSRestrictionsShouldRequirePasswordImmediately(self)
    && (unint64_t)[a3 count] >= 2)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
LABEL_5:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        if (v8 == (id)++v10)
        {
          id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      id v11 = objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "batchIdentifier");
      authenticatingBatchIdentifiers = self->_authenticatingBatchIdentifiers;
      if (!authenticatingBatchIdentifiers)
      {
        authenticatingBatchIdentifiers = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
        self->_authenticatingBatchIdentifiers = authenticatingBatchIdentifiers;
      }

      -[NSMutableIndexSet addIndex:](authenticatingBatchIdentifiers, "addIndex:", v11);
      uint64_t v13 = -[PurchaseAuthenticateOperation initWithPurchases:]( objc_alloc(&OBJC_CLASS___PurchaseAuthenticateOperation),  "initWithPurchases:",  a3);
      -[PurchaseAuthenticateOperation setClientIdentifierHeader:]( v13,  "setClientIdentifierHeader:",  [a4 clientIdentifierHeader]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100166294;
      v14[3] = &unk_100350170;
      v14[5] = a4;
      v14[6] = v11;
      v14[4] = +[SSWeakReference weakReferenceWithObject:]( &OBJC_CLASS___SSWeakReference,  "weakReferenceWithObject:",  self);
      -[PurchaseAuthenticateOperation setAuthenticationBlock:](v13, "setAuthenticationBlock:", v14);
      objc_msgSend( -[PurchaseController _authenticationOperationQueue](self, "_authenticationOperationQueue"),  "addOperation:",  v13);
    }
  }

- (id)_authenticationOperationQueue
{
  id result = self->_authenticationOperationQueue;
  if (!result)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    self->_authenticationOperationQueue = v4;
    -[ISOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", 1LL);
    -[ISOperationQueue setName:]( self->_authenticationOperationQueue,  "setName:",  @"com.apple.itunesstored.PurchaseController.auth");
    objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "addKeepAliveOperationQueue:",  self->_authenticationOperationQueue);
    return self->_authenticationOperationQueue;
  }

  return result;
}

- (void)_beginPurchaseBatch:(id)a3 forClient:(id)a4
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (!v7) {
    goto LABEL_23;
  }
  id v8 = v7;
  uint64_t v9 = 0LL;
  uint64_t v10 = *(void *)v31;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
    }

    id v8 = [a3 countByEnumeratingWithState:&v30 objects:v40 count:16];
  }

  while (v8);
  if (v9)
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v14 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL);
    __int128 v15 = -[NSDictionary initWithObjectsAndKeys:](v13, "initWithObjectsAndKeys:", v14, kCPFreeSpaceEffortLevelKey, 0LL);
    __int128 v16 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", NSHomeDirectory());
    id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    uint64_t v20 = (os_log_s *)[v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      uint64_t v22 = objc_opt_class(self);
      id v23 = [a3 count];
      int v34 = 138412802;
      uint64_t v35 = v22;
      __int16 v36 = 2048;
      uint64_t v37 = v9;
      __int16 v38 = 2048;
      id v39 = v23;
      LODWORD(v28) = 32;
      uint64_t v24 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  2LL,  "%@: Requesting %llu bytes for %lu purchases",  &v34,  v28);
      if (v24)
      {
        v25 = (void *)v24;
        v26 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
        free(v25);
        v27 = v26;
        *(void *)&double v21 = SSFileLog(v17, @"%@").n128_u64[0];
      }
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100166630;
    v29[3] = &unk_100350198;
    v29[4] = self;
    void v29[5] = a3;
    v29[6] = a4;
    -[ISDevice requestFreeSpace:atPath:withOptions:completionBlock:]( +[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance", v21, v27),  "requestFreeSpace:atPath:withOptions:completionBlock:",  v9,  v16,  v15,  v29);
  }

  else
  {
LABEL_23:
    -[PurchaseController _authenticateForPurchases:client:](self, "_authenticateForPurchases:client:", a3, a4);
    -[PurchaseController _enqueueNextPurchase](self, "_enqueueNextPurchase");
  }

- (void)_cancelPurchasesForLackOfDiskSpace:(id)a3 client:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100166D44;
  v7[3] = &unk_100350080;
  v7[4] = a3;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v7);
  objc_msgSend(a4, "sendError:forPurchases:", SSError(SSErrorDomain, 103, 0, 0), a3);
  -[PurchaseController _showNotEnoughDiskSpaceDialogForPurchases:]( self,  "_showNotEnoughDiskSpaceDialogForPurchases:",  a3);
}

- (BOOL)_cancelPurchasesWithBatchIdentifier:(int64_t)a3 client:(id)a4 response:(id)a5
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 1;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = -[PurchaseController _newEncodedPurchaseEntityPropertiesWithResponse:]( self,  "_newEncodedPurchaseEntityPropertiesWithResponse:",  a5);
  if (a4) {
    char v11 = [a4 finishesPurchases] ^ 1;
  }
  else {
    char v11 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100166F8C;
  v14[3] = &unk_1003501E8;
  char v15 = v11;
  v14[6] = &v16;
  void v14[7] = a3;
  v14[4] = v9;
  v14[5] = v10;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v14);
  if (*((_BYTE *)v17 + 24) && -[NSMutableArray count](v9, "count")) {
    [a4 sendResponse:a5 forPurchases:v9];
  }

  char v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

- (void)_checkStoreDownloadQueuesForPurchase:(id)a3 response:(id)a4
{
  id v7 = [a3 valueForDownloadProperty:SSDownloadPropertyKind];
  id v8 = [a4 userIdentifier];
  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  char v12 = (os_log_s *)[v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    int v17 = 138412546;
    uint64_t v18 = objc_opt_class(self);
    __int16 v19 = 2112;
    id v20 = v7;
    uint64_t v14 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Checking queue(s) after purchase trigger-download with kind: %@",  &v17,  22);
    if (v14)
    {
      char v15 = (void *)v14;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
      free(v15);
      *(void *)&double v13 = SSFileLog(v9, @"%@").n128_u64[0];
    }
  }

  if (v7)
  {
    if (v8)
    {
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___StoreDownloadQueueRequest);
      -[StoreDownloadQueueRequest setAccountIdentifier:](v16, "setAccountIdentifier:", v8);
      -[StoreDownloadQueueRequest setCancelsDuplicateDownloads:]( v16,  "setCancelsDuplicateDownloads:",  objc_msgSend( objc_msgSend(a3, "valueForDownloadProperty:", SSDownloadPropertyShouldCancelIfDuplicate),  "BOOLValue"));
      -[StoreDownloadQueueRequest setPurchaseIdentifier:]( v16,  "setPurchaseIdentifier:",  [a3 uniqueIdentifier]);
      -[StoreDownloadQueueRequest setQueueIdentifier:](v16, "setQueueIdentifier:", sub_100092878((uint64_t)v7));
      -[StoreDownloadQueueRequest setReason:](v16, "setReason:", @"trigger-download");
      objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"),  "checkQueuesWithRequest:",  v16);
    }
  }

  else
  {
    objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v13),  "checkQueuesWithReason:accountID:",  @"trigger-download",  v8);
  }

- (id)_clientForMessage:(id)a3 connection:(id)a4
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  clients = self->_clients;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (!v8)
  {
LABEL_13:
    if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) == 0
      && !SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementPurchase))
    {
      return 0LL;
    }

    char v12 = -[PurchaseManagerClient initWithInputConnection:]( objc_alloc(&OBJC_CLASS___PurchaseManagerClient),  "initWithInputConnection:",  a4);
    char v15 = self->_clients;
    if (!v15)
    {
      char v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      self->_clients = v15;
    }

    -[NSMutableArray addObject:](v15, "addObject:", v12);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    int v17 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v16);
    uint64_t v18 = -[XPCClient clientIdentifier](v12, "clientIdentifier");
    if (v17 && v18)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10016763C;
      v23[3] = &unk_100350210;
      v23[4] = v18;
      v23[5] = v17;
      v23[6] = v12;
      objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v23);
    }

    else if (!v17)
    {
LABEL_22:
      -[PurchaseManagerClient setUseRemoteAuthentication:]( v12,  "setUseRemoteAuthentication:",  xpc_dictionary_get_BOOL(a3, "3"));
      __int16 v19 = v12;
      id v20 = -[DownloadManagerClient initWithInputConnection:]( objc_alloc(&OBJC_CLASS___DownloadManagerClient),  "initWithInputConnection:",  a4);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100167810;
      v22[3] = &unk_100350080;
      v22[4] = v20;
      objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v22);

      return v12;
    }

    goto LABEL_22;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v25;
LABEL_3:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v25 != v10) {
      objc_enumerationMutation(clients);
    }
    char v12 = *(PurchaseManagerClient **)(*((void *)&v24 + 1) + 8 * v11);
    id v13 = -[XPCClient copyInputConnection](v12, "copyInputConnection");
    xpc_release(v13);
    if (v13 == a4 && v12 != 0LL) {
      return v12;
    }
    if (v9 == (id)++v11)
    {
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      if (v9) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }

- (id)_clientForUniqueIdentifier:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  clients = self->_clients;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(clients);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 uniqueIdentifier] == (id)a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)_dispatchAsync:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001679C0;
  v6[3] = &unk_100350238;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(dispatchQueue, v6);
}

- (void)_enqueueNextPurchase
{
  if (!-[NSMutableSet count](self->_purchasingIdentifiers, "count"))
  {
    v19[0] = 0LL;
    v19[1] = v19;
    v19[2] = 0x2020000000LL;
    v19[3] = 0LL;
    uint64_t v13 = 0LL;
    __int128 v14 = &v13;
    uint64_t v15 = 0x3052000000LL;
    uint64_t v16 = sub_100163954;
    int v17 = sub_100163964;
    uint64_t v18 = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100167C58;
    v12[3] = &unk_100350288;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = v19;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v12);
    if (v14[5])
    {
      v3 = +[SSWeakReference weakReferenceWithObject:](&OBJC_CLASS___SSWeakReference, "weakReferenceWithObject:", self);
      if ([(id)v14[5] useRemoteAuthentication])
      {
        id v4 = (void *)v14[5];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        void v11[2] = sub_10016802C;
        v11[3] = &unk_1003502B0;
        v11[4] = v3;
        v11[5] = v19;
        [v4 setRemoteAuthenticationHandler:v11];
      }

      id v5 = (void *)v14[5];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100168074;
      v10[3] = &unk_1003502D8;
      v10[4] = v3;
      v10[5] = v19;
      [v5 setPurchaseBlock:v10];
      id v6 = [(id)v14[5] purchase];
      uint64_t v7 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v6 uniqueIdentifier]);
      purchasingIdentifiers = self->_purchasingIdentifiers;
      if (!purchasingIdentifiers)
      {
        purchasingIdentifiers = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        self->_purchasingIdentifiers = purchasingIdentifiers;
      }

      -[NSMutableSet addObject:](purchasingIdentifiers, "addObject:", v7);

      id v9 = -[PurchaseController _purchaseOperationQueue](self, "_purchaseOperationQueue");
      [v9 addOperation:v14[5]];
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(v19, 8);
  }

- (void)_filterPurchases:(id)a3 withTransaction:(id)a4 block:(id)a5
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id obj = a3;
  __int128 v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        __int128 v12 = objc_autoreleasePoolPush();
        id v13 = [a4 existingDownloadForPurchase:v11];
        id v14 = [v13 valueForProperty:@"kind"];
        else {
          char IsSoftwareKind = 0;
        }
        if (SSDownloadKindIsBookToShimKind(v14))
        {
          id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v17) {
            id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v18 = [v17 shouldLog];
          __int16 v19 = (os_log_s *)[v17 OSLogObject];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = v18 & 2;
          }
          if ((_DWORD)v20)
          {
            v34[0] = 0;
            LODWORD(v29) = 2;
            uint64_t v21 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "Found existing book download, sending to bookassetd to sort it out",  v34,  v29);
            if (v21)
            {
              uint64_t v22 = (void *)v21;
              id v23 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL);
              free(v22);
              uint64_t v28 = v23;
              SSFileLog(v17, @"%@");
            }
          }

- (void)_finishAuthenticationRequestForBatchIdentifier:(int64_t)a3 client:(id)a4 withAccountID:(id)a5 error:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100168470;
  v6[3] = &unk_10034BA08;
  v6[4] = a5;
  id v7 = self;
  id v9 = a4;
  int64_t v10 = a3;
  uint64_t v8 = SSErrorBySettingUserInfoValue( a6,  SSPurchaseErrorKeyShouldCancelPurchaseBatch,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  -[PurchaseController _dispatchAsync:](v7, "_dispatchAsync:", v6);
}

- (void)_sendAuthenticateRequestForClientUniqueID:(int64_t)a3 withContext:(id)a4 responseHandler:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100168874;
  v5[3] = &unk_100350320;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  v5[7] = a3;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v5);
}

- (void)_finishPurchaseRequestForClientUniqueID:(int64_t)a3 withResponse:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001688F4;
  v4[3] = &unk_10034DBE8;
  void v4[5] = a4;
  void v4[6] = a3;
  v4[4] = self;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)_garbageCollectInflightPurchases
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100168EEC;
  v2[3] = &unk_100350080;
  v2[4] = self;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingPurchaseTransactionBlock:",  v2);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10016945C;
  void v9[3] = &unk_10034E808;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = a5;
  -[PurchaseController _dispatchAsync:](self, "_dispatchAsync:", v9);
}

- (id)_newEncodedPurchaseEntityPropertiesWithResponse:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ([a3 error])
  {
    uint64_t ArchivableData = SSCodingCreateArchivableData([a3 error]);
    if (ArchivableData)
    {
      id v6 = (void *)ArchivableData;
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", ArchivableData, @"encoded_error");
    }
  }

  id v7 = objc_msgSend(objc_msgSend(a3, "URLResponse"), "databaseEncoding");
  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"encoded_response");
  }
  return v4;
}

- (id)_newPurchaseIdentifiersFromEncodedArray:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_1001695FC;
    applier[3] = &unk_10034BAF8;
    applier[4] = v4;
    xpc_array_apply(a3, applier);
  }

  return v4;
}

- (id)_newPurchasesFromEncodedArray:(id)a3 client:(id)a4
{
  if (!a3 || xpc_get_type(a3) != (xpc_type_t)&_xpc_type_array) {
    return 0LL;
  }
  id v7 = [a4 userAgent];
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100169728;
  void v9[3] = &unk_100350030;
  v9[4] = v7;
  v9[5] = v6;
  xpc_array_apply(a3, v9);
  return v6;
}

- (id)_placeholderAppPathForBundleIdentifier:(id)a3
{
  v3 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"),  @"com.apple.iTunesStore",  a3,  0LL);
  id v4 = -[NSString stringByAppendingPathExtension:]( +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3),  "stringByAppendingPathExtension:",  @"app");

  return v4;
}

- (id)_purchaseOperationQueue
{
  id result = self->_purchaseOperationQueue;
  if (!result)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    self->_purchaseOperationQueue = v4;
    -[ISOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", 1LL);
    -[ISOperationQueue setName:]( self->_purchaseOperationQueue,  "setName:",  @"com.apple.itunesstored.PurchaseController.purchase");
    objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "addKeepAliveOperationQueue:",  self->_purchaseOperationQueue);
    return self->_purchaseOperationQueue;
  }

  return result;
}

- (void)_showNotEnoughDiskSpaceDialogForPurchases:(id)a3
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v5 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  @"NOT_ENOUGH_SPACE_TITLE",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v5);
  id v6 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"OK",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v6);
  id v7 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  @"NOT_ENOUGH_SPACE_SETTINGS",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v7);
  CFDictionarySetValue( Mutable,  SBUserNotificationDefaultButtonTag,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = SSDownloadPropertyTitle;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(a3);
        }
        id v13 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)i) valueForDownloadProperty:v11];
        if (v13)
        {
          id v14 = v13;
          goto LABEL_11;
        }
      }

      id v9 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_11:
  uint64_t v15 = (char *)[a3 count];
  if ([v14 length])
  {
    if (v15 == (char *)2)
    {
      uint64_t v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      id v17 = @"NOT_ENOUGH_SPACE_SPECIFIC_PLUS_ONE_%@";
    }

    else
    {
      if (v15 != (char *)1)
      {
        uint64_t v20 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  @"NOT_ENOUGH_SPACE_SPECIFIC_PLURAL_%@_%ld",  &stru_10035EB18,  0LL);
        id v23 = v15 - 1;
        goto LABEL_20;
      }

      uint64_t v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      id v17 = @"NOT_ENOUGH_SPACE_SPECIFIC_%@";
    }

    uint64_t v20 = -[NSBundle localizedStringForKey:value:table:]( v16,  "localizedStringForKey:value:table:",  v17,  &stru_10035EB18,  0LL);
LABEL_20:
    uint64_t v21 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v14, v23);
    goto LABEL_23;
  }

  unsigned int v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
  else {
    __int16 v19 = @"NOT_ENOUGH_SPACE_PLURAL";
  }
  uint64_t v21 = -[NSBundle localizedStringForKey:value:table:]( v18,  "localizedStringForKey:value:table:",  v19,  &stru_10035EB18,  0LL);
LABEL_23:
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v21);
  id v22 = [[ISUserNotification alloc] initWithDictionary:Mutable options:3];
  objc_msgSend( +[UserNotificationCenter defaultCenter](UserNotificationCenter, "defaultCenter"),  "showUserNotification:withCompletionBlock:",  v22,  &stru_1003503D8);

  CFRelease(Mutable);
}

- (void)_showPurchasesFailedDialogWithFirstTitle:(id)a3 count:(int64_t)a4
{
  __int128 v12 = objc_alloc_init(&OBJC_CLASS___ISDialog);
  id v6 = [a3 length];
  id v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISDialog));
  if (v6)
  {
    -[ISDialog setTitle:]( v12,  "setTitle:",  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"SPECIFIC_PURCHASE_ERROR_TITLE",  &stru_10035EB18,  0LL));
    if (a4 == 2)
    {
      id v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
      id v9 = @"SPECIFIC_PURCHASE_ERROR_BODY_PLUS_ONE_%@";
    }

    else
    {
      if (a4 != 1)
      {
        uint64_t v10 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"SPECIFIC_PURCHASE_ERROR_BODY_PLURAL_%@_%ld",  &stru_10035EB18,  0LL);
        int64_t v11 = a4 - 1;
        goto LABEL_9;
      }

      id v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
      id v9 = @"SPECIFIC_PURCHASE_ERROR_BODY_%@";
    }

    uint64_t v10 = -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  v9,  &stru_10035EB18,  0LL);
LABEL_9:
    -[ISDialog setMessage:]( v12,  "setMessage:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, a3, v11));
    goto LABEL_10;
  }

  -[ISDialog setTitle:]( v12,  "setTitle:",  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"GENERIC_PURCHASE_ERROR",  &stru_10035EB18,  0LL));
LABEL_10:
  -[ISDialog setButtons:]( v12,  "setButtons:",  +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  +[ISDialogButton buttonWithTitle:]( &OBJC_CLASS___ISDialogButton,  "buttonWithTitle:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"OK",  &stru_10035EB18,  0LL))));
  objc_msgSend( +[UserNotificationCenter defaultCenter](UserNotificationCenter, "defaultCenter"),  "showDialog:withCompletionBlock:",  v12,  0);
}

@end