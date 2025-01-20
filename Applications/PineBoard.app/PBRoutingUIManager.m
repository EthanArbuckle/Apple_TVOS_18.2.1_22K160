@interface PBRoutingUIManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)_dismissRoutingUIWithReason:(id)a3 completion:(id)a4;
- (BOOL)dismissRoutingUI;
- (BOOL)isPresenting;
- (NSHashTable)pendingDismissalHandlers;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBRoutingUIManager)init;
- (PBSystemOverlayController)overlayController;
- (UIViewController)routingViewController;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (void)activateRoutingUIForReason:(unint64_t)a3 options:(id)a4 dismissalHandler:(id)a5;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)setRoutingViewController:(id)a3;
@end

@implementation PBRoutingUIManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D7BA0;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D7C38;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004713B8 != -1) {
    dispatch_once(&qword_1004713B8, block);
  }
  return (id)qword_1004713B0;
}

- (PBRoutingUIManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBRoutingUIManager;
  v2 = -[PBRoutingUIManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  0x10000LL,  0LL);
    pendingDismissalHandlers = v2->_pendingDismissalHandlers;
    v2->_pendingDismissalHandlers = v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001D7D20;
    v6[3] = &unk_1003D0FA8;
    v7 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v7,  v6);
  }

  return v2;
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (void)activateRoutingUIForReason:(unint64_t)a3 options:(id)a4 dismissalHandler:(id)a5
{
  pendingDismissalHandlers = self->_pendingDismissalHandlers;
  id v8 = a4;
  id v9 = [a5 copy];
  -[NSHashTable addObject:](pendingDismissalHandlers, "addObject:", v9);

  if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    v10 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissRoutingUI",  self);
    v11 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    coordinatedTransitionToken = self->_coordinatedTransitionToken;
    self->_coordinatedTransitionToken = v11;

    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v10);
  }

  v13 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  v14 = (objc_class *)objc_opt_class(self);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v13, "setIdentifier:", v16);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v13, "setAnimated:", 1LL);
  -[PBMutableSystemOverlayPresentationRequest setClientOptions:](v13, "setClientOptions:", v8);

  -[PBMutableSystemOverlayPresentationRequest setProvider:](v13, "setProvider:", self);
  -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v13,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
  overlayController = self->_overlayController;
  id v18 = -[PBMutableSystemOverlayPresentationRequest copy](v13, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v18,  0LL);
}

- (BOOL)dismissRoutingUI
{
  return -[PBRoutingUIManager _dismissRoutingUIWithReason:completion:]( self,  "_dismissRoutingUIWithReason:completion:",  @"Undefined",  0LL);
}

- (BOOL)_dismissRoutingUIWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  id v9 = sub_1000F7474();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v6;
    __int16 v22 = 2048;
    v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Dismissing routing UI {reason=%{public}@, activeSession=%p}",  buf,  0x16u);
  }

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v8));
    [v11 setAnimated:1];
    id v12 = -[NSHashTable copy](self->_pendingDismissalHandlers, "copy");
    -[NSHashTable removeAllObjects](self->_pendingDismissalHandlers, "removeAllObjects");
    overlayController = self->_overlayController;
    id v14 = [v11 copy];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001D8114;
    v17[3] = &unk_1003D1610;
    id v18 = v12;
    id v19 = v7;
    id v15 = v12;
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v14,  v17);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }

  return v8 != 0LL;
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D8314;
  v7[3] = &unk_1003D3048;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  id v6 =  +[PBSimpleRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBSimpleRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  @"TVNPRoutingHostViewController",  @"com.apple.TVNowPlayingService",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001D84DC;
  v6[3] = &unk_1003D20E0;
  void v6[4] = self;
  return [[BSBlockTransaction alloc] initWithBlock:v6];
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  coordinatedTransitionToken = self->_coordinatedTransitionToken;
  self->_coordinatedTransitionToken = 0LL;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (NSHashTable)pendingDismissalHandlers
{
  return self->_pendingDismissalHandlers;
}

- (UIViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (void).cxx_destruct
{
}

@end