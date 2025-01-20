@interface MTTVSettingsTableViewCell
+ (double)height;
+ (id)reuseIdentifier;
- (MTTVSettingsTableViewCell)init;
- (void)configureSubviews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColors;
@end

@implementation MTTVSettingsTableViewCell

+ (double)height
{
  return 70.0;
}

+ (id)reuseIdentifier
{
  return @"kMTTVSettingsCellReuseIdentifier";
}

- (MTTVSettingsTableViewCell)init
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVSettingsTableViewCell;
  v5 = -[MTTVSettingsTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0LL, v4);

  if (v5) {
    -[MTTVSettingsTableViewCell configureSubviews](v5, "configureSubviews");
  }
  return v5;
}

- (void)configureSubviews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"gear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 imageWithRenderingMode:2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell imageView](self, "imageView"));
  [v5 setImage:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"Settings" value:&stru_100248948 table:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  [v8 setText:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  [v10 setFont:v9];

  -[MTTVSettingsTableViewCell updateColors](self, "updateColors");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVSettingsTableViewCell;
  -[MTTVSettingsTableViewCell prepareForReuse](&v6, "prepareForReuse");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Settings" value:&stru_100248948 table:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  [v5 setText:v4];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MTTVSettingsTableViewCell;
  -[MTTVSettingsTableViewCell layoutSubviews](&v33, "layoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell contentView](self, "contentView"));
  [v3 bounds];
  CGFloat v31 = v5;
  CGFloat v32 = v4;
  CGFloat v7 = v6;
  double v9 = v8;

  double v10 = IMRoundToPixel((v9 + -28.0) * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = 20.0;
  v34.origin.x = 20.0;
  v34.size.width = 28.0;
  v34.size.height = 28.0;
  v34.origin.y = v10;
  double v19 = CGRectGetMaxX(v34) + 20.0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  [v20 frame];
  double v22 = v15 - (v19 - v21);

  if (-[MTTVSettingsTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1)
  {
    double v29 = v22;
    double v30 = v17;
    v35.origin.x = v32;
    v35.origin.y = v7;
    v35.size.width = v31;
    v35.size.height = v9;
    double MaxX = CGRectGetMaxX(v35);
    v36.origin.x = 20.0;
    v36.size.width = 28.0;
    v36.size.height = 28.0;
    v36.origin.y = v10;
    double v24 = MaxX - CGRectGetWidth(v36);
    v37.origin.x = 20.0;
    v37.size.width = 28.0;
    v37.size.height = 28.0;
    v37.origin.y = v10;
    double v18 = v24 - CGRectGetMinX(v37);
    v38.origin.x = v32;
    v38.origin.y = v7;
    v38.size.width = v31;
    v38.size.height = v9;
    double v25 = CGRectGetMaxX(v38);
    v39.origin.x = v19;
    v39.origin.y = v13;
    v39.size.width = v22;
    v39.size.height = v17;
    double v26 = v25 - CGRectGetWidth(v39);
    v40.origin.x = v19;
    v40.origin.y = v13;
    v40.size.width = v22;
    v40.size.height = v17;
    double v19 = v26 - CGRectGetMinX(v40);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell imageView](self, "imageView", *(void *)&v29, *(void *)&v30));
  objc_msgSend(v27, "setFrame:", v18, v10, 28.0, 28.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v28, "setFrame:", v19, v13, v22, v17);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVSettingsTableViewCell;
  id v4 = a3;
  -[MTTVSettingsTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVSettingsTableViewCell updateColors](self, "updateColors");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVSettingsTableViewCell;
  -[MTTVSettingsTableViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  -[MTTVSettingsTableViewCell updateColors](self, "updateColors");
}

- (void)updateColors
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell mt_primaryTextColor](self, "mt_primaryTextColor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell textLabel](self, "textLabel"));
  [v3 setTextColor:v5];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsTableViewCell imageView](self, "imageView"));
  [v4 setTintColor:v5];
}

@end