@interface StoreKitClient
- (BOOL)_isPaymentRestricted;
- (BOOL)addPaymentTransaction:(id)a3 withOptions:(id)a4;
- (BOOL)buyMicroPaymentOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4;
- (BOOL)finishPaymentWithMessage:(id)a3;
- (BOOL)isEqualToXPCConnection:(id)a3 paymentQueueClient:(id)a4;
- (BOOL)isSandboxed;
- (BOOL)removePaymentWithObjectID:(id)a3;
- (NSArray)openTransactions;
- (NSManagedObjectID)firstReadyPaymentID;
- (NSManagedObjectID)microPaymentClientID;
- (NSString)clientIdentifier;
- (StoreKitClient)initWithMicroPaymentClientID:(id)a3;
- (StoreKitClient)initWithXPCClient:(id)a3;
- (XPCClient)XPCClient;
- (id)_clientIdentifier;
- (id)_clientIdentity;
- (id)_copyAccountIDsForRefreshReason:(int64_t)a3;
- (id)_copyDownloadsForDownloadIDs:(id)a3 properties:(id)a4 context:(id)a5;
- (id)_initStoreKitClient;
- (id)_lastQueueCheckDate;
- (int64_t)clientState;
- (void)_cancelDownloadsForDownloadIDs:(id)a3;
- (void)_cancelDownloadsForPayments:(id)a3;
- (void)_completeBuyRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5;
- (void)_completeFinishRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5;
- (void)_dispatchAsync:(id)a3;
- (void)_finishLoadQueueOperation:(id)a3;
- (void)_finishRestoreOperation:(id)a3;
- (void)_mergeBatchResponse:(id)a3 forRestoreOperation:(id)a4;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4;
- (void)_reloadClientProperties;
- (void)_sendBuyRequestForPayment:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendDownloadChangesets:(id)a3;
- (void)_sendFinishRequestForPayment:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendMergeResults:(id)a3;
- (void)_sendMessage:(int64_t)a3 forPayments:(id)a4;
- (void)_sendPaymentsAdded:(id)a3;
- (void)_sendPaymentsRemoved:(id)a3;
- (void)_sendPaymentsUpdated:(id)a3;
- (void)_sendRestoreCompletedWithError:(id)a3;
- (void)_setClientState:(int64_t)a3;
- (void)_showPaymentsRestrictedAlert;
- (void)_showPrivacyPromptForPayment:(id)a3 withCompletionBlock:(id)a4;
- (void)cancelDownloadsWithIDs:(id)a3;
- (void)createMicroPaymentClientIfNecessary;
- (void)dealloc;
- (void)pauseDownloadsWithIDs:(id)a3;
- (void)refreshFromServerWithReason:(int64_t)a3;
- (void)refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4;
- (void)restoreCompletedTransactionsWithApplicationUsername:(id)a3;
- (void)resumeDownloadsWithIDs:(id)a3;
- (void)sendDownloadChangesets:(id)a3;
- (void)sendPaymentsUpdatedWithObjectIDs:(id)a3;
- (void)sendPurchaseIntents:(id)a3 forApp:(id)a4;
- (void)setPaymentQueueClient:(id)a3;
- (void)setXPCClient:(id)a3;
- (void)startDownloadsWithIDs:(id)a3;
- (void)startPaymentWithObjectID:(id)a3 withCompletionBlock:(id)a4;
- (void)updatePaymentWithObjectID:(id)a3 purchaseResponse:(id)a4;
@end

@implementation StoreKitClient

- (id)_initStoreKitClient
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StoreKitClient;
  v2 = -[StoreKitClient init](&v6, "init");
  if (v2)
  {
    v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.StoreKitClient.%p",  v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create(-[NSString UTF8String](v3, "UTF8String"), 0LL);

    v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.StoreKitClient.external.%p",  v2);
    v2->_externalQueue = (OS_dispatch_queue *)dispatch_queue_create(-[NSString UTF8String](v4, "UTF8String"), 0LL);
  }

  return v2;
}

- (StoreKitClient)initWithMicroPaymentClientID:(id)a3
{
  v4 = -[StoreKitClient _initStoreKitClient](self, "_initStoreKitClient");
  if (v4) {
    v4->_databaseClientObjectID = (NSManagedObjectID *)a3;
  }
  return v4;
}

- (StoreKitClient)initWithXPCClient:(id)a3
{
  v4 = -[StoreKitClient _initStoreKitClient](self, "_initStoreKitClient");
  if (v4) {
    v4->_client = (XPCClient *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  ISNetworkTypeChangedNotification,  0LL);
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  externalQueue = (dispatch_object_s *)self->_externalQueue;
  if (externalQueue) {
    dispatch_release(externalQueue);
  }
  -[LoadCompletedMicroPaymentsOperation setCompletionBlock:](self->_restoreOperation, "setCompletionBlock:", 0LL);
  -[LoadCompletedMicroPaymentsOperation setPaymentBatchBlock:](self->_restoreOperation, "setPaymentBatchBlock:", 0LL);

  -[LoadMicroPaymentQueuesOperation setCompletionBlock:](self->_loadQueueOperation, "setCompletionBlock:", 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StoreKitClient;
  -[StoreKitClient dealloc](&v6, "dealloc");
}

- (BOOL)addPaymentTransaction:(id)a3 withOptions:(id)a4
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F623C;
  v7[3] = &unk_10034E740;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_sync(dispatchQueue, v7);
  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)cancelDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F6A90;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (NSString)clientIdentifier
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_1000F6E74;
  uint64_t v10 = sub_1000F6E84;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F6E90;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)clientState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F6F54;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)createMicroPaymentClientIfNecessary
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F6FC0;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (NSManagedObjectID)firstReadyPaymentID
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_1000F6E74;
  uint64_t v10 = sub_1000F6E84;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F72D0;
  v5[3] = &unk_10034DC10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = (NSManagedObjectID *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEqualToXPCConnection:(id)a3 paymentQueueClient:(id)a4
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F758C;
  v7[3] = &unk_10034E768;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_sync(dispatchQueue, v7);
  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isSandboxed
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F7878;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSManagedObjectID)microPaymentClientID
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_1000F6E74;
  uint64_t v10 = sub_1000F6E84;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F7970;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSManagedObjectID *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)openTransactions
{
  char v3 = (NSArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F7A18;
  v6[3] = &unk_10034AE70;
  v6[4] = self;
  v6[5] = v3;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

- (void)pauseDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F7C68;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)refreshFromServerWithReason:(int64_t)a3
{
}

- (void)refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F8050;
  v4[3] = &unk_10034DBE8;
  v4[5] = a4;
  v4[6] = a3;
  v4[4] = self;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (BOOL)removePaymentWithObjectID:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F80F4;
  block[3] = &unk_10034E790;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)restoreCompletedTransactionsWithApplicationUsername:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F81EC;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)resumeDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F8738;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)sendDownloadChangesets:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F8B1C;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)sendPaymentsUpdatedWithObjectIDs:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F8B80;
  v4[3] = &unk_10034AE70;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setPaymentQueueClient:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F8D24;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setXPCClient:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F8E20;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)startDownloadsWithIDs:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F8F18;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)startPaymentWithObjectID:(id)a3 withCompletionBlock:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F9600;
  v4[3] = &unk_10034E7E0;
  v4[4] = a3;
  v4[5] = self;
  void v4[6] = a4;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)updatePaymentWithObjectID:(id)a3 purchaseResponse:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F9908;
  v4[3] = &unk_10034AF00;
  v4[4] = a3;
  v4[5] = a4;
  void v4[6] = self;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)sendPurchaseIntents:(id)a3 forApp:(id)a4
{
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        -[NSMutableArray addObject:]( v7,  "addObject:",  [*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) productIdentifier]);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  v12 = -[LoadMicroPaymentProductsOperation initWithProductIdentifiers:]( objc_alloc(&OBJC_CLASS___LoadMicroPaymentProductsOperation),  "initWithProductIdentifiers:",  v7);

  v13 = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity);
  -[StoreKitClientIdentity setBundleIdentifier:](v13, "setBundleIdentifier:", a4);
  id v14 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  a4);
  if ((objc_msgSend(objc_msgSend(v14, "appState"), "isValid") & 1) != 0
    || (id v14 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:]( LSPlugInKitProxy,  "pluginKitProxyForIdentifier:",  a4),  v15 = objc_msgSend(objc_msgSend(v14, "containingBundle"), "bundleType"),  objc_msgSend(v15, "isEqualToString:", LSUserApplicationType)))
  {
    uint64_t v16 = (uint64_t)[v14 profileValidated];
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  -[StoreKitClientIdentity setSandboxed:](v13, "setSandboxed:", v16);
  -[LoadMicroPaymentProductsOperation setClientIdentity:](v12, "setClientIdentity:", v13);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F9BBC;
  v17[3] = &unk_10034AF00;
  v17[4] = v12;
  v17[5] = self;
  v17[6] = a4;
  -[LoadMicroPaymentProductsOperation setCompletionBlock:](v12, "setCompletionBlock:", v17);
  [(id)sub_100041F7C() addOperation:v12];
}

- (XPCClient)XPCClient
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  id v9 = sub_1000F6E74;
  uint64_t v10 = sub_1000F6E84;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FA008;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (XPCClient *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)finishPaymentWithMessage:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FA0D0;
  block[3] = &unk_10034E790;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_networkTypeChangedNotification:(id)a3
{
  if (-[ISNetworkObserver networkType]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance", a3),  "networkType"))
  {
    if ((id)-[StoreKitClient clientState](self, "clientState") == (id)3) {
      -[StoreKitClient refreshFromServerWithReason:](self, "refreshFromServerWithReason:", 1LL);
    }
  }

- (void)_cancelDownloadsForDownloadIDs:(id)a3
{
  if ([a3 count])
  {
    id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v6 = [v5 shouldLog];
    else {
      LODWORD(v7) = v6;
    }
    uint64_t v8 = (os_log_s *)[v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      uint64_t v7 = v7;
    }
    else {
      v7 &= 2u;
    }
    if ((_DWORD)v7)
    {
      int v15 = 138543618;
      uint64_t v16 = objc_opt_class(self);
      __int16 v17 = 2048;
      id v18 = [a3 count];
      uint64_t v10 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%{public}@: Canceling %lu downloads",  &v15,  22);
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
        free(v11);
        v13 = v12;
        *(void *)&double v9 = SSFileLog(v5, @"%@").n128_u64[0];
      }
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000FA908;
    v14[3] = &unk_10034D7F0;
    v14[4] = a3;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v9, v13),  "modifyUsingTransactionBlock:",  v14);
  }

- (void)_cancelDownloadsForPayments:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v9) downloads];
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            id v14 = 0LL;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) downloadID];
              if (v15) {
                -[NSMutableOrderedSet addObject:](v5, "addObject:", v15);
              }
              id v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v12);
        }

        double v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      id v7 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v7);
  }

  -[StoreKitClient _cancelDownloadsForDownloadIDs:](self, "_cancelDownloadsForDownloadIDs:", v5);
}

- (id)_clientIdentifier
{
  return objc_msgSend(-[StoreKitClient _clientIdentity](self, "_clientIdentity"), "bundleIdentifier");
}

- (id)_clientIdentity
{
  id result = self->_clientIdentity;
  if (!result)
  {
    -[StoreKitClient _reloadClientProperties](self, "_reloadClientProperties");
    return self->_clientIdentity;
  }

  return result;
}

- (id)_copyAccountIDsForRefreshReason:(int64_t)a3
{
  char v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (self->_databaseClientObjectID)
  {
    id v5 = objc_msgSend( objc_msgSend( +[NSThread beginManagedContextSession](NSThread, "beginManagedContextSession"),  "objectWithID:",  self->_databaseClientObjectID),  "payments");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) userDSID];
          if (v10) {
            -[NSMutableSet addObject:](v4, "addObject:", v10);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    +[NSThread endManagedContextSession](&OBJC_CLASS___NSThread, "endManagedContextSession");
  }

  if (!-[NSMutableSet count](v4, "count"))
  {
    if (objc_msgSend( +[LSApplicationProxy applicationProxyForIdentifier:]( LSApplicationProxy,  "applicationProxyForIdentifier:",  objc_msgSend(-[StoreKitClient _clientIdentity](self, "_clientIdentity"), "bundleIdentifier")),  "isBetaApp"))
    {
      id v11 = objc_msgSend( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreBeta),  "ams_activeiTunesAccount");
      if (v11)
      {
LABEL_19:
        id v13 = objc_msgSend(v11, "ams_DSID");
        goto LABEL_21;
      }

      id v12 = &AMSAccountMediaTypeAppStore;
    }

    else
    {
      if (!objc_msgSend(-[StoreKitClient _clientIdentity](self, "_clientIdentity"), "isSandboxed"))
      {
        id v13 = objc_msgSend( objc_msgSend( +[SSAccountStore defaultStore](SSAccountStore, "defaultStore"),  "activeAccount"),  "uniqueIdentifier");
LABEL_21:
        if (v13) {
          -[NSMutableSet addObject:](v4, "addObject:", v13);
        }
        return v4;
      }

      id v12 = &AMSAccountMediaTypeAppStoreSandbox;
    }

    id v11 = objc_msgSend( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  *v12),  "ams_activeiTunesAccount");
    if (!v11) {
      return v4;
    }
    goto LABEL_19;
  }

  return v4;
}

- (void)_completeBuyRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FAD50;
  v5[3] = &unk_10034E808;
  v5[4] = a4;
  v5[5] = a3;
  void v5[6] = self;
  v5[7] = a5;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v5);
}

- (void)_completeFinishRequest:(id)a3 forPaymentID:(id)a4 withBlock:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FB1C0;
  v5[3] = &unk_10034E808;
  v5[4] = a4;
  v5[5] = a3;
  void v5[6] = self;
  v5[7] = a5;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v5);
}

- (id)_copyDownloadsForDownloadIDs:(id)a3 properties:(id)a4 context:(id)a5
{
  __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = [a5 objectWithID:self->_databaseClientObjectID];
  id v10 = +[MicroPaymentDownload downloadEntityFromContext:]( &OBJC_CLASS___MicroPaymentDownload,  "downloadEntityFromContext:",  a5);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = a3;
  id v11 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v14);
        __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
        -[NSFetchRequest setEntity:](v16, "setEntity:", v10);
        -[NSFetchRequest setPredicate:]( v16,  "setPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(downloadID=%@) AND (payment.client=%@)",  v15,  v9));
        -[NSFetchRequest setPropertiesToFetch:](v16, "setPropertiesToFetch:", a4);
        id v17 = [a5 executeFetchRequest:v16 error:0];
        if ([v17 count] == (id)1) {
          -[NSMutableArray addObject:](v19, "addObject:", [v17 objectAtIndex:0]);
        }

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }

  return v19;
}

- (void)_dispatchAsync:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FB6F4;
  block[3] = &unk_10034BB20;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_finishLoadQueueOperation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000FB774;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)_finishRestoreOperation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000FBC4C;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (BOOL)_isPaymentRestricted
{
  if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0LL)) {
    return 1;
  }
  id v4 = objc_msgSend((id)ISWeakLinkedClassForString(@"MCProfileConnection", 17), "sharedConnection");
  if (objc_msgSend( v4,  "effectiveRestrictedBoolValueForSetting:",  ISWeakLinkedStringConstantForString("MCFeatureInAppPurchasesAllowed", 17)) == 2) {
    return objc_msgSend( -[StoreKitClient _clientIdentity](self, "_clientIdentity"),  "ignoresInAppPurchaseRestriction") ^ 1;
  }
  else {
    return 0;
  }
}

- (id)_lastQueueCheckDate
{
  if (!self->_databaseClientObjectID) {
    return 0LL;
  }
  id v2 = objc_msgSend( objc_msgSend( +[NSThread beginManagedContextSession](NSThread, "beginManagedContextSession"),  "objectWithID:",  self->_databaseClientObjectID),  "lastQueueCheckDate");
  +[NSThread endManagedContextSession](&OBJC_CLASS___NSThread, "endManagedContextSession");
  return v2;
}

- (void)_mergeBatchResponse:(id)a3 forRestoreOperation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000FC06C;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  -[StoreKitClient _dispatchAsync:](self, "_dispatchAsync:", v4, a4);
}

- (void)_refreshFromServerWithReason:(int64_t)a3 accountIdentifier:(id)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    -[StoreKitClient _setClientState:](self, "_setClientState:", 0LL);
  }
  if (self->_state == 1)
  {
    if (!a3)
    {
      id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v7) {
        id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v8 = [v7 shouldLog];
      else {
        LODWORD(v9) = v8;
      }
      id v10 = (os_log_s *)[v7 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        uint64_t v9 = v9;
      }
      else {
        v9 &= 2u;
      }
      if ((_DWORD)v9)
      {
        int v39 = 138543618;
        uint64_t v40 = objc_opt_class(self);
        __int16 v41 = 2112;
        id v42 = -[StoreKitClient _clientIdentifier](self, "_clientIdentifier");
        uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%{public}@: Client checked in mid-refresh: %@",  &v39,  22);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          id v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
          free(v13);
          v36 = v14;
          *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
        }
      }

      -[LoadMicroPaymentQueuesOperation setReason:](self->_loadQueueOperation, "setReason:", 0LL, v11, v36);
    }
  }

  else
  {
    id v15 = -[StoreKitClient _copyAccountIDsForRefreshReason:](self, "_copyAccountIDsForRefreshReason:", a3);
    __int128 v16 = v15;
    if (a4) {
      [v15 addObject:a4];
    }
    if ([v16 count])
    {
      id v37 = [v16 allObjects];
      id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v18 = [v17 shouldLog];
      else {
        LODWORD(v19) = v18;
      }
      __int128 v20 = (os_log_s *)[v17 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        uint64_t v19 = v19;
      }
      else {
        v19 &= 2u;
      }
      if ((_DWORD)v19)
      {
        int v39 = 138544130;
        uint64_t v40 = objc_opt_class(self);
        __int16 v41 = 2048;
        id v42 = (id)a3;
        __int16 v43 = 2112;
        id v44 = -[StoreKitClient _clientIdentifier](self, "_clientIdentifier");
        __int16 v45 = 2112;
        id v46 = [v37 componentsJoinedByString:@","];
        uint64_t v22 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "%{public}@: Refreshing from server (%ld; %@; %@)",
                &v39,
                42);
        if (v22)
        {
          __int128 v23 = (void *)v22;
          __int128 v24 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v22, 4LL);
          free(v23);
          v36 = v24;
          *(void *)&double v21 = SSFileLog(v17, @"%@").n128_u64[0];
        }
      }

      loadQueueOperation = self->_loadQueueOperation;
      if (loadQueueOperation)
      {
        -[LoadMicroPaymentQueuesOperation setCompletionBlock:](loadQueueOperation, "setCompletionBlock:", 0LL, v21);

        self->_loadQueueOperation = 0LL;
      }

      v26 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueuesOperation);
      self->_loadQueueOperation = v26;
      -[LoadMicroPaymentQueuesOperation setClientIdentity:]( v26,  "setClientIdentity:",  -[StoreKitClient _clientIdentity](self, "_clientIdentity"));
      -[LoadMicroPaymentQueuesOperation setLastQueueCheckDate:]( self->_loadQueueOperation,  "setLastQueueCheckDate:",  -[StoreKitClient _lastQueueCheckDate](self, "_lastQueueCheckDate"));
      -[LoadMicroPaymentQueuesOperation setReason:](self->_loadQueueOperation, "setReason:", a3);
      -[LoadMicroPaymentQueuesOperation setShouldRunWithBackgroundPriority:]( self->_loadQueueOperation,  "setShouldRunWithBackgroundPriority:",  1LL);
      -[LoadMicroPaymentQueuesOperation setUserDSIDs:](self->_loadQueueOperation, "setUserDSIDs:", v37);
      v27 = +[SSWeakReference weakReferenceWithObject:](&OBJC_CLASS___SSWeakReference, "weakReferenceWithObject:", self);
      v28 = self->_loadQueueOperation;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_1000FC78C;
      v38[3] = &unk_10034AE70;
      v38[4] = v27;
      v38[5] = v26;
      -[LoadMicroPaymentQueuesOperation setCompletionBlock:](v28, "setCompletionBlock:", v38);
      self->_lastRefreshReason = a3;
      -[StoreKitClient _setClientState:](self, "_setClientState:", 1LL);
      [(id)sub_100041F7C() addOperation:self->_loadQueueOperation];
    }

    else
    {
      id v29 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v29) {
        id v29 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v30 = [v29 shouldLog];
      else {
        LODWORD(v31) = v30;
      }
      v32 = (os_log_s *)[v29 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        uint64_t v31 = v31;
      }
      else {
        v31 &= 2u;
      }
      if ((_DWORD)v31)
      {
        int v39 = 138543362;
        uint64_t v40 = objc_opt_class(self);
        uint64_t v33 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  1LL,  "%{public}@: Tried to refresh from server, but either had no payments or no usable DSIDs",  &v39,  12);
        if (v33)
        {
          v34 = (void *)v33;
          v35 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v33, 4LL);
          free(v34);
          v36 = v35;
          SSFileLog(v29, @"%@");
        }
      }
    }
  }

  +[ISLoadURLBagOperation decrementNetworkCounterForBagContext:]( &OBJC_CLASS___ISLoadURLBagOperation,  "decrementNetworkCounterForBagContext:",  +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL, v36));
}

- (void)_reloadClientProperties
{
  clientIdentity = self->_clientIdentity;
  if (!clientIdentity)
  {
    clientIdentity = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity);
    self->_clientIdentity = clientIdentity;
  }

  if (self->_client && !-[StoreKitClientIdentity usesIdentityAttributes](clientIdentity, "usesIdentityAttributes"))
  {
    -[StoreKitClientIdentity setBundleIdentifier:]( self->_clientIdentity,  "setBundleIdentifier:",  -[XPCClient clientIdentifier](self->_client, "clientIdentifier"));
    -[StoreKitClientIdentity setSandboxed:]( self->_clientIdentity,  "setSandboxed:",  -[XPCClient isAppleSigned](self->_client, "isAppleSigned") ^ 1);
  }

  else if (self->_databaseClientObjectID)
  {
    id v4 = objc_msgSend( +[NSThread beginManagedContextSession](NSThread, "beginManagedContextSession"),  "objectWithID:",  self->_databaseClientObjectID);
    -[StoreKitClientIdentity setBundleIdentifier:]( self->_clientIdentity,  "setBundleIdentifier:",  [v4 identifier]);
    -[StoreKitClientIdentity setBundleVersion:]( self->_clientIdentity,  "setBundleVersion:",  [v4 bundleVersion]);
    -[StoreKitClientIdentity setStoreVersion:]( self->_clientIdentity,  "setStoreVersion:",  [v4 storeVersion]);
    -[StoreKitClientIdentity setStoreIdentifier:]( self->_clientIdentity,  "setStoreIdentifier:",  [v4 storeIdentifier]);
    -[StoreKitClientIdentity setVendorIdentifier:]( self->_clientIdentity,  "setVendorIdentifier:",  [v4 vendorIdentifier]);
    -[StoreKitClientIdentity setAllowsBootstrapCellularData:]( self->_clientIdentity,  "setAllowsBootstrapCellularData:",  objc_msgSend(objc_msgSend(v4, "allowsBootstrapCellularData"), "BOOLValue"));
    -[StoreKitClientIdentity setHidesConfirmationDialogs:]( self->_clientIdentity,  "setHidesConfirmationDialogs:",  objc_msgSend(objc_msgSend(v4, "hidesConfirmationDialogs"), "BOOLValue"));
    -[StoreKitClientIdentity setIgnoresInAppPurchaseRestriction:]( self->_clientIdentity,  "setIgnoresInAppPurchaseRestriction:",  objc_msgSend(objc_msgSend(v4, "ignoresInAppPurchaseRestriction"), "BOOLValue"));
    -[StoreKitClientIdentity setReceiptDirectoryPath:]( self->_clientIdentity,  "setReceiptDirectoryPath:",  [v4 receiptDirectoryPath]);
    -[StoreKitClientIdentity setRequiresAuthenticationForPayment:]( self->_clientIdentity,  "setRequiresAuthenticationForPayment:",  objc_msgSend(objc_msgSend(v4, "requiresAuthenticationForPayment"), "BOOLValue"));
    -[StoreKitClientIdentity setSandboxed:]( self->_clientIdentity,  "setSandboxed:",  objc_msgSend(objc_msgSend(v4, "sandboxed"), "BOOLValue"));
    -[StoreKitClientIdentity setUsesIdentityAttributes:]( self->_clientIdentity,  "setUsesIdentityAttributes:",  objc_msgSend(objc_msgSend(v4, "usesIdentityAttributes"), "BOOLValue"));
    +[NSThread endManagedContextSession](&OBJC_CLASS___NSThread, "endManagedContextSession");
  }

- (void)_showPrivacyPromptForPayment:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = [a3 objectID];
  id v7 = objc_alloc(&OBJC_CLASS___PrivacyPromptOperation);
  unsigned int v8 = -[PrivacyPromptOperation initWithPrivacyIdentifier:]( v7,  "initWithPrivacyIdentifier:",  SSPrivacyIdentifierAppStore);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000FCA58;
  v9[3] = &unk_10034E858;
  v9[4] = +[SSWeakReference weakReferenceWithObject:](&OBJC_CLASS___SSWeakReference, "weakReferenceWithObject:", self);
  v9[5] = v6;
  v9[6] = v8;
  v9[7] = a4;
  -[PrivacyPromptOperation setCompletion:](v8, "setCompletion:", v9);
  [(id)sub_100041F7C() addOperation:v8];
}

- (void)_sendBuyRequestForPayment:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___BuyMicroPaymentOperation);
  -[BuyMicroPaymentOperation setApplicationUsername:]( v7,  "setApplicationUsername:",  [a3 applicationUsername]);
  -[BuyMicroPaymentOperation setBuyParameters:](v7, "setBuyParameters:", [a3 actionParams]);
  -[BuyMicroPaymentOperation setClientAuditTokenData:]( v7,  "setClientAuditTokenData:",  -[XPCClient auditTokenData](self->_client, "auditTokenData"));
  -[BuyMicroPaymentOperation setClientIdentity:]( v7,  "setClientIdentity:",  -[StoreKitClient _clientIdentity](self, "_clientIdentity"));
  -[BuyMicroPaymentOperation setPartnerIdentifier:](v7, "setPartnerIdentifier:", [a3 partnerIdentifier]);
  -[BuyMicroPaymentOperation setPartnerTransactionIdentifier:]( v7,  "setPartnerTransactionIdentifier:",  [a3 partnerTransactionIdentifier]);
  -[BuyMicroPaymentOperation setProductIdentifier:](v7, "setProductIdentifier:", [a3 productIdentifier]);
  -[BuyMicroPaymentOperation setRequestData:](v7, "setRequestData:", [a3 requestData]);
  -[BuyMicroPaymentOperation setOriginatingStorefront:]( v7,  "setOriginatingStorefront:",  [a3 originatingStorefront]);
  -[BuyMicroPaymentOperation setDiscountIdentifier:]( v7,  "setDiscountIdentifier:",  [a3 discountIdentifier]);
  -[BuyMicroPaymentOperation setDiscountKeyIdentifier:]( v7,  "setDiscountKeyIdentifier:",  [a3 discountKeyIdentifier]);
  -[BuyMicroPaymentOperation setDiscountNonceString:]( v7,  "setDiscountNonceString:",  [a3 discountNonceString]);
  -[BuyMicroPaymentOperation setDiscountSignature:](v7, "setDiscountSignature:", [a3 discountSignature]);
  -[BuyMicroPaymentOperation setDiscountTimestamp:](v7, "setDiscountTimestamp:", [a3 discountTimestamp]);
  -[BuyMicroPaymentOperation setDelegate:](v7, "setDelegate:", self);
  id v8 = [a3 quantity];
  if (v8) {
    uint64_t v9 = (uint64_t)[v8 integerValue];
  }
  else {
    uint64_t v9 = 1LL;
  }
  -[BuyMicroPaymentOperation setQuantity:](v7, "setQuantity:", v9);
  -[BuyMicroPaymentOperation setSimulatesAskToBuyInSandbox:]( v7,  "setSimulatesAskToBuyInSandbox:",  objc_msgSend(objc_msgSend(a3, "simulatesAskToBuyInSandbox"), "BOOLValue"));
  id v10 = [a3 objectID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000FD018;
  v11[3] = &unk_10034E808;
  v11[4] = +[SSWeakReference weakReferenceWithObject:](&OBJC_CLASS___SSWeakReference, "weakReferenceWithObject:", self);
  v11[5] = v7;
  v11[6] = v10;
  v11[7] = a4;
  -[BuyMicroPaymentOperation setCompletionBlock:](v7, "setCompletionBlock:", v11);
  [(id)sub_100041F7C() addOperation:v7];
}

- (void)_sendDownloadChangesets:(id)a3
{
  if (-[XPCClient canReceiveMessages](self->_client, "canReceiveMessages"))
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "0", 20006LL);
    sub_100146884(v5, "1", a3);
    -[SSXPCConnection sendMessage:]( -[XPCClient outputConnection](self->_client, "outputConnection"),  "sendMessage:",  v5);
    xpc_release(v5);
  }

  else
  {
    -[XPCClient sendCoalescedMessageWithIdentifier:](self->_client, "sendCoalescedMessageWithIdentifier:", 20001LL);
  }

- (void)_sendFinishRequestForPayment:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___FinishMicroPaymentOperation);
  -[FinishMicroPaymentOperation setClientIdentity:]( v7,  "setClientIdentity:",  -[StoreKitClient _clientIdentity](self, "_clientIdentity"));
  -[FinishMicroPaymentOperation setTransactionIdentifier:]( v7,  "setTransactionIdentifier:",  [a3 transactionIdentifier]);
  -[FinishMicroPaymentOperation setUserDSID:](v7, "setUserDSID:", [a3 userDSID]);
  id v8 = [a3 objectID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000FD1D4;
  v9[3] = &unk_10034E808;
  v9[4] = +[SSWeakReference weakReferenceWithObject:](&OBJC_CLASS___SSWeakReference, "weakReferenceWithObject:", self);
  v9[5] = v7;
  v9[6] = v8;
  v9[7] = a4;
  -[FinishMicroPaymentOperation setCompletionBlock:](v7, "setCompletionBlock:", v9);
  [(id)sub_100041F7C() addOperation:v7];
}

- (void)_sendMergeResults:(id)a3
{
  if (a3)
  {
    if (-[XPCClient canReceiveMessages](self->_client, "canReceiveMessages"))
    {
      -[StoreKitClient _sendPaymentsAdded:](self, "_sendPaymentsAdded:", [a3 addedPayments]);
      -[StoreKitClient _sendPaymentsUpdated:](self, "_sendPaymentsUpdated:", [a3 changedPayments]);
    }

    else
    {
      -[XPCClient sendCoalescedMessageWithIdentifier:](self->_client, "sendCoalescedMessageWithIdentifier:", 20001LL);
    }
  }

- (void)_sendMessage:(int64_t)a3 forPayments:(id)a4
{
  if (!-[XPCClient canReceiveMessages](self->_client, "canReceiveMessages")) {
    goto LABEL_15;
  }
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a4);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((char *)objc_msgSend(objc_msgSend(v12, "state"), "integerValue") - 5 <= (char *)0xFFFFFFFFFFFFFFFDLL)
        {
          id v13 = [v12 copyPaymentTransaction];
          if (v13)
          {
            id v14 = v13;
            -[NSMutableArray addObject:](v7, "addObject:", v13);
          }
        }
      }

      id v9 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  if (v7)
  {
    if (-[NSMutableArray count](v7, "count"))
    {
      xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v15, "0", a3);
      sub_100146884(v15, "1", v7);
      -[SSXPCConnection sendMessage:]( -[XPCClient outputConnection](self->_client, "outputConnection"),  "sendMessage:",  v15);
      xpc_release(v15);
    }
  }

  else
  {
LABEL_15:
    -[XPCClient sendCoalescedMessageWithIdentifier:](self->_client, "sendCoalescedMessageWithIdentifier:", 20001LL);
    id v7 = 0LL;
  }
}

- (void)_sendPaymentsAdded:(id)a3
{
}

- (void)_sendPaymentsRemoved:(id)a3
{
  if (-[XPCClient canReceiveMessages](self->_client, "canReceiveMessages"))
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "0", 20004LL);
    SSXPCDictionarySetCFObject(v5, "1", a3);
    -[SSXPCConnection sendMessage:]( -[XPCClient outputConnection](self->_client, "outputConnection"),  "sendMessage:",  v5);
    xpc_release(v5);
  }

  else
  {
    -[XPCClient sendCoalescedMessageWithIdentifier:](self->_client, "sendCoalescedMessageWithIdentifier:", 20001LL);
  }

- (void)_sendPaymentsUpdated:(id)a3
{
}

- (void)_sendRestoreCompletedWithError:(id)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v5, "0", 20005LL);
  if (a3)
  {
    uint64_t v6 = sub_1000423B4(a3);
    uint64_t v7 = sub_100146878(v6);
    sub_100146884(v5, "1", v7);
  }

  -[SSXPCConnection sendMessage:](-[XPCClient outputConnection](self->_client, "outputConnection"), "sendMessage:", v5);
  xpc_release(v5);
}

- (void)_setClientState:(int64_t)a3
{
  if (self->_state != a3)
  {
    xpc_object_t v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v6 = v5;
    if (self->_state == 3) {
      -[NSNotificationCenter removeObserver:name:object:]( v5,  "removeObserver:name:object:",  self,  ISNetworkTypeChangedNotification,  0LL);
    }
    self->_state = a3;
    if (a3 == 3) {
      -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  self,  "_networkTypeChangedNotification:",  ISNetworkTypeChangedNotification,  0LL);
    }
  }

- (void)_showPaymentsRestrictedAlert
{
  id v2 = objc_alloc_init(&OBJC_CLASS___ISDialog);
  -[ISDialog setButtons:]( v2,  "setButtons:",  +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  +[ISDialogButton buttonWithTitle:]( &OBJC_CLASS___ISDialogButton,  "buttonWithTitle:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISOperation)),  "localizedStringForKey:value:table:",  @"OK",  &stru_10035EB18,  0LL))));
  -[ISDialog setMessage:]( v2,  "setMessage:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISOperation)),  "localizedStringForKey:value:table:",  @"MICRO_PAYMENTS_RESTRICTED_BODY",  &stru_10035EB18,  0LL));
  -[ISDialog setTitle:]( v2,  "setTitle:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISOperation)),  "localizedStringForKey:value:table:",  @"MICRO_PAYMENTS_RESTRICTED_TITLE",  &stru_10035EB18,  0LL));
  objc_msgSend( +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"),  "addOperation:",  +[ISDialogOperation operationWithDialog:](ISDialogOperation, "operationWithDialog:", v2));
}

- (BOOL)buyMicroPaymentOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 1;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FD7FC;
  v7[3] = &unk_10034E740;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = &v8;
  dispatch_sync(dispatchQueue, v7);
  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end