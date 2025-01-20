@interface TVSMTeachableMomentViewController
+ (double)_assetHeight;
+ (id)_remoteString;
+ (id)_teachableMomentAssetURL;
+ (id)_userInteractionAssetURL;
- (UILabel)actionLabel;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)containerLayoutGuide;
- (UIVisualEffectView)effectView;
- (_UICAPackageView)animationContainerView;
- (id)_tvButtonInjectedStringWithBaseLocalizedString:(id)a3;
- (void)_setupInterface;
- (void)animateTeachableMomentAction;
- (void)dealloc;
- (void)setActionLabel:(id)a3;
- (void)setAnimationContainerView:(id)a3;
- (void)setContainerLayoutGuide:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSMTeachableMomentViewController

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSMTeachableMomentViewController;
  -[TVSMTeachableMomentViewController viewDidLoad](&v2, "viewDidLoad");
  +[TVSBluetoothRemoteUtilities startConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startConnectionMonitoring");
  -[TVSMTeachableMomentViewController _setupInterface](v4, "_setupInterface");
}

- (void)viewDidAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSMTeachableMomentViewController;
  -[TVSMTeachableMomentViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  id v3 = -[_UICAPackageView layer](v7->_animationContainerView, "layer");
  [v3 setBeginTime:CACurrentMediaTime() + 1.0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[TVSMTeachableMomentViewController traitCollection](v11, "traitCollection");
  id v7 = [v6 userInterfaceStyle];

  id v9 = v7;
  if ([location[0] userInterfaceStyle] != v7)
  {
    if (v9 == (id)2) {
      uint64_t v5 = kCAFilterPlusL;
    }
    else {
      uint64_t v5 = kCAFilterPlusD;
    }
    v8 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v5);
    id v3 = -[UILabel layer](v11->_titleLabel, "layer");
    [v3 setCompositingFilter:v8];

    id v4 = -[UILabel layer](v11->_messageLabel, "layer");
    [v4 setCompositingFilter:v8];

    objc_storeStrong((id *)&v8, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  +[TVSBluetoothRemoteUtilities stopConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "stopConnectionMonitoring");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMTeachableMomentViewController;
  -[TVSMTeachableMomentViewController dealloc](&v2, "dealloc");
}

- (void)animateTeachableMomentAction
{
  id v4 = objc_alloc(&OBJC_CLASS____UICAPackageView);
  id v5 =  +[TVSMTeachableMomentViewController _userInteractionAssetURL]( &OBJC_CLASS___TVSMTeachableMomentViewController,  "_userInteractionAssetURL");
  objc_super v2 = -[_UICAPackageView initWithContentsOfURL:publishedObjectViewClassMap:]( v4,  "initWithContentsOfURL:publishedObjectViewClassMap:");
  animationContainerView = self->_animationContainerView;
  self->_animationContainerView = v2;

  id v6 = -[_UICAPackageView layer](self->_animationContainerView, "layer");
  [v6 setAllowsGroupBlending:0];

  -[_UICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_animationContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v7 = -[TVSMTeachableMomentViewController view](self, "view");
  [v7 addSubview:self->_animationContainerView];

  id v21 = -[_UICAPackageView centerXAnchor](self->_animationContainerView, "centerXAnchor");
  v20 = -[UILayoutGuide centerXAnchor](self->_containerLayoutGuide, "centerXAnchor");
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v24[0] = v19;
  id v18 = -[_UICAPackageView widthAnchor](self->_animationContainerView, "widthAnchor");
  id v17 = [v18 constraintEqualToConstant:300.0];
  v24[1] = v17;
  id v16 = -[_UICAPackageView topAnchor](self->_animationContainerView, "topAnchor");
  v15 = -[UILayoutGuide topAnchor](self->_containerLayoutGuide, "topAnchor");
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v24[2] = v14;
  id v13 = -[_UICAPackageView heightAnchor](self->_animationContainerView, "heightAnchor");
  +[TVSMTeachableMomentViewController _assetHeight](&OBJC_CLASS___TVSMTeachableMomentViewController, "_assetHeight");
  id v12 = objc_msgSend(v13, "constraintEqualToConstant:");
  v24[3] = v12;
  id v11 = -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  id v10 = -[_UICAPackageView bottomAnchor](self->_animationContainerView, "bottomAnchor");
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", 80.0);
  v24[4] = v9;
  v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 5LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  id v22 = -[_UICAPackageView layer](self->_animationContainerView, "layer");
  [v22 setBeginTime:CACurrentMediaTime()];
}

- (void)_setupInterface
{
  v143 = self;
  v142[1] = (id)a2;
  v142[0] = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v20 = -[TVSMTeachableMomentViewController view](v143, "view");
  id v19 = [v20 layer];
  [v19 setAllowsGroupBlending:0];

  v141 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL);
  objc_super v2 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  SEL v3 = -[UIVisualEffectView initWithEffect:](v2, "initWithEffect:", v141);
  effectView = v143->_effectView;
  v143->_effectView = v3;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v143->_effectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIVisualEffectView _setContinuousCornerRadius:](v143->_effectView, "_setContinuousCornerRadius:");
  id v21 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v21 addSubview:v143->_effectView];

  id v22 = v142[0];
  id v37 = -[UIVisualEffectView widthAnchor](v143->_effectView, "widthAnchor");
  id v36 = [v37 constraintEqualToConstant:470.0];
  v149[0] = v36;
  id v35 = -[UIVisualEffectView trailingAnchor](v143->_effectView, "trailingAnchor");
  id v34 = -[TVSMTeachableMomentViewController view](v143, "view");
  id v33 = [v34 trailingAnchor];
  id v32 = objc_msgSend(v35, "constraintEqualToAnchor:");
  v149[1] = v32;
  id v31 = -[UIVisualEffectView topAnchor](v143->_effectView, "topAnchor");
  id v30 = -[TVSMTeachableMomentViewController view](v143, "view");
  id v29 = [v30 topAnchor];
  id v28 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v149[2] = v28;
  id v27 = -[UIVisualEffectView bottomAnchor](v143->_effectView, "bottomAnchor");
  id v26 = -[TVSMTeachableMomentViewController view](v143, "view");
  id v25 = [v26 bottomAnchor];
  id v24 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v149[3] = v24;
  v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v149);
  objc_msgSend(v22, "addObjectsFromArray:");

  id v5 = objc_opt_new(&OBJC_CLASS___UILayoutGuide);
  containerLayoutGuide = v143->_containerLayoutGuide;
  v143->_containerLayoutGuide = v5;

  id v38 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v38 addLayoutGuide:v143->_containerLayoutGuide];

  id v39 = v142[0];
  v52 = -[UILayoutGuide leadingAnchor](v143->_containerLayoutGuide, "leadingAnchor");
  id v51 = -[UIVisualEffectView leadingAnchor](v143->_effectView, "leadingAnchor");
  id v50 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v52, "constraintEqualToAnchor:constant:");
  v148[0] = v50;
  v49 = -[UILayoutGuide trailingAnchor](v143->_containerLayoutGuide, "trailingAnchor");
  id v48 = -[UIVisualEffectView trailingAnchor](v143->_effectView, "trailingAnchor");
  id v47 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v49, "constraintEqualToAnchor:constant:", -40.0);
  v148[1] = v47;
  v46 = -[UILayoutGuide centerYAnchor](v143->_containerLayoutGuide, "centerYAnchor");
  id v45 = -[UIVisualEffectView centerYAnchor](v143->_effectView, "centerYAnchor");
  id v44 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v46, "constraintEqualToAnchor:");
  v148[2] = v44;
  v43 = -[UILayoutGuide heightAnchor](v143->_containerLayoutGuide, "heightAnchor");
  id v42 = -[UIVisualEffectView heightAnchor](v143->_effectView, "heightAnchor");
  id v41 = -[NSLayoutDimension constraintLessThanOrEqualToAnchor:](v43, "constraintLessThanOrEqualToAnchor:");
  v148[3] = v41;
  v40 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v148, 4LL);
  objc_msgSend(v39, "addObjectsFromArray:");

  v53 = objc_alloc(&OBJC_CLASS____UICAPackageView);
  id v54 =  +[TVSMTeachableMomentViewController _teachableMomentAssetURL]( &OBJC_CLASS___TVSMTeachableMomentViewController,  "_teachableMomentAssetURL");
  id v7 = -[_UICAPackageView initWithContentsOfURL:publishedObjectViewClassMap:]( v53,  "initWithContentsOfURL:publishedObjectViewClassMap:");
  animationContainerView = v143->_animationContainerView;
  v143->_animationContainerView = v7;

  id v55 = -[_UICAPackageView layer](v143->_animationContainerView, "layer");
  [v55 setFillMode:kCAFillModeBoth];

  id v56 = -[_UICAPackageView layer](v143->_animationContainerView, "layer");
  [v56 setBeginTime:1.79769313e308];

  id v58 = -[_UICAPackageView layer](v143->_animationContainerView, "layer");
  v57 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  objc_msgSend(v58, "setCompositingFilter:");

  id v59 = -[_UICAPackageView layer](v143->_animationContainerView, "layer");
  [v59 setAllowsGroupBlending:0];

  id v60 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v60 addSubview:v143->_animationContainerView];

  -[_UICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v143->_animationContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v61 = v142[0];
  id v72 = -[_UICAPackageView centerXAnchor](v143->_animationContainerView, "centerXAnchor");
  v71 = -[UILayoutGuide centerXAnchor](v143->_containerLayoutGuide, "centerXAnchor");
  id v70 = objc_msgSend(v72, "constraintEqualToAnchor:");
  v147[0] = v70;
  id v69 = -[_UICAPackageView widthAnchor](v143->_animationContainerView, "widthAnchor");
  id v68 = [v69 constraintEqualToConstant:300.0];
  v147[1] = v68;
  id v67 = -[_UICAPackageView topAnchor](v143->_animationContainerView, "topAnchor");
  v66 = -[UILayoutGuide topAnchor](v143->_containerLayoutGuide, "topAnchor");
  id v65 = objc_msgSend(v67, "constraintEqualToAnchor:");
  v147[2] = v65;
  id v64 = -[_UICAPackageView heightAnchor](v143->_animationContainerView, "heightAnchor");
  +[TVSMTeachableMomentViewController _assetHeight](&OBJC_CLASS___TVSMTeachableMomentViewController, "_assetHeight");
  id v63 = objc_msgSend(v64, "constraintEqualToConstant:");
  v147[3] = v63;
  v62 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v147, 4LL);
  objc_msgSend(v61, "addObjectsFromArray:");

  id v74 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  v73 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
  id v140 = objc_msgSend(v74, "resolvedColorWithTraitCollection:");

  id v9 = objc_opt_new(&OBJC_CLASS___UILabel);
  titleLabel = v143->_titleLabel;
  v143->_titleLabel = v9;

  v75 = v143->_titleLabel;
  id v76 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleHeadline,  1024LL);
  -[UILabel setFont:](v75, "setFont:");

  v77 = v143->_titleLabel;
  v79 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v143));
  v78 =  -[NSBundle localizedStringForKey:value:table:]( v79,  "localizedStringForKey:value:table:",  @"TVSMTeachableMomentTitleText");
  -[UILabel setText:](v77, "setText:");

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v143->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UILabel setNumberOfLines:](v143->_titleLabel, "setNumberOfLines:");
  -[UILabel setTextAlignment:](v143->_titleLabel, "setTextAlignment:");
  -[UILabel setTextColor:](v143->_titleLabel, "setTextColor:", v140);
  id v81 = -[UILabel layer](v143->_titleLabel, "layer");
  v80 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  objc_msgSend(v81, "setCompositingFilter:");

  id v82 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v82 addSubview:v143->_titleLabel];

  id v83 = v142[0];
  id v93 = -[UILabel centerXAnchor](v143->_titleLabel, "centerXAnchor");
  v92 = -[UILayoutGuide centerXAnchor](v143->_containerLayoutGuide, "centerXAnchor");
  id v91 = objc_msgSend(v93, "constraintEqualToAnchor:");
  v146[0] = v91;
  id v90 = -[UILabel widthAnchor](v143->_titleLabel, "widthAnchor");
  v89 = -[UILayoutGuide widthAnchor](v143->_containerLayoutGuide, "widthAnchor");
  id v88 = objc_msgSend(v90, "constraintLessThanOrEqualToAnchor:");
  v146[1] = v88;
  id v87 = -[UILabel firstBaselineAnchor](v143->_titleLabel, "firstBaselineAnchor");
  id v86 = -[_UICAPackageView bottomAnchor](v143->_animationContainerView, "bottomAnchor");
  id v85 = objc_msgSend(v87, "constraintEqualToAnchor:constant:", 80.0);
  v146[2] = v85;
  v84 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v146);
  objc_msgSend(v83, "addObjectsFromArray:");

  id v11 = objc_opt_new(&OBJC_CLASS___UILabel);
  messageLabel = v143->_messageLabel;
  v143->_messageLabel = v11;

  v95 = v143->_messageLabel;
  v94 = v143;
  v98 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v143));
  v97 =  -[NSBundle localizedStringForKey:value:table:]( v98,  "localizedStringForKey:value:table:",  @"TVSMTeachableMomentMessageText",  &stru_10004B248,  0LL);
  id v96 =  -[TVSMTeachableMomentViewController _tvButtonInjectedStringWithBaseLocalizedString:]( v94,  "_tvButtonInjectedStringWithBaseLocalizedString:");
  -[UILabel setAttributedText:](v95, "setAttributedText:");

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v143->_messageLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UILabel setNumberOfLines:](v143->_messageLabel, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](v143->_messageLabel, "setTextAlignment:", 1LL);
  -[UILabel setTextColor:](v143->_messageLabel, "setTextColor:", v140);
  id v100 = -[UILabel layer](v143->_messageLabel, "layer");
  v99 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  objc_msgSend(v100, "setCompositingFilter:");

  id v101 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v101 addSubview:v143->_messageLabel];

  id v102 = v142[0];
  id v112 = -[UILabel centerXAnchor](v143->_messageLabel, "centerXAnchor");
  v111 = -[UILayoutGuide centerXAnchor](v143->_containerLayoutGuide, "centerXAnchor");
  id v110 = objc_msgSend(v112, "constraintEqualToAnchor:");
  v145[0] = v110;
  id v109 = -[UILabel widthAnchor](v143->_messageLabel, "widthAnchor");
  v108 = -[UILayoutGuide widthAnchor](v143->_containerLayoutGuide, "widthAnchor");
  id v107 = objc_msgSend(v109, "constraintLessThanOrEqualToAnchor:");
  v145[1] = v107;
  id v106 = -[UILabel firstBaselineAnchor](v143->_messageLabel, "firstBaselineAnchor");
  id v105 = -[UILabel lastBaselineAnchor](v143->_titleLabel, "lastBaselineAnchor");
  id v104 = objc_msgSend(v106, "constraintEqualToAnchor:constant:", 40.0);
  v145[2] = v104;
  v103 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v145, 3LL);
  objc_msgSend(v102, "addObjectsFromArray:");

  id v13 = objc_opt_new(&OBJC_CLASS___UILabel);
  actionLabel = v143->_actionLabel;
  v143->_actionLabel = v13;

  v114 = v143->_actionLabel;
  v113 = v143;
  v117 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v143));
  v116 =  -[NSBundle localizedStringForKey:value:table:]( v117,  "localizedStringForKey:value:table:",  @"TVSMTeachableMomentActionText",  &stru_10004B248,  0LL);
  id v115 =  -[TVSMTeachableMomentViewController _tvButtonInjectedStringWithBaseLocalizedString:]( v113,  "_tvButtonInjectedStringWithBaseLocalizedString:");
  -[UILabel setAttributedText:](v114, "setAttributedText:");

  -[UILabel setNumberOfLines:](v143->_actionLabel, "setNumberOfLines:", 0LL);
  v118 = v143->_actionLabel;
  v119 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.062745098,  0.376470588,  0.690196078);
  -[UILabel setTextColor:](v118, "setTextColor:");

  id v121 = -[UILabel layer](v143->_actionLabel, "layer");
  v120 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  objc_msgSend(v121, "setCompositingFilter:");

  -[UILabel setTextAlignment:](v143->_actionLabel, "setTextAlignment:", 1LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v143->_actionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v122 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v122 addSubview:v143->_actionLabel];

  id v123 = v142[0];
  id v136 = -[UILabel centerXAnchor](v143->_actionLabel, "centerXAnchor");
  v135 = -[UILayoutGuide centerXAnchor](v143->_containerLayoutGuide, "centerXAnchor");
  id v134 = objc_msgSend(v136, "constraintEqualToAnchor:");
  v144[0] = v134;
  id v133 = -[UILabel widthAnchor](v143->_actionLabel, "widthAnchor");
  v132 = -[UILayoutGuide widthAnchor](v143->_containerLayoutGuide, "widthAnchor");
  id v131 = objc_msgSend(v133, "constraintLessThanOrEqualToAnchor:");
  v144[1] = v131;
  id v130 = -[UILabel firstBaselineAnchor](v143->_actionLabel, "firstBaselineAnchor");
  id v129 = -[UILabel lastBaselineAnchor](v143->_messageLabel, "lastBaselineAnchor");
  id v128 = objc_msgSend(v130, "constraintEqualToAnchor:constant:", 60.0);
  v144[2] = v128;
  id v127 = -[UILabel bottomAnchor](v143->_actionLabel, "bottomAnchor");
  v126 = -[UILayoutGuide bottomAnchor](v143->_containerLayoutGuide, "bottomAnchor");
  id v125 = objc_msgSend(v127, "constraintEqualToAnchor:");
  v144[3] = v125;
  v124 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v144, 4LL);
  objc_msgSend(v123, "addObjectsFromArray:");

  v139 = objc_opt_new(&OBJC_CLASS____FocusDummyView);
  v137 = v139;
  sub_1000245E8();
  -[_FocusDummyView setFrame:](v137, "setFrame:", v15, v16, v17, v18);
  id v138 = -[TVSMTeachableMomentViewController view](v143, "view");
  [v138 addSubview:v139];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v142[0]);
  objc_storeStrong((id *)&v139, 0LL);
  objc_storeStrong(&v140, 0LL);
  objc_storeStrong((id *)&v141, 0LL);
  objc_storeStrong(v142, 0LL);
}

  ;
}

- (id)_tvButtonInjectedStringWithBaseLocalizedString:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v18 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
  double v17 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
  id v9 =  +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v17);
  id v8 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv.circle.fill");
  id v7 = [v8 imageWithRenderingMode:2];
  -[NSTextAttachment setImage:](v18, "setImage:");

  id v15 = [location[0] rangeOfString:@"@@TV@@"];
  uint64_t v16 = v3;
  id v14 =  +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v18);
  id v4 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  id v13 = -[NSMutableAttributedString initWithString:](v4, "initWithString:", location[0]);
  objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v15, v16, v14);
  id v10 = v13;
  NSAttributedStringKey v20 = NSFontAttributeName;
  id v21 = v17;
  id v11 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL);
  id v5 = [v13 length];
  location[4] = 0LL;
  location[3] = v5;
  location[5] = 0LL;
  location[6] = v5;
  objc_msgSend(v10, "addAttributes:range:", v11, 0, v5);

  id v12 = v13;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

+ (double)_assetHeight
{
  id v6 =  +[TVSMTeachableMomentViewController _userInteractionAssetURL]( &OBJC_CLASS___TVSMTeachableMomentViewController,  "_userInteractionAssetURL");
  id v5 = [v6 absoluteString];
  unsigned __int8 v2 = [v5 containsString:@"B135"];
  double v3 = 368.0;
  if ((v2 & 1) == 0) {
    double v3 = 289.0;
  }
  double v7 = v3;

  return v7;
}

+ (id)_userInteractionAssetURL
{
  v6[2] = a1;
  v6[1] = (id)a2;
  id v3 =  +[TVSMTeachableMomentViewController _remoteString]( &OBJC_CLASS___TVSMTeachableMomentViewController,  "_remoteString");
  v6[0] =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"controlcenter_teachable_moment_%@_User",  v3);

  id v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v5 = -[NSBundle URLForResource:withExtension:](v4, "URLForResource:withExtension:", v6[0], @"caar");

  objc_storeStrong(v6, 0LL);
  return v5;
}

+ (id)_teachableMomentAssetURL
{
  v6[2] = a1;
  v6[1] = (id)a2;
  id v3 =  +[TVSMTeachableMomentViewController _remoteString]( &OBJC_CLASS___TVSMTeachableMomentViewController,  "_remoteString");
  v6[0] =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"controlcenter_teachable_moment_%@_TM",  v3);

  id v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v5 = -[NSBundle URLForResource:withExtension:](v4, "URLForResource:withExtension:", v6[0], @"caar");

  objc_storeStrong(v6, 0LL);
  return v5;
}

+ (id)_remoteString
{
  id v6 = a1;
  SEL v5 = a2;
  id v4 = 0LL;
  id location =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
  if (location) {
    id v4 = (char *)[location remoteType];
  }
  else {
    id v4 = (char *)+[CBPeripheral tvs_previousRemoteType](&OBJC_CLASS___CBPeripheral, "tvs_previousRemoteType");
  }
  if ((unint64_t)(v4 - 1) <= 4) {
    __asm { BR              X8 }
  }

  double v7 = @"B519";
  objc_storeStrong(&location, 0LL);
  return v7;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (UILayoutGuide)containerLayoutGuide
{
  return self->_containerLayoutGuide;
}

- (void)setContainerLayoutGuide:(id)a3
{
}

- (_UICAPackageView)animationContainerView
{
  return self->_animationContainerView;
}

- (void)setAnimationContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end