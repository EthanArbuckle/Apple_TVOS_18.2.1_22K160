@interface CSVSRestrictedAccessViewController
- (CPSViewServicePresentationContext)presentationContext;
- (CSVSAuthenticationContainerViewController)authenticationViewController;
- (UINavigationController)navigationController;
- (id)_menuActions;
- (id)_passcodeEntryViewController;
- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4;
- (void)_handleDeviceStartedAuthenticationMessage:(id)a3;
- (void)_handleDeviceTappedNotificationMessage:(id)a3;
- (void)_handleSessionFailedMessage:(id)a3;
- (void)_handleSessionFinishedMessage;
- (void)_showPasscodeEntry;
- (void)setAuthenticationViewController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation CSVSRestrictedAccessViewController

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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController visibleViewController](self->_navigationController, "visibleViewController"));
  uint64_t v4 = objc_opt_class(v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSUIRestrictionsPasscodeEntryViewController);

  if (v4 == v5) {
    id v6 =  -[UINavigationController popToRootViewControllerAnimated:]( self->_navigationController,  "popToRootViewControllerAnimated:",  1LL);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v7 performSessionCompletedTransitionWithError:0];
}

- (void)_handleSessionFailedMessage:(id)a3
{
  navigationController = self->_navigationController;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController visibleViewController](navigationController, "visibleViewController"));
  uint64_t v7 = objc_opt_class(v6);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVSUIRestrictionsPasscodeEntryViewController);

  if (v7 == v8) {
    id v9 =  -[UINavigationController popToRootViewControllerAnimated:]( self->_navigationController,  "popToRootViewControllerAnimated:",  1LL);
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v10 performSessionCompletedTransitionWithError:v5];
}

- (id)_menuActions
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"APPROVE_WITH_PASSCODE" value:&stru_100024BC0 table:0]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000046F4;
  v12[3] = &unk_100024598;
  objc_copyWeak(&v13, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v4,  0LL,  0LL,  v12));
  -[NSMutableArray addObject:](v2, "addObject:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004720;
  v10[3] = &unk_100024598;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v7,  0LL,  0LL,  v10));
  -[NSMutableArray addObject:](v2, "addObject:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_showPasscodeEntry
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSVSRestrictedAccessViewController _passcodeEntryViewController](self, "_passcodeEntryViewController"));
  -[UINavigationController pushViewController:animated:]( self->_navigationController,  "pushViewController:animated:",  v3,  1LL);
}

- (id)_passcodeEntryViewController
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100004854;
  v4[3] = &unk_1000245C0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIRestrictionsPasscodeEntryViewController restrictionsPasscodeEntryViewControllerWithCompletion:]( &OBJC_CLASS___TVSUIRestrictionsPasscodeEntryViewController,  "restrictionsPasscodeEntryViewControllerWithCompletion:",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSData);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"presentationContextData", v7));

  if (v8)
  {
    uint64_t v9 = objc_opt_self(&OBJC_CLASS___CPSViewServicePresentationContext);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v20 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v10,  v8,  &v20));
    id v12 = v20;

    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 restrictedAccessRequest]);

      if (v13)
      {
        id v14 = v11;
LABEL_14:

        goto LABEL_15;
      }

      if (a4)
      {
        uint64_t v18 = CPSErrorMake(201LL, @"Missing restricted access request");
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
  id v47 = 0LL;
  id v5 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue( -[CSVSRestrictedAccessViewController _presentationContextFromViewServiceOptions:error:]( self,  "_presentationContextFromViewServiceOptions:error:",  v4,  &v47));
  id v6 = v47;
  presentationContext = self->_presentationContext;
  self->_presentationContext = v5;

  uint64_t v8 = self->_presentationContext;
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext restrictedAccessRequest](v8, "restrictedAccessRequest"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 approversAppleAccountAltDSIDs]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userProfilesSnapshot]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 userProfiles]);
    id v14 = [v13 count];

    if (v10)
    {
      if ([v10 count]) {
        BOOL v15 = v14 == 0LL;
      }
      else {
        BOOL v15 = 1;
      }
      if (!v15) {
        goto LABEL_15;
      }
    }

    else if (v14)
    {
LABEL_15:
      uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"authType", 0LL);
      v23 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
      id v24 = [v23 integerValue];

      v25 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
      authenticationViewController = self->_authenticationViewController;
      self->_authenticationViewController = v25;

      uint64_t v16 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo),  "initWithAuthType:accountDescription:",  v24,  0LL);
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
      [v27 setAuthenticationInfo:v16];

      v28 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSRestrictedAccessViewController _menuActions](self, "_menuActions"));
      [v28 setOrderedCustomAuthenticationActions:v29];

      v17 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration restrictedAccessConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "restrictedAccessConfiguration"));
      v30 = (void *)objc_claimAutoreleasedReturnValue( -[CPSViewServicePresentationContext restrictedAccessRequest]( self->_presentationContext,  "restrictedAccessRequest"));
      id v31 = [v30 restrictionType];

      if (v31 == (id)6)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"RESTRICTED_ACCESS_TURN_OFF_TITLE" value:&stru_100024BC0 table:0]);
        -[UITapGestureRecognizer setTitleText:](v17, "setTitleText:", v38);

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v35 = v34;
        v36 = @"RESTRICTED_ACCESS_TURN_OFF_MESSAGE";
      }

      else if (v31 == (id)5)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 localizedStringForKey:@"RESTRICTED_ACCESS_TITLE" value:&stru_100024BC0 table:0]);
        -[UITapGestureRecognizer setTitleText:](v17, "setTitleText:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v35 = v34;
        v36 = @"RESTRICTED_ACCESS_MODIFY_RESTRICTIONS_MESSAGE";
      }

      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue( [v39 localizedStringForKey:@"RESTRICTED_ACCESS_TITLE" value:&stru_100024BC0 table:0]);
        -[UITapGestureRecognizer setTitleText:](v17, "setTitleText:", v40);

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v35 = v34;
        v36 = @"RESTRICTED_ACCESS_MESSAGE";
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedStringForKey:v36 value:&stru_100024BC0 table:0]);
      -[UITapGestureRecognizer setBodyText:](v17, "setBodyText:", v41);

      -[UITapGestureRecognizer setImageWithSystemImageName:]( v17,  "setImageWithSystemImageName:",  @"figure.child.and.lock.fill");
      id v20 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
      -[CSVSAuthenticationContentViewController setConfiguration:](v20, "setConfiguration:", v17);
      -[CSVSAuthenticationContainerViewController setContentViewController:]( self->_authenticationViewController,  "setContentViewController:",  v20);
      v42 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
      -[UITapGestureRecognizer setAllowedPressTypes:](v42, "setAllowedPressTypes:", &off_100026370);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self->_authenticationViewController, "view"));
      [v43 addGestureRecognizer:v42];

      v44 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  self->_authenticationViewController);
      navigationController = self->_navigationController;
      self->_navigationController = v44;

      goto LABEL_21;
    }

    uint64_t v16 = (CSVSAuthenticationInfo *)objc_claimAutoreleasedReturnValue( -[CSVSRestrictedAccessViewController _passcodeEntryViewController]( self,  "_passcodeEntryViewController"));
    v17 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
    -[UITapGestureRecognizer setAllowedPressTypes:](v17, "setAllowedPressTypes:", &off_100026358);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationInfo view](v16, "view"));
    [v18 addGestureRecognizer:v17];

    v19 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v16);
    id v20 = (CSVSAuthenticationContentViewController *)self->_navigationController;
    self->_navigationController = v19;
LABEL_21:

    -[UINavigationController setOverrideUserInterfaceStyle:]( self->_navigationController,  "setOverrideUserInterfaceStyle:",  2LL);
    -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 8LL);
    -[UINavigationController setNavigationBarHidden:](self->_navigationController, "setNavigationBarHidden:", 1LL);
    -[CSVSRestrictedAccessViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_navigationController,  1LL,  0LL);
LABEL_22:

    goto LABEL_23;
  }

  if (qword_10002CB08 != -1) {
    dispatch_once(&qword_10002CB08, &stru_100024600);
  }
  v21 = (os_log_s *)qword_10002CB00;
  if (os_log_type_enabled((os_log_t)qword_10002CB00, OS_LOG_TYPE_ERROR))
  {
    sub_100017578((uint64_t)v6, v21);
    if (v6) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v46 = CPSErrorMake(203LL, @"Invalid presentation context");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v46);
    -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v10);
    goto LABEL_22;
  }

  if (!v6) {
    goto LABEL_25;
  }
LABEL_13:
  -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v6);
LABEL_23:
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v7 = (void (**)(void))a4;
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = 0LL;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSRestrictedAccessViewController presentedViewController](self, "presentedViewController"));
  if (v6)
  {
    -[CSVSRestrictedAccessViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v7);
  }

  else if (v7)
  {
    v7[2]();
  }
}

- (CPSViewServicePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (CSVSAuthenticationContainerViewController)authenticationViewController
{
  return self->_authenticationViewController;
}

- (void)setAuthenticationViewController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end