@interface TVUPSGroupRecommendationsAddUserViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_dismiss;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVUPSGroupRecommendationsAddUserViewController

- (void)_dismiss
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] =  -[TVUPSGroupRecommendationsAddUserViewController _remoteViewControllerProxy]( self,  "_remoteViewControllerProxy");
  objc_msgSend(v2[0], "dismissWithResult:");
  objc_storeStrong(v2, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[TVUPSGroupRecommendationsAddUserViewController view](v22, "view");
  id v5 = [v6 window];
  [v5 makeKeyWindow];

  objc_initWeak(&from, v22);
  id v19 = objc_alloc_init(&OBJC_CLASS___TVSUIGroupRecommendationsAddUserUpsellViewController);
  [v19 setModalPresentationStyle:8];
  id v4 = v19;
  v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  v16 = sub_100004ABC;
  v17 = &unk_10000C360;
  objc_copyWeak(v18, &from);
  [v4 setAddUserActionHandler:&v13];
  id v3 = v19;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100004B6C;
  v11 = &unk_10000C360;
  objc_copyWeak(&v12, &from);
  [v3 setNotNowActionHandler:&v7];
  -[TVUPSGroupRecommendationsAddUserViewController presentViewController:animated:completion:]( v22,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
  objc_destroyWeak(&v12);
  objc_destroyWeak(v18);
  objc_storeStrong(&v19, 0LL);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  int v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v5 = v14;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_100004C98;
  v10 = &unk_10000C388;
  id v11 = v12;
  -[TVUPSGroupRecommendationsAddUserViewController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v17[2] = a1;
  v17[1] = (id)a2;
  id v11 = v17;
  v17[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  int v7 = &OBJC_CLASS___NSSet;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v12 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  v10 = (id *)&v16;
  v16 = v2;
  int v15 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v8 = 0LL;
  int v9 = 0;
  objc_msgSend(v17[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  int v14 = "viewServiceEndPresentationWithOptions:completion:";
  [v17[0] setClasses:v16 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v8 ofReply:v9 & 1];
  id v13 = v17[0];
  objc_storeStrong(v10, v12);
  objc_storeStrong(v11, v12);
  return v13;
}

+ (id)_remoteViewControllerInterface
{
  v11[2] = a1;
  v11[1] = (id)a2;
  uint64_t v6 = v11;
  v11[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  uint64_t v4 = &OBJC_CLASS___NSSet;
  id obj = 0LL;
  v2 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  location = (id *)&v10;
  v10 = v2;
  int v9 = "dismissWithResult:";
  [v11[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v11[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

@end