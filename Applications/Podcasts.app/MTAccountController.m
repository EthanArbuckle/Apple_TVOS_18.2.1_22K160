@interface MTAccountController
+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3;
+ (void)openAccountsPanel;
- (ACAccount)_activeAccount;
- (ACAccount)accountOverride;
- (BOOL)activeAccountIsManagedAppleID;
- (BOOL)hasFetchedInitialAccount;
- (BOOL)isPrimaryUserActiveAccount;
- (BOOL)isUserLoggedIn;
- (MTAccountController)init;
- (NSMutableSet)declinedAuthRequests;
- (NSMutableSet)inFlightAuthRequests;
- (id)_activeAccountBlocking;
- (id)activeAccount;
- (id)activeDsid;
- (id)activeEmail;
- (id)activeFullName;
- (id)activeStorefront;
- (id)primaryUser;
- (void)_updateActiveAccount;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)fetchActiveAccountWithCompletion:(id)a3;
- (void)promptAccountAuthenticationWithDebugReason:(id)a3 forced:(BOOL)a4;
- (void)setAccountOverride:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setDeclinedAuthRequests:(id)a3;
- (void)setHasFetchedInitialAccount:(BOOL)a3;
- (void)setInFlightAuthRequests:(id)a3;
- (void)set_activeAccount:(id)a3;
- (void)signOut;
@end

@implementation MTAccountController

- (MTAccountController)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTAccountController;
  v2 = -[MTAccountController init](&v13, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0LL);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0LL);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    -[MTAccountController _updateActiveAccount](v2, "_updateActiveAccount");
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"didChangeStoreAccount:" name:ACDAccountStoreDidChangeNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTAccountController;
  -[MTAccountController dealloc](&v4, "dealloc");
}

- (id)activeAccount
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100069CB0;
  v10 = sub_100069CC0;
  id v11 = 0LL;
  accountQueue = (dispatch_queue_s *)self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100069CC8;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setActiveAccount:(id)a3
{
  id v4 = a3;
  accountQueue = (dispatch_queue_s *)self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100069D7C;
  v7[3] = &unk_100240240;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (id)primaryUser
{
  return -[MTAccountController _activeAccount](self, "_activeAccount");
}

- (BOOL)isPrimaryUserActiveAccount
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_DSID](self->__activeAccount, "ams_DSID"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeDsid](self, "activeDsid"));
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_DSID](self->__activeAccount, "ams_DSID"));
    unsigned __int8 v6 = [v4 isEqualToNumber:v5];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountQueue = (dispatch_queue_s *)self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100069F44;
  v7[3] = &unk_100240138;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (id)activeDsid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_DSID"));

  return v3;
}

- (id)activeStorefront
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_storefront"));

  return v3;
}

- (id)activeEmail
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 username]);

  return v3;
}

- (id)activeFullName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_fullName"));

  return v3;
}

- (BOOL)isUserLoggedIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_DSID"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)activeAccountIsManagedAppleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  unsigned __int8 v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:]( &OBJC_CLASS___MTAccountController,  "iTunesAccountDidChangeForACAccountNotification:",  a3))
  {
    -[MTAccountController _updateActiveAccount](self, "_updateActiveAccount");
    if (-[MTAccountController isUserLoggedIn](self, "isUserLoggedIn"))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v4 postNotificationName:@"MTShouldCheckShowWelcomeNotification" object:0];
    }
  }

- (id)_activeAccountBlocking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return v3;
}

- (void)_updateActiveAccount
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeDsid](self, "activeDsid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);

  accountQueue = (dispatch_queue_s *)self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006A2A0;
  v7[3] = &unk_100240240;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = ACAccountTypeIdentifierKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:ACAccountTypeIdentifierKey]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);
    unsigned __int8 v9 = [v8 isEqualToString:ACAccountTypeIdentifieriTunesStore];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

+ (void)openAccountsPanel
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", UIApplicationOpenSettingsURLString));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v2 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)promptAccountAuthenticationWithDebugReason:(id)a3 forced:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = _MTLogCategoryDefault(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Prompting for sign-in with reason %@",  buf,  0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A5F4;
  block[3] = &unk_100241458;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)signOut
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 accountStore]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  [v3 removeAccount:v4 withCompletionHandler:&stru_100242460];
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
}

- (ACAccount)accountOverride
{
  return self->_accountOverride;
}

- (void)setAccountOverride:(id)a3
{
}

- (NSMutableSet)inFlightAuthRequests
{
  return self->_inFlightAuthRequests;
}

- (void)setInFlightAuthRequests:(id)a3
{
}

- (NSMutableSet)declinedAuthRequests
{
  return self->_declinedAuthRequests;
}

- (void)setDeclinedAuthRequests:(id)a3
{
}

- (ACAccount)_activeAccount
{
  return self->__activeAccount;
}

- (void)set_activeAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end