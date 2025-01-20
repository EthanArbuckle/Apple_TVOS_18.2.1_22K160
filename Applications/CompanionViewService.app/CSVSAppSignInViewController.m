@interface CSVSAppSignInViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (CSVSAuthenticationTransitioningViewController)authenticationViewController;
- (id)_accountDescription;
- (id)_actionForCustomAuthenticationMethod:(id)a3;
- (id)_appIconImage;
- (id)_appSignInTitle;
- (id)_authenticationActionsForCustomAuthenticationMethods:(id)a3;
- (id)_cancelAction;
- (id)_orderedCustomAuthenticationMethods;
- (id)_titleForCustomAuthenticationMethod:(id)a3;
- (void)_cancelButtonPressed;
- (void)_dismissViewServiceWithResult:(id)a3;
- (void)_dismissWithCancellationReason:(int64_t)a3;
- (void)_dismissWithCustomAuthenticationMethod:(id)a3;
- (void)_handleDeviceAcceptedNotificationMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleDeviceStartedAuthenticationMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleFetchAppIconMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleSessionFailedMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleSessionFinishedMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_menuButtonPressed;
- (void)setAuthenticationViewController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation CSVSAppSignInViewController

- (void)_dismissViewServiceWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v5 dismissWithResult:v4];
}

- (void)_handleFetchAppIconMessage:(id)a3 withReplyHandler:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController _appIconImage](self, "_appIconImage"));
  v6 = UIImageJPEGRepresentation(v9, 0.75);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v8 setObject:v7 forKeyedSubscript:@"appIconData"];
  [v8 setObject:&off_100026448 forKeyedSubscript:@"appIconScale"];
  v5[2](v5, v8, 0LL);
}

- (void)_handleDeviceAcceptedNotificationMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[CSVSBaseViewController deviceFromViewServiceMessage:]( &OBJC_CLASS___CSVSBaseViewController,  "deviceFromViewServiceMessage:",  a3));
  -[CSVSAuthenticationTransitioningViewController performTappedNotificationTransitionWithDevice:]( self->_authenticationViewController,  "performTappedNotificationTransitionWithDevice:",  v7);
  (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
}

- (void)_handleDeviceStartedAuthenticationMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[CSVSBaseViewController deviceFromViewServiceMessage:]( &OBJC_CLASS___CSVSBaseViewController,  "deviceFromViewServiceMessage:",  a3));
  -[CSVSAuthenticationTransitioningViewController performStartedAuthenticationWithDevice:]( self->_authenticationViewController,  "performStartedAuthenticationWithDevice:",  v7);
  (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
}

- (void)_handleSessionFinishedMessage:(id)a3 withReplyHandler:(id)a4
{
  authenticationViewController = self->_authenticationViewController;
  id v5 = a4;
  -[CSVSAuthenticationTransitioningViewController performSessionCompletedTransitionWithError:]( authenticationViewController,  "performSessionCompletedTransitionWithError:",  0LL);
  (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
}

- (void)_handleSessionFailedMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSError);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t ValueOfClass = NSDictionaryGetValueOfClass(v7, @"error", v9, 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(ValueOfClass);

  if (v11)
  {
    id v12 = v11;
  }

  else
  {
    uint64_t v13 = CPSErrorDomain;
    NSErrorUserInfoKey v15 = NSDebugDescriptionErrorKey;
    v16 = @"The session failed but no error was provided.";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  100LL,  v14));
  }

  -[CSVSAuthenticationTransitioningViewController performSessionCompletedTransitionWithError:]( self->_authenticationViewController,  "performSessionCompletedTransitionWithError:",  v12);
  (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
}

- (id)_appIconImage
{
  return +[UIImage tvsui_applicationIconImageForBundleIdentifier:]( &OBJC_CLASS___UIImage,  "tvsui_applicationIconImageForBundleIdentifier:",  self->_applicationBundleIdentifier);
}

- (void)_menuButtonPressed
{
}

- (void)_cancelButtonPressed
{
}

- (id)_accountDescription
{
  return -[ACAccount username](self->_authKitAccount, "username");
}

- (id)_appSignInTitle
{
  id v2 = [[LSApplicationRecord alloc] initWithBundleIdentifier:self->_applicationBundleIdentifier allowPlaceholder:0 error:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"SIGN_IN_PROMPT" value:&stru_100024BC0 table:0]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v4, v5));

  return v6;
}

- (void)_dismissWithCancellationReason:(int64_t)a3
{
  uint64_t v4 = CPSErrorDomain;
  uint64_t v8 = CPSCancellationReasonErrorKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  104LL,  v6));

  -[CSVSAppSignInViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v7);
}

- (void)_dismissWithCustomAuthenticationMethod:(id)a3
{
  uint64_t v4 = CPSErrorDomain;
  uint64_t v8 = CPSCustomAuthenticationMethodErrorKey;
  id v9 = a3;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  104LL,  v6));

  -[CSVSAppSignInViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v7);
}

- (id)_orderedCustomAuthenticationMethods
{
  v3[0] = CPSCustomAuthenticationMethodOther;
  v3[1] = CPSCustomAuthenticationMethodVideoSubscriberAccount;
  v3[2] = CPSCustomAuthenticationMethodRestorePurchase;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

- (id)_authenticationActionsForCustomAuthenticationMethods:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAppSignInViewController _orderedCustomAuthenticationMethods]( self,  "_orderedCustomAuthenticationMethods"));
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_10000CB04;
  v14 = &unk_1000248D8;
  id v6 = v4;
  id v15 = v6;
  v16 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_mapNoNulls:", &v11));

  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
  {
    id v8 = v7;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController _cancelAction](self, "_cancelAction"));
    v17 = v9;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  }

  return v8;
}

- (id)_actionForCustomAuthenticationMethod:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAppSignInViewController _titleForCustomAuthenticationMethod:]( self,  "_titleForCustomAuthenticationMethod:",  v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000CC6C;
  v9[3] = &unk_100024900;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v5,  0LL,  0LL,  v9));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)_cancelAction
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CDB8;
  v6[3] = &unk_100024598;
  objc_copyWeak(&v7, &location);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v3,  0LL,  0LL,  v6));
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

- (id)_titleForCustomAuthenticationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:CPSCustomAuthenticationMethodOther])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = v4;
    id v6 = @"SIGN_IN_MANUALLY";
  }

  else if ([v3 isEqualToString:CPSCustomAuthenticationMethodRestorePurchase])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = v4;
    id v6 = @"RESTORE_PURCHASE";
  }

  else
  {
    if (![v3 isEqualToString:CPSCustomAuthenticationMethodVideoSubscriberAccount])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %@)",  v3));
      goto LABEL_8;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = v4;
    id v6 = @"SIGN_IN_WITH_TV_PROVIDER";
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100024BC0 table:0]);

LABEL_8:
  return v7;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v32 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  id v5 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v32, @"appBundleID", TypeID, 0), "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v5;

  CFTypeID v7 = CFDataGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v32, @"accountData", v7, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v9)
  {
    uint64_t v10 = objc_opt_self(&OBJC_CLASS___ACAccount);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (ACAccount *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v11,  v9,  0LL));
    authKitAccount = self->_authKitAccount;
    self->_authKitAccount = v12;
  }

  CFTypeID v14 = CFArrayGetTypeID();
  uint64_t v15 = CFDictionaryGetTypedValue(v32, @"customAuthenticationMethods", v14, 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t NSNumber = NSDictionaryGetNSNumber(v32, @"authType", 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  id v19 = [v18 integerValue];

  v20 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController deviceViewController](v20, "deviceViewController"));
  v22 = objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController _accountDescription](self, "_accountDescription"));
  v24 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( v22,  "initWithAuthType:accountDescription:",  v19,  v23);
  [v21 setAuthenticationInfo:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAppSignInViewController _authenticationActionsForCustomAuthenticationMethods:]( self,  "_authenticationActionsForCustomAuthenticationMethods:",  v16));
  [v21 setOrderedCustomAuthenticationActions:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration appSignInConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "appSignInConfiguration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController _appIconImage](self, "_appIconImage"));
  [v26 setImage:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController _appSignInTitle](self, "_appSignInTitle"));
  [v26 setTitleText:v28];

  v29 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
  -[CSVSAuthenticationContentViewController setConfiguration:](v29, "setConfiguration:", v26);
  -[CSVSAuthenticationContainerViewController setContentViewController:](v20, "setContentViewController:", v29);
  v30 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v30, "setAllowedPressTypes:", &off_1000263B8);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](v20, "view"));
  [v31 addGestureRecognizer:v30];

  -[CSVSAppSignInViewController setAuthenticationViewController:](self, "setAuthenticationViewController:", v21);
  -[CSVSAppSignInViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v20,  1LL,  0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAppSignInViewController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    -[CSVSAppSignInViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v6);
  }

  else if (v6)
  {
    v6[2]();
  }
}

- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_10000D4FC;
  v21 = &unk_100024928;
  id v7 = a4;
  id v22 = v7;
  id v8 = objc_retainBlock(&v18);
  uint64_t NSNumber = NSDictionaryGetNSNumber(v6, @"messageType", 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  id v11 = (char *)[v10 integerValue];

  id v12 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(v11 - 1) >= 5) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  v11,  v18,  v19,  v20,  v21));
    }
    else {
      uint64_t v13 = *(&off_100024948 + (void)(v11 - 1));
    }
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received view service message: %@, type: %@",  buf,  0x16u);
  }

  switch((unint64_t)v11)
  {
    case 1uLL:
      -[CSVSAppSignInViewController _handleFetchAppIconMessage:withReplyHandler:]( self,  "_handleFetchAppIconMessage:withReplyHandler:",  v6,  v8);
      break;
    case 2uLL:
      -[CSVSAppSignInViewController _handleDeviceAcceptedNotificationMessage:withReplyHandler:]( self,  "_handleDeviceAcceptedNotificationMessage:withReplyHandler:",  v6,  v8);
      break;
    case 3uLL:
      -[CSVSAppSignInViewController _handleDeviceStartedAuthenticationMessage:withReplyHandler:]( self,  "_handleDeviceStartedAuthenticationMessage:withReplyHandler:",  v6,  v8);
      break;
    case 4uLL:
      -[CSVSAppSignInViewController _handleSessionFinishedMessage:withReplyHandler:]( self,  "_handleSessionFinishedMessage:withReplyHandler:",  v6,  v8);
      break;
    case 5uLL:
      -[CSVSAppSignInViewController _handleSessionFailedMessage:withReplyHandler:]( self,  "_handleSessionFailedMessage:withReplyHandler:",  v6,  v8);
      break;
    default:
      uint64_t v14 = CPSErrorDomain;
      NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported view service message: %ld",  v11));
      v24 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  101LL,  v16));
      ((void (*)(void ***, void, void *))v8[2])(v8, 0LL, v17);

      break;
  }
}

+ (id)_exportedInterface
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___NSDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___NSArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSNumber);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___NSError);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = objc_opt_self(&OBJC_CLASS___NSData);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, v5, v7, v9, v11, v13, 0LL));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  [v15 setClasses:v14 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v15 setClasses:v14 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];
  [v15 setClasses:v14 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:0];

  return v15;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (CSVSAuthenticationTransitioningViewController)authenticationViewController
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