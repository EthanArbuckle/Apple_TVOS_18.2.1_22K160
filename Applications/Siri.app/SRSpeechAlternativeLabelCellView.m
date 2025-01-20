@interface SRSpeechAlternativeLabelCellView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRSpeechAlternativeLabelCellView)initWithTitle:(id)a3 font:(id)a4;
- (void)layoutSubviews;
@end

@implementation SRSpeechAlternativeLabelCellView

- (SRSpeechAlternativeLabelCellView)initWithTitle:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SRSpeechAlternativeLabelCellView;
  v8 = -[SRSpeechAlternativeLabelCellView init](&v14, "init");
  if (v8)
  {
    v9 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    label = v8->_label;
    v8->_label = v9;

    -[UILabel setFont:](v8->_label, "setFont:", v7);
    v11 = v8->_label;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setText:](v8->_label, "setText:", v6);
    -[UILabel sizeToFit](v8->_label, "sizeToFit");
    -[SRSpeechAlternativeLabelCellView addSubview:](v8, "addSubview:", v8->_label);
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font", a3.width, a3.height));
  [v4 _scaledValueForValue:66.0];
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = -[UILabel frame](self->_label, "frame");
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (SiriLanguageIsRTL(v11, v20))
  {
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.CGFloat width = v8;
    v29.size.height = v10;
    CGFloat v21 = CGRectGetWidth(v29) - SiriUIPlatterStyle[34];
    v30.origin.x = v13;
    v30.origin.y = v15;
    v30.size.CGFloat width = v17;
    v30.size.height = v19;
    double v22 = v21 - CGRectGetWidth(v30);
  }

  else
  {
    double v22 = SiriUIPlatterStyle[32];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  [v23 _scaledValueForValue:42.0];
  double v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  [v26 ascender];
  double v28 = v25 - v27;

  -[UILabel setFrame:](self->_label, "setFrame:", v22, v28, v17, v19);
}

- (void).cxx_destruct
{
}

@end