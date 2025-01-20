@interface TVSHUICameraViewControllerManager
- (BOOL)dismissPictureInPictureViewController:(id)a3;
- (BOOL)isEnabled;
- (BOOL)viewControllerShouldDismissForAllCamerasButton:(id)a3;
- (BSCompoundAssertion)visibilityCompoundAssertion;
- (BSInvalidatable)fullScreenVisibilityAssertion;
- (BSInvalidatable)stateDumpCaptureHandle;
- (BSWatchdog)restorationWatchdog;
- (NSMapTable)pictureInPictureControllers;
- (PBUISystemHomeServiceCameraActivationContext)pendingActivationContext;
- (TVHMUIAllCamerasFullScreenViewController)currentAllCamerasViewController;
- (TVHMUIFullScreenCameraViewController)currentViewControllerFullScreen;
- (TVHMUIFullScreenCameraViewController)currentViewControllerPiP;
- (TVHMUIFullScreenCameraViewController)previousViewControllerFullScreen;
- (TVHMUIFullScreenCameraViewController)swappingToFullScreenViewController;
- (TVSHUICameraViewControllerManager)init;
- (TVSHUICameraViewControllerManager)initWithDelegate:(id)a3;
- (TVSHUICameraViewControllerManagerDelegate)delegate;
- (id)_cameraItems;
- (id)_createFullScreenViewControllerForCameraItem:(id)a3;
- (id)_createFullScreenViewControllerForCameraItem:(id)a3 streaming:(BOOL)a4;
- (id)_pictureInPictureControllerForViewController:(id)a3;
- (id)_pictureInPictureControllerForViewControllersCoolport:(id)a3;
- (id)_stateDump;
- (id)transitionCameraContentView;
- (void)_addChildViewController:(id)a3 completion:(id)a4;
- (void)_cleanupPiPControllerForVisibleViewController:(id)a3;
- (void)_didUpdatePictureInPictureState;
- (void)_dismissIfNecessary;
- (void)_presentCameraWithContext:(id)a3 source:(int64_t)a4;
- (void)_removeAllAnimationsFromView:(id)a3;
- (void)_removeChildViewController:(id)a3;
- (void)_restoreChildViewController:(id)a3;
- (void)_startPictureinPictureUsingFullScreenViewControllersCoolport:(id)a3 page:(unint64_t)a4 source:(int64_t)a5;
- (void)_startRestorationVisibilityWatchdogIfNeeded;
- (void)_updateVisibilityState;
- (void)activate;
- (void)allCamerasViewControllerDidRequestDismissal:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)controller:(id)a3 didChangeCurrentViewController:(id)a4;
- (void)dealloc;
- (void)dismissPictureInPictureViewControllerFromFullScreen:(id)a3;
- (void)prepareForPictureInPictureStopOrSwapAnimation;
- (void)presentCameraWithContext:(id)a3;
- (void)restorePictureInPictureViewControllerToFullScreen:(id)a3;
- (void)showCameraView;
- (void)startPictureInPictureFromFullscreen;
- (void)startPictureInPictureUsingViewControllerCoolport:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 completion:(id)a7;
@end

@implementation TVSHUICameraViewControllerManager

- (TVSHUICameraViewControllerManager)initWithDelegate:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v30;
  v30 = 0LL;
  v28.receiver = v3;
  v28.super_class = (Class)&OBJC_CLASS___TVSHUICameraViewControllerManager;
  v30 = -[TVSHUICameraViewControllerManager init](&v28, "init");
  objc_storeStrong((id *)&v30, v30);
  if (v30)
  {
    objc_storeWeak((id *)&v30->_delegate, location[0]);
    v4 = +[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable");
    pictureInPictureControllers = v30->_pictureInPictureControllers;
    v30->_pictureInPictureControllers = v4;

    objc_initWeak(&v27, v30);
    v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    v24 = sub_1000081D0;
    v25 = &unk_1000145D8;
    objc_copyWeak(&v26, &v27);
    v6 =  +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  @"Visibility",  &v21);
    visibilityCompoundAssertion = v30->_visibilityCompoundAssertion;
    v30->_visibilityCompoundAssertion = v6;

    v13 = &_dispatch_main_q;
    aClass = (objc_class *)objc_opt_class(v30);
    v12 = NSStringFromClass(aClass);
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_100008238;
    v19 = &unk_100014600;
    objc_copyWeak(&v20, &v27);
    v8 = (BSInvalidatable *)(id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( v13,  v12,  &v15);
    stateDumpCaptureHandle = v30->_stateDumpCaptureHandle;
    v30->_stateDumpCaptureHandle = v8;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v27);
  }

  v11 = v30;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  return v11;
}

- (TVSHUICameraViewControllerManager)init
{
  v4 = 0LL;
  v4 = -[TVSHUICameraViewControllerManager initWithDelegate:](self, "initWithDelegate:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BSWatchdog invalidate](self->_restorationWatchdog, "invalidate");
  -[BSInvalidatable invalidate](v4->_fullScreenVisibilityAssertion, "invalidate");
  -[BSCompoundAssertion invalidate](v4->_visibilityCompoundAssertion, "invalidate");
  -[BSInvalidatable invalidate](v4->_stateDumpCaptureHandle, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSHUICameraViewControllerManager;
  -[TVSHUICameraViewControllerManager dealloc](&v2, "dealloc");
}

- (void)activate
{
  SEL v3 = self;
  v2[1] = (id)a2;
  self->_enabled = 1;
  if (v3->_pendingActivationContext)
  {
    v2[0] = v3->_pendingActivationContext;
    objc_storeStrong((id *)&v3->_pendingActivationContext, 0LL);
    -[TVSHUICameraViewControllerManager presentCameraWithContext:](v3, "presentCameraWithContext:", v2[0]);
    objc_storeStrong(v2, 0LL);
  }

- (void)presentCameraWithContext:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_enabled) {
    -[TVSHUICameraViewControllerManager _presentCameraWithContext:source:]( v4,  "_presentCameraWithContext:source:",  location[0],  0LL);
  }
  else {
    objc_storeStrong((id *)&v4->_pendingActivationContext, location[0]);
  }
  objc_storeStrong(location, 0LL);
}

- (void)startPictureInPictureUsingViewControllerCoolport:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = -[TVSHUICameraViewControllerManager _cameraItems](v30, "_cameraItems");
  id v16 = [location[0] topMostFullScreenCameraViewController];
  id v15 = [v16 cameraContentView];
  id v14 = [v15 cameraProfile];
  id v13 = [v14 uniqueIdentifier];
  id v27 = sub_1000088A8(v28, v13);

  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v25 = 0LL;
  uint64_t v24 = 0LL;
  memset(__b, 0, sizeof(__b));
  id obj = v28;
  id v18 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
  if (v18)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0LL;
    id v12 = v18;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(id *)(__b[1] + 8 * v11);
      BOOL v21 = v27 == v23;
      if (v27 == v23)
      {
        uint64_t v24 = v25;
        id v8 = [location[0] topMostFullScreenCameraViewController];

        if (v8)
        {
          id v20 = [location[0] topMostFullScreenCameraViewController];
          -[NSMutableArray addObject:](v26, "addObject:", v20);
          id v6 = [v20 cameraContentView];
          id v3 = [v6 superview];
          BOOL v7 = v3 != 0LL;

          if (!v7)
          {
            id v4 = v20;
            id v5 =  +[TVHMCameraContentViewStyle pictureInPictureStyle]( &OBJC_CLASS___TVHMCameraContentViewStyle,  "pictureInPictureStyle");
            objc_msgSend(v4, "showCameraViewWithStyle:");
          }

          objc_storeStrong(&v20, 0LL);
        }
      }

      else
      {
        id v19 =  -[TVSHUICameraViewControllerManager _createFullScreenViewControllerForCameraItem:streaming:]( v30,  "_createFullScreenViewControllerForCameraItem:streaming:",  v23,  0LL);
        -[NSMutableArray addObject:](v26, "addObject:", v19);
        objc_storeStrong(&v19, 0LL);
      }

      ++v25;
      ++v11;
      if (v9 + 1 >= (unint64_t)v12)
      {
        uint64_t v11 = 0LL;
        id v12 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  -[TVSHUICameraViewControllerManager _startPictureinPictureUsingFullScreenViewControllersCoolport:page:source:]( v30,  "_startPictureinPictureUsingFullScreenViewControllersCoolport:page:source:",  v26,  v24,  1LL);
  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)startPictureInPictureFromFullscreen
{
  uint64_t v24 = self;
  v23[1] = (id)a2;
  if (self->_currentViewControllerFullScreen || v24->_currentAllCamerasViewController)
  {
    -[TVSHUICameraViewControllerManager _startRestorationVisibilityWatchdogIfNeeded]( v24,  "_startRestorationVisibilityWatchdogIfNeeded");
    v23[0] = 0LL;
    if (v24->_currentAllCamerasViewController)
    {
      id v11 =  -[TVHMUIAllCamerasFullScreenViewController presentedFullScreenCameraViewController]( v24->_currentAllCamerasViewController,  "presentedFullScreenCameraViewController");
      id v2 = [v11 topMostFullScreenCameraViewController];
      id v3 = v23[0];
      v23[0] = v2;
    }

    else
    {
      id v4 =  -[TVHMUIFullScreenCameraViewController topMostFullScreenCameraViewController]( v24->_currentViewControllerFullScreen,  "topMostFullScreenCameraViewController");
      id v5 = v23[0];
      v23[0] = v4;
    }

    if (v23[0] == v24->_currentViewControllerFullScreen)
    {
      -[TVSHUICameraViewControllerManager startPictureInPictureUsingViewControllerCoolport:]( v24,  "startPictureInPictureUsingViewControllerCoolport:",  v24->_currentViewControllerFullScreen);
    }

    else
    {
      id v22 = -[TVSHUICameraViewControllerManager _cameraItems](v24, "_cameraItems");
      id v8 = [v23[0] cameraContentView];
      id v7 = [v8 cameraProfile];
      id v6 = [v7 uniqueIdentifier];
      id v21 = sub_1000088A8(v22, v6);

      id v20 =  -[TVSHUICameraViewControllerManager _createFullScreenViewControllerForCameraItem:]( v24,  "_createFullScreenViewControllerForCameraItem:",  v21);
      objc_initWeak(&location, v24);
      uint64_t v10 = v24;
      id v9 = v20;
      id v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = sub_100008D0C;
      id v16 = &unk_100014628;
      objc_copyWeak(&v18, &location);
      id v17 = v20;
      -[TVSHUICameraViewControllerManager _addChildViewController:completion:]( v10,  "_addChildViewController:completion:",  v9,  &v12);
      objc_storeStrong(&v17, 0LL);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      objc_storeStrong(&v20, 0LL);
      objc_storeStrong(&v21, 0LL);
      objc_storeStrong(&v22, 0LL);
    }

    objc_storeStrong(v23, 0LL);
  }

- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  BOOL v12 = a6;
  id v11 = 0LL;
  objc_storeStrong(&v11, a7);
  if (location[0] == v16->_currentViewControllerFullScreen)
  {
    -[TVSHUICameraViewControllerManager dismissPictureInPictureViewControllerFromFullScreen:]( v16,  "dismissPictureInPictureViewControllerFromFullScreen:",  v16->_currentViewControllerFullScreen);
    objc_storeStrong((id *)&v16->_currentViewControllerFullScreen, 0LL);
    -[BSInvalidatable invalidate](v16->_fullScreenVisibilityAssertion, "invalidate");
    objc_storeStrong((id *)&v16->_fullScreenVisibilityAssertion, 0LL);
  }

  -[TVSHUICameraViewControllerManager _dismissIfNecessary](v16, "_dismissIfNecessary");
  if (v11) {
    (*((void (**)(void))v11 + 2))();
  }
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)viewControllerShouldDismissForAllCamerasButton:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 0;
}

- (void)prepareForPictureInPictureStopOrSwapAnimation
{
}

- (void)_cleanupPiPControllerForVisibleViewController:(id)a3
{
  uint64_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  pictureInPictureControllers = v24->_pictureInPictureControllers;
  id v14 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVHMUIFullScreenCameraViewController);
  id v21 = sub_1000092FC(v14, v3);
  id v22 = -[NSMapTable objectForKey:](pictureInPictureControllers, "objectForKey:");

  if (v22)
  {
    id v19 = -[NSMapTable keyEnumerator](v24->_pictureInPictureControllers, "keyEnumerator");
    id v18 = 0LL;
    id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    while (1)
    {
      id v13 = [v19 nextObject];
      id v4 = v18;
      id v18 = v13;

      if (!v13) {
        break;
      }
      id v5 = -[NSMapTable objectForKey:](v24->_pictureInPictureControllers, "objectForKey:", v18);
      BOOL v12 = v5 != v22;

      if (!v12) {
        [v17 addObject:v18];
      }
    }

    memset(__b, 0, sizeof(__b));
    id obj = v17;
    id v11 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        objc_storeStrong(&v18, *(id *)(__b[1] + 8 * v8));
        if (v24->_currentViewControllerPiP == v18) {
          objc_storeStrong((id *)&v24->_currentViewControllerPiP, 0LL);
        }
        else {
          -[NSMapTable removeObjectForKey:](v24->_pictureInPictureControllers, "removeObjectForKey:", v18);
        }
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v18, 0LL);

    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
    int v20 = 0;
  }

  else
  {
    if (v24->_currentViewControllerPiP == location[0]) {
      objc_storeStrong((id *)&v24->_currentViewControllerPiP, 0LL);
    }
    int v20 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)restorePictureInPictureViewControllerToFullScreen:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSHUICameraViewControllerManager _cleanupPiPControllerForVisibleViewController:]( v17,  "_cleanupPiPControllerForVisibleViewController:",  location[0]);
  if (!v17->_swappingToFullScreenViewController
    && (v17->_currentViewControllerFullScreen || v17->_currentAllCamerasViewController))
  {
    if (v17->_currentAllCamerasViewController) {
      currentAllCamerasViewController = v17->_currentAllCamerasViewController;
    }
    else {
      currentAllCamerasViewController = v17->_currentViewControllerFullScreen;
    }
    -[TVSHUICameraViewControllerManager dismissPictureInPictureViewControllerFromFullScreen:]( v17,  "dismissPictureInPictureViewControllerFromFullScreen:",  currentAllCamerasViewController);
  }

  objc_storeStrong((id *)&v17->_swappingToFullScreenViewController, 0LL);
  id v12 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVHMUIFullScreenCameraViewController);
  id v15 = (TVHMUIFullScreenCameraViewController *)sub_1000092FC(v12, v3);
  currentViewControllerFullScreen = v17->_currentViewControllerFullScreen;
  v17->_currentViewControllerFullScreen = v15;

  if (v17->_currentViewControllerFullScreen)
  {
    uint64_t v10 = v17;
    id v11 = -[TVHMUIFullScreenCameraViewController view](v17->_currentViewControllerFullScreen, "view");
    -[TVSHUICameraViewControllerManager _removeAllAnimationsFromView:](v10, "_removeAllAnimationsFromView:");

    if (!v17->_previousViewControllerFullScreen
      || v17->_previousViewControllerFullScreen == v17->_currentViewControllerFullScreen)
    {
      -[TVSHUICameraViewControllerManager _restoreChildViewController:]( v17,  "_restoreChildViewController:",  v17->_currentViewControllerFullScreen);
    }

    else
    {
      id v8 =  -[TVHMUIFullScreenCameraViewController presentedViewController]( v17->_previousViewControllerFullScreen,  "presentedViewController");
      id v7 = [v8 view];
      [v7 removeFromSuperview];

      -[TVSHUICameraViewControllerManager _removeChildViewController:]( v17,  "_removeChildViewController:",  v17->_previousViewControllerFullScreen);
      id v9 = -[TVHMUIFullScreenCameraViewController view](v17->_previousViewControllerFullScreen, "view");
      [v9 removeFromSuperview];

      -[TVSHUICameraViewControllerManager _addChildViewController:completion:]( v17,  "_addChildViewController:completion:",  v17->_currentViewControllerFullScreen,  &stru_100014668);
    }

    id v14 = v17->_fullScreenVisibilityAssertion;
    id v5 = (BSInvalidatable *) -[BSCompoundAssertion acquireForReason:]( v17->_visibilityCompoundAssertion,  "acquireForReason:",  @"Fullscreen");
    fullScreenVisibilityAssertion = v17->_fullScreenVisibilityAssertion;
    v17->_fullScreenVisibilityAssertion = v5;

    -[BSInvalidatable invalidate](v14, "invalidate");
    objc_storeStrong((id *)&v14, 0LL);
  }

  else
  {
    -[BSInvalidatable invalidate](v17->_fullScreenVisibilityAssertion, "invalidate");
    objc_storeStrong((id *)&v17->_fullScreenVisibilityAssertion, 0LL);
  }

  objc_storeStrong((id *)&v17->_previousViewControllerFullScreen, 0LL);
  -[TVSHUICameraViewControllerManager _didUpdatePictureInPictureState](v17, "_didUpdatePictureInPictureState");
  -[BSWatchdog invalidate](v17->_restorationWatchdog, "invalidate");
  objc_storeStrong((id *)&v17->_restorationWatchdog, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (BOOL)dismissPictureInPictureViewController:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v5->_currentViewControllerPiP == location[0])
  {
    -[TVSHUICameraViewControllerManager _removeChildViewController:]( v5,  "_removeChildViewController:",  v5->_currentViewControllerPiP);
    -[TVSHUICameraViewControllerManager _cleanupPiPControllerForVisibleViewController:]( v5,  "_cleanupPiPControllerForVisibleViewController:",  location[0]);
    -[TVSHUICameraViewControllerManager _didUpdatePictureInPictureState](v5, "_didUpdatePictureInPictureState");
    -[TVSHUICameraViewControllerManager _dismissIfNecessary](v5, "_dismissIfNecessary");
    char v6 = 1;
  }

  else
  {
    char v6 = 0;
  }

  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

- (void)dismissPictureInPictureViewControllerFromFullScreen:(id)a3
{
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] == v39->_currentViewControllerFullScreen)
  {
    id v37 = v39->_currentViewControllerFullScreen;
    while (1)
    {
      BOOL v3 = 0;
      if (v37) {
        BOOL v3 = v37 != v39->_currentViewControllerPiP;
      }
      if (!v3) {
        break;
      }
      id v36 = [v37 presentedViewController];
      objc_msgSend(v37, "dismissViewControllerAnimated:completion:", 0);
      objc_storeStrong(&v37, v36);
      objc_storeStrong(&v36, 0LL);
    }

    v35 = v39->_fullScreenVisibilityAssertion;
    objc_storeStrong((id *)&v39->_fullScreenVisibilityAssertion, 0LL);
    objc_storeStrong((id *)&v39->_currentViewControllerFullScreen, 0LL);
    v29 = _NSConcreteStackBlock;
    int v30 = -1073741824;
    int v31 = 0;
    v32 = sub_100009CE0;
    v33 = &unk_100014690;
    id v34 = location[0];
    id v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    uint64_t v24 = sub_100009D30;
    uint64_t v25 = &unk_1000146B8;
    id v26 = v39;
    id v27 = location[0];
    id v28 = v35;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v29,  &v21,  0.3);
    objc_storeStrong((id *)&v28, 0LL);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong((id *)&v26, 0LL);
    objc_storeStrong(&v34, 0LL);
    objc_storeStrong((id *)&v35, 0LL);
    objc_storeStrong(&v37, 0LL);
  }

  else if (location[0] == v39->_currentAllCamerasViewController)
  {
    id v20 = v39->_currentAllCamerasViewController;
    while (v20)
    {
      id v19 = [v20 presentedViewController];
      objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 0);
      objc_storeStrong(&v20, v19);
      objc_storeStrong(&v19, 0LL);
    }

    id v18 = v39->_fullScreenVisibilityAssertion;
    objc_storeStrong((id *)&v39->_fullScreenVisibilityAssertion, 0LL);
    objc_storeStrong((id *)&v39->_currentAllCamerasViewController, 0LL);
    id v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = sub_100009DC4;
    id v16 = &unk_100014690;
    id v17 = location[0];
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = sub_100009E14;
    id v8 = &unk_1000146B8;
    id v9 = v39;
    id v10 = location[0];
    id v11 = v18;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v12,  &v4,  0.3);
    objc_storeStrong((id *)&v11, 0LL);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong((id *)&v9, 0LL);
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong((id *)&v18, 0LL);
    objc_storeStrong(&v20, 0LL);
  }

  else
  {
    -[TVSHUICameraViewControllerManager _dismissIfNecessary](v39, "_dismissIfNecessary");
  }

  objc_storeStrong(location, 0LL);
}

- (void)allCamerasViewControllerDidRequestDismissal:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  id v7 = 0LL;
  objc_storeStrong(&v7, a5);
  if (location[0] == v10->_currentAllCamerasViewController)
  {
    -[TVSHUICameraViewControllerManager dismissPictureInPictureViewControllerFromFullScreen:]( v10,  "dismissPictureInPictureViewControllerFromFullScreen:",  v10->_currentAllCamerasViewController);
    objc_storeStrong((id *)&v10->_currentAllCamerasViewController, 0LL);
    -[BSInvalidatable invalidate](v10->_fullScreenVisibilityAssertion, "invalidate");
    objc_storeStrong((id *)&v10->_fullScreenVisibilityAssertion, 0LL);
  }

  -[TVSHUICameraViewControllerManager _dismissIfNecessary](v10, "_dismissIfNecessary");
  if (v7) {
    (*((void (**)(void))v7 + 2))();
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentCameraWithContext:(id)a3 source:(int64_t)a4
{
  v63 = self;
  SEL v62 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  int64_t v60 = a4;
  if (!-[TVSHUICameraViewControllerManager isEnabled](v63, "isEnabled"))
  {
    id v59 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isEnabled]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v32 = NSStringFromSelector(v62);
      id v56 = v32;
      aClass = (objc_class *)objc_opt_class(v63);
      int v31 = NSStringFromClass(aClass);
      id v55 = v31;
      sub_1000056C8( (uint64_t)v65,  (uint64_t)v56,  (uint64_t)v55,  (uint64_t)v63,  (uint64_t)@"TVSHUICameraViewControllerManager.m",  433,  (uint64_t)v59);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v65,  0x3Au);

      objc_storeStrong(&v55, 0LL);
      objc_storeStrong(&v56, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v59 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A204LL);
  }

  id v54 = -[TVSHUICameraViewControllerManager _cameraItems](v63, "_cameraItems");
  id v53 = [location accessoryIdentifiers];
  id v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v54;
  id v30 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
  if (v30)
  {
    uint64_t v26 = *(void *)__b[2];
    uint64_t v27 = 0LL;
    id v28 = v30;
    while (1)
    {
      uint64_t v25 = v27;
      if (*(void *)__b[2] != v26) {
        objc_enumerationMutation(obj);
      }
      id v51 = *(id *)(__b[1] + 8 * v27);
      id v24 = v53;
      id v23 = [v51 homeKitObject];
      id v21 = [v23 uniqueIdentifier];
      unsigned __int8 v22 = objc_msgSend(v24, "containsObject:");

      if ((v22 & 1) != 0) {
        [v52 addObject:v51];
      }
      ++v27;
      if (v25 + 1 >= (unint64_t)v28)
      {
        uint64_t v27 = 0LL;
        id v28 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
        if (!v28) {
          break;
        }
      }
    }
  }

  -[TVSHUICameraViewControllerManager _startRestorationVisibilityWatchdogIfNeeded]( v63,  "_startRestorationVisibilityWatchdogIfNeeded");
  if ([location activationReason])
  {
    if ([location activationReason] == (id)1)
    {
      if ([v52 count] == (id)1)
      {
        id v16 = v63;
        id v15 = [v52 firstObject];
        id v38 =  -[TVSHUICameraViewControllerManager _createFullScreenViewControllerForCameraItem:]( v16,  "_createFullScreenViewControllerForCameraItem:");

        id v14 = [v38 cameraContentView];
        id v13 =  +[TVHMCameraContentViewStyle fullScreenStyle]( &OBJC_CLASS___TVHMCameraContentViewStyle,  "fullScreenStyle");
        objc_msgSend(v14, "applyStyle:");

        id v12 = [v38 cameraContentView];
        [v12 setWantsCameraViewControls:1 animated:1];

        id v11 = [v38 cameraContentView];
        [v11 setCentered:1];

        id v10 = [v38 cameraContentView];
        [v10 enableExternalUpdatesForVisibleReason];

        objc_storeStrong((id *)&v63->_currentViewControllerFullScreen, v38);
        id v9 = [v38 cameraContentView];
        [v9 reloadControlProviders:0];

        -[TVSHUICameraViewControllerManager _addChildViewController:completion:]( v63,  "_addChildViewController:completion:",  v38,  &stru_100014700);
        id v37 = v63->_fullScreenVisibilityAssertion;
        id v4 = (BSInvalidatable *) -[BSCompoundAssertion acquireForReason:]( v63->_visibilityCompoundAssertion,  "acquireForReason:",  @"Fullscreen");
        fullScreenVisibilityAssertion = v63->_fullScreenVisibilityAssertion;
        v63->_fullScreenVisibilityAssertion = v4;

        [v37 invalidate];
        -[TVSHUICameraViewControllerManager _didUpdatePictureInPictureState](v63, "_didUpdatePictureInPictureState");
        objc_storeStrong(&v37, 0LL);
        objc_storeStrong(&v38, 0LL);
      }

      else
      {
        BOOL v8 = objc_alloc(&OBJC_CLASS___TVHMUIAllCamerasFullScreenViewController);
        id v36 = -[TVHMUIAllCamerasFullScreenViewController initWithDismissalDelegate:]( v8,  "initWithDismissalDelegate:",  v63);
        [v36 setCameraItems:v52];
        [v36 setAllCameraItems:v54];
        objc_storeStrong((id *)&v63->_currentAllCamerasViewController, v36);
        -[TVSHUICameraViewControllerManager _addChildViewController:completion:]( v63,  "_addChildViewController:completion:",  v36,  &stru_100014720);
        id v35 = v63->_fullScreenVisibilityAssertion;
        int v6 = (BSInvalidatable *) -[BSCompoundAssertion acquireForReason:]( v63->_visibilityCompoundAssertion,  "acquireForReason:",  @"Fullscreen");
        id v7 = v63->_fullScreenVisibilityAssertion;
        v63->_fullScreenVisibilityAssertion = v6;

        [v35 invalidate];
        -[TVSHUICameraViewControllerManager _didUpdatePictureInPictureState](v63, "_didUpdatePictureInPictureState");
        objc_storeStrong(&v35, 0LL);
        objc_storeStrong(&v36, 0LL);
      }
    }
  }

  else
  {
    id v20 = v63;
    id v19 = [v52 firstObject];
    id v49 =  -[TVSHUICameraViewControllerManager _createFullScreenViewControllerForCameraItem:]( v20,  "_createFullScreenViewControllerForCameraItem:");

    id v48 =  -[BSCompoundAssertion acquireForReason:]( v63->_visibilityCompoundAssertion,  "acquireForReason:",  @"AddChildVC");
    objc_initWeak(&from, v63);
    id v17 = v63;
    id v18 = v49;
    v39 = _NSConcreteStackBlock;
    int v40 = -1073741824;
    int v41 = 0;
    v42 = sub_10000AB74;
    v43 = &unk_1000146E0;
    objc_copyWeak(&v46, &from);
    id v44 = v49;
    id v45 = v48;
    -[TVSHUICameraViewControllerManager _addChildViewController:completion:]( v17,  "_addChildViewController:completion:",  v18,  &v39);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v44, 0LL);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&from);
    objc_storeStrong(&v48, 0LL);
    objc_storeStrong(&v49, 0LL);
  }

  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (id)_createFullScreenViewControllerForCameraItem:(id)a3
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSHUICameraViewControllerManager _createFullScreenViewControllerForCameraItem:streaming:]( v6,  "_createFullScreenViewControllerForCameraItem:streaming:",  location[0],  1LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)_createFullScreenViewControllerForCameraItem:(id)a3 streaming:(BOOL)a4
{
  unsigned __int8 v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v20 = a4;
  id v19 = objc_alloc_init(&OBJC_CLASS___TVHMCameraContentView);
  id v6 = [location[0] profile];
  objc_msgSend(v19, "setCameraProfile:");

  id v8 = [location[0] homeKitObject];
  id v7 = [v8 uniqueIdentifier];
  objc_msgSend(v19, "setHfIdentifier:");

  id v9 = objc_alloc(&OBJC_CLASS___TVHMUIFullScreenCameraViewController);
  id v12 = -[TVSHUICameraViewControllerManager _cameraItems](v22, "_cameraItems");
  id v11 = [location[0] homeKitObject];
  id v10 = [v11 uniqueIdentifier];
  id v18 = -[TVHMUIFullScreenCameraViewController initWithCameraItems:focusedIdentifier:cameraContentView:]( v9,  "initWithCameraItems:focusedIdentifier:cameraContentView:",  v12);

  -[TVHMUIFullScreenCameraViewController setDismissalDelegate:](v18, "setDismissalDelegate:", v22);
  [v19 setFullScreenContainer:v18];
  id v17 = objc_alloc_init(&OBJC_CLASS___HMCameraStreamPreferences);
  [v17 setShouldTakeOwnershipOfExistingStream:1];
  id v13 = -[TVHMUIFullScreenCameraViewController cameraContentView](v18, "cameraContentView");
  [v13 setStreamPreferences:v17];

  -[TVHMUIFullScreenCameraViewController setStreaming:](v18, "setStreaming:", v20);
  id v14 = v18;
  id v15 =  +[TVHMCameraContentViewStyle pictureInPictureStyle]( &OBJC_CLASS___TVHMCameraContentViewStyle,  "pictureInPictureStyle");
  -[TVHMUIFullScreenCameraViewController showCameraViewWithStyle:](v14, "showCameraViewWithStyle:");

  id v16 = v18;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

- (void)_startPictureinPictureUsingFullScreenViewControllersCoolport:(id)a3 page:(unint64_t)a4 source:(int64_t)a5
{
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v37 = a4;
  int64_t v36 = a5;
  if (a4 < (unint64_t)[location[0] count])
  {
    id v34 =  -[BSCompoundAssertion acquireForReason:]( v39->_visibilityCompoundAssertion,  "acquireForReason:",  @"PIPTransition");
    v33 = (TVHMUIFullScreenCameraViewController *)[location[0] objectAtIndexedSubscript:v37];
    objc_storeStrong((id *)&v39->_swappingToFullScreenViewController, v39->_currentViewControllerPiP);
    objc_storeStrong((id *)&v39->_currentViewControllerPiP, v33);
    v32 = +[UIFocusSystem focusSystemForEnvironment:](&OBJC_CLASS___UIFocusSystem, "focusSystemForEnvironment:", v33);
    if (v39->_currentViewControllerFullScreen == v33)
    {
      objc_storeStrong((id *)&v39->_currentViewControllerFullScreen, 0LL);
      -[BSInvalidatable invalidate](v39->_fullScreenVisibilityAssertion, "invalidate");
      objc_storeStrong((id *)&v39->_fullScreenVisibilityAssertion, 0LL);
    }

    else if (v36 == 1 && v39->_currentAllCamerasViewController)
    {
      -[TVSHUICameraViewControllerManager dismissPictureInPictureViewControllerFromFullScreen:]( v39,  "dismissPictureInPictureViewControllerFromFullScreen:",  v39->_currentAllCamerasViewController);
    }

    else if (v36 == 1 && v33 != v39->_currentViewControllerFullScreen)
    {
      objc_storeStrong((id *)&v39->_previousViewControllerFullScreen, v39->_currentViewControllerFullScreen);
      -[TVSHUICameraViewControllerManager dismissPictureInPictureViewControllerFromFullScreen:]( v39,  "dismissPictureInPictureViewControllerFromFullScreen:",  v39->_currentViewControllerFullScreen);
    }

    memset(__b, 0, sizeof(__b));
    id v14 = location[0];
    id v15 = [v14 countByEnumeratingWithState:__b objects:v40 count:16];
    if (v15)
    {
      uint64_t v11 = *(void *)__b[2];
      uint64_t v12 = 0LL;
      id v13 = v15;
      while (1)
      {
        uint64_t v10 = v12;
        if (*(void *)__b[2] != v11) {
          objc_enumerationMutation(v14);
        }
        id v31 = *(id *)(__b[1] + 8 * v12);
        id v29 = [v31 cameraContentView];
        id v8 = v29;
        id v9 =  +[TVHMCameraContentViewStyle pictureInPictureTransitioningStyle]( &OBJC_CLASS___TVHMCameraContentViewStyle,  "pictureInPictureTransitioningStyle");
        objc_msgSend(v8, "applyStyle:");

        [v29 setWantsCameraViewControls:0 animated:1];
        objc_storeStrong(&v29, 0LL);
        ++v12;
        if (v10 + 1 >= (unint64_t)v13)
        {
          uint64_t v12 = 0LL;
          id v13 = [v14 countByEnumeratingWithState:__b objects:v40 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }

    id v28 =  -[TVSHUICameraViewControllerManager _pictureInPictureControllerForViewControllersCoolport:]( v39,  "_pictureInPictureControllerForViewControllersCoolport:",  location[0]);
    [v28 setInterfaceRestorer:v39];
    [v28 setDelegate:v39];
    id v7 = v28;
    id v5 = location[0];
    unint64_t v6 = v37;
    id v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = sub_10000B4BC;
    unsigned __int8 v22 = &unk_100014748;
    id v23 = v33;
    id v24 = location[0];
    uint64_t v25 = v39;
    id v26 = v34;
    uint64_t v27 = v32;
    [v7 startPIPWithViewControllers:v5 page:v6 withCompletion:&v18];
    objc_storeStrong((id *)&v27, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong((id *)&v25, 0LL);
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_storeStrong((id *)&v32, 0LL);
    objc_storeStrong((id *)&v33, 0LL);
    objc_storeStrong(&v34, 0LL);
    int v35 = 0;
  }

  else
  {
    int v35 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (id)_pictureInPictureControllerForViewController:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[NSMapTable objectForKey:](v7->_pictureInPictureControllers, "objectForKey:", location[0]);
  if (!v5)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___TVHMPIPController);

    [v5 setDelegate:v7];
    -[NSMapTable setObject:forKey:](v7->_pictureInPictureControllers, "setObject:forKey:", v5, location[0]);
  }

  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)_pictureInPictureControllerForViewControllersCoolport:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] count])
  {
    pictureInPictureControllers = v17->_pictureInPictureControllers;
    id v11 = [location[0] firstObject];
    id v14 = -[NSMapTable objectForKey:](pictureInPictureControllers, "objectForKey:");

    if (!v14)
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___TVHMPIPController);

      [v14 setDelegate:v17];
      memset(__b, 0, sizeof(__b));
      id obj = location[0];
      id v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)__b[2];
        uint64_t v6 = 0LL;
        id v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)__b[2] != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(__b[1] + 8 * v6);
          -[NSMapTable setObject:forKey:](v17->_pictureInPictureControllers, "setObject:forKey:", v14, v13);
          ++v6;
          if (v4 + 1 >= (unint64_t)v7)
          {
            uint64_t v6 = 0LL;
            id v7 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
            if (!v7) {
              break;
            }
          }
        }
      }
    }

    id v18 = v14;
    int v15 = 1;
    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    id v18 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v18;
}

- (void)_startRestorationVisibilityWatchdogIfNeeded
{
  id v14 = self;
  v13[1] = (id)a2;
  if (self->_currentViewControllerPiP)
  {
    v13[0] =  -[BSCompoundAssertion acquireForReason:]( v14->_visibilityCompoundAssertion,  "acquireForReason:",  @"RestorationWatchdog");
    uint64_t v12 = v14->_restorationWatchdog;
    uint64_t v4 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    uint64_t v5 = &_dispatch_main_q;
    uint64_t v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_10000BC18;
    uint64_t v10 = &unk_100014770;
    id v11 = v13[0];
    id v2 = -[BSWatchdog initWithTimeout:queue:completion:](v4, "initWithTimeout:queue:completion:", v5, &v6, 1.0);
    restorationWatchdog = v14->_restorationWatchdog;
    v14->_restorationWatchdog = v2;

    -[BSWatchdog start](v14->_restorationWatchdog, "start");
    -[BSWatchdog invalidate](v12, "invalidate");
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong((id *)&v12, 0LL);
    objc_storeStrong(v13, 0LL);
  }

- (void)_updateVisibilityState
{
  char v3 = -[BSCompoundAssertion isActive](self->_visibilityCompoundAssertion, "isActive") & 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cameraViewControllerManager:self didUpdateFullscreenState:v3 & 1];
}

- (void)_dismissIfNecessary
{
  if (!self->_currentViewControllerFullScreen && !self->_currentViewControllerPiP)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cameraViewControllerManagerRequestsDismissal:self];
  }

- (id)_stateDump
{
  v9[0] = @"isEnabled";
  id v7 = (id)BSStringFromBOOL(self->_enabled);
  v10[0] = v7;
  v9[1] = @"currentViewControllerPiP";
  uint64_t v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", self->_currentViewControllerPiP);
  v10[1] = v6;
  v9[2] = @"currentViewControllerFullScreen";
  uint64_t v5 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p",  self->_currentViewControllerFullScreen);
  v10[2] = v5;
  v9[3] = @"fullScreenVisibilityAssertion";
  char v3 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p",  self->_fullScreenVisibilityAssertion);
  v10[3] = v3;
  uint64_t v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL);

  return v4;
}

- (void)_removeAllAnimationsFromView:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = [location[0] layer];
  [v8 removeAllAnimations];

  memset(__b, 0, sizeof(__b));
  id obj = [location[0] subviews];
  id v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      -[TVSHUICameraViewControllerManager _removeAllAnimationsFromView:](v14, "_removeAllAnimationsFromView:", v12, v7);
      ++v6;
      id v7 = (id)v3;
      if (v4 + 1 >= v3)
      {
        uint64_t v6 = 0LL;
        id v7 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)showCameraView
{
}

- (id)transitionCameraContentView
{
  return -[TVHMUIFullScreenCameraViewController transitionCameraContentView]( self->_currentViewControllerFullScreen,  "transitionCameraContentView",  a2,  self);
}

- (id)_cameraItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained cameraItemsForCameraViewControllerManager:self];

  return v4;
}

- (void)_addChildViewController:(id)a3 completion:(id)a4
{
  int v20 = self;
  SEL v19 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  if (!v17)
  {
    id v16 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)");
    id v15 = &_os_log_default;
    char v14 = 16;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v15;
      os_log_type_t type = v14;
      id v10 = NSStringFromSelector(v19);
      uint64_t v6 = v10;
      uint64_t v13 = v6;
      id v4 = (objc_class *)objc_opt_class(v20);
      id v9 = NSStringFromClass(v4);
      uint64_t v12 = v9;
      sub_1000056C8( (uint64_t)v21,  (uint64_t)v6,  (uint64_t)v12,  (uint64_t)v20,  (uint64_t)@"TVSHUICameraViewControllerManager.m",  709,  (uint64_t)v16);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v21,  0x3Au);

      objc_storeStrong((id *)&v12, 0LL);
      objc_storeStrong((id *)&v13, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v16, "UTF8String"));
    __break(0);
    JUMPOUT(0x10000C36CLL);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v20->_delegate);
  [WeakRetained cameraViewControllerManager:v20 addChildViewController:location completion:v17];

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)_removeChildViewController:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  [WeakRetained cameraViewControllerManager:v5 removeChildViewController:location[0]];

  objc_storeStrong(location, 0LL);
}

- (void)_restoreChildViewController:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  [WeakRetained cameraViewControllerManager:v5 restoreChildViewController:location[0]];

  objc_storeStrong(location, 0LL);
}

- (void)_didUpdatePictureInPictureState
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 2LL);
  id v2 = v7[0];
  id v3 = -[TVHMUIFullScreenCameraViewController cameraIdentifier](v8->_currentViewControllerPiP, "cameraIdentifier");
  objc_msgSend(v2, "bs_safeAddObject:");

  id v4 = v7[0];
  id v5 =  -[TVHMUIFullScreenCameraViewController cameraIdentifier]( v8->_currentViewControllerFullScreen,  "cameraIdentifier");
  objc_msgSend(v4, "bs_safeAddObject:");

  id WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
  [WeakRetained cameraViewControllerManager:v8 didUpdateActiveCameraIdentifiers:v7[0]];

  objc_storeStrong(v7, 0LL);
}

- (void)controller:(id)a3 didChangeCurrentViewController:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  id v6 = v7;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHMUIFullScreenCameraViewController);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    objc_storeStrong((id *)&v9->_currentViewControllerPiP, v7);
    -[TVSHUICameraViewControllerManager _didUpdatePictureInPictureState](v9, "_didUpdatePictureInPictureState");
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSHUICameraViewControllerManagerDelegate)delegate
{
  return (TVSHUICameraViewControllerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PBUISystemHomeServiceCameraActivationContext)pendingActivationContext
{
  return self->_pendingActivationContext;
}

- (NSMapTable)pictureInPictureControllers
{
  return self->_pictureInPictureControllers;
}

- (BSCompoundAssertion)visibilityCompoundAssertion
{
  return self->_visibilityCompoundAssertion;
}

- (TVHMUIAllCamerasFullScreenViewController)currentAllCamerasViewController
{
  return self->_currentAllCamerasViewController;
}

- (TVHMUIFullScreenCameraViewController)currentViewControllerPiP
{
  return self->_currentViewControllerPiP;
}

- (TVHMUIFullScreenCameraViewController)currentViewControllerFullScreen
{
  return self->_currentViewControllerFullScreen;
}

- (TVHMUIFullScreenCameraViewController)previousViewControllerFullScreen
{
  return self->_previousViewControllerFullScreen;
}

- (TVHMUIFullScreenCameraViewController)swappingToFullScreenViewController
{
  return self->_swappingToFullScreenViewController;
}

- (BSInvalidatable)fullScreenVisibilityAssertion
{
  return self->_fullScreenVisibilityAssertion;
}

- (BSWatchdog)restorationWatchdog
{
  return self->_restorationWatchdog;
}

- (BSInvalidatable)stateDumpCaptureHandle
{
  return self->_stateDumpCaptureHandle;
}

- (void).cxx_destruct
{
}

@end