@interface CSVSPaymentSheetViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (CPSAuthenticationSession)deviceSession;
- (CPSViewServicePresentationContext)presentationContext;
- (CSVSAuthenticationContainerViewController)authenticationViewController;
- (id)_accountDescription;
- (id)_menuActions;
- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4;
- (void)_dismissViewServiceWithResult:(id)a3;
- (void)_dismissWithCancellationReason:(int64_t)a3;
- (void)_dismissWithPurchaseResult:(id)a3;
- (void)_menuButtonPressed;
- (void)_presentAuthenticationViewController;
- (void)_startDeviceAuthenticationSession;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation CSVSPaymentSheetViewController

- (void)_dismissViewServiceWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSVSPaymentSheetViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v5 dismissWithResult:v4];
}

- (void)_dismissWithCancellationReason:(int64_t)a3
{
  uint64_t v4 = CPSErrorDomain;
  uint64_t v8 = CPSCancellationReasonErrorKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  104LL,  v6));

  -[CSVSPaymentSheetViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v7);
}

- (void)_dismissWithPurchaseResult:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  0LL));
  -[CSVSPaymentSheetViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v4);
}

- (void)_menuButtonPressed
{
}

- (void)_presentAuthenticationViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = v3;

  id v5 = objc_alloc(&OBJC_CLASS___AMSUIPaymentSheetPurchaseInfoViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext paymentRequest](self->_presentationContext, "paymentRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext paymentContext](self->_presentationContext, "paymentContext"));
  id v16 = [v5 initWithPaymentRequest:v6 paymentContext:v7];

  -[CSVSAuthenticationContainerViewController setContentViewController:]( self->_authenticationViewController,  "setContentViewController:",  v16);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSPaymentSheetViewController _accountDescription](self, "_accountDescription"));
  v10 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( v8,  "initWithAuthType:accountDescription:",  1LL,  v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v11 setAuthenticationInfo:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSPaymentSheetViewController _menuActions](self, "_menuActions"));
  [v12 setOrderedCustomAuthenticationActions:v13];

  v14 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v14, "setAllowedPressTypes:", &off_1000263E8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self->_authenticationViewController, "view"));
  [v15 addGestureRecognizer:v14];

  -[CSVSPaymentSheetViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_authenticationViewController,  1LL,  0LL);
}

- (void)_startDeviceAuthenticationSession
{
  id v3 = objc_alloc_init(&OBJC_CLASS___CPSStorePurchaseRequest);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CPSViewServicePresentationContext delegatePurchaseRequest]( self->_presentationContext,  "delegatePurchaseRequest"));
  [v3 setPurchaseRequest:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext storeAccount](self->_presentationContext, "storeAccount"));
  [v3 setAccount:v5];

  v6 = -[CPSAuthenticationSession initWithRequest:]( objc_alloc(&OBJC_CLASS___CPSAuthenticationSession),  "initWithRequest:",  v3);
  deviceSession = self->_deviceSession;
  self->_deviceSession = v6;

  uint64_t v8 = self->_deviceSession;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000E7CC;
  v18[3] = &unk_100024800;
  objc_copyWeak(&v19, &location);
  -[CPSAuthenticationSession setDeviceAcceptedNotificationHandler:](v8, "setDeviceAcceptedNotificationHandler:", v18);
  v9 = self->_deviceSession;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000E8D8;
  v16[3] = &unk_100024800;
  objc_copyWeak(&v17, &location);
  -[CPSAuthenticationSession setDeviceStartedAuthenticationHandler:](v9, "setDeviceStartedAuthenticationHandler:", v16);
  v10 = self->_deviceSession;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000E9E4;
  v14[3] = &unk_100024998;
  objc_copyWeak(&v15, &location);
  -[CPSAuthenticationSession setSessionFinishedHandler:](v10, "setSessionFinishedHandler:", v14);
  v11 = self->_deviceSession;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000EBD4;
  v12[3] = &unk_100024850;
  objc_copyWeak(&v13, &location);
  -[CPSAuthenticationSession setSessionFailedHandler:](v11, "setSessionFailedHandler:", v12);
  -[CPSAuthenticationSession start](self->_deviceSession, "start");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (id)_accountDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPSViewServicePresentationContext storeAccount](self->_presentationContext, "storeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 username]);

  return v3;
}

- (id)_menuActions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"CONFIRM_WITH_PASSWORD" value:&stru_100024BC0 table:0]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F078;
  v15[3] = &unk_100024598;
  objc_copyWeak(&v16, &location);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v3,  0LL,  0LL,  v15));
  v18[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10000F0C4;
  id v13 = &unk_100024598;
  objc_copyWeak(&v14, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v6,  0LL,  0LL,  &v10));
  v18[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v18,  2LL,  v10,  v11,  v12,  v13));

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v8;
}

- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSData);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"presentationContextData", v7));

  if (v8)
  {
    uint64_t v9 = objc_opt_self(&OBJC_CLASS___CPSViewServicePresentationContext);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v24 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v10,  v8,  &v24));
    id v12 = v24;

    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 delegatePurchaseRequest]);

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentRequest]);

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 storeAccount]);

          if (v15)
          {
            id v16 = v11;
LABEL_21:

            goto LABEL_22;
          }

          if (a4)
          {
            v20 = @"Missing store account";
            uint64_t v21 = 200LL;
            goto LABEL_18;
          }

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000F464();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting payment sheet: %@", buf, 0xCu);
  }

  id v14 = 0LL;
  v7 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue( -[CSVSPaymentSheetViewController _presentationContextFromViewServiceOptions:error:]( self,  "_presentationContextFromViewServiceOptions:error:",  v4,  &v14));
  id v8 = v14;
  presentationContext = self->_presentationContext;
  self->_presentationContext = v7;

  if (self->_presentationContext)
  {
    -[CSVSPaymentSheetViewController _presentAuthenticationViewController](self, "_presentAuthenticationViewController");
    -[CSVSPaymentSheetViewController _startDeviceAuthenticationSession](self, "_startDeviceAuthenticationSession");
  }

  else
  {
    id v10 = sub_10000F464();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100017578((uint64_t)v8, v11);
    }

    if (v8)
    {
      -[CSVSPaymentSheetViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v8);
    }

    else
    {
      uint64_t v12 = CPSErrorMake(203LL, @"Invalid presentation context");
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[CSVSPaymentSheetViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v13);
    }
  }
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  -[CPSAuthenticationSession cancel](self->_deviceSession, "cancel");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSPaymentSheetViewController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    -[CSVSPaymentSheetViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v6);
  }

  else if (v6)
  {
    v6[2]();
  }
}

+ (id)_exportedInterface
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___NSDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___NSNumber);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSData);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, v5, v7, v9, 0LL));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  [v11 setClasses:v10 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v10 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v10 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:0];

  return v11;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (CPSViewServicePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (CPSAuthenticationSession)deviceSession
{
  return self->_deviceSession;
}

- (CSVSAuthenticationContainerViewController)authenticationViewController
{
  return self->_authenticationViewController;
}

- (void).cxx_destruct
{
}

@end