@interface TVRestrictionPINServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (NSNumber)dismissResult;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVRestrictionPINServiceViewController

- (void)viewDidLoad
{
  v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVRestrictionPINServiceViewController;
  -[TVRestrictionPINServiceViewController viewDidLoad](&v13, "viewDidLoad");
  objc_initWeak(&location, v15);
  v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  uint64_t v5 = UIPresentationControllerDismissalTransitionDidEndNotification;
  id v3 = -[TVRestrictionPINServiceViewController presentedViewController](v15, "presentedViewController");
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_100001294;
  v10 = &unk_100004228;
  objc_copyWeak(v11, &location);
  id v2 =  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( v4,  "addObserverForName:object:queue:usingBlock:",  v5,  v3,  0LL,  &v6);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  SEL v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVRestrictionPINServiceViewController view](v14, "view");
  id v3 = [v4 window];
  [v3 makeKeyWindow];

  objc_initWeak(&v12, v14);
  uint64_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_1000015C0;
  v9 = &unk_100004250;
  objc_copyWeak(&v10, &v12);
  id v11 =  +[TVSUIRestrictionsPasscodeEntryViewController restrictionsPasscodeEntryViewControllerWithCompletion:]( &OBJC_CLASS___TVSUIRestrictionsPasscodeEntryViewController,  "restrictionsPasscodeEntryViewControllerWithCompletion:",  &v5);
  [v11 setOverrideUserInterfaceStyle:2];
  [v11 setModalPresentationStyle:8];
  -[TVRestrictionPINServiceViewController presentViewController:animated:completion:]( v14,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVRestrictionPINServiceViewController dismissViewControllerAnimated:completion:]( v7,  "dismissViewControllerAnimated:completion:",  1LL,  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v10 = v16;
  v16[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  int v6 = &OBJC_CLASS___NSSet;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = 0LL;
  id v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id location = (id *)&v15;
  v15 = v2;
  SEL v14 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v16[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  objc_super v13 = "viewServiceEndPresentationWithOptions:completion:";
  [v16[0] setClasses:v15 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v7 ofReply:v8 & 1];
  id v12 = v16[0];
  objc_storeStrong(location, v11);
  objc_storeStrong(v10, v11);
  return v12;
}

+ (id)_remoteViewControllerInterface
{
  v11[2] = a1;
  v11[1] = (id)a2;
  int v6 = v11;
  v11[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  uint64_t v4 = &OBJC_CLASS___NSSet;
  id obj = 0LL;
  id v2 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  id location = (id *)&v10;
  id v10 = v2;
  v9 = "dismissWithResult:";
  [v11[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v11[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (NSNumber)dismissResult
{
  return self->_dismissResult;
}

- (void).cxx_destruct
{
}

@end