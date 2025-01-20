@interface TVCRDServiceInstructionsViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TVCRDConferenceRoomDisplayViewController)crdViewController;
- (void)setCrdViewController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceUpdatePresentationWithOptions:(id)a3;
@end

@implementation TVCRDServiceInstructionsViewController

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = -[TVCRDServiceInstructionsViewController view](v28, "view");
  id v7 = [v8 window];
  [v7 makeKeyWindow];

  id v26 = -[TVCRDConferenceRoomDisplayViewController initWithDisplayStyle:]( objc_alloc(&OBJC_CLASS___TVCRDConferenceRoomDisplayViewController),  "initWithDisplayStyle:",  1LL);
  objc_storeStrong((id *)&v28->_crdViewController, v26);
  -[TVCRDServiceInstructionsViewController addChildViewController:](v28, "addChildViewController:", v26);
  id v25 = -[TVCRDServiceInstructionsViewController view](v28, "view");
  [v25 setAlpha:0.0];
  id v24 = [v26 view];
  id v9 = v24;
  [v25 bounds];
  v23[1] = v3;
  v23[2] = v4;
  v23[3] = v5;
  v23[4] = v6;
  objc_msgSend(v9, "setFrame:", *(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
  [v25 addSubview:v24];
  objc_initWeak(v23, v28);
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_100001C58;
  v21 = &unk_100008348;
  id v22 = v25;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_100001C8C;
  v14 = &unk_100008370;
  objc_copyWeak(&v16, v23);
  id v15 = location[0];
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v17,  &v10,  0.3);
  [v26 didMoveToParentViewController:v28];
  objc_storeStrong(&v15, 0LL);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v22, 0LL);
  objc_destroyWeak(v23);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceUpdatePresentationWithOptions:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] objectForKey:PBSViewServiceOptionsAnimateKey];
  if ([v3 BOOLValue])
  {
    -[TVCRDConferenceRoomDisplayViewController startHUDMovement](v5->_crdViewController, "startHUDMovement");
  }

  else if (v3)
  {
    -[TVCRDConferenceRoomDisplayViewController stopHUDMovement](v5->_crdViewController, "stopHUDMovement");
  }

  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  int v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  int v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_100001F2C;
  id v15 = &unk_100008348;
  id v16 = v19;
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_100001F7C;
  id v9 = &unk_100008398;
  id v10 = v17;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v11,  0.3);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
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
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  location = (id *)&v15;
  id v15 = v2;
  v14 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v16[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  int v13 = "viewServiceEndPresentationWithOptions:completion:";
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
  v2 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  location = (id *)&v10;
  id v10 = v2;
  id v9 = "dismissWithResult:";
  [v11[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v11[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (TVCRDConferenceRoomDisplayViewController)crdViewController
{
  return self->_crdViewController;
}

- (void)setCrdViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end