@interface StoreKitTestingService
+ (id)defaultService;
- (BOOL)_validateMethodCall:(void *)a3 context:(id)a4 error:(id *)a5;
- (BOOL)isAppStoreSignedAppWithBundleID:(id)a3;
- (BOOL)validateMethodCall:(id)a3 context:(id)a4 error:(id *)a5;
- (id)_testingAppsDataWithError:(id *)a3;
- (id)validateOctaneContextFor:(id)a3 with:(id)a4 completion:(id)a5;
- (void)_logExitForMethod:(void *)a3 context:(id)a4;
- (void)buyProductWithConfiguration:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)buyProductWithID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6;
- (void)clearOverridesForBundleID:(id)a3 completion:(id)a4;
- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6;
- (void)configurationDataForBundleID:(id)a3 completion:(id)a4;
- (void)deleteAllTransactionsForBundleID:(id)a3 completion:(id)a4;
- (void)expireSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)forceRenewalOfSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)getActivePortWithCompletion:(id)a3;
- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)getStorefrontForBundleID:(id)a3 completion:(id)a4;
- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)getTransactionDataForBundleID:(id)a3 completion:(id)a4;
- (void)invalidateBag;
- (void)logExitForMethod:(id)a3 context:(id)a4;
- (void)performAction:(int64_t)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6;
- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5;
- (void)refreshQueueForBundleId:(id)a3 completion:(id)a4;
- (void)registerForEventOfType:(int64_t)a3 forBundleID:(id)a4 withFilterData:(id)a5 completion:(id)a6;
- (void)removeConfigurationForBundleID:(id)a3 completion:(id)a4;
- (void)removeTransactionIdentifiersFromCache:(id)a3 forBundleIdentifier:(id)a4;
- (void)revokeEntitlementsForProductIdentifiers:(id)a3 forBundleId:(id)a4 completion:(id)a5;
- (void)saveConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)saveConfigurationData:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)saveSigningData:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)sendPurchaseIntentForProductIdentifier:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6;
- (void)setStorefront:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)simulateStoreKitPushWithAction:(id)a3 forBundleIdentifiers:(id)a4;
- (void)startObservingTransactionsForBundleID:(id)a3 completion:(id)a4;
- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5;
- (void)testingAppsWithCompletion:(id)a3;
- (void)transactionDeleted:(unint64_t)a3 productID:(id)a4 forBundleID:(id)a5;
- (void)transactionUpdated:(id)a3 forBundleID:(id)a4;
- (void)unregisterForEventWithIdentifier:(id)a3 forBundleID:(id)a4;
- (void)updatePort:(int64_t)a3;
@end

@implementation StoreKitTestingService

+ (id)defaultService
{
  if (qword_10032E1B0 != -1) {
    dispatch_once(&qword_10032E1B0, &stru_1002E7F28);
  }
  return (id)qword_10032E1A8;
}

- (void)buyProductWithID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService buyProductWithID:bundleID:completion:]",  v10,  &v13);
  id v11 = v13;
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 buyProductWithID:v8 withContext:v10]);
  }

  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService buyProductWithID:bundleID:completion:]",  v10);
}

- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  v10 = (void (**)(id, id))a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:transactionID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:transactionID:",  a5,  a4));
  id v14 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService changeAutoRenewStatus:transactionID:bundleID:completion:]",  v11,  &v14);
  id v12 = v14;
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 changeAutoRenewStatus:v8 withContext:v11]);
  }

  v10[2](v10, v12);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService changeAutoRenewStatus:transactionID:bundleID:completion:]",  v11);
}

- (void)clearOverridesForBundleID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a3));
  id v10 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService clearOverridesForBundleID:completion:]",  v7,  &v10);
  id v8 = v10;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v9 clearOverridesWithContext:v7]);
  }

  v6[2](v6, v8);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService clearOverridesForBundleID:completion:]",  v7);
}

- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = (void (**)(id, id))a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:transactionID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:transactionID:",  a5,  a4));
  id v14 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService completeAskToBuyRequestWithResponse:transactionID:bundleID:completion:]",  v11,  &v14);
  id v12 = v14;
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 completeAskToBuyRequestWithResponse:v8 withContext:v11]);
  }

  v10[2](v10, v12);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService completeAskToBuyRequestWithResponse:transactionID:bundleID:completion:]",  v11);
}

- (void)deleteAllTransactionsForBundleID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a3));
  id v10 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService deleteAllTransactionsForBundleID:completion:]",  v7,  &v10);
  id v8 = v10;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v9 deleteAllTransactionsWithContext:v7]);
  }

  v6[2](v6, v8);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService deleteAllTransactionsForBundleID:completion:]",  v7);
}

- (void)expireSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService expireSubscriptionWithProductID:bundleID:completion:]",  v10,  &v13);
  id v11 = v13;
  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 expireOrRenewSubscriptionWithIdentifier:v8 expire:1 withContext:v10]);
  }

  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService expireSubscriptionWithProductID:bundleID:completion:]",  v10);
}

- (void)forceRenewalOfSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService forceRenewalOfSubscriptionWithProductID:bundleID:completion:]",  v10,  &v13);
  id v11 = v13;
  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 expireOrRenewSubscriptionWithIdentifier:v8 expire:0 withContext:v10]);
  }

  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService forceRenewalOfSubscriptionWithProductID:bundleID:completion:]",  v10);
}

- (void)getStorefrontForBundleID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a3));
  id v12 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService getStorefrontForBundleID:completion:]",  v7,  &v12);
  id v8 = v12;
  v9 = 0LL;
  if (!v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getStorefrontWithContext:v7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_100327B30[0]]);
  }

  v6[2](v6, v8, v9);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService getStorefrontForBundleID:completion:]",  v7);
}

- (void)getActivePortWithCompletion:(id)a3
{
  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  v5 = (void *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sk_clientID"));
    int v11 = 138543874;
    id v12 = v4;
    __int16 v13 = 2082;
    id v14 = "-[StoreKitTestingService getActivePortWithCompletion:]";
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Entering %{public}s called by %{public}@",  (uint8_t *)&v11,  0x20u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
  v3[2](v3, [v9 activePort]);

  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  id v10 = (os_log_s *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v4;
    __int16 v13 = 2082;
    id v14 = "-[StoreKitTestingService getActivePortWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Exiting  %{public}s",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)getTransactionDataForBundleID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a3));
  id v11 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService getTransactionDataForBundleID:completion:]",  v7,  &v11);
  id v8 = v11;
  v9 = 0LL;
  if (!v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 getTransactionDataWithContext:v7]);
  }

  v6[2](v6, v8, v9);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService getTransactionDataForBundleID:completion:]",  v7);
}

- (void)invalidateBag
{
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  v2 = (os_log_s *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG)) {
    sub_10025D7CC(v2);
  }
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  v3 = (os_log_s *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Sending storefront changed notification for Xcode test",  v4,  2u);
  }

  notify_post((const char *)-[__CFString UTF8String](off_1003281C0[0], "UTF8String"));
}

- (void)performAction:(int64_t)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, id))a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:transactionID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:transactionID:",  a5,  a4));
  id v17 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService performAction:transactionID:bundleID:completion:]",  v11,  &v17);
  id v12 = v17;
  if (!v12)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 performAction:a3 withContext:v11]);

    if (v12)
    {
      if (qword_10032E200 != -1) {
        dispatch_once(&qword_10032E200, &stru_1002E7F48);
      }
      id v14 = (void *)qword_10032E1F0;
      if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
        *(_DWORD *)buf = 138544130;
        v19 = v16;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        __int16 v22 = 2114;
        v23 = v11;
        __int16 v24 = 2114;
        id v25 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Failed to perform action %ld with context %{public}@: %{public}@",  buf,  0x2Au);
      }
    }
  }

  v10[2](v10, v12);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService performAction:transactionID:bundleID:completion:]",  v11);
}

- (void)removeConfigurationForBundleID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a3));
  id v10 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService removeConfigurationForBundleID:completion:]",  v7,  &v10);
  id v8 = v10;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    [v9 deleteDataWithContext:v7];
  }

  v6[2](v6, v8);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService removeConfigurationForBundleID:completion:]",  v7);
}

- (void)saveSigningData:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v14 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService saveSigningData:forBundleID:completion:]",  v10,  &v14);
  id v11 = v14;
  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v13 = [v12 saveSigningData:v8 withContext:v10];
  }

  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService saveSigningData:forBundleID:completion:]",  v10);
}

- (void)startObservingTransactionsForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v6));
  id v16 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService startObservingTransactionsForBundleID:completion:]",  v8,  &v16);
  id v9 = v16;
  id v10 = 0LL;
  if (!v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 getTransactionDataWithContext:v8]);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASDOctaneClientProtocol));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  [v13 setRemoteObjectInterface:v12];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  id v15 =  +[OctaneClientConnection addConnectionWithBundleID:connection:type:]( &OBJC_CLASS___OctaneClientConnection,  "addConnectionWithBundleID:connection:type:",  v6,  v14,  0LL);

  v7[2](v7, v9, v10);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService startObservingTransactionsForBundleID:completion:]",  v8);
}

- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id, uint64_t))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService getIntegerValueForIdentifier:forBundleID:completion:]",  v9,  &v13);
  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    uint64_t v11 = (uint64_t)[v12 getIntegerValueForIdentifier:a3 withContext:v9];
  }

  v8[2](v8, v10, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService getIntegerValueForIdentifier:forBundleID:completion:]",  v9);
}

- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, id, BOOL))a6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a5));
  id v14 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService setIntegerValue:forIdentifier:forBundleID:completion:]",  v11,  &v14);
  id v12 = v14;
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 setIntegerValue:a3 forIdentifier:a4 withContext:v11]);
  }

  v10[2](v10, v12, v12 == 0LL);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService setIntegerValue:forIdentifier:forBundleID:completion:]",  v11);
}

- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService getStringValueForIdentifier:forBundleID:completion:]",  v9,  &v13);
  id v10 = v13;
  uint64_t v11 = 0LL;
  if (!v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v12 getStringValueForIdentifier:a3 withContext:v9]);
  }

  v8[2](v8, v10, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService getStringValueForIdentifier:forBundleID:completion:]",  v9);
}

- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a5));
  id v15 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService setStringValue:forIdentifier:forBundleID:completion:]",  v12,  &v15);
  id v13 = v15;
  if (!v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v13 = (id)objc_claimAutoreleasedReturnValue([v14 setStringValue:v10 forIdentifier:a4 withContext:v12]);
  }

  v11[2](v11, v13);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService setStringValue:forIdentifier:forBundleID:completion:]",  v12);
}

- (void)setStorefront:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService setStorefront:forBundleID:completion:]",  v10,  &v13);
  id v11 = v13;
  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 setStorefront:v8 withContext:v10]);
  }

  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService setStorefront:forBundleID:completion:]",  v10);
}

- (void)testingAppsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sk_clientID"));
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  id v8 = (os_log_s *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v16 = v5;
    __int16 v17 = 2082;
    v18 = "-[StoreKitTestingService testingAppsWithCompletion:]";
    __int16 v19 = 2114;
    __int16 v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Entering %{public}s for by %{public}@",  buf,  0x20u);
  }

  if (objc_msgSend(v6, "sk_isOctanePrivileged"))
  {
    id v14 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitTestingService _testingAppsDataWithError:](self, "_testingAppsDataWithError:", &v14));
    id v10 = (char *)v14;
    if (v10)
    {
      if (qword_10032E200 != -1) {
        dispatch_once(&qword_10032E200, &stru_1002E7F48);
      }
      id v11 = (os_log_s *)qword_10032E1F0;
      if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = v5;
        __int16 v17 = 2114;
        v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Failed to get testing apps data: %{public}@ ",  buf,  0x16u);
      }
    }

    else if (![v9 length])
    {

      id v9 = 0LL;
    }

    v4[2](v4, v9, v10);
    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    id v13 = (os_log_s *)qword_10032E1F0;
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v5;
      __int16 v17 = 2082;
      v18 = "-[StoreKitTestingService testingAppsWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Exiting  %{public}s ",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v12 = ASDErrorWithDescription(ASDErrorDomain, 505LL, @"Client is not entitled to perform this action");
    id v10 = (char *)objc_claimAutoreleasedReturnValue(v12);
    v4[2](v4, 0LL, v10);
  }
}

- (void)configurationDataForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v6));
  id v17 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService configurationDataForBundleID:completion:]",  v8,  &v17);
  id v9 = v17;
  if (v9)
  {
    id v10 = v9;
    v7[2](v7, 0LL, v9);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v16 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 configurationDataForBundleID:v6 error:&v16]);
    id v10 = v16;

    if (v10)
    {
      if (qword_10032E200 != -1) {
        dispatch_once(&qword_10032E200, &stru_1002E7F48);
      }
      id v13 = (void *)qword_10032E1F0;
      if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 logKey]);
        *(_DWORD *)buf = 138543874;
        __int16 v19 = v15;
        __int16 v20 = 2114;
        id v21 = v6;
        __int16 v22 = 2114;
        id v23 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Failed to get configuration data for %{public}@: %{public}@ ",  buf,  0x20u);
      }
    }

    ((void (**)(id, void *, id))v7)[2](v7, v12, v10);
    -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService configurationDataForBundleID:completion:]",  v8);
  }
}

- (void)refreshQueueForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v6));
  id v12 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService refreshQueueForBundleId:completion:]",  v8,  &v12);
  id v9 = v12;
  if (!v9)
  {
    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG)) {
      sub_10025D86C();
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection octaneConnectionForBundleID:]( &OBJC_CLASS___StoreKitServiceConnection,  "octaneConnectionForBundleID:",  v10));

    if (v11)
    {
      [v11 checkServerQueueForQueue:@"DefaultQueue" withClient:0];
    }

    else
    {
      if (qword_10032E200 != -1) {
        dispatch_once(&qword_10032E200, &stru_1002E7F48);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_ERROR)) {
        sub_10025D80C();
      }
    }
  }

  v7[2](v7, v9);
}

- (void)revokeEntitlementsForProductIdentifiers:(id)a3 forBundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v9));
  id v19 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService revokeEntitlementsForProductIdentifiers:forBundleId:completion:]",  v11,  &v19);
  id v12 = v19;
  if (!v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection octaneConnectionForBundleID:]( &OBJC_CLASS___StoreKitServiceConnection,  "octaneConnectionForBundleID:",  v9));
    if (v13)
    {
      id v14 = (void *)v13;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10002C3E8;
      v17[3] = &unk_1002E74F0;
      id v18 = v10;
      [v14 notifyOfRevokedProductIdentifiers:v8 reply:v17];

      goto LABEL_5;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[StoreKitMessagesManager sharedManager](&OBJC_CLASS___StoreKitMessagesManager, "sharedManager"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager testAccountID](&OBJC_CLASS___OctaneManager, "testAccountID"));
    [v15 revokeProductIdentifiers:v8 forBundleID:v9 accountID:v16];
  }

  (*((void (**)(id, id))v10 + 2))(v10, v12);
LABEL_5:
}

- (void)transactionDeleted:(unint64_t)a3 productID:(id)a4 forBundleID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  id v9 = (os_log_s *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v21 = a3;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Notified of deleted transaction (%lu - %{public}@) for %{public}@",  buf,  0x20u);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneClientConnection connectionsForBundleID:]( &OBJC_CLASS___OctaneClientConnection,  "connectionsForBundleID:",  v8,  0LL));
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) transactionDeleted:a3 forBundleID:v8];
      }

      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)transactionUpdated:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG)) {
    sub_10025D8CC();
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneClientConnection connectionsForBundleID:]( &OBJC_CLASS___OctaneClientConnection,  "connectionsForBundleID:",  v6,  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) transactionUpdated:v5 forBundleID:v6];
      }

      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)updatePort:(int64_t)a3
{
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG)) {
    sub_10025D92C();
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
  [v4 portUpdated:a3];
}

- (void)removeTransactionIdentifiersFromCache:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v7));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService removeTransactionIdentifiersFromCache:forBundleIdentifier:]",  v8,  &v13);
  id v9 = v13;
  if (!v9)
  {
    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    uint64_t v10 = (void *)qword_10032E1F0;
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG)) {
      sub_10025D9EC(v10, v6, (uint64_t)v7);
    }
    id v11 = -[Client initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithBundleIdentifier:",  v7);
    if (v11)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v11));
      [v12 clearTransactions];
    }

    else
    {
      if (qword_10032E200 != -1) {
        dispatch_once(&qword_10032E200, &stru_1002E7F48);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_ERROR)) {
        sub_10025D98C();
      }
    }
  }
}

- (void)simulateStoreKitPushWithAction:(id)a3 forBundleIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 unsignedIntegerValue];
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEBUG)) {
    sub_10025DAE8();
  }
  __int128 v18 = v5;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v24;
  while (2)
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = -[Client initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithBundleIdentifier:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)i),  v18);
      if (!v13)
      {
        if (qword_10032E200 != -1) {
          dispatch_once(&qword_10032E200, &stru_1002E7F48);
        }
        if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_ERROR)) {
          sub_10025DA88();
        }
        goto LABEL_23;
      }

      __int128 v14 = v13;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v13));
      __int128 v16 = v15;
      if (v7 == (id)37)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = nullsub_5;
        v19[3] = &unk_1002E7E20;
        id v20 = v15;
        [v20 syncSubscriptionStatusWithReason:2 completionHandler:v19];
        __int128 v17 = &v20;
      }

      else
      {
        if (v7 != (id)36) {
          goto LABEL_16;
        }
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = nullsub_4;
        v21[3] = &unk_1002E7E20;
        id v22 = v15;
        [v22 syncReceiptsWithReason:2 completionHandler:v21];
        __int128 v17 = &v22;
      }

LABEL_16:
    }

    id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10) {
      continue;
    }
    break;
  }

- (void)registerForEventOfType:(int64_t)a3 forBundleID:(id)a4 withFilterData:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  __int128 v12 = (void (**)(id, void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v10));
  id v49 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService registerForEventOfType:forBundleID:withFilterData:completion:]",  v13,  &v49);
  id v14 = v49;
  if (v14)
  {
    v12[2](v12, 0LL);
  }

  else
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  0LL));
    v43 = self;
    id v44 = v11;
    if (v15)
    {
      __int128 v16 = v15;
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"bundleID"]);

      if (!v17)
      {
        v56 = @"bundleID";
        id v57 = v10;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
        uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_dictionaryByAddingEntriesFromDictionary:", v18));

        __int128 v16 = (void *)v19;
      }
    }

    else
    {
      v58 = @"bundleID";
      id v59 = v10;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneClientConnection connectionsForBundleID:]( &OBJC_CLASS___OctaneClientConnection,  "connectionsForBundleID:",  v20));

    if (![v21 count])
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASDOctaneClientProtocol));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v13 connection]);
      [v23 setRemoteObjectInterface:v22];

      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v13 connection]);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneClientConnection addConnectionWithBundleID:connection:type:]( &OBJC_CLASS___OctaneClientConnection,  "addConnectionWithBundleID:connection:type:",  v10,  v24,  1LL));
      v55 = v25;
      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
      v27 = v21;
      unint64_t v21 = (void *)v26;
    }

    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    v28 = v21;
    v29 = (os_log_s *)qword_10032E1F0;
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      int64_t v52 = a3;
      __int16 v53 = 2114;
      id v54 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Registering for event type %{public}ld with filter %{public}@",  buf,  0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance", 0LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v16,  0LL,  0LL));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 registerForEventOfType:a3 filterData:v31]);

    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    v33 = v28;
    v34 = (void *)qword_10032E1F0;
    id v14 = v42;
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      id v36 = [v33 count];
      *(_DWORD *)buf = 138543618;
      int64_t v52 = (int64_t)v32;
      __int16 v53 = 2050;
      id v54 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Registering observation id %{public}@ to %{public}ld client(s)",  buf,  0x16u);
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v37 = v33;
    id v38 = [v37 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * (void)i) registerObservationID:v32];
        }

        id v39 = [v37 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v39);
    }

    -[StoreKitTestingService _logExitForMethod:context:]( v43,  "_logExitForMethod:context:",  "-[StoreKitTestingService registerForEventOfType:forBundleID:withFilterData:completion:]",  v13);
    ((void (**)(id, void *))v12)[2](v12, v32);

    id v11 = v44;
  }
}

- (void)unregisterForEventWithIdentifier:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v26 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService unregisterForEventWithIdentifier:forBundleID:]",  v7,  &v26);
  id v8 = v26;
  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneClientConnection connectionsForBundleID:]( &OBJC_CLASS___OctaneClientConnection,  "connectionsForBundleID:",  v9));

    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    id v11 = (void *)qword_10032E1F0;
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v12 = v11;
      id v13 = [v10 count];
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
      *(_DWORD *)buf = 138543874;
      id v29 = v6;
      __int16 v30 = 2050;
      id v31 = v13;
      __int16 v32 = 2114;
      v33 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unregistering observation id %{public}@ with %{public}ld clients for %{public}@",  buf,  0x20u);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)i), "unregisterObservationID:", v6, (void)v22);
        }

        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v17);
    }

    if (!+[OctaneClientConnection observerCountForEventIdentifier:]( &OBJC_CLASS___OctaneClientConnection,  "observerCountForEventIdentifier:",  v6))
    {
      if (qword_10032E200 != -1) {
        dispatch_once(&qword_10032E200, &stru_1002E7F48);
      }
      id v20 = (os_log_s *)qword_10032E1F0;
      if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Unregistering observation id %{public}@ with XPC service",  buf,  0xCu);
      }

      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance", (void)v22));
      [v21 unregisterForEventWithIdentifier:v6];
    }

    -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService unregisterForEventWithIdentifier:forBundleID:]",  v7,  (void)v22);
  }
}

- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v8));
  uint64_t v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService storeKitErrorForCategory:bundleID:withReply:]",  v10,  &v13);
  id v11 = 0LL;
  if (!v13)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    id v11 = [v12 storeKitErrorForCategory:a3 bundleID:v8];
  }

  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService storeKitErrorForCategory:bundleID:withReply:]",  v10);
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v10));
  uint64_t v14 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService setStoreKitError:forCategory:bundleID:withReply:]",  v12,  &v14);
  if (!v14)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    [v13 setStoreKitError:a3 forCategory:a4 bundleID:v10];
  }

  v11[2](v11);
  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService setStoreKitError:forCategory:bundleID:withReply:]",  v12);
}

- (void)buyProductWithConfiguration:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id, void))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a4));
  id v13 = 0LL;
  -[StoreKitTestingService _validateMethodCall:context:error:]( self,  "_validateMethodCall:context:error:",  "-[StoreKitTestingService buyProductWithConfiguration:bundleID:completion:]",  v10,  &v13);
  id v11 = v13;
  if (v11)
  {
    v9[2](v9, v11, 0LL);
  }

  else
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
    [v12 buyProductWithConfiguration:v8 withContext:v10 withReply:v9];
  }

  -[StoreKitTestingService _logExitForMethod:context:]( self,  "_logExitForMethod:context:",  "-[StoreKitTestingService buyProductWithConfiguration:bundleID:completion:]",  v10);
}

- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (qword_10032E200 != -1) {
    dispatch_once(&qword_10032E200, &stru_1002E7F48);
  }
  id v9 = (os_log_s *)qword_10032E1F0;
  if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_INFO))
  {
    int v13 = 134349314;
    int64_t v14 = a3;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Received event from XPC service %{public}ld for observer %{public}@",  (uint8_t *)&v13,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v11 = objc_msgSend(v10, "sk_isOctanePrivileged");

  if ((v11 & 1) != 0)
  {
    +[OctaneClientConnection receiveEventOfType:withData:onAllObserversWithID:]( &OBJC_CLASS___OctaneClientConnection,  "receiveEventOfType:withData:onAllObserversWithID:",  a3,  v7,  v8);
  }

  else
  {
    if (qword_10032E200 != -1) {
      dispatch_once(&qword_10032E200, &stru_1002E7F48);
    }
    __int128 v12 = (os_log_s *)qword_10032E1F0;
    if (os_log_type_enabled((os_log_t)qword_10032E1F0, OS_LOG_TYPE_ERROR)) {
      sub_10025DB54(v12);
    }
  }
}

- (BOOL)isAppStoreSignedAppWithBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  id v6 = v5;
  id v7 = self;
  LOBYTE(v4) = sub_10007F1B4(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (BOOL)validateMethodCall:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  id v10 = a4;
  unsigned __int8 v11 = self;
  sub_10007F2EC(v7, v9, (uint64_t)v10);
  swift_bridgeObjectRelease(v9);

  return 1;
}

- (BOOL)_validateMethodCall:(void *)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = self;
  sub_10008042C((uint64_t)a3, (uint64_t)v7);

  return 1;
}

- (void)logExitForMethod:(id)a3 context:(id)a4
{
  uint64_t v7 = v6;
  id v8 = a4;
  uint64_t v9 = self;
  sub_10008063C();

  swift_bridgeObjectRelease(v7);
}

- (void)_logExitForMethod:(void *)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  sub_1000808E4((uint64_t)a3, (uint64_t)v6);
}

- (id)validateOctaneContextFor:(id)a3 with:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  _Block_copy(v8);
  __int16 v15 = self;
  id v16 = sub_1000809B0(v9, v11, v12, v14, v15, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  return v16;
}

- (void)saveConfigurationData:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v16 = v15;

  _Block_copy(v8);
  sub_100080BE8(v11, v13, v14, v16, v17, (void (**)(void, void *))v8);
  _Block_release(v8);
  swift_bridgeObjectRelease(v16);
  sub_10007F054(v11, v13);
}

- (void)saveConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  __int128 v23 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v16 = v15;

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  unint64_t v19 = v18;

  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  __int128 v22 = v21;

  _Block_copy(v10);
  sub_100081990(v14, v16, v17, v19, v20, v22, v23, v10);
  _Block_release(v10);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v22);
  sub_10007F054(v14, v16);
}

- (id)_testingAppsDataWithError:(id *)a3
{
  v3 = self;
  uint64_t v4 = sub_100083410();
  unint64_t v6 = v5;

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10007F054(v4, v6);
  return isa;
}

- (void)sendPurchaseIntentForProductIdentifier:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject(&unk_1002EB148, 24LL, 7LL);
  *(void *)(v13 + 16) = v8;
  uint64_t v14 = self;
  StoreKitTestingService.sendPurchaseIntent(for:bundleID:completion:)();

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v12);
  swift_release(v13);
}

@end