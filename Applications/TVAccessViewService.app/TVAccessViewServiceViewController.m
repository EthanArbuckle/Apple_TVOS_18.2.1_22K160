@interface TVAccessViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_menuPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVAccessViewServiceViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVAccessViewServiceViewController;
  -[TVAccessViewServiceViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_100004290);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAccessViewServiceViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_100002EC4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TVAccessViewServiceViewController: Options %@",  buf,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:WLKViewServiceAppBundlesKey]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:WLKViewServiceAccountNameKey]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    v12 = v10;
  }
  else {
    v12 = &stru_1000041F8;
  }
  v19[0] = VUIAccessOptionsAccountKey;
  v19[1] = VUIAccessOptionsShouldDenyOnCancelKey;
  v20[0] = v12;
  v20[1] = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  objc_initWeak((id *)buf, self);
  v14 = objc_alloc(&OBJC_CLASS___VUIAccessViewController);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000325C;
  v17[3] = &unk_1000041D8;
  objc_copyWeak(&v18, (id *)buf);
  v15 = -[VUIAccessViewController initWithBundleIDs:options:completionHandler:]( v14,  "initWithBundleIDs:options:completionHandler:",  v9,  v13,  v17);
  accessViewController = self->_accessViewController;
  self->_accessViewController = v15;

  -[TVAccessViewServiceViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_accessViewController,  1LL,  0LL);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v2 setClasses:v7 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v7 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface));
  uint64_t v3 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setClasses:v4 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void)_menuPressed:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVAccessViewServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  [v3 dismissWithResult:&off_100004270];
}

- (void).cxx_destruct
{
}

@end