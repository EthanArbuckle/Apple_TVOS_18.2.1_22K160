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
    v6 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationTVContext, v5);
    [v6 setIsEphemeral:1];
    *(void *)&double v7 = objc_opt_class(self).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v8, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"SETUP_ACCOUNT_MESSAGE" value:0 table:@"AccountSetupLocalizable"]);
    [v6 setReason:v10];

    [v6 setIsUsernameEditable:v4 == 0];
    [v6 setShouldAllowAppleIDCreation:0];
    [v6 setPresentingViewController:self];
    [v6 setAuthenticationType:2];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
      [v6 setUsername:v13];
    }

    v14 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationController, v12);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000947D8;
    v15[3] = &unk_1000FFB08;
    objc_copyWeak(&v16, &location);
    [v14 authenticateWithContext:v6 completion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)_showShouldUseAccountDialog:(id)a3
{
  id v4 = a3;
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v6, v5));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"USE_ACCOUNT_MESSAGE_FORMAT" value:0 table:@"AccountSetupLocalizable"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  *(void *)&double v11 = objc_opt_class(self).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v12, v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"SETUP_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  v10,  1LL));

  objc_initWeak(location, self);
  *(void *)&double v16 = objc_opt_class(self).n128_u64[0];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v17, v16));
  v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"USE_ACCOUNT_BUTTON_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100094D74;
  v33[3] = &unk_1000FFB30;
  objc_copyWeak(&v35, location);
  id v20 = v4;
  id v34 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v33));

  [v15 addAction:v21];
  *(void *)&double v22 = objc_opt_class(self).n128_u64[0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v23, v22));
  v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"USE_OTHER_ACCOUNT_BUTTON_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100094DB0;
  v31[3] = &unk_1000FFB58;
  objc_copyWeak(&v32, location);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  0LL,  v31));

  [v15 addAction:v26];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100094DE0;
  v29[3] = &unk_1000FFB58;
  objc_copyWeak(&v30, location);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v29));
  [v15 addAction:v27];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController navigationController](self, "navigationController"));
  [v28 presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(location);
}

- (void)_enableHomeSharingWithAccountName:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100094F18;
  v10[3] = &unk_1000FFBA8;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [v8 setMediaServerDiscoveryConfigurationWithMode:1 homeSharingAccountName:v9 homeSharingPassword:v7 completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_presentError
{
  *(void *)&double v3 = objc_opt_class(self).n128_u64[0];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v4, v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"SETUP_ERROR_TITLE" value:0 table:@"AccountSetupLocalizable"]);

  *(void *)&double v7 = objc_opt_class(self).n128_u64[0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v8, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"SETUP_ERROR_MESSAGE" value:0 table:@"AccountSetupLocalizable"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v10,  1LL));
  objc_initWeak(&location, self);
  *(void *)&double v12 = objc_opt_class(self).n128_u64[0];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v13, v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"OK_BUTTON_TITLE" value:0 table:@"AccountSetupLocalizable"]);
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10009521C;
  id v20 = &unk_1000FFB58;
  objc_copyWeak(&v21, &location);
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  &v17));

  objc_msgSend(v11, "addAction:", v16, v17, v18, v19, v20);
  -[TVHAccountSetupViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_notifyDidSucceedWithAccountName:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSetupViewController delegate](self, "delegate"));
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