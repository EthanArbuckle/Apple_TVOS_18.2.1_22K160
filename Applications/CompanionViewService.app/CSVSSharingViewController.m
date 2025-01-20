@interface CSVSSharingViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (CSVSAuthenticationContainerViewController)containerViewController;
- (CSVSAuthenticationTransitioningViewController)authenticationViewController;
- (id)_actionForCustomSharingMethod:(id)a3;
- (id)_authenticationActionsForCustomSharingMethods:(id)a3;
- (id)_cancelAction;
- (id)_orderedCustomSharingMethods;
- (id)_titleForCustomSharingMethod:(id)a3;
- (void)_cancelButtonPressed;
- (void)_dismissViewServiceWithResult:(id)a3;
- (void)_dismissWithCancellationReason:(int64_t)a3;
- (void)_dismissWithCustomSharingMethod:(id)a3;
- (void)_handleDeviceAcceptedNotificationMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleDeviceStartedAuthenticationMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleSessionFailedMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_handleSessionFinishedMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_menuButtonPressed;
- (void)setAuthenticationViewController:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation CSVSSharingViewController

- (void)_dismissViewServiceWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSVSSharingViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v5 dismissWithResult:v4];
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

- (void)_menuButtonPressed
{
}

- (void)_cancelButtonPressed
{
}

- (void)_dismissWithCancellationReason:(int64_t)a3
{
  uint64_t v4 = CPSErrorDomain;
  uint64_t v8 = CPSCancellationReasonErrorKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  104LL,  v6));

  -[CSVSSharingViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v7);
}

- (void)_dismissWithCustomSharingMethod:(id)a3
{
  uint64_t v4 = CPSErrorDomain;
  uint64_t v8 = CPSCustomAuthenticationMethodErrorKey;
  id v9 = a3;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  104LL,  v6));

  -[CSVSSharingViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v7);
}

- (id)_orderedCustomSharingMethods
{
  v3[0] = CPSCustomSharingMethodAirDrop;
  v3[1] = CPSCustomSharingMethodSaveToPhotoLibrary;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

- (id)_authenticationActionsForCustomSharingMethods:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSharingViewController _orderedCustomSharingMethods](self, "_orderedCustomSharingMethods"));
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_100013D04;
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
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSharingViewController _cancelAction](self, "_cancelAction"));
    v17 = v9;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  }

  return v8;
}

- (id)_actionForCustomSharingMethod:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSharingViewController _titleForCustomSharingMethod:](self, "_titleForCustomSharingMethod:", v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100013E6C;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100013FB8;
  v6[3] = &unk_100024598;
  objc_copyWeak(&v7, &location);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v3,  0LL,  0LL,  v6));
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

- (id)_titleForCustomSharingMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:CPSCustomSharingMethodAirDrop])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = v4;
    id v6 = @"AIRDROP";
  }

  else
  {
    if (![v3 isEqualToString:CPSCustomSharingMethodSaveToPhotoLibrary])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %@)",  v3));
      goto LABEL_7;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = v4;
    id v6 = @"SAVE_TO_LIBRARY";
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100024BC0 table:0]);

LABEL_7:
  return v7;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  CFTypeID TypeID = CFArrayGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"customSharingMethods", TypeID, 0LL);
  id v24 = (id)objc_claimAutoreleasedReturnValue(TypedValue);
  CFTypeID v7 = CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue(v4, @"customTitleText", v7, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController deviceViewController](v10, "deviceViewController"));
  uint64_t v12 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo),  "initWithAuthType:accountDescription:",  9LL,  0LL);
  [v11 setAuthenticationInfo:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSSharingViewController _authenticationActionsForCustomSharingMethods:]( self,  "_authenticationActionsForCustomSharingMethods:",  v24));
  [v11 setOrderedCustomAuthenticationActions:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration sharingConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "sharingConfiguration"));
  CFTypeID v15 = CFDataGetTypeID();
  uint64_t v16 = CFDictionaryGetTypedValue(v4, @"requestData", v15, 0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = -[UIImage initWithData:](objc_alloc(&OBJC_CLASS___UIImage), "initWithData:", v17);
  [v14 setImage:v18];
  if (v9)
  {
    [v14 setTitleText:v9];
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"SHARE_SCREENSHOT" value:&stru_100024BC0 table:0]);
    [v14 setTitleText:v20];
  }

  v21 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
  -[CSVSAuthenticationContentViewController setConfiguration:](v21, "setConfiguration:", v14);
  -[CSVSAuthenticationContainerViewController setContentViewController:](v10, "setContentViewController:", v21);
  v22 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v22, "setAllowedPressTypes:", &off_100026400);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](v10, "view"));
  [v23 addGestureRecognizer:v22];

  -[CSVSSharingViewController setAuthenticationViewController:](self, "setAuthenticationViewController:", v11);
  -[CSVSSharingViewController setContainerViewController:](self, "setContainerViewController:", v10);
  -[CSVSSharingViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSSharingViewController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    -[CSVSSharingViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v6);
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
  v20 = sub_100014668;
  v21 = &unk_100024928;
  id v7 = a4;
  id v22 = v7;
  uint64_t v8 = objc_retainBlock(&v18);
  uint64_t NSNumber = NSDictionaryGetNSNumber(v6, @"messageType", 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  id v11 = (char *)[v10 integerValue];

  id v12 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(v11 - 1) >= 5) {
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  v11,  v18,  v19,  v20,  v21));
    }
    else {
      uint64_t v13 = off_100024A18[(void)(v11 - 1)];
    }
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received view service message: %@, type: %@",  buf,  0x16u);
  }

  switch((unint64_t)v11)
  {
    case 2uLL:
      -[CSVSSharingViewController _handleDeviceAcceptedNotificationMessage:withReplyHandler:]( self,  "_handleDeviceAcceptedNotificationMessage:withReplyHandler:",  v6,  v8);
      break;
    case 3uLL:
      -[CSVSSharingViewController _handleDeviceStartedAuthenticationMessage:withReplyHandler:]( self,  "_handleDeviceStartedAuthenticationMessage:withReplyHandler:",  v6,  v8);
      break;
    case 4uLL:
      -[CSVSSharingViewController _handleSessionFinishedMessage:withReplyHandler:]( self,  "_handleSessionFinishedMessage:withReplyHandler:",  v6,  v8);
      break;
    case 5uLL:
      -[CSVSSharingViewController _handleSessionFailedMessage:withReplyHandler:]( self,  "_handleSessionFailedMessage:withReplyHandler:",  v6,  v8);
      break;
    default:
      uint64_t v14 = CPSErrorDomain;
      NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
      CFTypeID v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported view service message: %ld",  v11));
      id v24 = v15;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
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

  CFTypeID v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
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

- (CSVSAuthenticationContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end