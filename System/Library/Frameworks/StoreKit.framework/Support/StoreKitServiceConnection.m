@interface StoreKitServiceConnection
+ (id)allConnections;
+ (id)connectionForClient:(id)a3;
+ (id)octaneConnectionForBundleID:(id)a3;
+ (int64_t)_apiVersionForClientDict:(id)a3;
+ (void)initialize;
- (BOOL)_isClientValidForReview:(id)a3;
- (BOOL)_isSKANVersionFourOrHigher:(id)a3;
- (NSString)description;
- (NSXPCConnection)xpcConnection;
- (SKClientProtocol)remoteObject;
- (StoreKitServiceConnection)initWithConnection:(id)a3 remoteObject:(id)a4 pid:(int)a5;
- (_TtC9storekitd6Client)client;
- (id)_bundleURLForConnection:(id)a3;
- (id)_offerCodeRedemptionURLForClient:(id)a3;
- (id)_processDownloadsForTransactions:(id)a3;
- (id)_silentAuthWithClientInfo:(id)a3 account:(id)a4 logKey:(id)a5;
- (void)_handleTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5;
- (void)_processPayment:(id)a3 excludeReceipt:(BOOL)a4 privacyAcknowledgementRequired:(BOOL)a5 forClient:(id)a6 apiVersion:(int64_t)a7 paymentDelegate:(id)a8 isProcessingInterruptedBuy:(BOOL)a9 reply:(id)a10;
- (void)acknowledgeMessage:(id)a3 reply:(id)a4;
- (void)addDownloadWithID:(id)a3;
- (void)addPurchaseIntentWithRequest:(id)a3 reply:(id)a4;
- (void)appTransactionForClient:(id)a3 ignoreCache:(BOOL)a4 reply:(id)a5;
- (void)arcadeSubscriptionStatusWithNonce:(unint64_t)a3 resultHandler:(id)a4;
- (void)authenticateAndSyncTransactionsAndStatusWithReply:(id)a3;
- (void)bindPaymentAccountWithRequest:(id)a3 reply:(id)a4;
- (void)canMakePaymentsWithReply:(id)a3;
- (void)cancelDownloadWithID:(id)a3;
- (void)checkForMessages;
- (void)checkPaymentAccountBindingEligibilityWithRequest:(id)a3 reply:(id)a4;
- (void)checkServerQueueForClientIfNecessary:(id)a3 forceCheck:(BOOL)a4 reply:(id)a5;
- (void)checkServerQueueForQueue:(id)a3 withClient:(id)a4;
- (void)clearPurchaseIntentsWithRequest:(id)a3 reply:(id)a4;
- (void)clientOverridesWithReply:(id)a3;
- (void)dealloc;
- (void)deleteContentForProductID:(id)a3;
- (void)displayMessageWithType:(id)a3;
- (void)downloadManager:(id)a3 updatedStatus:(id)a4;
- (void)enumerateCurrentReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5;
- (void)enumerateReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5;
- (void)enumerateSubscriptionStatusesWithReceiver:(id)a3 reply:(id)a4;
- (void)enumerateUnfinishedTransactionsWithReceiver:(id)a3 reply:(id)a4;
- (void)externalGatewaySheetWithRequest:(id)a3 reply:(id)a4;
- (void)externalPurchaseLinkURLsForBundleID:(id)a3 reply:(id)a4;
- (void)finishPaymentWithIdentifier:(id)a3 reply:(id)a4;
- (void)handleInvalidReceipt:(id)a3;
- (void)insertMessageForBundleID:(id)a3 status:(int64_t)a4 type:(int64_t)a5 allowDeveloperControl:(BOOL)a6 environment:(int64_t)a7 reply:(id)a8;
- (void)invalidateTransactionsAndStatusCacheWithReply:(id)a3;
- (void)isEligibleForIntroductoryOfferForGroupID:(id)a3 reply:(id)a4;
- (void)isXcodeTestAppWithReply:(id)a3;
- (void)loadUnfinishedTransactionsWithLogKey:(id)a3 completion:(id)a4;
- (void)lookupProductWithParametersProductRequest:(id)a3 reply:(id)a4;
- (void)manageSubscriptionsEngagementRequestWithRequest:(id)a3 reply:(id)a4;
- (void)notifyOfRevokedProductIdentifiers:(id)a3 reply:(id)a4;
- (void)pauseDownloadWithID:(id)a3;
- (void)policyWithRequest:(id)a3 reply:(id)a4;
- (void)presentCodeRedemptionSheetWithSceneID:(id)a3 reply:(id)a4;
- (void)presentManageSubscriptionsWithRequest:(id)a3 reply:(id)a4;
- (void)presentRefundRequestSheetForTransactionID:(id)a3 sceneID:(id)a4 reply:(id)a5;
- (void)processPayment:(id)a3 forClient:(id)a4 paymentDelegate:(id)a5 reply:(id)a6;
- (void)processPaymentWithBuyParamsString:(id)a3 reply:(id)a4;
- (void)productsWithRequest:(id)a3 responseReceiver:(id)a4 reply:(id)a5;
- (void)promotionInfoForProductIdentifiers:(id)a3 client:(id)a4 reply:(id)a5;
- (void)purchaseIntentsWithRequest:(id)a3 reply:(id)a4;
- (void)receivedTransactions:(id)a3;
- (void)refundRequestForTransactionId:(id)a3 replyBlock:(id)a4;
- (void)registerArcadeAppWithRandomFromLib:(id)a3 randomFromLibLength:(unsigned int)a4 resultHandler:(id)a5;
- (void)renewReceiptWithOptions:(id)a3 client:(id)a4 replyBlock:(id)a5;
- (void)repairArcadeApp;
- (void)restoreCompletedTransactionsForUsername:(id)a3 client:(id)a4 reply:(id)a5;
- (void)resumeDownloadWithID:(id)a3;
- (void)saveNewTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5;
- (void)setAppInstallSheetBundleID:(id)a3 reply:(id)a4;
- (void)setClientOverrideWithRequest:(id)a3 reply:(id)a4;
- (void)setPromotionInfo:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)statusForSubscriptionGroupID:(id)a3 reply:(id)a4;
- (void)storefront:(id)a3 reply:(id)a4;
- (void)updateTransactions:(id)a3 forClient:(id)a4;
- (void)xcodeTestCertificatesShouldSimulateRevocationWithReply:(id)a3;
- (void)xcodeTestCertificatesWithReply:(id)a3;
- (void)xcodeTestServerPortWithReplyBlock:(id)a3;
@end

@implementation StoreKitServiceConnection

+ (void)initialize
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSLock);
  v3 = (void *)qword_10032E3B8;
  qword_10032E3B8 = (uint64_t)v2;

  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  v5 = (void *)qword_10032E3C0;
  qword_10032E3C0 = v4;
}

+ (id)allConnections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10032E3C0 allObjects]);
  [(id)qword_10032E3B8 unlock];
  return v2;
}

+ (id)connectionForClient:(id)a3
{
  id v3 = a3;
  if ([v3 storeItemID] && objc_msgSend(v3, "storeExternalVersionID"))
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection allConnections]( &OBJC_CLASS___StoreKitServiceConnection,  "allConnections"));
    id v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
          id v11 = [v10 storeItemID];
          if (v11 == [v3 storeItemID])
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
            id v13 = [v12 storeExternalVersionID];
            id v14 = [v3 storeExternalVersionID];

            if (v13 == v14) {
              goto LABEL_25;
            }
          }

          else
          {
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v6);
    }
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 callerBundleID]);
    id v16 = [v15 length];

    if (!v16) {
      goto LABEL_27;
    }
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection allConnections]( &OBJC_CLASS___StoreKitServiceConnection,  "allConnections",  0LL));
    id v17 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 callerBundleID]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v3 callerBundleID]);
          unsigned __int8 v24 = [v22 isEqualToString:v23];

          if ((v24 & 1) != 0)
          {
LABEL_25:
            id v16 = v9;
            goto LABEL_26;
          }
        }

        id v18 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }

  id v16 = 0LL;
LABEL_26:

LABEL_27:
  return v16;
}

+ (id)octaneConnectionForBundleID:(id)a3
{
  id v3 = a3;
  [(id)qword_10032E3B8 lock];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)qword_10032E3C0;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client", (void)v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestBundleID]);
        if ([v10 isEqualToString:v3])
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
          unsigned int v12 = objc_msgSend(v11, "objc_clientType");

          if (v12 == 3)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }

        else
        {
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

- (StoreKitServiceConnection)initWithConnection:(id)a3 remoteObject:(id)a4 pid:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___StoreKitServiceConnection;
  id v11 = -[StoreKitServiceConnection init](&v53, "init");
  if (v11)
  {
    unsigned int v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    downloadIDs = v11->_downloadIDs;
    v11->_downloadIDs = v12;

    v11->_pid = a5;
    objc_storeStrong((id *)&v11->_remoteObject, a4);
    objc_storeStrong((id *)&v11->_xpcConnection, a3);
    __int128 v14 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sk_processName"));
    __int128 v15 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v9,  0LL);
    client = v11->_client;
    v11->_client = v15;

    __int128 v17 = &qword_10032E000;
    if (v11->_client)
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      id v18 = (void *)qword_10032E3C8;
      if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = v18;
        v20 = (StoreKitServiceConnection *)objc_opt_class(v11);
        v21 = v11->_client;
        v22 = v20;
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v21, "callerBundleID"));
        signed int v24 = -[Client objc_clientType](v11->_client, "objc_clientType");
        *(_DWORD *)buf = 138543874;
        v55 = v20;
        __int16 v56 = 2114;
        v57 = v23;
        __int16 v58 = 2048;
        uint64_t v59 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%{public}@: %{public}@ client type: %ld",  buf,  0x20u);
      }

      if (-[Client isBeta](v11->_client, "isBeta"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[Client account](v11->_client, "account"));

        if (!v25)
        {
          id v26 = AMSAccountMediaTypeProduction;
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v26));
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ams_activeiTunesAccount"));

          if (v28)
          {
            __int128 v29 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
            if (qword_10032E410 != -1) {
              dispatch_once(&qword_10032E410, &stru_1002E8AB0);
            }
            __int128 v30 = (os_log_s *)qword_10032E3C8;
            if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No TestFlight account in beta account store. Attempting silent auth with prod account.",  buf,  0xCu);
            }

            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[Client processInfo](v11->_client, "processInfo"));
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( -[StoreKitServiceConnection _silentAuthWithClientInfo:account:logKey:]( v11,  "_silentAuthWithClientInfo:account:logKey:",  v31,  v28,  v29));
            [v32 resultWithTimeout:0 error:2.0];

            __int128 v17 = &qword_10032E000;
          }
        }
      }
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      __int128 v33 = (os_log_s *)qword_10032E3C8;
      if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v55 = v14;
        __int16 v56 = 2048;
        v57 = (const __CFString *)a5;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "No StoreKitClient available for %{public}@[%ld]",  buf,  0x16u);
      }
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
    id v35 = [v34 addDownloadObserver:v11];

    v36 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    finishPaymentQueue = v11->_finishPaymentQueue;
    v11->_finishPaymentQueue = v36;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v11->_finishPaymentQueue,  "setMaxConcurrentOperationCount:",  5LL);
    v38 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    paymentQueue = v11->_paymentQueue;
    v11->_paymentQueue = v38;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_paymentQueue, "setMaxConcurrentOperationCount:", 1LL);
    v40 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    appTerminationQueue = v11->_appTerminationQueue;
    v11->_appTerminationQueue = v40;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v11->_appTerminationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    v42 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    productLookupQueue = v11->_productLookupQueue;
    v11->_productLookupQueue = v42;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v11->_productLookupQueue,  "setMaxConcurrentOperationCount:",  1LL);
    dispatch_queue_t v44 = dispatch_queue_create("com.apple.appstored.StoreKit.MessageQueue", 0LL);
    messageQueue = v11->_messageQueue;
    v11->_messageQueue = (OS_dispatch_queue *)v44;

    dispatch_queue_t v46 = dispatch_queue_create("com.apple.storekitd.ProductPromotions", 0LL);
    productPromotionsQueue = v11->_productPromotionsQueue;
    v11->_productPromotionsQueue = (OS_dispatch_queue *)v46;

    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    v48 = (void *)v17[121];
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_INFO))
    {
      v49 = v48;
      unsigned int v50 = objc_msgSend(v9, "sk_allowClientOverride");
      v51 = @"NO";
      if (v50) {
        v51 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      v55 = v11;
      __int16 v56 = 2114;
      v57 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "%{public}@: Allows client override: %{public}@",  buf,  0x16u);
    }
  }

  [(id)qword_10032E3B8 lock];
  [(id)qword_10032E3C0 addObject:v11];
  [(id)qword_10032E3B8 unlock];

  return v11;
}

- (void)dealloc
{
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEBUG)) {
    sub_10025E520();
  }
  [(id)qword_10032E3B8 lock];
  [(id)qword_10032E3C0 removeObject:self];
  [(id)qword_10032E3B8 unlock];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreKitServiceConnection;
  -[StoreKitServiceConnection dealloc](&v3, "dealloc");
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%ld)",  objc_opt_class(self),  self->_pid);
}

- (void)loadUnfinishedTransactionsWithLogKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___LoadUnfinishedInAppTransactionsTask);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitServiceConnection client](self, "client"));
  id v10 = -[LoadUnfinishedInAppTransactionsTask initWithClient:](v8, "initWithClient:", v9);

  -[LoadUnfinishedInAppTransactionsTask setLogKey:](v10, "setLogKey:", v6);
  -[LoadUnfinishedInAppTransactionsTask setForceServerCheck:](v10, "setForceServerCheck:", 1LL);
  objc_initWeak(&location, v10);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  __int128 v15 = sub_1000351B8;
  __int128 v16 = &unk_1002E8730;
  objc_copyWeak(&v19, &location);
  id v11 = v6;
  id v17 = v11;
  id v12 = v7;
  id v18 = v12;
  -[LoadUnfinishedInAppTransactionsTask setCompletionBlock:](v10, "setCompletionBlock:", &v13);
  -[NSOperationQueue addOperation:](self->_paymentQueue, "addOperation:", v10, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)checkServerQueueForQueue:(id)a3 withClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100035320;
  v7[3] = &unk_1002E8758;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  -[StoreKitServiceConnection checkServerQueueForClientIfNecessary:forceCheck:reply:]( self,  "checkServerQueueForClientIfNecessary:forceCheck:reply:",  a4,  1LL,  v7);
}

- (void)checkServerQueueForClientIfNecessary:(id)a3 forceCheck:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void, LoadUnfinishedInAppTransactionsTask *))a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v10 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int128 v31 = self;
    __int16 v32 = 2082;
    __int128 v33 = "-[StoreKitServiceConnection checkServerQueueForClientIfNecessary:forceCheck:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitServiceConnection client](self, "client"));
  if (objc_msgSend(v12, "objc_clientType") == 3)
  {
    unsigned __int8 v13 = objc_msgSend(v11, "sk_connectionIsOctaneService");

    if ((v13 & 1) != 0)
    {
LABEL_18:
      __int128 v16 = (_TtC9storekitd6Client *)objc_claimAutoreleasedReturnValue(-[StoreKitServiceConnection client](self, "client"));
      goto LABEL_19;
    }
  }

  else
  {
  }

  else {
    uint64_t v14 = 0LL;
  }
  id v15 = v14;
  __int128 v16 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v11,  v15);

  if (!v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitServiceConnection client](self, "client"));
    BOOL v18 = objc_msgSend(v17, "objc_clientType") == 3;

    if (!v18)
    {
      __int128 v16 = 0LL;
      goto LABEL_28;
    }

    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025E708((uint64_t)self);
    }
    goto LABEL_18;
  }

- (void)receivedTransactions:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    id v10 = "-[StoreKitServiceConnection receivedTransactions:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v7,  0x16u);
  }

  if ([v4 count])
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[StoreKitServiceConnection _processDownloadsForTransactions:]( self,  "_processDownloadsForTransactions:",  v4));
    -[SKClientProtocol updatedTransactions:](self->_remoteObject, "updatedTransactions:", v6);
  }
}

- (void)updateTransactions:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = self;
    __int16 v16 = 2082;
    id v17 = "-[StoreKitServiceConnection updateTransactions:forClient:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v14,  0x16u);
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v10 = objc_msgSend(v9, "sk_allowClientOverride");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:off_100327E48[0]]);
    if (v11)
    {
      id v12 = -[Client initWithAuditTokenData:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithAuditTokenData:",  v11);
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection connectionForClient:]( &OBJC_CLASS___StoreKitServiceConnection,  "connectionForClient:",  v12));
      if (v13 && [v6 count]) {
        [v13 receivedTransactions:v6];
      }
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
        sub_10025E770();
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025E7D0();
    }
  }
}

- (void)insertMessageForBundleID:(id)a3 status:(int64_t)a4 type:(int64_t)a5 allowDeveloperControl:(BOOL)a6 environment:(int64_t)a7 reply:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = (void (**)(id, void *))a8;
  id v31 = v14;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  __int16 v16 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v35 = self;
    __int16 v36 = 2082;
    v37 = "-[StoreKitServiceConnection insertMessageForBundleID:status:type:allowDeveloperControl:environment:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection", v31));
  unsigned __int8 v18 = objc_msgSend(v17, "sk_allowClientOverride");

  if ((v18 & 1) == 0)
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025E890();
    }
    uint64_t v20 = ASDErrorDomain;
    uint64_t v21 = 505LL;
    goto LABEL_22;
  }

  switch(a7)
  {
    case 1LL:
      uint64_t v19 = &AMSAccountMediaTypeProduction;
LABEL_16:
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  *v19));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ams_activeiTunesAccount"));

      signed int v24 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ams_DSID"));
      if (!v24) {
        break;
      }
LABEL_24:
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[StoreKitMessagesManager sharedManager](&OBJC_CLASS___StoreKitMessagesManager, "sharedManager"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      id v33 = 0LL;
      id v26 = v32;
      [v27 addMessageStatus:v28 forBundleID:v32 accountID:v24 allowDeveloperControl:v10 messageType:a5 error:&v33];
      id v29 = v33;

      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 toASDErrorWithMetadata:0]);
      v15[2](v15, v30);

      goto LABEL_25;
    case 3LL:
      signed int v24 = &off_1003027F8;
      goto LABEL_24;
    case 2LL:
      uint64_t v19 = &AMSAccountMediaTypeAppStoreSandbox;
      goto LABEL_16;
  }

  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
    sub_10025E830();
  }
  uint64_t v20 = ASDErrorDomain;
  uint64_t v21 = 509LL;
LABEL_22:
  uint64_t v25 = ASDErrorWithTitleAndMessage(v20, v21, 0LL, 0LL);
  signed int v24 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v25);
  v15[2](v15, v24);
  id v26 = v32;
LABEL_25:
}

- (void)processPaymentWithBuyParamsString:(id)a3 reply:(id)a4
{
  id v6 = (StoreKitServiceConnection *)a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  __int16 v9 = (os_log_s *)qword_10032E3E0;
  if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v63 = self;
    __int16 v64 = 2114;
    v65 = v8;
    __int16 v66 = 2082;
    v67 = "-[StoreKitServiceConnection processPaymentWithBuyParamsString:reply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@] %{public}s",  buf,  0x20u);
  }

  if (-[StoreKitServiceConnection length](v6, "length"))
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    unsigned __int8 v11 = objc_msgSend(v10, "sk_allowClientOverride");

    if ((v11 & 1) != 0)
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      v47 = self;
      id v12 = (os_log_s *)qword_10032E3E0;
      if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v63 = v8;
        __int16 v64 = 2114;
        v65 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Processing buyParams %{public}@",  buf,  0x16u);
      }

      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBuyParams buyParamsWithString:](&OBJC_CLASS___AMSBuyParams, "buyParamsWithString:", v6));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tcr_numberForKey:", @"appAdamId"));

      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tcr_numberForKey:", AMSBuyParamPropertyAppExtVrsId));

      id v17 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue([v13 parameterForKey:@"bid"]);
      unsigned int v50 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 parameterForKey:AMSBuyParamPropertyBundleVersion]);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 parameterForKey:@"vendorName"]);
      objc_super v53 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByRemovingPercentEncoding]);

      [v13 setObject:0 forKeyedSubscript:@"vendorName"];
      v60 = @"buyParams";
      v61 = v13;
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
      if (-[StoreKitServiceConnection length](v17, "length"))
      {
        uint64_t v19 = (_TtC9storekitd6Client *)[[LSApplicationRecord alloc] initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
        if (v19) {
          goto LABEL_28;
        }
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      if (v15) {
        uint64_t v19 = (_TtC9storekitd6Client *)objc_msgSend( [LSApplicationRecord alloc],  "initWithStoreItemIdentifier:error:",  objc_msgSend(v15, "longLongValue"),  0);
      }
LABEL_28:
      v52 = v19;
      if (v19)
      {
        uint64_t v23 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
        signed int v24 = (void *)objc_claimAutoreleasedReturnValue(-[Client URL](v19, "URL"));
        uint64_t v19 = -[Client initWithURL:overridesDictionary:](v23, "initWithURL:overridesDictionary:", v24, 0LL);
      }

      if (v19) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = v15 == 0LL;
      }
      int v26 = !v25;
      if (v25)
      {
        BOOL v48 = 0;
        if (!v19) {
          goto LABEL_61;
        }
      }

      else
      {
        if (!-[StoreKitServiceConnection length](v17, "length"))
        {
          BOOL v48 = 0;
          goto LABEL_61;
        }

        id v27 = v52;
        if (![v53 length])
        {
          BOOL v48 = 0;
          goto LABEL_63;
        }

        int v45 = v26;
        if (qword_10032E410 != -1) {
          dispatch_once(&qword_10032E410, &stru_1002E8AB0);
        }
        id v28 = (os_log_s *)qword_10032E3E0;
        if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v63 = v8;
          __int16 v64 = 2114;
          v65 = v17;
          __int16 v66 = 2114;
          v67 = (const char *)v15;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] App is not installed for %{public}@(%{public}@). Creating client with overrides.",  buf,  0x20u);
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
        id v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v17, off_100327E50[0]);
        if (-[__CFString length](v50, "length")) {
          __int128 v30 = v50;
        }
        else {
          __int128 v30 = @"1.0";
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v30, off_100327E58[0]);
        dispatch_queue_t v44 = v15;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v15, off_100327E80[0]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v49, off_100327E78[0]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &off_100302810,  off_100327E68[0]);
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v42 createDeviceIdentifierWithVendorName:v53 bundleIdentifier:v17]);
        BOOL v48 = v31 != 0LL;
        if (v31)
        {
          if (qword_10032E410 != -1) {
            dispatch_once(&qword_10032E410, &stru_1002E8AB0);
          }
          __int16 v32 = (void *)qword_10032E3E0;
          if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = v32;
            v34 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
            *(_DWORD *)buf = 138543619;
            v63 = v8;
            __int16 v64 = 2113;
            v65 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Generated VID for purchase %{private}@",  buf,  0x16u);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v31,  off_100327E88[0]);
        }

        uint64_t v19 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v43,  v29);

        id v15 = v44;
        int v26 = v45;
        if (!v19)
        {
LABEL_61:
          id v27 = v52;
LABEL_63:
          if (qword_10032E410 != -1) {
            dispatch_once(&qword_10032E410, &stru_1002E8AB0);
          }
          if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
            sub_10025E950((uint64_t)v8);
          }
          uint64_t v38 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v7[2](v7, 0LL, v39);

          if (!v48) {
            goto LABEL_74;
          }
          if (qword_10032E410 != -1) {
            dispatch_once(&qword_10032E410, &stru_1002E8AB0);
          }
          v40 = (os_log_s *)qword_10032E3E0;
          if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v63 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Releasing VID for failed purchase",  buf,  0xCu);
          }

          uint64_t v19 = (_TtC9storekitd6Client *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
          -[Client removeDeviceIdentifierForVendorName:bundleIdentifier:]( v19,  "removeDeviceIdentifierForVendorName:bundleIdentifier:",  v53,  v17);
LABEL_73:

          id v27 = v52;
LABEL_74:

          goto LABEL_75;
        }
      }

      unsigned int v46 = v26;
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      id v35 = (void *)qword_10032E3E0;
      if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v36 = v35;
        v37 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
        *(_DWORD *)buf = 138543618;
        v63 = v8;
        __int16 v64 = 2114;
        v65 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Processing payment with buyParams %{public}@",  buf,  0x16u);
      }

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1000369E0;
      v54[3] = &unk_1002E87A8;
      v55 = v8;
      __int16 v56 = v17;
      BOOL v59 = v48;
      id v57 = v53;
      __int16 v58 = v7;
      LOBYTE(v41) = 1;
      -[StoreKitServiceConnection _processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion:paymentDelegate:isProcessingInterruptedBuy:reply:]( v47,  "_processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion:paymentDelegate:isProcessingI nterruptedBuy:reply:",  v51,  v46,  0LL,  v19,  1LL,  0LL,  v41,  v54);

      goto LABEL_73;
    }

    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
      sub_10025E9B8();
    }
    uint64_t v20 = ASDErrorDomain;
    uint64_t v21 = 505LL;
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
      sub_10025E8F0();
    }
    uint64_t v20 = ASDErrorDomain;
    uint64_t v21 = 507LL;
  }

  uint64_t v22 = ASDErrorWithDescription(v20, v21, 0LL);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v7[2](v7, 0LL, v13);
LABEL_75:
}

- (void)processPayment:(id)a3 forClient:(id)a4 paymentDelegate:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v14 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v56 = self;
    __int16 v57 = 2082;
    __int16 v58 = "-[StoreKitServiceConnection processPayment:forClient:paymentDelegate:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  else {
    __int16 v16 = 0LL;
  }
  id v17 = v16;
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKey:off_100327E48[0]]);
  uint64_t v19 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  if (v18)
  {
    uint64_t v20 = -[Client initWithAuditTokenData:](v19, "initWithAuditTokenData:", v18);
    BOOL v21 = 0LL;
    if (v20) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v20 = -[Client initWithConnection:overridesDictionary:](v19, "initWithConnection:overridesDictionary:", v15, v17);
    BOOL v21 = v17 != 0LL;
    if (v20)
    {
LABEL_10:
      BOOL v48 = self;
      v49 = (void *)v18;
      unsigned int v50 = (void (**)(void, void, void))v13;
      if (objc_msgSend(v15, "sk_allowClientOverride"))
      {
        id v22 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:off_100328180[0]]);
        if ([v22 length])
        {
          id v22 = v22;
          uint64_t v47 = sandbox_extension_consume([v22 UTF8String]);
          if ((v47 & 0x8000000000000000LL) == 0) {
            goto LABEL_16;
          }
          if (qword_10032E410 != -1) {
            dispatch_once(&qword_10032E410, &stru_1002E8AB0);
          }
          uint64_t v23 = (void *)qword_10032E3E0;
          if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR))
          {
            id v24 = v12;
            sub_10025EBC8((uint64_t)v48, v23);
          }

          else
          {
LABEL_16:
            id v24 = v12;
          }
        }

        else
        {
          id v24 = v12;
          uint64_t v47 = -1LL;
        }
      }

      else
      {
        id v24 = v12;
        id v28 = [v10 mutableCopy];
        [v28 setObject:0 forKeyedSubscript:off_1003280F0[0]];
        [v28 setObject:0 forKeyedSubscript:off_100328188[0]];
        [v28 setObject:0 forKeyedSubscript:off_100328178[0]];
        [v28 setObject:0 forKeyedSubscript:off_1003280C8[0]];
        [v28 setObject:0 forKeyedSubscript:@"buyParams"];
        [v28 setObject:0 forKeyedSubscript:off_100328190[0]];
        [v28 setObject:0 forKeyedSubscript:off_1003281A0[0]];
        [v28 setObject:0 forKeyedSubscript:off_100328198[0]];
        uint64_t v47 = -1LL;
        id v22 = v10;
        id v10 = v28;
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tcr_dataForKey:", off_100328148[0]));
      if ([v27 length] && (objc_msgSend(v15, "sk_allowPaymentRequestData") & 1) == 0)
      {
        if ((objc_msgSend(v10, "tcr_BOOLForKey:", off_1003280E8[0]) & 1) == 0)
        {
          if (qword_10032E410 != -1) {
            dispatch_once(&qword_10032E410, &stru_1002E8AB0);
          }
          id v12 = v24;
          id v13 = v50;
          if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
            sub_10025EB68();
          }
          uint64_t v43 = ASDErrorWithDescription( ASDErrorDomain,  505LL,  @"Payment has request data but client is not entitled");
          id v31 = (void *)objc_claimAutoreleasedReturnValue(v43);
          ((void (**)(void, void, void *))v50)[2](v50, 0LL, v31);
          goto LABEL_43;
        }

        id v29 = [v10 mutableCopy];
        [v29 setObject:0 forKeyedSubscript:off_100328148[0]];

        id v10 = v29;
      }

      id v12 = v24;
      if (-[Client canMakePayments](v20, "canMakePayments"))
      {
        int64_t v30 = +[StoreKitServiceConnection _apiVersionForClientDict:]( &OBJC_CLASS___StoreKitServiceConnection,  "_apiVersionForClientDict:",  v11);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_100037434;
        v52[3] = &unk_1002E87D0;
        uint64_t v54 = v47;
        id v13 = v50;
        objc_super v53 = v50;
        LOBYTE(v44) = 0;
        -[StoreKitServiceConnection _processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion:paymentDelegate:isProcessingInterruptedBuy:reply:]( v48,  "_processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion:paymentDelegate:isProcessin gInterruptedBuy:reply:",  v10,  v21,  1LL,  v20,  v30,  v12,  v44,  v52);
        id v31 = v53;
      }

      else
      {
        if (qword_10032E410 != -1) {
          dispatch_once(&qword_10032E410, &stru_1002E8AB0);
        }
        int v45 = v24;
        id v46 = v11;
        if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
          sub_10025EB08();
        }
        uint64_t v32 = ASDLocalizedString(@"MICRO_PAYMENTS_RESTRICTED_TITLE");
        id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        uint64_t v34 = ASDLocalizedString(@"MICRO_PAYMENTS_RESTRICTED_BODY");
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  v33,  v35));

        __int16 v36 = objc_alloc(&OBJC_CLASS____TtC9storekitd13DialogContext);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v20, "callerBundleID"));
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleURL](v20, "callerBundleURL"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[Client processInfo](v20, "processInfo"));
        v40 = -[DialogContext initWithBundleID:bundleURL:processInfo:dialogObserver:]( v36,  "initWithBundleID:bundleURL:processInfo:dialogObserver:",  v37,  v38,  v39,  0LL);

        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472LL;
        v51[2] = sub_1000374B4;
        v51[3] = &unk_1002E87F8;
        v51[4] = v48;
        -[DialogContext handleDialogRequest:completionHandler:](v40, "handleDialogRequest:completionHandler:", v31, v51);
        if (v47 >= 1) {
          sandbox_extension_release();
        }
        uint64_t v41 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 1050LL, 0LL, 0LL);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        ((void (**)(void, void, void *))v50)[2](v50, 0LL, v42);

        id v13 = v50;
        id v12 = v45;
        id v11 = v46;
      }

- (void)_processPayment:(id)a3 excludeReceipt:(BOOL)a4 privacyAcknowledgementRequired:(BOOL)a5 forClient:(id)a6 apiVersion:(int64_t)a7 paymentDelegate:(id)a8 isProcessingInterruptedBuy:(BOOL)a9 reply:(id)a10
{
  BOOL v13 = a5;
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a6;
  id v60 = a8;
  id v17 = a10;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  uint64_t v18 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v71 = self;
    __int16 v72 = 2082;
    v73 = "-[StoreKitServiceConnection _processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion"
          ":paymentDelegate:isProcessingInterruptedBuy:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  if ([v16 isClip])
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
      sub_10025ECB0();
    }
    uint64_t v19 = ASDErrorWithDescription(ASDErrorDomain, 1051LL, @"In-app purchases not allowed in App Clip");
    v62 = (void *)objc_claimAutoreleasedReturnValue(v19);
    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0LL, 0LL, v62);
  }

  else
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"buyParams"]);
    BOOL v59 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328138[0]));
    id v20 = objc_msgSend(v15, "tcr_unsignedLongLongForKey:", off_100328140[0]);
    if (v20) {
      BOOL v21 = v59 == 0LL;
    }
    else {
      BOOL v21 = 1;
    }
    if (!v21 || v62)
    {
      BOOL v25 = objc_alloc(&OBJC_CLASS___InAppTransactionTask);
      if (v62)
      {
        id v24 = -[InAppTransactionTask initWithBuyParams:client:apiVersion:]( v25,  "initWithBuyParams:client:apiVersion:",  v62,  v16,  a7);
      }

      else
      {
        id v24 = -[InAppTransactionTask initWithProductIdentifier:quantity:client:apiVersion:]( v25,  "initWithProductIdentifier:quantity:client:apiVersion:",  v59,  v20,  v16,  a7);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_dictionaryForKey:", off_1003280C8[0]));
        -[InAppTransactionTask setAdditionalBuyParams:](v24, "setAdditionalBuyParams:", v26);
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_1003280D8[0]));
      -[InAppTransactionTask setApplicationUsername:](v24, "setApplicationUsername:", v27);

      id v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328108[0]));
      -[InAppTransactionTask setDiscountIdentifier:](v24, "setDiscountIdentifier:", v28);

      id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328110[0]));
      -[InAppTransactionTask setDiscountKeyIdentifier:](v24, "setDiscountKeyIdentifier:", v29);

      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328118[0]));
      -[InAppTransactionTask setDiscountNonceString:](v24, "setDiscountNonceString:", v30);

      id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328120[0]));
      -[InAppTransactionTask setDiscountSignature:](v24, "setDiscountSignature:", v31);

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_numberForKey:", off_100328128[0]));
      -[InAppTransactionTask setDiscountTimestamp:](v24, "setDiscountTimestamp:", v32);

      id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328158[0]));
      -[InAppTransactionTask setPartnerIdentifier:](v24, "setPartnerIdentifier:", v33);

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328160[0]));
      -[InAppTransactionTask setPartnerTransactionIdentifier:](v24, "setPartnerTransactionIdentifier:", v34);

      id v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328170[0]));
      -[InAppTransactionTask setProductKind:](v24, "setProductKind:", v35);

      -[InAppTransactionTask setPrivacyAcknowledgementRequired:](v24, "setPrivacyAcknowledgementRequired:", v13);
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_dataForKey:", off_100328148[0]));
      -[InAppTransactionTask setRequestData:](v24, "setRequestData:", v36);

      -[InAppTransactionTask setSimulateAskToBuy:]( v24,  "setSimulateAskToBuy:",  objc_msgSend(v15, "tcr_BOOLForKey:", off_100328150[0]));
      -[InAppTransactionTask setStorekitViewInitiated:]( v24,  "setStorekitViewInitiated:",  objc_msgSend(v15, "tcr_BOOLForKey:", off_1003281B0[0]));
      -[InAppTransactionTask setStoreOriginated:]( v24,  "setStoreOriginated:",  objc_msgSend(v15, "tcr_BOOLForKey:", off_100328130[0]));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_1003281A8[0]));
      -[InAppTransactionTask setSubscriptionPeriod:](v24, "setSubscriptionPeriod:", v37);

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328168[0]));
      -[InAppTransactionTask setPresentingSceneID:](v24, "setPresentingSceneID:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_1003281B8[0]));
      -[InAppTransactionTask setWinbackOfferIdentifier:](v24, "setWinbackOfferIdentifier:", v39);

      -[InAppTransactionTask setExcludeReceiptFromRequest:](v24, "setExcludeReceiptFromRequest:", v14);
      -[InAppTransactionTask setForceAuthentication:]( v24,  "setForceAuthentication:",  objc_msgSend(v15, "tcr_BOOLForKey:", off_100328188[0]));
      -[InAppTransactionTask setHideConfirmation:]( v24,  "setHideConfirmation:",  objc_msgSend(v15, "tcr_BOOLForKey:", off_1003280F0[0]));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_1003280D0[0]));
      -[InAppTransactionTask setAppAccountToken:](v24, "setAppAccountToken:", v40);

      -[InAppTransactionTask setIsProcessingInterruptedBuy:](v24, "setIsProcessingInterruptedBuy:", a9);
      uint64_t v41 = objc_alloc(&OBJC_CLASS____TtC9storekitd13DialogContext);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v16 callerBundleID]);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v16 callerBundleURL]);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v16 processInfo]);
      __int16 v56 = -[DialogContext initWithBundleID:bundleURL:processInfo:dialogObserver:]( v41,  "initWithBundleID:bundleURL:processInfo:dialogObserver:",  v42,  v43,  v44,  0LL);

      -[InAppTransactionTask setDialogContext:](v24, "setDialogContext:", v56);
      -[InAppTransactionTask setPaymentDelegate:](v24, "setPaymentDelegate:", v60);
      __int16 v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328178[0]));
      if (v58)
      {
        int v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v58,  1LL));
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 URLByAppendingPathComponent:@"StoreKit"]);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 URLByAppendingPathComponent:@"receipt"]);
        -[InAppTransactionTask setReceiptInstallURL:](v24, "setReceiptInstallURL:", v47);
      }

      if (a7 != 1)
      {
        BOOL v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_dictionaryForKey:", off_1003280E0[0]));
        -[InAppTransactionTask setCustomBuyParams:](v24, "setCustomBuyParams:", v48);
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328190[0]));
      __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_1003281A0[0]));
      if (v49 && v57)
      {
        unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", off_100328198[0]));
        v51 = -[AppleIDAuthorizationRequestInfo initWithClientID:teamID:serviceID:]( objc_alloc(&OBJC_CLASS___AppleIDAuthorizationRequestInfo),  "initWithClientID:teamID:serviceID:",  v49,  v57,  v50);
        -[InAppTransactionTask setSiwaAuthorizationInfo:](v24, "setSiwaAuthorizationInfo:", v51);
      }

      objc_initWeak(&location, self);
      objc_initWeak(&from, v24);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_100037F70;
      v63[3] = &unk_1002E8848;
      objc_copyWeak(&v66, &from);
      objc_copyWeak(&v67, &location);
      id v64 = v16;
      id v65 = v17;
      -[InAppTransactionTask setCompletionBlock:](v24, "setCompletionBlock:", v63);
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      v52 = (os_log_s *)(id)qword_10032E3E0;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v53 = (char *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v24, "logKey"));
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](v24, "productIdentifier"));
        id v55 = -[InAppTransactionTask quantity](v24, "quantity");
        *(_DWORD *)buf = 138544130;
        v71 = self;
        __int16 v72 = 2114;
        v73 = v53;
        __int16 v74 = 2114;
        id v75 = v54;
        __int16 v76 = 2048;
        id v77 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Adding payment for %{public}@ and quantity %lu",  buf,  0x2Au);
      }

      -[NSOperationQueue addOperation:](self->_paymentQueue, "addOperation:", v24);
      objc_destroyWeak(&v67);
      objc_destroyWeak(&v66);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      id v22 = (os_log_s *)qword_10032E3E0;
      if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v71 = self;
        __int16 v72 = 2114;
        v73 = v59;
        __int16 v74 = 2048;
        id v75 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not process payment for product %{public}@ and quantity %lu",  buf,  0x20u);
      }

      uint64_t v23 = ASDErrorWithDescription(ASDErrorDomain, 507LL, @"Payment has no identifier or quantity");
      id v24 = (InAppTransactionTask *)objc_claimAutoreleasedReturnValue(v23);
      (*((void (**)(id, void, void, InAppTransactionTask *))v17 + 2))(v17, 0LL, 0LL, v24);
    }
  }
}

- (void)finishPaymentWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = self;
    __int16 v25 = 2082;
    uint64_t v26 = "-[StoreKitServiceConnection finishPaymentWithIdentifier:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  __int16 v9 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v11 = -[Client initWithConnection:overridesDictionary:](v9, "initWithConnection:overridesDictionary:", v10, 0LL);

  if (v11)
  {
    if (-[Client isClip](v11, "isClip"))
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
        sub_10025ECB0();
      }
      uint64_t v12 = ASDErrorWithDescription(ASDErrorDomain, 1051LL, @"In-app purchases not allowed in App Clip");
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v7[2](v7, v13);
    }

    else if ([v6 length])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
      [v16 removeDownloadsForTransactionID:v6];

      id v17 = -[FinishInAppTransactionTask initWithTransactionID:client:]( objc_alloc(&OBJC_CLASS___FinishInAppTransactionTask),  "initWithTransactionID:client:",  v6,  v11);
      objc_initWeak((id *)buf, v17);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000385E8;
      v19[3] = &unk_1002E8730;
      objc_copyWeak(&v22, (id *)buf);
      id v20 = v11;
      BOOL v21 = v7;
      -[FinishInAppTransactionTask setCompletionBlock:](v17, "setCompletionBlock:", v19);
      -[NSOperationQueue addOperation:](self->_finishPaymentQueue, "addOperation:", v17);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      uint64_t v18 = (os_log_s *)qword_10032E3E0;
      if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@: No transaction identifier to finish payment",  buf,  0xCu);
      }

      v7[2](v7, 0LL);
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
      sub_10025ED10();
    }
    uint64_t v14 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v7[2](v7, v15);
  }
}

- (void)notifyOfRevokedProductIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2082;
    uint64_t v18 = "-[StoreKitServiceConnection notifyOfRevokedProductIdentifiers:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100038978;
  v11[3] = &unk_1002E8870;
  objc_copyWeak(&v14, (id *)buf);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  -[StoreKitServiceConnection renewReceiptWithOptions:client:replyBlock:]( self,  "renewReceiptWithOptions:client:replyBlock:",  0LL,  0LL,  v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)restoreCompletedTransactionsForUsername:(id)a3 client:(id)a4 reply:(id)a5
{
  id v30 = a3;
  id v32 = a4;
  id v8 = (void (**)(id, void, id))a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v9 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = self;
    __int16 v42 = 2082;
    uint64_t v43 = "-[StoreKitServiceConnection restoreCompletedTransactionsForUsername:client:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection", v30));
  unsigned int v11 = objc_msgSend(v10, "sk_allowClientOverride");
  id v12 = v32;
  if (!v11) {
    id v12 = 0LL;
  }
  id v13 = v12;
  id v14 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v10,  v13);
  id v15 = v14;
  if (v14)
  {
    if (-[Client isClip](v14, "isClip"))
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
        sub_10025EE30();
      }
      uint64_t v16 = ASDErrorWithDescription(ASDErrorDomain, 1051LL, @"In-app purchases not allowed in App Clip");
      __int16 v17 = (_TtC9storekitd13DialogContext *)objc_claimAutoreleasedReturnValue(v16);
      v8[2](v8, 0LL, v17);
    }

    else
    {
      uint64_t v19 = objc_alloc(&OBJC_CLASS____TtC9storekitd13DialogContext);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v15, "callerBundleID"));
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleURL](v15, "callerBundleURL"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[Client processInfo](v15, "processInfo"));
      __int16 v17 = -[DialogContext initWithBundleID:bundleURL:processInfo:dialogObserver:]( v19,  "initWithBundleID:bundleURL:processInfo:dialogObserver:",  v20,  v21,  v22,  0LL);

      if (-[Client canMakePayments](v15, "canMakePayments"))
      {
        uint64_t v23 = -[RestoreInAppTransactionsTask initWithClient:]( objc_alloc(&OBJC_CLASS___RestoreInAppTransactionsTask),  "initWithClient:",  v15);
        -[RestoreInAppTransactionsTask setApplicationUsername:](v23, "setApplicationUsername:", v31);
        -[RestoreInAppTransactionsTask setDialogContext:](v23, "setDialogContext:", v17);
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v23);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_10003909C;
        v33[3] = &unk_1002E8848;
        objc_copyWeak(&v36, &location);
        objc_copyWeak(&v37, (id *)buf);
        uint64_t v34 = v15;
        id v35 = v8;
        -[RestoreInAppTransactionsTask setCompletionBlock:](v23, "setCompletionBlock:", v33);
        -[NSOperationQueue addOperation:](self->_paymentQueue, "addOperation:", v23);

        objc_destroyWeak(&v37);
        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        if (qword_10032E410 != -1) {
          dispatch_once(&qword_10032E410, &stru_1002E8AB0);
        }
        if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
          sub_10025EE90();
        }
        uint64_t v24 = ASDLocalizedString(@"MICRO_PAYMENTS_RESTRICTED_TITLE");
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        uint64_t v26 = ASDLocalizedString(@"MICRO_PAYMENTS_RESTRICTED_BODY");
        id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v23 = (RestoreInAppTransactionsTask *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  v25,  v27));

        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_100039004;
        v39[3] = &unk_1002E87F8;
        v39[4] = self;
        -[DialogContext handleDialogRequest:completionHandler:](v17, "handleDialogRequest:completionHandler:", v23, v39);
        uint64_t v28 = ASDErrorWithDescription(ASDErrorDomain, 1050LL, @"In-app purchases not allowed on this device");
        id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v8[2](v8, 0LL, v29);
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3E0, OS_LOG_TYPE_ERROR)) {
      sub_10025EDD0();
    }
    uint64_t v18 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    __int16 v17 = (_TtC9storekitd13DialogContext *)objc_claimAutoreleasedReturnValue(v18);
    v8[2](v8, 0LL, v17);
  }
}

- (void)statusForSubscriptionGroupID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = self;
    __int16 v20 = 2082;
    BOOL v21 = "-[StoreKitServiceConnection statusForSubscriptionGroupID:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v9 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v11 = -[Client initWithConnection:overridesDictionary:](v9, "initWithConnection:overridesDictionary:", v10, 0LL);

  if (v11)
  {
    id v12 = (char *)objc_claimAutoreleasedReturnValue( +[OctaneManager simulatedStoreKitErrorFor:client:]( &OBJC_CLASS___OctaneManager,  "simulatedStoreKitErrorFor:client:",  4LL,  v11));
    if (!v12)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v11));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100039590;
      v16[3] = &unk_1002E8898;
      id v17 = v7;
      [v15 subscriptionStatusForSubscriptionGroupID:v6 completionHandler:v16];

      goto LABEL_18;
    }

    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    id v13 = (os_log_s *)qword_10032E3C8;
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = self;
      __int16 v20 = 2114;
      BOOL v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Found simulated failure: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025EEF0();
    }
    uint64_t v14 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    id v12 = (char *)objc_claimAutoreleasedReturnValue(v14);
  }

  (*((void (**)(id, void, char *))v7 + 2))(v7, 0LL, v12);
LABEL_18:
}

- (void)enumerateSubscriptionStatusesWithReceiver:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v20 = self;
    __int16 v21 = 2082;
    id v22 = "-[StoreKitServiceConnection enumerateSubscriptionStatusesWithReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v9 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v11 = -[Client initWithConnection:overridesDictionary:](v9, "initWithConnection:overridesDictionary:", v10, 0LL);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v11));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100039818;
    v17[3] = &unk_1002E88C0;
    id v18 = v6;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000398B0;
    v14[3] = &unk_1002E7310;
    id v15 = v18;
    id v16 = v7;
    [v12 enumerateSubscriptionStatusUsingBlock:v17 completionHandler:v14];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025EEF0();
    }
    uint64_t v13 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)addDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "-[StoreKitServiceConnection addDownloadWithID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v6,  0LL);
  if (v7)
  {
    if (v4)
    {
      if (v6) {
        [v6 auditToken];
      }
      else {
        memset(buf, 0, 32);
      }
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
      v20[0] = *(_OWORD *)buf;
      v20[1] = *(_OWORD *)&buf[16];
      unsigned int v17 = [v16 startDownloadWithID:v4 client:v7 auditToken:v20];

      if (v17)
      {
        remoteObject = self->_remoteObject;
        __int16 v21 = @"download";
        id v22 = v4;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        -[SKClientProtocol downloadAdded:](remoteObject, "downloadAdded:", v19);
      }
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      id v8 = (os_log_s *)off_100328238;
      if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_ERROR)) {
        sub_10025EFB0(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_ERROR)) {
      sub_10025EF50();
    }
  }
}

- (void)cancelDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    uint64_t v10 = "-[StoreKitServiceConnection cancelDownloadWithID:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v7,  0x16u);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
    [v6 cancelDownloadWithID:v4];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_ERROR)) {
      sub_10025EFE0();
    }
  }
}

- (void)pauseDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    uint64_t v10 = "-[StoreKitServiceConnection pauseDownloadWithID:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v7,  0x16u);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
    [v6 pauseDownloadWithID:v4];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_ERROR)) {
      sub_10025F040();
    }
  }
}

- (void)resumeDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "-[StoreKitServiceConnection resumeDownloadWithID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v7 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v6,  0LL);
  if (v7)
  {
    if (v4)
    {
      if (v6) {
        [v6 auditToken];
      }
      else {
        memset(buf, 0, 32);
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
      v9[0] = *(_OWORD *)buf;
      v9[1] = *(_OWORD *)&buf[16];
      [v8 startDownloadWithID:v4 client:v7 auditToken:v9];
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_ERROR)) {
        sub_10025F100();
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_ERROR)) {
      sub_10025F0A0();
    }
  }
}

- (void)deleteContentForProductID:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2082;
    __int16 v9 = "-[StoreKitServiceConnection deleteContentForProductID:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)renewReceiptWithOptions:(id)a3 client:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v48 = a4;
  id v47 = a5;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKeyWithAPIVersion:](&OBJC_CLASS___NSUUID, "lib_shortLogKeyWithAPIVersion:", 1LL));
  uint64_t v10 = &qword_10032E000;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  uint64_t v11 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    objc_super v53 = v9;
    __int16 v54 = 2082;
    id v55 = "-[StoreKitServiceConnection renewReceiptWithOptions:client:replyBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitServiceConnection client](self, "client"));
  if (objc_msgSend(v13, "objc_clientType") == 3)
  {
    unsigned int v14 = objc_msgSend(v12, "sk_connectionIsOctaneService");

    if (v14)
    {
      uint64_t v15 = (_TtC9storekitd6Client *)objc_claimAutoreleasedReturnValue(-[StoreKitServiceConnection client](self, "client"));
      goto LABEL_12;
    }
  }

  else
  {
  }

  unsigned int v16 = objc_msgSend(v12, "sk_allowClientOverride");
  unsigned int v17 = v48;
  if (!v16) {
    unsigned int v17 = 0LL;
  }
  id v18 = v17;
  uint64_t v15 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v12,  v18);

LABEL_12:
  if (objc_msgSend(v12, "sk_allowClientOverride"))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"tok"]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"recp"]);
    if (v20 && [v19 length])
    {
      uint64_t v46 = (uint64_t)v9;
      __int16 v21 = v8;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v20,  1LL));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 URLByAppendingPathComponent:@"StoreKit"]);
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v23 URLByAppendingPathComponent:@"receipt"]);

      uint64_t v24 = sandbox_extension_consume([v19 UTF8String]);
      if (v24 < 0)
      {
        if (qword_10032E410 != -1) {
          dispatch_once(&qword_10032E410, &stru_1002E8AB0);
        }
        __int16 v25 = (void *)qword_10032E3F0;
        if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
          sub_10025EBC8(v46, v25);
        }
      }

      uint64_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      id v27 = v26;
      if (v21) {
        -[NSMutableDictionary addEntriesFromDictionary:](v26, "addEntriesFromDictionary:", v21);
      }
      uint64_t v28 = (void *)v45;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v45,  @"customURL",  v45);
      id v29 = -[NSMutableDictionary copy](v27, "copy");

      id v8 = v29;
      __int16 v9 = (void *)v46;
      uint64_t v10 = &qword_10032E000;
    }

    else
    {
      uint64_t v24 = -1LL;
    }

    if (!v15) {
      goto LABEL_33;
    }
  }

  else
  {
    uint64_t v24 = -1LL;
    if (!v15)
    {
LABEL_33:
      if (v10[130] != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
        sub_10025F160();
      }
      uint64_t v43 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v43);
      goto LABEL_38;
    }
  }

  if (!-[Client isClip](v15, "isClip"))
  {
    id v32 = objc_alloc(&OBJC_CLASS____TtC9storekitd13DialogContext);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v15, "callerBundleID"));
    id v34 = v8;
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleURL](v15, "callerBundleURL"));
    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[Client processInfo](v15, "processInfo"));
    id v37 = v15;
    uint64_t v38 = v12;
    v39 = v9;
    v40 = (void *)v36;
    uint64_t v41 = -[DialogContext initWithBundleID:bundleURL:processInfo:dialogObserver:]( v32,  "initWithBundleID:bundleURL:processInfo:dialogObserver:",  v33,  v35,  v36,  0LL);

    __int16 v9 = v39;
    uint64_t v12 = v38;
    uint64_t v15 = v37;

    id v8 = v34;
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v37));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10003A6A4;
    v49[3] = &unk_1002E88E8;
    id v50 = v47;
    uint64_t v51 = v24;
    [v42 requestUnifiedAppReceiptWithDialogContext:v41 logKey:v9 options:v34 completionHandler:v49];

    goto LABEL_40;
  }

  if (v10[130] != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
    sub_10025F1C0();
  }
  uint64_t v30 = ASDErrorWithDescription(ASDErrorDomain, 1051LL, @"In-app purchases not allowed in App Clip");
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
LABEL_38:
  uint64_t v44 = (void *)v31;
  (*((void (**)(id, void, uint64_t))v47 + 2))(v47, 0LL, v31);

  if (v24 >= 1) {
    sandbox_extension_release(v24);
  }
LABEL_40:
}

- (void)handleInvalidReceipt:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = self;
    __int16 v16 = 2082;
    unsigned int v17 = "-[StoreKitServiceConnection handleInvalidReceipt:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v7 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v6,  0LL);
  if (v7)
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    id v8 = (void *)qword_10032E3F0;
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = v8;
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v7, "callerBundleID"));
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      unsigned int v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: handleInvalidReceipt for %{public}@",  buf,  0x16u);
    }

    uint64_t v11 = -[HandleInvalidReceiptTask initWithClient:pid:]( [HandleInvalidReceiptTask alloc],  "initWithClient:pid:",  v7,  [v6 processIdentifier]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10003A9BC;
    v12[3] = &unk_1002E6A50;
    uint64_t v13 = v4;
    -[HandleInvalidReceiptTask setCompletionBlock:](v11, "setCompletionBlock:", v12);
    -[NSOperationQueue addOperation:](self->_appTerminationQueue, "addOperation:", v11);
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3D8, OS_LOG_TYPE_ERROR)) {
      sub_10025F220();
    }
    v4[2](v4);
  }
}

- (void)xcodeTestServerPortWithReplyBlock:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    uint64_t v10 = "-[StoreKitServiceConnection xcodeTestServerPortWithReplyBlock:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v7,  0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
  v4[2](v4, [v6 activePort]);
}

- (void)refundRequestForTransactionId:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, id, void))a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2082;
    unsigned int v14 = "-[StoreKitServiceConnection refundRequestForTransactionId:replyBlock:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v11,  0x16u);
  }

  __int16 v9 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", ASDErrorDomain, 911LL, 0LL);
  v7[2](v7, v10, 0LL);
}

- (void)displayMessageWithType:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2082;
    __int16 v9 = "-[StoreKitServiceConnection displayMessageWithType:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)xcodeTestCertificatesWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v20 = self;
    __int16 v21 = 2082;
    id v22 = "-[StoreKitServiceConnection xcodeTestCertificatesWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  int v6 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  __int16 v8 = -[Client initWithConnection:overridesDictionary:](v6, "initWithConnection:overridesDictionary:", v7, 0LL);

  if (-[Client objc_clientType](v8, "objc_clientType") == 3)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[Client requestBundleID](v8, "requestBundleID"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v10));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 getStringValueForIdentifier:8 withContext:v11]);
    __int16 v13 = v12;
    if (v12 && [v12 length])
    {
      unsigned int v14 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v13,  0LL);
      uint64_t v15 = v14;
      if (v14)
      {
        id v18 = v14;
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      }

      else
      {
        __int16 v16 = &__NSArray0__struct;
      }
    }

    else
    {
      __int16 v16 = &__NSArray0__struct;
    }

    v4[2](v4, v16, 0LL);
  }

  else
  {
    uint64_t v17 = ASDErrorWithDescription(ASDErrorDomain, 950LL, @"The requested action is invalid for this application");
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
    ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v9);
  }
}

- (void)xcodeTestCertificatesShouldSimulateRevocationWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    __int16 v13 = self;
    __int16 v14 = 2082;
    uint64_t v15 = "-[StoreKitServiceConnection xcodeTestCertificatesShouldSimulateRevocationWithReply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v12,  0x16u);
  }

  int v6 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  __int16 v8 = -[Client initWithConnection:overridesDictionary:](v6, "initWithConnection:overridesDictionary:", v7, 0LL);

  if (-[Client objc_clientType](v8, "objc_clientType") != 3) {
    v4[2](v4, 0LL);
  }
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[Client requestBundleID](v8, "requestBundleID"));
  id v11 = [v9 storeKitErrorForCategory:2 bundleID:v10];

  ((void (**)(id, BOOL))v4)[2](v4, v11 == (id)17);
}

- (void)canMakePaymentsWithReply:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2082;
    int v12 = "-[StoreKitServiceConnection canMakePaymentsWithReply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v9,  0x16u);
  }

  int v6 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  __int16 v8 = -[Client initWithConnection:overridesDictionary:](v6, "initWithConnection:overridesDictionary:", v7, 0LL);

  v4[2](v4, (id)-[Client canMakePayments](v8, "canMakePayments"), 0LL);
}

- (void)promotionInfoForProductIdentifiers:(id)a3 client:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  __int16 v11 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = self;
    __int16 v25 = 2082;
    uint64_t v26 = "-[StoreKitServiceConnection promotionInfoForProductIdentifiers:client:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  else {
    __int16 v13 = 0LL;
  }
  id v14 = v13;
  uint64_t v15 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v12,  v14);

  if (v15)
  {
    productPromotionsQueue = self->_productPromotionsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B4D8;
    block[3] = &unk_1002E74A0;
    id v20 = v8;
    __int16 v21 = v15;
    id v22 = v10;
    dispatch_async((dispatch_queue_t)productPromotionsQueue, block);

    uint64_t v17 = v20;
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F280();
    }
    uint64_t v18 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v17);
  }
}

- (void)setPromotionInfo:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  __int16 v11 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = self;
    __int16 v25 = 2082;
    uint64_t v26 = "-[StoreKitServiceConnection setPromotionInfo:forClient:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  else {
    __int16 v13 = 0LL;
  }
  id v14 = v13;
  uint64_t v15 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v12,  v14);

  if (v15)
  {
    productPromotionsQueue = self->_productPromotionsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B804;
    block[3] = &unk_1002E74A0;
    id v20 = v8;
    __int16 v21 = v15;
    id v22 = v10;
    dispatch_async((dispatch_queue_t)productPromotionsQueue, block);

    uint64_t v17 = v20;
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F2E0();
    }
    uint64_t v18 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }
}

- (void)appTransactionForClient:(id)a3 ignoreCache:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v10 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = self;
    __int16 v30 = 2082;
    uint64_t v31 = "-[StoreKitServiceConnection appTransactionForClient:ignoreCache:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  else {
    int v12 = 0LL;
  }
  id v13 = v12;
  id v14 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v11,  v13);

  if (!v14)
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F340();
    }
    uint64_t v17 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_20;
  }

  if (-[Client isClip](v14, "isClip"))
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F3A0();
    }
    uint64_t v15 = ASDErrorWithDescription(ASDErrorDomain, 1051LL, @"In-app purchases not allowed in App Clip");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
LABEL_20:
    uint64_t v18 = (char *)v16;
    goto LABEL_21;
  }

  uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue( +[OctaneManager simulatedStoreKitErrorFor:client:]( &OBJC_CLASS___OctaneManager,  "simulatedStoreKitErrorFor:client:",  5LL,  v14));
  if (!v18)
  {
    id v20 = objc_alloc(&OBJC_CLASS____TtC9storekitd13DialogContext);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v14, "callerBundleID"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleURL](v14, "callerBundleURL"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[Client processInfo](v14, "processInfo"));
    uint64_t v24 = -[DialogContext initWithBundleID:bundleURL:processInfo:dialogObserver:]( v20,  "initWithBundleID:bundleURL:processInfo:dialogObserver:",  v21,  v22,  v23,  0LL);

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v14));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10003BC9C;
    v26[3] = &unk_1002E8910;
    id v27 = v9;
    [v25 appTransactionWithDialogContext:v24 ignoreCache:v6 completionHandler:v26];

    goto LABEL_22;
  }

  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  uint64_t v19 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = self;
    __int16 v30 = 2114;
    uint64_t v31 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Found simulated failure: %{public}@",  buf,  0x16u);
  }

- (void)authenticateAndSyncTransactionsAndStatusWithReply:(id)a3
{
  id v4 = a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = self;
    __int16 v23 = 2082;
    uint64_t v24 = "-[StoreKitServiceConnection authenticateAndSyncTransactionsAndStatusWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  BOOL v6 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = -[Client initWithConnection:overridesDictionary:](v6, "initWithConnection:overridesDictionary:", v7, 0LL);

  if (v8)
  {
    id v9 = (char *)objc_claimAutoreleasedReturnValue( +[OctaneManager simulatedStoreKitErrorFor:client:]( &OBJC_CLASS___OctaneManager,  "simulatedStoreKitErrorFor:client:",  3LL,  v8));
    if (!v9)
    {
      int v12 = objc_alloc(&OBJC_CLASS____TtC9storekitd13DialogContext);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v8, "callerBundleID"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleURL](v8, "callerBundleURL"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[Client processInfo](v8, "processInfo"));
      uint64_t v16 = -[DialogContext initWithBundleID:bundleURL:processInfo:dialogObserver:]( v12,  "initWithBundleID:bundleURL:processInfo:dialogObserver:",  v13,  v14,  v15,  0LL);

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v8));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10003C04C;
      v18[3] = &unk_1002E7310;
      uint64_t v19 = v8;
      id v20 = v4;
      [v17 authenticateAndSyncWithDialogContext:v16 completionHandler:v18];

      goto LABEL_18;
    }

    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    id v10 = (os_log_s *)qword_10032E3C8;
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Found simulated failure: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F400();
    }
    uint64_t v11 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    id v9 = (char *)objc_claimAutoreleasedReturnValue(v11);
  }

  (*((void (**)(id, char *))v4 + 2))(v4, v9);
LABEL_18:
}

- (void)enumerateCurrentReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  uint64_t v11 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = self;
    __int16 v25 = 2082;
    uint64_t v26 = "-[StoreKitServiceConnection enumerateCurrentReceiptsForProductID:withReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  int v12 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v14 = -[Client initWithConnection:overridesDictionary:](v12, "initWithConnection:overridesDictionary:", v13, 0LL);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v14));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10003C3FC;
    v21[3] = &unk_1002E8960;
    id v22 = v9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003C494;
    v17[3] = &unk_1002E89B0;
    id v18 = v22;
    uint64_t v19 = v14;
    id v20 = v10;
    [v15 enumerateCurrentReceiptsForProductID:v8 usingBlock:v21 completionHandler:v17];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F460();
    }
    uint64_t v16 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)enumerateReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  uint64_t v11 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = self;
    __int16 v25 = 2082;
    uint64_t v26 = "-[StoreKitServiceConnection enumerateReceiptsForProductID:withReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  int v12 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v14 = -[Client initWithConnection:overridesDictionary:](v12, "initWithConnection:overridesDictionary:", v13, 0LL);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v14));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10003C8A0;
    v21[3] = &unk_1002E8960;
    id v22 = v9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003C938;
    v17[3] = &unk_1002E89B0;
    id v18 = v22;
    uint64_t v19 = v14;
    id v20 = v10;
    [v15 enumerateReceiptsForProductID:v8 usingBlock:v21 completionHandler:v17];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F4C0();
    }
    uint64_t v16 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)enumerateUnfinishedTransactionsWithReceiver:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v21 = self;
    __int16 v22 = 2082;
    __int16 v23 = "-[StoreKitServiceConnection enumerateUnfinishedTransactionsWithReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v9 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v11 = -[Client initWithConnection:overridesDictionary:](v9, "initWithConnection:overridesDictionary:", v10, 0LL);

  if (v11)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v11));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003CD28;
    v18[3] = &unk_1002E8960;
    id v19 = v6;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003CDC0;
    v14[3] = &unk_1002E89B0;
    id v15 = v19;
    uint64_t v16 = v11;
    id v17 = v7;
    [v12 enumerateUnfinishedTransactionsUsingBlock:v18 completionHandler:v14];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F520();
    }
    uint64_t v13 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)isEligibleForIntroductoryOfferForGroupID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v8 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2082;
    __int16 v21 = "-[StoreKitServiceConnection isEligibleForIntroductoryOfferForGroupID:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v9 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v11 = -[Client initWithConnection:overridesDictionary:](v9, "initWithConnection:overridesDictionary:", v10, 0LL);

  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003D174;
    v14[3] = &unk_1002E71F8;
    id v15 = v11;
    id v16 = v6;
    id v17 = v7;
    +[objc_StoreFrontManager storefrontIdentifierForClient:completionHandler:]( &OBJC_CLASS____TtC9storekitd22objc_StoreFrontManager,  "storefrontIdentifierForClient:completionHandler:",  v15,  v14);

    int v12 = v15;
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F580((uint64_t)self);
    }
    uint64_t v13 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 950LL, 0LL, 0LL);
    int v12 = (_TtC9storekitd6Client *)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, void, _TtC9storekitd6Client *))v7 + 2))(v7, 0LL, v12);
  }
}

- (void)invalidateTransactionsAndStatusCacheWithReply:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2082;
    uint64_t v13 = "-[StoreKitServiceConnection invalidateTransactionsAndStatusCacheWithReply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v10,  0x16u);
  }

  id v6 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = -[Client initWithConnection:overridesDictionary:](v6, "initWithConnection:overridesDictionary:", v7, 0LL);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v8));
    [v9 clearTransactions];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3F0, OS_LOG_TYPE_ERROR)) {
      sub_10025F5E8();
    }
  }

  v4[2](v4);
}

- (void)isXcodeTestAppWithReply:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v5 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    int v10 = self;
    __int16 v11 = 2082;
    __int16 v12 = "-[StoreKitServiceConnection isXcodeTestAppWithReply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = -[Client initWithConnection:overridesDictionary:](v6, "initWithConnection:overridesDictionary:", v7, 0LL);

  v4[2](v4, -[Client objc_clientType](v8, "objc_clientType") == 3);
}

- (void)checkForMessages
{
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  objc_super v3 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v12 = self;
    __int16 v13 = 2082;
    id v14 = "-[StoreKitServiceConnection checkForMessages]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v5 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v4,  0LL);
  id v6 = v5;
  if (v5)
  {
    if (-[Client isClip](v5, "isClip"))
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E3D0, OS_LOG_TYPE_ERROR)) {
        sub_10025F6A8();
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[StoreKitMessagesManager sharedManager](&OBJC_CLASS___StoreKitMessagesManager, "sharedManager"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 revocationsForClient:v6]);

      if (v8)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        _OWORD v9[2] = sub_10003D77C;
        v9[3] = &unk_1002E8A00;
        v9[4] = self;
        id v10 = v8;
        -[StoreKitServiceConnection renewReceiptWithOptions:client:replyBlock:]( self,  "renewReceiptWithOptions:client:replyBlock:",  0LL,  0LL,  v9);
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3D0, OS_LOG_TYPE_ERROR)) {
      sub_10025F648();
    }
  }
}

- (void)registerArcadeAppWithRandomFromLib:(id)a3 randomFromLibLength:(unsigned int)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v10 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = self;
    __int16 v27 = 2082;
    uint64_t v28 = "-[StoreKitServiceConnection registerArcadeAppWithRandomFromLib:randomFromLibLength:resultHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend(v11, "sk_allowArcade"))
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    __int16 v12 = (os_log_s *)qword_10032E3C8;
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = self;
      __int16 v27 = 2114;
      uint64_t v28 = @"c4052938-7e9a-4cbd-a934-3b2c4b8a0937";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }

    __int16 v13 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v11,  0LL);
    unsigned int v14 = [v11 processIdentifier];
    id v15 = (void *)objc_opt_new(&OBJC_CLASS___ASDOcelotStore);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003DB54;
    v18[3] = &unk_1002E8A28;
    void v18[4] = self;
    id v19 = v13;
    id v22 = v9;
    unsigned int v23 = a4;
    unsigned int v24 = v14;
    id v20 = v8;
    __int16 v21 = @"c4052938-7e9a-4cbd-a934-3b2c4b8a0937";
    id v16 = v13;
    [v15 subscriptionStateWithCompletionBlock:v18];
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F798();
    }
    uint64_t v17 = ASDErrorWithDescription(ASDErrorDomain, 505LL, @"App is not entitled for Arcade");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    (*((void (**)(id, void, void, void, void, void *))v9 + 2))(v9, 0LL, 0LL, 0LL, 0LL, v15);
  }
}

- (void)arcadeSubscriptionStatusWithNonce:(unint64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v7 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = self;
    __int16 v27 = 2082;
    uint64_t v28 = "-[StoreKitServiceConnection arcadeSubscriptionStatusWithNonce:resultHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if ((objc_msgSend(v8, "sk_allowArcade") & 1) == 0)
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F798();
    }
    uint64_t v13 = ASDErrorWithDescription(ASDErrorDomain, 505LL, @"App is not entitled for Arcade");
    id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_20;
  }

  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v9 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = self;
    __int16 v27 = 2114;
    uint64_t v28 = @"34708d07-5a16-4532-9c48-5dbb144b8f28";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
  id v24 = 0LL;
  id v11 = [v10 fairplayContextWithError:&v24];
  id v12 = v24;

  if (v12)
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F934((uint64_t)self);
    }
LABEL_20:
    (*((void (**)(id, void, void, void, void, id))v6 + 2))(v6, 0LL, 0LL, 0LL, 0LL, v12);
    goto LABEL_21;
  }

  unsigned int v22 = 0;
  unsigned int v20 = 0;
  sub_1001EC760( (uint64_t)v11,  a3,  (uint64_t)[v8 processIdentifier],  (uint64_t)&v23,  (uint64_t)&v22,  (uint64_t)&v21,  (uint64_t)&v20);
  int v15 = v14;
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  id v16 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = self;
    __int16 v27 = 2114;
    uint64_t v28 = @"34708d07-5a16-4532-9c48-5dbb144b8f28";
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Status %ld", buf, 0x20u);
  }

  uint64_t v17 = 0LL;
  if (v23 && v22) {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
  }
  id v18 = 0LL;
  uint64_t v19 = v20;
  if (v21 && v20)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
    uint64_t v19 = v20;
  }

  (*((void (**)(id, void *, void, void *, uint64_t, void))v6 + 2))(v6, v17, v22, v18, v19, 0LL);

LABEL_21:
}

- (void)repairArcadeApp
{
  if (qword_10032E410 != -1) {
    dispatch_once(&qword_10032E410, &stru_1002E8AB0);
  }
  objc_super v3 = (os_log_s *)qword_10032E3C8;
  if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2082;
    int v14 = "-[StoreKitServiceConnection repairArcadeApp]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: %{public}s",  (uint8_t *)&v11,  0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend(v4, "sk_allowArcade"))
  {
    id v5 = -[Client initWithConnection:overridesDictionary:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithConnection:overridesDictionary:",  v4,  0LL);
    if (v5)
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      id v6 = (os_log_s *)qword_10032E3C8;
      if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: dc0d07d6-d699-41a8-aa7a-6784f6c89969",  (uint8_t *)&v11,  0xCu);
      }

      id v7 = objc_alloc(&OBJC_CLASS___ASDRepairOptions);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[Client callerBundleID](v5, "callerBundleID"));
      id v9 = [v7 initWithBundleID:v8];

      [v9 setExitReason:16];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ASDRepairService defaultService](&OBJC_CLASS___ASDRepairService, "defaultService"));
      [v10 repairAppWithOptions:v9 replyHandler:&stru_1002E8A68];
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
        sub_10025F99C();
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F798();
    }
  }
}

- (void)saveNewTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5
{
}

- (void)downloadManager:(id)a3 updatedStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_downloadIDs;
  objc_sync_enter(v8);
  downloadIDs = self->_downloadIDs;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadID]);
  LODWORD(downloadIDs) = -[NSMutableSet containsObject:](downloadIDs, "containsObject:", v10);

  objc_sync_exit(v8);
  if ((_DWORD)downloadIDs)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 state]));
    [v11 setObject:v12 forKeyedSubscript:@"state"];

    [v7 progress];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v11 setObject:v13 forKeyedSubscript:@"progress"];

    [v7 timeRemaining];
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v11 setObject:v14 forKeyedSubscript:@"time-remaining"];

    int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 toASDErrorWithMetadata:0]);
    [v11 setObject:v16 forKeyedSubscript:@"error"];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 installPath]);
    [v11 setObject:v17 forKeyedSubscript:@"download-install-path"];

    remoteObject = self->_remoteObject;
    v26[0] = @"download";
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadID]);
    v26[1] = @"download-status";
    v27[0] = v19;
    v27[1] = v11;
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    -[SKClientProtocol downloadStatusChanged:](remoteObject, "downloadStatusChanged:", v20);

    if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)4)
    {
      uint64_t v21 = self->_remoteObject;
      id v24 = @"download";
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadID]);
      __int16 v25 = v22;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      -[SKClientProtocol downloadRemoved:](v21, "downloadRemoved:", v23);
    }
  }
}

- (id)_bundleURLForConnection:(id)a3
{
  if (proc_pidpath((int)[a3 processIdentifier], buffer, 0x1000u) < 1)
  {
    objc_super v3 = 0LL;
LABEL_6:
    id v6 = 0LL;
    goto LABEL_7;
  }

  objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  if (!v3) {
    goto LABEL_6;
  }
  CFURLRef v4 = CFURLCreateWithFileSystemPath(0LL, v3, kCFURLPOSIXPathStyle, 0);
  if (!v4) {
    goto LABEL_6;
  }
  CFURLRef v5 = v4;
  id v6 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  CFRelease(v5);
LABEL_7:

  return v6;
}

- (id)_processDownloadsForTransactions:(id)a3
{
  id v17 = a3;
  CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[InAppDownloadManager manager](&OBJC_CLASS___InAppDownloadManager, "manager"));
  CFURLRef v5 = (void *)objc_claimAutoreleasedReturnValue([v4 processDownloadsForTransactions:v17]);

  obj = self->_downloadIDs;
  objc_sync_enter(obj);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tcr_numberForKey:", off_100327F60[0], obj));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tcr_arrayForKey:", @"assets"));
        if ([v12 count]) {
          BOOL v13 = v11 == 0LL;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          if (qword_10032E410 != -1) {
            dispatch_once(&qword_10032E410, &stru_1002E8AB0);
          }
          int v14 = (os_log_s *)off_100328238;
          if (os_log_type_enabled((os_log_t)off_100328238, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v23 = self;
            __int16 v24 = 2114;
            __int16 v25 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%{public}@: Processed download with ID: %{public}@",  buf,  0x16u);
          }

          -[NSMutableSet addObject:](self->_downloadIDs, "addObject:", v11);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v7);
  }

  objc_sync_exit(obj);
  return v6;
}

- (id)_silentAuthWithClientInfo:(id)a3 account:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___AMSBinaryPromise);
  if (v7)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
    [v11 setClientInfo:v7];
    [v11 setDebugReason:@"SK Silent Auth"];
    [v11 setAuthenticationType:1];
    id v12 = objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_DSID"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_altDSID"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
    id v16 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]( v12,  "initWithDSID:altDSID:username:options:",  v13,  v14,  v15,  v11);

    id v17 = [[AMSAuthenticateTask alloc] initWithRequest:v16];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 performAuthentication]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10003ED90;
    v24[3] = &unk_1002E8A90;
    id v25 = v9;
    id v19 = v10;
    id v26 = v19;
    [v18 addFinishBlock:v24];
    __int128 v20 = v26;
    id v21 = v19;
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025F9FC();
    }
    uint64_t v22 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, 0LL, 0LL);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v22);
    [v10 finishWithError:v11];
  }

  return v10;
}

- (id)_offerCodeRedemptionURLForClient:(id)a3
{
  id v3 = a3;
  CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bag]);
  CFURLRef v5 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey redeemCodeURL](&OBJC_CLASS____TtC9storekitd6BagKey, "redeemCodeURL"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForKey:v5]);
  id v33 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueWithError:&v33]);
  id v8 = v33;

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v7,  0LL));
    if (objc_msgSend(v3, "objc_clientType") != 3)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 bag]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[objc_URLParserHelper urlTypeFor:bag:error:]( &OBJC_CLASS____TtC9storekitd20objc_URLParserHelper,  "urlTypeFor:bag:error:",  v7,  v10,  0LL));
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 queryItems]);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v12));

    int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 requestBundleID]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"pbid",  v14));

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lld",  [v3 storeItemID]));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"paid",  v16));

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ctx",  @"offercodes"));
    v34[0] = v15;
    v34[1] = v17;
    v34[2] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL));
    [v13 addObjectsFromArray:v19];

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v13));
    [v9 setQueryItems:v20];

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
    uint64_t v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }

    else
    {
      if (qword_10032E410 != -1) {
        dispatch_once(&qword_10032E410, &stru_1002E8AB0);
      }
      __int16 v24 = (os_log_s *)qword_10032E3C8;
      if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
        sub_10025FB28(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }

  else
  {
    if (qword_10032E410 != -1) {
      dispatch_once(&qword_10032E410, &stru_1002E8AB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E3C8, OS_LOG_TYPE_ERROR)) {
      sub_10025FAC8();
    }
    uint64_t v22 = 0LL;
  }

  return v22;
}

+ (int64_t)_apiVersionForClientDict:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:off_100327E38[0]]);
  CFURLRef v4 = v3;
  else {
    int64_t v5 = 1LL;
  }

  return v5;
}

- (BOOL)_isClientValidForReview:(id)a3
{
  return 0;
}

- (BOOL)_isSKANVersionFourOrHigher:(id)a3
{
  return [a3 compare:@"4.0" options:64] != (id)-1;
}

- (_TtC9storekitd6Client)client
{
  return self->_client;
}

- (SKClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
}

- (void)externalGatewaySheetWithRequest:(id)a3 reply:(id)a4
{
}

- (void)externalPurchaseLinkURLsForBundleID:(id)a3 reply:(id)a4
{
}

- (void)_handleTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  id v16 = v15;

  _Block_copy(v8);
  sub_1000FF84C(v11, v13, v14, v16, (uint64_t)v17, (void (**)(void, void))v8);
  _Block_release(v8);
  swift_bridgeObjectRelease(v16);
  sub_10007F054(v11, v13);
}

- (void)checkPaymentAccountBindingEligibilityWithRequest:(id)a3 reply:(id)a4
{
}

- (void)bindPaymentAccountWithRequest:(id)a3 reply:(id)a4
{
}

- (void)manageSubscriptionsEngagementRequestWithRequest:(id)a3 reply:(id)a4
{
}

- (void)presentManageSubscriptionsWithRequest:(id)a3 reply:(id)a4
{
}

- (void)presentRefundRequestSheetForTransactionID:(id)a3 sceneID:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  _Block_copy(v8);
  id v11 = a3;
  unint64_t v12 = self;
  sub_1001041E4((uint64_t)v11, v9, (uint64_t)a4, (uint64_t)v12, (void (**)(void, void *))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(a4);
}

- (void)presentCodeRedemptionSheetWithSceneID:(id)a3 reply:(id)a4
{
}

- (void)acknowledgeMessage:(id)a3 reply:(id)a4
{
}

- (void)clientOverridesWithReply:(id)a3
{
  CFURLRef v4 = _Block_copy(a3);
  _Block_copy(v4);
  int64_t v5 = self;
  sub_10010717C((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (void)setClientOverrideWithRequest:(id)a3 reply:(id)a4
{
}

- (void)policyWithRequest:(id)a3 reply:(id)a4
{
}

- (void)productsWithRequest:(id)a3 responseReceiver:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  swift_unknownObjectRetain(a4);
  unint64_t v13 = self;
  id v10 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100109CB4(v10, v12, (uint64_t)a4, (uint64_t)v13, v8);
  _Block_release(v8);
  sub_10007F054((uint64_t)v10, (unint64_t)v12);
  swift_unknownObjectRelease(a4);
}

- (void)lookupProductWithParametersProductRequest:(id)a3 reply:(id)a4
{
}

- (void)addPurchaseIntentWithRequest:(id)a3 reply:(id)a4
{
}

- (void)clearPurchaseIntentsWithRequest:(id)a3 reply:(id)a4
{
}

- (void)purchaseIntentsWithRequest:(id)a3 reply:(id)a4
{
}

- (void)setAppInstallSheetBundleID:(id)a3 reply:(id)a4
{
}

- (void)storefront:(id)a3 reply:(id)a4
{
}

@end