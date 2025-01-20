@interface TVPSharedPSSubscribersView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)subscribers;
- (NSString)actionButtonMessage;
- (NSString)subtitle;
- (NSString)title;
- (TVPTableView)subscribersListView;
- (UIButton)actionButton;
- (UILabel)subscribersLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)dividerView;
- (UIView)subscribersView;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)layoutSubviews;
- (void)setActionButton:(id)a3;
- (void)setActionButtonMessage:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setSubscribers:(id)a3;
- (void)setSubscribersLabel:(id)a3;
- (void)setSubscribersListView:(id)a3;
- (void)setSubscribersView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
@end

@implementation TVPSharedPSSubscribersView

- (void)setTitle:(id)a3
{
  id v14 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));

    if (!v5)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
      titleLabel = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
      -[UILabel setFont:](v8, "setFont:", v9);

      v10 = self->_titleLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      -[UILabel setTextColor:](v10, "setTextColor:", v11);

      v12 = self->_titleLabel;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1LL);
      -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 2LL);
      -[TVPSharedPSSubscribersView addSubview:](self, "addSubview:", self->_titleLabel);
    }

    -[UILabel setText:](self->_titleLabel, "setText:", v14);
  }

  -[TVPSharedPSSubscribersView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v14 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_subtitleLabel, "superview"));

    if (!v5)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
      subtitleLabel = self->_subtitleLabel;
      self->_subtitleLabel = v6;

      v8 = self->_subtitleLabel;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
      -[UILabel setFont:](v8, "setFont:", v9);

      v10 = self->_subtitleLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager feedPageIndicatorColor](&OBJC_CLASS___TVPThemeManager, "feedPageIndicatorColor"));
      -[UILabel setTextColor:](v10, "setTextColor:", v11);

      v12 = self->_subtitleLabel;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1LL);
      -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 2LL);
      -[TVPSharedPSSubscribersView addSubview:](self, "addSubview:", self->_subtitleLabel);
    }

    -[UILabel setText:](self->_subtitleLabel, "setText:", v14);
  }

  -[TVPSharedPSSubscribersView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setActionButtonMessage:(id)a3
{
  v4 = (NSString *)a3;
  -[UIButton removeFromSuperview](self->_actionButton, "removeFromSuperview");
  actionButton = self->_actionButton;
  self->_actionButton = 0LL;

  actionButtonMessage = self->_actionButtonMessage;
  self->_actionButtonMessage = v4;
  v7 = v4;

  v8 = (UIButton *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  v7));
  v9 = self->_actionButton;
  self->_actionButton = v8;

  -[UIButton setBackgroundColor:](self->_actionButton, "setBackgroundColor:", 0LL);
  -[TVPSharedPSSubscribersView addSubview:](self, "addSubview:", self->_actionButton);

  -[TVPSharedPSSubscribersView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubscribers:(id)a3
{
  id v30 = a3;
  if ([v30 count])
  {
    objc_storeStrong((id *)&self->_subscribers, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_subscribersView, "superview"));

    if (!v5)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___UIView);
      subscribersView = self->_subscribersView;
      self->_subscribersView = v6;

      v8 = self->_subscribersView;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[TVPSharedPSSubscribersView addSubview:](self, "addSubview:", self->_subscribersView);
      v10 = objc_alloc_init(&OBJC_CLASS___UIView);
      dividerView = self->_dividerView;
      self->_dividerView = v10;

      v12 = self->_dividerView;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[UIView addSubview:](self->_subscribersView, "addSubview:", self->_dividerView);
      id v14 = objc_alloc_init(&OBJC_CLASS___UILabel);
      subscribersLabel = self->_subscribersLabel;
      self->_subscribersLabel = v14;

      v16 = self->_subscribersLabel;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
      -[UILabel setFont:](v16, "setFont:", v17);

      v18 = self->_subscribersLabel;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager feedPageIndicatorColor](&OBJC_CLASS___TVPThemeManager, "feedPageIndicatorColor"));
      -[UILabel setTextColor:](v18, "setTextColor:", v19);

      v20 = self->_subscribersLabel;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v20, "setBackgroundColor:", v21);

      v22 = self->_subscribersLabel;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"subscribersListTitle" value:&stru_1000CC6C8 table:0]);
      -[UILabel setText:](v22, "setText:", v24);

      -[UILabel setClipsToBounds:](self->_subscribersLabel, "setClipsToBounds:", 1LL);
      -[UILabel setTextAlignment:](self->_subscribersLabel, "setTextAlignment:", 1LL);
      -[UIView addSubview:](self->_subscribersView, "addSubview:", self->_subscribersLabel);
      v25 = objc_alloc_init(&OBJC_CLASS___TVPTableView);
      subscribersListView = self->_subscribersListView;
      self->_subscribersListView = v25;

      -[TVPTableView setDataSource:](self->_subscribersListView, "setDataSource:", self);
      -[TVPTableView setDelegate:](self->_subscribersListView, "setDelegate:", self);
      v27 = self->_subscribersListView;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[TVPTableView setBackgroundColor:](v27, "setBackgroundColor:", v28);

      -[TVPTableView registerClass:forCellReuseIdentifier:]( self->_subscribersListView,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___UITableViewCell, v29),  @"subscriberCellIdentifier");
      -[UIView addSubview:](self->_subscribersView, "addSubview:", self->_subscribersListView);
    }

    -[TVPTableView reloadData](self->_subscribersListView, "reloadData");
  }

  -[TVPSharedPSSubscribersView setNeedsLayout](self, "setNeedsLayout");
}

- (id)preferredFocusEnvironments
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscribersView subviews](self, "subviews", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    v7 = &__NSArray0__struct;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIButton, v4);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
        break;
      }
      if (v5 == (id)++v8)
      {
        id v5 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    id v11 = v9;

    if (v11)
    {
      id v17 = v11;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      v2 = v11;
      goto LABEL_13;
    }

    v7 = &__NSArray0__struct;
  }

  else
  {
    v7 = &__NSArray0__struct;
LABEL_13:
  }

  return v7;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___TVPSharedPSSubscribersView;
  -[TVPSharedPSSubscribersView layoutSubviews](&v54, "layoutSubviews");
  -[TVPSharedPSSubscribersView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v7,  v8,  v4);
  double v10 = v9;

  float v11 = (v4 - v10) * 0.5;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", floorf(v11), 0.0, v10, 48.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v12,  v13,  v4);
  double v15 = v14;

  subtitleLabel = self->_subtitleLabel;
  float v17 = (v4 - v15) * 0.5;
  double v18 = floorf(v17);
  -[UILabel frame](self->_titleLabel, "frame");
  double v20 = v19;
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel setFrame:](subtitleLabel, "setFrame:", v18, v20 + v21 + 6.0, v15, 38.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleForState:](self->_actionButton, "titleForState:", 0LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v22,  v23,  v4);
  double v25 = v24;
  double v27 = v26;

  float v28 = v25 + 110.0;
  float v29 = v27 + 34.0;
  double v30 = v28;
  float v31 = (v4 - v28) * 0.5;
  actionButton = self->_actionButton;
  double v33 = floorf(v31);
  -[UILabel frame](self->_subtitleLabel, "frame");
  double v35 = v34;
  -[UILabel frame](self->_subtitleLabel, "frame");
  -[UIButton setFrame:](actionButton, "setFrame:", v33, v35 + v36 + 60.0, v30, v29);
  if (self->_subscribersView)
  {
    -[UIButton frame](self->_actionButton, "frame");
    double v38 = v37;
    -[UIButton frame](self->_actionButton, "frame");
    -[UIView setFrame:](self->_subscribersView, "setFrame:", 0.0, v38 + v39 + 33.0, v4, v6 - (v38 + v39 + 33.0));
    -[UIView setFrame:](self->_dividerView, "setFrame:", 0.0, 0.0, v4, 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subscribersLabel, "text"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v40,  v41,  v4);
    double v43 = v42;

    subscribersLabel = self->_subscribersLabel;
    -[UIView frame](self->_dividerView, "frame");
    double v46 = v45;
    -[UIView frame](self->_dividerView, "frame");
    -[UILabel setFrame:](subscribersLabel, "setFrame:", 0.0, v46 + v47 + 44.0, v4, v43);
    -[UILabel frame](self->_subscribersLabel, "frame");
    double v49 = v48;
    -[UILabel frame](self->_subscribersLabel, "frame");
    subscribersListView = self->_subscribersListView;
    double v52 = v49 + v50 + 24.0;
    -[UIView frame](self->_subscribersView, "frame");
    -[TVPTableView setFrame:](subscribersListView, "setFrame:", 0.0, v52, v4, v53 - v52);
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleForState:](self->_actionButton, "titleForState:", 0LL, a3.width, a3.height));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  -[TVPSharedPSSubscribersView bounds](self, "bounds");
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v4,  v5,  v6);
  double v8 = v7;

  double v9 = v8 + 94.0 + 92.0;
  if (self->_subscribersView)
  {
    double v10 = v9 + 34.0;
    float v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subscribersLabel, "text"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
    -[TVPSharedPSSubscribersView bounds](self, "bounds");
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v11,  v12,  v13);
    double v15 = v14;

    -[TVPTableView contentSize](self->_subscribersListView, "contentSize");
    double v9 = v10 + v15 + 44.0 + v16 + 24.0;
  }

  -[TVPSharedPSSubscribersView bounds](self, "bounds");
  double v18 = v17;
  double v19 = v9;
  result.height = v19;
  result.width = v18;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_subscribers, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"subscriberCellIdentifier" forIndexPath:v6]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v8 setTextColor:v9];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v10 setTextAlignment:1];

  float v11 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  subscribers = self->_subscribers;
  id v13 = [v6 row];

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](subscribers, "objectAtIndexedSubscript:", v13));
  [v11 setText:v14];

  return v7;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v5 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v5 previouslyFocusedView]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nextFocusedView]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v7);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v15 textLabel]);
    float v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    [v10 setTextColor:v11];
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v9);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 textLabel]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v13 setTextColor:v14];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionButtonMessage
{
  return self->_actionButtonMessage;
}

- (NSArray)subscribers
{
  return self->_subscribers;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
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

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (UIView)subscribersView
{
  return self->_subscribersView;
}

- (void)setSubscribersView:(id)a3
{
}

- (UILabel)subscribersLabel
{
  return self->_subscribersLabel;
}

- (void)setSubscribersLabel:(id)a3
{
}

- (TVPTableView)subscribersListView
{
  return self->_subscribersListView;
}

- (void)setSubscribersListView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end