@interface TVSSHomeKitPanelPlatterController
- (BOOL)_buttonEvent:(__IOHIDEvent *)a3 containsUsage:(int64_t)a4;
- (BOOL)allowAnimatedUpdates;
- (BOOL)shouldUseLastKnownContentHeightForPlaceholderContentHeight;
- (BOOL)viewControllerShouldDismissForAllCamerasButton:(id)a3;
- (BSInvalidatable)disableTimeoutAssertion;
- (NSArray)cameraIdentifiers;
- (NSArray)orderedCameraItems;
- (NSMutableDictionary)camerasByIdentifier;
- (NSMutableDictionary)scenesByIdentifier;
- (TVHMCameraAnimationContext)animationContext;
- (TVSSHomeItemManager)itemManager;
- (TVSSHomeKitCameraRenderer)focusedRenderer;
- (TVSSHomeKitPanelPlatterController)initWithIdentifier:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)_presentActionSetPromptWithRenderer:(id)a3 context:(id)a4;
- (void)_stopStreamingAllCameras;
- (void)_toggleActionSetWithRenderer:(id)a3;
- (void)_updatePanelAnimated:(BOOL)a3;
- (void)_willDisplayRendererHostingView:(id)a3;
- (void)allCamerasViewControllerDidRequestDismissal:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)didUpdateFocusWithRendererGainingFocus:(id)a3 rendererLosingFocus:(id)a4;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)platterControllerDidActivate;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setAllowAnimatedUpdates:(BOOL)a3;
- (void)setAnimationContext:(id)a3;
- (void)setCameraIdentifiers:(id)a3;
- (void)setCamerasByIdentifier:(id)a3;
- (void)setDisableTimeoutAssertion:(id)a3;
- (void)setFocusedRenderer:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setOrderedCameraItems:(id)a3;
- (void)setScenesByIdentifier:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 completion:(id)a7;
@end

@implementation TVSSHomeKitPanelPlatterController

- (TVSSHomeKitPanelPlatterController)initWithIdentifier:(id)a3
{
  id v46 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = TVSSLocString(@"TVSSHomeKitTitle");
  v27 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  id v26 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v25 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 1LL);
  id v47 = v25;
  v24 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL);
  v23 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v26);
  v48 = v23;
  v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL);
  v21 =  +[TVSSHomeKitTitleRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSSHomeKitTitleRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"HomeKitTitle",  2LL,  v27);
  v49[0] = v21;
  v20 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Separator",  19LL,  0LL);
  v49[1] = v20;
  id v19 = TVSSLocString(@"TVSSHomeKitCamerasTitle");
  v18 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v17 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"CamerasTitle",  3LL);
  v49[2] = v17;
  id v16 = TVSSLocString(@"TVSSHomeKitScenesTitle");
  v15 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v14 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"ScenesTitle",  3LL);
  v49[3] = v14;
  id v44 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 4LL);

  sub_10013432C();
  *(void *)&__int128 v42 = v3;
  *((void *)&v42 + 1) = v4;
  *(void *)&__int128 v43 = v5;
  *((void *)&v43 + 1) = v6;
  id v41 = +[TVSPLayout placeholderLayoutWithHeight:](&OBJC_CLASS___TVSPLayout, "placeholderLayoutWithHeight:", 700.0);
  __int128 v39 = v42;
  __int128 v40 = v43;
  __int128 v37 = v42;
  __int128 v38 = v43;
  objc_msgSend(v41, "setContentInsets:", v42, v43);
  id v7 = v46;
  id v46 = 0LL;
  v36.receiver = v7;
  v36.super_class = (Class)&OBJC_CLASS___TVSSHomeKitPanelPlatterController;
  id v46 = -[TVSSHomeKitPanelPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v36,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"HomeKitPanel",  v41,  v44,  0LL);
  objc_storeStrong(&v46, v46);
  if (v46)
  {
    objc_initWeak(&from, v46);
    id v13 = v46;
    v29 = _NSConcreteStackBlock;
    int v30 = -1073741824;
    int v31 = 0;
    v32 = sub_100134378;
    v33 = &unk_1001B6940;
    objc_copyWeak(&v34, &from);
    [v13 setRendererProvider:&v29];
    v12 = -[TVSSHomeItemManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___TVSSHomeItemManager),  "initWithDelegate:",  v46);
    v8 = (void *)*((void *)v46 + 2);
    *((void *)v46 + 2) = v12;

    [*((id *)v46 + 2) disableExternalUpdatesWithReason:@"Inactive"];
    id v11 = +[HFHomeKitDispatcher sharedDispatcher](&OBJC_CLASS___HFHomeKitDispatcher, "sharedDispatcher");
    [v11 addHomeObserver:v46];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);
  }

  v10 = (TVSSHomeKitPanelPlatterController *)v46;
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v46, 0LL);
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  -[TVSSHomeKitPanelPlatterController _stopStreamingAllCameras](self, "_stopStreamingAllCameras");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSHomeKitPanelPlatterController;
  -[TVSSHomeKitPanelPlatterController dealloc](&v2, "dealloc");
}

- (void)platterControllerDidActivate
{
}

- (BOOL)shouldUseLastKnownContentHeightForPlaceholderContentHeight
{
  return 1;
}

- (void)didUpdateFocusWithRendererGainingFocus:(id)a3 rendererLosingFocus:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v34 = 0LL;
  objc_storeStrong(&v34, a4);
  char v33 = 0;
  id v28 = location[0];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraRenderer);
  if ((objc_opt_isKindOfClass(v28, v4) & 1) != 0)
  {
    id v32 = location[0];
    id v23 = [v32 cameraView];
    [v23 setCentered:1];

    id v24 = [v32 cameraView];
    [v24 enableExternalUpdatesForVisibleReason];

    id v25 = v34;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraRenderer);
    char isKindOfClass = 1;
    if ((objc_opt_isKindOfClass(v25, v5) & 1) == 0)
    {
      id v22 = v34;
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer);
      char isKindOfClass = objc_opt_isKindOfClass(v22, v6);
    }

    char v33 = isKindOfClass & 1;
    objc_storeStrong(&v32, 0LL);
  }

  else
  {
    id v21 = location[0];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer);
    if ((objc_opt_isKindOfClass(v21, v7) & 1) != 0)
    {
      id v31 = location[0];
      id v18 = [v31 mosaicView];
      [v18 setCentered:1];

      id v19 = v34;
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraRenderer);
      char v20 = 1;
      if ((objc_opt_isKindOfClass(v19, v8) & 1) == 0)
      {
        id v17 = v34;
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer);
        char v20 = objc_opt_isKindOfClass(v17, v9);
      }

      char v33 = v20 & 1;
      objc_storeStrong(&v31, 0LL);
    }
  }

  if ((v33 & 1) != 0)
  {
    id v16 = v34;
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraRenderer);
    if ((objc_opt_isKindOfClass(v16, v10) & 1) != 0)
    {
      id v30 = v34;
      id v14 = [v30 cameraView];
      [v14 setCentered:0];

      id v15 = [v30 cameraView];
      [v15 disableExternalUpdatesForVisibleReason];

      objc_storeStrong(&v30, 0LL);
    }

    else
    {
      id v13 = v34;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer);
      if ((objc_opt_isKindOfClass(v13, v11) & 1) != 0)
      {
        id v29 = v34;
        id v12 = [v29 mosaicView];
        [v12 setCentered:0];

        objc_storeStrong(&v29, 0LL);
      }
    }
  }

  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  v99 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v97 = 0LL;
  objc_storeStrong(&v97, a4);
  id v62 = -[TVSSHomeKitPanelPlatterController contentView](v99, "contentView");
  id v61 = [v62 window];
  id v60 = [v61 windowScene];
  id v96 = [v60 delegate];

  id v63 = location[0];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer);
  if ((objc_opt_isKindOfClass(v63, v4) & 1) != 0)
  {
    id v5 = objc_alloc(&OBJC_CLASS___TVHMUIAllCamerasFullScreenViewController);
    id v95 = [v5 initWithDismissalDelegate:v99];
    v56 = -[TVSSHomeKitPanelPlatterController orderedCameraItems](v99, "orderedCameraItems");
    objc_msgSend(v95, "setCameraItems:");

    id v58 = -[TVSSHomeKitPanelPlatterController contentView](v99, "contentView");
    id v57 = [v58 window];
    id v94 = [v57 rootViewController];

    [v94 presentViewController:v95 animated:1 completion:0];
    if (!v99->_disableTimeoutAssertion)
    {
      id v55 = [v96 attentionMonitor];
      uint64_t v6 = (BSInvalidatable *)[v55 acquireTimeoutDisabledAssertionWithReason:@"homekit-mosaic"];
      disableTimeoutAssertion = v99->_disableTimeoutAssertion;
      v99->_disableTimeoutAssertion = v6;
    }

    objc_storeStrong(&v94, 0LL);
    objc_storeStrong(&v95, 0LL);
  }

  else
  {
    id v54 = location[0];
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraRenderer);
    if ((objc_opt_isKindOfClass(v54, v8) & 1) != 0)
    {
      v35 = v99;
      id v38 = [location[0] identifier];
      id v37 =  -[TVSSHomeKitPanelPlatterController rendererHostingViewForIdentifier:]( v35,  "rendererHostingViewForIdentifier:");
      id v36 = [v37 floatingContentView];
      objc_msgSend(v36, "setBackgroundColor:forState:");

      id v93 = location[0];
      -[TVSSHomeKitPanelPlatterController setFocusedRenderer:](v99, "setFocusedRenderer:", v93);
      id v92 = [v93 content];
      id v91 = [v92 cameraItem];
      id v39 = [v91 homeKitObject];
      id v90 = [v39 uniqueIdentifier];

      id v41 = [v93 cameraView];
      id v40 = [v93 cameraView];
      [v40 frame];
      double v82 = v9;
      double v83 = v10;
      double v84 = v11;
      double v85 = v12;
      objc_msgSend(v41, "convertRect:toView:", 0, v9, v10, v11, v12);
      double v86 = v13;
      double v87 = v14;
      double v88 = v15;
      double v89 = v16;

      id v44 = [v93 cameraView];
      id v43 = [v44 superview];
      id v42 = [v93 cameraView];
      [v42 center];
      double v76 = v17;
      double v77 = v18;
      objc_msgSend(v43, "convertPoint:toView:", 0, v17, v18);
      double v78 = v19;
      double v79 = v20;

      id v45 = [v93 cameraView];
      [v45 bounds];
      uint64_t v72 = v21;
      uint64_t v73 = v22;
      *(void *)&__int128 v74 = v23;
      *((void *)&v74 + 1) = v24;
      __int128 v75 = v74;

      *(void *)&__int128 v70 = _TVSPFrameWithCenterAndSize(v78, v79, *(double *)&v74, *((double *)&v74 + 1));
      *((void *)&v70 + 1) = v25;
      *(void *)&__int128 v71 = v26;
      *((void *)&v71 + 1) = v27;
      __int128 v80 = v70;
      __int128 v81 = v71;
      id v69 = objc_alloc_init(&OBJC_CLASS___TVHMCameraAnimationContext);
      objc_msgSend(v69, "setContentViewOriginatingFrame:", v70, v71);
      objc_msgSend(v69, "setContentViewDestinationFrame:", v86, v87, v88, v89);
      id v46 = +[TVHMCameraViewStyle defaultStyle](&OBJC_CLASS___TVHMCameraViewStyle, "defaultStyle");
      [v46 floatingContentViewFocusSizeIncrease];
      objc_msgSend(v69, "setFocusSizeIncrease:");

      id v47 = +[TVHMCameraViewStyle defaultStyle](&OBJC_CLASS___TVHMCameraViewStyle, "defaultStyle");
      [v47 floatingContentViewCornerRadius];
      objc_msgSend(v69, "setCameraCornerRadius:");

      -[TVSSHomeKitPanelPlatterController setAnimationContext:](v99, "setAnimationContext:", v69);
      id v48 = objc_alloc(&OBJC_CLASS___TVHMUIFullScreenCameraViewController);
      v50 = -[TVSSHomeKitPanelPlatterController orderedCameraItems](v99, "orderedCameraItems");
      id v49 = [v93 cameraView];
      id v68 = objc_msgSend(v48, "initWithCameraItems:focusedIdentifier:cameraContentView:", v50, v90);

      [v68 setModalPresentationStyle:4];
      [v68 setTransitioningDelegate:v99];
      [v68 setDismissalDelegate:v99];
      id v52 = -[TVSSHomeKitPanelPlatterController contentView](v99, "contentView");
      id v51 = [v52 window];
      id v67 = [v51 rootViewController];

      id v53 = [v93 cameraView];
      [v53 setFullScreenContainer:v68];

      [v67 presentViewController:v68 animated:1 completion:0];
      if (!v99->_disableTimeoutAssertion)
      {
        id v34 = [v96 attentionMonitor];
        id v28 = (BSInvalidatable *) [v34 acquireTimeoutDisabledAssertionWithReason:@"homekit-camera"];
        id v29 = v99->_disableTimeoutAssertion;
        v99->_disableTimeoutAssertion = v28;
      }

      objc_storeStrong(&v67, 0LL);
      objc_storeStrong(&v68, 0LL);
      objc_storeStrong(&v69, 0LL);
      objc_storeStrong(&v90, 0LL);
      objc_storeStrong(&v91, 0LL);
      objc_storeStrong(&v92, 0LL);
      objc_storeStrong(&v93, 0LL);
    }

    else
    {
      id v33 = location[0];
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitSceneRenderer);
      if ((objc_opt_isKindOfClass(v33, v30) & 1) != 0)
      {
        id v66 = location[0];
        id v65 = [v66 content];
        id v64 = [v65 actionSetItem];
        id v31 = [v64 actionSet];
        unsigned __int8 v32 = [v31 requiresDeviceUnlock];

        if ((v32 & 1) != 0) {
          -[TVSSHomeKitPanelPlatterController _presentActionSetPromptWithRenderer:context:]( v99,  "_presentActionSetPromptWithRenderer:context:",  v66,  v97);
        }
        else {
          -[TVSSHomeKitPanelPlatterController _toggleActionSetWithRenderer:](v99, "_toggleActionSetWithRenderer:", v66);
        }
        objc_storeStrong(&v64, 0LL);
        objc_storeStrong(&v65, 0LL);
        objc_storeStrong(&v66, 0LL);
      }
    }
  }

  objc_storeStrong(&v96, 0LL);
  objc_storeStrong(&v97, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentActionSetPromptWithRenderer:(id)a3 context:(id)a4
{
  id v61 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v59 = 0LL;
  objc_storeStrong(&v59, a4);
  id v58 = [location[0] content];
  id v57 = [v58 actionSetItem];
  id v29 = +[NSUserDefaults pineBoardServicesUserDefaults](&OBJC_CLASS___NSUserDefaults, "pineBoardServicesUserDefaults");
  id v30 = objc_msgSend(v29, "pbs_secureHomeKitAccessoryAllowedRemotes");

  id v56 = v30;
  BOOL v55 = 0;
  id v31 = [v59 selectedPressesEvent];
  id v32 = [v31 _hidEvent];

  id v54 = v32;
  unsigned __int8 v33 = 1;
  if ((+[TVSBluetoothRemoteUtilities isB239ButtonEvent:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "isB239ButtonEvent:",  v32) & 1) == 0) {
    unsigned __int8 v33 = -[TVSSHomeKitPanelPlatterController _buttonEvent:containsUsage:]( v61,  "_buttonEvent:containsUsage:",  v54,  16LL);
  }
  BOOL v53 = v33 & 1;
  if (v56 == (id)1) {
    BOOL v55 = v53;
  }
  else {
    BOOL v55 = v56 == (id)2;
  }
  id v52 = HomeKitLog();
  os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
  {
    if (v55) {
      uint64_t v4 = "yes";
    }
    else {
      uint64_t v4 = "no";
    }
    if (v53) {
      id v5 = "yes";
    }
    else {
      id v5 = "no";
    }
    sub_100135E58((uint64_t)v62, (uint64_t)v4, (uint64_t)v56, (uint64_t)v5);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v52,  v51,  "Allowing secure accessory control %s with allowed remotes pref %ld isAppleRemoteEvent %s",  v62,  0x20u);
  }

  objc_storeStrong(&v52, 0LL);
  id v50 = 0LL;
  id v49 = 0LL;
  if (v55)
  {
    id v26 = [v57 latestResults];
    id v27 = [v26 objectForKeyedSubscript:HFResultDisplayTitleKey];
    char v46 = 0;
    char v44 = 0;
    if (v27)
    {
      id v10 = v27;
    }

    else
    {
      id v47 = [v57 latestResults];
      char v46 = 1;
      id v45 = [v47 objectForKeyedSubscript:HFResultDisplayTitlePlaceholderKey];
      char v44 = 1;
      id v10 = v45;
    }

    id v48 = v10;
    if ((v44 & 1) != 0) {

    }
    if ((v46 & 1) != 0) {
    id v25 = TVSSLocString(@"TVSSHomeKitSecureScenePromptAlertTitle");
    }
    double v11 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v48);
    id v12 = v50;
    id v50 = v11;

    id v13 = TVSSLocString(@"TVSSHomeKitSecureScenePromptAlertDescription");
    id v14 = v49;
    id v49 = v13;

    objc_storeStrong(&v48, 0LL);
  }

  else
  {
    id v6 = TVSSLocString(@"TVSSHomeKitSecureSceneFailedAlertTitle");
    id v7 = v50;
    id v50 = v6;

    id v8 = TVSSLocString(@"TVSSHomeKitSecureSceneFailedAlertDescription");
    id v9 = v49;
    id v49 = v8;
  }

  id v43 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v50,  v49,  1LL);
  if (v55)
  {
    id v42 = objc_alloc_init(&OBJC_CLASS___TVHMSecureAccessoryHeaderViewController);
    -[UIAlertController _setHeaderContentViewController:](v43, "_setHeaderContentViewController:", v42);
    double v19 = v43;
    id v21 = TVSSLocString(@"TVSSHomeKitSecureScenePromptAlertButtonTitle");
    v35 = _NSConcreteStackBlock;
    int v36 = -1073741824;
    int v37 = 0;
    id v38 = sub_100135EC0;
    id v39 = &unk_1001BBED8;
    id v40 = v61;
    id v41 = location[0];
    double v20 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  &v35);
    -[UIAlertController addAction:](v19, "addAction:");

    uint64_t v22 = v43;
    id v24 = TVSSLocString(@"TVSSHomeKitSecureScenePromptAlertCancelButtonTitle");
    uint64_t v23 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
    -[UIAlertController addAction:](v22, "addAction:");

    objc_storeStrong(&v41, 0LL);
    objc_storeStrong((id *)&v40, 0LL);
    objc_storeStrong(&v42, 0LL);
  }

  else
  {
    id v18 = TVSSLocString(@"TVSSHomeKitSecureSceneFailedAlertButtonTitle");
    double v17 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
    -[UIAlertController addAction:](v43, "addAction:");
  }

  id v16 = -[TVSSHomeKitPanelPlatterController contentView](v61, "contentView");
  id v15 = [v16 window];
  id v34 = [v15 rootViewController];

  objc_msgSend(v34, "presentViewController:animated:completion:", v43, 1);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong((id *)&v43, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_toggleActionSetWithRenderer:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v30 = 0LL;
  id v29 = [location[0] content];
  id v28 = [v29 actionSetItem];
  id v10 = [v28 latestResults];
  id v9 = [v10 valueForKey:HFResultPrimaryStateKey];
  BOOL v11 = [v9 integerValue] != (id)2;

  if (v11) {
    id v3 = [v28 executeActionSet];
  }
  else {
    id v3 = [v28 turnOffActionSet];
  }
  id v4 = v30;
  id v30 = v3;

  id v7 = v30;
  double v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  uint64_t v23 = sub_100136244;
  id v24 = &unk_1001BBF00;
  id v25 = v28;
  id v26 = v29;
  id v27 = location[0];
  id v5 = [v7 addSuccessBlock:&v20];
  id v8 = v30;
  id v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = sub_1001363B0;
  id v16 = &unk_1001BBF28;
  id v17 = v28;
  id v18 = v29;
  id v19 = location[0];
  id v6 = [v8 addFailureBlock:&v12];
  [location[0] showProgressViewWithFuture:v30];
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_willDisplayRendererHostingView:(id)a3
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = -[TVSSHomeKitPanelPlatterController cameraIdentifiers](v20, "cameraIdentifiers");
  id v13 = [location[0] identifier];
  char v17 = 0;
  unsigned __int8 v14 = 1;
  if (!-[NSArray containsObject:](v12, "containsObject:"))
  {
    id v18 = [location[0] identifier];
    char v17 = 1;
    unsigned __int8 v14 = [v18 isEqualToString:@"CameraMosaic"];
  }

  if ((v17 & 1) != 0) {

  }
  if ((v14 & 1) != 0)
  {
    id v11 = [location[0] floatingContentView];
    [v11 setShowsHighContrastFocusIndicator:1];
  }

  id v8 = +[TVHMCameraViewStyle defaultStyle](&OBJC_CLASS___TVHMCameraViewStyle, "defaultStyle");
  [v8 floatingContentViewHighContrastIndicatorCornerRadius];
  double v6 = v3;
  id v7 = [location[0] floatingContentView];
  [v7 setHighContrastFocusIndicatorCornerRadius:v6];

  id v10 = +[TVHMCameraViewStyle defaultStyle](&OBJC_CLASS___TVHMCameraViewStyle, "defaultStyle");
  [v10 floatingContentViewHighContrastIndicatorOutset];
  double v15 = v4;
  double v16 = v5;
  id v9 = [location[0] floatingContentView];
  objc_msgSend(v9, "setHighContrastFocusIndicatorOutset:", v15, v16);

  objc_storeStrong(location, 0LL);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  double v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  id v11 = objc_alloc_init(&OBJC_CLASS___TVHMUICameraAnimationController);
  id v8 = -[TVSSHomeKitPanelPlatterController animationContext](v15, "animationContext");
  -[TVHMCameraAnimationContext setPresenting:](v8, "setPresenting:", 1LL);

  id v9 = -[TVSSHomeKitPanelPlatterController animationContext](v15, "animationContext");
  objc_msgSend(v11, "setAnimationContext:");

  id v10 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = objc_alloc_init(&OBJC_CLASS___TVHMUICameraAnimationController);
  double v4 = -[TVSSHomeKitPanelPlatterController animationContext](v9, "animationContext");
  -[TVHMCameraAnimationContext setPresenting:](v4, "setPresenting:", 0LL);

  double v5 = -[TVSSHomeKitPanelPlatterController animationContext](v9, "animationContext");
  objc_msgSend(v7, "setAnimationContext:");

  id v6 = v7;
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  if ([v10 isInitialUpdate])
  {
    objc_msgSend(v10, "performWithOptions:");
    -[TVSSHomeKitPanelPlatterController _updatePanelAnimated:](v12, "_updatePanelAnimated:", 0LL);
    double v4 = v12;
    id v13 = @"HomeKitTitle";
    id v8 = [location[0] home];
    id v7 = [v8 name];
    id v6 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
    unsigned __int8 v14 = v6;
    double v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL);
    -[TVSSHomeKitPanelPlatterController applyContent:](v4, "applyContent:");
  }

  else
  {
    [v10 performWithOptions:1];
    -[TVSSHomeKitPanelPlatterController _updatePanelAnimated:](v12, "_updatePanelAnimated:", 1LL);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  if ([v18 isActionSet])
  {
    id v16 = v18;
    id v8 = [v16 homeKitObject];
    id v15 = [v8 uniqueIdentifier];

    id v10 = -[TVSSHomeKitPanelPlatterController scenesByIdentifier](v20, "scenesByIdentifier");
    id v9 = [v15 UUIDString];
    unsigned __int8 v14 = (TVSSActionSetItem *)-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:");

    id v13 = v18;
    if (v14)
    {
      -[TVSSActionSetItem updateWithHFItem:](v14, "updateWithHFItem:", v13);
    }

    else
    {
      unsigned __int8 v14 = -[TVSSActionSetItem initWithHFItem:](objc_alloc(&OBJC_CLASS___TVSSActionSetItem), "initWithHFItem:", v13);
    }

    double v5 = v14;
    id v7 = -[TVSSHomeKitPanelPlatterController scenesByIdentifier](v20, "scenesByIdentifier");
    id v6 = [v15 UUIDString];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5);

    -[TVSSHomeKitPanelPlatterController _updatePanelAnimated:](v20, "_updatePanelAnimated:", 1LL);
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong((id *)&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v16, 0LL);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)allCamerasViewControllerDidRequestDismissal:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v7 = location[0];
  id v9 = v10;
  id v8 = v13;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  BOOL v16 = a6;
  id v15 = 0LL;
  objc_storeStrong(&v15, a7);
  [v17 removeNearbyAccessoryControlsFromParentViewControllerAnimated:0];
  id v12 = location[0];
  BOOL v11 = v16;
  id v14 = v15;
  id v13 = v20;
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", v11);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
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

- (void)_updatePanelAnimated:(BOOL)a3
{
  id v90 = self;
  SEL v89 = a2;
  BOOL v88 = a3;
  id v87 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  sub_10013432C();
  double v83 = v3;
  double v84 = v4;
  double v85 = v5;
  double v86 = v6;
  sub_10013432C();
  *(void *)&__int128 v81 = v7;
  *((void *)&v81 + 1) = v8;
  *(void *)&__int128 v82 = v9;
  *((void *)&v82 + 1) = v10;
  +[TVSPConstants defaultRowHeight](&OBJC_CLASS___TVSPConstants, "defaultRowHeight");
  os_log_type_t v51 =  +[TVSPRow rowWithIdentifier:height:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:contentInsets:",  @"HomeKitTitle");
  objc_msgSend(v87, "addObject:");

  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v52 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v87, "addObject:");

  id v53 =  +[TVSPRow separatorWithIdentifier:contentInsets:]( &OBJC_CLASS___TVSPRow,  "separatorWithIdentifier:contentInsets:",  @"Separator",  v83,  v84,  v85,  v86);
  objc_msgSend(v87, "addObject:");

  id v80 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v54 = -[TVSSHomeKitPanelPlatterController itemManager](v90, "itemManager");
  id v79 = -[TVSSHomeItemManager displayedItemsInSection:](v54, "displayedItemsInSection:");

  -[TVSSHomeKitPanelPlatterController setOrderedCameraItems:](v90, "setOrderedCameraItems:", v79);
  if ([v79 count])
  {
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v44 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v87, "addObject:");

    +[TVSPConstants defaultRowHeight](&OBJC_CLASS___TVSPConstants, "defaultRowHeight");
    id v45 =  +[TVSPRow rowWithIdentifier:height:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:contentInsets:",  @"CamerasTitle");
    objc_msgSend(v87, "addObject:");

    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v46 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v87, "addObject:");

    id v47 = v87;
    unsigned __int8 v11 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI");
    double v12 = 263.0;
    if ((v11 & 1) == 0) {
      double v12 = 243.0;
    }
    id v48 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"CamerasScroller",  v12);
    objc_msgSend(v47, "addObject:");

    double v78 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v79 count]);
    memset(__b, 0, sizeof(__b));
    id obj = v79;
    id v50 = [obj countByEnumeratingWithState:__b objects:v92 count:16];
    if (v50)
    {
      uint64_t v41 = *(void *)__b[2];
      uint64_t v42 = 0LL;
      id v43 = v50;
      while (1)
      {
        uint64_t v40 = v42;
        if (*(void *)__b[2] != v41) {
          objc_enumerationMutation(obj);
        }
        id v77 = *(id *)(__b[1] + 8 * v42);
        id v39 = [v77 homeKitObject];
        id v75 = [v39 uniqueIdentifier];

        id v74 = [v75 UUIDString];
        [v80 setObject:v77 forKeyedSubscript:v74];
        -[NSMutableArray addObject:](v78, "addObject:", v74);
        objc_storeStrong(&v74, 0LL);
        objc_storeStrong(&v75, 0LL);
        ++v42;
        if (v40 + 1 >= (unint64_t)v43)
        {
          uint64_t v42 = 0LL;
          id v43 = [obj countByEnumeratingWithState:__b objects:v92 count:16];
          if (!v43) {
            break;
          }
        }
      }
    }

    id v38 = -[NSMutableArray copy](v78, "copy");
    -[TVSSHomeKitPanelPlatterController setCameraIdentifiers:](v90, "setCameraIdentifiers:");

    -[TVSSHomeKitPanelPlatterController setCamerasByIdentifier:](v90, "setCamerasByIdentifier:", v80);
    objc_storeStrong((id *)&v78, 0LL);
  }

  id v73 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  int v37 = -[TVSSHomeKitPanelPlatterController itemManager](v90, "itemManager");
  id v36 = -[TVSSHomeItemManager displayedItemsInSection:](v37, "displayedItemsInSection:", 1LL);
  id v72 = [v36 mutableCopy];

  if ([v72 count])
  {
    id v28 = v87;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v29 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v28, "addObject:");

    id v30 = v87;
    +[TVSPConstants defaultRowHeight](&OBJC_CLASS___TVSPConstants, "defaultRowHeight");
    id v31 =  +[TVSPRow rowWithIdentifier:height:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:contentInsets:",  @"ScenesTitle");
    objc_msgSend(v30, "addObject:");

    id v32 = v87;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v33 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v32, "addObject:");

    __int128 v71 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v72 count]);
    memset(v69, 0, sizeof(v69));
    id v34 = v72;
    id v35 = [v34 countByEnumeratingWithState:v69 objects:v91 count:16];
    if (v35)
    {
      uint64_t v25 = *(void *)v69[2];
      uint64_t v26 = 0LL;
      id v27 = v35;
      while (1)
      {
        uint64_t v24 = v26;
        if (*(void *)v69[2] != v25) {
          objc_enumerationMutation(v34);
        }
        id v70 = *(id *)(v69[1] + 8 * v26);
        id v22 = [v70 homeKitObject];
        id v68 = [v22 uniqueIdentifier];

        id v67 = [v68 UUIDString];
        -[NSMutableArray addObject:](v71, "addObject:", v67);
        uint64_t v23 = -[TVSSHomeKitPanelPlatterController scenesByIdentifier](v90, "scenesByIdentifier");
        id v66 = -[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v67);

        id v65 = v70;
        if (v66)
        {
          [v66 updateWithHFItem:v65];
        }

        else
        {
          id v13 = objc_alloc(&OBJC_CLASS___TVSSActionSetItem);
          id v14 = -[TVSSActionSetItem initWithHFItem:](v13, "initWithHFItem:", v65);
          id v15 = v66;
          id v66 = v14;
        }

        [v73 setObject:v66 forKeyedSubscript:v67];
        objc_storeStrong(&v65, 0LL);
        objc_storeStrong(&v66, 0LL);
        objc_storeStrong(&v67, 0LL);
        objc_storeStrong(&v68, 0LL);
        ++v26;
        if (v24 + 1 >= (unint64_t)v27)
        {
          uint64_t v26 = 0LL;
          id v27 = [v34 countByEnumeratingWithState:v69 objects:v91 count:16];
          if (!v27) {
            break;
          }
        }
      }
    }

    id v20 = v87;
    id v19 = v71;
    +[TVSPConstants smediumRowHeight](&OBJC_CLASS___TVSPConstants, "smediumRowHeight");
    id v21 =  +[TVSPRow rowsForIdentifiers:height:columnCount:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowsForIdentifiers:height:columnCount:contentInsets:",  v19,  2LL);
    objc_msgSend(v20, "addObjectsFromArray:");

    -[TVSSHomeKitPanelPlatterController setScenesByIdentifier:](v90, "setScenesByIdentifier:", v73);
    objc_storeStrong((id *)&v71, 0LL);
  }

  id v17 = v87;
  id v18 = -[TVSSHomeKitPanelPlatterController renderers](v90, "renderers");
  id v64 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v17);

  __int128 v62 = v81;
  __int128 v63 = v82;
  __int128 v60 = v81;
  __int128 v61 = v82;
  -[TVSPLayout setContentInsets:](v64, "setContentInsets:", v81, v82);
  char v57 = 0;
  char v55 = 0;
  if (-[TVSSHomeKitPanelPlatterController allowAnimatedUpdates](v90, "allowAnimatedUpdates"))
  {
    id v58 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    char v57 = 1;
    id v16 = v58;
  }

  else
  {
    id v56 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    char v55 = 1;
    id v16 = v56;
  }

  id v59 = v16;
  if ((v55 & 1) != 0) {

  }
  if ((v57 & 1) != 0) {
  -[TVSSHomeKitPanelPlatterController reloadContent](v90, "reloadContent");
  }
  -[TVSSHomeKitPanelPlatterController applyLayout:animator:](v90, "applyLayout:animator:", v64, v59);
  -[TVSSHomeKitPanelPlatterController _updatePlatterSizeWithAnimator:](v90, "_updatePlatterSizeWithAnimator:", v59);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(&v79, 0LL);
  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(&v87, 0LL);
}

- (void)_stopStreamingAllCameras
{
  id v15 = self;
  SEL v14 = a2;
  memset(__b, 0, sizeof(__b));
  id obj = -[TVSSHomeKitPanelPlatterController renderers](v15, "renderers");
  id v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v7);
      id v4 = v13;
      uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSHomeKitCameraRenderer);
      if ((objc_opt_isKindOfClass(v4, v2) & 1) != 0)
      {
        id v11 = v13;
        id v3 = [v11 cameraView];
        [v3 setCentered:0];

        objc_storeStrong(&v11, 0LL);
      }

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
}

- (BOOL)_buttonEvent:(__IOHIDEvent *)a3 containsUsage:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v10 = 0;
  theArray = (const __CFArray *)IOHIDEventGetChildren(a3);
  if (theArray)
  {
    for (CFIndex idx = 0LL; idx < CFArrayGetCount(theArray); ++idx)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
      uint64_t IntegerValue = IOHIDEventGetIntegerValue(ValueAtIndex, 0x10000LL);
      uint64_t v5 = IOHIDEventGetIntegerValue(ValueAtIndex, 65537LL);
      if (IntegerValue == 65299 && v5 == a4) {
        return 1;
      }
    }
  }

  return v10;
}

- (TVSSHomeItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (NSMutableDictionary)camerasByIdentifier
{
  return self->_camerasByIdentifier;
}

- (void)setCamerasByIdentifier:(id)a3
{
}

- (NSMutableDictionary)scenesByIdentifier
{
  return self->_scenesByIdentifier;
}

- (void)setScenesByIdentifier:(id)a3
{
}

- (NSArray)cameraIdentifiers
{
  return self->_cameraIdentifiers;
}

- (void)setCameraIdentifiers:(id)a3
{
}

- (NSArray)orderedCameraItems
{
  return self->_orderedCameraItems;
}

- (void)setOrderedCameraItems:(id)a3
{
}

- (TVHMCameraAnimationContext)animationContext
{
  return self->_animationContext;
}

- (void)setAnimationContext:(id)a3
{
}

- (BOOL)allowAnimatedUpdates
{
  return self->_allowAnimatedUpdates;
}

- (void)setAllowAnimatedUpdates:(BOOL)a3
{
  self->_allowAnimatedUpdates = a3;
}

- (BSInvalidatable)disableTimeoutAssertion
{
  return self->_disableTimeoutAssertion;
}

- (void)setDisableTimeoutAssertion:(id)a3
{
}

- (TVSSHomeKitCameraRenderer)focusedRenderer
{
  return self->_focusedRenderer;
}

- (void)setFocusedRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end