@interface AKPostInstallService
+ (id)sharedService;
- (void)_performPostInstallWithCompletion:(id)a3;
- (void)fetchUserInfoForAltDSID:(id)a3 completion:(id)a4;
- (void)start;
@end

@implementation AKPostInstallService

+ (id)sharedService
{
  if (qword_10020F368 != -1) {
    dispatch_once(&qword_10020F368, &stru_1001C7858);
  }
  return (id)qword_10020F360;
}

- (void)start
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "com.apple.ak.postinstall";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for XPC activity: %s...", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002EB0C;
  handler[3] = &unk_1001C7880;
  handler[4] = self;
  xpc_activity_register("com.apple.ak.postinstall", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)_performPostInstallWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = -[AKSatoriController initWithClient:](objc_alloc(&OBJC_CLASS___AKSatoriController), "initWithClient:", 0LL);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10002F094;
  v40[3] = &unk_1001C78A8;
  v7 = v5;
  v41 = v7;
  -[AKSatoriController warmUpVerificationSessionWithCompletionHandler:]( v6,  "warmUpVerificationSessionWithCompletionHandler:",  v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryAuthKitAccount]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSIDForAccount:v9]);
    dispatch_group_enter(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v12 = [v11 isTokenCacheEnabled];

    if (v12)
    {
      uint64_t v14 = _AKLogSystem(v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "AKAppleIDCheckInHelperService attempt token sync after OS upgrade...",  buf,  2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKTokenManager sharedInstance](&OBJC_CLASS___AKTokenManager, "sharedInstance"));
      uint64_t v38 = 0LL;
      [v16 synchronizeTokensForAllAccounts:&v38];

      uint64_t v18 = _AKLogSystem(v17);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "AKAppleIDCheckInHelperService finished token sync after OS upgrade...",  buf,  2u);
      }
    }

    uint64_t v20 = _AKLogSystem(v13);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "AKAppleIDCheckInHelperService attempt performHeartbeatCheckIn after OS upgrade...",  buf,  2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10002F148;
    v35[3] = &unk_1001C6510;
    v35[4] = self;
    id v36 = v10;
    v23 = v7;
    v37 = v23;
    id v24 = v10;
    [v22 performLivenessCheckInForAllEligibleAccountsWithReason:3 completion:v35];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002F214;
    block[3] = &unk_1001C78D0;
    id v34 = v4;
    dispatch_group_notify(v23, v26, block);
  }

  else
  {
    uint64_t v27 = _AKLogSystem(0LL);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Post install activity triggered without IdMS account, skipping liveness update...",  buf,  2u);
    }

    dispatch_queue_global_t v29 = dispatch_get_global_queue(2LL, 0LL);
    v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v29);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10002F228;
    v31[3] = &unk_1001C78D0;
    id v32 = v4;
    dispatch_group_notify(v7, v30, v31);

    id v24 = v32;
  }
}

- (void)fetchUserInfoForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "AKUserInfoController attempt fetchUserInfo after OS upgrade...",  buf,  2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002F330;
  v11[3] = &unk_1001C78F8;
  id v12 = v5;
  id v10 = v5;
  [v9 fetchUserInformationForAltDSID:v6 client:0 completion:v11];
}

@end