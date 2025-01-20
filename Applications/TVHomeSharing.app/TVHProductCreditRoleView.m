@interface TVHProductCreditRoleView
+ (id)_nameLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)nameVibrantLabelViews;
- (NSArray)names;
- (NSString)title;
- (TVHProductCreditRoleView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)_updateNameVibrantLabelViews;
- (void)layoutSubviews;
- (void)setNameVibrantLabelViews:(id)a3;
- (void)setNames:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVHProductCreditRoleView

- (TVHProductCreditRoleView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHProductCreditRoleView;
  v3 = -[TVHProductCreditRoleView initWithFrame:]( &v12,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4LL);
    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 14LL));
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 2LL);
    -[UILabel setText:](v3->_titleLabel, "setText:", &stru_100100278);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_titleLabel, "tvh_setDebugLayoutColorType:", 7LL);
    -[TVHProductCreditRoleView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_80PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_80PercentBlackColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_80PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_80PercentWhiteColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v8,  v9));

    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v10);
  }

  return v3;
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView titleLabel](self, "titleLabel"));
  [v5 setText:v4];
}

- (void)setNames:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_names, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v7 copy];
    names = self->_names;
    self->_names = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView window](self, "window"));
    if (v6) {
      -[TVHProductCreditRoleView _updateNameVibrantLabelViews](self, "_updateNameVibrantLabelViews");
    }
  }
}

- (void)_updateNameVibrantLabelViews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView nameVibrantLabelViews](self, "nameVibrantLabelViews"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)i) removeFromSuperview];
      }

      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView names](self, "names"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000561A4;
  v20[3] = &unk_1000FE2B0;
  v20[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", v20));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)j);
        objc_msgSend(v15, "tvh_setDebugLayoutColorType:", 5, (void)v16);
        -[TVHProductCreditRoleView addSubview:](self, "addSubview:", v15);
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }

    while (v12);
  }

  -[TVHProductCreditRoleView setNameVibrantLabelViews:](self, "setNameVibrantLabelViews:", v10);
  -[TVHProductCreditRoleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHProductCreditRoleView;
  -[TVHProductCreditRoleView willMoveToWindow:](&v6, "willMoveToWindow:");
  if (a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView nameVibrantLabelViews](self, "nameVibrantLabelViews"));

    if (!v5) {
      -[TVHProductCreditRoleView _updateNameVibrantLabelViews](self, "_updateNameVibrantLabelViews");
    }
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView nameVibrantLabelViews](self, "nameVibrantLabelViews", a3.width, a3.height));
  id v5 = (char *)[v4 count] + 1;

  double v6 = (double)(unint64_t)v5 * 36.0;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView titleLabel](self, "titleLabel"));
  double v8 = 1.0;
  objc_msgSend(v7, "setFrame:", 0.0, 1.0, v4, 35.0);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView nameVibrantLabelViews](self, "nameVibrantLabelViews", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        double v8 = v8 + 36.0;
        objc_msgSend(v14, "setFrame:", 0.0, v8, v4, 35.0);
        v20.origin.x = 0.0;
        v20.origin.y = v8;
        v20.size.CGFloat width = v4;
        v20.size.height = 35.0;
        [v14 setHidden:CGRectGetMaxY(v20) > v6];
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

+ (id)_nameLabel
{
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setLineBreakMode:](v2, "setLineBreakMode:", 4LL);
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
  -[UILabel setFont:](v2, "setFont:", v3);

  -[UILabel setNumberOfLines:](v2, "setNumberOfLines:", 1LL);
  -[UILabel setTextAlignment:](v2, "setTextAlignment:", 2LL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UILabel setTextColor:](v2, "setTextColor:", v4);

  -[UILabel setAdjustsFontSizeToFitWidth:](v2, "setAdjustsFontSizeToFitWidth:", 1LL);
  -[UILabel setMinimumScaleFactor:](v2, "setMinimumScaleFactor:", 0.7);
  -[UILabel setOpaque:](v2, "setOpaque:", 0LL);
  -[UILabel setBackgroundColor:](v2, "setBackgroundColor:", 0LL);
  return v2;
}

- (NSArray)names
{
  return self->_names;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)nameVibrantLabelViews
{
  return self->_nameVibrantLabelViews;
}

- (void)setNameVibrantLabelViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end