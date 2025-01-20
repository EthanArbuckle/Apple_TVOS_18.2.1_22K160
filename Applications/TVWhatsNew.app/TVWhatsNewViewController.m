@interface TVWhatsNewViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TVWhatsNewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_executeRemoteMethod:(id)a3 completion:(id)a4;
- (void)_handleDismissNotification:(id)a3;
- (void)_loadWithBootURL:(id)a3;
- (void)_markAsSeenAndDismiss;
- (void)_presetLaunchErrorDialog;
- (void)_setupContentViewWithAppCntroller:(id)a3;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation TVWhatsNewViewController

- (TVWhatsNewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVWhatsNewViewController;
  v8 = -[TVWhatsNewViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v8 selector:"_handleDismissNotification:" name:@"TVWhatsNewViewControllerDismissNotification" object:0];

    v10 = -[TVStoreApplicationSetupHelper initWithDefaultBootURL:]( objc_alloc(&OBJC_CLASS___TVStoreApplicationSetupHelper),  "initWithDefaultBootURL:",  0LL);
    setupHelper = v8->_setupHelper;
    v8->_setupHelper = v10;

    objc_initWeak(&location, v8);
    v12 = v8->_setupHelper;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000027E0;
    v14[3] = &unk_100008338;
    objc_copyWeak(&v15, &location);
    -[TVStoreApplicationSetupHelper obtainBootURLWithCompletion:](v12, "obtainBootURLWithCompletion:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVWhatsNewViewController;
  -[TVWhatsNewViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS____TVWNStyleView);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  v5 = -[_TVWNStyleView initWithFrame:](v3, "initWithFrame:");

  -[TVWhatsNewViewController setView:](self, "setView:", v5);
}

- (void)_setupContentViewWithAppCntroller:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 navigationController]);
  -[TVWhatsNewViewController addChildViewController:](self, "addChildViewController:", v8);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v6 addSubview:v7];
}

- (void)_presetLaunchErrorDialog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"WhatsNewLaunchFailureTitle" value:&stru_100008520 table:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"WhatsNewLaunchFailureBody" value:&stru_100008520 table:0]);
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"OK" value:&stru_100008520 table:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  &stru_100008378));

  [v10 addAction:v9];
  -[TVWhatsNewViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
}

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppController Did Launch",  v10,  2u);
  }

  messageReplyBlock = (void (**)(void))self->_messageReplyBlock;
  if (messageReplyBlock)
  {
    messageReplyBlock[2]();
    id v9 = self->_messageReplyBlock;
    self->_messageReplyBlock = 0LL;
  }
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v4 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Evaluate JS", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IKAppContext currentAppContext](&OBJC_CLASS___IKAppContext, "currentAppContext"));
  id v6 = [[IKJSITunesStore alloc] initWithAppContext:v5];
  [v4 setObject:v6 forKeyedSubscript:@"itms"];

  id v7 = -[TVWMAppUtilities initWithAppContext:](objc_alloc(&OBJC_CLASS___TVWMAppUtilities), "initWithAppContext:", v5);
  [v4 setObject:v7 forKeyedSubscript:@"appUtilities"];
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000465C((uint64_t)v7);
  }
  messageReplyBlock = (void (**)(void))self->_messageReplyBlock;
  if (messageReplyBlock)
  {
    messageReplyBlock[2]();
    id v9 = self->_messageReplyBlock;
    self->_messageReplyBlock = 0LL;
  }

  else
  {
    -[TVWhatsNewViewController _presetLaunchErrorDialog](self, "_presetLaunchErrorDialog");
  }
}

- (void)_loadWithBootURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loading WN with boot URL: %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVStoreApplicationSetupHelper launchContextWithLaunchOptions:bootURL:appLocalBootURL:]( &OBJC_CLASS___TVStoreApplicationSetupHelper,  "launchContextWithLaunchOptions:bootURL:appLocalBootURL:",  0LL,  v4,  0LL));
    id v6 = -[TVApplicationController initWithContext:window:delegate:]( objc_alloc(&OBJC_CLASS___TVApplicationController),  "initWithContext:window:delegate:",  v5,  0LL,  self);
    appController = self->_appController;
    self->_appController = v6;

    id v8 = self->_appController;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
    -[TVApplicationController setKeyTraitEnvironment:](v8, "setKeyTraitEnvironment:", v9);

    -[TVWhatsNewViewController _setupContentViewWithAppCntroller:]( self,  "_setupContentViewWithAppCntroller:",  self->_appController);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000046D8();
    }
    -[TVWhatsNewViewController _presetLaunchErrorDialog](self, "_presetLaunchErrorDialog");
  }
}

- (void)_handleDismissNotification:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Asking client to dimiss What's New VC",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v4 dismissWithResult:0];
}

- (void)_markAsSeenAndDismiss
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Asking JS to mark as seen and dimiss What's New VC",  v3,  2u);
  }

  -[TVWhatsNewViewController _executeRemoteMethod:completion:]( self,  "_executeRemoteMethod:completion:",  @"onDismissExternally",  0LL);
}

- (void)_executeRemoteMethod:(id)a3 completion:(id)a4
{
  id v6 = a3;
  appController = self->_appController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000030C4;
  v9[3] = &unk_1000083A0;
  id v10 = v6;
  id v8 = v6;
  -[TVApplicationController evaluateInJavaScriptContext:completion:]( appController,  "evaluateInJavaScriptContext:completion:",  v9,  a4);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Presenting What's New VC",  v20,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TVWNServiceOptionShouldShowWallpaperKey"]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  1LL));
    [v7 setAutoresizingMask:18];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
    [v8 addSubview:v7];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
    [v9 sendSubviewToBack:v7];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TVWNServiceOptionShouldDismissOnMenuEventKey"]);
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_markAsSeenAndDismiss");
    -[UITapGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", &off_1000087C8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
    [v13 addGestureRecognizer:v12];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TVWNServiceOptionUserInterfaceStyleKey"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) != 0)
  {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TVWNServiceOptionUserInterfaceStyleKey"]);
    id v18 = [v17 integerValue];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVWhatsNewViewController view](self, "view"));
    [v19 setStyle:v18];
    -[TVWhatsNewViewController setNeedsUserInterfaceAppearanceUpdate](self, "setNeedsUserInterfaceAppearanceUpdate");
  }
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void (**)(void))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Ending What's New VC",  v7,  2u);
  }

  if (v6) {
    v6[2](v6);
  }
}

- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100003470;
  v13 = &unk_100008418;
  v14 = self;
  id v5 = a4;
  id v15 = v5;
  unsigned int v6 = objc_retainBlock(&v10);
  id v7 = v6;
  if (self->_appController)
  {
    ((void (*)(void ***))v6[2])(v6);
  }

  else
  {
    id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);
    id messageReplyBlock = self->_messageReplyBlock;
    self->_id messageReplyBlock = v8;
  }
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TVWNViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  unsigned int v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v2 setClasses:v7 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v7 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v7 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TVWNViewServiceInterface));
  uint64_t v3 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setClasses:v4 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void).cxx_destruct
{
}

@end