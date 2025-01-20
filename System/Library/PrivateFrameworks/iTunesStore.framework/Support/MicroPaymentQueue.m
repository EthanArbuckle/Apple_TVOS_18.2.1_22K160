@interface MicroPaymentQueue
+ (id)paymentQueue;
- (BOOL)_inAppReviewEnabled;
- (MicroPaymentQueue)init;
- (id)_beginManagedContextSession;
- (id)_clientForConnection:(id)a3 paymentQueueClient:(id)a4;
- (id)_clientForObjectID:(id)a3;
- (id)_clientForPayment:(id)a3;
- (id)_clients;
- (id)_copyDownloadsIDsFromMessage:(id)a3 key:(const char *)a4;
- (id)_firstReadyPaymentInContext:(id)a3;
- (id)_inAppReviewRequestConstants;
- (id)_newPaymentQueueClientWithMessage:(id)a3 connection:(id)a4 parameter:(const char *)a5;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_dispatchAsync:(id)a3;
- (void)_enumerateDownloadsForIdentifiers:(id)a3 context:(id)a4 usingBlock:(id)a5;
- (void)_finishPaymentOperationForPaymentID:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)_networkTypeChanged:(id)a3;
- (void)_refreshDidFinishNotification:(id)a3;
- (void)_sendPurchaseIntentsForApp:(id)a3 storeKitClient:(id)a4 force:(BOOL)a5;
- (void)_setActivePaymentID:(id)a3;
- (void)_startFirstReadyPayment;
- (void)addInAppReviewRequestWithMessage:(id)a3 connection:(id)a4;
- (void)addPaymentWithMessage:(id)a3 connection:(id)a4;
- (void)addPurchaseIntentWithMessage:(id)a3 connection:(id)a4;
- (void)addPurchaseIntentWithProductIdentifier:(id)a3 productName:(id)a4 appBundleId:(id)a5 appName:(id)a6;
- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)cancelRequestWithMessage:(id)a3 connection:(id)a4;
- (void)checkQueueForClientWithIdentifier:(id)a3 URLBagContext:(id)a4;
- (void)checkQueueForClientWithMessage:(id)a3 connection:(id)a4;
- (void)connectedAppEnteredForegroundWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)failDownloadsWithIdentifiers:(id)a3;
- (void)finishDownloadsWithIdentifiers:(id)a3;
- (void)finishPaymentWithMessage:(id)a3 connection:(id)a4;
- (void)forceSandboxWithMessage:(id)a3 connection:(id)a4;
- (void)getPromotedIAPInfoInternalWithMessage:(id)a3 connection:(id)a4;
- (void)getPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4;
- (void)getPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4;
- (void)getTransactionsWithMessage:(id)a3 connection:(id)a4;
- (void)installSheetStateUpdatedWithMessage:(id)a3 connection:(id)a4;
- (void)notifyClientsOfExternalPropertyChanges:(id)a3 ofDownloadID:(int64_t)a4;
- (void)observeXPCServer:(id)a3;
- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)productsRequestWithMessage:(id)a3 connection:(id)a4;
- (void)registerClientWithMessage:(id)a3 connection:(id)a4;
- (void)resetInAppReviewRequestsWithMessage:(id)a3 connection:(id)a4;
- (void)restoreCompletedTransactionsWithMessage:(id)a3 connection:(id)a4;
- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)setPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4;
- (void)setPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4;
- (void)start;
- (void)startDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)startFirstReadyPayment;
- (void)updateDeferredPaymentWithMessage:(id)a3 connection:(id)a4;
- (void)updateInAppReviewRequestWithMessage:(id)a3 connection:(id)a4;
- (void)updateWithPurchaseResponse:(id)a3;
@end

@implementation MicroPaymentQueue

- (MicroPaymentQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MicroPaymentQueue;
  v2 = -[MicroPaymentQueue init](&v8, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunestored.MicroPaymentQueue", 0LL);
    v2->_purchaseActionsDBQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.itunestored.MicroPaymentQueue.PurchaseActionsDBQueue",  0LL);
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"MicroPaymentQueueAlive",  kSSUserDefaultsIdentifier,  &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      uint64_t v4 = AppIntegerValue;
    }
    else {
      uint64_t v4 = -1LL;
    }
    v2->_aliveState = v4;
    v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  v2,  "_refreshDidFinishNotification:",  @"StoreKitClientRefreshDidFinishNotification",  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  v2,  "_clientDisconnectNotification:",  @"XPCClientDisconnectNotification",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  ISNetworkTypeChangedNotification,  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  @"StoreKitClientRefreshDidFinishNotification",  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  @"XPCClientDisconnectNotification",  0LL);
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  purchaseActionsDBQueue = (dispatch_object_s *)self->_purchaseActionsDBQueue;
  if (purchaseActionsDBQueue) {
    dispatch_release(purchaseActionsDBQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MicroPaymentQueue;
  -[MicroPaymentQueue dealloc](&v6, "dealloc");
}

+ (id)paymentQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B3D8;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3250 != -1) {
    dispatch_once(&qword_1003A3250, block);
  }
  return (id)qword_1003A3248;
}

- (void)addPurchaseIntentWithProductIdentifier:(id)a3 productName:(id)a4 appBundleId:(id)a5 appName:(id)a6
{
  if (!a5)
  {
    id v29 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3, a4, 0LL, a6);
    if (!v29) {
      id v29 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v30 = [v29 shouldLog];
    else {
      LODWORD(v31) = v30;
    }
    v32 = (os_log_s *)[v29 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      uint64_t v31 = v31;
    }
    else {
      v31 &= 2u;
    }
    if (!(_DWORD)v31) {
      return;
    }
    int v49 = 138543618;
    uint64_t v50 = objc_opt_class(self);
    __int16 v51 = 2112;
    id v52 = a3;
    uint64_t v33 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  16LL,  "[%{public}@]: Purchase intent bundleId nil, aborting (productIdentifier: %@)",  &v49,  22);
    if (!v33) {
      return;
    }
    v34 = (void *)v33;
    +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v33, 4LL);
    free(v34);
    id v35 = v29;
LABEL_59:
    SSFileLog(v35, @"%@");
    return;
  }

  id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v12 = v11;
  if (!a3)
  {
    if (!v11) {
      id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v36 = [v12 shouldLog];
    else {
      LODWORD(v37) = v36;
    }
    v38 = (os_log_s *)[v12 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      uint64_t v37 = v37;
    }
    else {
      v37 &= 2u;
    }
    if (!(_DWORD)v37) {
      return;
    }
    int v49 = 138543618;
    uint64_t v50 = objc_opt_class(self);
    __int16 v51 = 2112;
    id v52 = a5;
    uint64_t v39 = _os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  16LL,  "[%{public}@]: Purchase intent productIdentifier nil, aborting (appBundleId: %@)",  &v49,  22);
    if (!v39) {
      return;
    }
    v40 = (void *)v39;
    +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v39, 4LL);
    free(v40);
    id v35 = v12;
    goto LABEL_59;
  }

  if (!v11) {
    id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    LODWORD(v14) = v13;
  }
  v15 = (os_log_s *)[v12 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v14 = v14;
  }
  else {
    v14 &= 2u;
  }
  if ((_DWORD)v14)
  {
    int v49 = 138544386;
    uint64_t v50 = objc_opt_class(self);
    __int16 v51 = 2114;
    id v52 = a3;
    __int16 v53 = 2114;
    id v54 = a4;
    __int16 v55 = 2114;
    id v56 = a5;
    __int16 v57 = 2114;
    id v58 = a6;
    uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[%{public}@]: Adding purchase intent for productID: %{public}@, productName: %{public}@, bundleID: %{public} @, appName: %{public}@",  &v49,  52);
    if (v16)
    {
      v17 = (void *)v16;
      v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
      free(v17);
      v46 = v18;
      SSFileLog(v12, @"%@");
    }
  }

  v19 = objc_alloc_init(&OBJC_CLASS___PurchaseIntent);
  -[PurchaseIntent setProductIdentifier:](v19, "setProductIdentifier:", a3);
  -[PurchaseIntent setProductName:](v19, "setProductName:", a4);
  -[PurchaseIntent setAppBundleId:](v19, "setAppBundleId:", a5);
  -[PurchaseIntent setAppName:](v19, "setAppName:", a6);
  -[NSDate timeIntervalSince1970](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSince1970");
  -[PurchaseIntent setTimestamp:]( v19,  "setTimestamp:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", (uint64_t)v20));
  -[PurchaseActionsManager insertPurchaseIntent:]( +[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"),  "insertPurchaseIntent:",  v19);

  v48 = 0LL;
  -[SpringBoardUtility launchApplicationWithIdentifier:options:error:]( +[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"),  "launchApplicationWithIdentifier:options:error:",  a5,  0LL,  &v48);
  v21 = v48;
  id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v23 = v22;
  if (v21)
  {
    if (!v22) {
      id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v24 = objc_msgSend(v23, "shouldLog", v46);
    else {
      LODWORD(v25) = v24;
    }
    v26 = (os_log_s *)[v23 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      uint64_t v27 = objc_opt_class(self);
      int v49 = 138543874;
      uint64_t v50 = v27;
      __int16 v51 = 2114;
      id v52 = a5;
      __int16 v53 = 2114;
      id v54 = v48;
      LODWORD(v47) = 32;
      uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  16LL,  "[%{public}@]: FBSystemService failed to open application %{public}@ with error: %{public}@",  &v49,  v47);
LABEL_57:
      v45 = (void *)v28;
      if (!v28) {
        return;
      }
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
      free(v45);
      id v35 = v23;
      goto LABEL_59;
    }
  }

  else
  {
    if (!v22) {
      id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v41 = objc_msgSend(v23, "shouldLog", v46);
    else {
      LODWORD(v42) = v41;
    }
    v43 = (os_log_s *)[v23 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v42 = v42;
    }
    else {
      v42 &= 2u;
    }
    if ((_DWORD)v42)
    {
      uint64_t v44 = objc_opt_class(self);
      int v49 = 138543618;
      uint64_t v50 = v44;
      __int16 v51 = 2114;
      id v52 = a5;
      LODWORD(v47) = 22;
      uint64_t v28 = _os_log_send_and_compose_impl( v42,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "[%{public}@]: Opened app: %{public}@",  &v49,  v47);
      goto LABEL_57;
    }
  }

- (void)checkQueueForClientWithIdentifier:(id)a3 URLBagContext:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002BA48;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = self;
  v4[6] = a3;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)failDownloadsWithIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002BDB8;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)finishDownloadsWithIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002C3D8;
  v3[3] = &unk_10034AE70;
  v3[4] = self;
  v3[5] = a3;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)notifyClientsOfExternalPropertyChanges:(id)a3 ofDownloadID:(int64_t)a4
{
  id v7 = [a3 objectForKey:SSDownloadExternalPropertyPercentComplete];
  id v8 = [a3 objectForKey:SSDownloadPropertyDownloadPhase];
  id v9 = [a3 objectForKey:SSDownloadExternalPropertyEstimatedTimeRemaining];
  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0LL;
  }
  if (!v10 || v8 != 0LL)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002CEB0;
    v12[3] = &unk_10034BA08;
    v12[7] = v9;
    v12[8] = a4;
    v12[4] = self;
    v12[5] = v8;
    v12[6] = v7;
    -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v12);
  }

- (void)observeXPCServer:(id)a3
{
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002D324;
  v2[3] = &unk_10034AE98;
  v2[4] = self;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v2);
}

- (void)startFirstReadyPayment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002D388;
  v2[3] = &unk_10034AE98;
  v2[4] = self;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v2);
}

- (void)updateWithPurchaseResponse:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002D3E0;
  v3[3] = &unk_10034AE70;
  v3[4] = a3;
  v3[5] = self;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (void)addPaymentWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D708;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)addPurchaseIntentWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D884;
  v4[3] = &unk_10034AF00;
  v4[4] = a3;
  v4[5] = self;
  v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D9DC;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)cancelRequestWithMessage:(id)a3 connection:(id)a4
{
}

- (void)checkQueueForClientWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    id v8 = (id)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v6);
    id v7 = -[SSURLBagContext initWithXPCEncoding:]( objc_alloc(&OBJC_CLASS___SSURLBagContext),  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "2"));
    -[MicroPaymentQueue checkQueueForClientWithIdentifier:URLBagContext:]( self,  "checkQueueForClientWithIdentifier:URLBagContext:",  v8,  v7);
  }

- (void)connectedAppEnteredForegroundWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DBA0;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)forceSandboxWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DDB4;
  v4[3] = &unk_10034AE70;
  v4[4] = a4;
  v4[5] = a3;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)finishPaymentWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DED8;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)getTransactionsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DF90;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)installSheetStateUpdatedWithMessage:(id)a3 connection:(id)a4
{
  else {
    CFDictionaryRef v6 = 0LL;
  }
  -[PurchaseActionsManager setAppBundleIdForCurrentInstallSheet:]( +[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"),  "setAppBundleIdForCurrentInstallSheet:",  v6);

  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_connection_send_message((xpc_connection_t)a4, reply);
  xpc_release(reply);
}

- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002E168;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)productsRequestWithMessage:(id)a3 connection:(id)a4
{
}

- (void)registerClientWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002E26C;
  v4[3] = &unk_10034AF00;
  v4[4] = a3;
  v4[5] = self;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)restoreCompletedTransactionsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002E55C;
  v4[3] = &unk_10034AF00;
  v4[4] = a3;
  v4[5] = self;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002E630;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)startDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002E700;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)updateDeferredPaymentWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementAskPermission))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002E81C;
    v7[3] = &unk_10034AE70;
    v7[4] = a3;
    v7[5] = self;
    -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v7);
  }

- (void)getPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002EFAC;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)setPromotedIAPOrderWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002F4CC;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)getPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002FB30;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)setPromotedIAPVisibilityWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000300C4;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)getPromotedIAPInfoInternalWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100030768;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)addInAppReviewRequestWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100030CC8;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = self;
  void v4[6] = a3;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (id)_inAppReviewRequestConstants
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  &off_10036D5D8,  @"inAppReviewRequestLimitWindow");
  -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  &off_10036D5F0,  @"inAppReviewRequestsPerWindow");
  -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  &off_10036D5D8,  @"inAppReviewRequiredDaysAfterReview");
  -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  &__kCFBooleanTrue,  @"inAppReviewRequireNewVersionAfterReview");
  v3 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  uint64_t v4 = dispatch_semaphore_create(0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000317C4;
  v6[3] = &unk_10034AF00;
  v6[4] = v3;
  v6[5] = v2;
  v6[6] = v4;
  -[ISLoadURLBagOperation setCompletionBlock:](v3, "setCompletionBlock:", v6);
  objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", v3);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  return v2;
}

- (void)updateInAppReviewRequestWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000318F8;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)resetInAppReviewRequestsWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || SSXPCConnectionHasEntitlement(a4, kSSStoreKitEntitlementClientOverride))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100031BB8;
    v6[3] = &unk_10034AE70;
    v6[4] = a4;
    v6[5] = self;
    -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v6);
  }

- (BOOL)_inAppReviewEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue( kSSUserDefaultsKeyInAppReviewEnabled,  kSSUserDefaultsIdentifier,  &keyExistsAndHasValidFormat)
      || keyExistsAndHasValidFormat == 0;
}

- (void)_clientDisconnectNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100031DE0;
  v3[3] = &unk_10034AE70;
  uint64_t v4 = self;
  id v5 = [a3 object];
  -[MicroPaymentQueue _dispatchAsync:](v4, "_dispatchAsync:", v3);
}

- (void)_networkTypeChanged:(id)a3
{
  if (-[ISNetworkObserver networkType]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance", a3),  "networkType"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100032068;
    v4[3] = &unk_10034AE98;
    v4[4] = self;
    -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v4);
  }

- (void)_refreshDidFinishNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003211C;
  v3[3] = &unk_10034AE98;
  void v3[4] = self;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v3);
}

- (id)_beginManagedContextSession
{
  if (!self->_clients)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003219C;
    v3[3] = &unk_10034AE98;
    void v3[4] = self;
    [(id)sub_10003E170(0) checkIntegrityWithInitializationBlock:v3];
  }

  return +[NSThread beginManagedContextSession](&OBJC_CLASS___NSThread, "beginManagedContextSession");
}

- (id)_clientForConnection:(id)a3 paymentQueueClient:(id)a4
{
  id v7 = -[MicroPaymentQueue _clients](self, "_clients");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(StoreKitClient **)(*((void *)&v16 + 1) + 8 * v11);
      if (-[StoreKitClient isEqualToXPCConnection:paymentQueueClient:]( v12,  "isEqualToXPCConnection:paymentQueueClient:",  a3,  a4))
      {
        break;
      }

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }

    if (v12) {
      goto LABEL_12;
    }
  }

- (id)_clientForObjectID:(id)a3
{
  id v5 = -[MicroPaymentQueue _clients](self, "_clients");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(StoreKitClient **)(*((void *)&v13 + 1) + 8 * v9);
      if ((-[NSManagedObjectID isEqual:]( -[StoreKitClient microPaymentClientID](v10, "microPaymentClientID"),  "isEqual:",  a3) & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }

    if (v10) {
      return v10;
    }
  }

- (id)_clientForPayment:(id)a3
{
  id result = objc_msgSend(objc_msgSend(a3, "client"), "objectID");
  if (result) {
    return -[MicroPaymentQueue _clientForObjectID:](self, "_clientForObjectID:", result);
  }
  return result;
}

- (id)_clients
{
  id result = self->_clients;
  if (!result)
  {
    self->_clients = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v4 = -[MicroPaymentQueue _beginManagedContextSession](self, "_beginManagedContextSession");
    id v5 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    -[NSFetchRequest setEntity:]( v5,  "setEntity:",  +[MicroPaymentClient entityForContext:](&OBJC_CLASS___MicroPaymentClient, "entityForContext:", v4));
    v78 = 0LL;
    v62 = v4;
    v60 = v5;
    id v6 = &ACSLocateCachingServer_ptr;
    id obj = [v4 executeFetchRequest:v5 error:&v78];
    if (obj)
    {
      id v7 = (const __CFString *)kSSUserDefaultsIdentifier;
      if (!CFPreferencesGetAppBooleanValue(@"MicroPaymentQueueCleanupClients", kSSUserDefaultsIdentifier, 0LL))
      {
        applicationID = v7;
        uint64_t v8 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [obj count]);
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        id v64 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
        if (v64)
        {
          uint64_t v63 = *(void *)v75;
          v61 = v8;
          do
          {
            for (i = 0LL; i != v64; i = (char *)i + 1)
            {
              if (*(void *)v75 != v63) {
                objc_enumerationMutation(obj);
              }
              uint64_t v10 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
              unsigned int v11 = objc_msgSend(objc_msgSend(v10, "usesIdentityAttributes"), "BOOLValue");
              id v12 = objc_alloc(&OBJC_CLASS___NSArray);
              id v13 = [v10 identifier];
              if (v11) {
                __int128 v14 = -[NSArray initWithObjects:]( v12,  "initWithObjects:",  v13,  [v10 bundleVersion],  objc_msgSend(v10, "storeIdentifier"),  objc_msgSend(v10, "storeVersion"),  objc_msgSend(v10, "sandboxed"),  0);
              }
              else {
                __int128 v14 = -[NSArray initWithObjects:]( v12,  "initWithObjects:",  v13,  [v10 sandboxed],  0,  v56,  v57,  v58);
              }
              __int128 v15 = v14;
              __int128 v16 = -[ArrayHash initWithArray:](objc_alloc(&OBJC_CLASS___ArrayHash), "initWithArray:", v14);

              id v17 = -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v16);
              if (v17)
              {
                id v18 = v17;
                id v19 = [v6[459] sharedDaemonConfig];
                if (!v19) {
                  id v19 = [v6[459] sharedConfig];
                }
                double v20 = v6;
                LODWORD(v21) = [v19 shouldLog];
                id v22 = (os_log_s *)[v19 OSLogObject];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                  uint64_t v21 = v21;
                }
                else {
                  v21 &= 2u;
                }
                if ((_DWORD)v21)
                {
                  uint64_t v23 = objc_opt_class(self);
                  int v81 = 138412802;
                  uint64_t v82 = v23;
                  __int16 v83 = 2112;
                  id v84 = v10;
                  __int16 v85 = 2112;
                  id v86 = v18;
                  LODWORD(v55) = 32;
                  uint64_t v24 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%@: Merging duplicate client %@ into client %@",  &v81,  v55);
                  if (v24)
                  {
                    uint64_t v25 = (void *)v24;
                    v26 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL);
                    free(v25);
                    id v54 = v26;
                    SSFileLog(v19, @"%@");
                  }
                }

                id v27 = objc_msgSend(objc_msgSend(v10, "payments", v54), "copy");
                __int128 v70 = 0u;
                __int128 v71 = 0u;
                __int128 v72 = 0u;
                __int128 v73 = 0u;
                id v28 = [v27 countByEnumeratingWithState:&v70 objects:v80 count:16];
                if (v28)
                {
                  id v29 = v28;
                  uint64_t v30 = *(void *)v71;
                  do
                  {
                    for (j = 0LL; j != v29; j = (char *)j + 1)
                    {
                      if (*(void *)v71 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      [*(id *)(*((void *)&v70 + 1) + 8 * (void)j) setClient:v18];
                    }

                    id v29 = [v27 countByEnumeratingWithState:&v70 objects:v80 count:16];
                  }

                  while (v29);
                }

                [v62 deleteObject:v10];

                id v6 = v20;
                uint64_t v8 = v61;
              }

              else
              {
                -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, v16);
              }
            }

            id v64 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
          }

          while (v64);
        }

        sub_10003E244(v62);
        id obj = -[NSMutableDictionary allValues](v8, "allValues");

        CFPreferencesSetAppValue( @"MicroPaymentQueueCleanupClients",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  applicationID);
        CFPreferencesAppSynchronize(kITunesStoreDaemonDefaultsID);
      }

      id v32 = [v6[459] sharedDaemonConfig];
      if (!v32) {
        id v32 = [v6[459] sharedConfig];
      }
      unsigned int v33 = [v32 shouldLog];
      else {
        unsigned int v34 = v33;
      }
      id v35 = (os_log_s *)[v32 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
        uint64_t v36 = v34;
      }
      else {
        uint64_t v36 = v34 & 2;
      }
      if ((_DWORD)v36)
      {
        uint64_t v37 = objc_opt_class(self);
        id v38 = [obj count];
        int v81 = 138412546;
        uint64_t v82 = v37;
        __int16 v83 = 2048;
        id v84 = v38;
        LODWORD(v55) = 22;
        uint64_t v39 = _os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  1LL,  "%@: Found %lu existing clients",  &v81,  v55);
        if (v39)
        {
          v40 = (void *)v39;
          unsigned int v41 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v39, 4LL);
          free(v40);
          id v54 = v41;
          SSFileLog(v32, @"%@");
        }
      }

      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16, v54);
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v67;
        do
        {
          for (k = 0LL; k != v43; k = (char *)k + 1)
          {
            if (*(void *)v67 != v44) {
              objc_enumerationMutation(obj);
            }
            v46 = -[StoreKitClient initWithMicroPaymentClientID:]( [StoreKitClient alloc],  "initWithMicroPaymentClientID:",  [*(id *)(*((void *)&v66 + 1) + 8 * (void)k) objectID]);
            -[NSMutableArray addObject:](self->_clients, "addObject:", v46);
          }

          id v43 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
        }

        while (v43);
      }
    }

    else
    {
      id v47 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v47) {
        id v47 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v48 = [v47 shouldLog];
      else {
        LODWORD(v49) = v48;
      }
      uint64_t v50 = (os_log_s *)[v47 OSLogObject];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v49 = v49;
      }
      else {
        v49 &= 2u;
      }
      if ((_DWORD)v49)
      {
        uint64_t v51 = objc_opt_class(self);
        int v81 = 138412546;
        uint64_t v82 = v51;
        __int16 v83 = 2112;
        id v84 = v78;
        uint64_t v52 = _os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v50,  0LL,  "%@: Could not load clients: %@",  &v81,  22);
        if (v52)
        {
          __int16 v53 = (void *)v52;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v52, 4LL);
          free(v53);
          SSFileLog(v47, @"%@");
        }
      }
    }

    +[NSThread endManagedContextSession](&OBJC_CLASS___NSThread, "endManagedContextSession");
    return self->_clients;
  }

  return result;
}

- (id)_copyDownloadsIDsFromMessage:(id)a3 key:(const char *)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  xpc_object_t value = xpc_dictionary_get_value(a3, a4);
  if (value)
  {
    uint64_t v8 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_array)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_100032D9C;
      applier[3] = &unk_10034BAF8;
      applier[4] = v6;
      xpc_array_apply(v8, applier);
    }
  }

  return v6;
}

- (void)_dispatchAsync:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032E94;
  block[3] = &unk_10034BB20;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_enumerateDownloadsForIdentifiers:(id)a3 context:(id)a4 usingBlock:(id)a5
{
  id v7 = +[MicroPaymentDownload downloadEntityFromContext:]( &OBJC_CLASS___MicroPaymentDownload,  "downloadEntityFromContext:",  a4);
  uint64_t v8 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"downloadID",  @"payment",  0LL);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = a3;
  id v9 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12);
        __int128 v14 = objc_autoreleasePoolPush();
        __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
        -[NSFetchRequest setEntity:](v15, "setEntity:", v7);
        -[NSFetchRequest setPredicate:]( v15,  "setPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"downloadID=%@",  v13));
        -[NSFetchRequest setPropertiesToFetch:](v15, "setPropertiesToFetch:", v8);
        id v16 = [a4 executeFetchRequest:v15 error:0];
        id v17 = [v16 count];
        id v18 = 0LL;
        if (v17 == (id)1) {
          id v18 = [v16 objectAtIndex:0];
        }
        (*((void (**)(id, uint64_t, id))a5 + 2))(a5, v13, v18);

        objc_autoreleasePoolPop(v14);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }
}

- (void)_finishPaymentOperationForPaymentID:(id)a3 result:(BOOL)a4 error:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000330F0;
  v5[3] = &unk_10034BB48;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  -[MicroPaymentQueue _dispatchAsync:](self, "_dispatchAsync:", v5, a4, a5);
}

- (id)_firstReadyPaymentInContext:(id)a3
{
  id v4 = -[MicroPaymentQueue _clients](self, "_clients");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) firstReadyPaymentID];
        if (v9) {
          return [a3 objectWithID:v9];
        }
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (id)_newPaymentQueueClientWithMessage:(id)a3 connection:(id)a4 parameter:(const char *)a5
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) == 0
    && !SSXPCConnectionHasEntitlement(a4, kSSStoreKitEntitlementClientOverride))
  {
    return 0LL;
  }

  id v8 = objc_alloc((Class)sub_1001468B8());
  return objc_msgSend(v8, "initWithXPCEncoding:", xpc_dictionary_get_value(a3, a5));
}

- (void)_sendPurchaseIntentsForApp:(id)a3 storeKitClient:(id)a4 force:(BOOL)a5
{
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  dispatch_retain(v8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000333C0;
  v10[3] = &unk_10034BB70;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = v8;
  v10[7] = a4;
  -[PurchaseActionsManager getPurchaseIntentsForApp:completionHandler:]( +[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"),  "getPurchaseIntentsForApp:completionHandler:",  a3,  v10);
  dispatch_time_t v9 = dispatch_time(0LL, 90000000000LL);
  dispatch_semaphore_wait(v8, v9);
  dispatch_release(v8);
}

- (void)_setActivePaymentID:(id)a3
{
  activePaymentID = self->_activePaymentID;
  if (activePaymentID != a3)
  {
    if (!activePaymentID)
    {
      objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "takeKeepAliveAssertion:",  @"com.apple.itunesstored.MicroPaymentQueue");
      activePaymentID = self->_activePaymentID;
    }

    id v6 = (NSManagedObjectID *)a3;
    self->_activePaymentID = v6;
    if (!v6) {
      objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "releaseKeepAliveAssertion:",  @"com.apple.itunesstored.MicroPaymentQueue");
    }
  }

- (void)_startFirstReadyPayment
{
  activePaymentID = self->_activePaymentID;
  if (!activePaymentID)
  {
    id v4 = -[MicroPaymentQueue _firstReadyPaymentInContext:]( self,  "_firstReadyPaymentInContext:",  -[MicroPaymentQueue _beginManagedContextSession](self, "_beginManagedContextSession"));
    if (v4)
    {
      id v5 = v4;
      id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v7 = [v6 shouldLog];
      else {
        LODWORD(v8) = v7;
      }
      dispatch_time_t v9 = (os_log_s *)[v6 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        uint64_t v8 = v8;
      }
      else {
        v8 &= 2u;
      }
      if ((_DWORD)v8)
      {
        int v19 = 138412546;
        uint64_t v20 = objc_opt_class(self);
        __int16 v21 = 2112;
        __int128 v22 = v5;
        uint64_t v10 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Starting payment: %@",  &v19,  22);
        if (v10)
        {
          __int128 v11 = (void *)v10;
          __int128 v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
          free(v11);
          id v17 = v12;
          SSFileLog(v6, @"%@");
        }
      }

      id v13 = objc_msgSend(v5, "objectID", v17);
      -[MicroPaymentQueue _setActivePaymentID:](self, "_setActivePaymentID:", v13);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100033A58;
      v18[3] = &unk_10034BB98;
      v18[4] = +[SSWeakReference weakReferenceWithObject:]( &OBJC_CLASS___SSWeakReference,  "weakReferenceWithObject:",  self);
      v18[5] = v13;
      objc_msgSend( -[MicroPaymentQueue _clientForPayment:](self, "_clientForPayment:", v5),  "startPaymentWithObjectID:withCompletionBlock:",  v13,  v18);
    }

    +[NSThread endManagedContextSession](&OBJC_CLASS___NSThread, "endManagedContextSession");
    activePaymentID = self->_activePaymentID;
  }

  int64_t v14 = activePaymentID != 0LL;
  if (self->_aliveState != v14)
  {
    __int128 v15 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", v14);
    self->_aliveState = v14;
    id v16 = (const __CFString *)kSSUserDefaultsIdentifier;
    CFPreferencesSetAppValue(@"MicroPaymentQueueAlive", v15, kSSUserDefaultsIdentifier);
    CFPreferencesAppSynchronize(v16);
  }

@end