@interface CSVSSystemSignInViewController
- (ACAccount)account;
- (CSVSAuthenticationContainerViewController)authenticationViewController;
- (id)_accountDescription;
- (id)_authenticationContentConfigurationWithSystemService:(int64_t)a3;
- (id)_menuActions;
- (unint64_t)requestOptions;
- (void)_handleDeviceStartedAuthenticationMessage:(id)a3;
- (void)_handleDeviceTappedNotificationMessage:(id)a3;
- (void)_handleSessionFailedMessage:(id)a3;
- (void)_handleSessionFinishedMessage;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation CSVSSystemSignInViewController

- (void)_handleDeviceTappedNotificationMessage:(id)a3
{
  authenticationViewController = self->_authenticationViewController;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( authenticationViewController,  "deviceViewController"));
  [v5 performTappedNotificationTransitionWithDevice:v4];
}

- (void)_handleDeviceStartedAuthenticationMessage:(id)a3
{
  authenticationViewController = self->_authenticationViewController;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( authenticationViewController,  "deviceViewController"));
  [v5 performStartedAuthenticationWithDevice:v4];
}

- (void)_handleSessionFinishedMessage
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v2 performSessionCompletedTransitionWithError:0];
}

- (void)_handleSessionFailedMessage:(id)a3
{
  authenticationViewController = self->_authenticationViewController;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( authenticationViewController,  "deviceViewController"));
  [v5 performSessionCompletedTransitionWithError:v4];
}

- (id)_menuActions
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((-[CSVSSystemSignInViewController requestOptions](self, "requestOptions") & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"CONFIRM_WITH_PASSWORD" value:&stru_100024BC0 table:0]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100009F5C;
    v13[3] = &unk_100024598;
    objc_copyWeak(&v14, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v5,  0LL,  0LL,  v13));
    -[NSMutableArray addObject:](v3, "addObject:", v6);

    objc_destroyWeak(&v14);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100009F8C;
  v11[3] = &unk_100024598;
  objc_copyWeak(&v12, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v8,  0LL,  0LL,  v11));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_authenticationContentConfigurationWithSystemService:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration systemSignInConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "systemSignInConfiguration"));
  switch(a3)
  {
    case 4LL:
      v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"recognize-my-voice-icon",  v14));
      [v5 setImage:v15];

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"RECOGNIZE_MY_VOICE_TITLE" value:&stru_100024BC0 table:0]);
      [v5 setTitleText:v17];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"RECOGNIZE_MY_VOICE_MESSAGE" value:&stru_100024BC0 table:0]);
LABEL_13:
      [v5 setBodyText:v11];
      goto LABEL_14;
    case 3LL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"photos-icon"));
      [v5 setImage:v18];

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aa_primaryAppleAccount"));

      if ((-[CSVSSystemSignInViewController requestOptions](self, "requestOptions") & 2) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"PHOTOS_CHANGES_MESSAGE" value:&stru_100024BC0 table:0]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v9 username]);
        v29 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v27, v28);
      }

      else
      {
        unsigned __int8 v20 = -[CSVSSystemSignInViewController requestOptions](self, "requestOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v22 = v21;
        if ((v20 & 4) != 0)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"PHOTOS_SHARED_ALBUMS_TITLE" value:&stru_100024BC0 table:0]);
          [v5 setTitleText:v30];

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v25 = v24;
          v26 = @"PHOTOS_SHARED_ALBUMS_MESSAGE";
        }

        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"PHOTOS_ICLOUD_TITLE" value:&stru_100024BC0 table:0]);
          [v5 setTitleText:v23];

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v25 = v24;
          v26 = @"PHOTOS_MESSAGE";
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:v26 value:&stru_100024BC0 table:0]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v9 username]);
        v29 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v27, v28);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(v29);

      goto LABEL_13;
    case 2LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"SHARED_WITH_YOU_TITLE" value:&stru_100024BC0 table:0]);
      [v5 setTitleText:v7];

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"shared-with-you-icon"));
      [v5 setImage:v8];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v10 = sub_10000743C(@"SHARED_WITH_YOU_MESSAGE", 3uLL);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v11 value:&stru_100024BC0 table:0]);
      [v5 setBodyText:v12];

LABEL_14:
      break;
  }

  return v5;
}

- (id)_accountDescription
{
  return -[ACAccount username](self->_account, "username");
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v6 = (ACAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));
  account = self->_account;
  self->_account = v6;

  uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"systemService", 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  id v10 = [v9 integerValue];

  uint64_t v11 = NSDictionaryGetNSNumber(v4, @"requestOptions", 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  self->_requestOptions = (unint64_t)[v12 integerValue];

  uint64_t v13 = NSDictionaryGetNSNumber(v4, @"authType", 0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  id v15 = [v14 integerValue];
  v16 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = v16;

  v18 = objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSystemSignInViewController _accountDescription](self, "_accountDescription"));
  v27 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( v18,  "initWithAuthType:accountDescription:",  v15,  v19);

  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v20 setAuthenticationInfo:v27];

  v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSystemSignInViewController _menuActions](self, "_menuActions"));
  [v21 setOrderedCustomAuthenticationActions:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSSystemSignInViewController _authenticationContentConfigurationWithSystemService:]( self,  "_authenticationContentConfigurationWithSystemService:",  v10));
  v24 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
  -[CSVSAuthenticationContentViewController setConfiguration:](v24, "setConfiguration:", v23);
  -[CSVSAuthenticationContainerViewController setContentViewController:]( self->_authenticationViewController,  "setContentViewController:",  v24);
  v25 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v25, "setAllowedPressTypes:", &off_100026388);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self->_authenticationViewController, "view"));
  [v26 addGestureRecognizer:v25];

  -[CSVSSystemSignInViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_authenticationViewController,  1LL,  0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v7 = (void (**)(void))a4;
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = 0LL;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSystemSignInViewController presentedViewController](self, "presentedViewController"));
  if (v6)
  {
    -[CSVSSystemSignInViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v7);
  }

  else if (v7)
  {
    v7[2]();
  }
}

- (CSVSAuthenticationContainerViewController)authenticationViewController
{
  return self->_authenticationViewController;
}

- (ACAccount)account
{
  return self->_account;
}

- (unint64_t)requestOptions
{
  return self->_requestOptions;
}

- (void).cxx_destruct
{
}

@end