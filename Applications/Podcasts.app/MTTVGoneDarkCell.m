@interface MTTVGoneDarkCell
+ (double)height;
+ (id)reuseIdentifier;
- (MTTVGoneDarkCell)init;
- (void)configureSubviews;
- (void)layoutSubviews;
- (void)updateColors;
@end

@implementation MTTVGoneDarkCell

+ (double)height
{
  return 75.0;
}

+ (id)reuseIdentifier
{
  return @"kMTTVGoneDarkCellReuseIdentifier";
}

- (MTTVGoneDarkCell)init
{
  id v3 = [(id)objc_opt_class(self) reuseIdentifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVGoneDarkCell;
  v5 = -[MTTVTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0LL, v4);

  if (v5) {
    -[MTTVGoneDarkCell configureSubviews](v5, "configureSubviews");
  }
  return v5;
}

- (void)configureSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVGoneDarkCell;
  -[MTTVTableViewCell configureSubviews](&v11, "configureSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVEpisodeCell titleFont](&OBJC_CLASS___MTTVEpisodeCell, "titleFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell textLabel](self, "textLabel"));
  [v4 setFont:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TV_GONE_DARK_CELL_TITLE" value:&stru_100248948 table:0]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell textLabel](self, "textLabel"));
  [v7 setText:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"exclamationmark.triangle.fill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 imageWithRenderingMode:2]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell imageView](self, "imageView"));
  [v10 setImage:v9];
}

- (void)updateColors
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell mt_primaryTextColor](self, "mt_primaryTextColor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell textLabel](self, "textLabel"));
  [v3 setTextColor:v5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell imageView](self, "imageView"));
  [v4 setTintColor:v5];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTTVGoneDarkCell;
  -[MTTVGoneDarkCell layoutSubviews](&v18, "layoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell imageView](self, "imageView"));
  [v6 frame];

  double v7 = IMRoundToPixel((v5 + -28.0) * 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell imageView](self, "imageView"));
  objc_msgSend(v8, "setFrame:", 20.0, v7, 28.0, 28.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell textLabel](self, "textLabel"));
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v19.origin.x = 20.0;
  v19.size.width = 28.0;
  v19.size.height = 28.0;
  v19.origin.y = v7;
  CGFloat v16 = CGRectGetMaxX(v19) + 20.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGoneDarkCell textLabel](self, "textLabel"));
  objc_msgSend(v17, "setFrame:", v16, v11, v13, v15);
}

@end