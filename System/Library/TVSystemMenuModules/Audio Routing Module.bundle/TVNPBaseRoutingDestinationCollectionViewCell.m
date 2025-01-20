@interface TVNPBaseRoutingDestinationCollectionViewCell
+ (void)_configureFloatingContentViewAppearance;
- (BOOL)isEnabled;
- (BOOL)showDeviceImage;
- (CGRect)boundsUsedForArtworkShadow;
- (NSMutableArray)volatileContraints;
- (NSString)subtitleText;
- (NSString)titleText;
- (TVNPBaseRoutingDestinationCollectionViewCell)initWithFrame:(CGRect)a3;
- (TVNPRoutingMusicBarsView)musicBarsView;
- (UIImage)artworkImage;
- (UIImage)deviceImage;
- (UIImageView)artworkImageView;
- (UIImageView)deviceImageView;
- (UIImageView)symbolImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)backgroundColorView;
- (UIView)shadowView;
- (_UIFloatingContentView)floatingContentView;
- (unint64_t)_controlStateForCell;
- (unint64_t)deviceType;
- (unint64_t)musicBarState;
- (void)_addInitialConstraints;
- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setArtworkImage:(id)a3;
- (void)setBoundsUsedForArtworkShadow:(CGRect)a3;
- (void)setDeviceImage:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMusicBarState:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowDeviceImage:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateConstraints;
- (void)useFocusedAppearance;
@end

@implementation TVNPBaseRoutingDestinationCollectionViewCell

- (TVNPBaseRoutingDestinationCollectionViewCell)initWithFrame:(CGRect)a3
{
  CGRect v69 = a3;
  SEL v67 = a2;
  v68 = 0LL;
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  v63 = -[TVNPBaseRoutingDestinationCollectionViewCell initWithFrame:]( &v66,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v68 = v63;
  objc_storeStrong((id *)&v68, v63);
  if (v63)
  {
    v68->_enabled = 1;
    -[TVNPBaseRoutingDestinationCollectionViewCell _setSpeedBumpEdges:](v68, "_setSpeedBumpEdges:", 15LL);
    [(id)objc_opt_class(v68) _configureFloatingContentViewAppearance];
    v3 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v68->_floatingContentView;
    v68->_floatingContentView = v3;

    v41 = v68->_floatingContentView;
    sub_122B8();
    v65[1] = v5;
    v65[2] = v6;
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v41,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  *(double *)&v5,  *(double *)&v6);
    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v42 = v68->_floatingContentView;
    v43 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[_UIFloatingContentView setBackgroundColor:forState:](v42, "setBackgroundColor:forState:");

    -[TVNPBaseRoutingDestinationCollectionViewCell addSubview:](v68, "addSubview:", v68->_floatingContentView);
    v65[0] = -[_UIFloatingContentView contentView](v68->_floatingContentView, "contentView");
    v44 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVNPBaseRoutingDestinationCollectionViewCell bounds](v68, "bounds");
    v64[3] = v7;
    v64[4] = v8;
    v64[5] = v9;
    v64[6] = v10;
    v11 = -[UIView initWithFrame:]( v44,  "initWithFrame:",  *(double *)&v7,  *(double *)&v8,  *(double *)&v9,  *(double *)&v10);
    backgroundColorView = v68->_backgroundColorView;
    v68->_backgroundColorView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView _setContinuousCornerRadius:](v68->_backgroundColorView, "_setContinuousCornerRadius:");
    v45 = v68->_backgroundColorView;
    v46 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
    -[UIView setBackgroundColor:](v45, "setBackgroundColor:");

    [v65[0] addSubview:v68->_backgroundColorView];
    v13 = objc_alloc_init(&OBJC_CLASS___UIView);
    shadowView = v68->_shadowView;
    v68->_shadowView = v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_shadowView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v48 = -[UIView layer](v68->_shadowView, "layer");
    v47 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
    -[CALayer setShadowColor:](v48, "setShadowColor:", -[UIColor CGColor](v47, "CGColor"));

    v49 = -[UIView layer](v68->_shadowView, "layer");
    LODWORD(v15) = 1041865114;
    -[CALayer setShadowOpacity:](v49, "setShadowOpacity:", v15);

    v50 = -[UIView layer](v68->_shadowView, "layer");
    -[CALayer setShadowRadius:](v50, "setShadowRadius:", 4.0);

    v51 = -[UIView layer](v68->_shadowView, "layer");
    sub_122E4();
    v64[1] = v16;
    v64[2] = v17;
    -[CALayer setShadowOffset:](v51, "setShadowOffset:", *(double *)&v16, *(double *)&v17);

    p_boundsUsedForArtworkShadow = (CGSize *)&v68->_boundsUsedForArtworkShadow;
    v68->_boundsUsedForArtworkShadow.origin = CGRectZero.origin;
    p_boundsUsedForArtworkShadow[1] = CGRectZero.size;
    [v65[0] addSubview:v68->_shadowView];
    v19 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    artworkImageView = v68->_artworkImageView;
    v68->_artworkImageView = v19;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_artworkImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v68->_artworkImageView, "setContentMode:", 2LL);
    -[UIImageView _setContinuousCornerRadius:](v68->_artworkImageView, "_setContinuousCornerRadius:", 12.0);
    v52 = v68->_artworkImageView;
    v53 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
    -[UIImageView setBackgroundColor:](v52, "setBackgroundColor:");

    -[UIImageView setClipsToBounds:](v68->_artworkImageView, "setClipsToBounds:", 1LL);
    id v54 = -[UIImageView layer](v68->_artworkImageView, "layer");
    [v54 setMinificationFilter:kCAFilterTrilinear];

    [v65[0] addSubview:v68->_artworkImageView];
    v21 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    deviceImageView = v68->_deviceImageView;
    v68->_deviceImageView = v21;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_deviceImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v68->_deviceImageView, "setContentMode:", 1LL);
    -[UIImageView setHidden:](v68->_deviceImageView, "setHidden:", 1LL);
    [v65[0] addSubview:v68->_deviceImageView];
    v55 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2);
    v64[0] =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");

    id v56 = v64[0];
    id v57 =  +[UIImageSymbolConfiguration _configurationWithHierarchicalColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "_configurationWithHierarchicalColors:",  &__NSArray0__struct);
    id v23 = objc_msgSend(v56, "configurationByApplyingConfiguration:");
    id v24 = v64[0];
    v64[0] = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    symbolImageView = v68->_symbolImageView;
    v68->_symbolImageView = v25;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_symbolImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setPreferredSymbolConfiguration:](v68->_symbolImageView, "setPreferredSymbolConfiguration:", v64[0]);
    -[UIImageView setHidden:](v68->_symbolImageView, "setHidden:", 1LL);
    [v65[0] addSubview:v68->_symbolImageView];
    v27 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v68->_titleLabel;
    v68->_titleLabel = v27;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v68->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v58 = v68->_titleLabel;
    v59 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    -[UILabel setFont:](v58, "setFont:");

    [v65[0] addSubview:v68->_titleLabel];
    v29 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = v68->_subtitleLabel;
    v68->_subtitleLabel = v29;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v68->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v60 = v68->_subtitleLabel;
    v61 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    -[UILabel setFont:](v60, "setFont:");

    [v65[0] addSubview:v68->_subtitleLabel];
    v62 = objc_alloc(&OBJC_CLASS___TVNPRoutingMusicBarsView);
    sub_122E4();
    sub_122E4();
    sub_12310();
    v35 = -[TVNPRoutingMusicBarsView initWithFrame:](v62, "initWithFrame:", v31, v32, v33, v34);
    musicBarsView = v68->_musicBarsView;
    v68->_musicBarsView = v35;

    -[TVNPRoutingMusicBarsView setTranslatesAutoresizingMaskIntoConstraints:]( v68->_musicBarsView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    [v65[0] addSubview:v68->_musicBarsView];
    -[TVNPBaseRoutingDestinationCollectionViewCell _addInitialConstraints](v68, "_addInitialConstraints");
    -[TVNPBaseRoutingDestinationCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v68,  "_configureAppearanceForControlState:withAnimationCoordinator:",  0LL);
    v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    volatileContraints = v68->_volatileContraints;
    v68->_volatileContraints = v37;

    -[TVNPBaseRoutingDestinationCollectionViewCell setNeedsUpdateConstraints](v68, "setNeedsUpdateConstraints");
    objc_storeStrong(v64, 0LL);
    objc_storeStrong(v65, 0LL);
  }

  v40 = v68;
  objc_storeStrong((id *)&v68, 0LL);
  return v40;
}

  ;
}

  ;
}

  ;
}

- (void)prepareForReuse
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  -[TVNPBaseRoutingDestinationCollectionViewCell prepareForReuse](&v2, "prepareForReuse");
  -[TVNPRoutingMusicBarsView setState:](v4->_musicBarsView, "setState:", 0LL);
}

- (void)layoutSubviews
{
  double v31 = self;
  SEL v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  -[TVNPBaseRoutingDestinationCollectionViewCell layoutSubviews](&v29, "layoutSubviews");
  -[UIImageView bounds](v31->_artworkImageView, "bounds");
  CGRect v28 = v32;
  v33.origin.x = CGRectZero.origin.x;
  v33.origin.y = CGRectZero.origin.y;
  v33.size.width = CGRectZero.size.width;
  v33.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v32, v33))
  {
    v19 = -[UIView layer](v31->_shadowView, "layer");
    -[CALayer setShadowPath:](v19, "setShadowPath:", 0LL);
  }

  else
  {
    p_boundsUsedForArtworkShadow = &v31->_boundsUsedForArtworkShadow;
    -[UIImageView bounds](v31->_artworkImageView, "bounds");
    v27.origin.x = v2;
    v27.origin.y = v3;
    v27.size.width = v4;
    v27.size.height = v5;
    if (!CGRectEqualToRect(*p_boundsUsedForArtworkShadow, v27))
    {
      -[UIImageView bounds](v31->_artworkImageView, "bounds");
      double v22 = v6;
      double v23 = v7;
      double v24 = v8;
      double v25 = v9;
      sub_122E4();
      v26 =  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v22,  v23,  v24,  v25,  v10,  v11);
      v17 = -[UIView layer](v31->_shadowView, "layer");
      -[CALayer setShadowPath:](v17, "setShadowPath:", -[UIBezierPath CGPath](v26, "CGPath"));

      objc_storeStrong((id *)&v26, 0LL);
    }
  }

  -[UIImageView bounds](v31->_artworkImageView, "bounds", &v31->_boundsUsedForArtworkShadow);
  *(void *)&__int128 v20 = v12;
  *((void *)&v20 + 1) = v13;
  *(void *)&__int128 v21 = v14;
  *((void *)&v21 + 1) = v15;
  _OWORD *v16 = v20;
  v16[1] = v21;
}

- (void)useFocusedAppearance
{
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  v9.receiver = v12;
  v9.super_class = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  -[TVNPBaseRoutingDestinationCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v10);
  id v7 = [location[0] nextFocusedView];
  unsigned __int8 v4 = [v7 isDescendantOfView:v12];
  v12->_isFocused = v4 & 1;

  double v8 = v12;
  id v5 = -[TVNPBaseRoutingDestinationCollectionViewCell _controlStateForCell](v12, "_controlStateForCell");
  -[TVNPBaseRoutingDestinationCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v8,  "_configureAppearanceForControlState:withAnimationCoordinator:",  v5,  v10);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateConstraints
{
  v42 = self;
  SEL v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  -[TVNPBaseRoutingDestinationCollectionViewCell updateConstraints](&v40, "updateConstraints");
  id location = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v36 = -[TVNPBaseRoutingDestinationCollectionViewCell subtitleText](v42, "subtitleText");
  BOOL v37 = -[NSString length](v36, "length") != 0;

  BOOL v38 = -[TVNPBaseRoutingDestinationCollectionViewCell musicBarState](v42, "musicBarState") != 0;
  if (v37 && v38)
  {
    id v29 = -[UILabel firstBaselineAnchor](v42->_titleLabel, "firstBaselineAnchor");
    id v28 = -[TVNPBaseRoutingDestinationCollectionViewCell topAnchor](v42, "topAnchor");
    id v27 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", 82.0);
    objc_msgSend(location, "addObject:");

    id v32 = -[UILabel firstBaselineAnchor](v42->_subtitleLabel, "firstBaselineAnchor");
    id v31 = -[UILabel lastBaselineAnchor](v42->_titleLabel, "lastBaselineAnchor");
    id v30 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", 42.0);
    objc_msgSend(location, "addObject:");

    id v35 = -[TVNPRoutingMusicBarsView topAnchor](v42->_musicBarsView, "topAnchor");
    id v34 = -[UILabel lastBaselineAnchor](v42->_subtitleLabel, "lastBaselineAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", 24.0);
    objc_msgSend(location, "addObject:");
  }

  else if (v37)
  {
    id v23 = -[UILabel firstBaselineAnchor](v42->_titleLabel, "firstBaselineAnchor");
    id v22 = -[TVNPBaseRoutingDestinationCollectionViewCell topAnchor](v42, "topAnchor");
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 90.0);
    objc_msgSend(location, "addObject:");

    id v26 = -[UILabel firstBaselineAnchor](v42->_subtitleLabel, "firstBaselineAnchor");
    id v25 = -[UILabel lastBaselineAnchor](v42->_titleLabel, "lastBaselineAnchor");
    id v24 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", 42.0);
    objc_msgSend(location, "addObject:");
  }

  else if (v38)
  {
    id v17 = -[UILabel firstBaselineAnchor](v42->_titleLabel, "firstBaselineAnchor");
    id v16 = -[TVNPBaseRoutingDestinationCollectionViewCell topAnchor](v42, "topAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", 90.0);
    objc_msgSend(location, "addObject:");

    id v20 = -[TVNPRoutingMusicBarsView topAnchor](v42->_musicBarsView, "topAnchor");
    id v19 = -[UILabel lastBaselineAnchor](v42->_titleLabel, "lastBaselineAnchor");
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 24.0);
    objc_msgSend(location, "addObject:");
  }

  else
  {
    id v14 = -[UILabel firstBaselineAnchor](v42->_titleLabel, "firstBaselineAnchor");
    id v13 = -[TVNPBaseRoutingDestinationCollectionViewCell topAnchor](v42, "topAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 112.0);
    objc_msgSend(location, "addObject:");
  }

  -[UIImage size](v42->_artworkImage, "size");
  double v11 = v2;
  -[UIImage size](v42->_artworkImage, "size");
  else {
    double v10 = (double)1LL;
  }
  if (v42->_artworkImage && v11 / v10 >= 1.7)
  {
    id v9 = -[UIImageView widthAnchor](v42->_artworkImageView, "widthAnchor", v11 / v10);
    id v8 = -[UIImageView heightAnchor](v42->_artworkImageView, "heightAnchor");
    id v7 = objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", 1.77777778);
    objc_msgSend(location, "addObject:");
  }

  else
  {
    id v6 = -[UIImageView widthAnchor](v42->_artworkImageView, "widthAnchor");
    id v5 = -[UIImageView heightAnchor](v42->_artworkImageView, "heightAnchor");
    id v4 = objc_msgSend(v6, "constraintEqualToAnchor:");
    objc_msgSend(location, "addObject:");
  }

  if (([location isEqualToArray:v42->_volatileContraints] & 1) == 0)
  {
    +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  v42->_volatileContraints);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", location);
    objc_storeStrong((id *)&v42->_volatileContraints, location);
  }

  objc_storeStrong(&location, 0LL);
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver  = self;
  v9.super_class  = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  -[TVNPBaseRoutingDestinationCollectionViewCell setHighlighted:](&v9, "setHighlighted:", a3);
  double v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_13114;
  id v7 = &unk_50B50;
  id v8 = v12;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  32LL,  0.12,  0.0);
  objc_storeStrong((id *)&v8, 0LL);
}

- (void)applyLayoutAttributes:(id)a3
{
  BOOL v10 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  v8.receiver  = v10;
  v8.super_class  = (Class)&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell;
  -[TVNPBaseRoutingDestinationCollectionViewCell applyLayoutAttributes:](&v8, "applyLayoutAttributes:", location[0]);
  char v7 = 1;
  id v6 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutAttributes);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0) {
    char v7 = [location[0] isEnabled] & 1;
  }
  v10->_enabled  = v7 & 1;
  id v4 = -[TVNPBaseRoutingDestinationCollectionViewCell _controlStateForCell](v10, "_controlStateForCell", v10);
  objc_msgSend(v5, "_configureAppearanceForControlState:withAnimationCoordinator:", v4);
  objc_storeStrong(location, 0LL);
}

- (void)setTitleText:(id)a3
{
  objc_super v8 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = -[NSString length](v8->_titleText, "length") != 0;
  BOOL v5 = [location[0] length] != 0;
  uint64_t v3 = (NSString *)[location[0] copy];
  titleText  = v8->_titleText;
  v8->_titleText  = v3;

  -[UILabel setText:](v8->_titleLabel, "setText:", v8->_titleText);
  if (v6 != v5)
  {
    -[TVNPBaseRoutingDestinationCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v8,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVNPBaseRoutingDestinationCollectionViewCell _controlStateForCell](v8, "_controlStateForCell"),  0LL);
    -[TVNPBaseRoutingDestinationCollectionViewCell setNeedsUpdateConstraints](v8, "setNeedsUpdateConstraints");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setSubtitleText:(id)a3
{
  objc_super v8 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = -[NSString length](v8->_subtitleText, "length") != 0;
  BOOL v5 = [location[0] length] != 0;
  uint64_t v3 = (NSString *)[location[0] copy];
  subtitleText  = v8->_subtitleText;
  v8->_subtitleText  = v3;

  -[UILabel setText:](v8->_subtitleLabel, "setText:", v8->_subtitleText);
  if (v6 != v5)
  {
    -[TVNPBaseRoutingDestinationCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v8,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVNPBaseRoutingDestinationCollectionViewCell _controlStateForCell](v8, "_controlStateForCell"),  0LL);
    -[TVNPBaseRoutingDestinationCollectionViewCell setNeedsUpdateConstraints](v8, "setNeedsUpdateConstraints");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setArtworkImage:(id)a3
{
  id v4 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_artworkImage != location[0])
  {
    objc_storeStrong((id *)&v4->_artworkImage, location[0]);
    if (!v4->_showDeviceImage)
    {
      -[UIImageView setImage:](v4->_artworkImageView, "setImage:", location[0]);
      -[TVNPBaseRoutingDestinationCollectionViewCell setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDeviceImage:(id)a3
{
  id v4 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_deviceImage != location[0])
  {
    objc_storeStrong((id *)&v4->_deviceImage, location[0]);
    if ([location[0] isSymbolImage])
    {
      -[UIImageView setImage:](v4->_symbolImageView, "setImage:", location[0]);
      -[UIImageView setImage:](v4->_deviceImageView, "setImage:", 0LL);
    }

    else
    {
      -[UIImageView setImage:](v4->_deviceImageView, "setImage:", location[0]);
      -[UIImageView setImage:](v4->_symbolImageView, "setImage:", 0LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDeviceType:(unint64_t)a3
{
  if (self->_deviceType != a3)
  {
    self->_deviceType  = a3;
    -[TVNPBaseRoutingDestinationCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVNPBaseRoutingDestinationCollectionViewCell _controlStateForCell](self, "_controlStateForCell"),  0LL);
  }

- (void)setShowDeviceImage:(BOOL)a3
{
  if (a3 != self->_showDeviceImage)
  {
    self->_showDeviceImage  = a3;
    if (a3)
    {
      -[UIImageView setImage:](self->_artworkImageView, "setImage:", 0LL);
      -[UIImageView setHidden:](self->_deviceImageView, "setHidden:", 0LL);
      -[UIImageView setHidden:](self->_symbolImageView, "setHidden:", 0LL);
      -[UIView setHidden:](self->_shadowView, "setHidden:", 1LL);
    }

    else
    {
      -[UIImageView setImage:](self->_artworkImageView, "setImage:", self->_artworkImage);
      -[UIImageView setHidden:](self->_deviceImageView, "setHidden:", 1LL);
      -[UIImageView setHidden:](self->_symbolImageView, "setHidden:", 1LL);
      -[UIView setHidden:](self->_shadowView, "setHidden:", 0LL);
    }

    -[TVNPBaseRoutingDestinationCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (void)setMusicBarState:(unint64_t)a3
{
  BOOL v4 = self->_musicBarState != 0;
  BOOL v3 = a3 != 0;
  self->_musicBarState  = a3;
  -[TVNPRoutingMusicBarsView setState:](self->_musicBarsView, "setState:", a3);
  if (v4 != v3) {
    -[TVNPBaseRoutingDestinationCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

+ (void)_configureFloatingContentViewAppearance
{
  BOOL v3 = (dispatch_once_t *)&unk_5EDC8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_50BD8);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0LL);
}

- (void)_addInitialConstraints
{
  v92  = self;
  v91[1]  = (id)a2;
  v91[0]  = -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v90  = 0LL;
  v89  = -[_UIFloatingContentView leadingAnchor](v92->_floatingContentView, "leadingAnchor");
  v88  = -[TVNPBaseRoutingDestinationCollectionViewCell leadingAnchor](v92, "leadingAnchor");
  v87  = objc_msgSend(v89, "constraintEqualToAnchor:");
  v93[0]  = v87;
  v86  = -[_UIFloatingContentView trailingAnchor](v92->_floatingContentView, "trailingAnchor");
  v85  = -[TVNPBaseRoutingDestinationCollectionViewCell trailingAnchor](v92, "trailingAnchor");
  v84  = objc_msgSend(v86, "constraintEqualToAnchor:");
  v93[1]  = v84;
  v83  = -[_UIFloatingContentView topAnchor](v92->_floatingContentView, "topAnchor");
  v82  = -[TVNPBaseRoutingDestinationCollectionViewCell topAnchor](v92, "topAnchor");
  v81  = objc_msgSend(v83, "constraintEqualToAnchor:");
  v93[2]  = v81;
  v80  = -[_UIFloatingContentView bottomAnchor](v92->_floatingContentView, "bottomAnchor");
  v79  = -[TVNPBaseRoutingDestinationCollectionViewCell bottomAnchor](v92, "bottomAnchor");
  v78  = objc_msgSend(v80, "constraintEqualToAnchor:");
  v93[3]  = v78;
  v77  = -[UIView leadingAnchor](v92->_backgroundColorView, "leadingAnchor");
  v76  = [v91[0] leadingAnchor];
  v75  = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v77, "constraintEqualToAnchor:");
  v93[4]  = v75;
  v74  = -[UIView trailingAnchor](v92->_backgroundColorView, "trailingAnchor");
  v73  = [v91[0] trailingAnchor];
  v72  = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v74, "constraintEqualToAnchor:");
  v93[5]  = v72;
  v71  = -[UIView topAnchor](v92->_backgroundColorView, "topAnchor");
  v70  = [v91[0] topAnchor];
  id v69 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v71, "constraintEqualToAnchor:");
  v93[6]  = v69;
  v68  = -[UIView bottomAnchor](v92->_backgroundColorView, "bottomAnchor");
  id v67 = [v91[0] bottomAnchor];
  id v66 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v68, "constraintEqualToAnchor:");
  v93[7]  = v66;
  v65  = -[UIView centerXAnchor](v92->_shadowView, "centerXAnchor");
  v64  = -[UIImageView centerXAnchor](v92->_artworkImageView, "centerXAnchor");
  v63  = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v65, "constraintEqualToAnchor:");
  v93[8]  = v63;
  v62  = -[UIView centerYAnchor](v92->_shadowView, "centerYAnchor");
  v61  = -[UIImageView centerYAnchor](v92->_artworkImageView, "centerYAnchor");
  v60  = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v62, "constraintEqualToAnchor:");
  v93[9]  = v60;
  v59  = -[UIView widthAnchor](v92->_shadowView, "widthAnchor");
  v58  = -[UIImageView widthAnchor](v92->_artworkImageView, "widthAnchor");
  id v57 = -[NSLayoutDimension constraintEqualToAnchor:](v59, "constraintEqualToAnchor:");
  v93[10]  = v57;
  id v56 = -[UIView heightAnchor](v92->_shadowView, "heightAnchor");
  v55  = -[UIImageView heightAnchor](v92->_artworkImageView, "heightAnchor");
  id v54 = -[NSLayoutDimension constraintEqualToAnchor:](v56, "constraintEqualToAnchor:");
  v93[11]  = v54;
  v53  = -[UIImageView leadingAnchor](v92->_artworkImageView, "leadingAnchor");
  v52  = [v91[0] leadingAnchor];
  v51  = objc_msgSend(v53, "constraintEqualToAnchor:constant:");
  v93[12]  = v51;
  v50  = -[UIImageView topAnchor](v92->_artworkImageView, "topAnchor");
  v49  = [v91[0] topAnchor];
  v48  = objc_msgSend(v50, "constraintEqualToAnchor:constant:", 20.0);
  v93[13]  = v48;
  v47  = -[UIImageView bottomAnchor](v92->_artworkImageView, "bottomAnchor");
  v46  = [v91[0] bottomAnchor];
  v45  = objc_msgSend(v47, "constraintEqualToAnchor:constant:");
  v93[14]  = v45;
  v44  = -[UIImageView heightAnchor](v92->_artworkImageView, "heightAnchor");
  v43  = objc_msgSend(v44, "constraintEqualToConstant:");
  v93[15]  = v43;
  v42  = -[UIImageView centerXAnchor](v92->_deviceImageView, "centerXAnchor");
  id v41 = -[UIImageView centerXAnchor](v92->_artworkImageView, "centerXAnchor");
  id v40 = objc_msgSend(v42, "constraintEqualToAnchor:");
  v93[16]  = v40;
  v39  = -[UIImageView centerYAnchor](v92->_deviceImageView, "centerYAnchor");
  id v38 = -[UIImageView centerYAnchor](v92->_artworkImageView, "centerYAnchor");
  id v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
  v93[17]  = v37;
  v36  = -[UIImageView widthAnchor](v92->_deviceImageView, "widthAnchor");
  sub_122E4();
  id v35 = [v36 constraintEqualToConstant:v2];
  v93[18]  = v35;
  id v34 = -[UIImageView heightAnchor](v92->_deviceImageView, "heightAnchor");
  sub_122E4();
  id v33 = [v34 constraintEqualToConstant:v3];
  v93[19]  = v33;
  id v32 = -[UIImageView centerXAnchor](v92->_symbolImageView, "centerXAnchor");
  id v31 = -[UIImageView centerXAnchor](v92->_artworkImageView, "centerXAnchor");
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v93[20]  = v30;
  id v29 = -[UIImageView centerYAnchor](v92->_symbolImageView, "centerYAnchor");
  id v28 = -[UIImageView centerYAnchor](v92->_artworkImageView, "centerYAnchor");
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v93[21]  = v27;
  id v26 = -[UILabel leadingAnchor](v92->_titleLabel, "leadingAnchor");
  id v25 = -[UIImageView trailingAnchor](v92->_artworkImageView, "trailingAnchor");
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:constant:");
  v93[22]  = v24;
  id v23 = -[UILabel trailingAnchor](v92->_titleLabel, "trailingAnchor");
  id v22 = [v91[0] trailingAnchor];
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", -20.0);
  v93[23]  = v21;
  id v20 = -[UILabel leadingAnchor](v92->_subtitleLabel, "leadingAnchor");
  id v19 = -[UIImageView trailingAnchor](v92->_artworkImageView, "trailingAnchor");
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 27.0);
  v93[24]  = v18;
  id v17 = -[UILabel trailingAnchor](v92->_subtitleLabel, "trailingAnchor");
  id v16 = [v91[0] trailingAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", -20.0);
  v93[25]  = v15;
  id v14 = -[TVNPRoutingMusicBarsView leadingAnchor](v92->_musicBarsView, "leadingAnchor");
  id v13 = -[UIImageView trailingAnchor](v92->_artworkImageView, "trailingAnchor");
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 30.0);
  v93[26]  = v12;
  id v11 = -[TVNPRoutingMusicBarsView widthAnchor](v92->_musicBarsView, "widthAnchor");
  sub_122E4();
  id v10 = [v11 constraintEqualToConstant:v4];
  v93[27]  = v10;
  id v9 = -[TVNPRoutingMusicBarsView heightAnchor](v92->_musicBarsView, "heightAnchor");
  sub_122E4();
  id v8 = [v9 constraintEqualToConstant:v5];
  v93[28]  = v8;
  BOOL v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 29LL);
  id v7 = v90;
  v90  = v6;

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v90);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(v91, 0LL);
}

- (unint64_t)_controlStateForCell
{
  uint64_t v2 = 0LL;
  if (self->_isFocused) {
    uint64_t v2 = 8LL;
  }
  uint64_t v8 = v2;
  unsigned __int8 v3 = -[TVNPBaseRoutingDestinationCollectionViewCell isEnabled](self, "isEnabled");
  uint64_t v4 = 0LL;
  if ((v3 & 1) == 0) {
    uint64_t v4 = 2LL;
  }
  uint64_t v9 = v8 | v4;
  unsigned __int8 v5 = -[TVNPBaseRoutingDestinationCollectionViewCell isSelected](self, "isSelected");
  uint64_t v6 = 0LL;
  if ((v5 & 1) != 0) {
    uint64_t v6 = 4LL;
  }
  return v9 | v6 | ((-[TVNPBaseRoutingDestinationCollectionViewCell isHighlighted]( self,  "isHighlighted") & 1) != 0);
}

- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v25 = self;
  SEL v24 = a2;
  unint64_t v23 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v27 = (dispatch_once_t *)&unk_5EE10;
  id v26 = 0LL;
  objc_storeStrong(&v26, &stru_50BF8);
  if (*v27 != -1) {
    dispatch_once(v27, v26);
  }
  objc_storeStrong(&v26, 0LL);
  BOOL v21 = (v23 & 8) != 0;
  BOOL v20 = (v23 & 2) != 0;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_15084;
  id v15 = &unk_50C20;
  id v16 = v25;
  BOOL v17 = v20;
  BOOL v18 = v21;
  id v19 = objc_retainBlock(&v11);
  if (location)
  {
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v25->_floatingContentView,  "setControlState:withAnimationCoordinator:",  v23,  location);
    [location addCoordinatedAnimations:v19 completion:0];
  }

  else
  {
    -[_UIFloatingContentView setControlState:animated:]( v25->_floatingContentView,  "setControlState:animated:",  v23,  0LL);
    (*((void (**)(void))v19 + 2))();
  }

  char v9 = 0;
  BOOL v6 = 0;
  if (v21)
  {
    id v10 = -[UILabel text](v25->_titleLabel, "text");
    char v9 = 1;
    BOOL v6 = -[NSString length](v10, "length") != 0;
  }

  if ((v9 & 1) != 0) {

  }
  -[UILabel setMarqueeEnabled:](v25->_titleLabel, "setMarqueeEnabled:", v6);
  -[UILabel setMarqueeRunning:](v25->_titleLabel, "setMarqueeRunning:", v6);
  char v7 = 0;
  BOOL v5 = 0;
  if (v21)
  {
    uint64_t v8 = -[UILabel text](v25->_subtitleLabel, "text");
    char v7 = 1;
    BOOL v5 = -[NSString length](v8, "length") != 0;
  }

  if ((v7 & 1) != 0) {

  }
  -[UILabel setMarqueeEnabled:]( v25->_subtitleLabel,  "setMarqueeEnabled:",  v5,  &selRef_sortDescriptorWithKey_ascending_selector_);
  [*(id *)((char *)&v25->super.super.super.super.super.isa + *(int *)(v4 + 2468)) setMarqueeRunning:v5];
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (BOOL)showDeviceImage
{
  return self->_showDeviceImage;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)musicBarState
{
  return self->_musicBarState;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSMutableArray)volatileContraints
{
  return self->_volatileContraints;
}

- (TVNPRoutingMusicBarsView)musicBarsView
{
  return self->_musicBarsView;
}

- (CGRect)boundsUsedForArtworkShadow
{
  y  = self->_boundsUsedForArtworkShadow.origin.y;
  x  = self->_boundsUsedForArtworkShadow.origin.x;
  height  = self->_boundsUsedForArtworkShadow.size.height;
  width  = self->_boundsUsedForArtworkShadow.size.width;
  result.size.height  = height;
  result.size.width  = width;
  result.origin.y  = y;
  result.origin.x  = x;
  return result;
}

- (void)setBoundsUsedForArtworkShadow:(CGRect)a3
{
  self->_boundsUsedForArtworkShadow  = a3;
}

- (void).cxx_destruct
{
}

@end