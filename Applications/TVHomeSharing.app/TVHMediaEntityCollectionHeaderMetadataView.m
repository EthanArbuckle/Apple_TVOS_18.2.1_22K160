@interface TVHMediaEntityCollectionHeaderMetadataView
- (CGSize)sizeThatFits:(CGSize)result;
- (NSArray)metadataStrings;
- (TVHMediaEntityCollectionHeaderMetadataView)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (id)_label;
- (void)_updateMetadataLabelsContainerViewWithStrings:(id)a3;
- (void)layoutSubviews;
- (void)setMetadataStrings:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation TVHMediaEntityCollectionHeaderMetadataView

- (TVHMediaEntityCollectionHeaderMetadataView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionHeaderMetadataView;
  v3 = -[TVHMediaEntityCollectionHeaderMetadataView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v6;
  }

  return v3;
}

- (void)setMetadataStrings:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderMetadataView metadataStrings](self, "metadataStrings"));
  unsigned __int8 v5 = [v4 isEqualToArray:v6];

  if ((v5 & 1) == 0)
  {
    -[TVHMediaEntityCollectionHeaderMetadataView _updateMetadataLabelsContainerViewWithStrings:]( self,  "_updateMetadataLabelsContainerViewWithStrings:",  v6);
    -[TVHMediaEntityCollectionHeaderMetadataView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSArray)metadataStrings
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderMetadataView subviews](self, "subviews", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        objc_opt_class(&OBJC_CLASS___UILabel);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 text]);
          v12 = (void *)v11;
          if (v11) {
            v13 = (__CFString *)v11;
          }
          else {
            v13 = &stru_100100278;
          }
          v14 = v13;

          -[NSMutableArray addObject:](v3, "addObject:", v14);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 35.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  double v4 = v3;
  id v5 = -[TVHMediaEntityCollectionHeaderMetadataView effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderMetadataView subviews](self, "subviews", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    if (v5) {
      double v9 = v4 + -1.0;
    }
    else {
      double v9 = 0.0;
    }
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v11);
        objc_opt_class(&OBJC_CLASS___UILabel);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v14 = v12;
          [v14 frame];
          if (v4 >= v15) {
            double v16 = v15;
          }
          else {
            double v16 = v4;
          }
          if (v5) {
            double v17 = v16;
          }
          else {
            double v17 = 0.0;
          }
          double v18 = v9 - v17;
          objc_msgSend(v14, "setFrame:", v18, 0.0, v16, 35.0);

          double v4 = v4 - (v16 + -18.0);
          uint64_t v19 = 0LL;
          double v20 = v18;
          double v21 = v16;
          uint64_t v22 = 0x4041800000000000LL;
          if (v5) {
            double v9 = CGRectGetMinX(*(CGRect *)&v20) + -18.0;
          }
          else {
            double v9 = CGRectGetMaxX(*(CGRect *)&v20) + 18.0;
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v8);
  }
}

- (id)_label
{
  double v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setLineBreakMode:](v3, "setLineBreakMode:", 4LL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  13LL,  0LL));
  -[UILabel setFont:](v3, "setFont:", v4);

  -[UILabel setNumberOfLines:](v3, "setNumberOfLines:", 1LL);
  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 4LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderMetadataView textColor](self, "textColor"));
  -[UILabel setTextColor:](v3, "setTextColor:", v5);

  return v3;
}

- (void)_updateMetadataLabelsContainerViewWithStrings:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderMetadataView subviews](self, "subviews"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v9) removeFromSuperview];
        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v7);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10009A7F0;
  v19[3] = &unk_1000FFC98;
  v19[4] = self;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", v19));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[TVHMediaEntityCollectionHeaderMetadataView addSubview:]( self,  "addSubview:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14));
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }

    while (v12);
  }
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end