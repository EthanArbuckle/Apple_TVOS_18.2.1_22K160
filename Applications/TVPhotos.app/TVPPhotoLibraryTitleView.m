@interface TVPPhotoLibraryTitleView
- (NSString)title;
- (TVPPhotoLibraryTitleView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVPPhotoLibraryTitleView

- (TVPPhotoLibraryTitleView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTitleView;
  v3 = -[TVPPhotoLibraryTitleView initWithFrame:]( &v35,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVPPhotoLibraryTitleView setClipsToBounds:](v3, "setClipsToBounds:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v5));
    v7 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v6);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVPPhotoLibraryTitleView addSubview:](v4, "addSubview:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v7, "leftAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTitleView leftAnchor](v4, "leftAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
    [v10 setActive:1];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v7, "rightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTitleView rightAnchor](v4, "rightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
    [v13 setActive:1];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v7, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTitleView topAnchor](v4, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
    [v16 setActive:1];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v7, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTitleView bottomAnchor](v4, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
    [v19 setActive:1];

    v20 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v22 = v4->_titleLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
    -[UILabel setFont:](v22, "setFont:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    [v24 setClipsToBounds:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    [v25 addSubview:v4->_titleLabel];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 topAnchor]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v28 constant:126.0]);
    [v29 setActive:1];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v4->_titleLabel, "centerXAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 centerXAnchor]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v32]);
    [v33 setActive:1];
  }

  return v4;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end