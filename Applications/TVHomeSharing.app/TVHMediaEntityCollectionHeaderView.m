@interface TVHMediaEntityCollectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)metadataStrings;
- (NSString)subtitle;
- (NSString)title;
- (TVHMediaEntityCollectionHeaderMetadataView)metadataView;
- (TVHMediaEntityCollectionHeaderView)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)_labelWithTextStyle:(unint64_t)a3 fontWeight:(int64_t)a4;
- (void)layoutSubviews;
- (void)setMetadataStrings:(id)a3;
- (void)setMetadataView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVHMediaEntityCollectionHeaderView

- (TVHMediaEntityCollectionHeaderView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionHeaderView;
  v3 = -[TVHMediaEntityCollectionHeaderView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionHeaderView _labelWithTextStyle:fontWeight:]( v3,  "_labelWithTextStyle:fontWeight:",  3LL,  7LL));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v8;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2LL);
    -[TVHMediaEntityCollectionHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView title](self, "title"));
  unsigned __int8 v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView titleLabel](self, "titleLabel"));
    [v6 setText:v7];
    [v6 sizeToFit];
    -[TVHMediaEntityCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView subtitle](self, "subtitle"));
  unsigned __int8 v5 = [v4 isEqualToString:v8];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView subtitleLabel](self, "subtitleLabel"));
    id v7 = v6;
    if (v8)
    {
      if (!v6)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionHeaderView _labelWithTextStyle:fontWeight:]( self,  "_labelWithTextStyle:fontWeight:",  6LL,  0LL));
        -[TVHMediaEntityCollectionHeaderView setSubtitleLabel:](self, "setSubtitleLabel:", v7);
        -[TVHMediaEntityCollectionHeaderView addSubview:](self, "addSubview:", v7);
      }

      objc_msgSend(v7, "setText:");
      [v7 sizeToFit];
      -[TVHMediaEntityCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    }

    else
    {
      [v6 removeFromSuperview];
      -[TVHMediaEntityCollectionHeaderView setSubtitleLabel:](self, "setSubtitleLabel:", 0LL);
    }
  }
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setMetadataStrings:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView metadataStrings](self, "metadataStrings"));
  unsigned __int8 v5 = [v4 isEqualToArray:v8];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (TVHMediaEntityCollectionHeaderMetadataView *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionHeaderView metadataView]( self,  "metadataView"));
    id v7 = [v8 count];
    if (v6)
    {
      if (!v7)
      {
        -[TVHMediaEntityCollectionHeaderMetadataView removeFromSuperview](v6, "removeFromSuperview");
        -[TVHMediaEntityCollectionHeaderView setMetadataView:](self, "setMetadataView:", 0LL);
      }
    }

    else if (v7)
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntityCollectionHeaderMetadataView);
      -[TVHMediaEntityCollectionHeaderView setMetadataView:](self, "setMetadataView:", v6);
      -[TVHMediaEntityCollectionHeaderView addSubview:](self, "addSubview:", v6);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    -[TVHMediaEntityCollectionHeaderMetadataView setMetadataStrings:](v6, "setMetadataStrings:", v8);
    -[TVHMediaEntityCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSArray)metadataStrings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView metadataView](self, "metadataView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metadataStrings]);

  return (NSArray *)v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView titleLabel](self, "titleLabel", a3.width, a3.height));
  objc_msgSend(v5, "sizeThatFits:", width, 1.79769313e308);
  double v7 = v6;

  double v8 = v7 + 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView subtitleLabel](self, "subtitleLabel"));
  if (v9) {
    double v8 = v8 + 46.0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView metadataView](self, "metadataView"));
  objc_super v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "sizeThatFits:", width, 1.79769313e308);
    double v8 = v8 + 20.0 + v12;
  }

  double v13 = width;
  double v14 = v8;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 + -40.0;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v17, "sizeThatFits:", v4, 1.79769313e308);
  double v9 = v8;
  double v10 = 0.0;
  objc_msgSend(v17, "setFrame:", 20.0, 0.0, v7, v8);
  double v11 = v9 + 0.0;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView subtitleLabel](self, "subtitleLabel"));
  double v13 = v12;
  if (v12)
  {
    double v10 = 46.0;
    objc_msgSend(v12, "setFrame:", 20.0, v11, v7, 46.0);
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView metadataView](self, "metadataView"));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "sizeThatFits:", v7, v6);
    objc_msgSend(v15, "setFrame:", 20.0, v11 + v10 + 20.0, v7, v16);
  }
}

- (id)_labelWithTextStyle:(unint64_t)a3 fontWeight:(int64_t)a4
{
  double v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setLineBreakMode:](v7, "setLineBreakMode:", 4LL);
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  a3,  a4));
  -[UILabel setFont:](v7, "setFont:", v8);

  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 1LL);
  -[UILabel setTextAlignment:](v7, "setTextAlignment:", 4LL);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionHeaderView textColor](self, "textColor"));
  -[UILabel setTextColor:](v7, "setTextColor:", v9);

  return v7;
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

- (TVHMediaEntityCollectionHeaderMetadataView)metadataView
{
  return self->_metadataView;
}

- (void)setMetadataView:(id)a3
{
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