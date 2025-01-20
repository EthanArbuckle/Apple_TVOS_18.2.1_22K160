@interface CSVSStoreAuthenticationViewController
- (CPSViewServicePresentationContext)presentationContext;
- (CSVSAuthenticationContainerViewController)authenticationViewController;
- (id)_accountDescription;
- (id)_authenticationContentConfiguration;
- (id)_menuActions;
- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4;
- (void)_handleDeviceStartedAuthenticationMessage:(id)a3;
- (void)_handleDeviceTappedNotificationMessage:(id)a3;
- (void)_handleSessionFailedMessage:(id)a3;
- (void)_handleSessionFinishedMessage;
- (void)setPresentationContext:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation CSVSStoreAuthenticationViewController

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

- (id)_accountDescription
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSStoreAuthenticationViewController presentationContext](self, "presentationContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 storeAccount]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);

  return v4;
}

- (id)_menuActions
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"SIGN_IN_MANUALLY" value:&stru_100024BC0 table:0]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000DB30;
  v12[3] = &unk_100024598;
  objc_copyWeak(&v13, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v4,  0LL,  0LL,  v12));
  -[NSMutableArray addObject:](v2, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000DB60;
  v10[3] = &unk_100024598;
  objc_copyWeak(&v11, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v7,  0LL,  0LL,  v10));
  -[NSMutableArray addObject:](v2, "addObject:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_authenticationContentConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration storeAuthenticationConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "storeAuthenticationConfiguration"));
  [v3 setImageWithSystemImageName:@"person.circle"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"STORE_AUTHENTICATION_TITLE" value:&stru_100024BC0 table:0]);
  [v3 setTitleText:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"STORE_AUTHENTICATION_SUBTITLE" value:&stru_100024BC0 table:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSStoreAuthenticationViewController _accountDescription](self, "_accountDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
  [v3 setBodyText:v9];

  return v3;
}

- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSData);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"presentationContextData", v7));

  if (v8)
  {
    uint64_t v9 = objc_opt_self(&OBJC_CLASS___CPSViewServicePresentationContext);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v20 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v10,  v8,  &v20));
    id v12 = v20;

    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 storeAuthenticationRequest]);

      if (v13)
      {
        id v14 = v11;
LABEL_14:

        goto LABEL_15;
      }

      if (a4)
      {
        uint64_t v18 = CPSErrorMake(201LL, @"Missing Store Authentication request");
        v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
        goto LABEL_11;
      }
    }

    else if (a4)
    {
      uint64_t v16 = CPSErrorUnderlyingMake(203LL, v12, @"Failed to unarchive presentation context");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
LABEL_11:
      id v14 = 0LL;
      *a4 = v17;
      goto LABEL_14;
    }

    id v14 = 0LL;
    goto LABEL_14;
  }

  if (a4)
  {
    uint64_t v15 = CPSErrorMake(203LL, @"Missing presentation context data");
    id v14 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v15);
  }

  else
  {
    id v14 = 0LL;
  }

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

  if (v6)
  {
    id v29 = 0LL;
    v7 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue( -[CSVSStoreAuthenticationViewController _presentationContextFromViewServiceOptions:error:]( self,  "_presentationContextFromViewServiceOptions:error:",  v4,  &v29));
    id v8 = v29;
    presentationContext = self->_presentationContext;
    self->_presentationContext = v7;

    v10 = self->_presentationContext;
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext storeAccount](v10, "storeAccount"));

      if (v11)
      {
        id v12 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
        authenticationViewController = self->_authenticationViewController;
        self->_authenticationViewController = v12;

        id v14 = objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSStoreAuthenticationViewController _accountDescription](self, "_accountDescription"));
        uint64_t v16 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( v14,  "initWithAuthType:accountDescription:",  11LL,  v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
        [v17 setAuthenticationInfo:v16];

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSStoreAuthenticationViewController _menuActions](self, "_menuActions"));
        [v18 setOrderedCustomAuthenticationActions:v19];

        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSStoreAuthenticationViewController _authenticationContentConfiguration]( self,  "_authenticationContentConfiguration"));
        v21 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
        -[CSVSAuthenticationContentViewController setConfiguration:](v21, "setConfiguration:", v20);
        -[CSVSAuthenticationContainerViewController setContentViewController:]( self->_authenticationViewController,  "setContentViewController:",  v21);
        v22 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
        -[UITapGestureRecognizer setAllowedPressTypes:](v22, "setAllowedPressTypes:", &off_1000263D0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self->_authenticationViewController, "view"));
        [v23 addGestureRecognizer:v22];

        -[CSVSStoreAuthenticationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_authenticationViewController,  1LL,  0LL);
LABEL_15:

        goto LABEL_16;
      }

      v26 = @"Missing Store Account in request";
      uint64_t v27 = 200LL;
LABEL_14:
      uint64_t v28 = CPSErrorMake(v27, v26);
      uint64_t v16 = (CSVSAuthenticationInfo *)objc_claimAutoreleasedReturnValue(v28);
      -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v16);
      goto LABEL_15;
    }

    if (qword_10002CB28 != -1) {
      dispatch_once(&qword_10002CB28, &stru_100024970);
    }
    v25 = (os_log_s *)qword_10002CB20;
    if (os_log_type_enabled((os_log_t)qword_10002CB20, OS_LOG_TYPE_ERROR))
    {
      sub_100017578((uint64_t)v8, v25);
      if (v8) {
        goto LABEL_10;
      }
    }

    else if (v8)
    {
      goto LABEL_10;
    }

    v26 = @"Invalid presentation context";
    uint64_t v27 = 203LL;
    goto LABEL_14;
  }

  uint64_t v24 = CPSErrorMake(200LL, @"No primary account");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v24);
LABEL_10:
  -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v8);
LABEL_16:
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v7 = (void (**)(void))a4;
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = 0LL;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSStoreAuthenticationViewController presentedViewController](self, "presentedViewController"));
  if (v6)
  {
    -[CSVSStoreAuthenticationViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v7);
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

- (CPSViewServicePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end