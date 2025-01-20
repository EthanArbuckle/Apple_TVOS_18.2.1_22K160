@interface TVSMExpanseAlertViewController
- (NSString)privacySettingButtonActionIdentifier;
- (TVSMExpanseAlertButton)moveToNearbyDeviceButton;
- (TVSMExpanseAlertButton)privacySettingButton;
- (TVSMExpanseAlertButton)stopSharePlayButton;
- (TVSMExpanseAlertViewController)init;
- (UILabel)footer;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)expanseContextDidUpdate:(id)a3;
- (void)setFooter:(id)a3;
- (void)setMoveToNearbyDeviceButton:(id)a3;
- (void)setPrivacySettingButton:(id)a3;
- (void)setPrivacySettingButtonActionIdentifier:(id)a3;
- (void)setStopSharePlayButton:(id)a3;
- (void)updateViewState;
- (void)viewDidLoad;
@end

@implementation TVSMExpanseAlertViewController

- (TVSMExpanseAlertViewController)init
{
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSMExpanseAlertViewController;
  v9 = -[TVSMExpanseAlertViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    -[TVSMExpanseAlertViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 8LL);
    id v6 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    v4 = v9;
    v5 = &_dispatch_main_q;
    objc_msgSend(v6, "addObserver:queue:", v4);
  }

  v3 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v3;
}

- (void)viewDidLoad
{
  v103 = self;
  SEL v102 = a2;
  v101.receiver = self;
  v101.super_class = (Class)&OBJC_CLASS___TVSMExpanseAlertViewController;
  -[TVSMExpanseAlertViewController viewDidLoad](&v101, "viewDidLoad");
  id v10 = -[TVSMExpanseAlertViewController view](v103, "view");
  [v10 setOverrideUserInterfaceStyle:2];

  v100 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v100, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v11 = v100;
  v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v103));
  v12 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:");
  -[UILabel setText:](v11, "setText:");

  v14 = v100;
  v15 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2);
  -[UILabel setFont:](v14, "setFont:");

  v16 = v100;
  id v17 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  -[UILabel setTextColor:](v16, "setTextColor:");

  -[UILabel setTextAlignment:](v100, "setTextAlignment:");
  id v18 = -[TVSMExpanseAlertViewController view](v103, "view");
  [v18 addSubview:v100];

  v99 = objc_alloc_init(&OBJC_CLASS___UIStackView);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v99,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIStackView setAxis:](v99, "setAxis:", 1LL);
  -[UIStackView setDistribution:](v99, "setDistribution:");
  -[UIStackView setAlignment:](v99, "setAlignment:", 0LL);
  -[UIStackView setSpacing:](v99, "setSpacing:", 14.0);
  id v19 = -[TVSMExpanseAlertViewController view](v103, "view");
  [v19 addSubview:v99];

  v20 = objc_alloc(&OBJC_CLASS___TVSMExpanseAlertButton);
  v22 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v103));
  v21 =  -[NSBundle localizedStringForKey:value:table:]( v22,  "localizedStringForKey:value:table:",  @"TVSMExpanseTitle",  &stru_102F0,  @"Localizable-Expanse");
  v2 = -[TVSMExpanseAlertButton initWithFrame:title:systemImageName:]( v20,  "initWithFrame:title:systemImageName:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  privacySettingButton = v103->_privacySettingButton;
  v103->_privacySettingButton = v2;

  -[TVSMExpanseAlertButton setTranslatesAutoresizingMaskIntoConstraints:]( v103->_privacySettingButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSMExpanseAlertButton setHidden:](v103->_privacySettingButton, "setHidden:", 1LL);
  -[UIStackView addArrangedSubview:](v99, "addArrangedSubview:", v103->_privacySettingButton);
  v23 = objc_alloc(&OBJC_CLASS___TVSMExpanseAlertButton);
  v25 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v103));
  v24 =  -[NSBundle localizedStringForKey:value:table:]( v25,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertEndSharePlay",  &stru_102F0,  @"Localizable-Expanse");
  v4 = -[TVSMExpanseAlertButton initWithFrame:title:systemImageName:]( v23,  "initWithFrame:title:systemImageName:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  stopSharePlayButton = v103->_stopSharePlayButton;
  v103->_stopSharePlayButton = v4;

  -[TVSMExpanseAlertButton setTranslatesAutoresizingMaskIntoConstraints:]( v103->_stopSharePlayButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v26 = v103->_stopSharePlayButton;
  v93[1] = _NSConcreteStackBlock;
  int v94 = -1073741824;
  int v95 = 0;
  v96 = sub_5798;
  v97 = &unk_101D0;
  v98 = v103;
  v27 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:");
  -[TVSMExpanseAlertButton addAction:forControlEvents:](v26, "addAction:forControlEvents:");

  -[TVSMExpanseAlertButton setHidden:](v103->_stopSharePlayButton, "setHidden:", 1LL);
  -[UIStackView addArrangedSubview:](v99, "addArrangedSubview:", v103->_stopSharePlayButton);
  v28 = objc_alloc(&OBJC_CLASS___TVSMExpanseAlertButton);
  v30 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v103));
  v29 =  -[NSBundle localizedStringForKey:value:table:]( v30,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertMoveToNearbyDevice",  &stru_102F0,  @"Localizable-Expanse");
  id v6 = -[TVSMExpanseAlertButton initWithFrame:title:systemImageName:]( v28,  "initWithFrame:title:systemImageName:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  moveToNearbyDeviceButton = v103->_moveToNearbyDeviceButton;
  v103->_moveToNearbyDeviceButton = v6;

  -[TVSMExpanseAlertButton setTranslatesAutoresizingMaskIntoConstraints:]( v103->_moveToNearbyDeviceButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v31 = v103->_moveToNearbyDeviceButton;
  v88[1] = _NSConcreteStackBlock;
  int v89 = -1073741824;
  int v90 = 0;
  v91 = sub_582C;
  v92 = &unk_101D0;
  v93[0] = v103;
  v32 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:");
  -[TVSMExpanseAlertButton addAction:forControlEvents:](v31, "addAction:forControlEvents:");

  -[UIStackView addArrangedSubview:](v99, "addArrangedSubview:", v103->_moveToNearbyDeviceButton);
  SEL v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
  footer = v103->_footer;
  v103->_footer = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v103->_footer,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v33 = v103->_footer;
  v34 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
  -[UILabel setFont:](v33, "setFont:");

  v35 = v103->_footer;
  id v36 = +[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor");
  -[UILabel setTextColor:](v35, "setTextColor:");

  -[UILabel setTextAlignment:](v103->_footer, "setTextAlignment:", 1LL);
  -[UILabel setNumberOfLines:](v103->_footer, "setNumberOfLines:", 0LL);
  -[UILabel setHidden:](v103->_footer, "setHidden:", 1LL);
  id v37 = -[TVSMExpanseAlertViewController view](v103, "view");
  [v37 addSubview:v103->_footer];

  v88[0] = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  id v38 = -[TVSMExpanseAlertViewController view](v103, "view");
  [v38 addLayoutGuide:v88[0]];

  id v86 = [v88[0] topAnchor];
  id v85 = -[TVSMExpanseAlertViewController view](v103, "view");
  id v84 = [v85 topAnchor];
  id v83 = objc_msgSend(v86, "constraintEqualToAnchor:");
  v104[0] = v83;
  id v82 = [v88[0] bottomAnchor];
  id v81 = -[TVSMExpanseAlertViewController view](v103, "view");
  id v80 = [v81 bottomAnchor];
  id v79 = objc_msgSend(v82, "constraintEqualToAnchor:");
  v104[1] = v79;
  id v78 = [v88[0] centerXAnchor];
  id v77 = -[TVSMExpanseAlertViewController view](v103, "view");
  id v76 = [v77 centerXAnchor];
  id v75 = objc_msgSend(v78, "constraintEqualToAnchor:");
  v104[2] = v75;
  id v74 = [v88[0] widthAnchor];
  id v73 = [v74 constraintEqualToConstant:775.0];
  v104[3] = v73;
  id v72 = -[UILabel bottomAnchor](v100, "bottomAnchor");
  id v71 = [v88[0] topAnchor];
  id v70 = objc_msgSend(v72, "constraintEqualToAnchor:constant:", 311.0);
  v104[4] = v70;
  id v69 = -[UILabel leadingAnchor](v100, "leadingAnchor");
  id v68 = [v88[0] leadingAnchor];
  id v67 = objc_msgSend(v69, "constraintEqualToAnchor:");
  v104[5] = v67;
  id v66 = -[UILabel trailingAnchor](v100, "trailingAnchor");
  id v65 = [v88[0] trailingAnchor];
  id v64 = objc_msgSend(v66, "constraintEqualToAnchor:");
  v104[6] = v64;
  id v63 = -[UIStackView topAnchor](v99, "topAnchor");
  id v62 = -[UILabel bottomAnchor](v100, "bottomAnchor");
  id v61 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", 56.0);
  v104[7] = v61;
  id v60 = -[UIStackView leadingAnchor](v99, "leadingAnchor");
  id v59 = [v88[0] leadingAnchor];
  id v58 = objc_msgSend(v60, "constraintEqualToAnchor:");
  v104[8] = v58;
  id v57 = -[UIStackView trailingAnchor](v99, "trailingAnchor");
  id v56 = [v88[0] trailingAnchor];
  id v55 = objc_msgSend(v57, "constraintEqualToAnchor:");
  v104[9] = v55;
  id v54 = -[UILabel lastBaselineAnchor](v103->_footer, "lastBaselineAnchor");
  id v53 = [v88[0] bottomAnchor];
  id v52 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", -50.0);
  v104[10] = v52;
  id v51 = -[UILabel leadingAnchor](v103->_footer, "leadingAnchor");
  id v50 = [v88[0] leadingAnchor];
  id v49 = objc_msgSend(v51, "constraintEqualToAnchor:");
  v104[11] = v49;
  id v48 = -[UILabel trailingAnchor](v103->_footer, "trailingAnchor");
  id v47 = [v88[0] trailingAnchor];
  id v46 = objc_msgSend(v48, "constraintEqualToAnchor:");
  v104[12] = v46;
  id v45 = -[TVSMExpanseAlertButton heightAnchor](v103->_privacySettingButton, "heightAnchor");
  id v44 = objc_msgSend(v45, "constraintEqualToConstant:");
  v104[13] = v44;
  id v43 = -[TVSMExpanseAlertButton heightAnchor](v103->_stopSharePlayButton, "heightAnchor");
  id v42 = [v43 constraintEqualToConstant:104.0];
  v104[14] = v42;
  id v41 = -[TVSMExpanseAlertButton heightAnchor](v103->_moveToNearbyDeviceButton, "heightAnchor");
  id v40 = [v41 constraintEqualToConstant:104.0];
  v104[15] = v40;
  v39 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 16LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSMExpanseAlertViewController updateViewState](v103, "updateViewState");
  id v87 = -[TVSMExpanseAlertViewController view](v103, "view");
  [v87 layoutIfNeeded];

  objc_storeStrong(v88, 0LL);
  objc_storeStrong(v93, 0LL);
  objc_storeStrong((id *)&v98, 0LL);
  objc_storeStrong((id *)&v99, 0LL);
  objc_storeStrong((id *)&v100, 0LL);
}

- (void)updateViewState
{
  v97 = self;
  SEL v96 = a2;
  id v55 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  id v56 = (int *)[v55 sessionState];

  int v95 = v56;
  if (!v56 || v95 == (int *)((char *)&dword_0 + 1) || v95 == (int *)((char *)&dword_0 + 2))
  {
    -[TVSMExpanseAlertViewController dismissViewControllerAnimated:completion:]( v97,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
  }

  else
  {
    v94[8] = 0;
    *(void *)int v94 = v95 == &dword_4;
    if (v95 == &dword_4)
    {
      id v54 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
      id v2 = [v54 currentActivitySessionAppInfo];
      v3 = *(void **)&v94[1];
      *(void *)&v94[1] = v2;

      if (!*(void *)&v94[1])
      {
        id location = &_os_log_default;
        char v92 = 17;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
        {
          log = (os_log_s *)location;
          os_log_type_t type = v92;
          sub_69A8(v91);
          _os_log_fault_impl( &dword_0,  log,  type,  "Unexpected state for Expanse alert view - active session without current activity session app info.",  v91,  2u);
        }

        objc_storeStrong(&location, 0LL);
        v94[0] = 0;
      }
    }

    if (!*(void *)&v94[1])
    {
      id v51 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
      id v4 = [v51 foregroundAppInfo];
      v5 = *(void **)&v94[1];
      *(void *)&v94[1] = v4;
    }

    BOOL v50 = 1;
    BOOL v90 = v50;
    -[TVSMExpanseAlertButton setHidden:](v97->_privacySettingButton, "setHidden:", !v50);
    if ((-[TVSMExpanseAlertButton isHidden](v97->_privacySettingButton, "isHidden") & 1) == 0)
    {
      char v87 = 0;
      char v85 = 0;
      char v83 = 0;
      char v81 = 0;
      if ([*(id *)&v94[1] state] == (char *)&dword_0 + 3)
      {
        v88 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v97));
        char v87 = 1;
        id v86 =  -[NSBundle localizedStringForKey:value:table:]( v88,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertPrivacyButtonAccessoryTextAuto",  &stru_102F0,  @"Localizable-Expanse");
        char v85 = 1;
        id v6 = v86;
      }

      else
      {
        id v84 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v97));
        char v83 = 1;
        id v82 =  -[NSBundle localizedStringForKey:value:table:]( v84,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertPrivacyButtonAccessoryTextAskNextTime",  &stru_102F0,  @"Localizable-Expanse");
        char v81 = 1;
        id v6 = v82;
      }

      id v89 = v6;
      if ((v81 & 1) != 0) {

      }
      if ((v83 & 1) != 0) {
      if ((v85 & 1) != 0)
      }

      if ((v87 & 1) != 0) {
      privacySettingButton = v97->_privacySettingButton;
      }
      id v49 = [*(id *)&v94[1] name];
      -[TVSMExpanseAlertButton setSubtitle:animated:](privacySettingButton, "setSubtitle:animated:");

      -[TVSMExpanseAlertButton setAccessoryText:animated:]( v97->_privacySettingButton,  "setAccessoryText:animated:",  v89,  0LL);
      if (v97->_privacySettingButtonActionIdentifier) {
        -[TVSMExpanseAlertButton removeActionForIdentifier:forControlEvents:]( v97->_privacySettingButton,  "removeActionForIdentifier:forControlEvents:",  v97->_privacySettingButtonActionIdentifier,  0x2000LL);
      }
      id v74 = _NSConcreteStackBlock;
      int v75 = -1073741824;
      int v76 = 0;
      id v77 = sub_69C4;
      id v78 = &unk_101D0;
      id v79 = *(id *)&v94[1];
      id v80 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v74);
      objc_super v7 = (NSString *)[v80 identifier];
      privacySettingButtonActionIdentifier = v97->_privacySettingButtonActionIdentifier;
      v97->_privacySettingButtonActionIdentifier = v7;

      -[TVSMExpanseAlertButton addAction:forControlEvents:]( v97->_privacySettingButton,  "addAction:forControlEvents:",  v80,  0x2000LL);
      if ((v94[0] & 1) != 0)
      {
        v33 = v97->_privacySettingButton;
        v35 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v97));
        v34 =  -[NSBundle localizedStringForKey:value:table:]( v35,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertPrivacyButtonTitleSharePlayActive",  &stru_102F0,  @"Localizable-Expanse");
        -[TVSMExpanseAlertButton setTitle:animated:](v33, "setTitle:animated:");

        id v36 = v97->_privacySettingButton;
        id v37 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
        -[TVSMExpanseAlertButton setPrimaryContentColor:forControlState:animated:]( v36,  "setPrimaryContentColor:forControlState:animated:");

        id v38 = v97->_privacySettingButton;
        id v39 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
        -[TVSMExpanseAlertButton setPrimaryContentColor:forControlState:animated:]( v38,  "setPrimaryContentColor:forControlState:animated:");

        id v40 = v97->_privacySettingButton;
        id v41 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
        -[TVSMExpanseAlertButton setSecondaryContentColor:forControlState:animated:]( v40,  "setSecondaryContentColor:forControlState:animated:");

        id v42 = v97->_privacySettingButton;
        id v43 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
        -[TVSMExpanseAlertButton setSecondaryContentColor:forControlState:animated:]( v42,  "setSecondaryContentColor:forControlState:animated:");

        id v44 = v97->_privacySettingButton;
        id v45 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.478431373,  1.0,  0.8);
        -[TVSMExpanseAlertButton setPlatterColor:forControlState:animated:]( v44,  "setPlatterColor:forControlState:animated:");

        id v46 = v97->_privacySettingButton;
        id v47 = +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
        -[TVSMExpanseAlertButton setPlatterColor:forControlState:animated:]( v46,  "setPlatterColor:forControlState:animated:");
      }

      else
      {
        id v73 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  1LL);
        v16 = v97->_privacySettingButton;
        id v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v97));
        id v17 =  -[NSBundle localizedStringForKey:value:table:]( v18,  "localizedStringForKey:value:table:",  @"TVSMExpanseTitle",  &stru_102F0,  @"Localizable-Expanse");
        -[TVSMExpanseAlertButton setTitle:animated:](v16, "setTitle:animated:");

        id v19 = v97->_privacySettingButton;
        id v20 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
        -[TVSMExpanseAlertButton setPrimaryContentColor:forControlState:animated:]( v19,  "setPrimaryContentColor:forControlState:animated:");

        v21 = v97->_privacySettingButton;
        id v23 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
        id v22 = [v23 resolvedColorWithTraitCollection:v73];
        -[TVSMExpanseAlertButton setPrimaryContentColor:forControlState:animated:]( v21,  "setPrimaryContentColor:forControlState:animated:");

        v24 = v97->_privacySettingButton;
        id v25 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
        -[TVSMExpanseAlertButton setSecondaryContentColor:forControlState:animated:]( v24,  "setSecondaryContentColor:forControlState:animated:");

        v26 = v97->_privacySettingButton;
        id v28 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
        id v27 = [v28 resolvedColorWithTraitCollection:v73];
        -[TVSMExpanseAlertButton setSecondaryContentColor:forControlState:animated:]( v26,  "setSecondaryContentColor:forControlState:animated:");

        v29 = v97->_privacySettingButton;
        id v30 = +[UIColor systemFillColor](&OBJC_CLASS___UIColor, "systemFillColor");
        -[TVSMExpanseAlertButton setPlatterColor:forControlState:animated:]( v29,  "setPlatterColor:forControlState:animated:");

        v31 = v97->_privacySettingButton;
        v32 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
        -[TVSMExpanseAlertButton setPlatterColor:forControlState:animated:]( v31,  "setPlatterColor:forControlState:animated:");

        objc_storeStrong((id *)&v73, 0LL);
      }

      objc_storeStrong(&v80, 0LL);
      objc_storeStrong(&v79, 0LL);
      objc_storeStrong(&v89, 0LL);
    }

    -[TVSMExpanseAlertButton setHidden:](v97->_stopSharePlayButton, "setHidden:", (v94[0] ^ 1) & 1);
    id v14 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    id v72 = [v14 currentSessionDeviceHandle];

    id v15 = [v72 name];
    char v69 = 0;
    char v67 = 0;
    char v65 = 0;
    char v63 = 0;
    char v61 = 0;
    char v59 = 0;
    if (v15)
    {
      id v70 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v97));
      char v69 = 1;
      id v68 =  -[NSBundle localizedStringForKey:value:table:]( v70,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertMoveToNearbyDeviceWithName",  &stru_102F0,  @"Localizable-Expanse");
      char v67 = 1;
      id v66 = [v72 name];
      char v65 = 1;
      id v64 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v68, v66);
      char v63 = 1;
      id v9 = v64;
    }

    else
    {
      id v62 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v97));
      char v61 = 1;
      id v60 =  [v62 localizedStringForKey:@"TVSMExpanseAlertMoveToNearbyDevice" value:&stru_102F0 table:@"Localizable-Expanse"];
      char v59 = 1;
      id v9 = v60;
    }

    id v71 = v9;
    if ((v59 & 1) != 0) {

    }
    if ((v61 & 1) != 0) {
    if ((v63 & 1) != 0)
    }

    if ((v65 & 1) != 0) {
    if ((v67 & 1) != 0)
    }

    if ((v69 & 1) != 0) {
    else
    }
      id v10 = @"iphone.and.arrow.forward";
    id v58 = v10;
    -[TVSMExpanseAlertButton setTitle:animated:](v97->_moveToNearbyDeviceButton, "setTitle:animated:", v71, 0LL);
    -[TVSMExpanseAlertButton setSystemImageName:animated:]( v97->_moveToNearbyDeviceButton,  "setSystemImageName:animated:",  v58,  0LL);
    id v12 = -[TVSMExpanseAlertViewController view](v97, "view");
    [v12 layoutIfNeeded];

    v13 = +[UIFocusSystem focusSystemForEnvironment:](&OBJC_CLASS___UIFocusSystem, "focusSystemForEnvironment:", v97);
    id v57 = -[UIFocusSystem focusedItem](v13, "focusedItem");

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___UIView);
    objc_storeStrong(&v57, 0LL);
    objc_storeStrong(&v58, 0LL);
    objc_storeStrong(&v71, 0LL);
    objc_storeStrong(&v72, 0LL);
    objc_storeStrong((id *)&v94[1], 0LL);
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = [location[0] nextFocusedView];
  if (v14 == v17->_privacySettingButton)
  {
    -[UILabel setHidden:](v17->_footer, "setHidden:", 0LL);
    footer = v17->_footer;
    id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v17));
    uint64_t v11 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertFooterPrivacyButtonHint",  &stru_102F0,  @"Localizable-Expanse");
    -[UILabel setText:](footer, "setText:");
  }

  else if (v14 == v17->_stopSharePlayButton)
  {
    -[UILabel setHidden:](v17->_footer, "setHidden:", 0LL);
    objc_super v7 = v17->_footer;
    id v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v17));
    SEL v8 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertFooterStopButtonHint",  &stru_102F0,  @"Localizable-Expanse");
    -[UILabel setText:](v7, "setText:");
  }

  else if (v14 == v17->_moveToNearbyDeviceButton)
  {
    -[UILabel setHidden:](v17->_footer, "setHidden:", 0LL);
    id v4 = v17->_footer;
    id v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v17));
    v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"TVSMExpanseAlertFooterMoveButtonHint",  &stru_102F0,  @"Localizable-Expanse");
    -[UILabel setText:](v4, "setText:");
  }

  else
  {
    -[UILabel setHidden:](v17->_footer, "setHidden:", 1LL);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)expanseContextDidUpdate:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseAlertViewController updateViewState](v4, "updateViewState");
  objc_storeStrong(location, 0LL);
}

- (TVSMExpanseAlertButton)privacySettingButton
{
  return self->_privacySettingButton;
}

- (void)setPrivacySettingButton:(id)a3
{
}

- (TVSMExpanseAlertButton)stopSharePlayButton
{
  return self->_stopSharePlayButton;
}

- (void)setStopSharePlayButton:(id)a3
{
}

- (TVSMExpanseAlertButton)moveToNearbyDeviceButton
{
  return self->_moveToNearbyDeviceButton;
}

- (void)setMoveToNearbyDeviceButton:(id)a3
{
}

- (UILabel)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)privacySettingButtonActionIdentifier
{
  return self->_privacySettingButtonActionIdentifier;
}

- (void)setPrivacySettingButtonActionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end