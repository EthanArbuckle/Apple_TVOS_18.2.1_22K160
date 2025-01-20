@interface TVSettingsITMSSandboxFacade
- (ACAccount)sandboxAccount;
- (BOOL)isAuthenticationInProgress;
- (BOOL)isSandboxUIEnabled;
- (BOOL)isSignOutInProgress;
- (TVSettingsITMSSandboxFacade)init;
- (id)_getSandboxAccount;
- (void)_accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setIsAuthenticationInProgress:(BOOL)a3;
- (void)setIsSandboxUIEnabled:(BOOL)a3;
- (void)setIsSignOutInProgress:(BOOL)a3;
- (void)setSandboxAccount:(id)a3;
- (void)signInSandboxAccountWithPresentingViewController:(id)a3;
- (void)signOut;
- (void)updateSandboxAccountState;
@end

@implementation TVSettingsITMSSandboxFacade

- (TVSettingsITMSSandboxFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsITMSSandboxFacade;
  v2 = -[TVSettingsITMSSandboxFacade init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TVSettingsITMSSandboxFacade updateSandboxAccountState](v2, "updateSandboxAccountState");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"_accountStoreDidChange:" name:ACAccountStoreDidChangeNotification object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsITMSSandboxFacade;
  -[TVSettingsITMSSandboxFacade dealloc](&v4, "dealloc");
}

- (id)_getSandboxAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return v3;
}

- (void)updateSandboxAccountState
{
  self->_isSandboxUIEnabled = +[AMSDefaults showSandboxAccountUI]( &OBJC_CLASS___AMSDefaults,  "showSandboxAccountUI");
  v3 = (ACAccount *)objc_claimAutoreleasedReturnValue(-[TVSettingsITMSSandboxFacade _getSandboxAccount](self, "_getSandboxAccount"));
  sandboxAccount = self->_sandboxAccount;
  self->_sandboxAccount = v3;

  -[TVSettingsITMSSandboxFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"isSandboxUIEnabled");
  -[TVSettingsITMSSandboxFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"sandboxAccount");
}

- (void)signInSandboxAccountWithPresentingViewController:(id)a3
{
  id v4 = a3;
  -[TVSettingsITMSSandboxFacade setIsAuthenticationInProgress:](self, "setIsAuthenticationInProgress:", 1LL);
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientInfo]);
  [v6 setAccountMediaType:AMSAccountMediaTypeAppStoreSandbox];

  id v7 = [[AMSUIAuthenticateTask alloc] initWithAccount:0 presentingViewController:v4 options:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 performAuthentication]);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000EA8D0;
  v9[3] = &unk_1001950F0;
  objc_copyWeak(&v10, &location);
  [v8 addFinishBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)signOut
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_activeiTunesAccount"));
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EAAA4;
  v5[3] = &unk_10018F430;
  objc_copyWeak(&v6, &location);
  [v3 removeAccount:v4 withCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:ACAccountTypeIdentifierKey]);

  if ([v5 isEqualToString:AMSAccountMediaTypeAppStoreSandbox])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EAC74;
    block[3] = &unk_10018E440;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (BOOL)isSandboxUIEnabled
{
  return self->_isSandboxUIEnabled;
}

- (void)setIsSandboxUIEnabled:(BOOL)a3
{
  self->_isSandboxUIEnabled = a3;
}

- (BOOL)isAuthenticationInProgress
{
  return self->_isAuthenticationInProgress;
}

- (void)setIsAuthenticationInProgress:(BOOL)a3
{
  self->_isAuthenticationInProgress = a3;
}

- (BOOL)isSignOutInProgress
{
  return self->_isSignOutInProgress;
}

- (void)setIsSignOutInProgress:(BOOL)a3
{
  self->_isSignOutInProgress = a3;
}

- (ACAccount)sandboxAccount
{
  return self->_sandboxAccount;
}

- (void)setSandboxAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end