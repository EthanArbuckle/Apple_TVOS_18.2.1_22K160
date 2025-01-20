@interface SATVFooterView
- (SATVFooterView)initWithFrame:(CGRect)a3;
- (TVSKLabel)footnoteLabel;
- (void)layoutSubviews;
- (void)setFooterAttributedString:(id)a3;
- (void)setFootnoteText:(id)a3;
@end

@implementation SATVFooterView

- (SATVFooterView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVFooterView;
  v3 = -[SATVFooterView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc_init(&OBJC_CLASS___TVSKLabel);
    footnoteLabel = v4->_footnoteLabel;
    v4->_footnoteLabel = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
    -[TVSKLabel setTextColor:](v4->_footnoteLabel, "setTextColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    -[TVSKLabel setFont:](v4->_footnoteLabel, "setFont:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVSKLabel setBackgroundColor:](v4->_footnoteLabel, "setBackgroundColor:", v10);

    -[TVSKLabel setNumberOfLines:](v4->_footnoteLabel, "setNumberOfLines:", 0LL);
    -[TVSKLabel setTextAlignment:](v4->_footnoteLabel, "setTextAlignment:", 1LL);
    -[SATVFooterView addSubview:](v4, "addSubview:", v4->_footnoteLabel);
  }

  return v4;
}

- (void)setFooterAttributedString:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView footnoteLabel](self, "footnoteLabel"));
  [v5 setAttributedText:v4];

  -[SATVFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFootnoteText:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView footnoteLabel](self, "footnoteLabel"));
  [v5 setText:v4];

  -[SATVFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___SATVFooterView;
  -[SATVFooterView layoutSubviews](&v43, "layoutSubviews");
  -[SATVFooterView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView footnoteLabel](self, "footnoteLabel"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attributedText]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView footnoteLabel](self, "footnoteLabel"));
  v14 = v13;
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 attributedText]);
    objc_msgSend(v15, "boundingRectWithSize:options:context:", 8, 0, 1.79769313e308, 1.79769313e308);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    -[SATVFooterView bounds](self, "bounds");
    double v23 = UIRectCenteredXInRect(v17, v19 + 60.0, v22, v21 + 10.0, v4, v6, v8, v10);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
  }

  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v13 text]);
    v46.origin.x = v4;
    v46.origin.y = v6;
    v46.size.width = v8;
    v46.size.height = v10;
    double Width = CGRectGetWidth(v46);
    NSAttributedStringKey v44 = NSFontAttributeName;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView footnoteLabel](self, "footnoteLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 font]);
    v45 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    objc_msgSend(v30, "boundingRectWithSize:options:attributes:context:", 33, v34, 0, Width, 1.79769313e308);
    double v23 = UIRectCenteredXInRect(v35, v36, v37, v38, v4, v6, v8, v10);
    double v25 = v39;
    double v27 = v40;
    double v29 = v41;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFooterView footnoteLabel](self, "footnoteLabel"));
  objc_msgSend(v42, "setFrame:", v23, v25, v27, v29);
}

- (TVSKLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void).cxx_destruct
{
}

@end