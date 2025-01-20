@interface VOTEnabledBannerView
- (UILabel)bannerLabelView;
- (UIVisualEffectView)effectView;
- (VOTEnabledBannerView)initWithFrame:(CGRect)a3;
- (void)setBannerLabelView:(id)a3;
- (void)setEffectView:(id)a3;
@end

@implementation VOTEnabledBannerView

- (VOTEnabledBannerView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___VOTEnabledBannerView;
  v3 = -[VOTEnabledBannerView initWithFrame:]( &v41,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VOTEnabledBannerView setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v5 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
    v7 = -[UIVisualEffectView initWithEffect:](v5, "initWithEffect:", v6);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v7, "layer"));
    [v8 setCornerRadius:5.0];

    -[UIVisualEffectView setClipsToBounds:](v7, "setClipsToBounds:", 1LL);
    -[VOTEnabledBannerView addSubview:](v4, "addSubview:", v7);
    -[VOTEnabledBannerView setEffectView:](v4, "setEffectView:", v7);
    v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"voiceover.instructions.text" value:&stru_253B8 table:@"VoiceOverUIServiceATV~appletv"]);
    v12 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[UILabel setIsAccessibilityElement:](v12, "setIsAccessibilityElement:", 0LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v12, "setTextAlignment:", 1LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    -[UILabel setFont:](v12, "setFont:", v14);

    -[UILabel setText:](v12, "setText:", v11);
    -[UILabel sizeToFit](v12, "sizeToFit");
    -[VOTEnabledBannerView addSubview:](v4, "addSubview:", v12);
    -[VOTEnabledBannerView setBannerLabelView:](v4, "setBannerLabelView:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView topAnchor](v4, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v7, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17]);
    [v15 addObject:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView rightAnchor](v4, "rightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v7, "rightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);
    [v15 addObject:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView bottomAnchor](v4, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v7, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);
    [v15 addObject:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView leftAnchor](v4, "leftAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v7, "leftAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);
    [v15 addObject:v27];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView topAnchor](v4, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v12, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29 constant:-20.0]);
    [v15 addObject:v30];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView rightAnchor](v4, "rightAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v12, "rightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32 constant:60.0]);
    [v15 addObject:v33];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView bottomAnchor](v4, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v12, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v35 constant:20.0]);
    [v15 addObject:v36];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView leftAnchor](v4, "leftAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v12, "leftAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v38 constant:-60.0]);
    [v15 addObject:v39];

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);
  }

  return v4;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UILabel)bannerLabelView
{
  return self->_bannerLabelView;
}

- (void)setBannerLabelView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end