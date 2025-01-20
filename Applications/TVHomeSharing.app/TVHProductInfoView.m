@interface TVHProductInfoView
- (NSArray)controls;
- (NSAttributedString)contentDescription;
- (NSString)subtitle;
- (NSString)title;
- (TVFocusableTextView)contentDescriptionTextView;
- (TVHProductInfoView)initWithFrame:(CGRect)a3;
- (TVHProductInfoViewDelegate)delegate;
- (TVHProductMetadataView)metadataView;
- (UIColor)dynamicTextColor;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)preferredFocusEnvironments;
- (void)_didSelectContentDescriptionText;
- (void)layoutSubviews;
- (void)setContentDescription:(id)a3;
- (void)setContentDescriptionTextView:(id)a3;
- (void)setControls:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDynamicTextColor:(id)a3;
- (void)setMetadataView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVHProductInfoView

- (TVHProductInfoView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHProductInfoView;
  v3 = -[TVHProductInfoView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));
    dynamicTextColor = v3->_dynamicTextColor;
    v3->_dynamicTextColor = (UIColor *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = v3->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  5LL,  7LL));
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4LL);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setMinimumScaleFactor:](v3->_titleLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v3->_dynamicTextColor);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_titleLabel, "tvh_setDebugLayoutColorType:", 12LL);
    -[TVHProductInfoView addSubview:](v3, "addSubview:", v3->_titleLabel);
    controls = v3->_controls;
    v3->_controls = (NSArray *)&__NSArray0__struct;
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView title](self, "title"));
  unsigned __int8 v5 = [v4 isEqual:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView titleLabel](self, "titleLabel"));
    [v6 setText:v7];

    -[TVHProductInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView subtitle](self, "subtitle"));
  unsigned __int8 v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (UILabel *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView subtitleLabel](self, "subtitleLabel"));
    id v7 = v6;
    if (v10)
    {
      if (!v6)
      {
        id v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
        -[UILabel setFont:](v7, "setFont:", v8);

        -[UILabel setLineBreakMode:](v7, "setLineBreakMode:", 4LL);
        -[UILabel setTextAlignment:](v7, "setTextAlignment:", 4LL);
        -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 1LL);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView dynamicTextColor](self, "dynamicTextColor"));
        -[UILabel setTextColor:](v7, "setTextColor:", v9);

        -[UILabel tvh_setDebugLayoutColorType:](v7, "tvh_setDebugLayoutColorType:", 14LL);
        -[TVHProductInfoView setSubtitleLabel:](self, "setSubtitleLabel:", v7);
        -[TVHProductInfoView addSubview:](self, "addSubview:", v7);
      }

      -[UILabel setText:](v7, "setText:");
    }

    else
    {
      -[UILabel removeFromSuperview](v6, "removeFromSuperview");
      -[TVHProductInfoView setSubtitleLabel:](self, "setSubtitleLabel:", 0LL);
    }

    -[TVHProductInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setContentDescription:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView contentDescription](self, "contentDescription"));
  unsigned __int8 v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = (TVFocusableTextView *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView contentDescriptionTextView](self, "contentDescriptionTextView"));
    v8 = v7;
    if (v4)
    {
      if (!v7)
      {
        v8 = objc_alloc_init(&OBJC_CLASS___TVFocusableTextView);
        -[TVFocusableTextView setMaximumNumberOfLines:](v8, "setMaximumNumberOfLines:", 5LL);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView dynamicTextColor](self, "dynamicTextColor"));
        -[TVFocusableTextView setDescriptionTextColor:](v8, "setDescriptionTextColor:", v9);

        -[TVFocusableTextView tvh_setDebugLayoutColorType:](v8, "tvh_setDebugLayoutColorType:", 1LL);
        objc_initWeak(&location, self);
        id v10 = _NSConcreteStackBlock;
        uint64_t v11 = 3221225472LL;
        v12 = sub_1000373F8;
        v13 = &unk_1000FD8E8;
        objc_copyWeak(&v14, &location);
        -[TVFocusableTextView setSelectionHandler:](v8, "setSelectionHandler:", &v10);
        -[TVHProductInfoView setContentDescriptionTextView:]( self,  "setContentDescriptionTextView:",  v8,  v10,  v11,  v12,  v13);
        -[TVHProductInfoView addSubview:](self, "addSubview:", v8);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }

      -[TVFocusableTextView setDescriptionText:](v8, "setDescriptionText:", v4);
    }

    else
    {
      -[TVFocusableTextView removeFromSuperview](v7, "removeFromSuperview");
      -[TVHProductInfoView setContentDescriptionTextView:](self, "setContentDescriptionTextView:", 0LL);
    }

    -[TVHProductInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSAttributedString)contentDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView contentDescriptionTextView](self, "contentDescriptionTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 descriptionText]);

  return (NSAttributedString *)v3;
}

- (void)setMetadataView:(id)a3
{
  unsigned __int8 v5 = (TVHProductMetadataView *)a3;
  p_metadataView = &self->_metadataView;
  metadataView = self->_metadataView;
  if (metadataView != v5)
  {
    v8 = v5;
    -[TVHProductMetadataView removeFromSuperview](metadataView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_metadataView, a3);
    -[TVHProductMetadataView tvh_setDebugLayoutColorType:](*p_metadataView, "tvh_setDebugLayoutColorType:", 2LL);
    -[TVHProductInfoView tvh_safeAddSubview:](self, "tvh_safeAddSubview:", *p_metadataView);
    -[TVHProductInfoView setNeedsLayout](self, "setNeedsLayout");
    unsigned __int8 v5 = v8;
  }
}

- (void)setControls:(id)a3
{
  id v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_controls, "isEqualToArray:", v4))
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    unsigned __int8 v5 = self->_controls;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)i) removeFromSuperview];
        }

        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
      }

      while (v7);
    }

    id v10 = (NSArray *)[v4 copy];
    controls = self->_controls;
    self->_controls = v10;

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v12 = self->_controls;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
          objc_msgSend(v17, "tvh_setDebugLayoutColorType:", 6, (void)v18);
          -[TVHProductInfoView addSubview:](self, "addSubview:", v17);
        }

        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
      }

      while (v14);
    }

    -[TVHProductInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___TVHProductInfoView;
  -[TVHProductInfoView layoutSubviews](&v49, "layoutSubviews");
  -[TVHProductInfoView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v7 = v5 + -53.0;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setFrame:", 0.0, 53.0, v4, 91.0);
  double v9 = v7 + -91.0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView subtitleLabel](self, "subtitleLabel"));
  uint64_t v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setFrame:", 0.0, 177.0, v4, 46.0);
    double v9 = v9 + -46.0;
    double v12 = 223.0;
  }

  else
  {
    double v12 = 144.0;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView metadataView](self, "metadataView"));
  id v14 = v13;
  if (v13)
  {
    double v15 = 33.0;
    if (v11) {
      double v15 = -2.0;
    }
    double v16 = v15 + v12;
    objc_msgSend(v13, "sizeThatFits:", v4, v9);
    if (v17 >= v9) {
      double v18 = v9;
    }
    else {
      double v18 = v17;
    }
    objc_msgSend(v14, "setFrame:", 0.0, v16, v4, v18);
    double v12 = v16 + v18;
    double v9 = v9 - v18;
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView contentDescriptionTextView](self, "contentDescriptionTextView"));
  __int128 v20 = v19;
  if (v19)
  {
    double v21 = v12 + 33.0;
    objc_msgSend(v19, "sizeThatFits:", v4, v9);
    if (v22 >= v9) {
      double v23 = v9;
    }
    else {
      double v23 = v22;
    }
    objc_msgSend(v20, "setFrame:", 0.0, v21, v4, v23);
  }

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView controls](self, "controls"));
  if ([v24 count])
  {
    v44 = v8;
    id v25 = -[TVHProductInfoView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v26 = v24;
    id v27 = [v26 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v27)
    {
      id v28 = v27;
      double v29 = v6 + -140.0;
      if (v25) {
        double v30 = v4;
      }
      else {
        double v30 = 0.0;
      }
      uint64_t v31 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(v26);
          }
          v33 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          objc_msgSend(v33, "sizeThatFits:", v4, 140.0);
          double v36 = v35;
          CGFloat v37 = v34;
          double v38 = 0.0;
          if (v25) {
            double v38 = v36;
          }
          double v39 = v30 - v38;
          objc_msgSend(v33, "setFrame:", v30 - v38, v29, v36, v34);
          double v40 = v39;
          double v41 = v29;
          double v42 = v36;
          CGFloat v43 = v37;
          if (v25) {
            double v30 = CGRectGetMinX(*(CGRect *)&v40) + -30.0;
          }
          else {
            double v30 = CGRectGetMaxX(*(CGRect *)&v40) + 30.0;
          }
          v51.origin.x = v39;
          v51.origin.y = v29;
          v51.size.width = v36;
          v51.size.height = v37;
          double v4 = v4 - (CGRectGetWidth(v51) + 30.0);
        }

        id v28 = [v26 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v28);
    }

    uint64_t v8 = v44;
  }
}

- (id)preferredFocusEnvironments
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView controls](self, "controls"));
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView contentDescriptionTextView](self, "contentDescriptionTextView"));
    uint64_t v8 = v6;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  return v5;
}

- (void)_didSelectContentDescriptionText
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductInfoView delegate](self, "delegate"));
  [v3 productInfoViewDidSelectContentDescription:self];
}

- (TVHProductInfoViewDelegate)delegate
{
  return (TVHProductInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHProductMetadataView)metadataView
{
  return self->_metadataView;
}

- (NSArray)controls
{
  return self->_controls;
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

- (TVFocusableTextView)contentDescriptionTextView
{
  return self->_contentDescriptionTextView;
}

- (void)setContentDescriptionTextView:(id)a3
{
}

- (UIColor)dynamicTextColor
{
  return self->_dynamicTextColor;
}

- (void)setDynamicTextColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end