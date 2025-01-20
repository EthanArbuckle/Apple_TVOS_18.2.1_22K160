@interface TVProfileConfirmMatchRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVProfileConfirmMatchRemoteViewController

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVProfileConfirmMatchRemoteViewController view](v37, "view");
  id v4 = [v5 window];
  [v4 makeKeyWindow];

  id v35 = [location[0] objectForKeyedSubscript:@"AppName"];
  id v34 = [location[0] objectForKeyedSubscript:@"ProfileName"];
  id v33 = [location[0] objectForKeyedSubscript:@"UserName"];
  v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"ConfirmMatchTitle");
  v32 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:");

  v9 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v8 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"ConfirmMatchMessage",  &stru_1000084D0,  0LL);
  v31 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v35, v34, v33);

  v3 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  v30 = -[TVSUITextAlertController initWithTitle:text:](v3, "initWithTitle:text:", v32, v31);
  id v29 = -[TVProfileConfirmMatchRemoteViewController _remoteViewControllerProxy](v37, "_remoteViewControllerProxy");
  v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"ConfirmMatchMatchButton",  &stru_1000084D0,  0LL);
  v28 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:");

  v12 = v28;
  v21[1] = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_100002FD4;
  v25 = &unk_100008418;
  id v26 = v29;
  v27 =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v12,  0LL);
  -[TVSUITextAlertController addButton:](v30, "addButton:", v27);
  v14 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v13 =  -[NSBundle localizedStringForKey:value:table:]( v14,  "localizedStringForKey:value:table:",  @"ConfirmMatchNotNowButton",  &stru_1000084D0,  0LL);
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_10000300C;
  v19 = &unk_100008418;
  id v20 = v29;
  v21[0] =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v13,  2LL);

  -[TVSUITextAlertController addButton:](v30, "addButton:", v21[0]);
  -[TVProfileConfirmMatchRemoteViewController presentViewController:animated:completion:]( v37,  "presentViewController:animated:completion:",  v30,  1LL,  0LL);
  objc_storeStrong(v21, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVProfileConfirmMatchRemoteViewController dismissViewControllerAnimated:completion:]( v7,  "dismissViewControllerAnimated:completion:",  1LL,  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v18[2] = a1;
  v18[1] = (id)a2;
  v12 = v18;
  v18[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  v8 = &OBJC_CLASS___NSSet;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  id v13 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v4,  v5,  v6,  objc_opt_class(&OBJC_CLASS___TVAppProfileDescriptor),  0LL);
  v11 = (id *)&v17;
  int v17 = v2;
  int v16 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v9 = 0LL;
  int v10 = 0;
  objc_msgSend(v18[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  v15 = "viewServiceEndPresentationWithOptions:completion:";
  [v18[0] setClasses:v17 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v9 ofReply:v10 & 1];
  id v14 = v18[0];
  objc_storeStrong(v11, v13);
  objc_storeStrong(v12, v13);
  return v14;
}

+ (id)_remoteViewControllerInterface
{
  v10[2] = a1;
  v10[1] = (id)a2;
  uint64_t v6 = v10;
  v10[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  uint64_t v4 = &OBJC_CLASS___NSSet;
  id obj = 0LL;
  v2 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  location = (id *)&v9;
  uint64_t v9 = v2;
  [v10[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v10[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

@end