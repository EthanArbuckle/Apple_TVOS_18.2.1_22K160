@interface TVSettingsPhotoCollectionViewHeader
- (NSString)subtitle;
- (NSString)title;
- (TVSettingsPhotoCollectionViewHeader)initWithFrame:(CGRect)a3;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVSettingsPhotoCollectionViewHeader

- (TVSettingsPhotoCollectionViewHeader)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionViewHeader;
  v3 = -[TVSettingsPhotoCollectionViewHeader initWithFrame:]( &v30,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setOpaque:](v3->_titleLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", 0LL);
    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = v3->_titleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
    if (qword_1001E1B28 != -1) {
      dispatch_once(&qword_1001E1B28, &stru_100193B50);
    }
    id v11 = [v10 userInterfaceStyle];
    BOOL v12 = v11 == (id)2 || v11 == (id)1000;
    v13 = &qword_1001E1B20;
    if (!v12) {
      v13 = &qword_1001E1B18;
    }
    id v14 = (id)*v13;

    -[UILabel setTextColor:](v8, "setTextColor:", v14);
    -[TVSettingsPhotoCollectionViewHeader addSubview:](v3, "addSubview:", v3->_titleLabel);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_titleLabel,  3LL,  0LL,  v3,  3LL,  1.0,  42.0));
    [v15 setActive:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_titleLabel,  5LL,  0LL,  v3,  5LL,  1.0,  0.0));

    [v16 setActive:1];
    v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setOpaque:](v3->_subtitleLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v3->_subtitleLabel, "setBackgroundColor:", 0LL);
    v19 = v3->_subtitleLabel;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleFootnote));
    -[UILabel setFont:](v19, "setFont:", v20);

    v21 = v3->_subtitleLabel;
    if (qword_1001E1B40 != -1) {
      dispatch_once(&qword_1001E1B40, &stru_100193B70);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 traitCollection]);
    id v24 = [v23 userInterfaceStyle];

    BOOL v25 = v24 == (id)2 || v24 == (id)1000;
    v26 = &qword_1001E1B38;
    if (!v25) {
      v26 = &qword_1001E1B30;
    }
    -[UILabel setTextColor:](v21, "setTextColor:", *v26);
    -[TVSettingsPhotoCollectionViewHeader addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_subtitleLabel,  3LL,  0LL,  v3->_titleLabel,  4LL,  1.0,  0.0));

    [v27 setActive:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_subtitleLabel,  5LL,  0LL,  v3,  5LL,  1.0,  0.0));

    [v28 setActive:1];
  }

  return v3;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
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

- (void).cxx_destruct
{
}

@end