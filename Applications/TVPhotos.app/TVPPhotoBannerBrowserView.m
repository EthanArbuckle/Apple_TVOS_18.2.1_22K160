@interface TVPPhotoBannerBrowserView
- (BOOL)canBecomeFocused;
- (BOOL)requiresHorizontalMargins;
- (CGSize)_getAttributedSubtitleSize;
- (CGSize)_getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5;
- (CGSize)_getAttributedTitleSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)buttons;
- (NSString)subtitle;
- (NSString)title;
- (TVPPhotoBannerBrowserView)initWithFrame:(CGRect)a3;
- (UIFocusGuide)_focusGuide;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIVisualEffectView)_hostView;
- (id)preferredFocusEnvironments;
- (void)layoutSubviews;
- (void)setButtons:(id)a3;
- (void)setRequiresHorizontalMargins:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)set_focusGuide:(id)a3;
- (void)set_hostView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPPhotoBannerBrowserView

- (TVPPhotoBannerBrowserView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVPPhotoBannerBrowserView;
  v3 = -[TVPPhotoBannerBrowserView initWithFrame:]( &v24,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVPPhotoBannerBrowserView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v5));
    v7 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v6);
    hostView = v3->__hostView;
    v3->__hostView = v7;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v3->__hostView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVPPhotoBannerBrowserView addSubview:](v3, "addSubview:", v3->__hostView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v3->__hostView, "leftAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView leftAnchor](v3, "leftAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10]);
    [v11 setActive:1];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v3->__hostView, "rightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView rightAnchor](v3, "rightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
    [v14 setActive:1];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v3->__hostView, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView topAnchor](v3, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v16]);
    [v17 setActive:1];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v3->__hostView, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView bottomAnchor](v3, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19]);
    [v20 setActive:1];

    v21 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    focusGuide = v3->__focusGuide;
    v3->__focusGuide = v21;

    -[TVPPhotoBannerBrowserView addLayoutGuide:](v3, "addLayoutGuide:", v3->__focusGuide);
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  if ([v15 length])
  {
    objc_storeStrong((id *)&self->_title, a3);
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
      v7 = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
      -[UILabel setFont:](v8, "setFont:", v9);

      v10 = self->_titleLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

      -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4LL);
      titleLabel = self->_titleLabel;
    }

    -[UILabel setText:](titleLabel, "setText:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->__hostView, "contentView"));
      [v13 addSubview:self->_titleLabel];
    }
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));

    if (v14) {
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    }
  }

  -[TVPPhotoBannerBrowserView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v15 = a3;
  if ([v15 length])
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    subtitleLabel = self->_subtitleLabel;
    if (!subtitleLabel)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
      v7 = self->_subtitleLabel;
      self->_subtitleLabel = v6;

      v8 = self->_subtitleLabel;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
      -[UILabel setFont:](v8, "setFont:", v9);

      v10 = self->_subtitleLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

      -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 4LL);
      subtitleLabel = self->_subtitleLabel;
    }

    -[UILabel setText:](subtitleLabel, "setText:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_subtitleLabel, "superview"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->__hostView, "contentView"));
      [v13 addSubview:self->_subtitleLabel];
    }
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_subtitleLabel, "superview"));

    if (v14) {
      -[UILabel removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
    }
  }

  -[TVPPhotoBannerBrowserView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setButtons:(id)a3
{
  id v4 = a3;
  buttons = self->_buttons;
  if (v4)
  {
    if (buttons)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      v6 = buttons;
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) removeFromSuperview];
          }

          id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        }

        while (v8);
      }
    }

    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v4));
    v12 = self->_buttons;
    self->_buttons = v11;

    buttons = self->_buttons;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004429C;
    v14[3] = &unk_1000CB498;
    v14[4] = self;
    v13 = (Block_layout *)v14;
  }

  else
  {
    v13 = &stru_1000CB4D8;
  }

  -[NSArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v13);
  -[TVPPhotoBannerBrowserView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView titleLabel](self, "titleLabel"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager listTitleTextColor](&OBJC_CLASS___TVPThemeManager, "listTitleTextColor"));
    [v8 setTextColor:v9];

    id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView subtitleLabel](self, "subtitleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager listTitleTextColor](&OBJC_CLASS___TVPThemeManager, "listTitleTextColor"));
    [v11 setTextColor:v10];
  }

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView subviews](self, "subviews", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIButton, v5);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v11 = v9;

    if (!v11) {
      return (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView subviews](self, "subviews"));
    }
    id v18 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));

    return v12;
  }

  else
  {
LABEL_9:

    return (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView subviews](self, "subviews"));
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = v3;
  double v5 = 1920.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  unsigned int v3 = -[TVPPhotoBannerBrowserView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___TVPPhotoBannerBrowserView;
  -[TVPPhotoBannerBrowserView layoutSubviews](&v61, "layoutSubviews");
  if (self->_requiresHorizontalMargins) {
    double v4 = 90.0;
  }
  else {
    double v4 = 0.0;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_buttons, "reverseObjectEnumerator"));
  double v6 = v4;
  if ((v3 & 1) == 0)
  {
    -[TVPPhotoBannerBrowserView bounds](self, "bounds");
    double v6 = v7 - v4;
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v8)
  {
    id v9 = v8;
    int v55 = 0;
    uint64_t v10 = *(void *)v58;
LABEL_8:
    uint64_t v11 = 0LL;
    if (v55 <= 3) {
      int v12 = 3;
    }
    else {
      int v12 = v55;
    }
    uint64_t v13 = (v12 - v55);
    while (1)
    {
      if (*(void *)v58 != v10) {
        objc_enumerationMutation(obj);
      }
      if (v13 == v11) {
        break;
      }
      id v14 = *(id *)(*((void *)&v57 + 1) + 8 * v11);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 titleForState:0]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
      -[TVPPhotoBannerBrowserView _getAttributedTextSize:font:maxWidth:]( self,  "_getAttributedTextSize:font:maxWidth:",  v15,  v16,  1920.0);
      double v18 = v17;

      double v19 = v18 + 80.0;
      if (v3) {
        double v20 = 0.0;
      }
      else {
        double v20 = v18 + 80.0;
      }
      double v21 = v6 - v20;
      if (v3) {
        double v6 = v6 + v19 + 20.0;
      }
      else {
        double v6 = v6 - v19 + -20.0;
      }
      objc_msgSend(v14, "setFrame:", v21, 116.0);

      if (v9 == (id)++v11)
      {
        id v9 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
        v55 += v11;
        if (v9) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  if (-[NSArray count](self->_buttons, "count"))
  {
    if ((v3 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_buttons,  "objectAtIndexedSubscript:",  (char *)-[NSArray count](self->_buttons, "count") - 1));
      [v22 frame];
      double v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_buttons,  "objectAtIndexedSubscript:",  (char *)-[NSArray count](self->_buttons, "count") - 1));
      [v25 frame];
      double v27 = v24 + v26;

      -[TVPPhotoBannerBrowserView bounds](self, "bounds");
      double v29 = v28 - v27;
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", 0LL));
      [v31 frame];
      double v29 = v32;
    }

    if (v29 - v4 <= 900.0) {
      double v30 = v29 - v4 + -20.0;
    }
    else {
      double v30 = 900.0;
    }
  }

  else
  {
    double v30 = 900.0;
  }

  -[TVPPhotoBannerBrowserView _getAttributedTitleSize](self, "_getAttributedTitleSize");
  double v34 = v33;
  if (v3)
  {
    -[TVPPhotoBannerBrowserView bounds](self, "bounds");
    double v4 = v35 - v30 - v4;
  }

  -[TVPPhotoBannerBrowserView _getAttributedSubtitleSize](self, "_getAttributedSubtitleSize");
  double v37 = v36;
  v63.origin.y = 73.0;
  v63.origin.x = v4;
  v63.size.width = v30;
  v63.size.height = v34;
  double v38 = CGRectGetMaxY(v63) + 7.0;
  -[TVPPhotoBannerBrowserView frame](self, "frame");
  double Height = CGRectGetHeight(v64);
  v65.origin.x = v4;
  v65.origin.y = v38;
  v65.size.width = v30;
  v65.size.height = v37;
  double v40 = Height - CGRectGetMaxY(v65);
  if (v40 < 30.0) {
    double v38 = v38 + -16.0;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v4, dbl_100097CE0[v40 < 30.0], v30, v34);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v4, v38, v30, v37);
  if (-[NSArray count](self->_buttons, "count"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leadingAnchor](self->__focusGuide, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView leadingAnchor](self, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43]);
    [v44 setActive:1];

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide trailingAnchor](self->__focusGuide, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v41 trailingAnchor]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46]);
    [v47 setActive:1];

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](self->__focusGuide, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView topAnchor](self, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v49]);
    [v50 setActive:1];

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](self->__focusGuide, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView bottomAnchor](self, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v52]);
    [v53 setActive:1];

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoBannerBrowserView preferredFocusEnvironments](self, "preferredFocusEnvironments"));
    -[UIFocusGuide setPreferredFocusEnvironments:](self->__focusGuide, "setPreferredFocusEnvironments:", v54);
  }
}

- (CGSize)_getAttributedTitleSize
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  NSFontAttributeName,  0LL));

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  [v5 sizeWithAttributes:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_getAttributedSubtitleSize
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  NSFontAttributeName,  0LL));

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  [v5 sizeWithAttributes:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  NSFontAttributeName,  0LL));
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a5, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)requiresHorizontalMargins
{
  return self->_requiresHorizontalMargins;
}

- (void)setRequiresHorizontalMargins:(BOOL)a3
{
  self->_requiresHorizontalMargins = a3;
}

- (NSArray)buttons
{
  return self->_buttons;
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

- (UIVisualEffectView)_hostView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)set_hostView:(id)a3
{
}

- (UIFocusGuide)_focusGuide
{
  return (UIFocusGuide *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)set_focusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end