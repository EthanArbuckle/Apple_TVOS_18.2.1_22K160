@interface TVSMHomeHeaderView
- (NSString)title;
- (TVSMHomeHeaderView)initWithFrame:(CGRect)a3;
- (UIImageView)symbolImageView;
- (UILabel)titleLabel;
- (UIView)separatorView;
- (void)_updateEffect;
- (void)setSeparatorView:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVSMHomeHeaderView

- (TVSMHomeHeaderView)initWithFrame:(CGRect)a3
{
  CGRect v68 = a3;
  SEL v66 = a2;
  v67 = 0LL;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___TVSMHomeHeaderView;
  v63 = -[TVSMHomeHeaderView initWithFrame:]( &v65,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v67 = v63;
  objc_storeStrong((id *)&v67, v63);
  if (v63)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    symbolImageView = v67->_symbolImageView;
    v67->_symbolImageView = v3;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v67->_symbolImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v13 = v67->_symbolImageView;
    v15 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCallout);
    v14 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    -[UIImageView setPreferredSymbolConfiguration:](v13, "setPreferredSymbolConfiguration:");

    v16 = v67->_symbolImageView;
    id v17 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homekit");
    -[UIImageView setImage:](v16, "setImage:");

    -[TVSMHomeHeaderView addSubview:](v67, "addSubview:", v67->_symbolImageView);
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v67->_titleLabel;
    v67->_titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v67->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setNumberOfLines:](v67->_titleLabel, "setNumberOfLines:");
    -[UILabel setText:](v67->_titleLabel, "setText:", @"HomeKit");
    v18 = v67->_titleLabel;
    id v19 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle3,  1024LL);
    -[UILabel setFont:](v18, "setFont:");

    -[TVSMHomeHeaderView addSubview:](v67, "addSubview:", v67->_titleLabel);
    v7 = objc_alloc_init(&OBJC_CLASS___UIView);
    separatorView = v67->_separatorView;
    v67->_separatorView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v67->_separatorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSMHomeHeaderView addSubview:](v67, "addSubview:", v67->_separatorView);
    v64 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v20 = v64;
    id v23 = -[UIImageView trailingAnchor](v67->_symbolImageView, "trailingAnchor");
    id v22 = -[TVSMHomeHeaderView trailingAnchor](v67, "trailingAnchor");
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v20, "addObject:");

    v24 = v64;
    id v27 = -[UIImageView centerYAnchor](v67->_symbolImageView, "centerYAnchor");
    id v26 = -[UILabel centerYAnchor](v67->_titleLabel, "centerYAnchor");
    id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v24, "addObject:");

    v28 = v64;
    id v31 = -[UIImageView centerXAnchor](v67->_symbolImageView, "centerXAnchor");
    id v30 = -[UILabel trailingAnchor](v67->_titleLabel, "trailingAnchor");
    id v29 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", 30.0);
    -[NSMutableArray addObject:](v28, "addObject:");

    v32 = v64;
    id v35 = -[UILabel leadingAnchor](v67->_titleLabel, "leadingAnchor");
    id v34 = -[TVSMHomeHeaderView leadingAnchor](v67, "leadingAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v32, "addObject:");

    v36 = v64;
    id v39 = -[UILabel firstBaselineAnchor](v67->_titleLabel, "firstBaselineAnchor");
    id v38 = -[TVSMHomeHeaderView topAnchor](v67, "topAnchor");
    id v37 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", 72.0);
    -[NSMutableArray addObject:](v36, "addObject:");

    v40 = v64;
    v43 = -[UIView topAnchor](v67->_separatorView, "topAnchor");
    id v42 = -[UILabel lastBaselineAnchor](v67->_titleLabel, "lastBaselineAnchor");
    id v41 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:constant:](v43, "constraintEqualToAnchor:constant:", 38.0);
    -[NSMutableArray addObject:](v40, "addObject:");

    v44 = v64;
    v47 = -[UIView leadingAnchor](v67->_separatorView, "leadingAnchor");
    id v46 = -[TVSMHomeHeaderView leadingAnchor](v67, "leadingAnchor");
    id v45 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v47, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v44, "addObject:");

    v48 = v64;
    v51 = -[UIView trailingAnchor](v67->_separatorView, "trailingAnchor");
    id v50 = -[TVSMHomeHeaderView trailingAnchor](v67, "trailingAnchor");
    id v49 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v51, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v48, "addObject:");

    v52 = v64;
    v55 = -[UIView bottomAnchor](v67->_separatorView, "bottomAnchor");
    id v54 = -[TVSMHomeHeaderView bottomAnchor](v67, "bottomAnchor");
    id v53 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v55, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v52, "addObject:");

    v56 = v64;
    v59 = -[UIView heightAnchor](v67->_separatorView, "heightAnchor");
    v58 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
    -[UIScreen scale](v58, "scale");
    v57 = -[NSLayoutDimension constraintEqualToConstant:](v59, "constraintEqualToConstant:", 1.0 / v9);
    -[NSMutableArray addObject:](v56, "addObject:");

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v64);
    id v60 = -[TVSMHomeHeaderView layer](v67, "layer");
    [v60 setAllowsGroupBlending:0];

    -[TVSMHomeHeaderView _updateEffect](v67, "_updateEffect");
    v61 = v67;
    uint64_t v69 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v62 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL);
    id v10 = -[TVSMHomeHeaderView registerForTraitChanges:withAction:](v61, "registerForTraitChanges:withAction:");

    objc_storeStrong((id *)&v64, 0LL);
  }

  v12 = v67;
  objc_storeStrong((id *)&v67, 0LL);
  return v12;
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

- (void)_updateEffect
{
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = 0LL;
  v18 = 0LL;
  *(_DWORD *)&v17[8] = 0;
  id v16 = -[TVSMHomeHeaderView traitCollection](self, "traitCollection");
  *(void *)id v17 = [v16 userInterfaceStyle] != (char *)&dword_0 + 2;

  if ((v17[0] & 1) != 0)
  {
    v8 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD);
    id v9 = v19[0];
    v19[0] = v8;

    id v10 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.501960784);
    v11 = v18;
    v18 = v10;

    v6 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.796078431, 1.0);
  }

  else
  {
    v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
    id v3 = v19[0];
    v19[0] = v2;

    v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.48627451);
    v5 = v18;
    v18 = v4;

    v6 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.164705882, 1.0);
  }

  v7 = *(void **)&v17[4];
  *(void *)&v17[4] = v6;

  -[UILabel setTextColor:](v20->_titleLabel, "setTextColor:", v18, &selRef_delegate);
  id v13 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v20->super.super.super.isa
                                                              + *(int *)(v12 + 2376)), "layer"));
  [v13 setCompositingFilter:v19[0]];

  -[UIImageView setTintColor:](v20->_symbolImageView, "setTintColor:", v18);
  id v14 = -[UIImageView layer](v20->_symbolImageView, "layer");
  [v14 setCompositingFilter:v19[0]];

  -[UIView setBackgroundColor:](v20->_separatorView, "setBackgroundColor:", *(void *)&v17[4]);
  v15 = -[UIView layer](v20->_separatorView, "layer");
  -[CALayer setCompositingFilter:](v15, "setCompositingFilter:", v19[0]);

  objc_storeStrong((id *)&v17[4], 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(v19, 0LL);
}

- (NSString)title
{
  return self->_title;
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end