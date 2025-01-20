@interface OctaneManager
+ (NSNumber)testAccountID;
+ (id)sharedInstance;
+ (id)simulatedStoreKitErrorFor:(int64_t)a3 client:(id)a4;
- (BOOL)_deleteConfigurationFileWithContext:(id)a3;
- (BOOL)dialogsDisabledForBundleID:(id)a3;
- (BOOL)getBoolValueForIdentifier:(unint64_t)a3 withContext:(id)a4;
- (BOOL)octaneEnabledForApplicationWithBundleID:(id)a3;
- (BOOL)saveConfigurationAssetData:(id)a3 name:(id)a4 withContext:(id)a5 error:(id *)a6;
- (BOOL)saveConfigurationData:(id)a3 withContext:(id)a4 error:(id *)a5;
- (OctaneManager)init;
- (id)_appNameForContext:(id)a3;
- (id)_configurationDirectoryPathForBundleID:(id)a3 percentEncoded:(BOOL)a4;
- (id)buyProductWithID:(id)a3 withContext:(id)a4;
- (id)changeAutoRenewStatus:(BOOL)a3 withContext:(id)a4;
- (id)clearOverridesWithContext:(id)a3;
- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 withContext:(id)a4;
- (id)configurationDataForBundleID:(id)a3 error:(id *)a4;
- (id)configurationDirectoryForBundleID:(id)a3 mustExist:(BOOL)a4;
- (id)deleteAllTransactionsWithContext:(id)a3;
- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 withContext:(id)a5;
- (id)generateSKANPostbackSignature:(id)a3 withContext:(id)a4;
- (id)getStorefrontWithContext:(id)a3;
- (id)getStringValueForIdentifier:(unint64_t)a3 withContext:(id)a4;
- (id)getTransactionDataWithContext:(id)a3;
- (id)messageForBundleID:(id)a3;
- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4;
- (id)performAction:(int64_t)a3 withContext:(id)a4;
- (id)registerForEventOfType:(int64_t)a3 filterData:(id)a4;
- (id)saveSigningData:(id)a3 withContext:(id)a4;
- (id)setBoolValue:(BOOL)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5;
- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5;
- (id)setStorefront:(id)a3 withContext:(id)a4;
- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5;
- (int64_t)activePort;
- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 withContext:(id)a4;
- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4;
- (void)_deleteDataWithContext:(id)a3;
- (void)_refreshReceiptForBundleID:(id)a3 logKey:(id)a4;
- (void)buyProductWithConfiguration:(id)a3 withContext:(id)a4 withReply:(id)a5;
- (void)deleteDataWithContext:(id)a3;
- (void)dialogsDisabledForBundleID:(id)a3 completion:(id)a4;
- (void)handleAppsInstalledWithBundleIDs:(id)a3;
- (void)handleAppsUninstalledWithBundleIDs:(id)a3;
- (void)portUpdated:(int64_t)a3;
- (void)restartServerIfNecessary;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5;
- (void)startServerIfNecessaryFor:(id)a3;
- (void)unregisterForEventWithIdentifier:(id)a3;
- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4;
@end

@implementation OctaneManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DFB4;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032DFE8 != -1) {
    dispatch_once(&qword_10032DFE8, block);
  }
  return (id)qword_10032DFE0;
}

- (OctaneManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OctaneManager;
  v2 = -[OctaneManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cachedPort = -1LL;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.storekit.xcodetest.dispatch", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;
  }

  return v3;
}

+ (NSNumber)testAccountID
{
  return (NSNumber *)&off_100302750;
}

- (int64_t)activePort
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = -1LL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E0FC;
  v5[3] = &unk_1002E7840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)buyProductWithConfiguration:(id)a3 withContext:(id)a4 withReply:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ASOctaneServer shared](&OBJC_CLASS___ASOctaneServer, "shared"));
  [v8 buyProductWithConfiguration:v7 withReply:v6];
}

- (id)buyProductWithID:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10001E3E0;
  v25 = sub_10001E3F0;
  id v26 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E3F8;
  block[3] = &unk_1002E7868;
  v20 = &v21;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  v11 = (void *)v22[5];
  if (v11)
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    v12 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 logKey]);
      uint64_t v16 = v22[5];
      *(_DWORD *)buf = 138543874;
      v28 = v15;
      __int16 v29 = 2114;
      id v30 = v9;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed to buy the product with ID %{public}@: %{public}@",  buf,  0x20u);
    }

    v11 = (void *)v22[5];
  }

  id v13 = v11;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)changeAutoRenewStatus:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10001E3E0;
  v24 = sub_10001E3F0;
  id v25 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E67C;
  block[3] = &unk_1002E7890;
  id v18 = &v20;
  BOOL v19 = v4;
  id v8 = v6;
  id v17 = v8;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  id v9 = (void *)v21[5];
  if (v9)
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    id v10 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 logKey]);
      id v14 = [v8 transactionID];
      uint64_t v15 = v21[5];
      *(_DWORD *)buf = 138544130;
      v27 = v13;
      __int16 v28 = 2048;
      id v29 = v14;
      __int16 v30 = 1024;
      BOOL v31 = v4;
      __int16 v32 = 2114;
      uint64_t v33 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed to change the auto-renew status of %lu to %d: %{public}@",  buf,  0x26u);
    }

    id v9 = (void *)v21[5];
  }

  id v11 = v9;

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (id)clearOverridesWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10001E3E0;
  v24 = sub_10001E3F0;
  id v25 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_10001E908;
  id v17 = &unk_1002E6A00;
  BOOL v19 = &v20;
  id v6 = v4;
  id v18 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, &v14);
  id v7 = (void *)v21[5];
  if (v7)
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    id v8 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logKey", v14, v15, v16, v17));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      uint64_t v13 = v21[5];
      *(_DWORD *)buf = 138543874;
      v27 = v11;
      __int16 v28 = 2114;
      id v29 = v12;
      __int16 v30 = 2114;
      uint64_t v31 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed to clear overrides for %{public}@: %{public}@",  buf,  0x20u);
    }

    id v7 = (void *)v21[5];
  }

  id v9 = v7;

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10001E3E0;
  uint64_t v21 = sub_10001E3F0;
  id v22 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EB68;
  block[3] = &unk_1002E7890;
  uint64_t v15 = &v17;
  BOOL v16 = v4;
  id v8 = v6;
  id v14 = v8;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  if (v18[5])
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    id v9 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v8 logKey]);
      sub_10025C578();
    }

    goto LABEL_8;
  }

  if (v4)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection octaneConnectionForBundleID:]( &OBJC_CLASS___StoreKitServiceConnection,  "octaneConnectionForBundleID:",  v9));
    [v10 checkServerQueueForQueue:@"DefaultQueue" withClient:0];

LABEL_8:
  }

  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)deleteAllTransactionsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10001E3E0;
  uint64_t v21 = sub_10001E3F0;
  id v22 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_10001ED94;
  id v14 = &unk_1002E6A00;
  BOOL v16 = &v17;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, &v11);
  id v7 = (void *)v18[5];
  if (v7)
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    id v8 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logKey", v11, v12, v13, v14));
      sub_10025C5B8();
    }

    id v7 = (void *)v18[5];
  }

  id v9 = v7;

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void)deleteDataWithContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EE84;
  block[3] = &unk_1002E78B8;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)dialogsDisabledForBundleID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  a3));
  LOBYTE(self) = -[OctaneManager getBoolValueForIdentifier:withContext:]( self,  "getBoolValueForIdentifier:withContext:",  2LL,  v4);

  return (char)self;
}

- (void)dialogsDisabledForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ASOctaneServer shared](&OBJC_CLASS___ASOctaneServer, "shared"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001EF90;
  v9[3] = &unk_1002E78E0;
  id v10 = v5;
  id v8 = v5;
  [v7 getIntegerValueForIdentifier:2 forBundleID:v6 completion:v9];
}

- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 withContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v29 = 0LL;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  __int16 v32 = sub_10001E3E0;
  uint64_t v33 = sub_10001E3F0;
  id v34 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  uint64_t v23 = sub_10001F220;
  v24 = &unk_1002E7908;
  v27 = &v29;
  id v11 = v8;
  id v25 = v11;
  BOOL v28 = v6;
  id v12 = v9;
  id v26 = v12;
  dispatch_sync((dispatch_queue_t)dispatchQueue, &v21);
  if (v30[5])
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    uint64_t v13 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logKey", v21, v22, v23, v24, v25));
      id v15 = (void *)v14;
      BOOL v16 = @"force renew";
      uint64_t v17 = v30[5];
      if (v6) {
        BOOL v16 = @"expire";
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v14;
      __int16 v37 = 2114;
      v38 = v16;
      __int16 v39 = 2114;
      id v40 = v11;
      __int16 v41 = 2114;
      uint64_t v42 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed to %{public}@ subscription with identifier %{public}@: %{public}@",  buf,  0x2Au);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleID", v21, v22, v23, v24, v25));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 logKey]);
    -[OctaneManager _refreshReceiptForBundleID:logKey:](self, "_refreshReceiptForBundleID:logKey:", v13, v18);
  }

  id v19 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v19;
}

- (id)getStorefrontWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10001E3E0;
  BOOL v16 = sub_10001E3F0;
  id v17 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001F378;
  v9[3] = &unk_1002E6A00;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getTransactionDataWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10001E3E0;
  BOOL v16 = sub_10001E3F0;
  id v17 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001F4BC;
  v9[3] = &unk_1002E6A00;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)handleAppsInstalledWithBundleIDs:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F5AC;
  block[3] = &unk_1002E78B8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (void)handleAppsUninstalledWithBundleIDs:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F944;
  block[3] = &unk_1002E78B8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (id)messageForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ASOctaneServer shared](&OBJC_CLASS___ASOctaneServer, "shared"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageForBundleID:v3]);

  return v5;
}

- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ASOctaneServer shared](&OBJC_CLASS___ASOctaneServer, "shared"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 messageOfTypeForBundleID:v6 messageReason:v5]);

  return v8;
}

- (id)performAction:(int64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10001E3E0;
  id v25 = sub_10001E3F0;
  id v26 = 0LL;
  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  id v7 = (os_log_s *)(id)qword_10032E028;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    id v9 = [v6 transactionID];
    *(_DWORD *)buf = 138543874;
    BOOL v28 = v8;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    __int16 v31 = 2050;
    id v32 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Asked to perform action %ld on %{public}ld",  buf,  0x20u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FE38;
  block[3] = &unk_1002E7930;
  id v19 = &v21;
  int64_t v20 = a3;
  id v11 = v6;
  id v18 = v11;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  uint64_t v12 = (void *)v22[5];
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0 && !v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
    -[OctaneManager _refreshReceiptForBundleID:logKey:](self, "_refreshReceiptForBundleID:logKey:", v13, v14);

    uint64_t v12 = (void *)v22[5];
  }

  id v15 = v12;

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)portUpdated:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100020308;
  v4[3] = &unk_1002E6A28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)restartServerIfNecessary
{
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[StoreKitServiceConnection allConnections]( &OBJC_CLASS___StoreKitServiceConnection,  "allConnections",  0LL));
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v31 + 1) + 8 * (void)i) client]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestBundleID]);

        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[OctaneManager _configurationDirectoryPathForBundleID:percentEncoded:]( self,  "_configurationDirectoryPathForBundleID:percentEncoded:",  v10,  0LL));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned int v13 = [v12 fileExistsAtPath:v11];

        if (v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[ASOctaneServer shared](&OBJC_CLASS___ASOctaneServer, "shared"));
          [v14 useConfigurationDirectory:v11 forBundleID:v10];

          char v6 = 1;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v5);

    if ((v6 & 1) != 0)
    {
      if (qword_10032E038 != -1) {
        dispatch_once(&qword_10032E038, &stru_1002E7A18);
      }
      id v15 = (os_log_s *)qword_10032E028;
      if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEBUG)) {
        sub_10025C704(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      return;
    }
  }

  else
  {
  }

  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  uint64_t v23 = (os_log_s *)qword_10032E028;
  if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEBUG)) {
    sub_10025C6D0(v23, v24, v25, v26, v27, v28, v29, v30);
  }
}

- (id)saveSigningData:(id)a3 withContext:(id)a4
{
  return 0LL;
}

- (id)setStorefront:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10001E3E0;
  uint64_t v25 = sub_10001E3F0;
  id v26 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020760;
  block[3] = &unk_1002E7868;
  uint64_t v20 = &v21;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  id v11 = (void *)v22[5];
  if (v11)
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    uint64_t v12 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 logKey]);
      uint64_t v16 = v22[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v15;
      __int16 v29 = 2114;
      id v30 = v9;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed to set storefront to %{public}@: %{public}@",  buf,  0x20u);
    }

    id v11 = (void *)v22[5];
  }

  id v13 = v11;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)registerForEventOfType:(int64_t)a3 filterData:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10001E3E0;
  id v19 = sub_10001E3F0;
  id v20 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000208B8;
  block[3] = &unk_1002E7930;
  id v13 = &v15;
  int64_t v14 = a3;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)unregisterForEventWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020994;
  block[3] = &unk_1002E7958;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020A7C;
  block[3] = &unk_1002E78B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (id)generateSKANPostbackSignature:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10001E3E0;
  uint64_t v25 = sub_10001E3F0;
  id v26 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = sub_100020C68;
  id v18 = &unk_1002E6A00;
  id v20 = &v21;
  id v9 = v6;
  id v19 = v9;
  dispatch_sync((dispatch_queue_t)dispatchQueue, &v15);
  id v10 = (void *)v22[5];
  if (!v10)
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    id v11 = (os_log_s *)(id)qword_10032E028;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "logKey", v15, v16, v17, v18));
      sub_10025C738(v12, buf, v11);
    }

    id v10 = (void *)v22[5];
  }

  id v13 = v10;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020D78;
  block[3] = &unk_1002E7930;
  id v13 = &v15;
  int64_t v14 = a3;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5
{
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020E5C;
  block[3] = &unk_1002E7980;
  int64_t v13 = a3;
  int64_t v14 = a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)getBoolValueForIdentifier:(unint64_t)a3 withContext:(id)a4
{
  int64_t v4 = -[OctaneManager getIntegerValueForIdentifier:withContext:]( self,  "getIntegerValueForIdentifier:withContext:",  a3,  a4);
  if (v4) {
    BOOL v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (id)setBoolValue:(BOOL)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5
{
  return -[OctaneManager setIntegerValue:forIdentifier:withContext:]( self,  "setIntegerValue:forIdentifier:withContext:",  a3,  a4,  a5);
}

- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  id v7 = (void *)qword_10032E028;
  if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requested value for identifier %ld",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021068;
  block[3] = &unk_1002E7930;
  uint64_t v16 = buf;
  unint64_t v17 = a3;
  id v15 = v6;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  int64_t v12 = *(void *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a5;
  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  int64_t v9 = (void *)qword_10032E028;
  if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 logKey]);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requested to set value %ld for identifier %ld",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  unint64_t v22 = (unint64_t)sub_10001E3E0;
  uint64_t v23 = sub_10001E3F0;
  id v24 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000212A4;
  v16[3] = &unk_1002E79A8;
  int64_t v19 = a3;
  unint64_t v20 = a4;
  id v17 = v8;
  uint64_t v18 = buf;
  id v13 = v8;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v16);
  id v14 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  return v14;
}

- (id)getStringValueForIdentifier:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  id v7 = (void *)qword_10032E028;
  if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requested value for identifier %ld",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  int64_t v19 = sub_10001E3E0;
  unint64_t v20 = sub_10001E3F0;
  id v21 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000215F4;
  block[3] = &unk_1002E7930;
  uint64_t v16 = buf;
  unint64_t v17 = a3;
  id v15 = v6;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  id v12 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  id v10 = (void *)qword_10032E028;
  if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v24 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requested to set value %ld for identifier %ld",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  unint64_t v24 = (unint64_t)sub_10001E3E0;
  uint64_t v25 = sub_10001E3F0;
  id v26 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100021858;
  v18[3] = &unk_1002E79D0;
  id v21 = buf;
  unint64_t v22 = a4;
  id v19 = v8;
  id v20 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v18);
  id v16 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  return v16;
}

- (id)_appNameForContext:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleID]);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v3,  0LL,  0LL));

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  return v5;
}

- (BOOL)_deleteConfigurationFileWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[OctaneManager _configurationDirectoryPathForBundleID:percentEncoded:]( self,  "_configurationDirectoryPathForBundleID:percentEncoded:",  v5,  0LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v8 = 0;
  if ([v7 fileExistsAtPath:v6])
  {
    id v13 = 0LL;
    unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v13];
    id v9 = v13;
    if ((v8 & 1) != 0)
    {
      if (qword_10032E038 != -1) {
        dispatch_once(&qword_10032E038, &stru_1002E7A18);
      }
      id v10 = (void *)qword_10032E028;
      if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEBUG)) {
        sub_10025C788(v10, v4);
      }
    }

    else
    {
      if (qword_10032E038 != -1) {
        dispatch_once(&qword_10032E038, &stru_1002E7A18);
      }
      id v11 = (void *)qword_10032E028;
      if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_ERROR)) {
        sub_10025C848(v11, v4, (uint64_t)v9);
      }
    }
  }

  return v8;
}

- (void)_deleteDataWithContext:(id)a3
{
  id v6 = a3;
  if (-[OctaneManager _deleteConfigurationFileWithContext:](self, "_deleteConfigurationFileWithContext:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ASOctaneServer shared](&OBJC_CLASS___ASOctaneServer, "shared"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    [v4 appRemovedWithBundleID:v5];
  }
}

- (void)_refreshReceiptForBundleID:(id)a3 logKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10032E038 != -1) {
    dispatch_once(&qword_10032E038, &stru_1002E7A18);
  }
  id v7 = (os_log_s *)qword_10032E028;
  if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Refreshing receipt for %{public}@",  buf,  0x16u);
  }

  unsigned __int8 v8 = -[Client initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____TtC9storekitd6Client),  "initWithBundleIdentifier:",  v5);
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v8));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100021EC4;
    v14[3] = &unk_1002E79F8;
    id v15 = v6;
    id v11 = v9;
    id v16 = v11;
    [v10 requestUnifiedAppReceiptWithDialogContext:0 logKey:v15 options:0 completionHandler:v14];
    dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v11, v12))
    {
      if (qword_10032E038 != -1) {
        dispatch_once(&qword_10032E038, &stru_1002E7A18);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_ERROR)) {
        sub_10025C8E4();
      }
    }
  }

  else
  {
    if (qword_10032E038 != -1) {
      dispatch_once(&qword_10032E038, &stru_1002E7A18);
    }
    id v13 = (os_log_s *)qword_10032E028;
    if (os_log_type_enabled((os_log_t)qword_10032E028, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No client to refresh receipt",  buf,  0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

- (id)configurationDirectoryForBundleID:(id)a3 mustExist:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = sub_10007B1FC((uint64_t *)&unk_10032A1C0);
  __chkstk_darwin(v7);
  dispatch_semaphore_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  id v13 = self;
  sub_1000D86F8(v10, v12, v4, (uint64_t)v9);

  swift_bridgeObjectRelease(v12);
  uint64_t v14 = type metadata accessor for URL(0LL);
  id v16 = 0LL;
  if (sub_10007D824((uint64_t)v9, 1LL, v14) != 1)
  {
    URL._bridgeToObjectiveC()(v15);
    id v16 = v17;
    (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8LL))(v9, v14);
  }

  return v16;
}

- (BOOL)octaneEnabledForApplicationWithBundleID:(id)a3
{
  uint64_t v5 = v4;
  id v6 = self;
  char v7 = sub_1000D8E80();

  swift_bridgeObjectRelease(v5);
  return v7 & 1;
}

- (id)_configurationDirectoryPathForBundleID:(id)a3 percentEncoded:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  dispatch_semaphore_t v9 = self;
  sub_1000D8FEC(v6, v8, a4);
  uint64_t v11 = v10;

  swift_bridgeObjectRelease(v8);
  if (v11)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }

  else
  {
    NSString v12 = 0LL;
  }

  return v12;
}

- (void)startServerIfNecessaryFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000D91C4(v4);
}

- (BOOL)saveConfigurationData:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  OctaneManager.saveConfigurationData(_:context:)(v11, v13, v9);
  sub_10007F054(v11, v13);
  return 1;
}

- (BOOL)saveConfigurationAssetData:(id)a3 name:(id)a4 withContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  id v16 = v15;

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  unint64_t v19 = v18;

  OctaneManager.saveConfigurationAssetData(_:fileName:context:)(v14, v16, v17, v19, v12);
  swift_bridgeObjectRelease(v19);

  sub_10007F054(v14, (unint64_t)v16);
  return 1;
}

- (id)configurationDataForBundleID:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  id v8 = self;
  unint64_t v9 = OctaneManager.configurationData(for:)(v5, v7);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease(v7);

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10007F054(v9, v11);
  return isa;
}

+ (id)simulatedStoreKitErrorFor:(int64_t)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000D85D8(a3);

  return v6;
}

@end