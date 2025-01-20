@interface TVSettingsHomeKitUpdateOSViewController
- (TVSettingsHomeKitUpdateOSViewController)initWithStyle:(int64_t)a3;
- (void)_cancelAction;
- (void)_updateAction;
- (void)sendAnalyticsEventWihActionTakenValue:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsHomeKitUpdateOSViewController

- (TVSettingsHomeKitUpdateOSViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitUpdateOSViewController;
  v3 = -[TVSettingsHomeKitUpdateOSViewController initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    -[TVSettingsHomeKitUpdateOSViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 8LL);
    -[TVSettingsHomeKitUpdateOSViewController setOverrideUserInterfaceStyle:](v4, "setOverrideUserInterfaceStyle:", 2LL);
  }

  return v4;
}

- (void)viewDidLoad
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitUpdateOSViewController;
  -[TVSettingsHomeKitUpdateOSViewController viewDidLoad](&v44, "viewDidLoad");
  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitUpdateOSViewController view](self, "view"));
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSUIStackedButtonsViewControllerConfiguration);
  uint64_t v6 = TSKLocString(@"HomeKitUpdateOSDialogTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setTitle:v7];

  uint64_t v8 = TSKLocString(@"HomeKitUpdateOSDialogSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v5 setSubtitle:v9];

  uint64_t v10 = TSKLocString(@"HomeKitUpdateOSDialogUpdateActionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000DFCAC;
  v43[3] = &unk_100194CD8;
  v43[4] = v3;
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v11,  0LL,  0LL,  v43));

  uint64_t v12 = TSKLocString(@"HomeKitUpdateOSDialogCancelActionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000DFCB4;
  v42[3] = &unk_100194CD8;
  v42[4] = v3;
  v36 = v3;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v13,  0LL,  0LL,  v42));

  v46[0] = v41;
  v46[1] = v40;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
  v39 = v5;
  [v5 setButtons:v14];

  id v15 = [[TVSUIStackedButtonsViewController alloc] initWithConfiguration:v5];
  id v16 = objc_alloc(&OBJC_CLASS___TSKVibrantImageView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"HomeIcon"));
  id v18 = [v16 initWithImage:v17];

  v38 = v18;
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setContentMode:2];
  v37 = v15;
  [v15 setSupplementaryView:v18];
  -[TVSettingsHomeKitUpdateOSViewController bs_addChildViewController:](v3, "bs_addChildViewController:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v19 leadingAnchor]);
  v20 = v4;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v34]);
  v45[0] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v19 trailingAnchor]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v21]);
  v45[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 topAnchor]);
  v32 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
  v45[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v19 bottomAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v20 bottomAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
  v45[3] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);

  v30 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v36,  "_cancelAction");
  -[UITapGestureRecognizer setAllowedPressTypes:](v30, "setAllowedPressTypes:", &off_1001AF2B0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v30, "setAllowedTouchTypes:", &__NSArray0__struct);
  [v32 addGestureRecognizer:v30];
}

- (void)_updateAction
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=SoftwareUpdate&activate=true&animate=true"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v3 openSensitiveURL:v4 withOptions:0];

  -[TVSettingsHomeKitUpdateOSViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
}

- (void)_cancelAction
{
}

- (void)sendAnalyticsEventWihActionTakenValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000DFE64;
    v8[3] = &unk_1001922D0;
    id v9 = v5;
    id v6 = v5;
    AnalyticsSendEventLazy(@"com.apple.appletv.updateOSForHomeKit.dialogShown", v8);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"actionTakenValue != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FD19C(a2, (uint64_t)self, (uint64_t)v7);
    }
    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
  }

@end