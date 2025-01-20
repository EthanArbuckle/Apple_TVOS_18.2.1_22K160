@interface TVSMHostViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TVSMHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVSMMainViewController)mainViewController;
- (id)preferredFocusEnvironments;
- (void)donateControlCenterOpenedEvent;
- (void)systemMenuManagerRequestedDismissal:(id)a3 animated:(BOOL)a4 result:(id)a5;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation TVSMHostViewController

- (TVSMHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v41 = 0LL;
  objc_storeStrong(&v41, a4);
  v4 = v43;
  v43 = 0LL;
  v40.receiver = v4;
  v40.super_class = (Class)&OBJC_CLASS___TVSMHostViewController;
  v27 = -[TVSMHostViewController initWithNibName:bundle:](&v40, "initWithNibName:bundle:", location[0], v41);
  v43 = v27;
  objc_storeStrong((id *)&v43, v27);
  if (v27)
  {
    id v39 = (id)grid_log(v27);
    char v38 = 1;
    v24 = (os_log_s *)(id)grid_log(v39);
    os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, v43);

    os_signpost_id_t v37 = v25;
    if (v25 && v37 != -1LL && os_signpost_enabled((os_log_t)v39))
    {
      log = (os_log_s *)v39;
      os_signpost_type_t type = v38;
      os_signpost_id_t spid = v37;
      sub_10000BF94(v36);
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  log,  type,  spid,  "HostVCInit",  (const char *)&unk_100046F3F,  v36,  2u);
    }

    objc_storeStrong(&v39, 0LL);
    id v35 = (id)launch_perf_log();
    char v34 = 1;
    v19 = (os_log_s *)(id)launch_perf_log();
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, v43);

    os_signpost_id_t v33 = v20;
    if (v20 && v33 != -1LL && os_signpost_enabled((os_log_t)v35))
    {
      v16 = (os_log_s *)v35;
      os_signpost_type_t v17 = v34;
      os_signpost_id_t v18 = v33;
      sub_10000BF94(v32);
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  v17,  v18,  "InitialLaunch",  (const char *)&unk_100046F3F,  v32,  2u);
    }

    objc_storeStrong(&v35, 0LL);
    v5 = objc_alloc_init(&OBJC_CLASS___TVSMMainViewController);
    mainViewController = v43->_mainViewController;
    v43->_mainViewController = v5;

    v13 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
    -[TVSMSystemMenuManager setDelegate:](v13, "setDelegate:", v43);

    id v31 = (id)grid_log(v7);
    char v30 = 2;
    v14 = (os_log_s *)(id)grid_log(v31);
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v43);

    os_signpost_id_t v29 = v15;
    if (v15 && v29 != -1LL && os_signpost_enabled((os_log_t)v31))
    {
      v10 = (os_log_s *)v31;
      os_signpost_type_t v11 = v30;
      os_signpost_id_t v12 = v29;
      sub_10000BF94(v28);
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  v11,  v12,  "HostVCInit",  (const char *)&unk_100046F3F,  v28,  2u);
    }

    objc_storeStrong(&v31, 0LL);
  }

  v9 = v43;
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v43, 0LL);
  return v9;
}

- (id)preferredFocusEnvironments
{
  char v4 = 0;
  if (self->_mainViewController)
  {
    mainViewController = self->_mainViewController;
    v5 =  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &mainViewController,  1LL);
    char v4 = 1;
    v2 = v5;
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  v6 = v2;
  if ((v4 & 1) != 0) {

  }
  return v6;
}

- (void)donateControlCenterOpenedEvent
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = +[BMStreams discoverabilitySignal](&OBJC_CLASS___BMStreams, "discoverabilitySignal");
  id v6 = [v7[0] source];
  id v2 = objc_alloc(&OBJC_CLASS___BMDiscoverabilitySignalEvent);
  char v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v3 = -[NSBundle bundleIdentifier](v4, "bundleIdentifier");
  id v5 = objc_msgSend(v2, "initWithIdentifier:bundleID:context:", @"com.apple.appletv.controlcenter.opened");

  [v6 sendEvent:v5];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(v7, 0LL);
}

- (void)systemMenuManagerRequestedDismissal:(id)a3 animated:(BOOL)a4 result:(id)a5
{
  os_signpost_id_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  id v16 = -[TVSMHostViewController _remoteViewControllerProxy](v20, "_remoteViewControllerProxy");
  if (v18)
  {
    [v16 dismissWithResult:v17];
  }

  else
  {
    id v6 = v20;
    mainViewController = v20->_mainViewController;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    os_signpost_id_t v12 = sub_100027980;
    v13 = &unk_100049AE8;
    v14 = v20;
    id v15 = v17;
    -[TVSMHostViewController bs_removeChildViewController:animated:transitionBlock:]( v6,  "bs_removeChildViewController:animated:transitionBlock:",  mainViewController,  0LL,  &v9);
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong((id *)&v14, 0LL);
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v44 = (id)grid_log(v3);
  char v43 = 1;
  v27 = (os_log_s *)(id)grid_log(v44);
  os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v27, v46);

  os_signpost_id_t v42 = v28;
  if (v28 && v42 != -1LL && os_signpost_enabled((os_log_t)v44))
  {
    log = (os_log_s *)v44;
    os_signpost_type_t type = v43;
    os_signpost_id_t spid = v42;
    sub_10000BF94(v41);
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  log,  type,  spid,  "BeginPresentation",  (const char *)&unk_100046F3F,  v41,  2u);
  }

  objc_storeStrong(&v44, 0LL);
  id v12 = -[TVSMHostViewController view](v46, "view");
  id v11 = [v12 window];
  [v11 makeKeyWindow];

  id v40 = objc_alloc_init(&OBJC_CLASS___TVSMMutableSystemMenuStartupContext);
  id v13 = [location[0] objectForKey:@"HomeModuleAvailable"];
  objc_msgSend(v40, "setHomeModuleAvailable:", (unint64_t)objc_msgSend(v13, "BOOLValue") & 1);

  id v14 = [location[0] objectForKey:@"ForegroundApp"];
  objc_msgSend(v40, "setForegroundApp:");

  id v15 = [location[0] objectForKey:@"TVSMShowTeachableMoment"];
  objc_msgSend(v40, "setShowTeachableMoment:", (unint64_t)objc_msgSend(v15, "BOOLValue") & 1);

  id v17 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  id v16 = [v40 copy];
  -[TVSMSystemMenuManager setStartupContext:](v17, "setStartupContext:");

  id v19 = -[TVSMMainViewController view](v46->_mainViewController, "view");
  id v18 = -[TVSMHostViewController view](v46, "view");
  [v18 bounds];
  v39[1] = v4;
  v39[2] = v5;
  v39[3] = v6;
  v39[4] = v7;
  objc_msgSend(v19, "setFrame:", *(double *)&v4, *(double *)&v5, *(double *)&v6, *(double *)&v7);

  v21 = v46;
  mainViewController = v46->_mainViewController;
  os_signpost_id_t v33 = _NSConcreteStackBlock;
  int v34 = -1073741824;
  int v35 = 0;
  v36 = sub_100028030;
  os_signpost_id_t v37 = &unk_100049AE8;
  char v38 = v46;
  v39[0] = location[0];
  id v32 = (id)grid_log( -[TVSMHostViewController bs_addChildViewController:animated:transitionBlock:]( v21,  "bs_addChildViewController:animated:transitionBlock:",  mainViewController,  1LL,  &v33));
  char v31 = 2;
  v22 = (os_log_s *)(id)grid_log(v32);
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v46);

  os_signpost_id_t v30 = v23;
  if (v23 && v30 != -1LL && os_signpost_enabled((os_log_t)v32))
  {
    v8 = (os_log_s *)v32;
    os_signpost_type_t v9 = v31;
    os_signpost_id_t v10 = v30;
    sub_10000BF94(v29);
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  v9,  v10,  "BeginPresentation",  (const char *)&unk_100046F3F,  v29,  2u);
  }

  objc_storeStrong(&v32, 0LL);
  -[TVSMHostViewController donateControlCenterOpenedEvent](v46, "donateControlCenterOpenedEvent");
  objc_storeStrong(v39, 0LL);
  objc_storeStrong((id *)&v38, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = [location[0] objectForKey:@"PBCCRequest"];
  if ([v9 isEqualToString:@"PBCCRequestDismissTeachableMomentOverlay"])
  {
    char v4 = -[TVSMHostViewController mainViewController](v12, "mainViewController");
    unsigned __int8 v5 = -[TVSMMainViewController dismissTeachableMomentIfNeeded](v4, "dismissTeachableMomentIfNeeded");

    id v6 = (void (**)(void))v10;
    uint64_t v7 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5 & 1);
    v6[2]();
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  if (location[0]) {
    unsigned int v8 = objc_msgSend(location[0], "tvs_BOOLForKey:defaultValue:", PBSViewServiceOptionsAnimateKey, 1) & 1;
  }
  else {
    unsigned int v8 = 1;
  }
  BOOL v18 = v8 != 0;
  id v5 = -[TVSMHostViewController view](v21, "view");
  id v4 = [v5 window];
  [v4 setUserInteractionEnabled:0];

  uint64_t v7 = v21;
  mainViewController = v21->_mainViewController;
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_100028590;
  id v14 = &unk_100049B60;
  id v15 = v21;
  BOOL v17 = v18;
  id v16 = v19;
  -[TVSMHostViewController bs_removeChildViewController:animated:transitionBlock:]( v7,  "bs_removeChildViewController:animated:transitionBlock:",  mainViewController,  v8 != 0,  &v10);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v17[2] = a1;
  v17[1] = (id)a2;
  id v10 = v17;
  v17[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  id v6 = &OBJC_CLASS___NSSet;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = 0LL;
  id v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  location = (id *)&v16;
  id v16 = v2;
  id v15 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v17[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  id v14 = "viewServiceHandleMessage:reply:";
  [v17[0] setClasses:v16 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:v7 ofReply:v8 & 1];
  id v13 = "viewServiceEndPresentationWithOptions:completion:";
  [v17[0] setClasses:v16 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v7 ofReply:v8 & 1];
  id v12 = v17[0];
  objc_storeStrong(location, v11);
  objc_storeStrong(v10, v11);
  return v12;
}

+ (id)_remoteViewControllerInterface
{
  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (TVSMMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void).cxx_destruct
{
}

@end