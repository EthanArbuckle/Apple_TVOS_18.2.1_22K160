@interface PBAppSwitcherManager
+ (id)defaultManager;
- (BOOL)_shouldPresentAppSwitcherForGestureActivation;
- (BOOL)dismissAppSwitcherToBundleIdentifier:(id)a3 completion:(id)a4;
- (BOOL)isActive;
- (BOOL)isDismissing;
- (BOOL)shouldActivateForProcessWithIdentifier:(id)a3;
- (PBAppSwitcherDataSource)activeAppSwitcherDataSource;
- (PBAppSwitcherManager)init;
- (PBAppSwitcherViewController)presentedViewController;
- (PBSystemGestureHandle)dismissGesture;
- (PBSystemGestureHandle)presentGesture;
- (PBSystemUIPresenting)presentationDelegate;
- (id)_init;
- (void)dealloc;
- (void)presentAppSwitcherWithFocusedBundleIdentifier:(id)a3 completion:(id)a4;
- (void)setPresentationDelegate:(id)a3;
@end

@implementation PBAppSwitcherManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B22C8;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004709A0 != -1) {
    dispatch_once(&qword_1004709A0, block);
  }
  return (id)qword_100470998;
}

- (PBAppSwitcherManager)init
{
  return 0LL;
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBAppSwitcherManager;
  v2 = -[PBAppSwitcherManager init](&v15, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    -[PBAppSwitcherManager setPresentationDelegate:](v2, "setPresentationDelegate:", v3);

    objc_initWeak(&location, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B24AC;
    v12[3] = &unk_1003D1020;
    objc_copyWeak(&v13, &location);
    v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:32 actionHandler:v12];
    presentGesture = v2->_presentGesture;
    v2->_presentGesture = v5;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000B2584;
    v10[3] = &unk_1003D1020;
    objc_copyWeak(&v11, &location);
    v7 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:33 actionHandler:v10];
    dismissGesture = v2->_dismissGesture;
    v2->_dismissGesture = v7;

    -[PBSystemGestureHandle acquire](v2->_presentGesture, "acquire");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBAppSwitcherManager;
  -[PBAppSwitcherManager dealloc](&v3, "dealloc");
}

- (BOOL)shouldActivateForProcessWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v5 = [v4 appSwitcherAllowed];

  if (v5)
  {
    if ([v3 isEqual:@"com.apple.HeadBoard"])
    {
      BOOL v6 = 1;
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appInfoControllerWithEnabledApps]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appInfos]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v3]);
      BOOL v6 = v10 != 0LL;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isActive
{
  return self->_activeAppSwitcherDataSource != 0LL;
}

- (void)presentAppSwitcherWithFocusedBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (-[PBAppSwitcherManager isActive](self, "isActive"))
  {
    if (v7)
    {
      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherDataSource focusedProcessItem]( self->_activeAppSwitcherDataSource,  "focusedProcessItem"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        uint64_t v10 = (uint64_t)[v6 isEqual:v9];
      }

      else
      {
        uint64_t v10 = 1LL;
      }

      v7[2](v7, v10);
    }
  }

  else
  {
    id v11 = (__CFString *)v6;
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentApplicationSceneHandle]);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 clientProcessBundleIdentifier]);

      id v15 = sub_1000F68BC();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Active application is %{public}@",  buf,  0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activeTransition]);

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 openRequest]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 toAppInfo]);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);

        id v21 = sub_1000F68BC();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v18 openRequest]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 fromAppInfo]);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
          *(_DWORD *)buf = 138543618;
          v52 = v25;
          __int16 v53 = 2114;
          v54 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Active transition from %{public}@ to %{public}@",  buf,  0x16u);
        }
      }

      else
      {
        id v11 = v14;
      }

      if (!v11)
      {
        id v26 = sub_1000F68BC();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          sub_10027A990(v27);
        }

        id v11 = @"com.apple.HeadBoard";
      }
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 mainWorkspace]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 geometry]);

    v31 = -[PBAppSwitcherDataSource initWithFocusedProcessBundleID:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherDataSource),  "initWithFocusedProcessBundleID:",  v11);
    v32 = -[PBAppSwitcherViewController initWithWorkspaceGeometry:dataSource:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherViewController),  "initWithWorkspaceGeometry:dataSource:",  v30,  v31);
    objc_storeStrong((id *)&self->_presentedViewController, v32);
    objc_storeStrong((id *)&self->_activeAppSwitcherDataSource, v31);
    -[PBSystemGestureHandle acquire](self->_dismissGesture, "acquire");
    -[PBSystemGestureHandle relinquish](self->_presentGesture, "relinquish");
    if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
    {
      v33 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransition);
      v34 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
      v46 = v31;
      v35 = v11;
      v36 = v7;
      v37 = v30;
      id v38 = v6;
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"DismissAirPlay",  @"DismissDialogFragment",  @"DismissDictationOverlay",  @"DismissNowPlayingOverlay",  @"DismissPiPEditingControls",  @"DismissRoutingUI",  @"DismissSiriFragment",  @"DismissControlCenterFragment",  0LL));
      -[PBCoordinatedTransitionToken setCoordinatedFragmentTypes:](v34, "setCoordinatedFragmentTypes:", v39);
      v40 = objc_alloc_init(&OBJC_CLASS___PBDismissAirPlayTransitionHint);
      -[PBDismissAirPlayTransitionHint setRequiresFullscreenPresentation:]( v40,  "setRequiresFullscreenPresentation:",  1LL);
      -[PBCoordinatedTransitionToken addTransitionHint:](v34, "addTransitionHint:", v40);
      -[PBCoordinatedTransition setCoordinatedTransitionToken:](v33, "setCoordinatedTransitionToken:", v34);

      id v6 = v38;
      v30 = v37;
      v7 = v36;
      id v11 = v35;
      v31 = v46;
    }

    else
    {
      v33 = 0LL;
    }

    v41 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayContext);
    -[PBMutableSystemOverlayContext setLayoutLevel:](v41, "setLayoutLevel:", 2LL);
    -[PBMutableSystemOverlayContext setSceneDeactivationReasons:](v41, "setSceneDeactivationReasons:", 8LL);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherManager presentationDelegate](self, "presentationDelegate"));
    id v43 = -[PBMutableSystemOverlayContext copy](v41, "copy");
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000B2C38;
    v47[3] = &unk_1003D5380;
    v48 = v33;
    v49 = v32;
    v50 = v7;
    v44 = v32;
    v45 = v33;
    [v42 presentSystemUI:v44 withContext:v43 animated:1 transitionBlock:v47];
  }
}

- (BOOL)dismissAppSwitcherToBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBAppSwitcherManager isActive](self, "isActive") && !self->_dismissing)
  {
    v9 = self->_presentedViewController;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherViewController dataSource](v9, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 focusedProcessItem]);

    if (v6
      || ([v12 isPendingDeletion] & 1) == 0
      && (id v6 = (id)objc_claimAutoreleasedReturnValue([v12 identifier])) != 0)
    {
      self->_dismissing = 1;
      objc_initWeak(&location, self);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherManager presentationDelegate](self, "presentationDelegate"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000B2FBC;
      v18[3] = &unk_1003D53D0;
      v19 = v9;
      id v6 = v6;
      id v20 = v6;
      objc_copyWeak(&v22, &location);
      id v21 = v7;
      [v13 dismissSystemUIAtLevel:2 animated:1 transitionBlock:v18];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

    else
    {
      activeAppSwitcherDataSource = self->_activeAppSwitcherDataSource;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherViewController dataSource](v9, "dataSource"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 kioskItem]);
      -[PBAppSwitcherDataSource handleActivationRequestForItem:completion:]( activeAppSwitcherDataSource,  "handleActivationRequestForItem:completion:",  v16,  v7);

      id v6 = 0LL;
    }

    BOOL v10 = 1;
    goto LABEL_12;
  }

  if (v7)
  {
    uint64_t v8 = FBSOpenApplicationErrorCreate( 1LL,  @"Attempting to dismiss the app switcher when it is inactive or dismissing");
    v9 = (PBAppSwitcherViewController *)objc_claimAutoreleasedReturnValue(v8);
    (*((void (**)(id, void, PBAppSwitcherViewController *))v7 + 2))(v7, 0LL, v9);
    BOOL v10 = 0;
LABEL_12:

    goto LABEL_13;
  }

  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)_shouldPresentAppSwitcherForGestureActivation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBRestrictionPINManager sharedInstance](&OBJC_CLASS___PBRestrictionPINManager, "sharedInstance"));
  unsigned int v4 = [v3 isPresenting];

  if (v4)
  {
    id v5 = sub_1000F68BC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = 0;
      id v7 = "Preventing presentation: Restrictions dialog presenting";
      uint64_t v8 = (uint8_t *)&v16;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  unsigned int v10 = [v9 isCurrentBulletinActive];

  if (v10)
  {
    id v11 = sub_1000F68BC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      id v7 = "Preventing presentation: Interactive bulletin active";
      uint64_t v8 = (uint8_t *)&v15;
      goto LABEL_7;
    }

- (PBSystemUIPresenting)presentationDelegate
{
  return (PBSystemUIPresenting *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
}

- (PBAppSwitcherViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (PBAppSwitcherDataSource)activeAppSwitcherDataSource
{
  return self->_activeAppSwitcherDataSource;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (PBSystemGestureHandle)presentGesture
{
  return self->_presentGesture;
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (void).cxx_destruct
{
}

@end