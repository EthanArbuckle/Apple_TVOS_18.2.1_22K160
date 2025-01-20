@interface TVHAccountSetupViewController
- (BOOL)isAuthenticationInProgress;
- (TVHAccountSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHAccountSetupViewControllerDelegate)delegate;
- (void)_enableHomeSharingWithAccountName:(id)a3 password:(id)a4;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)_notifyDidCancel;
- (void)_notifyDidSucceedWithAccountName:(id)a3;
- (void)_presentError;
- (void)_showLoginWithAccount:(id)a3;
- (void)_showSetupUI;
- (void)_showShouldUseAccountDialog:(id)a3;
- (void)dealloc;
- (void)setAuthenticationInProgress:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TVHAccountSetupViewController

- (TVHAccountSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHAccountSetupViewController;
  v4 = -[TVHAccountSetupViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v5 addObserver:v4 selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:v6];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHAccountSetupViewController;
  -[TVHAccountSetupViewController dealloc](&v4, "dealloc");
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHAccountSetupViewController;
  -[TVHAccountSetupViewController willMoveToParentViewController:](&v7, "willMoveToParentViewController:");
  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController presentedViewController](self, "presentedViewController"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController presentedViewController](self, "presentedViewController"));
      [v6 dismissViewControllerAnimated:0 completion:0];
    }
  }

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHAccountSetupViewController;
  -[TVHAccountSetupViewController viewDidLoad](&v3, "viewDidLoad");
  -[TVHAccountSetupViewController _showSetupUI](self, "_showSetupUI");
}

- (void)setAuthenticationInProgress:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_authenticationInProgress = a3;
  objc_sync_exit(obj);
}

- (BOOL)isAuthenticationInProgress
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL authenticationInProgress = v2->_authenticationInProgress;
  objc_sync_exit(v2);

  return authenticationInProgress;
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
}

- (void)_showSetupUI
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_activeiTunesAccount"));

  if (v4) {
    -[TVHAccountSetupViewController _showShouldUseAccountDialog:](self, "_showShouldUseAccountDialog:", v4);
  }
  else {
    -[TVHAccountSetupViewController _showLoginWithAccount:](self, "_showLoginWithAccount:", 0LL);
  }
}

- (void)_showLoginWithAccount:(id)a3
{
  id v4 = a3;
  if (!-[TVHAccountSetupViewController isAuthenticationInProgress](self, "isAuthenticationInProgress"))
  {
    -[TVHAccountSetupViewController setAuthenticationInProgress:](self, "setAuthenticationInProgress:", 1LL);
    v5 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
    [v5 setIsEphemeral:1];
    v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"SETUP_ACCOUNT_MESSAGE" value:0 table:@"AccountSetupLocalizable"]);
    [v5 setReason:v8];

    [v5 setIsUsernameEditable:v4 == 0];
    [v5 setShouldAllowAppleIDCreation:0];
    [v5 setPresentingViewController:self];
    [v5 setAuthenticationType:2];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
      [v5 setUsername:v10];
    }

    v11 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationController);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_497C;
    v12[3] = &unk_C2D0;
    objc_copyWeak(&v13, &location);
    [v11 authenticateWithContext:v5 completion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_showShouldUseAccountDialog:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"USE_ACCOUNT_MESSAGE_FORMAT" value:0 table:@"AccountSetupLocalizable"]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"SETUP_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v9,  1LL));

  objc_initWeak(location, self);
  v14 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"USE_ACCOUNT_BUTTON_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_4F18;
  v29[3] = &unk_C2F8;
  objc_copyWeak(&v31, location);
  id v17 = v4;
  id v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  v29));

  [v13 addAction:v18];
  v19 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"USE_OTHER_ACCOUNT_BUTTON_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_4F54;
  v27[3] = &unk_C320;
  objc_copyWeak(&v28, location);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  v27));

  [v13 addAction:v22];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_4F84;
  v25[3] = &unk_C320;
  objc_copyWeak(&v26, location);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v25));
  [v13 addAction:v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController navigationController](self, "navigationController"));
  [v24 presentViewController:v13 animated:1 completion:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)_enableHomeSharingWithAccountName:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_50BC;
  v10[3] = &unk_C370;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [v8 setMediaServerDiscoveryConfigurationWithMode:1 homeSharingAccountName:v9 homeSharingPassword:v7 completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_presentError
{
  objc_super v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SETUP_ERROR_TITLE" value:0 table:@"AccountSetupLocalizable"]);

  id v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"SETUP_ERROR_MESSAGE" value:0 table:@"AccountSetupLocalizable"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v8,  1LL));
  objc_initWeak(&location, self);
  v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"OK_BUTTON_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_53C0;
  id v17 = &unk_C320;
  objc_copyWeak(&v18, &location);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  &v14));

  objc_msgSend(v9, "addAction:", v13, v14, v15, v16, v17);
  -[TVHAccountSetupViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_notifyDidSucceedWithAccountName:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "accountSetupViewController:didSucceedWithAccountName:") & 1) != 0) {
    [v4 accountSetupViewController:self didSucceedWithAccountName:v5];
  }
}

- (void)_notifyDidCancel
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "accountSetupViewControllerDidCancel:") & 1) != 0) {
    [v3 accountSetupViewControllerDidCancel:self];
  }
}

- (TVHAccountSetupViewControllerDelegate)delegate
{
  return (TVHAccountSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end