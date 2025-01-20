@interface TVNPRoutesHeaderView
- (NSString)title;
- (TVNPRoutesHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)headerLabel;
- (void)setHeaderLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVNPRoutesHeaderView

- (TVNPRoutesHeaderView)initWithFrame:(CGRect)a3
{
  CGRect v31 = a3;
  SEL v29 = a2;
  v30 = 0LL;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVNPRoutesHeaderView;
  v30 = -[TVNPRoutesHeaderView initWithFrame:]( &v28,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v30, v30);
  if (v30)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    headerLabel = v30->_headerLabel;
    v30->_headerLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v30->_headerLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v7 = v30->_headerLabel;
    v8 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UILabel setTextColor:](v7, "setTextColor:");

    -[UILabel setNumberOfLines:](v30->_headerLabel, "setNumberOfLines:", 0LL);
    v9 = v30->_headerLabel;
    id v10 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleBody,  1024LL);
    -[UILabel setFont:](v9, "setFont:");

    -[TVNPRoutesHeaderView addSubview:](v30, "addSubview:", v30->_headerLabel);
    v27 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v11 = v27;
    id v14 = -[UILabel leadingAnchor](v30->_headerLabel, "leadingAnchor");
    id v13 = -[TVNPRoutesHeaderView leadingAnchor](v30, "leadingAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v11, "addObject:");

    v15 = v27;
    id v18 = -[UILabel trailingAnchor](v30->_headerLabel, "trailingAnchor");
    id v17 = -[TVNPRoutesHeaderView trailingAnchor](v30, "trailingAnchor");
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v15, "addObject:");

    v19 = v27;
    id v22 = -[UILabel topAnchor](v30->_headerLabel, "topAnchor");
    id v21 = -[TVNPRoutesHeaderView topAnchor](v30, "topAnchor");
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", 30.0);
    -[NSMutableArray addObject:](v19, "addObject:");

    v23 = v27;
    id v26 = -[UILabel bottomAnchor](v30->_headerLabel, "bottomAnchor");
    id v25 = -[TVNPRoutesHeaderView bottomAnchor](v30, "bottomAnchor");
    id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v23, "addObject:");

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v27);
    objc_storeStrong((id *)&v27, 0LL);
  }

  v6 = v30;
  objc_storeStrong((id *)&v30, 0LL);
  return v6;
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