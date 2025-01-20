@interface MSDAccountManagerHelper
- (ACAccount)iCloudAccount;
- (ACAccount)iTunesAccount;
- (ACAccountStore)accountStore;
- (AIDAServiceOwnersManager)serviceOwnersManager;
- (BOOL)_isAllowListedAccount:(id)a3 withAuthResults:(id)a4;
- (BOOL)createTvUserProfileWithError:(id *)a3;
- (BOOL)forceiCloudKeychainToSyncWithServerAndError:(id *)a3;
- (BOOL)performiCloudAccountSignInWithContext:(id)a3 outError:(id *)a4;
- (BOOL)performiCloudAccountSignOutWithContext:(id)a3 outError:(id *)a4;
- (BOOL)performiTunesAccountSignInWithContext:(id)a3 outError:(id *)a4;
- (BOOL)performiTunesAccountSignOutWithContext:(id)a3 outError:(id *)a4;
- (CDPContext)cdpContext;
- (MSDAccountManagerHelper)init;
- (id)_createTempAppleAccountFromAuthResults:(id)a3;
- (id)fetchiTunesiCloudAccountsInfo;
- (id)generateiCloudAccountRecoveryKeyWithError:(id *)a3;
- (void)_acceptiCloudTermsWithAuthResults:(id)a3 completionHandler:(id)a4;
- (void)_authenticateAccountWithContext:(id)a3 forService:(int64_t)a4 completionHandler:(id)a5;
- (void)_configureiCloudAccountFeatures:(id)a3 completionHandler:(id)a4;
- (void)_createTvUserProfileWithCompletion:(id)a3;
- (void)_forceIDSToSyncWithServer;
- (void)_forceiCloudKeychainToSyncWithServerAndCompletion:(id)a3;
- (void)_markiCloudAccountAsManagedAccount:(BOOL)a3 completionHandler:(id)a4;
- (void)_signInToAppleIDWithContext:(id)a3 forServices:(id)a4 usingAuthResults:(id)a5 completionHandler:(id)a6;
- (void)_signOutAppleIDForServices:(id)a3 completionHandler:(id)a4;
- (void)_waitForIDSOperationToQuiesceForAccount:(id)a3 forSignOut:(BOOL)a4;
- (void)setAccountStore:(id)a3;
- (void)setCdpContext:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5;
@end

@implementation MSDAccountManagerHelper

- (MSDAccountManagerHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDAccountManagerHelper;
  v2 = -[MSDAccountManagerHelper init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    -[MSDAccountManagerHelper setAccountStore:](v2, "setAccountStore:", v3);

    v4 = objc_alloc(&OBJC_CLASS___AIDAServiceOwnersManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](v2, "accountStore"));
    v6 = -[AIDAServiceOwnersManager initWithAccountStore:](v4, "initWithAccountStore:", v5);
    -[MSDAccountManagerHelper setServiceOwnersManager:](v2, "setServiceOwnersManager:", v6);
  }

  return v2;
}

- (ACAccount)iCloudAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountForService:AIDAServiceTypeCloud]);

  return (ACAccount *)v3;
}

- (ACAccount)iTunesAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountForService:AIDAServiceTypeStore]);

  return (ACAccount *)v3;
}

- (id)fetchiTunesiCloudAccountsInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  if (!v4) {
    goto LABEL_10;
  }
  id v5 = -[MSDCDPStateController initForPrimaryiCloudAccount]( objc_alloc(&OBJC_CLASS___MSDCDPStateController),  "initForPrimaryiCloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  [v3 setObject:v6 forKey:@"iCloud"];

  if (![v5 isCDPEnabled])
  {
    v10 = &off_1001063D8;
LABEL_6:
    [v3 setObject:v10 forKey:@"iCloudCDPState"];
    goto LABEL_7;
  }

  id v16 = 0LL;
  unsigned int v7 = [v5 isRecoveryKeyAvailable:&v16];
  id v8 = v16;
  if (!v8)
  {
    if (v7) {
      v10 = &off_1001063A8;
    }
    else {
      v10 = &off_1001063C0;
    }
    goto LABEL_6;
  }

  v9 = v8;
  [v3 setObject:&off_100106390 forKey:@"iCloudCDPState"];

LABEL_7:
LABEL_10:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iTunesAccount](self, "iTunesAccount"));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
    [v3 setObject:v13 forKey:@"iTunes"];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v3));

  return v14;
}

- (BOOL)performiCloudAccountSignInWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_1000192A8;
  v58 = sub_1000192B8;
  dispatch_semaphore_t v59 = dispatch_semaphore_create(0LL);
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_1000192A8;
  v52 = sub_1000192B8;
  id v53 = 0LL;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = sub_1000192A8;
  v46 = sub_1000192B8;
  id v47 = 0LL;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000192C0;
  v41[3] = &unk_1000F9790;
  v41[4] = &v48;
  v41[5] = &v42;
  v41[6] = &v54;
  -[MSDAccountManagerHelper _authenticateAccountWithContext:forService:completionHandler:]( self,  "_authenticateAccountWithContext:forService:completionHandler:",  v6,  1LL,  v41);
  unsigned int v7 = (dispatch_semaphore_s *)v55[5];
  dispatch_time_t v8 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    id v30 = sub_10003A95C();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100092B40();
    }

    sub_100087650( a4,  3727741043LL,  (uint64_t)@"Failed to authenticate account with server.",  (uint64_t)@"Operation timed out");
    v14 = 0LL;
    v10 = 0LL;
    goto LABEL_36;
  }

  v9 = (void *)v43[5];
  if (v9)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    sub_100087650(a4, 3727741043LL, (uint64_t)@"Failed to authenticate account with server.", (uint64_t)v27);
    v14 = 0LL;
    v10 = 0LL;
    goto LABEL_18;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  AIDAServiceTypeCloud));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 features]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"com.apple.mobilestoredemo.FaceTime"]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 features]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"com.apple.mobilestoredemo.iMessage"]);

  uint64_t v15 = v49[5];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100019350;
  v40[3] = &unk_1000F9328;
  v40[4] = &v42;
  v40[5] = &v54;
  -[MSDAccountManagerHelper _signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:]( self,  "_signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:",  v6,  v10,  v15,  v40);
  id v16 = (dispatch_semaphore_s *)v55[5];
  dispatch_time_t v17 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v16, v17))
  {
    id v32 = sub_10003A95C();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v34 = 3727741046LL;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100092B14();
    }
    v35 = @"Failed to sign in account service.";
    goto LABEL_35;
  }

  v18 = (void *)v43[5];
  if (!v18) {
    goto LABEL_14;
  }
  if (!objc_msgSend(v18, "aa_isAASignInErrorWithCode:", -8010))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v43[5] localizedDescription]);
    sub_100087650(a4, 3727741046LL, (uint64_t)@"Failed to sign in account service.", (uint64_t)v27);
LABEL_18:
    BOOL v28 = 0;
    goto LABEL_19;
  }

  uint64_t v19 = v49[5];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000193A4;
  v39[3] = &unk_1000F9328;
  v39[4] = &v42;
  v39[5] = &v54;
  -[MSDAccountManagerHelper _acceptiCloudTermsWithAuthResults:completionHandler:]( self,  "_acceptiCloudTermsWithAuthResults:completionHandler:",  v19,  v39);
  v20 = (dispatch_semaphore_s *)v55[5];
  dispatch_time_t v21 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v20, v21))
  {
    id v37 = sub_10003A95C();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    uint64_t v34 = 3727741048LL;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100092B14();
    }
    v35 = @"Failed to accept account terms.";
    goto LABEL_35;
  }

  v22 = (void *)v43[5];
  if (v22)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v22 localizedDescription]);
    sub_100087650(a4, 3727741048LL, (uint64_t)@"Failed to accept account terms.", (uint64_t)v27);
    goto LABEL_18;
  }

- (BOOL)performiTunesAccountSignInWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_1000192A8;
  uint64_t v42 = sub_1000192B8;
  dispatch_semaphore_t v43 = dispatch_semaphore_create(0LL);
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_1000192A8;
  id v36 = sub_1000192B8;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_1000192A8;
  id v30 = sub_1000192B8;
  id v31 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000197FC;
  v25[3] = &unk_1000F9790;
  v25[4] = &v32;
  v25[5] = &v26;
  v25[6] = &v38;
  -[MSDAccountManagerHelper _authenticateAccountWithContext:forService:completionHandler:]( self,  "_authenticateAccountWithContext:forService:completionHandler:",  v6,  2LL,  v25);
  unsigned int v7 = (dispatch_semaphore_s *)v39[5];
  dispatch_time_t v8 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    id v18 = sub_10003A95C();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = 3727741043LL;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100092B40();
    }
    dispatch_time_t v21 = @"Failed to authenticate account with server.";
    goto LABEL_14;
  }

  v9 = (void *)v27[5];
  if (v9)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    sub_100087650(a4, 3727741043LL, (uint64_t)@"Failed to authenticate account with server.", (uint64_t)v22);
LABEL_16:

    goto LABEL_17;
  }

  uint64_t v44 = AIDAServiceTypeStore;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  uint64_t v11 = v33[5];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001988C;
  v24[3] = &unk_1000F9328;
  v24[4] = &v26;
  v24[5] = &v38;
  -[MSDAccountManagerHelper _signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:]( self,  "_signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:",  v6,  v10,  v11,  v24);

  v12 = (dispatch_semaphore_s *)v39[5];
  dispatch_time_t v13 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v12, v13))
  {
    id v23 = sub_10003A95C();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100092B6C();
    }
    uint64_t v20 = 3727741046LL;
    dispatch_time_t v21 = @"Failed to sign in account service.";
LABEL_14:

    sub_100087650(a4, v20, (uint64_t)v21, (uint64_t)@"Operation timed out");
LABEL_17:
    uint64_t v15 = 0LL;
    BOOL v16 = 0;
    goto LABEL_6;
  }

  v14 = (void *)v27[5];
  if (v14)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
    sub_100087650(a4, 3727741046LL, (uint64_t)@"Failed to sign in account service.", (uint64_t)v22);
    goto LABEL_16;
  }

  uint64_t v15 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.MobileStore");
  -[NSUserDefaults setBool:forKey:](v15, "setBool:forKey:", 1LL, @"SKUIFamilySetupDisplayed");
  -[NSUserDefaults synchronize](v15, "synchronize");
  BOOL v16 = 1;
LABEL_6:
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v16;
}

- (BOOL)performiCloudAccountSignOutWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);

  uint64_t v24 = 0LL;
  dispatch_time_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_1000192A8;
  uint64_t v28 = sub_1000192B8;
  dispatch_semaphore_t v29 = dispatch_semaphore_create(0LL);
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  dispatch_time_t v21 = sub_1000192A8;
  v22 = sub_1000192B8;
  id v23 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100019B00;
  v17[3] = &unk_1000F9328;
  v17[4] = &v18;
  v17[5] = &v24;
  -[MSDAccountManagerHelper _signOutAppleIDForServices:completionHandler:]( self,  "_signOutAppleIDForServices:completionHandler:",  0LL,  v17);
  v9 = (dispatch_semaphore_s *)v25[5];
  dispatch_time_t v10 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    id v14 = sub_10003A95C();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100092B98();
    }

    sub_100087650( a4,  3727741047LL,  (uint64_t)@"Failed to sign out account service.",  (uint64_t)@"Operation timed out");
    goto LABEL_9;
  }

  uint64_t v11 = (void *)v19[5];
  if (v11)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
    sub_100087650(a4, 3727741047LL, (uint64_t)@"Failed to sign out account service.", (uint64_t)v16);

LABEL_9:
    BOOL v12 = 0;
    goto LABEL_4;
  }

  BOOL v12 = 1;
  -[MSDAccountManagerHelper _waitForIDSOperationToQuiesceForAccount:forSignOut:]( self,  "_waitForIDSOperationToQuiesceForAccount:forSignOut:",  v8,  1LL);
LABEL_4:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (BOOL)performiTunesAccountSignOutWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  dispatch_time_t v25 = sub_1000192A8;
  uint64_t v26 = sub_1000192B8;
  dispatch_semaphore_t v27 = dispatch_semaphore_create(0LL);
  uint64_t v16 = 0LL;
  dispatch_time_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_1000192A8;
  uint64_t v20 = sub_1000192B8;
  id v21 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100019D38;
  v15[3] = &unk_1000F9328;
  v15[4] = &v16;
  v15[5] = &v22;
  -[MSDAccountManagerHelper _signOutAppleIDForServices:completionHandler:]( self,  "_signOutAppleIDForServices:completionHandler:",  0LL,  v15);
  unsigned int v7 = (dispatch_semaphore_s *)v23[5];
  dispatch_time_t v8 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    id v12 = sub_10003A95C();
    dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100092BC4();
    }

    sub_100087650( a4,  3727741047LL,  (uint64_t)@"Failed to sign out account service.",  (uint64_t)@"Operation timed out");
    goto LABEL_9;
  }

  v9 = (void *)v17[5];
  if (v9)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    sub_100087650(a4, 3727741047LL, (uint64_t)@"Failed to sign out account service.", (uint64_t)v14);

LABEL_9:
    BOOL v10 = 0;
    goto LABEL_4;
  }

  BOOL v10 = 1;
LABEL_4:
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

- (id)generateiCloudAccountRecoveryKeyWithError:(id *)a3
{
  id v4 = -[MSDCDPStateController initForPrimaryiCloudAccount]( objc_alloc(&OBJC_CLASS___MSDCDPStateController),  "initForPrimaryiCloudAccount");
  id v5 = v4;
  if (!v4)
  {
    id v12 = sub_10003A95C();
    dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100092BF0();
    }

    sub_100087610(a3, 3727741051LL, (uint64_t)@"Failed to setup recovery key for iCloud account.");
    goto LABEL_11;
  }

  if ([v4 isRecoveryKeyAvailable:0])
  {
    id v6 = sub_10003A95C();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "iCloud account already has recovery key created before!",  buf,  2u);
    }
  }

  id v15 = 0LL;
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 generateRecoveryKeyWithError:&v15]);
  id v9 = v15;
  if (v9)
  {
    BOOL v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    sub_100087650(a3, 3727741051LL, (uint64_t)@"Failed to setup recovery key for iCloud account.", (uint64_t)v11);

LABEL_11:
    dispatch_time_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)forceiCloudKeychainToSyncWithServerAndError:(id *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1000192A8;
  uint64_t v24 = sub_1000192B8;
  id v25 = 0LL;
  -[MSDAccountManagerHelper _forceIDSToSyncWithServer](self, "_forceIDSToSyncWithServer");
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_10001A084;
  dispatch_time_t v17 = &unk_1000F97B8;
  uint64_t v19 = &v20;
  id v6 = v5;
  uint64_t v18 = v6;
  -[MSDAccountManagerHelper _forceiCloudKeychainToSyncWithServerAndCompletion:]( self,  "_forceiCloudKeychainToSyncWithServerAndCompletion:",  &v14);
  dispatch_time_t v7 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100092C1C();
    }

    sub_100087650( a3,  3727741050LL,  (uint64_t)@"Failed to synchronize account data with server.",  (uint64_t)@"Operation timed out");
  }

  else
  {
    BOOL v10 = (void *)v21[5];
    if (!v10)
    {
      BOOL v12 = 1;
      goto LABEL_8;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription", v14, v15, v16, v17));
    sub_100087650(a3, 3727741050LL, (uint64_t)@"Failed to synchronize account data with server.", (uint64_t)v11);
  }

  BOOL v12 = 0;
LABEL_8:

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (BOOL)createTvUserProfileWithError:(id *)a3
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1000192A8;
  uint64_t v24 = sub_1000192B8;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0LL);
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  dispatch_time_t v17 = sub_1000192A8;
  uint64_t v18 = sub_1000192B8;
  id v19 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001A2A4;
  v13[3] = &unk_1000F9328;
  v13[4] = &v14;
  v13[5] = &v20;
  -[MSDAccountManagerHelper _createTvUserProfileWithCompletion:](self, "_createTvUserProfileWithCompletion:", v13);
  dispatch_semaphore_t v5 = (dispatch_semaphore_s *)v21[5];
  dispatch_time_t v6 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v10 = sub_10003A95C();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100092C48();
    }

    sub_100087650( a3,  3727741052LL,  (uint64_t)@"Failed to setup user profile on Apple TV.",  (uint64_t)@"Operation timed out");
    goto LABEL_9;
  }

  dispatch_time_t v7 = (void *)v15[5];
  if (v7)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
    sub_100087650(a3, 3727741052LL, (uint64_t)@"Failed to setup user profile on Apple TV.", (uint64_t)v12);

LABEL_9:
    BOOL v8 = 0;
    goto LABEL_4;
  }

  BOOL v8 = 1;
LABEL_4:
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v8;
}

- (void)_authenticateAccountWithContext:(id)a3 forService:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 password]);
  id v12 = sub_10003A95C();
  dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    int64_t v24 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Authenticating account: %{public}@ for service: %ld",  buf,  0x16u);
  }

  if (v9)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
    [v14 setUsername:v10];
    [v14 setIsUsernameEditable:0];
    [v14 _setPassword:v11];
    [v14 setServiceType:a4];
    [v14 setAuthenticationType:0];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 recoveryKey]);
    [v14 _setMasterKey:v15];

    id v16 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001A4F8;
    v17[3] = &unk_1000F97E0;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v20 = v9;
    [v16 authenticateWithContext:v14 completion:v17];
  }
}

- (void)_signInToAppleIDWithContext:(id)a3 forServices:(id)a4 usingAuthResults:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v28 = 0LL;
  dispatch_semaphore_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1000192A8;
  uint64_t v32 = sub_1000192B8;
  id v33 = 0LL;
  id v14 = sub_10003A95C();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Signing in to Apple ID for services: %{public}@",  buf,  0xCu);
  }

  if (v13)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___MSDCDPFakeUIProvider);
    dispatch_time_t v17 = (void *)v29[5];
    v29[5] = (uint64_t)v16;

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 localSecret]);
    [(id)v29[5] setLocalSecret:v18];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 recoveryKey]);
    [(id)v29[5] setRecoveryKey:v19];

    id v20 = objc_alloc_init(&OBJC_CLASS___AIDAMutableServiceContext);
    [v20 setAuthenticationResults:v12];
    [v20 setCdpUiProvider:v29[5]];
    id v21 = -[CDPContext initWithAuthenticationResults:]( objc_alloc(&OBJC_CLASS___CDPContext),  "initWithAuthenticationResults:",  v12);
    -[MSDAccountManagerHelper setCdpContext:](self, "setCdpContext:", v21);

    if ([v10 resetCDP])
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper cdpContext](self, "cdpContext"));
      objc_msgSend(v22, "set_forceReset:", 1);
    }

    uint64_t v34 = AIDAServiceTypeCloud;
    v35 = self;
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    [v20 setSignInContexts:v23];

    int64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10001A980;
    v25[3] = &unk_1000F9808;
    id v26 = v13;
    dispatch_semaphore_t v27 = &v28;
    [v24 signInToServices:v11 usingContext:v20 completion:v25];
  }

  _Block_object_dispose(&v28, 8);
}

- (id)_createTempAppleAccountFromAuthResults:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = objc_alloc(&OBJC_CLASS___ACAccount);
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](self, "accountStore"));
  dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_appleAccountType"));
  id v8 = -[ACAccount initWithAccountType:](v5, "initWithAccountType:", v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKAuthenticationUsernameKey]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKAuthenticationDSIDKey]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);

  -[ACAccount setUsername:](v8, "setUsername:", v9);
  -[ACAccount setAccountProperty:forKey:](v8, "setAccountProperty:forKey:", v11, @"personID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKAuthenticationRawPasswordKey]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountCredential credentialWithPassword:]( &OBJC_CLASS___ACAccountCredential,  "credentialWithPassword:",  v12));
  -[ACAccount setCredential:](v8, "setCredential:", v14);
  -[ACAccount _aa_setRawPassword:](v8, "_aa_setRawPassword:", v13);

  return v8;
}

- (void)_acceptiCloudTermsWithAuthResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  AATermsEntryDevice,  AATermsEntryWarranty,  AATermsEntryPrivacy,  AATermsEntryiCloud,  AATermsEntryiTunes,  AATermsEntryGameCenter,  0LL));
  id v9 = sub_10003A95C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accepting iCloud terms...", buf, 2u);
  }

  if (v7)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[MSDAccountManagerHelper _createTempAppleAccountFromAuthResults:]( self,  "_createTempAppleAccountFromAuthResults:",  v6));
    if (v11)
    {
      id v12 = (void *)v11;
      id v13 = [[AAiCloudTermsStringRequest alloc] initWithAccount:v11 termsEntries:v8 preferPassword:1];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10001AEB4;
      v17[3] = &unk_1000F9858;
      id v18 = v12;
      id v19 = v7;
      id v14 = v12;
      [v13 performRequestWithHandler:v17];
    }

    else
    {
      id v15 = sub_10003A95C();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100092D58();
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744768LL,  @"An error has occurred."));
      (*((void (**)(id, id))v7 + 2))(v7, v13);
    }
  }
}

- (void)_signOutAppleIDForServices:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    id v25 = v6;
    uint64_t v11 = "Signing out Apple ID for services: %{public}@";
    id v12 = v9;
    uint32_t v13 = 12;
  }

  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Signing out Apple ID for ALL services.";
    id v12 = v9;
    uint32_t v13 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_7:

  if (v7)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___AIDAMutableServiceContext);
    uint64_t v22 = AIDAServiceTypeCloud;
    __int16 v23 = self;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    [v14 setSignOutContexts:v15];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
    if (v6)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10001B338;
      v20[3] = &unk_1000F9880;
      dispatch_time_t v17 = &v21;
      id v21 = v7;
      [v16 signOutOfServices:v6 usingContext:v14 completion:v20];
    }

    else
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10001B4F0;
      v18[3] = &unk_1000F98A8;
      dispatch_time_t v17 = &v19;
      id v19 = v7;
      [v16 signOutOfAllServicesUsingContext:v14 completion:v18];
    }
  }
}

- (void)_markiCloudAccountAsManagedAccount:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting managed account state for iCloud account to: %{BOOL}d",  buf,  8u);
  }

  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v9)
    {
      BOOL v10 = v9;
      if (v4) {
        uint64_t v11 = @"DeKOTA";
      }
      else {
        uint64_t v11 = 0LL;
      }
      [v9 setObject:v11 forKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](self, "accountStore"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10001B778;
      v15[3] = &unk_1000F98A8;
      id v16 = v6;
      [v14 saveAccount:v10 withCompletionHandler:v15];
    }

    else
    {
      id v12 = sub_10003A95C();
      uint32_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No iCloud account found on device.",  buf,  2u);
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)_configureiCloudAccountFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v47 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Configuring iCloud account features: %{public}@",  buf,  0xCu);
  }

  if (v7)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      if (v6 && [v6 count])
      {
        uint64_t v34 = self;
        v35 = v7;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v36 = v6;
        id v12 = v6;
        id v13 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (!v13) {
          goto LABEL_27;
        }
        id v14 = v13;
        uint64_t v15 = *(void *)v42;
        uint64_t v16 = ACAccountDataclassSiri;
        while (1)
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v12);
            }
            BOOL v18 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v18, v34));
            unsigned int v20 = [v19 BOOLValue];
            id v21 = sub_10003A95C();
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v20)
            {
              if (!v23) {
                goto LABEL_18;
              }
              *(_DWORD *)buf = 138543362;
              id v47 = v18;
              int64_t v24 = v22;
              id v25 = ">> Enabling iCloud account feature: %{public}@";
            }

            else
            {
              if (!v23) {
                goto LABEL_18;
              }
              *(_DWORD *)buf = 138543362;
              id v47 = v18;
              int64_t v24 = v22;
              id v25 = ">> Disabling iCloud account feature: %{public}@";
            }

            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
LABEL_18:

            if ([v11 isProvisionedForDataclass:v18])
            {
              if ([v18 isEqualToString:v16])
              {
                id v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
                objc_msgSend(v26, "setCloudSyncEnabled:", objc_msgSend(v19, "BOOLValue"));
              }

              objc_msgSend(v11, "setEnabled:forDataclass:", objc_msgSend(v19, "BOOLValue"), v18);
            }

            else
            {
              id v27 = sub_10003A95C();
              uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                sub_100092FDC(&v39, v40, v28);
              }
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (!v14)
          {
LABEL_27:

            dispatch_semaphore_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](v34, "accountStore"));
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472LL;
            v37[2] = sub_10001BC08;
            v37[3] = &unk_1000F98A8;
            id v7 = v35;
            id v38 = v35;
            [v29 saveAccount:v11 withCompletionHandler:v37];

            id v6 = v36;
            goto LABEL_34;
          }
        }
      }

      id v30 = sub_10003A95C();
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "No iCloud account features provided. Skip configuring anything!",  buf,  2u);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }

    else
    {
      id v32 = sub_10003A95C();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100092FB0();
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744768LL,  @"An error has occurred."));
      (*((void (**)(id, void *))v7 + 2))(v7, v11);
    }

- (void)_createTvUserProfileWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating new user profile on TV...", buf, 2u);
  }

  if (v4)
  {
    id v7 = [[PBSIgnoreUserProfileAccountNotificationsAssertion alloc] initWithIdentifier:@"com.apple.MobileStoreDemo.create-default-user"];
    [v7 acquire];
    id v8 = objc_alloc_init(&OBJC_CLASS___PBSCreateUserProfileAttributes);
    [v8 setType:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSIDForAccount:v9 service:AIDAServiceTypeCloud]);

      if (v11 && [v11 length])
      {
        [v8 setICloudAltDSID:v11];
        int v12 = 1;
      }

      else
      {
        int v12 = 0;
      }
    }

    else
    {
      int v12 = 0;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iTunesAccount](self, "iTunesAccount"));
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 altDSIDForAccount:v13 service:AIDAServiceTypeStore]);

      if (v15 && [v15 length])
      {
        [v8 setITunesAltDSID:v15];

LABEL_16:
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10001BF40;
        v20[3] = &unk_1000F98D0;
        id v21 = v7;
        id v22 = v4;
        id v17 = v7;
        [v16 createUserProfileWithAttributes:v8 completionHandler:v20];

LABEL_21:
        goto LABEL_22;
      }

      if ((v12 & 1) != 0) {
        goto LABEL_16;
      }
    }

    else if (v12)
    {
      goto LABEL_16;
    }

    id v18 = sub_10003A95C();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No active account found. Skip creating user profile.",  buf,  2u);
    }

    [v7 relinquish];
    goto LABEL_21;
  }

- (void)_waitForIDSOperationToQuiesceForAccount:(id)a3 forSignOut:(BOOL)a4
{
  BOOL v4 = a4;
  id v46 = a3;
  id v5 = @"registration";
  BOOL v44 = v4;
  if (v4) {
    id v5 = @"deregistration";
  }
  id v6 = v5;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v56 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Wait for IDS %{public}@ to quiesce...",  buf,  0xCu);
  }

  if (v46)
  {
    id v9 = [[IDSAccountController alloc] initWithService:@"com.apple.private.alloy.mobilestoredemo.icloud"];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v43 = (uint64_t)v6;
      uint64_t v11 = 0LL;
      int v12 = 0LL;
      double v13 = 0.0;
      while (1)
      {
        id v14 = v11;
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 accounts]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

        id v16 = sub_10003A95C();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v56 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Found IDS accounts: %{public}@",  buf,  0xCu);
        }

        if (v44)
        {
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id v18 = v15;
          id v19 = -[__CFString countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
          if (!v19)
          {
LABEL_19:

            int v23 = 1;
            goto LABEL_31;
          }

          id v20 = v19;
          uint64_t v21 = *(void *)v52;
LABEL_13:
          uint64_t v22 = 0LL;
          while (1)
          {
            if (*(void *)v52 != v21) {
              objc_enumerationMutation(v18);
            }
            if (v20 == (id)++v22)
            {
              id v20 = -[__CFString countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
              if (v20) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }
        }

        else
        {
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          int64_t v24 = v15;
          id v25 = -[__CFString countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v47,  v59,  16LL);
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v48;
            v45 = v12;
            while (2)
            {
              uint64_t v28 = v11;
              dispatch_semaphore_t v29 = v10;
              for (i = 0LL; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v48 != v27) {
                  objc_enumerationMutation(v24);
                }
                id v31 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
                if ([v31 isActive])
                {
                  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 loginID]);
                  unsigned int v33 = [v32 isEqualToString:v46];

                  if (v33)
                  {

                    int v23 = 1;
                    uint64_t v10 = v29;
                    uint64_t v11 = v28;
                    int v12 = v45;
                    goto LABEL_31;
                  }
                }
              }

              id v26 = -[__CFString countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v47,  v59,  16LL);
              uint64_t v10 = v29;
              uint64_t v11 = v28;
              int v12 = v45;
              if (v26) {
                continue;
              }
              break;
            }
          }
        }

        sleep(5u);
        int v23 = 0;
LABEL_31:
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

        [v34 timeIntervalSinceDate:v11];
        double v13 = v13 + v35;

        if ((v23 & 1) == 0)
        {
          int v12 = v34;
          if (v13 < 60.0) {
            continue;
          }
        }

        id v36 = sub_10003A95C();
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        id v38 = v37;
        if (v23)
        {
          id v6 = (__CFString *)v43;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v56 = (__CFString *)v43;
            __int16 v57 = 2048;
            double v58 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "IDS %{public}@ finished after %f seconds.",  buf,  0x16u);
          }
        }

        else
        {
          id v6 = (__CFString *)v43;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_10009318C(v43, v38, v13);
          }
        }

        goto LABEL_43;
      }
    }

    id v40 = sub_10003A95C();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_100093118((os_log_s *)v10, v41, v42);
    }
  }

  else
  {
    id v39 = sub_10003A95C();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "No iCloud account signed in on device!",  buf,  2u);
    }
  }

- (void)_forceiCloudKeychainToSyncWithServerAndCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  int64_t v24 = sub_1000192A8;
  id v25 = sub_1000192B8;
  id v26 = 0LL;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Forcing iCloud keychain to sync with server...",  buf,  2u);
  }

  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v7)
    {
      id v20 = 0LL;
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v20));
      id v9 = v20;
      uint64_t v10 = (void *)v22[5];
      v22[5] = v8;

      if (v9)
      {
        id v11 = sub_10003A95C();
        int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
          sub_100093208(v13, (uint64_t)buf, v12);
        }

        v4[2](v4, v9);
      }

      else
      {
        id v16 = (void *)v22[5];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10001C70C;
        v17[3] = &unk_1000F98F8;
        id v18 = v4;
        id v19 = &v21;
        [v16 rpcFetchAndProcessChanges:0 reply:v17];

        id v9 = 0LL;
      }
    }

    else
    {
      id v14 = sub_10003A95C();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No iCloud account signed in on device!",  buf,  2u);
      }

      v4[2](v4, 0LL);
      id v9 = 0LL;
      id v7 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
    id v7 = 0LL;
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_forceIDSToSyncWithServer
{
  id v3 = sub_10003A95C();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing IDS to sync with server...", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  if (v5)
  {
    id v6 = (os_log_s *)[[IDSAccountController alloc] initWithService:@"com.apple.private.alloy.multiplex1"];
    if (v6)
    {
      id v7 = v6;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s enabledAccounts](v6, "enabledAccounts"));
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
            id v14 = sub_10003A95C();
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v23 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Kicking IDS account: %{public}@",  buf,  0xCu);
            }

            IDSKickGetDependent(v13);
          }

          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }

        while (v10);
      }

      sleep(0xAu);
    }

    else
    {
      id v17 = sub_10003A95C();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000932D4();
      }
    }
  }

  else
  {
    id v16 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No iCloud account signed in on device!",  buf,  2u);
    }
  }
}

- (BOOL)_isAllowListedAccount:(id)a3 withAuthResults:(id)a4
{
  id v5 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKey:AKAuthenticationDemoAccountKey]);
  if (!v7
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    || ![v7 BOOLValue])
  {
    id v12 = sub_10003A95C();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No 'demo account' flag set in IdMS auth response!",  buf,  2u);
    }

    id v32 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"chnl_internal_[0-9]{1,2}@icloud.com",  1LL,  &v32));
    id v15 = v32;
    if (!v14)
    {
      id v24 = sub_10003A95C();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100093364();
      }
      goto LABEL_44;
    }

    if (!objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
      && v16 == [v5 length])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "substringWithRange:",  objc_msgSend(@"chnl_internal_", "length"),  (_BYTE *)objc_msgSend(v5, "rangeOfString:", @"@icloud.com")
                      - (_BYTE *)[@"chnl_internal_" length]));
      if ((uint64_t)[v17 integerValue] >= 1 && (uint64_t)objc_msgSend(v17, "integerValue") < 21)
      {
        BOOL v11 = 1;
LABEL_31:

        goto LABEL_32;
      }
    }

    id v31 = v15;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(ars|channel|dekota)[0-9]+\\.[0-9]+@(icloud|me|mac)\\.com",  1LL,  &v31));
    id v10 = v31;

    if (v18)
    {
      if (!objc_msgSend(v18, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
        && v19 == [v5 length])
      {
        goto LABEL_26;
      }

      id v30 = v10;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"chnl\\.[0-9]{7}\\.[0-9]{3}@icloud\\.com",  1LL,  &v30));
      id v15 = v30;

      if (!v14)
      {
        id v27 = sub_10003A95C();
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100093364();
        }
        goto LABEL_44;
      }

      if (!objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
        && v20 == [v5 length])
      {
        BOOL v11 = 1;
LABEL_32:
        __int128 v18 = v14;
        id v10 = v15;
        goto LABEL_33;
      }

      id v29 = v15;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"chnl\\.[a-zA-Z0-9]{4}\\.[a-zA-Z0-9]{6}@icloud\\.com",  1LL,  &v29));
      id v10 = v29;

      if (v18)
      {
        if (!objc_msgSend(v18, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
          && v21 == [v5 length])
        {
LABEL_26:
          BOOL v11 = 1;
LABEL_33:

          goto LABEL_34;
        }

        id v14 = v18;
        id v15 = v10;
LABEL_28:
        id v22 = sub_10003A95C();
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
          sub_100093300();
        }
        BOOL v11 = 0;
        goto LABEL_31;
      }

      id v28 = sub_10003A95C();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100093364();
      }
    }

    else
    {
      id v26 = sub_10003A95C();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100093364();
      }
    }

    id v15 = v10;
LABEL_44:

    id v14 = 0LL;
    goto LABEL_28;
  }

  id v9 = sub_10003A95C();
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Found 'demo account' flag in IdMS auth response!",  buf,  2u);
  }

  BOOL v11 = 1;
LABEL_34:

  return v11;
}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  uint64_t v6 = (void (**)(id, uint64_t))a6;
  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDAccountManagerHelper signOutFlowController:showAlertWithTitle:message:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v9, 0xCu);
  }

  v6[2](v6, 1LL);
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, uint64_t, void))a5;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[MSDAccountManagerHelper signOutFlowController:performWalrusValidationForAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v8, 0xCu);
  }

  v5[2](v5, 1LL, 0LL);
}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, uint64_t, void))a5;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[MSDAccountManagerHelper signOutFlowController:disableFindMyDeviceForAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v8, 0xCu);
  }

  v5[2](v5, 1LL, 0LL);
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = sub_10003A95C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[MSDAccountManagerHelper signOutFlowController:signOutAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: entered!", buf, 0xCu);
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](self, "accountStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D1F4;
  v13[3] = &unk_1000F98A8;
  id v14 = v7;
  id v12 = v7;
  [v11 removeAccount:v8 withDataclassActions:0 completion:v13];
}

- (CDPContext)cdpContext
{
  return self->cdpContext;
}

- (void)setCdpContext:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AIDAServiceOwnersManager)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end