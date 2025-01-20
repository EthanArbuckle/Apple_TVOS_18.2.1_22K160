@interface TVSMExpanseAlertButton
- (BOOL)canBecomeFocused;
- (NSLayoutConstraint)platterViewBottomConstraint;
- (NSLayoutConstraint)platterViewLeadingConstraint;
- (NSLayoutConstraint)platterViewTopConstraint;
- (NSLayoutConstraint)platterViewTrailingConstraint;
- (NSMutableDictionary)primaryContentColorMap;
- (NSMutableDictionary)secondaryContentColorMap;
- (NSString)accessoryText;
- (NSString)subtitle;
- (NSString)systemImageName;
- (NSString)title;
- (TVSMExpanseAlertButton)initWithFrame:(CGRect)a3 title:(id)a4 systemImageName:(id)a5;
- (TVSMExpanseAlertButton)initWithFrame:(CGRect)a3 title:(id)a4 systemImageName:(id)a5 subtitle:(id)a6 accessoryText:(id)a7;
- (UIImageView)iconView;
- (UILabel)accessoryTextLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)rootStackView;
- (_UIFloatingContentView)platterView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAccessoryText:(id)a3;
- (void)setAccessoryText:(id)a3 animated:(BOOL)a4;
- (void)setAccessoryTextLabel:(id)a3;
- (void)setIconView:(id)a3;
- (void)setPlatterColor:(id)a3 forControlState:(unint64_t)a4 animated:(BOOL)a5;
- (void)setPlatterView:(id)a3;
- (void)setPlatterViewBottomConstraint:(id)a3;
- (void)setPlatterViewLeadingConstraint:(id)a3;
- (void)setPlatterViewTopConstraint:(id)a3;
- (void)setPlatterViewTrailingConstraint:(id)a3;
- (void)setPrimaryContentColor:(id)a3 forControlState:(unint64_t)a4 animated:(BOOL)a5;
- (void)setPrimaryContentColorMap:(id)a3;
- (void)setRootStackView:(id)a3;
- (void)setSecondaryContentColor:(id)a3 forControlState:(unint64_t)a4 animated:(BOOL)a5;
- (void)setSecondaryContentColorMap:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitle:(id)a3 animated:(BOOL)a4;
- (void)setSubtitleLabel:(id)a3;
- (void)setSystemImageName:(id)a3;
- (void)setSystemImageName:(id)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 animated:(BOOL)a4;
- (void)setTitleLabel:(id)a3;
- (void)updateStateAnimated:(BOOL)a3;
@end

@implementation TVSMExpanseAlertButton

- (TVSMExpanseAlertButton)initWithFrame:(CGRect)a3 title:(id)a4 systemImageName:(id)a5
{
  CGRect v12 = a3;
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  id v9 = 0LL;
  objc_storeStrong(&v9, a5);
  v5 = v11;
  v11 = 0LL;
  v11 = -[TVSMExpanseAlertButton initWithFrame:title:systemImageName:subtitle:accessoryText:]( v5,  "initWithFrame:title:systemImageName:subtitle:accessoryText:",  location[0],  v9,  0LL,  v12.origin.x,  v12.origin.y,  v12.size.width,  v12.size.height);
  v8 = v11;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v8;
}

- (TVSMExpanseAlertButton)initWithFrame:(CGRect)a3 title:(id)a4 systemImageName:(id)a5 subtitle:(id)a6 accessoryText:(id)a7
{
  CGRect v109 = a3;
  v108 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  id v106 = 0LL;
  objc_storeStrong(&v106, a5);
  id v105 = 0LL;
  objc_storeStrong(&v105, a6);
  id v104 = 0LL;
  objc_storeStrong(&v104, a7);
  v7 = v108;
  v108 = 0LL;
  v103.receiver = v7;
  v103.super_class = (Class)&OBJC_CLASS___TVSMExpanseAlertButton;
  v108 = -[TVSMExpanseAlertButton initWithFrame:]( &v103,  "initWithFrame:",  v109.origin.x,  v109.origin.y,  v109.size.width,  v109.size.height);
  objc_storeStrong((id *)&v108, v108);
  if (v108)
  {
    v8 = (NSString *)[location[0] copy];
    title = v108->_title;
    v108->_title = v8;

    v10 = (NSString *)[v106 copy];
    systemImageName = v108->_systemImageName;
    v108->_systemImageName = v10;

    CGRect v12 = (NSString *)[v105 copy];
    subtitle = v108->_subtitle;
    v108->_subtitle = v12;

    v14 = (NSString *)[v104 copy];
    accessoryText = v108->_accessoryText;
    v108->_accessoryText = v14;

    v102 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    v113[0] = &off_10720;
    id v47 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
    v114[0] = v47;
    v113[1] = &off_10738;
    id v46 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
    id v45 = [v46 resolvedColorWithTraitCollection:v102];
    v114[1] = v45;
    v44 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v114,  v113);
    v16 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v44, "mutableCopy");
    primaryContentColorMap = v108->_primaryContentColorMap;
    v108->_primaryContentColorMap = v16;

    v111[0] = &off_10720;
    id v51 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    v112[0] = v51;
    v111[1] = &off_10738;
    id v50 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    id v49 = [v50 resolvedColorWithTraitCollection:v102];
    v112[1] = v49;
    v48 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v112,  v111,  2LL);
    v18 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v48, "mutableCopy");
    secondaryContentColorMap = v108->_secondaryContentColorMap;
    v108->_secondaryContentColorMap = v18;

    v20 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    platterView = v108->_platterView;
    v108->_platterView = v20;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v108->_platterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[_UIFloatingContentView setCornerRadius:](v108->_platterView, "setCornerRadius:", 12.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v108->_platterView, "setContinuousCornerEnabled:", 1LL);
    v52 = v108->_platterView;
    v53 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  1LL);
    -[_UIFloatingContentView setFocusAnimationConfiguration:](v52, "setFocusAnimationConfiguration:");

    v54 = v108->_platterView;
    id v55 = +[UIColor systemFillColor](&OBJC_CLASS___UIColor, "systemFillColor");
    -[_UIFloatingContentView setBackgroundColor:forState:](v54, "setBackgroundColor:forState:");

    v56 = v108->_platterView;
    v57 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
    -[_UIFloatingContentView setBackgroundColor:forState:](v56, "setBackgroundColor:forState:");

    v58 = v108->_platterView;
    v59 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
    -[_UIFloatingContentView setBackgroundColor:forState:](v58, "setBackgroundColor:forState:");

    v60 = v108->_platterView;
    v61 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
    -[_UIFloatingContentView setBackgroundColor:forState:](v60, "setBackgroundColor:forState:");

    -[TVSMExpanseAlertButton addSubview:](v108, "addSubview:", v108->_platterView);
    v22 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    rootStackView = v108->_rootStackView;
    v108->_rootStackView = v22;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v108->_rootStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v108->_rootStackView, "setAxis:", 0LL);
    -[UIStackView setDistribution:](v108->_rootStackView, "setDistribution:", 0LL);
    -[UIStackView setAlignment:](v108->_rootStackView, "setAlignment:", 3LL);
    -[UIStackView setSpacing:](v108->_rootStackView, "setSpacing:");
    id v62 = -[_UIFloatingContentView contentView](v108->_platterView, "contentView");
    [v62 addSubview:v108->_rootStackView];

    v24 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    iconView = v108->_iconView;
    v108->_iconView = v24;

    -[UIImageView setContentHuggingPriority:forAxis:](v108->_iconView, "setContentHuggingPriority:forAxis:", 0LL);
    -[UIImageView setContentMode:](v108->_iconView, "setContentMode:", 1LL);
    -[UIStackView addArrangedSubview:](v108->_rootStackView, "addArrangedSubview:", v108->_iconView);
    v101 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    -[UIStackView setAxis:](v101, "setAxis:", 1LL);
    -[UIStackView setDistribution:](v101, "setDistribution:", 0LL);
    -[UIStackView setAlignment:](v101, "setAlignment:", 1LL);
    LODWORD(v26) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](v101, "setContentHuggingPriority:forAxis:", 0LL, v26);
    -[UIStackView addArrangedSubview:](v108->_rootStackView, "addArrangedSubview:", v101);
    v27 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v108->_titleLabel;
    v108->_titleLabel = v27;

    v63 = v108->_titleLabel;
    v64 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    -[UILabel setFont:](v63, "setFont:");

    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v108->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    -[UIStackView addArrangedSubview:](v101, "addArrangedSubview:", v108->_titleLabel);
    v29 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = v108->_subtitleLabel;
    v108->_subtitleLabel = v29;

    v65 = v108->_subtitleLabel;
    v66 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    -[UILabel setFont:](v65, "setFont:");

    v67 = v108->_subtitleLabel;
    id v68 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    -[UILabel setTextColor:](v67, "setTextColor:");

    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v108->_subtitleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    -[UIStackView addArrangedSubview:](v101, "addArrangedSubview:", v108->_subtitleLabel);
    v31 = objc_alloc_init(&OBJC_CLASS___UILabel);
    accessoryTextLabel = v108->_accessoryTextLabel;
    v108->_accessoryTextLabel = v31;

    v69 = v108->_accessoryTextLabel;
    v70 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    -[UILabel setFont:](v69, "setFont:");

    LODWORD(v33) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:]( v108->_accessoryTextLabel,  "setContentHuggingPriority:forAxis:",  0LL,  v33);
    -[UIStackView addArrangedSubview:](v108->_rootStackView, "addArrangedSubview:", v108->_accessoryTextLabel);
    id v72 = -[_UIFloatingContentView topAnchor](v108->_platterView, "topAnchor");
    id v71 = -[TVSMExpanseAlertButton topAnchor](v108, "topAnchor");
    v34 = (NSLayoutConstraint *)objc_msgSend(v72, "constraintEqualToAnchor:");
    platterViewTopConstraint = v108->_platterViewTopConstraint;
    v108->_platterViewTopConstraint = v34;

    id v74 = -[_UIFloatingContentView bottomAnchor](v108->_platterView, "bottomAnchor");
    id v73 = -[TVSMExpanseAlertButton bottomAnchor](v108, "bottomAnchor");
    v36 = (NSLayoutConstraint *)objc_msgSend(v74, "constraintEqualToAnchor:");
    platterViewBottomConstraint = v108->_platterViewBottomConstraint;
    v108->_platterViewBottomConstraint = v36;

    id v76 = -[_UIFloatingContentView leadingAnchor](v108->_platterView, "leadingAnchor");
    id v75 = -[TVSMExpanseAlertButton leadingAnchor](v108, "leadingAnchor");
    v38 = (NSLayoutConstraint *)objc_msgSend(v76, "constraintEqualToAnchor:");
    platterViewLeadingConstraint = v108->_platterViewLeadingConstraint;
    v108->_platterViewLeadingConstraint = v38;

    id v78 = -[_UIFloatingContentView trailingAnchor](v108->_platterView, "trailingAnchor");
    id v77 = -[TVSMExpanseAlertButton trailingAnchor](v108, "trailingAnchor");
    v40 = (NSLayoutConstraint *)objc_msgSend(v78, "constraintEqualToAnchor:");
    platterViewTrailingConstraint = v108->_platterViewTrailingConstraint;
    v108->_platterViewTrailingConstraint = v40;

    id v97 = -[UIImageView widthAnchor](v108->_iconView, "widthAnchor");
    id v96 = [v97 constraintEqualToConstant:64.0];
    v110[0] = v96;
    v110[1] = v108->_platterViewTopConstraint;
    v110[2] = v108->_platterViewBottomConstraint;
    v110[3] = v108->_platterViewLeadingConstraint;
    v110[4] = v108->_platterViewTrailingConstraint;
    id v95 = -[UIStackView topAnchor](v108->_rootStackView, "topAnchor");
    id v94 = -[_UIFloatingContentView contentView](v108->_platterView, "contentView");
    id v93 = [v94 topAnchor];
    id v92 = objc_msgSend(v95, "constraintEqualToAnchor:");
    v110[5] = v92;
    id v91 = -[UIStackView bottomAnchor](v108->_rootStackView, "bottomAnchor");
    id v90 = -[_UIFloatingContentView contentView](v108->_platterView, "contentView");
    id v89 = [v90 bottomAnchor];
    id v88 = objc_msgSend(v91, "constraintEqualToAnchor:");
    v110[6] = v88;
    id v87 = -[UIStackView leadingAnchor](v108->_rootStackView, "leadingAnchor");
    id v86 = -[_UIFloatingContentView contentView](v108->_platterView, "contentView");
    id v85 = [v86 leadingAnchor];
    id v84 = objc_msgSend(v87, "constraintEqualToAnchor:constant:", 20.0);
    v110[7] = v84;
    id v83 = -[UIStackView trailingAnchor](v108->_rootStackView, "trailingAnchor");
    id v82 = -[_UIFloatingContentView contentView](v108->_platterView, "contentView");
    id v81 = [v82 trailingAnchor];
    id v80 = objc_msgSend(v83, "constraintEqualToAnchor:constant:", -20.0);
    v110[8] = v80;
    v79 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v110, 9LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSMExpanseAlertButton updateStateAnimated:](v108, "updateStateAnimated:", 0LL);
    objc_storeStrong((id *)&v101, 0LL);
    objc_storeStrong((id *)&v102, 0LL);
  }

  v43 = v108;
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(&v105, 0LL);
  objc_storeStrong(&v106, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v108, 0LL);
  return v43;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((sub_8730(location[0]) & 1) != 0)
  {
    -[TVSMExpanseAlertButton setHighlighted:](v9, "setHighlighted:", 1LL);
    -[TVSMExpanseAlertButton updateStateAnimated:](v9, "updateStateAnimated:", 1LL);
    int v6 = 1;
  }

  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSMExpanseAlertButton;
    -[TVSMExpanseAlertButton pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v7);
    int v6 = 0;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((sub_8730(location[0]) & 1) != 0)
  {
    -[TVSMExpanseAlertButton setHighlighted:](v9, "setHighlighted:", 0LL);
    -[TVSMExpanseAlertButton updateStateAnimated:](v9, "updateStateAnimated:", 1LL);
    int v6 = 1;
  }

  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSMExpanseAlertButton;
    -[TVSMExpanseAlertButton pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v7);
    int v6 = 0;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((sub_8730(location[0]) & 1) != 0
    && (-[TVSMExpanseAlertButton isHighlighted](v9, "isHighlighted") & 1) != 0)
  {
    -[TVSMExpanseAlertButton setHighlighted:](v9, "setHighlighted:", 0LL);
    -[TVSMExpanseAlertButton updateStateAnimated:](v9, "updateStateAnimated:", 1LL);
    -[TVSMExpanseAlertButton sendActionsForControlEvents:](v9, "sendActionsForControlEvents:", 0x2000LL);
    int v6 = 1;
  }

  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSMExpanseAlertButton;
    -[TVSMExpanseAlertButton pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v7);
    int v6 = 0;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v5 = v12;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_8A6C;
  v10 = &unk_101F8;
  v11 = v14;
  objc_msgSend(v5, "addCoordinatedAnimations:completion:");
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateStateAnimated:(BOOL)a3
{
  v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_8C54;
  v13 = &unk_101F8;
  v14 = self;
  id v15 = objc_retainBlock(&v9);
  if (v16)
  {
    v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = sub_9220;
    int v7 = &unk_10220;
    id v8 = v15;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  &v3,  0.1,  0.0);
    objc_storeStrong(&v8, 0LL);
  }

  else
  {
    (*((void (**)(void))v15 + 2))();
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
}

- (void)setTitle:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseAlertButton setTitle:animated:](v4, "setTitle:animated:", location[0], 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)setTitle:(id)a3 animated:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualStrings(location[0], v8->_title) & 1) == 0)
  {
    int v4 = (NSString *)[location[0] copy];
    title = v8->_title;
    v8->_title = v4;

    -[TVSMExpanseAlertButton updateStateAnimated:](v8, "updateStateAnimated:", a4);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setSystemImageName:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseAlertButton setSystemImageName:animated:](v4, "setSystemImageName:animated:", location[0], 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)setSystemImageName:(id)a3 animated:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualStrings(location[0], v8->_systemImageName) & 1) == 0)
  {
    int v4 = (NSString *)[location[0] copy];
    systemImageName = v8->_systemImageName;
    v8->_systemImageName = v4;

    -[TVSMExpanseAlertButton updateStateAnimated:](v8, "updateStateAnimated:", a4);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setSubtitle:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseAlertButton setSubtitle:animated:](v4, "setSubtitle:animated:", location[0], 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)setSubtitle:(id)a3 animated:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualStrings(location[0], v8->_subtitle) & 1) == 0)
  {
    int v4 = (NSString *)[location[0] copy];
    subtitle = v8->_subtitle;
    v8->_subtitle = v4;

    -[TVSMExpanseAlertButton updateStateAnimated:](v8, "updateStateAnimated:", a4);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setAccessoryText:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseAlertButton setAccessoryText:animated:](v4, "setAccessoryText:animated:", location[0], 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)setAccessoryText:(id)a3 animated:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualStrings(location[0], v8->_accessoryText) & 1) == 0)
  {
    int v4 = (NSString *)[location[0] copy];
    accessoryText = v8->_accessoryText;
    v8->_accessoryText = v4;

    -[TVSMExpanseAlertButton updateStateAnimated:](v8, "updateStateAnimated:", a4);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPrimaryContentColor:(id)a3 forControlState:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = location[0];
  primaryContentColorMap = v16->_primaryContentColorMap;
  v13 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4);
  id v12 = -[NSMutableDictionary objectForKeyedSubscript:](primaryContentColorMap, "objectForKeyedSubscript:");
  char v14 = BSEqualObjects(v11);

  if ((v14 & 1) == 0)
  {
    id v5 = location[0];
    int v6 = v16->_primaryContentColorMap;
    int v7 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5);

    -[TVSMExpanseAlertButton updateStateAnimated:](v16, "updateStateAnimated:", a5);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setSecondaryContentColor:(id)a3 forControlState:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = location[0];
  secondaryContentColorMap = v16->_secondaryContentColorMap;
  v13 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4);
  id v12 = -[NSMutableDictionary objectForKeyedSubscript:](secondaryContentColorMap, "objectForKeyedSubscript:");
  char v14 = BSEqualObjects(v11);

  if ((v14 & 1) == 0)
  {
    id v5 = location[0];
    int v6 = v16->_secondaryContentColorMap;
    int v7 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5);

    -[TVSMExpanseAlertButton updateStateAnimated:](v16, "updateStateAnimated:", a5);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPlatterColor:(id)a3 forControlState:(unint64_t)a4 animated:(BOOL)a5
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[_UIFloatingContentView backgroundColorForState:](v9->_platterView, "backgroundColorForState:", a4);
  char v7 = BSEqualObjects(v6);

  if ((v7 & 1) == 0)
  {
    -[_UIFloatingContentView setBackgroundColor:forState:]( v9->_platterView,  "setBackgroundColor:forState:",  location[0],  a4);
    if (a4 == 8)
    {
      -[_UIFloatingContentView setBackgroundColor:forState:]( v9->_platterView,  "setBackgroundColor:forState:",  location[0],  1LL);
      -[_UIFloatingContentView setBackgroundColor:forState:]( v9->_platterView,  "setBackgroundColor:forState:",  location[0],  4LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (_UIFloatingContentView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIStackView)rootStackView
{
  return self->_rootStackView;
}

- (void)setRootStackView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)accessoryTextLabel
{
  return self->_accessoryTextLabel;
}

- (void)setAccessoryTextLabel:(id)a3
{
}

- (NSLayoutConstraint)platterViewTopConstraint
{
  return self->_platterViewTopConstraint;
}

- (void)setPlatterViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)platterViewBottomConstraint
{
  return self->_platterViewBottomConstraint;
}

- (void)setPlatterViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)platterViewLeadingConstraint
{
  return self->_platterViewLeadingConstraint;
}

- (void)setPlatterViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)platterViewTrailingConstraint
{
  return self->_platterViewTrailingConstraint;
}

- (void)setPlatterViewTrailingConstraint:(id)a3
{
}

- (NSMutableDictionary)primaryContentColorMap
{
  return self->_primaryContentColorMap;
}

- (void)setPrimaryContentColorMap:(id)a3
{
}

- (NSMutableDictionary)secondaryContentColorMap
{
  return self->_secondaryContentColorMap;
}

- (void)setSecondaryContentColorMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end