@interface TVSBVideoBulletinChinView
- (NSAttributedString)subtitle;
- (NSString)title;
- (TVSBVideoBulletinChinView)initWithFrame:(CGRect)a3;
- (TVSBVideoBulletinChinView)initWithStyle:(int64_t)a3;
- (UIImage)image;
- (UIImageView)faceImageView;
- (UIImageView)symbolImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (int64_t)style;
- (void)_updateCompositingEffects;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupConstraints;
- (void)setupFaceImageView;
- (void)setupSubtitleLabel;
- (void)setupSymbolImageView;
- (void)setupTitleLabel;
- (void)setupViews;
@end

@implementation TVSBVideoBulletinChinView

- (TVSBVideoBulletinChinView)initWithFrame:(CGRect)a3
{
  *(CGFloat *)&__int128 v7 = a3.origin.x;
  *((void *)&v7 + 1) = *(void *)&a3.origin.y;
  *(CGFloat *)&__int128 v8 = a3.size.width;
  *((void *)&v8 + 1) = *(void *)&a3.size.height;
  v6 = 0LL;
  v5 = -[TVSBVideoBulletinChinView initWithStyle:](self, "initWithStyle:", 0LL);
  v6 = v5;
  objc_storeStrong((id *)&v6, v5);
  if (v5) {
    -[TVSBVideoBulletinChinView setFrame:](v6, "setFrame:", v7, v8);
  }
  v4 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

- (TVSBVideoBulletinChinView)initWithStyle:(int64_t)a3
{
  SEL v12 = a2;
  int64_t v11 = a3;
  v13 = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinView;
  v13 = -[TVSBVideoBulletinChinView initWithFrame:]( &v10,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v13->_style = v11;
    v9.receiver = v13;
    v9.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinView;
    -[TVSBVideoBulletinChinView setUserInteractionEnabled:](&v9, "setUserInteractionEnabled:", 0LL);
    -[TVSBVideoBulletinChinView setupViews](v13, "setupViews");
    -[TVSBVideoBulletinChinView setupConstraints](v13, "setupConstraints");
    id v6 = -[TVSBVideoBulletinChinView layer](v13, "layer");
    [v6 setAllowsGroupBlending:0];

    -[TVSBVideoBulletinChinView _updateCompositingEffects](v13, "_updateCompositingEffects");
    __int128 v7 = v13;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    __int128 v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL);
    id v3 = -[TVSBVideoBulletinChinView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:");
  }

  v5 = v13;
  objc_storeStrong((id *)&v13, 0LL);
  return v5;
}

- (void)setupViews
{
}

- (void)setupFaceImageView
{
  v2 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  faceImageView = self->_faceImageView;
  self->_faceImageView = v2;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_faceImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIImageView setContentMode:](self->_faceImageView, "setContentMode:", 2LL);
  -[UIImageView setClipsToBounds:](self->_faceImageView, "setClipsToBounds:", 1LL);
  -[UIImageView _setCornerRadius:](self->_faceImageView, "_setCornerRadius:", 52.0 / 2.0);
  LODWORD(v4) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_faceImageView, "setContentHuggingPriority:forAxis:", 0LL, v4);
  -[TVSBVideoBulletinChinView addSubview:](self, "addSubview:", self->_faceImageView);
}

- (void)setupSymbolImageView
{
  v2 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  symbolImageView = self->_symbolImageView;
  self->_symbolImageView = v2;

  v5 = self->_symbolImageView;
  __int128 v7 = +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 40.0);
  id v6 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
  -[UIImageView setPreferredSymbolConfiguration:](v5, "setPreferredSymbolConfiguration:");

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_symbolImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v4) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:]( self->_symbolImageView,  "setContentHuggingPriority:forAxis:",  0LL,  v4);
  -[TVSBVideoBulletinChinView addSubview:](self, "addSubview:", self->_symbolImageView);
}

- (void)setupTitleLabel
{
  id v6 = self;
  v5[1] = (id)a2;
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  titleLabel = v6->_titleLabel;
  v6->_titleLabel = v2;

  -[UILabel setNumberOfLines:](v6->_titleLabel, "setNumberOfLines:", 1LL);
  -[UILabel setMarqueeEnabled:](v6->_titleLabel, "setMarqueeEnabled:", 1LL);
  -[UILabel setMarqueeRunning:](v6->_titleLabel, "setMarqueeRunning:", 1LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v6->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  double v4 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
  v5[0] = -[UIFont tvsb_fontWithWeight:](v4, "tvsb_fontWithWeight:", UIFontWeightBold);

  -[UILabel setFont:](v6->_titleLabel, "setFont:", v5[0]);
  -[TVSBVideoBulletinChinView addSubview:](v6, "addSubview:", v6->_titleLabel);
  objc_storeStrong(v5, 0LL);
}

- (void)setupSubtitleLabel
{
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v2;

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSBVideoBulletinChinView addSubview:](self, "addSubview:", self->_subtitleLabel);
}

- (void)setupConstraints
{
  id v39 = -[UIImageView centerYAnchor](self->_symbolImageView, "centerYAnchor");
  id v38 = -[TVSBVideoBulletinChinView centerYAnchor](self, "centerYAnchor");
  id v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
  v41[0] = v37;
  id v36 = -[UIImageView centerYAnchor](self->_faceImageView, "centerYAnchor");
  id v35 = -[TVSBVideoBulletinChinView centerYAnchor](self, "centerYAnchor");
  id v34 = objc_msgSend(v36, "constraintEqualToAnchor:");
  v41[1] = v34;
  id v33 = -[UIImageView leadingAnchor](self->_faceImageView, "leadingAnchor");
  id v32 = -[TVSBVideoBulletinChinView leadingAnchor](self, "leadingAnchor");
  id v31 = objc_msgSend(v33, "constraintEqualToAnchor:constant:");
  v41[2] = v31;
  id v30 = -[UIImageView widthAnchor](self->_faceImageView, "widthAnchor");
  id v29 = objc_msgSend(v30, "constraintEqualToConstant:");
  v41[3] = v29;
  id v28 = -[UIImageView heightAnchor](self->_faceImageView, "heightAnchor");
  id v27 = [v28 constraintEqualToConstant:52.0];
  v41[4] = v27;
  id v26 = -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  id v25 = -[UIImageView centerXAnchor](self->_symbolImageView, "centerXAnchor");
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", 40.0);
  v41[5] = v24;
  id v23 = -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  id v22 = -[UIImageView trailingAnchor](self->_faceImageView, "trailingAnchor");
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 12.0);
  v41[6] = v21;
  id v20 = -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  id v19 = -[TVSBVideoBulletinChinView topAnchor](self, "topAnchor");
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 9.0);
  v41[7] = v18;
  id v17 = -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  id v16 = -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v41[8] = v15;
  id v14 = -[TVSBVideoBulletinChinView trailingAnchor](self, "trailingAnchor");
  id v13 = -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 14.0);
  v41[9] = v12;
  id v11 = -[TVSBVideoBulletinChinView bottomAnchor](self, "bottomAnchor");
  id v10 = -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", 11.0);
  v41[10] = v9;
  id v8 = -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  id v7 = -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
  v41[11] = v6;
  id v5 = -[TVSBVideoBulletinChinView trailingAnchor](self, "trailingAnchor");
  id v4 = -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  id v3 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", 14.0);
  v41[12] = v3;
  v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 13LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
}

- (void)setTitle:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_title, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_title, location[0]);
    -[UILabel setText:](v4->_titleLabel, "setText:", v4->_title);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setSubtitle:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSAttributedString isEqualToAttributedString:](v4->_subtitle, "isEqualToAttributedString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_subtitle, location[0]);
    -[UILabel setAttributedText:](v4->_subtitleLabel, "setAttributedText:", v4->_subtitle);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setImage:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_image != location[0] && (-[UIImage isEqual:](v4->_image, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_image, location[0]);
    if ([location[0] isSymbolImage])
    {
      -[UIImageView setImage:](v4->_symbolImageView, "setImage:", location[0]);
      -[UIImageView setImage:](v4->_faceImageView, "setImage:", 0LL);
    }

    else
    {
      -[UIImageView setImage:](v4->_faceImageView, "setImage:", location[0]);
      -[UIImageView setImage:](v4->_symbolImageView, "setImage:", 0LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateCompositingEffects
{
  id v19 = self;
  SEL v18 = a2;
  id v13 = -[TVSBVideoBulletinChinView traitCollection](self, "traitCollection");
  BOOL v14 = [v13 userInterfaceStyle] == (id)2;

  BOOL v17 = v14;
  if (v14) {
    uint64_t v12 = kCAFilterPlusL;
  }
  else {
    uint64_t v12 = kCAFilterPlusD;
  }
  id v16 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v12);
  double v2 = 0.898039216;
  if (!v17) {
    double v2 = 0.352941176;
  }
  id v15 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v2, 1.0);
  id v3 = -[TVSBVideoBulletinChinView titleLabel](v19, "titleLabel");
  -[UILabel setTextColor:](v3, "setTextColor:", v15);

  id v5 = -[TVSBVideoBulletinChinView titleLabel](v19, "titleLabel");
  id v4 = -[UILabel layer](v5, "layer");
  [v4 setCompositingFilter:v16];

  id v6 = -[TVSBVideoBulletinChinView subtitleLabel](v19, "subtitleLabel");
  -[UILabel setAttributedText:](v6, "setAttributedText:", v19->_subtitle);

  id v8 = -[TVSBVideoBulletinChinView subtitleLabel](v19, "subtitleLabel");
  id v7 = -[UILabel layer](v8, "layer");
  [v7 setCompositingFilter:v16];

  id v9 = -[TVSBVideoBulletinChinView symbolImageView](v19, "symbolImageView");
  -[UIImageView setTintColor:](v9, "setTintColor:", v15);

  id v11 = -[TVSBVideoBulletinChinView symbolImageView](v19, "symbolImageView");
  id v10 = -[UIImageView layer](v11, "layer");
  [v10 setCompositingFilter:v16];

  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)faceImageView
{
  return self->_faceImageView;
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
}

@end