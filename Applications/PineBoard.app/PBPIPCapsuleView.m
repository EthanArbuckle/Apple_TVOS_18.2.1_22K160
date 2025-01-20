@interface PBPIPCapsuleView
+ (id)editingHintAttributedString;
+ (id)pressForOptionsView;
- (PBPIPCapsuleView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (UIVisualEffectView)backgroundView;
- (void)layoutSubviews;
@end

@implementation PBPIPCapsuleView

+ (id)editingHintAttributedString
{
  id v2 = sub_1001C307C(@"PIPEditingHintMessage", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
  NSAttributedStringKey v19 = NSFontAttributeName;
  v20 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  v6 = -[NSMutableAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:attributes:",  v3,  v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv.circle",  v7));
  v9 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 imageWithTintColor:v10]);
  -[NSTextAttachment setImage:](v9, "setImage:", v11);

  id v12 = [v3 rangeOfString:@"%@"];
  if (v13)
  {
    id v14 = v12;
    uint64_t v15 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v9));
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v6,  "replaceCharactersInRange:withAttributedString:",  v14,  v15,  v16);
  }

  id v17 = -[NSMutableAttributedString copy](v6, "copy");

  return v17;
}

+ (id)pressForOptionsView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 editingHintAttributedString]);
  id v4 = objc_alloc_init((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setAttributedText:v3];

  return v4;
}

- (PBPIPCapsuleView)initWithFrame:(CGRect)a3
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___PBPIPCapsuleView;
  v3 = -[PBPIPCapsuleView initWithFrame:]( &v47,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  id v4 = v3;
  if (v3)
  {
    -[PBPIPCapsuleView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0LL);
    -[PBPIPCapsuleView setLayoutMargins:](v4, "setLayoutMargins:", 14.0, 24.0, 14.0, 24.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4015LL));
    v5 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v46);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_backgroundView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[PBPIPCapsuleView addSubview:](v4, "addSubview:", v4->_backgroundView);
    v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v9 = v4->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    -[UILabel setFont:](v9, "setFont:", v10);

    v11 = v4->_titleLabel;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color"));
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1LL);
    -[UILabel setMarqueeEnabled:](v4->_titleLabel, "setMarqueeEnabled:", 1LL);
    -[UILabel setMarqueeRunning:](v4->_titleLabel, "setMarqueeRunning:", 1LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_backgroundView, "contentView"));
    [v13 addSubview:v4->_titleLabel];

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](v4->_titleLabel, "layer"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_backgroundView, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v14 layer]);

    [v45 setCompositingFilter:kCAFilterPlusL];
    [v44 setAllowsGroupBlending:0];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPCapsuleView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v4->_backgroundView, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPCapsuleView topAnchor](v4, "topAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v42]);
    v48[0] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v4->_backgroundView, "rightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPCapsuleView rightAnchor](v4, "rightAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v39]);
    v48[1] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v4->_backgroundView, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPCapsuleView bottomAnchor](v4, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36]);
    v48[2] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v4->_backgroundView, "leftAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPCapsuleView leftAnchor](v4, "leftAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
    v48[3] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleLabel, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v29]);
    v48[4] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v4->_titleLabel, "rightAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 rightAnchor]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v16]);
    v48[5] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    NSAttributedStringKey v19 = v15;
    v31 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 bottomAnchor]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v20]);
    v48[6] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v4->_titleLabel, "leftAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v19 leftAnchor]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);
    v48[7] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 8LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v25);
  }

  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBPIPCapsuleView;
  -[PBPIPCapsuleView layoutSubviews](&v4, "layoutSubviews");
  -[UIVisualEffectView bounds](self->_backgroundView, "bounds");
  -[UIVisualEffectView _setCornerRadius:](self->_backgroundView, "_setCornerRadius:", v3 * 0.5);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
}

@end