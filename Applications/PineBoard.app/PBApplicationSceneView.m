@interface PBApplicationSceneView
- (BOOL)allowSnapshots;
- (BOOL)canBecomeFocused;
- (BOOL)isEligibleForFocus;
- (BOOL)isReady;
- (BOOL)isWallpaperEnabled;
- (BSInvalidatable)shroudObservationHandle;
- (BSInvalidatable)shroudPresentationAssertion;
- (NSString)identifier;
- (PBApplicationSceneView)initWithCoder:(id)a3;
- (PBApplicationSceneView)initWithFrame:(CGRect)a3;
- (PBApplicationSceneView)initWithSceneHandle:(id)a3 layoutLevel:(int64_t)a4;
- (PBApplicationSceneViewDelegate)delegate;
- (PBSceneHandle)sceneHandle;
- (PBSceneShroudView)shroudView;
- (UIApplicationSceneDeactivationAssertion)shroudingDeactivationAssertion;
- (UIView)fullDisplayTransitionView;
- (id)_viewForPresentationMode:(unint64_t)a3;
- (id)_viewForPresentationMode:(unint64_t)a3 withCurrentContentView:(id)a4;
- (id)shroudController:(id)a3 requestsSceneShrouding:(int64_t)a4 animated:(BOOL)a5;
- (int64_t)layoutLevel;
- (unint64_t)_bestAvailableModeForMode:(unint64_t)a3;
- (unint64_t)effectivePresentationMode;
- (unint64_t)presentationMode;
- (unint64_t)shroudReasons;
- (void)_acquireShroudingDeactivationAssertionIfNeeded;
- (void)_addFullDisplayTransitionView;
- (void)_addShroudViewOfClass:(Class)a3 animated:(BOOL)a4;
- (void)_relinquishShroudingDeactivationAssertion;
- (void)_removeFullDisplayTransitionView;
- (void)_removeShroudViewAnimated:(BOOL)a3;
- (void)_removeShroudViewIfNeeded;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateFocusEligibility;
- (void)_updateFocusEligibilityChanged:(BOOL)a3;
- (void)_updatePresentationModeWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)didMoveToWindow;
- (void)invalidateScenePresentation;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneHandle:(id)a3 willDestroyScene:(id)a4;
- (void)setAllowSnapshots:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEligibleForFocus:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setPresentationMode:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setReady:(BOOL)a3;
- (void)setWallpaperEnabled:(BOOL)a3;
@end

@implementation PBApplicationSceneView

- (PBApplicationSceneView)initWithFrame:(CGRect)a3
{
  return 0LL;
}

- (PBApplicationSceneView)initWithCoder:(id)a3
{
  return 0LL;
}

- (PBApplicationSceneView)initWithSceneHandle:(id)a3 layoutLevel:(int64_t)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBApplicationSceneView;
  v8 = -[PBApplicationSceneView initWithFrame:]( &v20,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sceneHandle, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sceneIdentifier]);
    v11 = (NSString *)[v10 copy];
    identifier = v9->_identifier;
    v9->_identifier = v11;

    v9->_layoutLevel = a4;
    v9->_eligibleForFocus = 1;
    v9->_allowSnapshots = 1;
    v9->_presentationMode = 3LL;
    [v7 addObserver:v9];
    -[PBApplicationSceneView setAutoresizingMask:](v9, "setAutoresizingMask:", 18LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView layer](v9, "layer"));
    [v13 setAllowsGroupOpacity:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProcessBundleIdentifier]);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 shroudController]);

      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 registerAgent:v9 withClientProcessBundleIdentifier:v14]);
      shroudObservationHandle = v9->_shroudObservationHandle;
      v9->_shroudObservationHandle = (BSInvalidatable *)v17;
    }
  }

  return v9;
}

- (void)dealloc
{
  id v3 = sub_1000849C8();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "invalidating shroud observation handle",  buf,  2u);
  }

  -[BSInvalidatable invalidate](self->_shroudObservationHandle, "invalidate");
  -[PBApplicationSceneView invalidateScenePresentation](self, "invalidateScenePresentation");
  -[PBSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBApplicationSceneView;
  -[PBApplicationSceneView dealloc](&v5, "dealloc");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBApplicationSceneView;
  -[PBApplicationSceneView _setContinuousCornerRadius:](&v14, "_setContinuousCornerRadius:");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView subviews](self, "subviews", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) _setContinuousCornerRadius:a3];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBApplicationSceneView;
  -[PBApplicationSceneView didMoveToWindow](&v3, "didMoveToWindow");
  -[PBApplicationSceneView _updatePresentationModeWithAnimation:completion:]( self,  "_updatePresentationModeWithAnimation:completion:",  0LL,  0LL);
  -[PBApplicationSceneView _updateFocusEligibility](self, "_updateFocusEligibility");
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  if (self->_shroudView)
  {
    id v5 = sub_1000849C8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "scene subview added – moving shroud to front",  buf,  2u);
    }

    -[PBApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:", self->_shroudView);
  }

  if (sub_1001C9E00() && self->_fullDisplayTransitionView)
  {
    id v7 = sub_1000849C8();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "scene subview added – moving full display transition view to front",  v9,  2u);
    }

    -[PBApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:", self->_fullDisplayTransitionView);
  }
}

- (void)setEligibleForFocus:(BOOL)a3
{
  if (self->_eligibleForFocus != a3)
  {
    self->_eligibleForFocus = a3;
    -[PBApplicationSceneView _updateFocusEligibilityChanged:](self, "_updateFocusEligibilityChanged:", 1LL);
  }

- (void)setPresentationMode:(unint64_t)a3
{
}

- (void)setPresentationMode:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = v8;
  if (self->_presentationMode == a3)
  {
    if (v8) {
      (*((void (**)(id))v8 + 2))(v8);
    }
  }

  else
  {
    self->_presentationMode = a3;
    -[PBApplicationSceneView _updatePresentationModeWithAnimation:completion:]( self,  "_updatePresentationModeWithAnimation:completion:",  v5,  v8);
  }
}

- (BOOL)canBecomeFocused
{
  unint64_t v3 = -[PBApplicationSceneView effectivePresentationMode](self, "effectivePresentationMode");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView sceneHandle](self, "sceneHandle"));
  unsigned __int8 v5 = [v4 isContentReady];

  if (self->_eligibleForFocus && v3 == 3) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)invalidateScenePresentation
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scenePresenter]);
  [v4 invalidatePresentationForElement:self];
}

- (void)setWallpaperEnabled:(BOOL)a3
{
  if (self->_wallpaperEnabled != a3)
  {
    self->_wallpaperEnabled = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1001D8C78;
    v3[3] = &unk_1003DC250;
    BOOL v4 = a3;
    -[PBApplicationSceneTransitionView modifyContentViews:](self, "modifyContentViews:", v3);
  }

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
}

- (void)sceneHandle:(id)a3 willDestroyScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D8D80;
  v8[3] = &unk_1003D0890;
  objc_copyWeak(&v9, &location);
  -[PBApplicationSceneView _updatePresentationModeWithAnimation:completion:]( self,  "_updatePresentationModeWithAnimation:completion:",  1LL,  v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scene]);
  if (([v5 isValid] & 1) == 0)
  {

    goto LABEL_8;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 scene]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uiPresentationManager]);
  unsigned __int8 v8 = [v7 isInvalidated];

  if ((v8 & 1) == 0)
  {
LABEL_4:
    id v9 = sub_1000849C8();
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneIdentifier]);
      uint64_t v12 = NSStringFromFBSceneContentState([v4 contentState]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 138412802;
      v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Scene content state did change. {sceneIdentifier=%@, sceneViewController=%p, contentState=%{public}@}",  (uint8_t *)&v14,  0x20u);
    }

    -[PBApplicationSceneView _updatePresentationModeWithAnimation:completion:]( self,  "_updatePresentationModeWithAnimation:completion:",  1LL,  0LL);
  }

- (void)sceneHandle:(id)a3 didUpdateSettings:(id)a4
{
  id v5 = a4;
  if (sub_1001C9E34())
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 previousSettings]);
    unsigned int v7 = objc_msgSend(v6, "pb_isAppJailed");
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
    unsigned int v9 = objc_msgSend(v8, "pb_isAppJailed");
    if (v7 != v9)
    {
      unsigned int v10 = v9;
      id v11 = sub_1000849C8();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v16 = v7;
        __int16 v17 = 1024;
        unsigned int v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Adding full display transition view for jail change: %{BOOL}d -> %{BOOL}d",  buf,  0xEu);
      }

      -[PBApplicationSceneView _addFullDisplayTransitionView](self, "_addFullDisplayTransitionView");
      dispatch_time_t v13 = dispatch_time(0LL, 700000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001D9088;
      block[3] = &unk_1003CFF08;
      block[4] = self;
      dispatch_after(v13, &_dispatch_main_q, block);
    }
  }
}

- (void)_addFullDisplayTransitionView
{
  if (!self->_fullDisplayTransitionView)
  {
    unint64_t v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    fullDisplayTransitionView = self->_fullDisplayTransitionView;
    self->_fullDisplayTransitionView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_fullDisplayTransitionView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v5 = self->_fullDisplayTransitionView;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[PBApplicationSceneView addSubview:](self, "addSubview:", self->_fullDisplayTransitionView);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_fullDisplayTransitionView, "leadingAnchor"));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView leadingAnchor](self, "leadingAnchor"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v18]);
    v20[0] = v17;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_fullDisplayTransitionView, "trailingAnchor"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView trailingAnchor](self, "trailingAnchor"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToAnchor:v8]);
    v20[1] = v9;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fullDisplayTransitionView, "topAnchor"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView topAnchor](self, "topAnchor"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v11]);
    v20[2] = v12;
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fullDisplayTransitionView, "bottomAnchor"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView bottomAnchor](self, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14]);
    v20[3] = v15;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);
  }

- (void)_removeFullDisplayTransitionView
{
  fullDisplayTransitionView = self->_fullDisplayTransitionView;
  self->_fullDisplayTransitionView = 0LL;
}

- (void)_addShroudViewOfClass:(Class)a3 animated:(BOOL)a4
{
  BOOL v35 = a4;
  id v7 = sub_1000849C8();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "adding shroud view", (uint8_t *)buf, 2u);
  }

  if ((-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PBSceneShroudView)) & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[shroudViewClass isSubclassOfClass:[PBSceneShroudView class]]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100290CA4(a2, (uint64_t)self, (uint64_t)v29);
    }
    _bs_set_crash_log_message([v29 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D974CLL);
  }

  if (self->_shroudView)
  {
    id v10 = sub_1000849C8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "can't add shroud view because one already exists",  (uint8_t *)buf,  2u);
    }
  }

  else
  {
    uint64_t v12 = objc_opt_self(&OBJC_CLASS____PBWallpaperSceneView, v9);
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = -[PBApplicationSceneTransitionView isContentViewClassKindOfClass:]( self,  "isContentViewClassKindOfClass:",  v13);

    v15 = (PBSceneShroudView *)[[a3 alloc] initWithSceneHandle:self->_sceneHandle isOverLiveScene:v14];
    shroudView = self->_shroudView;
    self->_shroudView = v15;

    __int16 v17 = self->_shroudView;
    -[PBApplicationSceneView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[PBSceneShroudView _setContinuousCornerRadius:](v17, "_setContinuousCornerRadius:");
    -[PBSceneShroudView setTranslatesAutoresizingMaskIntoConstraints:]( self->_shroudView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[PBApplicationSceneView addSubview:](self, "addSubview:", self->_shroudView);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView leadingAnchor](self->_shroudView, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView leadingAnchor](self, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
    v39[0] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView topAnchor](self->_shroudView, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView topAnchor](self, "topAnchor"));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v30]);
    v39[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView trailingAnchor](self->_shroudView, "trailingAnchor"));
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView trailingAnchor](self, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);
    v39[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView bottomAnchor](self->_shroudView, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView bottomAnchor](self, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);
    v39[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v25);

    -[PBApplicationSceneView _acquireShroudingDeactivationAssertionIfNeeded]( self,  "_acquireShroudingDeactivationAssertionIfNeeded");
    self->_shroudReasons = 3LL;
    id v26 = sub_1000849C8();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "presenting shroud view", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v28 = self->_shroudView;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1001D9778;
    v36[3] = &unk_1003D9530;
    objc_copyWeak(&v37, buf);
    v36[4] = self;
    -[PBSceneShroudView presentAnimated:completion:](v28, "presentAnimated:completion:", v35, v36);
    objc_destroyWeak(&v37);
    objc_destroyWeak(buf);
  }

- (void)_removeShroudViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000849C8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing shroud view", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  shroudView = self->_shroudView;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D9AB8;
  v8[3] = &unk_1003D1228;
  objc_copyWeak(&v9, buf);
  -[PBSceneShroudView dismissAnimated:completion:](shroudView, "dismissAnimated:completion:", v3, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_acquireShroudingDeactivationAssertionIfNeeded
{
  if (!self->_shroudingDeactivationAssertion)
  {
    id v3 = sub_1000849C8();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "acquiring shroud deactivaiton assertion",  buf,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle clientProcessBundleIdentifier](self->_sceneHandle, "clientProcessBundleIdentifier"));
    id v6 = [v5 copy];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sceneDeactivationManager]);
    id v9 = (UIApplicationSceneDeactivationAssertion *)[v8 newAssertionWithReason:7];
    shroudingDeactivationAssertion = self->_shroudingDeactivationAssertion;
    self->_shroudingDeactivationAssertion = v9;

    id v11 = self->_shroudingDeactivationAssertion;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001D9D5C;
    v13[3] = &unk_1003DC278;
    id v14 = v6;
    id v12 = v6;
    -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:]( v11,  "acquireWithPredicate:transitionContext:",  v13,  0LL);
  }

- (void)_relinquishShroudingDeactivationAssertion
{
  id v3 = sub_1000849C8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "relinquish shroud deactivation assertion",  v6,  2u);
  }

  -[UIApplicationSceneDeactivationAssertion relinquish](self->_shroudingDeactivationAssertion, "relinquish");
  shroudingDeactivationAssertion = self->_shroudingDeactivationAssertion;
  self->_shroudingDeactivationAssertion = 0LL;
}

- (void)_removeShroudViewIfNeeded
{
  if (self->_shroudReasons)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v4 = v3;
    unint64_t shroudReasons = self->_shroudReasons;
    if ((shroudReasons & 2) != 0)
    {
      [v3 addObject:@"minimum duration"];
      unint64_t shroudReasons = self->_shroudReasons;
    }

    if ((shroudReasons & 1) != 0)
    {
      [v4 addObject:@"switching users"];
      unint64_t shroudReasons = self->_shroudReasons;
    }

    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)shroudReasons);
    v6.i16[0] = vaddlv_u8(v6);
    uint64_t v7 = v6.u32[0];
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Not removing shroud for %uld reason(s): %@",  v7,  v8));

    id v10 = sub_1000849C8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_time_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }

  else
  {
    -[PBApplicationSceneView _removeShroudViewAnimated:](self, "_removeShroudViewAnimated:", 1LL);
  }

- (id)shroudController:(id)a3 requestsSceneShrouding:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  switch(a4)
  {
    case 0LL:
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Undefined style is not supported"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100290DA4((uint64_t)v21);
      }
      id result = (id) _bs_set_crash_log_message([v21 UTF8String]);
      __break(0);
      return result;
    case 1LL:
      id v9 = sub_1000849C8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "shroud: user switch", (uint8_t *)buf, 2u);
      }

      id v11 = &off_1003CDD50;
      goto LABEL_12;
    case 2LL:
      id v13 = sub_1000849C8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "shroud: language change",  (uint8_t *)buf,  2u);
      }

      id v11 = off_1003CDA10;
      goto LABEL_12;
    case 3LL:
      id v14 = sub_1000849C8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "shroud: region change", (uint8_t *)buf, 2u);
      }

      id v11 = &off_1003CDA60;
LABEL_12:

      id v12 = (id)objc_opt_class(*v11);
      break;
    default:
      id v12 = 0LL;
      break;
  }

  -[PBApplicationSceneView _addShroudViewOfClass:animated:]( self,  "_addShroudViewOfClass:animated:",  v12,  v5);
  objc_initWeak(buf, self);
  v15 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
  unsigned int v16 = (objc_class *)objc_opt_class(self);
  __int16 v17 = NSStringFromClass(v16);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001DA218;
  v22[3] = &unk_1003D25C0;
  v22[4] = self;
  v19 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( v15,  "initWithIdentifier:forReason:invalidationBlock:",  v18,  @"Shroud",  v22);

  objc_destroyWeak(buf);
  return v19;
}

- (void)_updatePresentationModeWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint8x8_t v6 = (void (**)(void))a4;
  unint64_t effectivePresentationMode = self->_effectivePresentationMode;
  unint64_t v8 = -[PBApplicationSceneView _bestAvailableModeForMode:]( self,  "_bestAvailableModeForMode:",  -[PBApplicationSceneView presentationMode](self, "presentationMode"));
  if (v8 == effectivePresentationMode)
  {
    if (v6) {
      v6[2](v6);
    }
  }

  else
  {
    unint64_t v9 = v8;
    -[PBApplicationSceneTransitionView stopAnimation](self, "stopAnimation");
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationSceneView _viewForPresentationMode:]( self,  "_viewForPresentationMode:",  effectivePresentationMode));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView _viewForPresentationMode:](self, "_viewForPresentationMode:", v9));
    self->_unint64_t effectivePresentationMode = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    unsigned int v13 = [v12 isSwapping];

    if (v10) {
      BOOL v14 = v4;
    }
    else {
      BOOL v14 = 0;
    }
    uint64_t v15 = v14 & (v13 ^ 1);
    objc_initWeak(&location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001DA460;
    v17[3] = &unk_1003D0300;
    objc_copyWeak(&v19, &location);
    unsigned int v18 = v6;
    -[PBApplicationSceneTransitionView setContentView:animated:completion:]( self,  "setContentView:animated:completion:",  v11,  v15,  v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained applicationSceneViewDidUpdatePresentationMode:self];
}

- (unint64_t)_bestAvailableModeForMode:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      return 1LL;
    case 3uLL:
      if (-[PBSceneHandle isContentReady](self->_sceneHandle, "isContentReady")) {
        return 3LL;
      }
LABEL_7:
      if (-[PBSceneHandle isContentReady](self->_sceneHandle, "isContentReady")) {
        return 2LL;
      }
      return 1LL;
    case 2uLL:
      goto LABEL_7;
  }

  return 0LL;
}

- (id)_viewForPresentationMode:(unint64_t)a3
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  unint64_t v9 = sub_1001DA5E8;
  id v10 = sub_1001DA5F8;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001DA610;
  v5[3] = &unk_1003DC2A0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[PBApplicationSceneTransitionView accessContentView:](self, "accessContentView:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_viewForPresentationMode:(unint64_t)a3 withCurrentContentView:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  if (a3 == 1)
  {
    uint64_t v15 = objc_opt_self(&OBJC_CLASS____PBSuspensionSnapshotView, v7);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
    {
    }

    else
    {
      BOOL allowSnapshots = self->_allowSnapshots;

      if (allowSnapshots)
      {
        v22 = objc_alloc(&OBJC_CLASS____PBSuspensionSnapshotView);
        v23 = (void *)objc_claimAutoreleasedReturnValue( -[PBSceneHandle clientProcessBundleIdentifier]( self->_sceneHandle,  "clientProcessBundleIdentifier"));
        objc_super v20 = -[_PBWallpaperSceneView initWithBundleIdentifier:allowsGroupOpacity:]( v22,  "initWithBundleIdentifier:allowsGroupOpacity:",  v23,  1LL);

        v27 = _NSConcreteStackBlock;
        uint64_t v28 = 3221225472LL;
        v29 = sub_1001DAA98;
        v30 = &unk_1003DC2F0;
        objc_copyWeak(&v31, &location);
        -[_PBSuspensionSnapshotView setSnapshotLoadRequestBuilder:](v20, "setSnapshotLoadRequestBuilder:", &v27);
        v24 = &v31;
        goto LABEL_18;
      }
    }

    if (!self->_allowSnapshots) {
      goto LABEL_10;
    }
    goto LABEL_14;
  }

  if (a3 == 2)
  {
    uint64_t v17 = objc_opt_self(&OBJC_CLASS____PBSceneSnapshotPresentationView, v7);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    char isKindOfClass = objc_opt_isKindOfClass(v6, v18);

    if ((isKindOfClass & 1) == 0)
    {
      v25 = objc_alloc(&OBJC_CLASS____PBSceneSnapshotPresentationView);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBSceneHandle clientProcessBundleIdentifier]( self->_sceneHandle,  "clientProcessBundleIdentifier"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1001DAA1C;
      v32[3] = &unk_1003DC2C8;
      unsigned int v13 = &v33;
      objc_copyWeak(&v33, &location);
      BOOL v14 = -[_PBScenePresentationView initWithBundleIdentifier:scenePresentationViewProvider:]( v25,  "initWithBundleIdentifier:scenePresentationViewProvider:",  v12,  v32);
      goto LABEL_17;
    }

    if (!self->_allowSnapshots)
    {
LABEL_10:
      objc_super v20 = 0LL;
      goto LABEL_20;
    }

- (void)_updateFocusEligibility
{
}

- (void)_updateFocusEligibilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = -[PBApplicationSceneView canBecomeFocused](self, "canBecomeFocused");
  BOOL v6 = v5;
  if (self->_ready != v5)
  {
    self->_ready = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained applicationSceneView:self didUpdateReadiness:self->_ready];
  }

  if (v6 || v3)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView window](self, "window"));
    if (v9)
    {
      id v16 = sub_1000849C8();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v18) {
          sub_100290E7C((uint64_t)self, v17, v19, v20, v21, v22, v23, v24);
        }
      }

      else if (v18)
      {
        sub_100290EEC((uint64_t)self, v17, v19, v20, v21, v22, v23, v24);
      }

      [v9 setNeedsFocusUpdate];
    }
  }

  else
  {
    id v8 = sub_1000849C8();
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
      sub_100290F5C((uint64_t)self, (os_log_s *)v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (BOOL)isWallpaperEnabled
{
  return self->_wallpaperEnabled;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (PBApplicationSceneViewDelegate)delegate
{
  return (PBApplicationSceneViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)effectivePresentationMode
{
  return self->_effectivePresentationMode;
}

- (BOOL)isEligibleForFocus
{
  return self->_eligibleForFocus;
}

- (BOOL)allowSnapshots
{
  return self->_allowSnapshots;
}

- (void)setAllowSnapshots:(BOOL)a3
{
  self->_BOOL allowSnapshots = a3;
}

- (BSInvalidatable)shroudObservationHandle
{
  return self->_shroudObservationHandle;
}

- (BSInvalidatable)shroudPresentationAssertion
{
  return self->_shroudPresentationAssertion;
}

- (PBSceneShroudView)shroudView
{
  return self->_shroudView;
}

- (unint64_t)shroudReasons
{
  return self->_shroudReasons;
}

- (UIApplicationSceneDeactivationAssertion)shroudingDeactivationAssertion
{
  return self->_shroudingDeactivationAssertion;
}

- (UIView)fullDisplayTransitionView
{
  return self->_fullDisplayTransitionView;
}

- (void).cxx_destruct
{
}

@end