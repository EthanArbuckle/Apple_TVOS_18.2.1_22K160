@interface SATVExpressTapToSetupCardView
- (CGSize)intrinsicContentSize;
- (NSString)descriptionText;
- (NSString)imageSymbolName;
- (SATVExpressTapToSetupCardView)initWithFrame:(CGRect)a3;
- (TVSKLabel)descriptionLabel;
- (UIImageView)imageView;
- (UIView)filterBackgroundView;
- (int64_t)imageSymbolScale;
- (void)_updateVisualStyling;
- (void)setDescriptionText:(id)a3;
- (void)setImageSymbolName:(id)a3 andSymbolSize:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SATVExpressTapToSetupCardView

- (SATVExpressTapToSetupCardView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupCardView;
  v7 = -[SATVExpressTapToSetupCardView initWithFrame:](&v57, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView layer](v7, "layer"));
    [v9 setAllowsGroupBlending:0];

    -[SATVExpressTapToSetupCardView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:", 20.0);
    v10 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", x, y, width, height);
    filterBackgroundView = v8->_filterBackgroundView;
    v8->_filterBackgroundView = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v8->_filterBackgroundView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView _setContinuousCornerRadius:](v8->_filterBackgroundView, "_setContinuousCornerRadius:", 20.0);
    -[SATVExpressTapToSetupCardView addSubview:](v8, "addSubview:", v8->_filterBackgroundView);
    v12 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v8->_imageView;
    v8->_imageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v8->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.31,  0.31,  0.31,  1.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.69,  0.69,  0.69,  1.0));
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvsk_dynamicColorWithLightStyleColor:darkStyleColor:",  v14,  v15));

    -[UIImageView setTintColor:](v8->_imageView, "setTintColor:", v56);
    -[SATVExpressTapToSetupCardView addSubview:](v8, "addSubview:", v8->_imageView);
    v16 = objc_alloc_init(&OBJC_CLASS___TVSKLabel);
    descriptionLabel = v8->_descriptionLabel;
    v8->_descriptionLabel = v16;

    -[TVSKLabel setTranslatesAutoresizingMaskIntoConstraints:]( v8->_descriptionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v18 = v8->_descriptionLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_emphasizedFontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_emphasizedFontFromTextStyle:",  UIFontTextStyleCaption1));
    -[TVSKLabel setFont:](v18, "setFont:", v19);

    v20 = v8->_descriptionLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
    -[TVSKLabel setTextColor:](v20, "setTextColor:", v21);

    -[TVSKLabel setTextAlignment:](v8->_descriptionLabel, "setTextAlignment:", 4LL);
    -[TVSKLabel setNumberOfLines:](v8->_descriptionLabel, "setNumberOfLines:", 0LL);
    -[SATVExpressTapToSetupCardView addSubview:](v8, "addSubview:", v8->_descriptionLabel);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView widthAnchor](v8, "widthAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToConstant:310.0]);
    v58[0] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8->_filterBackgroundView, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView leadingAnchor](v8, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v52]);
    v58[1] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8->_filterBackgroundView, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView trailingAnchor](v8, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v49]);
    v58[2] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8->_filterBackgroundView, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView topAnchor](v8, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v46]);
    v58[3] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_filterBackgroundView, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView bottomAnchor](v8, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43]);
    v58[4] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView firstBaselineAnchor](v8->_imageView, "firstBaselineAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView topAnchor](v8, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40 constant:63.0]);
    v58[5] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v8->_imageView, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView leadingAnchor](v8, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v37 constant:22.0]);
    v58[6] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel leadingAnchor](v8->_descriptionLabel, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v8->_imageView, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v34]);
    v58[7] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel trailingAnchor](v8->_descriptionLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView trailingAnchor](v8, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v22 constant:-22.0]);
    v58[8] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel firstBaselineAnchor](v8->_descriptionLabel, "firstBaselineAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView lastBaselineAnchor](v8->_imageView, "lastBaselineAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25 constant:47.0]);
    v58[9] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel lastBaselineAnchor](v8->_descriptionLabel, "lastBaselineAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView bottomAnchor](v8, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintLessThanOrEqualToAnchor:v28 constant:-26.0]);
    v58[10] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 11LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v30);

    -[SATVExpressTapToSetupCardView _updateVisualStyling](v8, "_updateVisualStyling");
  }

  return v8;
}

- (CGSize)intrinsicContentSize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView descriptionLabel](self, "descriptionLabel"));
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  objc_msgSend( v3,  "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:",  266.0,  UILayoutFittingCompressedSize.height,  v4,  v5);
  double v7 = v6;
  [v3 _firstBaselineOffsetFromTop];
  double v9 = 110.0 - v8;
  [v3 _baselineOffsetFromBottom];
  -[SATVExpressTapToSetupCardView sizeThatFits:](self, "sizeThatFits:", 310.0, v7 + v9 + 26.0 - v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView descriptionLabel](self, "descriptionLabel"));
  [v5 setText:v4];
}

- (NSString)descriptionText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView descriptionLabel](self, "descriptionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setImageSymbolName:(id)a3 andSymbolSize:(int64_t)a4
{
  double v6 = (NSString *)[a3 copy];
  imageSymbolName = self->_imageSymbolName;
  self->_imageSymbolName = v6;

  self->_imageSymbolScale = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", self->_imageSymbolName));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView imageView](self, "imageView"));
  [v8 setImage:v11];
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_emphasizedFontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_emphasizedFontFromTextStyle:",  UIFontTextStyleSubtitle1));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v9,  self->_imageSymbolScale));
  [v8 setPreferredSymbolConfiguration:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupCardView;
  -[SATVExpressTapToSetupCardView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  if (v6 && [v4 userInterfaceStyle] != v6) {
    -[SATVExpressTapToSetupCardView _updateVisualStyling](self, "_updateVisualStyling");
  }
}

- (void)_updateVisualStyling
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupCardView traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  double v5 = 0.0;
  if (v4 == (id)2)
  {
    double v5 = 1.0;
    id v6 = (id *)&kCAFilterPlusL;
  }

  else
  {
    id v6 = (id *)&kCAFilterPlusD;
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v5, 0.1));
  id v8 = *v6;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_filterBackgroundView, "layer"));
  id v10 = v7;
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));
  [v9 setCompositingFilter:v8];
}

- (NSString)imageSymbolName
{
  return self->_imageSymbolName;
}

- (int64_t)imageSymbolScale
{
  return self->_imageSymbolScale;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (TVSKLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIView)filterBackgroundView
{
  return self->_filterBackgroundView;
}

- (void).cxx_destruct
{
}

@end