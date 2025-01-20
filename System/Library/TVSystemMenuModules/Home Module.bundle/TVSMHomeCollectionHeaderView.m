@interface TVSMHomeCollectionHeaderView
- (NSString)title;
- (TVSMHomeCollectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)headerLabel;
- (void)_updateEffect;
- (void)setHeaderLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVSMHomeCollectionHeaderView

- (TVSMHomeCollectionHeaderView)initWithFrame:(CGRect)a3
{
  CGRect v33 = a3;
  SEL v31 = a2;
  v32 = 0LL;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVSMHomeCollectionHeaderView;
  v32 = -[TVSMHomeCollectionHeaderView initWithFrame:]( &v30,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v32, v32);
  if (v32)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    headerLabel = v32->_headerLabel;
    v32->_headerLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v32->_headerLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setNumberOfLines:](v32->_headerLabel, "setNumberOfLines:", 0LL);
    v8 = v32->_headerLabel;
    id v9 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleCaption2,  1024LL);
    -[UILabel setFont:](v8, "setFont:");

    -[TVSMHomeCollectionHeaderView addSubview:](v32, "addSubview:", v32->_headerLabel);
    v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v10 = v29;
    id v13 = -[UILabel leadingAnchor](v32->_headerLabel, "leadingAnchor");
    id v12 = -[TVSMHomeCollectionHeaderView leadingAnchor](v32, "leadingAnchor");
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v10, "addObject:");

    v14 = v29;
    id v17 = -[UILabel trailingAnchor](v32->_headerLabel, "trailingAnchor");
    id v16 = -[TVSMHomeCollectionHeaderView trailingAnchor](v32, "trailingAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v14, "addObject:");

    v18 = v29;
    id v21 = -[UILabel firstBaselineAnchor](v32->_headerLabel, "firstBaselineAnchor");
    id v20 = -[TVSMHomeCollectionHeaderView topAnchor](v32, "topAnchor");
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", 56.0);
    -[NSMutableArray addObject:](v18, "addObject:");

    v22 = v29;
    id v25 = -[TVSMHomeCollectionHeaderView bottomAnchor](v32, "bottomAnchor");
    id v24 = -[UILabel lastBaselineAnchor](v32->_headerLabel, "lastBaselineAnchor");
    id v23 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", 20.0);
    -[NSMutableArray addObject:](v22, "addObject:");

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);
    id v26 = -[TVSMHomeCollectionHeaderView layer](v32, "layer");
    [v26 setAllowsGroupBlending:0];

    -[TVSMHomeCollectionHeaderView _updateEffect](v32, "_updateEffect");
    v27 = v32;
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL);
    id v5 =  -[TVSMHomeCollectionHeaderView registerForTraitChanges:withAction:]( v27,  "registerForTraitChanges:withAction:");

    objc_storeStrong((id *)&v29, 0LL);
  }

  v7 = v32;
  objc_storeStrong((id *)&v32, 0LL);
  return v7;
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
    -[UILabel setText:](v4->_headerLabel, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateEffect
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = 0LL;
  *(_DWORD *)&v11[8] = 0;
  id v10 = -[TVSMHomeCollectionHeaderView traitCollection](self, "traitCollection");
  *(void *)id v11 = [v10 userInterfaceStyle] != (char *)&dword_0 + 2;

  if ((v11[0] & 1) != 0)
  {
    v6 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD);
    id v7 = v12[0];
    v12[0] = v6;

    v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.501960784, 1.0);
  }

  else
  {
    v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
    id v3 = v12[0];
    v12[0] = v2;

    v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.48627451, 1.0);
  }

  id v5 = *(void **)&v11[4];
  *(void *)&v11[4] = v4;

  -[UILabel setTextColor:](v13->_headerLabel, "setTextColor:", *(void *)&v11[4], &selRef_delegate);
  id v9 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v13->super.super.super.super.isa
                                                             + *(int *)(v8 + 2400)), "layer"));
  [v9 setCompositingFilter:v12[0]];

  objc_storeStrong((id *)&v11[4], 0LL);
  objc_storeStrong(v12, 0LL);
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end