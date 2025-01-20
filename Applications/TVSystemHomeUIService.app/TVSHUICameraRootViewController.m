@interface TVSHUICameraRootViewController
- (BSInvalidatable)visibilityAssertion;
- (HFItemManager)itemManager;
- (NAFuture)itemManagerReloadFuture;
- (PBUISystemHomeServiceCameraWindowScene)windowScene;
- (TVSHUICameraRootViewController)initWithWindowScene:(id)a3;
- (TVSHUICameraRootViewControllerDelegate)delegate;
- (TVSHUICameraViewControllerManager)cameraViewControllerManager;
- (id)cameraItemsForCameraViewControllerManager:(id)a3;
- (id)transitionCameraContentView;
- (void)_fetchInitialCameraItemsWithItemManager:(id)a3;
- (void)_itemManagerDidCompleteInitialLoad;
- (void)_notifyDelegateDidPrepareForPresentationWithCompletion:(id)a3;
- (void)_notifyDelegateRequestDismissal;
- (void)cameraViewControllerManager:(id)a3 addChildViewController:(id)a4 completion:(id)a5;
- (void)cameraViewControllerManager:(id)a3 didUpdateActiveCameraIdentifiers:(id)a4;
- (void)cameraViewControllerManager:(id)a3 didUpdateFullscreenState:(BOOL)a4;
- (void)cameraViewControllerManager:(id)a3 removeChildViewController:(id)a4;
- (void)cameraViewControllerManager:(id)a3 restoreChildViewController:(id)a4;
- (void)cameraViewControllerManagerRequestsDismissal:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentCameraWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showCameraView;
- (void)viewDidLoad;
@end

@implementation TVSHUICameraRootViewController

- (TVSHUICameraRootViewController)initWithWindowScene:(id)a3
{
  id v43 = self;
  SEL v42 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v40 = location;
  id v39 = 0LL;
  Class v38 = NSClassFromString(@"PBUISystemHomeServiceCameraWindowScene");
  if (!v40)
  {
    id v37 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v36 = &_os_log_default;
    os_log_type_t v35 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(v42);
      id v34 = v17;
      aClass = (objc_class *)objc_opt_class(v43);
      v16 = NSStringFromClass(aClass);
      id v33 = v16;
      sub_1000056C8( (uint64_t)v45,  (uint64_t)v34,  (uint64_t)v33,  (uint64_t)v43,  (uint64_t)@"TVSHUICameraRootViewController.m",  42,  (uint64_t)v37);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  v35,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v45,  0x3Au);

      objc_storeStrong(&v33, 0LL);
      objc_storeStrong(&v34, 0LL);
    }

    objc_storeStrong(&v36, 0LL);
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x100005144LL);
  }

  if (((objc_opt_isKindOfClass(v40, v38) ^ 1) & 1) != 0)
  {
    id v32 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBUISystemHomeServiceCameraWindowSceneClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(v42);
      id v29 = v14;
      v15 = (objc_class *)objc_opt_class(v43);
      v13 = NSStringFromClass(v15);
      id v28 = v13;
      sub_1000056C8( (uint64_t)v44,  (uint64_t)v29,  (uint64_t)v28,  (uint64_t)v43,  (uint64_t)@"TVSHUICameraRootViewController.m",  42,  (uint64_t)v32);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  v30,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v44,  0x3Au);

      objc_storeStrong(&v28, 0LL);
      objc_storeStrong(&v29, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v32 UTF8String]);
    __break(0);
    JUMPOUT(0x100005358LL);
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  id v3 = v43;
  id v43 = 0LL;
  v27.receiver = v3;
  v27.super_class = (Class)&OBJC_CLASS___TVSHUICameraRootViewController;
  id v43 = -[TVSHUICameraRootViewController initWithNibName:bundle:](&v27, "initWithNibName:bundle:", 0LL);
  objc_storeStrong(&v43, v43);
  if (v43)
  {
    objc_storeWeak((id *)v43 + 2, location);
    v12 = objc_alloc(&OBJC_CLASS___TVSHUICameraViewControllerManager);
    v11 = -[TVSHUICameraViewControllerManager initWithDelegate:](v12, "initWithDelegate:", v43);
    v4 = (void *)*((void *)v43 + 5);
    *((void *)v43 + 5) = v11;

    id v26 =  +[TVSystemHomeUIServiceApplication sharedApplication]( &OBJC_CLASS___TVSystemHomeUIServiceApplication,  "sharedApplication");
    [v26 addObserver:v43 forKeyPath:@"cameraItemManager" options:4 context:&off_1000144F8];
    objc_initWeak(&from, v43);
    v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v10 = TVHMWillEnterPictureInPictureNotification;
    v8 = +[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue");
    v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    v22 = sub_100005770;
    v23 = &unk_100014508;
    objc_copyWeak(&v24, &from);
    id v5 =  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( v9,  "addObserverForName:object:queue:usingBlock:",  v10,  0LL,  v8,  &v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_storeStrong(&v26, 0LL);
  }

  v7 = (TVSHUICameraRootViewController *)v43;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v43, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  v3[1] = (id)a2;
  v3[0] =  +[TVSystemHomeUIServiceApplication sharedApplication]( &OBJC_CLASS___TVSystemHomeUIServiceApplication,  "sharedApplication");
  [v3[0] removeObserver:v4 forKeyPath:@"cameraItemManager"];
  -[BSInvalidatable invalidate](v4->_visibilityAssertion, "invalidate");
  objc_storeStrong(v3, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSHUICameraRootViewController;
  -[TVSHUICameraRootViewController dealloc](&v2, "dealloc");
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSHUICameraRootViewController;
  -[TVSHUICameraRootViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)presentCameraWithContext:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSHUICameraViewControllerManager presentCameraWithContext:]( v4->_cameraViewControllerManager,  "presentCameraWithContext:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_fetchInitialCameraItemsWithItemManager:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!v23->_itemManager)
  {
    objc_storeStrong((id *)&v23->_itemManager, location[0]);
    SEL v3 = (NAFuture *)-[HFItemManager firstFastUpdateFuture](v23->_itemManager, "firstFastUpdateFuture");
    itemManagerReloadFuture = v23->_itemManagerReloadFuture;
    v23->_itemManagerReloadFuture = v3;

    objc_initWeak(&v21, v23);
    v8 = v23->_itemManagerReloadFuture;
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_100005BD8;
    v19 = &unk_100014530;
    objc_copyWeak(&v20, &v21);
    id v5 = -[NAFuture addSuccessBlock:](v8, "addSuccessBlock:", &v15);
    v7 = v23->_itemManagerReloadFuture;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_100005C40;
    v13 = &unk_100014558;
    objc_copyWeak(&v14, &v21);
    id v6 = -[NAFuture addFailureBlock:](v7, "addFailureBlock:", &v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v21);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_itemManagerDidCompleteInitialLoad
{
}

- (void)_notifyDelegateDidPrepareForPresentationWithCompletion:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  [WeakRetained cameraRootViewController:v5 didPrepareForPresentationWithCompletion:location[0]];

  objc_storeStrong(location, 0LL);
}

- (void)_notifyDelegateRequestDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cameraRootViewControllerRequestsDismissal:self];
}

- (id)cameraItemsForCameraViewControllerManager:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[HFItemManager displayedItemsInSection:](v6->_itemManager, "displayedItemsInSection:", 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)cameraViewControllerManager:(id)a3 addChildViewController:(id)a4 completion:(id)a5
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 = 0LL;
  objc_storeStrong(&v7, a5);
  -[TVSHUICameraRootViewController bs_addChildViewController:](v10, "bs_addChildViewController:", v8);
  -[TVSHUICameraRootViewController _notifyDelegateDidPrepareForPresentationWithCompletion:]( v10,  "_notifyDelegateDidPrepareForPresentationWithCompletion:",  v7);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cameraViewControllerManager:(id)a3 didUpdateFullscreenState:(BOOL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!a4 || v9->_visibilityAssertion)
  {
    if (!a4 && v9->_visibilityAssertion)
    {
      -[BSInvalidatable invalidate](v9->_visibilityAssertion, "invalidate");
      objc_storeStrong((id *)&v9->_visibilityAssertion, 0LL);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_windowScene);
    id v4 = (BSInvalidatable *)[WeakRetained requestVisibilityForReason:@"Fullscreen"];
    visibilityAssertion = v9->_visibilityAssertion;
    v9->_visibilityAssertion = v4;
  }

  objc_storeStrong(location, 0LL);
}

- (void)cameraViewControllerManager:(id)a3 removeChildViewController:(id)a4
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  -[TVSHUICameraRootViewController bs_removeChildViewController:](v11, "bs_removeChildViewController:", v9);
  id v7 = [v9 view];
  id v6 = -[TVSHUICameraRootViewController view](v11, "view");
  unsigned __int8 v8 = objc_msgSend(v7, "isDescendantOfView:");

  if ((v8 & 1) != 0)
  {
    id v4 = [v9 view];
    [v4 removeFromSuperview];
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cameraViewControllerManager:(id)a3 restoreChildViewController:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  -[TVSHUICameraRootViewController bs_addChildViewController:](v19, "bs_addChildViewController:", v17);
  id v10 = -[TVSHUICameraRootViewController view](v19, "view");
  [v10 bounds];
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  id v9 = [v17 view];
  objc_msgSend(v9, "setFrame:", v13, v14, v15, v16);

  id v12 = -[TVSHUICameraRootViewController view](v19, "view");
  id v11 = [v17 view];
  objc_msgSend(v12, "addSubview:");

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cameraViewControllerManager:(id)a3 didUpdateActiveCameraIdentifiers:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v8 = 0LL;
  if ([v9 count]) {
    id v4 =  +[PBSSystemHomeUIStreamState activeStateWithCameraIdentifiers:]( &OBJC_CLASS___PBSSystemHomeUIStreamState,  "activeStateWithCameraIdentifiers:",  v9);
  }
  else {
    id v4 = +[PBSSystemHomeUIStreamState inactiveState](&OBJC_CLASS___PBSSystemHomeUIStreamState, "inactiveState");
  }
  id v5 = v8;
  id v8 = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&v11->_windowScene);
  [WeakRetained setStreamState:v8];

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cameraViewControllerManagerRequestsDismissal:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSHUICameraRootViewController _notifyDelegateRequestDismissal](v4, "_notifyDelegateRequestDismissal");
  objc_storeStrong(location, 0LL);
}

- (void)showCameraView
{
}

- (id)transitionCameraContentView
{
  return -[TVSHUICameraViewControllerManager transitionCameraContentView]( self->_cameraViewControllerManager,  "transitionCameraContentView",  a2,  self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  id v12 = a6;
  if (a6 == &off_1000144F8)
  {
    id v11 =  +[TVSystemHomeUIServiceApplication sharedApplication]( &OBJC_CLASS___TVSystemHomeUIServiceApplication,  "sharedApplication");
    id v10 = [v11 cameraItemManager];
    if (v10) {
      -[TVSHUICameraRootViewController _fetchInitialCameraItemsWithItemManager:]( v16,  "_fetchInitialCameraItemsWithItemManager:",  v10);
    }
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  else
  {
    v9.receiver = v16;
    v9.super_class = (Class)&OBJC_CLASS___TVSHUICameraRootViewController;
    -[TVSHUICameraRootViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v14,  v13,  v12);
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSHUICameraRootViewControllerDelegate)delegate
{
  return (TVSHUICameraRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBUISystemHomeServiceCameraWindowScene)windowScene
{
  return (PBUISystemHomeServiceCameraWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (NAFuture)itemManagerReloadFuture
{
  return self->_itemManagerReloadFuture;
}

- (TVSHUICameraViewControllerManager)cameraViewControllerManager
{
  return self->_cameraViewControllerManager;
}

- (BSInvalidatable)visibilityAssertion
{
  return self->_visibilityAssertion;
}

- (void).cxx_destruct
{
}

@end