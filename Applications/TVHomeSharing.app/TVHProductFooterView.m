@interface TVHProductFooterView
+ (double)_longestLabelWidthInViews:(id)a3;
+ (id)_labelWithText:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)items;
- (TVHProductFooterView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (UIStackView)namesStackView;
- (UIStackView)valuesStackView;
- (void)setItems:(id)a3;
- (void)setNamesStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValuesStackView:(id)a3;
@end

@implementation TVHProductFooterView

- (TVHProductFooterView)initWithFrame:(CGRect)a3
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___TVHProductFooterView;
  v3 = -[TVHProductFooterView initWithFrame:]( &v54,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4LL);
    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  8LL,  7LL));
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4LL);
    v8 = v3->_titleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_70PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_70PercentBlackColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_70PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_70PercentWhiteColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v9,  v10));
    -[UILabel setTextColor:](v8, "setTextColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"INFORMATION_TITLE" value:0 table:0]);

    -[UILabel setText:](v3->_titleLabel, "setText:", v53);
    -[TVHProductFooterView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v13 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    namesStackView = v3->_namesStackView;
    v3->_namesStackView = v13;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_namesStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v3->_namesStackView, "setAxis:", 1LL);
    -[UIStackView setSpacing:](v3->_namesStackView, "setSpacing:", 0.0);
    -[UIStackView setDistribution:](v3->_namesStackView, "setDistribution:", 1LL);
    -[UIStackView setAlignment:](v3->_namesStackView, "setAlignment:", 0LL);
    -[TVHProductFooterView addSubview:](v3, "addSubview:", v3->_namesStackView);
    v15 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    valuesStackView = v3->_valuesStackView;
    v3->_valuesStackView = v15;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_valuesStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v3->_valuesStackView, "setAxis:", 1LL);
    -[UIStackView setSpacing:](v3->_valuesStackView, "setSpacing:", 0.0);
    -[UIStackView setDistribution:](v3->_valuesStackView, "setDistribution:", 1LL);
    -[UIStackView setAlignment:](v3->_valuesStackView, "setAlignment:", 0LL);
    -[TVHProductFooterView addSubview:](v3, "addSubview:", v3->_valuesStackView);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView leadingAnchor](v3, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51 constant:242.0]);
    v55[0] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView trailingAnchor](v3, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v48 constant:-242.0]);
    v55[1] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v3->_titleLabel, "heightAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToConstant:46.0]);
    v55[2] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView topAnchor](v3, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43]);
    v55[3] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_namesStackView, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView leadingAnchor](v3, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40 constant:90.0]);
    v55[4] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v3->_namesStackView, "widthAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintGreaterThanOrEqualToConstant:140.0]);
    v55[5] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_namesStackView, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v35 constant:23.0]);
    v55[6] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_namesStackView, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView bottomAnchor](v3, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v32]);
    v55[7] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_valuesStackView, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_namesStackView, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v29 constant:38.0]);
    v55[8] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_valuesStackView, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView trailingAnchor](v3, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v17 constant:-90.0]);
    v55[9] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_valuesStackView, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_namesStackView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);
    v55[10] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_valuesStackView, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView bottomAnchor](v3, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);
    v55[11] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 12LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v25);
  }

  return v3;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_items, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)[v4 copy];
    items = self->_items;
    self->_items = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView namesStackView](self, "namesStackView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subviews]);
    [v8 makeObjectsPerformSelector:"removeFromSuperview"];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView valuesStackView](self, "valuesStackView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subviews]);
    [v10 makeObjectsPerformSelector:"removeFromSuperview"];

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v24 = v4;
    id obj = v4;
    id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v14);
          v16 = (void *)objc_opt_class(self);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 _labelWithText:v17]);

          LODWORD(v19) = 1144750080;
          [v18 setContentHuggingPriority:0 forAxis:v19];
          LODWORD(v20) = 1148846080;
          [v18 setContentCompressionResistancePriority:0 forAxis:v20];
          [v7 addArrangedSubview:v18];
          v21 = (void *)objc_opt_class(self);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v21 _labelWithText:v22]);

          [v9 addArrangedSubview:v23];
          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v12);
    }

    id v4 = v24;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView titleLabel](self, "titleLabel", a3.width, a3.height));
  double v5 = 46.0;
  objc_msgSend(v4, "sizeThatFits:", 1.79769313e308, 46.0);
  double v7 = v6;

  double v8 = v7 + 242.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView items](self, "items"));
  id v10 = [v9 count];
  if (v10)
  {
    id v11 = v10;
    id v12 = (void *)objc_opt_class(self);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView namesStackView](self, "namesStackView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrangedSubviews]);
    [v12 _longestLabelWidthInViews:v14];
    double v16 = v15;

    v17 = (void *)objc_opt_class(self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductFooterView valuesStackView](self, "valuesStackView"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 arrangedSubviews]);
    [v17 _longestLabelWidthInViews:v19];
    double v21 = v20;

    double v5 = (double)(unint64_t)(28LL * (void)v11) + 69.0;
    double v8 = v8 + v16 + 38.0 + v21;
  }

  double v22 = v8;
  double v23 = v5;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (id)_labelWithText:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setLineBreakMode:](v4, "setLineBreakMode:", 4LL);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 17LL));
  -[UILabel setFont:](v4, "setFont:", v5);

  -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 1LL);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_70PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_70PercentBlackColor"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_70PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_70PercentWhiteColor"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v6,  v7));
  -[UILabel setTextColor:](v4, "setTextColor:", v8);

  -[UILabel setText:](v4, "setText:", v3);
  -[UILabel sizeToFit](v4, "sizeToFit");
  return v4;
}

+ (double)_longestLabelWidthInViews:(id)a3
{
  id v3 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    double v7 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___UILabel);
        id v11 = v9;
        id v12 = v11;
        if (v10)
        {
          if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0LL;
          }
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        id v14 = v13;

        [v14 frame];
        if (v15 > v7)
        {
          [v14 frame];
          double v7 = v16;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v5);
  }

  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (NSArray)items
{
  return self->_items;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIStackView)namesStackView
{
  return self->_namesStackView;
}

- (void)setNamesStackView:(id)a3
{
}

- (UIStackView)valuesStackView
{
  return self->_valuesStackView;
}

- (void)setValuesStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end