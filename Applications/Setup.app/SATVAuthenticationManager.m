@interface SATVAuthenticationManager
+ (SATVAuthenticationManager)sharedInstance;
- (BOOL)iTunesAndiCloudAccountsMatch;
- (OS_dispatch_queue)serialQueue;
- (SATVAuthenticationManager)init;
- (TVSiCloudAccountManager)iCloudAccountManager;
- (UIViewController)presentingController;
- (id)usernameForActiveAccountType:(unint64_t)a3;
- (void)_authenticateAppleIDWithUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)_authenticateHomeSharingAccountWithUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)_authenticateStoreAccountWithUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)_authenticateiCloudAccountWithUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)_logOutiCloudAccount;
- (void)_logOutiTunesStoreAccount;
- (void)_performHomeSharingEnablementWithDictionary:(id)a3 completion:(id)a4;
- (void)_performIDMSAuthenticationWithUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)_performIDMSAuthenticationWithUsername:(id)a3 password:(id)a4 serviceType:(int64_t)a5 completion:(id)a6;
- (void)_performiCloudAuthenticationWithDictionary:(id)a3 completion:(id)a4;
- (void)_performiTunesStoreAuthenticationWithDictionary:(id)a3 completion:(id)a4;
- (void)authenticateAccountType:(unint64_t)a3 username:(id)a4 password:(id)a5 completion:(id)a6;
- (void)logOutAccountType:(unint64_t)a3;
- (void)refreshAccountPropertiesWithCompletion:(id)a3;
- (void)setICloudAccountManager:(id)a3;
- (void)setPresentingController:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation SATVAuthenticationManager

+ (SATVAuthenticationManager)sharedInstance
{
  if (qword_1001098C8 != -1) {
    dispatch_once(&qword_1001098C8, &stru_1000C9E78);
  }
  return (SATVAuthenticationManager *)(id)qword_1001098C0;
}

- (SATVAuthenticationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVAuthenticationManager;
  v2 = -[SATVAuthenticationManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.purplebuddy.AuthenticationQueue", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
    iCloudAccountManager = v2->_iCloudAccountManager;
    v2->_iCloudAccountManager = v5;
  }

  return v2;
}

- (void)authenticateAccountType:(unint64_t)a3 username:(id)a4 password:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10002F7E4;
  v24[3] = &unk_1000C9910;
  id v13 = v12;
  id v25 = v13;
  v14 = objc_retainBlock(v24);
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F870;
  block[3] = &unk_1000C9EA0;
  objc_copyWeak(v23, &location);
  id v20 = v10;
  id v21 = v11;
  v23[1] = (id)a3;
  id v22 = v14;
  v16 = v14;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (BOOL)iTunesAndiCloudAccountsMatch
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKStoreAccountManager sharedInstance](&OBJC_CLASS___TVCKStoreAccountManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeAccount]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager iCloudAccountManager](self, "iCloudAccountManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
  id v9 = [v5 caseInsensitiveCompare:v8];

  return v9 == 0LL;
}

- (id)usernameForActiveAccountType:(unint64_t)a3
{
  if (!a3)
  {
    if (-[SATVAuthenticationManager iTunesAndiCloudAccountsMatch](self, "iTunesAndiCloudAccountsMatch"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAuthenticationManager usernameForActiveAccountType:]( self,  "usernameForActiveAccountType:",  2LL));
      return v7;
    }

    goto LABEL_9;
  }

  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKStoreAccountManager sharedInstance](&OBJC_CLASS___TVCKStoreAccountManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 accountName]);
    goto LABEL_6;
  }

  if (a3 != 2)
  {
LABEL_9:
    v7 = 0LL;
    return v7;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager iCloudAccountManager](self, "iCloudAccountManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 username]);
LABEL_6:
  v7 = (void *)v6;

  return v7;
}

- (void)logOutAccountType:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FB80;
  block[3] = &unk_1000C9EC8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_logOutiTunesStoreAccount
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVCKStoreAccountManager sharedInstance](&OBJC_CLASS___TVCKStoreAccountManager, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKStoreAccountManager sharedInstance](&OBJC_CLASS___TVCKStoreAccountManager, "sharedInstance"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);
  [v4 removeAccount:v3];
}

- (void)_logOutiCloudAccount
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer localPlayer](&OBJC_CLASS___GKLocalPlayer, "localPlayer"));
  [v3 signOutWithCompletionHandler:&stru_1000C9EE8];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager iCloudAccountManager](self, "iCloudAccountManager"));
  [v4 signOutActiveAccountWithCompletion:0];
}

- (void)_authenticateAppleIDWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002FDC4;
  v12[3] = &unk_1000C9F88;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  -[SATVAuthenticationManager _performIDMSAuthenticationWithUsername:password:serviceType:completion:]( self,  "_performIDMSAuthenticationWithUsername:password:serviceType:completion:",  v8,  v9,  1LL,  v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_authenticateStoreAccountWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100030284;
  v12[3] = &unk_1000C9F88;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  -[SATVAuthenticationManager _performIDMSAuthenticationWithUsername:password:completion:]( self,  "_performIDMSAuthenticationWithUsername:password:completion:",  v8,  v9,  v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_authenticateiCloudAccountWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000305F4;
  v12[3] = &unk_1000C9F88;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  -[SATVAuthenticationManager _performIDMSAuthenticationWithUsername:password:serviceType:completion:]( self,  "_performIDMSAuthenticationWithUsername:password:serviceType:completion:",  v8,  v9,  1LL,  v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_authenticateHomeSharingAccountWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000307B8;
  v12[3] = &unk_1000C9F88;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  -[SATVAuthenticationManager _performIDMSAuthenticationWithUsername:password:completion:]( self,  "_performIDMSAuthenticationWithUsername:password:completion:",  v8,  v9,  v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_performIDMSAuthenticationWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
}

- (void)_performIDMSAuthenticationWithUsername:(id)a3 password:(id)a4 serviceType:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    id v13 = sub_10002AF94();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1000771F0();
    }
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  id v16 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
  [v16 setUsername:v10];
  [v16 _setPassword:v11];
  [v16 setIsUsernameEditable:0];
  [v16 setAuthenticationType:2];
  [v16 setShouldAllowAppleIDCreation:0];
  [v16 setShouldOfferSecurityUpgrade:0];
  [v16 setShouldUpdatePersistentServiceTokens:1];
  [v16 setMaximumLoginAttempts:1];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager presentingController](self, "presentingController"));
  [v16 setPresentingViewController:v17];

  [v16 setServiceType:a5];
  [v16 setSupportsPiggybacking:a5 == 1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100030A8C;
  v19[3] = &unk_1000C9690;
  id v20 = v12;
  id v18 = v12;
  [v15 authenticateWithContext:v16 completion:v19];
}

- (void)_performiTunesStoreAuthenticationWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = AKAuthenticationUsernameKey;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey]);

  id v12 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v12 setAuthenticationType:1];
  [v12 setCanMakeAccountActive:1];
  id v13 = [[AMSUIAuthenticateTask alloc] initWithAccount:0 presentingViewController:self->_presentingController options:v12];
  [v13 setUsername:v9];
  [v13 setAltDSID:v11];
  [v13 setPassword:v10];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 performAuthentication]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100030D9C;
  v19[3] = &unk_1000CA000;
  id v15 = v6;
  id v20 = v15;
  [v14 addSuccessBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100030EFC;
  v17[3] = &unk_1000C9898;
  id v18 = v15;
  id v16 = v15;
  [v14 addErrorBlock:v17];
}

- (void)_performiCloudAuthenticationWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKAuthenticationUsernameKey]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager iCloudAccountManager](self, "iCloudAccountManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003119C;
  v13[3] = &unk_1000CA078;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 signInWithUsername:v8 password:v9 completion:v13];
}

- (void)_performHomeSharingEnablementWithDictionary:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = AKAuthenticationUsernameKey;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AKAuthenticationPasswordKey]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000315CC;
  v12[3] = &unk_1000C9938;
  id v13 = v5;
  id v11 = v5;
  [v10 setMediaServerDiscoveryConfigurationWithMode:1 homeSharingAccountName:v8 homeSharingPassword:v9 completionHandler:v12];
}

- (void)refreshAccountPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationManager iCloudAccountManager](self, "iCloudAccountManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    uint64_t v13 = kACDiscoverPropertiesDiscoverConnectionPropertiesKey;
    id v14 = &__kCFBooleanTrue;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000317CC;
    v11[3] = &unk_1000CA0A0;
    id v12 = v4;
    [v7 discoverPropertiesForAccount:v6 options:v8 completion:v11];
  }

  else
  {
    id v9 = sub_10002AF94();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100077338();
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (UIViewController)presentingController
{
  return self->_presentingController;
}

- (void)setPresentingController:(id)a3
{
}

- (TVSiCloudAccountManager)iCloudAccountManager
{
  return self->_iCloudAccountManager;
}

- (void)setICloudAccountManager:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end