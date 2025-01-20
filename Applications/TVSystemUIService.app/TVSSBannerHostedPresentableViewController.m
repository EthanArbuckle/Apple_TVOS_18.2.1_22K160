@interface TVSSBannerHostedPresentableViewController
- (BOOL)hasPrimaryAction;
- (BOOL)isTVSSBannerPresentable;
- (BOOL)supportsDisplayingAsMenuItem;
- (NSArray)preferredSizeConstraints;
- (NSDictionary)presentableUserInfo;
- (NSSet)primaryActionTriggeringGestures;
- (NSString)menuBarShortTitle;
- (NSString)panelMessage;
- (NSString)panelMessageImageSymbolName;
- (NSString)targetProviderIdentifier;
- (TVSPPillContentContaining)pillContentView;
- (UIView)bannerContentView;
- (void)_updatePreferredSizeConstraints;
- (void)loadView;
- (void)sendActionWithExternalGesture:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPreferredSizeConstraints:(id)a3;
- (void)setPresentableUserInfo:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSBannerHostedPresentableViewController

- (void)loadView
{
  v3 = self;
  v2[1] = (id)a2;
  v2[0] = objc_alloc_init(&OBJC_CLASS___TVSSBannerHostedPillContentView);
  [v2[0] setDelegate:v3];
  -[TVSSBannerHostedPresentableViewController setView:](v3, "setView:", v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSBannerHostedPresentableViewController;
  -[TVSSBannerHostedPresentableViewController viewDidLoad](&v3, "viewDidLoad");
  id v2 = -[TVSSBannerHostedPresentableViewController view](v5, "view");
  [v2 setPreservesSuperviewLayoutMargins:0];
  [v2 setInsetsLayoutMarginsFromSafeArea:0];
  -[TVSSBannerHostedPresentableViewController _updatePreferredSizeConstraints](v5, "_updatePreferredSizeConstraints");
  objc_storeStrong(&v2, 0LL);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  CGSize v10 = a3;
  v9 = self;
  SEL v8 = a2;
  -[TVSSBannerHostedPresentableViewController preferredContentSize](self, "preferredContentSize");
  double v6 = v3;
  double v7 = v4;
  if (!sub_1000EF1E4(v3, v4, v10.width, v10.height))
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSSBannerHostedPresentableViewController;
    -[TVSSBannerHostedPresentableViewController setPreferredContentSize:]( &v5,  "setPreferredContentSize:",  v10.width,  v10.height);
    -[TVSSBannerHostedPresentableViewController _updatePreferredSizeConstraints](v9, "_updatePreferredSizeConstraints");
  }

- (BOOL)isTVSSBannerPresentable
{
  return 1;
}

- (BOOL)hasPrimaryAction
{
  id v4 =  -[NSDictionary objectForKeyedSubscript:]( self->_presentableUserInfo,  "objectForKeyedSubscript:",  TVSPBannerPresentableKeyHostedBannerWantsGestureForAction);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v5 = sub_1000EF30C(v4, v2);

  unsigned __int8 v6 = [v5 BOOLValue];
  return v6 & 1;
}

- (NSSet)primaryActionTriggeringGestures
{
  return (NSSet *)TVSSBannerGesturesForTVSPBannerActionTriggerInUserInfo(self->_presentableUserInfo);
}

- (UIView)bannerContentView
{
  return (UIView *)-[TVSSBannerHostedPresentableViewController view](self, "view", a2, self);
}

- (TVSPPillContentContaining)pillContentView
{
  v29 = self;
  SEL v28 = a2;
  id v27 = -[TVSSBannerHostedPresentableViewController view](self, "view");
  id v26 = 0LL;
  Class v25 = NSClassFromString(@"TVSSBannerHostedPillContentView");
  if (!v27)
  {
    v24 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v23 = &_os_log_default;
    char v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v23;
      os_log_type_t type = v22;
      v14 = NSStringFromSelector(v28);
      CGSize v10 = v14;
      v21 = v10;
      uint64_t v2 = (objc_class *)objc_opt_class(v29);
      v13 = NSStringFromClass(v2);
      v20 = v13;
      sub_10000583C( (uint64_t)v31,  (uint64_t)v10,  (uint64_t)v20,  (uint64_t)v29,  (uint64_t)@"TVSSBannerHostedPresentableViewController.m",  84,  (uint64_t)v24);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v31,  0x3Au);

      objc_storeStrong((id *)&v20, 0LL);
      objc_storeStrong((id *)&v21, 0LL);
    }

    objc_storeStrong(&v23, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v24, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000EF628LL);
  }

  if (((objc_opt_isKindOfClass(v27, v25) ^ 1) & 1) != 0)
  {
    id v19 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSBannerHostedPillContentViewClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v6 = oslog;
      os_log_type_t v7 = v17;
      v9 = NSStringFromSelector(v28);
      id v5 = v9;
      v16 = v5;
      double v3 = (objc_class *)objc_opt_class(v29);
      SEL v8 = NSStringFromClass(v3);
      v15 = v8;
      sub_10000583C( (uint64_t)v30,  (uint64_t)v5,  (uint64_t)v15,  (uint64_t)v29,  (uint64_t)@"TVSSBannerHostedPresentableViewController.m",  84,  (uint64_t)v19);
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  v7,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v30,  0x3Au);

      objc_storeStrong((id *)&v15, 0LL);
      objc_storeStrong((id *)&v16, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x1000EF7E0LL);
  }

  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  return (TVSPPillContentContaining *)-[TVSSBannerHostedPresentableViewController view](v29, "view");
}

- (BOOL)supportsDisplayingAsMenuItem
{
  return TVSSBannerPresentableSupportsDisplayingAsMenuItem(self);
}

- (NSString)targetProviderIdentifier
{
  return (NSString *)TVSSBannerPresentableTargetProviderIdentifier(self);
}

- (NSString)menuBarShortTitle
{
  return (NSString *)TVSSBannerPresentableMenuBarShortTitle(self);
}

- (NSString)panelMessage
{
  return (NSString *)TVSSBannerPresentablePanelMessage(self);
}

- (NSString)panelMessageImageSymbolName
{
  return (NSString *)TVSSBannerPresentablePanelMessageImageSymbolName(self);
}

- (void)sendActionWithExternalGesture:(id)a3
{
  char v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVSSBannerHostedPresentableViewController hasPrimaryAction](v22, "hasPrimaryAction"))
  {
    id v10 =  -[NSDictionary objectForKeyedSubscript:]( v22->_presentableUserInfo,  "objectForKeyedSubscript:",  TVSPBannerPresentableKeyActionTrigger);
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v11 = sub_1000EF30C(v10, v3);

    id v18 = v11;
    id v19 = v11;
    if (v11) {
      uint64_t v9 = (uint64_t)[v19 unsignedIntegerValue];
    }
    else {
      uint64_t v9 = 3LL;
    }
    uint64_t v17 = v9;
    BOOL ShouldExternalGestureTriggerAction = TVSSBannerShouldExternalGestureTriggerAction(location[0], v9);
    os_log_t oslog = (os_log_t)BannerHostedViewControllerLog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v7 = type;
      id v8 = (id)BNEffectivePresentableDescription(v22);
      id v13 = v8;
      sub_1000EFC00((uint64_t)v23, (uint64_t)v13, ShouldExternalGestureTriggerAction, (uint64_t)location[0], v17);
      _os_log_impl( (void *)&_mh_execute_header,  log,  v7,  "Handling action for external gesture. {presentable=%{public}@, shouldForward=%{BOOL}d, gesture=%@, actionTrigger=%lu}",  v23,  0x26u);

      objc_storeStrong(&v13, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    if (ShouldExternalGestureTriggerAction)
    {
      id v12 = [[TVSPBannerExternalGestureAction alloc] initWithActionEvent:1];
      id v5 = -[TVSSBannerHostedPresentableViewController scene](v22, "scene");
      id v4 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12);
      objc_msgSend(v5, "sendActions:");

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong(&v19, 0LL);
    int v20 = 0;
  }

  else
  {
    int v20 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updatePreferredSizeConstraints
{
  v15 = self;
  SEL v14 = a2;
  -[TVSSBannerHostedPresentableViewController preferredContentSize](self, "preferredContentSize");
  double v12 = v2;
  double v13 = v3;
  if ((-[TVSSBannerHostedPresentableViewController isViewLoaded](v15, "isViewLoaded") & 1) != 0
    && !sub_1000EF1E4(v12, v13, CGSizeZero.width, CGSizeZero.height))
  {
    if (v15->_preferredSizeConstraints) {
      +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  v15->_preferredSizeConstraints);
    }
    id v11 = -[TVSSBannerHostedPresentableViewController view](v15, "view");
    id v7 = [v11 widthAnchor];
    id v10 = [v7 constraintEqualToConstant:v12];

    objc_msgSend(v10, "setPriority:");
    id v8 = [v11 heightAnchor];
    id v9 = [v8 constraintEqualToConstant:v13];

    LODWORD(v4) = 1144750080;
    [v9 setPriority:v4];
    v16[0] = v10;
    v16[1] = v9;
    id v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL);
    preferredSizeConstraints = v15->_preferredSizeConstraints;
    v15->_preferredSizeConstraints = v5;

    +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  v15->_preferredSizeConstraints);
    objc_storeStrong(&v9, 0LL);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

- (NSDictionary)presentableUserInfo
{
  return self->_presentableUserInfo;
}

- (void)setPresentableUserInfo:(id)a3
{
}

- (NSArray)preferredSizeConstraints
{
  return self->_preferredSizeConstraints;
}

- (void)setPreferredSizeConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end