@interface CSVSLearnMoreViewController
- (CPSViewServicePresentationContext)presentationContext;
- (CSVSAuthenticationContainerViewController)authenticationViewController;
- (id)_menuActions;
- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4;
- (void)_handleDeviceStartedAuthenticationMessage:(id)a3;
- (void)_handleDeviceTappedNotificationMessage:(id)a3;
- (void)_handleSessionFailedMessage:(id)a3;
- (void)_handleSessionFinishedMessage;
- (void)setAuthenticationViewController:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation CSVSLearnMoreViewController

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
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"LEARN_MORE_WITH_QR_CODE" value:&stru_100024BC0 table:0]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100016DC8;
  v12[3] = &unk_100024598;
  objc_copyWeak(&v13, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v4,  0LL,  0LL,  v12));
  -[NSMutableArray addObject:](v2, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100016E1C;
  v10[3] = &unk_100024598;
  objc_copyWeak(&v11, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v7,  0LL,  0LL,  v10));
  -[NSMutableArray addObject:](v2, "addObject:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v2;
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
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 learnMoreRequest]);

      if (v13)
      {
        id v14 = v11;
LABEL_14:

        goto LABEL_15;
      }

      if (a4)
      {
        uint64_t v18 = CPSErrorMake(201LL, @"Missing learn more request");
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
  uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"authType", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  id v7 = [v6 integerValue];

  id v45 = 0LL;
  v8 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue( -[CSVSLearnMoreViewController _presentationContextFromViewServiceOptions:error:]( self,  "_presentationContextFromViewServiceOptions:error:",  v4,  &v45));

  id v9 = v45;
  presentationContext = self->_presentationContext;
  self->_presentationContext = v8;

  if (!self->_presentationContext)
  {
    if (qword_10002CB48 != -1) {
      dispatch_once(&qword_10002CB48, &stru_100024B80);
    }
    v39 = (os_log_s *)qword_10002CB40;
    if (os_log_type_enabled((os_log_t)qword_10002CB40, OS_LOG_TYPE_ERROR))
    {
      sub_100017578((uint64_t)v9, v39);
      if (v9) {
        goto LABEL_7;
      }
    }

    else if (v9)
    {
LABEL_7:
      -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v9);
      goto LABEL_10;
    }

    uint64_t v40 = CPSErrorMake(203LL, @"Invalid presentation context");
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v41);

    goto LABEL_10;
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext learnMoreRequest](self->_presentationContext, "learnMoreRequest"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URL]);

  uint64_t v15 = v14;
  v42 = v14;
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUtilities qrCodeImageForURL:size:]( &OBJC_CLASS___CSVSUtilities,  "qrCodeImageForURL:size:",  v14,  360.0,  360.0));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 host]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v17]);

  v19 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo),  "initWithAuthType:accountDescription:",  v7,  0LL);
  id v43 = v9;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"LEARN_MORE_QR_CODE_TITLE" value:&stru_100024BC0 table:0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"LEARN_MORE_QR_CODE_CAPTION" value:&stru_100024BC0 table:0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v18));
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationInfo infoWithQRCodeImage:qrCodeTitle:qrCodeSubtitle:providerCode:]( v19,  "infoWithQRCodeImage:qrCodeTitle:qrCodeSubtitle:providerCode:",  v44,  v21,  v24,  0LL));

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v26 setAuthenticationInfo:v25];

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSLearnMoreViewController _menuActions](self, "_menuActions"));
  [v27 setOrderedCustomAuthenticationActions:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration learnMoreConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "learnMoreConfiguration"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext learnMoreRequest](self->_presentationContext, "learnMoreRequest"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 titleText]);
  [v29 setTitleText:v31];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext learnMoreRequest](self->_presentationContext, "learnMoreRequest"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 subtitleText]);
  [v29 setBodyText:v33];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext learnMoreRequest](self->_presentationContext, "learnMoreRequest"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 image]);
  [v29 setImage:v35];

  v36 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
  -[CSVSAuthenticationContentViewController setConfiguration:](v36, "setConfiguration:", v29);
  -[CSVSAuthenticationContainerViewController setContentViewController:]( self->_authenticationViewController,  "setContentViewController:",  v36);
  v37 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v37, "setAllowedPressTypes:", &off_100026430);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self->_authenticationViewController, "view"));
  [v38 addGestureRecognizer:v37];

  -[CSVSLearnMoreViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_authenticationViewController,  1LL,  0LL);
  id v9 = v43;

LABEL_10:
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(void))a4;
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = 0LL;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSLearnMoreViewController presentedViewController](self, "presentedViewController"));
  if (v6)
  {
    -[CSVSLearnMoreViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v7);
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

- (void).cxx_destruct
{
}

@end