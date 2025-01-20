@interface TVSMGameControllerCollectionViewCell
+ (void)_configureFloatingContentViewAppearance;
- (BOOL)_canHandlePresses:(id)a3;
- (BOOL)showingActivityIndicator;
- (NSArray)volatileContraints;
- (NSString)accessoryImageSymbolName;
- (NSString)imageSymbolName;
- (NSString)subtitle;
- (NSString)title;
- (TVSMGameControllerCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImageView)accessoryImageView;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)accessoryLayoutGuide;
- (UIView)backgroundColorView;
- (_UIFloatingContentView)floatingContentView;
- (unint64_t)_floatingContentViewControlState;
- (void)_updateColors;
- (void)_updateFloatingContentViewControlState;
- (void)_updateVisibleAccessoryView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAccessoryImageSymbolName:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageSymbolName:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowingActivityIndicator:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVolatileContraints:(id)a3;
- (void)updateConstraints;
@end

@implementation TVSMGameControllerCollectionViewCell

- (TVSMGameControllerCollectionViewCell)initWithFrame:(CGRect)a3
{
  CGRect v133 = a3;
  SEL v131 = a2;
  id v132 = 0LL;
  v130.receiver = self;
  v130.super_class = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  id v132 = -[TVSMGameControllerCollectionViewCell initWithFrame:]( &v130,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong(&v132, v132);
  if (v132)
  {
    [(id)objc_opt_class(v132) _configureFloatingContentViewAppearance];
    v3 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    v4 = (void *)*((void *)v132 + 4);
    *((void *)v132 + 4) = v3;

    [*((id *)v132 + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = (void *)*((void *)v132 + 4);
    sub_5618();
    v129[1] = v5;
    v129[2] = v6;
    objc_msgSend( v31,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  *(double *)&v5,  *(double *)&v6);
    [*((id *)v132 + 4) setFocusedSizeIncrease:15.0];
    [v132 addSubview:*((void *)v132 + 4)];
    v129[0] = [*((id *)v132 + 4) contentView];
    v32 = objc_alloc(&OBJC_CLASS___UIView);
    [v132 bounds];
    v128[1] = v7;
    v128[2] = v8;
    v128[3] = v9;
    v128[4] = v10;
    v11 = -[UIView initWithFrame:]( v32,  "initWithFrame:",  *(double *)&v7,  *(double *)&v8,  *(double *)&v9,  *(double *)&v10);
    v12 = (void *)*((void *)v132 + 5);
    *((void *)v132 + 5) = v11;

    [*((id *)v132 + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v132 + 5) _setContinuousCornerRadius:12.0];
    v33 = (void *)*((void *)v132 + 5);
    v34 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
    objc_msgSend(v33, "setBackgroundColor:");

    [v129[0] addSubview:*((void *)v132 + 5)];
    v13 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    v14 = (void *)*((void *)v132 + 6);
    *((void *)v132 + 6) = v13;

    [*((id *)v132 + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(*((id *)v132 + 6), "setContentMode:");
    v35 = (void *)*((void *)v132 + 6);
    v37 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    v36 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    objc_msgSend(v35, "setPreferredSymbolConfiguration:");

    [v129[0] addSubview:*((void *)v132 + 6)];
    v15 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v16 = (void *)*((void *)v132 + 7);
    *((void *)v132 + 7) = v15;

    [*((id *)v132 + 7) setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = (void *)*((void *)v132 + 7);
    v39 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    objc_msgSend(v38, "setFont:");

    [*((id *)v132 + 7) setEnablesMarqueeWhenAncestorFocused:1];
    [*((id *)v132 + 7) setText:&stru_14478];
    [v129[0] addSubview:*((void *)v132 + 7)];
    v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v18 = (void *)*((void *)v132 + 8);
    *((void *)v132 + 8) = v17;

    [*((id *)v132 + 8) setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = (void *)*((void *)v132 + 8);
    v41 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    objc_msgSend(v40, "setFont:");

    [v129[0] addSubview:*((void *)v132 + 8)];
    v19 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    v20 = (void *)*((void *)v132 + 9);
    *((void *)v132 + 9) = v19;

    [*((id *)v132 + 9) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v132 + 9) setContentMode:4];
    v42 = (void *)*((void *)v132 + 9);
    v44 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1);
    v43 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    objc_msgSend(v42, "setPreferredSymbolConfiguration:");

    [*((id *)v132 + 9) setHidden:1];
    [v129[0] addSubview:*((void *)v132 + 9)];
    v21 = objc_alloc_init(&OBJC_CLASS___UIActivityIndicatorView);
    v22 = (void *)*((void *)v132 + 10);
    *((void *)v132 + 10) = v21;

    [*((id *)v132 + 10) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v132 + 10) setHidden:1];
    [v129[0] addSubview:*((void *)v132 + 10)];
    v23 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    v24 = (void *)*((void *)v132 + 11);
    *((void *)v132 + 11) = v23;

    [v129[0] addLayoutGuide:*((void *)v132 + 11)];
    id v127 = [*((id *)v132 + 4) leadingAnchor];
    id v126 = [v132 leadingAnchor];
    id v125 = objc_msgSend(v127, "constraintEqualToAnchor:");
    v134[0] = v125;
    id v124 = [*((id *)v132 + 4) trailingAnchor];
    id v123 = [v132 trailingAnchor];
    id v122 = objc_msgSend(v124, "constraintEqualToAnchor:");
    v134[1] = v122;
    id v121 = [*((id *)v132 + 4) topAnchor];
    id v120 = [v132 topAnchor];
    id v119 = objc_msgSend(v121, "constraintEqualToAnchor:");
    v134[2] = v119;
    id v118 = [*((id *)v132 + 4) bottomAnchor];
    id v117 = [v132 bottomAnchor];
    id v116 = objc_msgSend(v118, "constraintEqualToAnchor:");
    v134[3] = v116;
    id v115 = [*((id *)v132 + 5) leadingAnchor];
    id v114 = [v129[0] leadingAnchor];
    id v113 = objc_msgSend(v115, "constraintEqualToAnchor:");
    v134[4] = v113;
    id v112 = [*((id *)v132 + 5) trailingAnchor];
    id v111 = [v129[0] trailingAnchor];
    id v110 = objc_msgSend(v112, "constraintEqualToAnchor:");
    v134[5] = v110;
    id v109 = [*((id *)v132 + 5) topAnchor];
    id v108 = [v129[0] topAnchor];
    id v107 = objc_msgSend(v109, "constraintEqualToAnchor:");
    v134[6] = v107;
    id v106 = [*((id *)v132 + 5) bottomAnchor];
    id v105 = [v129[0] bottomAnchor];
    id v104 = objc_msgSend(v106, "constraintEqualToAnchor:");
    v134[7] = v104;
    id v103 = [*((id *)v132 + 6) leadingAnchor];
    id v102 = [v129[0] leadingAnchor];
    id v101 = objc_msgSend(v103, "constraintEqualToAnchor:constant:", 30.0);
    v134[8] = v101;
    id v100 = [*((id *)v132 + 6) centerYAnchor];
    id v99 = [v129[0] centerYAnchor];
    id v98 = objc_msgSend(v100, "constraintEqualToAnchor:");
    v134[9] = v98;
    id v97 = [*((id *)v132 + 6) widthAnchor];
    sub_5644();
    id v96 = [v97 constraintEqualToConstant:v25];
    v134[10] = v96;
    id v95 = [*((id *)v132 + 6) heightAnchor];
    sub_5644();
    id v94 = [v95 constraintEqualToConstant:v26];
    v134[11] = v94;
    id v93 = [*((id *)v132 + 11) trailingAnchor];
    id v92 = [v129[0] trailingAnchor];
    id v91 = objc_msgSend(v93, "constraintEqualToAnchor:constant:", -30.0);
    v134[12] = v91;
    id v90 = [*((id *)v132 + 11) centerYAnchor];
    id v89 = [v129[0] centerYAnchor];
    id v88 = objc_msgSend(v90, "constraintEqualToAnchor:");
    v134[13] = v88;
    id v87 = [*((id *)v132 + 11) widthAnchor];
    sub_5644();
    id v86 = [v87 constraintEqualToConstant:v27];
    v134[14] = v86;
    id v85 = [*((id *)v132 + 11) heightAnchor];
    sub_5644();
    id v84 = [v85 constraintEqualToConstant:v28];
    v134[15] = v84;
    id v83 = [*((id *)v132 + 9) leadingAnchor];
    id v82 = [*((id *)v132 + 11) leadingAnchor];
    id v81 = objc_msgSend(v83, "constraintEqualToAnchor:");
    v134[16] = v81;
    id v80 = [*((id *)v132 + 9) trailingAnchor];
    id v79 = [*((id *)v132 + 11) trailingAnchor];
    id v78 = objc_msgSend(v80, "constraintEqualToAnchor:");
    v134[17] = v78;
    id v77 = [*((id *)v132 + 9) topAnchor];
    id v76 = [*((id *)v132 + 11) topAnchor];
    id v75 = objc_msgSend(v77, "constraintEqualToAnchor:");
    v134[18] = v75;
    id v74 = [*((id *)v132 + 9) bottomAnchor];
    id v73 = [*((id *)v132 + 11) bottomAnchor];
    id v72 = objc_msgSend(v74, "constraintEqualToAnchor:");
    v134[19] = v72;
    id v71 = [*((id *)v132 + 10) leadingAnchor];
    id v70 = [*((id *)v132 + 11) leadingAnchor];
    id v69 = objc_msgSend(v71, "constraintEqualToAnchor:");
    v134[20] = v69;
    id v68 = [*((id *)v132 + 10) trailingAnchor];
    id v67 = [*((id *)v132 + 11) trailingAnchor];
    id v66 = objc_msgSend(v68, "constraintEqualToAnchor:");
    v134[21] = v66;
    id v65 = [*((id *)v132 + 10) topAnchor];
    id v64 = [*((id *)v132 + 11) topAnchor];
    id v63 = objc_msgSend(v65, "constraintEqualToAnchor:");
    v134[22] = v63;
    id v62 = [*((id *)v132 + 10) bottomAnchor];
    id v61 = [*((id *)v132 + 11) bottomAnchor];
    id v60 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v134[23] = v60;
    id v59 = [*((id *)v132 + 7) leadingAnchor];
    id v58 = [*((id *)v132 + 6) trailingAnchor];
    id v57 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", 27.0);
    v134[24] = v57;
    id v56 = [*((id *)v132 + 7) trailingAnchor];
    id v55 = [*((id *)v132 + 11) leadingAnchor];
    id v54 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", -27.0);
    v134[25] = v54;
    id v53 = [*((id *)v132 + 8) leadingAnchor];
    id v52 = [*((id *)v132 + 7) leadingAnchor];
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v134[26] = v51;
    id v50 = [*((id *)v132 + 8) trailingAnchor];
    id v49 = [*((id *)v132 + 7) trailingAnchor];
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v134[27] = v48;
    id v47 = [*((id *)v132 + 8) firstBaselineAnchor];
    id v46 = [*((id *)v132 + 7) lastBaselineAnchor];
    id v45 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", 36.0);
    v134[28] = v45;
    v128[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v134, 29LL);

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v128[0]);
    [v132 _updateColors];
    [v132 setNeedsUpdateConstraints];
    objc_storeStrong(v128, 0LL);
    objc_storeStrong(v129, 0LL);
  }

  v30 = (TVSMGameControllerCollectionViewCell *)v132;
  objc_storeStrong(&v132, 0LL);
  return v30;
}

  ;
}

  ;
}

- (void)setTitle:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0]) {
    objc_storeStrong(location, location[0]);
  }
  else {
    objc_storeStrong(location, &stru_14478);
  }
  v4 = -[TVSMGameControllerCollectionViewCell title](v7, "title");
  unsigned __int8 v5 = -[NSString isEqual:](v4, "isEqual:", location[0]);

  if ((v5 & 1) == 0)
  {
    v3 = -[TVSMGameControllerCollectionViewCell titleLabel](v7, "titleLabel");
    -[UILabel setText:](v3, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (NSString)title
{
  v3 = -[TVSMGameControllerCollectionViewCell titleLabel](self, "titleLabel");
  v4 = -[UILabel text](v3, "text");

  return v4;
}

- (void)setSubtitle:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = -[TVSMGameControllerCollectionViewCell subtitle](v8, "subtitle");
  BOOL v4 = -[NSString length](v3, "length") != 0;

  BOOL v6 = [location[0] length] != 0;
  unsigned __int8 v5 = -[TVSMGameControllerCollectionViewCell subtitleLabel](v8, "subtitleLabel");
  -[UILabel setText:](v5, "setText:", location[0]);

  if (v4 != v6) {
    -[TVSMGameControllerCollectionViewCell setNeedsUpdateConstraints](v8, "setNeedsUpdateConstraints");
  }
  objc_storeStrong(location, 0LL);
}

- (NSString)subtitle
{
  v3 = -[TVSMGameControllerCollectionViewCell subtitleLabel](self, "subtitleLabel");
  BOOL v4 = -[UILabel text](v3, "text");

  return v4;
}

- (void)setImageSymbolName:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v8->_imageSymbolName, "isEqualToString:", location[0]))
  {
    v3 = (NSString *)[location[0] copy];
    imageSymbolName = v8->_imageSymbolName;
    v8->_imageSymbolName = v3;

    BOOL v6 = -[TVSMGameControllerCollectionViewCell imageView](v8, "imageView");
    id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v8->_imageSymbolName);
    -[UIImageView setImage:](v6, "setImage:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setAccessoryImageSymbolName:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v8->_accessoryImageSymbolName, "isEqualToString:", location[0]))
  {
    v3 = (NSString *)[location[0] copy];
    accessoryImageSymbolName = v8->_accessoryImageSymbolName;
    v8->_accessoryImageSymbolName = v3;

    BOOL v6 = -[TVSMGameControllerCollectionViewCell accessoryImageView](v8, "accessoryImageView");
    id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v8->_accessoryImageSymbolName);
    -[UIImageView setImage:](v6, "setImage:");

    -[TVSMGameControllerCollectionViewCell _updateVisibleAccessoryView](v8, "_updateVisibleAccessoryView");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setShowingActivityIndicator:(BOOL)a3
{
  if (self->_showingActivityIndicator != a3)
  {
    self->_showingActivityIndicator = a3;
    -[TVSMGameControllerCollectionViewCell _updateVisibleAccessoryView](self, "_updateVisibleAccessoryView");
  }

- (void)updateConstraints
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell updateConstraints](&v14, "updateConstraints");
  id v13 = -[TVSMGameControllerCollectionViewCell contentView](v16, "contentView");
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = -[TVSMGameControllerCollectionViewCell subtitle](v16, "subtitle");
  BOOL v4 = -[NSString length](v3, "length") != 0;

  BOOL v11 = v4;
  double v2 = 46.0;
  if (!v4) {
    double v2 = 64.0;
  }
  double v10 = v2;
  v8 = -[TVSMGameControllerCollectionViewCell titleLabel](v16, "titleLabel");
  id v7 = -[UILabel firstBaselineAnchor](v8, "firstBaselineAnchor");
  id v6 = [v13 topAnchor];
  id v5 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v10);
  objc_msgSend(v12, "addObject:");

  id location = -[TVSMGameControllerCollectionViewCell volatileContraints](v16, "volatileContraints");
  if (([v12 isEqualToArray:location] & 1) == 0)
  {
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", location);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);
    -[TVSMGameControllerCollectionViewCell setVolatileContraints:](v16, "setVolatileContraints:", v12);
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  v9  = self;
  v8  = a2;
  BOOL v7 = a3;
  char v6 = -[TVSMGameControllerCollectionViewCell isHighlighted](self, "isHighlighted") & 1;
  v5.receiver  = v9;
  v5.super_class  = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell setHighlighted:](&v5, "setHighlighted:", v7);
  if ((v6 & 1) != v7)
  {
    unint64_t v4 = -[TVSMGameControllerCollectionViewCell _floatingContentViewControlState]( v9,  "_floatingContentViewControlState");
    if (v7) {
      v4 |= 1uLL;
    }
    v3  = -[TVSMGameControllerCollectionViewCell floatingContentView](v9, "floatingContentView");
    -[_UIFloatingContentView setControlState:animated:](v3, "setControlState:animated:", v4, 1LL);
  }

- (void)prepareForReuse
{
  objc_super v5 = self;
  SEL v4 = a2;
  v3.receiver  = self;
  v3.super_class  = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  double v2 = -[TVSMGameControllerCollectionViewCell floatingContentView](v5, "floatingContentView");
  -[_UIFloatingContentView setControlState:animated:](v2, "setControlState:animated:", 0LL, 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  SEL v15 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  v12.receiver  = v15;
  v12.super_class  = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v13);
  -[TVSMGameControllerCollectionViewCell _updateFloatingContentViewControlState]( v15,  "_updateFloatingContentViewControlState");
  id v5 = v13;
  char v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  v8  = 0;
  v9  = sub_606C;
  double v10 = &unk_142A0;
  BOOL v11 = v15;
  objc_msgSend(v5, "addCoordinatedAnimations:completion:");
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v8  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVSMGameControllerCollectionViewCell _canHandlePresses:](v8, "_canHandlePresses:", location[0])) {
    -[TVSMGameControllerCollectionViewCell setHighlighted:](v8, "setHighlighted:", 1LL);
  }
  v5.receiver  = v8;
  v5.super_class  = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v6);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v8  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  v5.receiver  = v8;
  v5.super_class  = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell pressesCancelled:withEvent:]( &v5,  "pressesCancelled:withEvent:",  location[0],  v6);
  if (-[TVSMGameControllerCollectionViewCell _canHandlePresses:](v8, "_canHandlePresses:", location[0])) {
    -[TVSMGameControllerCollectionViewCell setHighlighted:](v8, "setHighlighted:", 0LL);
  }
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v8  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  v5.receiver  = v8;
  v5.super_class  = (Class)&OBJC_CLASS___TVSMGameControllerCollectionViewCell;
  -[TVSMGameControllerCollectionViewCell pressesEnded:withEvent:](&v5, "pressesEnded:withEvent:", location[0], v6);
  if (-[TVSMGameControllerCollectionViewCell _canHandlePresses:](v8, "_canHandlePresses:", location[0])) {
    -[TVSMGameControllerCollectionViewCell setHighlighted:](v8, "setHighlighted:", 0LL);
  }
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (void)_configureFloatingContentViewAppearance
{
  v3  = (dispatch_once_t *)&unk_1A470;
  id location = 0LL;
  objc_storeStrong(&location, &stru_142E0);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0LL);
}

- (BOOL)_canHandlePresses:(id)a3
{
  id location[2] = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = objc_msgSend(location[0], "bs_containsObjectPassingTest:", &stru_14320);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (void)_updateFloatingContentViewControlState
{
  unsigned __int8 v4 = -[TVSMGameControllerCollectionViewCell floatingContentView](self, "floatingContentView");
  unint64_t v2 = -[TVSMGameControllerCollectionViewCell _floatingContentViewControlState]( self,  "_floatingContentViewControlState");
  v3  =  -[TVSMGameControllerCollectionViewCell _currentFocusAnimationCoordinator]( self,  "_currentFocusAnimationCoordinator");
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v4,  "setControlState:withAnimationCoordinator:",  v2);
}

- (unint64_t)_floatingContentViewControlState
{
  v3  = 0LL;
  return v3;
}

- (void)_updateVisibleAccessoryView
{
  id v6 = self;
  SEL v5 = a2;
  unsigned __int8 v4 = -[TVSMGameControllerCollectionViewCell showingActivityIndicator](self, "showingActivityIndicator");
  id location = -[TVSMGameControllerCollectionViewCell activityIndicatorView](v6, "activityIndicatorView");
  [location setHidden:(v4 ^ 1) & 1];
  unint64_t v2 = -[TVSMGameControllerCollectionViewCell accessoryImageView](v6, "accessoryImageView");
  -[UIImageView setHidden:](v2, "setHidden:", v4 & 1);

  if ((v4 & 1) != 0) {
    [location startAnimating];
  }
  else {
    [location stopAnimating];
  }
  objc_storeStrong(&location, 0LL);
}

- (void)_updateColors
{
  objc_super v12 = self;
  SEL v11 = a2;
  objc_super v14 = (dispatch_once_t *)&unk_1A498;
  id location = 0LL;
  objc_storeStrong(&location, &stru_14340);
  if (*v14 != -1) {
    dispatch_once(v14, location);
  }
  objc_storeStrong(&location, 0LL);
  char v10 = -[TVSMGameControllerCollectionViewCell isFocused](v12, "isFocused") & 1;
  if (v10) {
    id v2 = (id)qword_1A478;
  }
  else {
    id v2 = (id)qword_1A480;
  }
  v9  = v2;
  unsigned __int8 v4 = -[TVSMGameControllerCollectionViewCell titleLabel](v12, "titleLabel");
  -[UILabel setTextColor:](v4, "setTextColor:", v9);

  SEL v5 = -[TVSMGameControllerCollectionViewCell imageView](v12, "imageView");
  -[UIImageView setTintColor:](v5, "setTintColor:", v9);

  id v6 = -[TVSMGameControllerCollectionViewCell accessoryImageView](v12, "accessoryImageView");
  -[UIImageView setTintColor:](v6, "setTintColor:", v9);

  int v7 = -[TVSMGameControllerCollectionViewCell activityIndicatorView](v12, "activityIndicatorView");
  -[UIActivityIndicatorView setColor:](v7, "setColor:", v9);

  v8  = -[TVSMGameControllerCollectionViewCell subtitleLabel](v12, "subtitleLabel");
  if ((v10 & 1) != 0) {
    v3  = qword_1A488;
  }
  else {
    v3  = qword_1A490;
  }
  -[UILabel setTextColor:](v8, "setTextColor:", v3, v3);

  objc_storeStrong(&v9, 0LL);
}

- (NSString)imageSymbolName
{
  return self->_imageSymbolName;
}

- (NSString)accessoryImageSymbolName
{
  return self->_accessoryImageSymbolName;
}

- (BOOL)showingActivityIndicator
{
  return self->_showingActivityIndicator;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UILayoutGuide)accessoryLayoutGuide
{
  return self->_accessoryLayoutGuide;
}

- (NSArray)volatileContraints
{
  return self->_volatileContraints;
}

- (void)setVolatileContraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end