@interface AKDeviceListController
+ (id)sharedController;
- (AKAccountManager)accountManager;
- (AKDeviceListController)initWithAccountManager:(id)a3;
- (BOOL)shouldSuppressPushMessage:(id)a3;
- (void)_clearDeviceListForAltDSID:(id)a3;
- (void)_handleCurrentDeviceTrustStatusChangedWithPayload:(id)a3;
- (void)_refreshDeviceListForAltDSID:(id)a3;
- (void)_sendTrustedDeviceListChangeNotification;
- (void)processPushMessage:(id)a3;
- (void)setAccountManager:(id)a3;
@end

@implementation AKDeviceListController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061B54;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F428 != -1) {
    dispatch_once(&qword_10020F428, block);
  }
  return (id)qword_10020F420;
}

- (AKDeviceListController)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKDeviceListController;
  v6 = -[AKDeviceListController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] != (id)1200) {
    goto LABEL_21;
  }
  uint64_t v5 = _AKLogSystem(1200LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling push with command AKPushMessageCommandNotifyTrustedDeviceListChanged...",  buf,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"tddelta"]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v8, v10);
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"items"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
  {

    goto LABEL_11;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  id v16 = [v15 mutableCopy];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100061FAC;
  v49[3] = &unk_1001C8F10;
  id v50 = v15;
  id v51 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v17 = v51;
  [v12 enumerateObjectsUsingBlock:v49];
  [v16 setObject:v17 forKeyedSubscript:@"mids"];
  id v18 = [v16 copy];

  if (!v18)
  {
LABEL_11:
    uint64_t v30 = _AKLogSystem(isKindOfClass);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_100136E3C(v29, v31, v32, v33, v34, v35, v36, v37);
    }
    id v18 = 0LL;
    v28 = 0LL;
    goto LABEL_14;
  }

  uint64_t v19 = _AKLogSystem(isKindOfClass);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100136E6C(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v18));
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  [v28 setObject:v29 forKeyedSubscript:AKAltDSID];
LABEL_14:

  id v38 = [[AKDeviceListDeltaMessagePayload alloc] initWithResponseBody:v28];
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 serialNumber]);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 serialNumber]);
  unsigned int v42 = [v39 isEqualToString:v41];

  if (v42) {
    -[AKDeviceListController _handleCurrentDeviceTrustStatusChangedWithPayload:]( self,  "_handleCurrentDeviceTrustStatusChangedWithPayload:",  v38);
  }
  -[AKDeviceListController _sendTrustedDeviceListChangeNotification](self, "_sendTrustedDeviceListChangeNotification");
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v44 = [v43 isDeviceListCacheEnableDryMode];

  if (v44 && (!v42 || [v38 operation] != (id)2))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10006205C;
    v47[3] = &unk_1001C6538;
    v47[4] = self;
    id v48 = v4;
    dispatch_async(v46, v47);
  }

LABEL_21:
}

- (BOOL)shouldSuppressPushMessage:(id)a3
{
  return [a3 command] == (id)1200;
}

- (void)_handleCurrentDeviceTrustStatusChangedWithPayload:(id)a3
{
  id v4 = a3;
  accountManager = self->_accountManager;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v6,  0LL));

  id v8 = [v4 operation];
  if (v8 == (id)1)
  {
    -[AKAccountManager clearDeviceRemovalReasonFromAccount:]( self->_accountManager,  "clearDeviceRemovalReasonFromAccount:",  v7);
  }

  else if (v8 == (id)2)
  {
    id v9 = [v4 removalReason];
    if (v9 == (id)-1LL) {
      id v10 = 0LL;
    }
    else {
      id v10 = v9;
    }
    uint64_t v11 = _AKLogSystem(v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      __int16 v28 = 2048;
      id v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Attempting to remove continuation token for account (%@) because (%ld)",  buf,  0x20u);
    }

    -[AKAccountManager setDeviceRemovalReason:onAccount:]( self->_accountManager,  "setDeviceRemovalReason:onAccount:",  v10,  v7);
    uint64_t v13 = self->_accountManager;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7090LL));
    -[AKAccountManager removeContinuationTokenForAccount:telemetryFlowID:error:]( v13,  "removeContinuationTokenForAccount:telemetryFlowID:error:",  v7,  0LL,  v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    LODWORD(v14) = [v15 isDeviceListCacheEnableDryMode];

    if ((_DWORD)v14)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      id v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      v20 = sub_1000622D4;
      uint64_t v21 = &unk_1001C6538;
      uint64_t v22 = self;
      id v23 = v4;
      dispatch_async(v17, &v18);
    }
  }

  -[AKAccountManager saveAccount:error:](self->_accountManager, "saveAccount:error:", v7, 0LL, v18, v19, v20, v21, v22);
}

- (void)_sendTrustedDeviceListChangeNotification
{
  uint64_t v2 = _AKLogSystem(self);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  uint64_t v5 = AKDeviceListChangedNotification;
  if (v4)
  {
    int v7 = 138412290;
    uint64_t v8 = AKDeviceListChangedNotification;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting %@ notification.", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v6 postNotificationName:v5 object:0 userInfo:0 deliverImmediately:1];
}

- (void)_refreshDeviceListForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___AKDeviceListRequester);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
  int v7 = objc_opt_new(&OBJC_CLASS___AKCDPFactory);
  id v9 = -[AKDeviceListRequester initWithStoreManager:cdpFactory:accountManager:client:]( v5,  "initWithStoreManager:cdpFactory:accountManager:client:",  v6,  v7,  self->_accountManager,  0LL);

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
  -[AKDeviceListRequestContext setAltDSID:](v8, "setAltDSID:", v4);

  -[AKDeviceListRequestContext setForceFetch:](v8, "setForceFetch:", 1LL);
  -[AKDeviceListRequestContext setIncludeUntrustedDevices:](v8, "setIncludeUntrustedDevices:", 1LL);
  -[AKDeviceListRequester fetchDeviceListWithContext:completionHandler:]( v9,  "fetchDeviceListWithContext:completionHandler:",  v8,  &stru_1001C8F30);
}

- (void)_clearDeviceListForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___AKDeviceListRequester);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
  int v7 = objc_opt_new(&OBJC_CLASS___AKCDPFactory);
  uint64_t v8 = -[AKDeviceListRequester initWithStoreManager:cdpFactory:accountManager:client:]( v5,  "initWithStoreManager:cdpFactory:accountManager:client:",  v6,  v7,  self->_accountManager,  0LL);

  id v9 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
  -[AKDeviceListRequestContext setAltDSID:](v9, "setAltDSID:", v4);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100062648;
  v11[3] = &unk_1001C78A8;
  v12 = v9;
  id v10 = v9;
  -[AKDeviceListRequester clearDeviceListCacheWithContext:completionHandler:]( v8,  "clearDeviceListCacheWithContext:completionHandler:",  v10,  v11);
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end