@interface TVSMAirPodsModuleHeaderView
- (BOOL)configureForAtmos;
- (NSArray)atmosConstraints;
- (NSArray)regularConstraints;
- (NSString)detailText;
- (NSString)title;
- (TVSMAirPodsModuleHeaderView)initWithFrame:(CGRect)a3;
- (UIImageView)atmosImageView;
- (UILabel)detailsLabel;
- (UILabel)titleLabel;
- (void)setAtmosConstraints:(id)a3;
- (void)setAtmosImageView:(id)a3;
- (void)setConfigureForAtmos:(BOOL)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailsLabel:(id)a3;
- (void)setRegularConstraints:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVSMAirPodsModuleHeaderView

- (TVSMAirPodsModuleHeaderView)initWithFrame:(CGRect)a3
{
  CGRect v78 = a3;
  SEL v76 = a2;
  v77 = 0LL;
  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeaderView;
  v77 = -[TVSMAirPodsModuleHeaderView initWithFrame:]( &v75,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v77, v77);
  if (v77)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v77->_titleLabel;
    v77->_titleLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v77->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v15 = v77->_titleLabel;
    v16 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UILabel setTextColor:](v15, "setTextColor:");

    -[UILabel setNumberOfLines:](v77->_titleLabel, "setNumberOfLines:");
    v17 = v77->_titleLabel;
    id v18 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleBody,  1024LL);
    -[UILabel setFont:](v17, "setFont:");

    -[TVSMAirPodsModuleHeaderView addSubview:](v77, "addSubview:", v77->_titleLabel);
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    detailsLabel = v77->_detailsLabel;
    v77->_detailsLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v77->_detailsLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v19 = v77->_detailsLabel;
    id v22 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    v21 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    id v20 = objc_msgSend(v22, "resolvedColorWithTraitCollection:");
    -[UILabel setTextColor:](v19, "setTextColor:");

    -[UILabel setNumberOfLines:](v77->_detailsLabel, "setNumberOfLines:", 0LL);
    v23 = v77->_detailsLabel;
    v24 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    -[UILabel setFont:](v23, "setFont:");

    -[TVSMAirPodsModuleHeaderView addSubview:](v77, "addSubview:", v77->_detailsLabel);
    v25 = objc_alloc(&OBJC_CLASS___UIImageView);
    v27 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v77));
    id v26 =  +[UIImage imageNamed:inBundle:withConfiguration:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:withConfiguration:",  @"DolbyAtmos");
    v7 = -[UIImageView initWithImage:](v25, "initWithImage:");
    atmosImageView = v77->_atmosImageView;
    v77->_atmosImageView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v77->_atmosImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v28 = v77->_atmosImageView;
    id v31 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    v30 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    id v29 = objc_msgSend(v31, "resolvedColorWithTraitCollection:");
    -[UIImageView setTintColor:](v28, "setTintColor:");

    -[UIImageView setAlpha:](v77->_atmosImageView, "setAlpha:", 0.0);
    -[TVSMAirPodsModuleHeaderView addSubview:](v77, "addSubview:", v77->_atmosImageView);
    v74 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v32 = v74;
    id v35 = -[UILabel leadingAnchor](v77->_titleLabel, "leadingAnchor");
    id v34 = -[TVSMAirPodsModuleHeaderView leadingAnchor](v77, "leadingAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v32, "addObject:");

    v36 = v74;
    id v39 = -[UILabel firstBaselineAnchor](v77->_titleLabel, "firstBaselineAnchor");
    id v38 = -[TVSMAirPodsModuleHeaderView topAnchor](v77, "topAnchor");
    id v37 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", 66.0);
    -[NSMutableArray addObject:](v36, "addObject:");

    v40 = v74;
    id v43 = -[UILabel firstBaselineAnchor](v77->_titleLabel, "firstBaselineAnchor");
    id v42 = -[TVSMAirPodsModuleHeaderView bottomAnchor](v77, "bottomAnchor");
    id v41 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", -8.0);
    -[NSMutableArray addObject:](v40, "addObject:");

    v44 = v74;
    id v47 = -[UILabel leadingAnchor](v77->_detailsLabel, "leadingAnchor");
    id v46 = -[UILabel trailingAnchor](v77->_titleLabel, "trailingAnchor");
    id v45 = objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", 40.0);
    -[NSMutableArray addObject:](v44, "addObject:");

    v48 = v74;
    id v51 = -[UILabel firstBaselineAnchor](v77->_detailsLabel, "firstBaselineAnchor");
    id v50 = -[UILabel firstBaselineAnchor](v77->_titleLabel, "firstBaselineAnchor");
    id v49 = objc_msgSend(v51, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v48, "addObject:");

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v74);
    v73 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v52 = v73;
    id v55 = -[UIImageView leadingAnchor](v77->_atmosImageView, "leadingAnchor");
    id v54 = -[UILabel trailingAnchor](v77->_detailsLabel, "trailingAnchor");
    id v53 = objc_msgSend(v55, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v52, "addObject:");

    v56 = v73;
    id v59 = -[UIImageView trailingAnchor](v77->_atmosImageView, "trailingAnchor");
    id v58 = -[TVSMAirPodsModuleHeaderView trailingAnchor](v77, "trailingAnchor");
    id v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v56, "addObject:");

    v60 = v73;
    id v63 = -[UIImageView bottomAnchor](v77->_atmosImageView, "bottomAnchor");
    id v62 = -[UILabel firstBaselineAnchor](v77->_detailsLabel, "firstBaselineAnchor");
    id v61 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", 6.0);
    -[NSMutableArray addObject:](v60, "addObject:");

    v64 = v73;
    id v66 = -[UIImageView widthAnchor](v77->_atmosImageView, "widthAnchor");
    id v65 = [v66 constraintEqualToConstant:166.0];
    -[NSMutableArray addObject:](v64, "addObject:");

    v67 = v73;
    id v69 = -[UIImageView heightAnchor](v77->_atmosImageView, "heightAnchor");
    id v68 = [v69 constraintEqualToConstant:24.0];
    -[NSMutableArray addObject:](v67, "addObject:");

    v9 = (NSArray *)-[NSMutableArray copy](v73, "copy");
    atmosConstraints = v77->_atmosConstraints;
    v77->_atmosConstraints = v9;

    id v72 = -[UILabel trailingAnchor](v77->_detailsLabel, "trailingAnchor");
    id v71 = -[TVSMAirPodsModuleHeaderView trailingAnchor](v77, "trailingAnchor");
    id v70 = objc_msgSend(v72, "constraintEqualToAnchor:");
    id v79 = v70;
    v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v79, 1LL);
    regularConstraints = v77->_regularConstraints;
    v77->_regularConstraints = v11;

    +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  v77->_regularConstraints);
    objc_storeStrong((id *)&v73, 0LL);
    objc_storeStrong((id *)&v74, 0LL);
  }

  v14 = v77;
  objc_storeStrong((id *)&v77, 0LL);
  return v14;
}

- (void)setTitle:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_title, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_title, location[0]);
    -[UILabel setText:](v4->_titleLabel, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDetailText:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_detailText, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_detailText, location[0]);
    -[UILabel setText:](v4->_detailsLabel, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setConfigureForAtmos:(BOOL)a3
{
  if (self->_configureForAtmos != a3)
  {
    self->_configureForAtmos = a3;
    if (self->_configureForAtmos)
    {
      +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_atmosConstraints);
      +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_regularConstraints);
      -[UIImageView setAlpha:](self->_atmosImageView, "setAlpha:", 1.0);
    }

    else
    {
      +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_regularConstraints);
      +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_atmosConstraints);
      -[UIImageView setAlpha:](self->_atmosImageView, "setAlpha:", 0.0);
    }
  }

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)configureForAtmos
{
  return self->_configureForAtmos;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
}

- (UIImageView)atmosImageView
{
  return self->_atmosImageView;
}

- (void)setAtmosImageView:(id)a3
{
}

- (NSArray)atmosConstraints
{
  return self->_atmosConstraints;
}

- (void)setAtmosConstraints:(id)a3
{
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end