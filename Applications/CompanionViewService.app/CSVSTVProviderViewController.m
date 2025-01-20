@interface CSVSTVProviderViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (CPSAuthenticationSession)deviceSession;
- (CPSViewServicePresentationContext)presentationContext;
- (CSVSAuthenticationContainerViewController)authenticationViewController;
- (NSString)primaryButtonLabel;
- (NSString)secondaryButtonLabel;
- (NSXPCConnection)buttonHandlerConnection;
- (id)_buttonHandler;
- (id)_contentConfiguration;
- (id)_menuActions;
- (id)_presentationContextFromViewServiceOptions:(id)a3 error:(id *)a4;
- (id)_providerURLDisplayString;
- (id)_providerURLWithQueryParameters;
- (void)_dismissViewServiceWithResult:(id)a3;
- (void)_dismissWithCancellationReason:(int64_t)a3;
- (void)_establishPresenterConnectionWithEndpoint:(id)a3;
- (void)_menuButtonPressed;
- (void)_presentAuthenticationViewController;
- (void)_startDeviceAuthenticationSession;
- (void)setButtonHandlerConnection:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation CSVSTVProviderViewController

- (void)_dismissViewServiceWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
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

  -[CSVSTVProviderViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v7);
}

- (void)_menuButtonPressed
{
}

- (void)_presentAuthenticationViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContainerViewController);
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = v3;

  v24 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentViewController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController _contentConfiguration](self, "_contentConfiguration"));
  -[CSVSAuthenticationContentViewController setConfiguration:](v24, "setConfiguration:", v5);

  -[CSVSAuthenticationContainerViewController setContentViewController:]( self->_authenticationViewController,  "setContentViewController:",  v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSTVProviderViewController _providerURLWithQueryParameters]( self,  "_providerURLWithQueryParameters"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUtilities qrCodeImageForURL:size:]( &OBJC_CLASS___CSVSUtilities,  "qrCodeImageForURL:size:",  v6,  360.0,  360.0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController _providerURLDisplayString](self, "_providerURLDisplayString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tvProviderRequest]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v8 providerCode]);

  v9 = -[CSVSAuthenticationInfo initWithAuthType:accountDescription:]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationInfo),  "initWithAuthType:accountDescription:",  12LL,  0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"TV_PROVIDER_QR_CODE_TITLE" value:&stru_100024BC0 table:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"TV_PROVIDER_QR_CODE_CAPTION" value:&stru_100024BC0 table:0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v22, v23));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationInfo infoWithQRCodeImage:qrCodeTitle:qrCodeSubtitle:providerCode:]( v9,  "infoWithQRCodeImage:qrCodeTitle:qrCodeSubtitle:providerCode:",  v21,  v11,  v14,  v23));

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  [v16 setAuthenticationInfo:v15];

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationContainerViewController deviceViewController]( self->_authenticationViewController,  "deviceViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController _menuActions](self, "_menuActions"));
  [v17 setOrderedCustomAuthenticationActions:v18];

  v19 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v19, "setAllowedPressTypes:", &off_1000263A0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self->_authenticationViewController, "view"));
  [v20 addGestureRecognizer:v19];

  -[CSVSTVProviderViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_authenticationViewController,  1LL,  0LL);
}

- (void)_startDeviceAuthenticationSession
{
  id v3 = objc_alloc_init(&OBJC_CLASS___CPSTVProviderRequest);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tvProviderRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 providerURL]);
  [v3 setProviderURL:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tvProviderRequest]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 providerName]);
  [v3 setProviderName:v9];

  v10 = -[CPSAuthenticationSession initWithRequest:]( objc_alloc(&OBJC_CLASS___CPSAuthenticationSession),  "initWithRequest:",  v3);
  deviceSession = self->_deviceSession;
  self->_deviceSession = v10;

  v12 = self->_deviceSession;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000AD60;
  v22[3] = &unk_100024800;
  objc_copyWeak(&v23, &location);
  -[CPSAuthenticationSession setDeviceAcceptedNotificationHandler:](v12, "setDeviceAcceptedNotificationHandler:", v22);
  v13 = self->_deviceSession;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000AE6C;
  v20[3] = &unk_100024800;
  objc_copyWeak(&v21, &location);
  -[CPSAuthenticationSession setDeviceStartedAuthenticationHandler:](v13, "setDeviceStartedAuthenticationHandler:", v20);
  v14 = self->_deviceSession;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10000AF78;
  v18 = &unk_100024850;
  objc_copyWeak(&v19, &location);
  -[CPSAuthenticationSession setSessionFailedHandler:](v14, "setSessionFailedHandler:", &v15);
  -[CPSAuthenticationSession start](self->_deviceSession, "start", v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (id)_menuActions
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SIGN_IN_USING_QR_CODE" value:&stru_100024BC0 table:0]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000B430;
  v24[3] = &unk_100024598;
  objc_copyWeak(&v25, location);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v5,  0LL,  0LL,  v24));
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  primaryButtonLabel = self->_primaryButtonLabel;
  if (primaryButtonLabel)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000B484;
    v22[3] = &unk_100024598;
    objc_copyWeak(&v23, location);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  primaryButtonLabel,  0LL,  0LL,  v22));
    -[NSMutableArray addObject:](v3, "addObject:", v8);

    objc_destroyWeak(&v23);
  }

  secondaryButtonLabel = self->_secondaryButtonLabel;
  if (secondaryButtonLabel)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000B4C8;
    v20[3] = &unk_100024598;
    objc_copyWeak(&v21, location);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  secondaryButtonLabel,  0LL,  0LL,  v20));
    -[NSMutableArray addObject:](v3, "addObject:", v10);

    objc_destroyWeak(&v21);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"CANCEL" value:&stru_100024BC0 table:0]);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10000B50C;
  v18 = &unk_100024598;
  objc_copyWeak(&v19, location);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v12,  0LL,  0LL,  &v15));
  -[NSMutableArray addObject:](v3, "addObject:", v13, v15, v16, v17, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
  return v3;
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
    id v20 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v10,  v8,  &v20));
    id v12 = v20;

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 tvProviderRequest]);

      if (v13)
      {
        id v14 = v11;
LABEL_14:

        goto LABEL_15;
      }

      if (a4)
      {
        uint64_t v18 = CPSErrorMake(201LL, @"Missing TV Provider configuration");
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

- (id)_contentConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tvProviderRequest]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSAuthenticationContentConfiguration tvProviderConfiguration]( &OBJC_CLASS___CSVSAuthenticationContentConfiguration,  "tvProviderConfiguration"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TV_PROVIDER_TITLE" value:&stru_100024BC0 table:0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 providerName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));
  [v4 setTitleText:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 providerImage]);
  [v4 setImage:v9];

  return v4;
}

- (id)_providerURLWithQueryParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tvProviderRequest]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 providerURL]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tvProviderRequest]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 providerCode]);

  if (v5
    && (uint64_t v9 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v5,  0LL)) != 0LL)
  {
    v10 = v9;
    v28 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v9, "queryItems"));
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v10, "queryItems"));
      v13 = (NSMutableArray *)[v12 mutableCopy];
    }

    else
    {
      v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v15 = v13;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      while (2)
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
          unsigned __int8 v22 = [v21 isEqualToString:@"code"];

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 value]);
          unsigned __int8 v24 = [v23 isEqualToString:v8];

          if ((v22 & 1) != 0 || (v24 & 1) != 0)
          {
            id v25 = v15;
            goto LABEL_18;
          }
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v25 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"code",  v8);
    -[NSMutableArray addObject:](v15, "addObject:", v25);
    id v26 = -[NSMutableArray copy](v15, "copy");
    -[NSURLComponents setQueryItems:](v10, "setQueryItems:", v26);

LABEL_18:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v10, "URL"));

    id v5 = v28;
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (id)_providerURLDisplayString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentationContext](self, "presentationContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tvProviderRequest]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 providerURL]);

  if (v4)
  {
    id v5 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v4,  0LL);
    uint64_t v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents host](v5, "host"));
      if (v7) {
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue([&stru_100024BC0 stringByAppendingString:v7]);
      }
      else {
        uint64_t v8 = &stru_100024BC0;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents port](v6, "port"));
      if ((uint64_t)[v11 integerValue] >= 1)
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", @":%@", v11));

        uint64_t v8 = (__CFString *)v12;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents path](v6, "path"));
      if (!v13) {
        goto LABEL_22;
      }
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v13));
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 resourceSpecifier]);
      v7 = v9;
      if (!v9)
      {
        uint64_t v8 = &stru_100024BC0;
LABEL_24:

        goto LABEL_25;
      }

      else {
        v10 = v7;
      }
      uint64_t v8 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsSeparatedByString:](v10, "componentsSeparatedByString:", @"?"));
      if ((unint64_t)[v11 count] < 2)
      {
LABEL_23:

        goto LABEL_24;
      }

      uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 firstObject]);
      v13 = (void *)v15;
      if (v15) {
        id v16 = (void *)v15;
      }
      else {
        id v16 = v8;
      }
      id v14 = v16;
    }

    id v17 = v14;

    uint64_t v8 = v17;
LABEL_22:

    goto LABEL_23;
  }

  uint64_t v8 = &stru_100024BC0;
LABEL_25:

  return v8;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BE30();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting TV provider sheet: %@", buf, 0xCu);
  }

  id v25 = 0LL;
  v7 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue( -[CSVSTVProviderViewController _presentationContextFromViewServiceOptions:error:]( self,  "_presentationContextFromViewServiceOptions:error:",  v4,  &v25));
  id v8 = v25;
  presentationContext = self->_presentationContext;
  self->_presentationContext = v7;

  if (self->_presentationContext)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:PBSUPRDialogXPCListenerEndpointKey]);
    -[CSVSTVProviderViewController _establishPresenterConnectionWithEndpoint:]( self,  "_establishPresenterConnectionWithEndpoint:",  v10);

    v11 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"primaryButtonLabel"]);
    primaryButtonLabel = self->_primaryButtonLabel;
    self->_primaryButtonLabel = v11;

    v13 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"secondaryButtonLabel"]);
    secondaryButtonLabel = self->_secondaryButtonLabel;
    self->_secondaryButtonLabel = v13;

    -[CSVSTVProviderViewController _presentAuthenticationViewController](self, "_presentAuthenticationViewController");
    -[CSVSTVProviderViewController _startDeviceAuthenticationSession](self, "_startDeviceAuthenticationSession");
  }

  else
  {
    id v15 = sub_10000BE30();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000175EC((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
    }

    if (v8)
    {
      -[CSVSTVProviderViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v8);
    }

    else
    {
      uint64_t v23 = CPSErrorMake(203LL, @"Invalid presentation context");
      unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[CSVSTVProviderViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v24);
    }
  }
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  -[CPSAuthenticationSession cancel](self->_deviceSession, "cancel");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    -[CSVSTVProviderViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v6);
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
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___NSXPCListenerEndpoint);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, v5, v7, v9, v11, 0LL));

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  [v13 setClasses:v12 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v13 setClasses:v12 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];
  [v13 setClasses:v12 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:0];

  return v13;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (id)_buttonHandler
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_buttonHandlerConnection,  "remoteObjectProxyWithErrorHandler:",  &stru_100024890);
}

- (void)_establishPresenterConnectionWithEndpoint:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v4);

    buttonHandlerConnection = self->_buttonHandlerConnection;
    self->_buttonHandlerConnection = v5;

    v7 = self->_buttonHandlerConnection;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPSTVProviderButtonHandlingInterface handlerInterface]( &OBJC_CLASS___CPSTVProviderButtonHandlingInterface,  "handlerInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](self->_buttonHandlerConnection, "resume");
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSVSTVProviderViewController _buttonHandler](self, "_buttonHandler"));
    [v9 establishConnection];
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

- (NSXPCConnection)buttonHandlerConnection
{
  return self->_buttonHandlerConnection;
}

- (void)setButtonHandlerConnection:(id)a3
{
}

- (NSString)primaryButtonLabel
{
  return self->_primaryButtonLabel;
}

- (NSString)secondaryButtonLabel
{
  return self->_secondaryButtonLabel;
}

- (void).cxx_destruct
{
}

@end