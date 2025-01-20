@interface TVSBVideoBulletinBadgeView
- (BOOL)isFullScreen;
- (BOOL)materialBackground;
- (NSArray)fullScreenConstraints;
- (NSArray)platterConstraints;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)minimumWidthConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSString)badgeText;
- (TVSBVideoBulletinBadgeView)initWithMaterialBackground:(BOOL)a3;
- (UILabel)largeLabel;
- (UILabel)smallLabel;
- (UIVisualEffectView)effectView;
- (void)setBadgeText:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFullScreenConstraints:(id)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setLargeLabel:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setMaterialBackground:(BOOL)a3;
- (void)setMinimumWidthConstraint:(id)a3;
- (void)setPlatterConstraints:(id)a3;
- (void)setSmallLabel:(id)a3;
- (void)setTrailingConstraint:(id)a3;
@end

@implementation TVSBVideoBulletinBadgeView

- (TVSBVideoBulletinBadgeView)initWithMaterialBackground:(BOOL)a3
{
  SEL v80 = a2;
  BOOL v79 = a3;
  v81 = 0LL;
  v78.receiver = self;
  v78.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinBadgeView;
  v74 = -[TVSBVideoBulletinBadgeView initWithFrame:]( &v78,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v81 = v74;
  objc_storeStrong((id *)&v81, v74);
  if (v74)
  {
    v81->_materialBackground = v79;
    -[TVSBVideoBulletinBadgeView _setContinuousCornerRadius:](v81, "_setContinuousCornerRadius:", 15.0);
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    smallLabel = v81->_smallLabel;
    v81->_smallLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v81->_smallLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v70 = v81->_smallLabel;
    v71 =  +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  23.0,  UIFontWeightSemibold);
    -[UILabel setFont:](v70, "setFont:");

    -[UILabel setTextAlignment:](v81->_smallLabel, "setTextAlignment:");
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    largeLabel = v81->_largeLabel;
    v81->_largeLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v81->_largeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v72 = v81->_largeLabel;
    v73 =  +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  31.0,  UIFontWeightSemibold);
    -[UILabel setFont:](v72, "setFont:");

    -[UILabel setTextAlignment:](v81->_largeLabel, "setTextAlignment:", 1LL);
    -[UILabel setBaselineAdjustment:](v81->_largeLabel, "setBaselineAdjustment:", 1LL);
    -[UILabel setAlpha:](v81->_largeLabel, "setAlpha:", 0.0);
    v77 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v79)
    {
      v50 = v81->_smallLabel;
      v51 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
      -[UILabel setTextColor:](v50, "setTextColor:");

      v52 = v81->_largeLabel;
      v53 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
      -[UILabel setTextColor:](v52, "setTextColor:");

      v54 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
      v55 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4001LL);
      v7 = -[UIVisualEffectView initWithEffect:](v54, "initWithEffect:");
      effectView = v81->_effectView;
      v81->_effectView = v7;

      -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v81->_effectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      v56 = -[UIVisualEffectView contentView](v81->_effectView, "contentView");
      -[UIView addSubview:](v56, "addSubview:", v81->_smallLabel);

      v57 = -[UIVisualEffectView contentView](v81->_effectView, "contentView");
      -[UIView addSubview:](v57, "addSubview:", v81->_largeLabel);

      -[TVSBVideoBulletinBadgeView addSubview:](v81, "addSubview:", v81->_effectView);
      id v60 = -[UIVisualEffectView widthAnchor](v81->_effectView, "widthAnchor");
      id v59 = -[TVSBVideoBulletinBadgeView widthAnchor](v81, "widthAnchor");
      id v58 = objc_msgSend(v60, "constraintEqualToAnchor:");
      -[NSMutableArray addObject:](v77, "addObject:");

      id v63 = -[UIVisualEffectView heightAnchor](v81->_effectView, "heightAnchor");
      id v62 = -[TVSBVideoBulletinBadgeView heightAnchor](v81, "heightAnchor");
      id v61 = objc_msgSend(v63, "constraintEqualToAnchor:");
      -[NSMutableArray addObject:](v77, "addObject:");

      id v66 = -[UIVisualEffectView centerXAnchor](v81->_effectView, "centerXAnchor");
      id v65 = -[TVSBVideoBulletinBadgeView centerXAnchor](v81, "centerXAnchor");
      id v64 = objc_msgSend(v66, "constraintEqualToAnchor:");
      -[NSMutableArray addObject:](v77, "addObject:");

      id v69 = -[UIVisualEffectView centerYAnchor](v81->_effectView, "centerYAnchor");
      id v68 = -[TVSBVideoBulletinBadgeView centerYAnchor](v81, "centerYAnchor");
      id v67 = objc_msgSend(v69, "constraintEqualToAnchor:");
      -[NSMutableArray addObject:](v77, "addObject:");
    }

    else
    {
      v46 = v81->_smallLabel;
      v47 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
      -[UILabel setTextColor:](v46, "setTextColor:");

      -[TVSBVideoBulletinBadgeView addSubview:](v81, "addSubview:", v81->_smallLabel);
      v48 = v81->_largeLabel;
      v49 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
      -[UILabel setTextColor:](v48, "setTextColor:");

      -[TVSBVideoBulletinBadgeView addSubview:](v81, "addSubview:", v81->_largeLabel);
    }

    id v13 = -[TVSBVideoBulletinBadgeView widthAnchor](v81, "widthAnchor");
    v9 = (NSLayoutConstraint *)[v13 constraintGreaterThanOrEqualToConstant:68.0];
    minimumWidthConstraint = v81->_minimumWidthConstraint;
    v81->_minimumWidthConstraint = v9;

    -[NSMutableArray addObject:](v77, "addObject:", v81->_minimumWidthConstraint);
    v14 = v77;
    id v17 = -[UILabel topAnchor](v81->_smallLabel, "topAnchor");
    id v16 = -[TVSBVideoBulletinBadgeView topAnchor](v81, "topAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v14, "addObject:");

    v18 = v77;
    id v21 = -[UILabel bottomAnchor](v81->_smallLabel, "bottomAnchor");
    id v20 = -[TVSBVideoBulletinBadgeView bottomAnchor](v81, "bottomAnchor");
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v18, "addObject:");

    v22 = v77;
    id v25 = -[UILabel centerXAnchor](v81->_smallLabel, "centerXAnchor");
    id v24 = -[TVSBVideoBulletinBadgeView centerXAnchor](v81, "centerXAnchor");
    id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v22, "addObject:");

    v26 = v77;
    id v29 = -[UILabel centerXAnchor](v81->_largeLabel, "centerXAnchor");
    id v28 = -[TVSBVideoBulletinBadgeView centerXAnchor](v81, "centerXAnchor");
    id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v26, "addObject:");

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v77);
    v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v30 = v76;
    id v33 = -[TVSBVideoBulletinBadgeView widthAnchor](v81, "widthAnchor");
    id v32 = -[UILabel widthAnchor](v81->_smallLabel, "widthAnchor");
    id v31 = objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", 24.0);
    -[NSMutableArray addObject:](v30, "addObject:");

    objc_storeStrong((id *)&v81->_platterConstraints, v76);
    +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  v81->_platterConstraints);
    v75 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v34 = v75;
    id v37 = -[UILabel topAnchor](v81->_largeLabel, "topAnchor");
    id v36 = -[TVSBVideoBulletinBadgeView topAnchor](v81, "topAnchor");
    id v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v34, "addObject:");

    v38 = v75;
    id v41 = -[UILabel bottomAnchor](v81->_largeLabel, "bottomAnchor");
    id v40 = -[TVSBVideoBulletinBadgeView bottomAnchor](v81, "bottomAnchor");
    id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v38, "addObject:");

    v42 = v75;
    id v45 = -[TVSBVideoBulletinBadgeView widthAnchor](v81, "widthAnchor");
    id v44 = -[UILabel widthAnchor](v81->_largeLabel, "widthAnchor");
    id v43 = objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", 36.0);
    -[NSMutableArray addObject:](v42, "addObject:");

    objc_storeStrong((id *)&v81->_fullScreenConstraints, v75);
    objc_storeStrong((id *)&v75, 0LL);
    objc_storeStrong((id *)&v76, 0LL);
    objc_storeStrong((id *)&v77, 0LL);
  }

  v12 = v81;
  objc_storeStrong((id *)&v81, 0LL);
  return v12;
}

- (void)setBadgeText:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = -[TVSBVideoBulletinBadgeView badgeText](v8, "badgeText");
  unsigned __int8 v6 = -[NSString isEqualToString:](v5, "isEqualToString:", location[0]);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&v8->_badgeText, location[0]);
    v3 = -[TVSBVideoBulletinBadgeView smallLabel](v8, "smallLabel");
    -[UILabel setText:](v3, "setText:", location[0]);

    v4 = -[TVSBVideoBulletinBadgeView largeLabel](v8, "largeLabel");
    -[UILabel setText:](v4, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setFullscreen:(BOOL)a3
{
  if (a3)
  {
    -[TVSBVideoBulletinBadgeView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 22.0);
    v3 = -[TVSBVideoBulletinBadgeView minimumWidthConstraint](self, "minimumWidthConstraint");
    -[NSLayoutConstraint setConstant:](v3, "setConstant:", 94.0);

    v4 = -[TVSBVideoBulletinBadgeView smallLabel](self, "smallLabel");
    -[UILabel setAlpha:](v4, "setAlpha:", 0.0);

    v5 = -[TVSBVideoBulletinBadgeView largeLabel](self, "largeLabel");
    -[UILabel setAlpha:](v5, "setAlpha:", 1.0);

    unsigned __int8 v6 = -[TVSBVideoBulletinBadgeView fullScreenConstraints](self, "fullScreenConstraints");
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v7 = -[TVSBVideoBulletinBadgeView platterConstraints](self, "platterConstraints");
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:");
  }

  else
  {
    -[TVSBVideoBulletinBadgeView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 15.0);
    v8 = -[TVSBVideoBulletinBadgeView minimumWidthConstraint](self, "minimumWidthConstraint");
    -[NSLayoutConstraint setConstant:](v8, "setConstant:", 68.0);

    v9 = -[TVSBVideoBulletinBadgeView smallLabel](self, "smallLabel");
    -[UILabel setAlpha:](v9, "setAlpha:", 1.0);

    v10 = -[TVSBVideoBulletinBadgeView largeLabel](self, "largeLabel");
    -[UILabel setAlpha:](v10, "setAlpha:", 0.0);

    v11 = -[TVSBVideoBulletinBadgeView fullScreenConstraints](self, "fullScreenConstraints");
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:");

    v12 = -[TVSBVideoBulletinBadgeView platterConstraints](self, "platterConstraints");
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

- (NSString)badgeText
{
  return self->_badgeText;
}

- (BOOL)isFullScreen
{
  return self->_fullscreen;
}

- (BOOL)materialBackground
{
  return self->_materialBackground;
}

- (void)setMaterialBackground:(BOOL)a3
{
  self->_materialBackground = a3;
}

- (UILabel)smallLabel
{
  return self->_smallLabel;
}

- (void)setSmallLabel:(id)a3
{
}

- (UILabel)largeLabel
{
  return self->_largeLabel;
}

- (void)setLargeLabel:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (void)setMinimumWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSArray)platterConstraints
{
  return self->_platterConstraints;
}

- (void)setPlatterConstraints:(id)a3
{
}

- (NSArray)fullScreenConstraints
{
  return self->_fullScreenConstraints;
}

- (void)setFullScreenConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end