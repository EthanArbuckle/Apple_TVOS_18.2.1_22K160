@interface AKAppleIDCheckInHelperService
+ (id)sharedService;
+ (void)_setCheckInAllowedToValue:(BOOL)a3 forAccount:(id)a4;
+ (void)setCheckInAllowedForAllAccountsToValue:(BOOL)a3;
- (AKAppleIDCheckInHelperService)init;
- (BOOL)_validateMachineID:(id)a3;
- (id)_livenessEligibleAccounts;
- (id)_serviceControllerWithProvider:(id)a3;
- (void)_checkInWithIDMSWithAccount:(id)a3 pushToken:(id)a4 event:(id)a5 reason:(unint64_t)a6 completion:(id)a7;
- (void)_clearBirthDayForAltDSID:(id)a3;
- (void)_clearDeviceListCacheForAccount:(id)a3;
- (void)_handleCheckInResponse:(id)a3 data:(id)a4 context:(id)a5 account:(id)a6 error:(id)a7 completion:(id)a8;
- (void)_performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)_performLivenessCheckInForAllEligibleAccountsWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)_sendAttestedOSVersionWithContext:(id)a3 attestationNonce:(id)a4;
- (void)ackWithPayload:(id)a3 account:(id)a4 completion:(id)a5;
- (void)didReceiveNewPublicToken:(id)a3;
- (void)didRespondToMessage:(id)a3 result:(unint64_t)a4 payload:(id)a5;
- (void)didRespondToMessage:(id)a3 withResult:(unint64_t)a4;
- (void)performCheckInForAccount:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)processPushMessage:(id)a3;
- (void)reportFinalSignOutEventForAccount:(id)a3 completion:(id)a4;
- (void)reportSignOutEventForService:(int64_t)a3 account:(id)a4 completion:(id)a5;
- (void)start;
- (void)storeLivenessNonce:(id)a3 nonce:(id)a4;
@end

@implementation AKAppleIDCheckInHelperService

- (AKAppleIDCheckInHelperService)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKAppleIDCheckInHelperService;
  v2 = -[AKAppleIDCheckInHelperService init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("AKCheckInQueue", v6);
    checkInQueue = v2->_checkInQueue;
    v2->_checkInQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[AKStrongDeviceIdentitySigner sharedSigner](&OBJC_CLASS___AKStrongDeviceIdentitySigner, "sharedSigner"));
    strongDeviceIdentitySigner = v2->_strongDeviceIdentitySigner;
    v2->_strongDeviceIdentitySigner = (AKStrongDeviceIdentitySigner *)v9;
  }

  return v2;
}

+ (id)sharedService
{
  if (qword_10020F4B8 != -1) {
    dispatch_once(&qword_10020F4B8, &stru_1001C9818);
  }
  return (id)qword_10020F4B0;
}

+ (void)setCheckInAllowedForAllAccountsToValue:(BOOL)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 allAuthKitAccountsWithError:0]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007A504;
  v7[3] = &unk_1001C9838;
  v7[4] = a1;
  BOOL v8 = a3;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_queue_t v7 = (void *)os_transaction_create("com.apple.authkit.heartbeat-all");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAppleIDPushHelperService sharedService](&OBJC_CLASS___AKAppleIDPushHelperService, "sharedService"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publicAPSTokenString]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007A5FC;
  v12[3] = &unk_1001C7438;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  -[AKAppleIDCheckInHelperService _performLivenessCheckInForAllEligibleAccountsWithToken:reason:completion:]( self,  "_performLivenessCheckInForAllEligibleAccountsWithToken:reason:completion:",  v9,  a3,  v12);
}

- (void)performCheckInForAccount:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)os_transaction_create("com.apple.authkit.liveness-event");
  checkInQueue = (dispatch_queue_s *)self->_checkInQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007A70C;
  v19[3] = &unk_1001C9860;
  v19[4] = self;
  id v20 = v10;
  id v23 = v12;
  unint64_t v24 = a5;
  id v21 = v11;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(checkInQueue, v19);
}

- (void)processPushMessage:(id)a3
{
  id v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v15 serverMachineId]);
  unsigned int v5 = -[AKAppleIDCheckInHelperService _validateMachineID:](self, "_validateMachineID:", v4);

  id v6 = v15;
  if (v5)
  {
    accountManager = self->_accountManager;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v15 altDSID]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v8,  0LL));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v15 messageId]);
      [v10 setObject:v11 forKeyedSubscript:@"txnid"];

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 command]));
      [v10 setObject:v12 forKeyedSubscript:@"cmd"];

      if ([v15 command] == (id)1500)
      {
        +[AKAppleIDCheckInHelperService _setCheckInAllowedToValue:forAccount:]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "_setCheckInAllowedToValue:forAccount:",  0LL,  v9);
      }

      else if ([v15 command] == (id)2200)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 idmsData]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 idmsData]);
          [v10 setObject:v14 forKeyedSubscript:AKIdmsDataKey];
        }
      }

      -[AKAppleIDCheckInHelperService ackWithPayload:account:completion:]( self,  "ackWithPayload:account:completion:",  v10,  v9,  0LL);
    }

    id v6 = v15;
  }
}

- (void)didRespondToMessage:(id)a3 withResult:(unint64_t)a4
{
}

- (void)didRespondToMessage:(id)a3 result:(unint64_t)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 != 2)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 messageId]);

    if (v10)
    {
      id v12 = (id *)&off_1001C7C50;
      id v13 = &off_1001C7C58;
      if (a4) {
        id v13 = &off_1001C7C60;
      }
      if (a4 != 1) {
        id v12 = (id *)v13;
      }
      id v14 = (os_log_s *)*v12;
      accountManager = self->_accountManager;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v16,  0LL));

      if (v17)
      {
        v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v20 = v19;
        if (v9) {
          -[NSMutableDictionary addEntriesFromDictionary:](v19, "addEntriesFromDictionary:", v9);
        }
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 messageId]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, @"txnid");

        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 command]));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, @"cmd");

        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v14, @"action");
        id v23 = -[NSMutableDictionary copy](v20, "copy");
        -[AKAppleIDCheckInHelperService ackWithPayload:account:completion:]( self,  "ackWithPayload:account:completion:",  v23,  v17,  0LL);
      }

      else
      {
        uint64_t v25 = _AKLogSystem(v18);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1001396AC(v8, v26);
        }
      }
    }

    else
    {
      uint64_t v24 = _AKLogSystem(v11);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100139680();
      }
    }
  }
}

- (void)didReceiveNewPublicToken:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = nullsub_5;
  v6[3] = &unk_1001C7300;
  id v7 = (id)os_transaction_create("com.apple.authkit.heartbeat-aps-token");
  id v5 = v7;
  -[AKAppleIDCheckInHelperService _performLivenessCheckInForAllEligibleAccountsWithToken:reason:completion:]( self,  "_performLivenessCheckInForAllEligibleAccountsWithToken:reason:completion:",  v4,  2LL,  v6);
}

- (void)ackWithPayload:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)os_transaction_create("com.apple.authkit.ack");
  checkInQueue = (dispatch_queue_s *)self->_checkInQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007AD40;
  block[3] = &unk_1001C9888;
  id v18 = v8;
  id v19 = v9;
  id v21 = v11;
  id v22 = v10;
  id v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(checkInQueue, block);
}

- (void)start
{
  uint64_t v3 = _AKLogSystem(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "com.apple.ak.hb";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for XPC activity: %s...", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10007B0A4;
  handler[3] = &unk_1001C7880;
  handler[4] = self;
  xpc_activity_register("com.apple.ak.hb", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)reportFinalSignOutEventForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/sign-out",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Reporting global signout to IDMS for %@",  buf,  0xCu);
  }

  id v12 = (void *)os_transaction_create("com.apple.authkit.global-signout-event");
  uint64_t v13 = AKPostDataEventFinalSignOut;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007B474;
  v17[3] = &unk_1001C98B0;
  v17[4] = self;
  id v14 = v6;
  id v18 = v14;
  id v15 = v7;
  id v20 = v15;
  id v16 = v12;
  id v19 = v16;
  -[AKAppleIDCheckInHelperService _checkInWithIDMSWithAccount:pushToken:event:reason:completion:]( self,  "_checkInWithIDMSWithAccount:pushToken:event:reason:completion:",  v14,  0LL,  v13,  0LL,  v17);

  os_activity_scope_leave(&state);
}

- (void)_clearBirthDayForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___AKBirthDayKeychain);
  id v9 = 0LL;
  -[AKBirthDayKeychain deleteBirthdayForAltDSID:error:](v4, "deleteBirthdayForAltDSID:error:", v3, &v9);

  id v5 = v9;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = _AKLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100139760();
    }
  }
}

- (void)reportSignOutEventForService:(int64_t)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/sign-out",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  uint64_t v12 = _AKLogSystem(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v27 = v14;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Reporting signout for service %@ with account %@",  buf,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAccountManager stringRepresentationForService:]( &OBJC_CLASS___AKAccountManager,  "stringRepresentationForService:",  a3));
  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([AKPostDataEventServiceSignOut stringByAppendingString:v15]);
    id v17 = (void *)os_transaction_create("com.apple.authkit.service-signout-event");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10007B94C;
    v22[3] = &unk_1001C6B38;
    id v24 = v9;
    id v18 = v17;
    id v23 = v18;
    -[AKAppleIDCheckInHelperService _checkInWithIDMSWithAccount:pushToken:event:reason:completion:]( self,  "_checkInWithIDMSWithAccount:pushToken:event:reason:completion:",  v8,  0LL,  v16,  0LL,  v22);
  }

  else
  {
    uint64_t v19 = _AKLogSystem(0LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      sub_1001397C0(v21, (uint64_t)buf, v20);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7049LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v16);
  }

  os_activity_scope_leave(&state);
}

+ (void)_setCheckInAllowedToValue:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v5 setAccountProperty:v6 forKey:@"com.apple.ak.checkin-allowed"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v12 = 0LL;
  [v7 saveAccount:v5 error:&v12];

  id v8 = v12;
  if (v8)
  {
    uint64_t v10 = _AKLogSystem(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10013980C();
    }
  }
}

- (void)_performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007BAD8;
  v9[3] = &unk_1001C98D8;
  uint64_t v10 = objc_opt_new(&OBJC_CLASS___AKAccountCleanup);
  uint64_t v11 = self;
  id v12 = v6;
  unint64_t v13 = a3;
  id v7 = v6;
  id v8 = v10;
  -[AKAccountCleanup cleanupStaleAccountsWithCompletion:](v8, "cleanupStaleAccountsWithCompletion:", v9);
}

- (void)_performLivenessCheckInForAllEligibleAccountsWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v23 = a3;
  block = (void (**)(void))a5;
  if (a4 == 1) {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDCheckInHelperService _livenessEligibleAccounts](self, "_livenessEligibleAccounts"));
  }
  else {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager allAuthKitAccountsWithError:]( self->_accountManager,  "allAuthKitAccountsWithError:",  0LL));
  }
  uint64_t v19 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/check-in",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v19, &state);
  if ([v21 count])
  {
    id v8 = dispatch_group_create();
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = v21;
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = AKPostDataEventLiveness;
      do
      {
        unint64_t v13 = 0LL;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v13);
          uint64_t v15 = _AKLogSystem(v9);
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349314;
            unint64_t v33 = a4;
            __int16 v34 = 2112;
            uint64_t v35 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Performing liveness check-in %{public}lu with account: %@",  buf,  0x16u);
          }

          dispatch_group_enter(v8);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_10007BE94;
          v24[3] = &unk_1001C9900;
          unint64_t v26 = a4;
          v24[4] = v14;
          uint64_t v25 = v8;
          -[AKAppleIDCheckInHelperService _checkInWithIDMSWithAccount:pushToken:event:reason:completion:]( self,  "_checkInWithIDMSWithAccount:pushToken:event:reason:completion:",  v14,  v23,  v12,  a4,  v24);

          unint64_t v13 = (char *)v13 + 1;
        }

        while (v10 != v13);
        id v9 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
        id v10 = v9;
      }

      while (v9);
    }

    dispatch_group_notify(v8, (dispatch_queue_t)self->_checkInQueue, block);
  }

  else
  {
    uint64_t v17 = _AKLogSystem(0LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100139870();
    }

    if (block) {
      block[2]();
    }
  }

  os_activity_scope_leave(&state);
}

- (id)_livenessEligibleAccounts
{
  return -[AKAccountManager allAuthKitAccountsWithError:](self->_accountManager, "allAuthKitAccountsWithError:", 0LL);
}

- (void)_checkInWithIDMSWithAccount:(id)a3 pushToken:(id)a4 event:(id)a5 reason:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/check-in",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v16, &state);
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 altDSIDForAccount:v12]);
  -[AKAppleIDAuthenticationContext setAltDSID:](v17, "setAltDSID:", v19);

  id v20 = objc_alloc(&OBJC_CLASS___AKLivenessRequestProvider);
  id v21 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v20,  "initWithContext:urlBagKey:",  v17,  AKURLBagKeyCheckIn);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider]( &OBJC_CLASS___AKFollowUpProviderFactory,  "sharedAuthKitFollowupProvider"));
  -[AKLivenessRequestProvider setFollowUpProvider:](v21, "setFollowUpProvider:", v22);

  -[AKLivenessRequestProvider setPushToken:](v21, "setPushToken:", v13);
  -[AKLivenessRequestProvider setEvent:](v21, "setEvent:", v14);
  -[AKLivenessRequestProvider setLivenessReason:](v21, "setLivenessReason:", a6);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDCheckInHelperService _serviceControllerWithProvider:]( self,  "_serviceControllerWithProvider:",  v21));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10007C1B8;
  v27[3] = &unk_1001C9928;
  id v24 = v12;
  id v28 = v24;
  __int128 v29 = self;
  uint64_t v25 = v17;
  __int128 v30 = v25;
  id v26 = v15;
  id v31 = v26;
  [v23 executeRequestWithCompletion:v27];

  os_activity_scope_leave(&state);
}

- (void)_handleCheckInResponse:(id)a3 data:(id)a4 context:(id)a5 account:(id)a6 error:(id)a7 completion:(id)a8
{
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t, void))a8;
  id v15 = a4;
  uint64_t v16 = _AKLogSystem(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100139994();
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v15,  @"application/xml"));
  uint64_t v20 = _AKLogSystem(v19);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100139934();
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"livenessNonce"]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "aaf_base64Padded"));

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"attestationNonce"]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "aaf_base64Padded"));

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"sendAttestationOSVersion"]);
  unsigned int v27 = [v26 BOOLValue];

  uint64_t v29 = _AKLogSystem(v28);
  __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 138412802;
    v38 = v23;
    __int16 v39 = 2112;
    v40 = v25;
    __int16 v41 = 1024;
    unsigned int v42 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received liveness nonce %@, attestation Nonce %@ sendAttestedOSVersion %d",  (uint8_t *)&v37,  0x1Cu);
  }

  if (v23) {
    -[AKAppleIDCheckInHelperService storeLivenessNonce:nonce:](self, "storeLivenessNonce:nonce:", v13, v23);
  }
  if (v25) {
    unsigned int v31 = v27;
  }
  else {
    unsigned int v31 = 0;
  }
  if (v31 == 1)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  v12,  @"com.apple.authkit.osVersionAttestationReq",  0LL));
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
    [v33 sendEvent:v32];

    uint64_t v35 = _AKLogSystem(v34);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Received IdMS indicator to send attested OS version",  (uint8_t *)&v37,  2u);
    }

    -[AKAppleIDCheckInHelperService _sendAttestedOSVersionWithContext:attestationNonce:]( self,  "_sendAttestedOSVersionWithContext:attestationNonce:",  v12,  v25);
  }

  v14[2](v14, 1LL, 0LL);
}

- (void)storeLivenessNonce:(id)a3 nonce:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  [v7 setNextLivenessNonce:v6 nonce:v5];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v13 = 0LL;
  [v8 saveAccount:v6 error:&v13];

  uint64_t v9 = v13;
  if (v9)
  {
    uint64_t v11 = _AKLogSystem(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_1001399C0();
    }
  }

- (void)_sendAttestedOSVersionWithContext:(id)a3 attestationNonce:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKSignpostLogSystem(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _AKSignpostCreate();
  uint64_t v12 = v11;

  uint64_t v14 = _AKSignpostLogSystem(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "OSVersionAttestation",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v18 = _AKSignpostLogSystem(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: OSVersionAttestation  enableTelemetry=YES ",  buf,  0xCu);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  v6,  @"com.apple.authkit.sendAttestedOSVersion",  0LL));
  strongDeviceIdentitySigner = self->_strongDeviceIdentitySigner;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10007C7D8;
  v25[3] = &unk_1001C9978;
  id v26 = v6;
  id v27 = v7;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  id v28 = v20;
  id v22 = v20;
  id v23 = v7;
  id v24 = v6;
  -[AKStrongDeviceIdentitySigner attestationDataForOSVersionWithContext:attestationNonce:completion:]( strongDeviceIdentitySigner,  "attestationDataForOSVersionWithContext:attestationNonce:completion:",  v24,  v23,  v25);
}

- (id)_serviceControllerWithProvider:(id)a3
{
  id v3 = a3;
  BOOL v4 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v3);

  return v4;
}

- (BOOL)_validateMachineID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___AKAnisetteProvisioningController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anisetteDataWithError:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 machineID]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 machineID]);
    unsigned __int8 v8 = [v7 isEqualToString:v3];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)_clearDeviceListCacheForAccount:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSIDForAccount:v3]);
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___AKDeviceListRequester);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
    unsigned __int8 v8 = objc_opt_new(&OBJC_CLASS___AKCDPFactory);
    uint64_t v9 = -[AKDeviceListRequester initWithStoreManager:cdpFactory:accountManager:client:]( v6,  "initWithStoreManager:cdpFactory:accountManager:client:",  v7,  v8,  v4,  0LL);

    os_signpost_id_t v10 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
    -[AKDeviceListRequestContext setAltDSID:](v10, "setAltDSID:", v5);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10007CF64;
    v13[3] = &unk_1001C78A8;
    uint64_t v14 = v10;
    uint64_t v11 = v10;
    -[AKDeviceListRequester clearDeviceListCacheWithContext:completionHandler:]( v9,  "clearDeviceListCacheWithContext:completionHandler:",  v11,  v13);
  }

  else
  {
    uint64_t v12 = _AKLogSystem(0LL);
    uint64_t v9 = (AKDeviceListRequester *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Clear device list cache failed. Missing altDSID for account - %@",  buf,  0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

@end