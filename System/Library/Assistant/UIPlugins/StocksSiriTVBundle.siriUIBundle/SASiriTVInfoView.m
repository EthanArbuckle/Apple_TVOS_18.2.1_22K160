@interface SASiriTVInfoView
- (SASiriTVInfoView)initWithFrame:(CGRect)a3;
- (Stock)stock;
- (UILabel)averageVolLabel;
- (UILabel)fiftyTwoWeeksHighLabel;
- (UILabel)fiftyTwoWeeksLowLabel;
- (UILabel)highLabel;
- (UILabel)lowLabel;
- (UILabel)marketCapLabel;
- (UILabel)openLabel;
- (UILabel)pOverELabel;
- (UILabel)volLabel;
- (UILabel)yieldLabel;
- (UIVisualEffectView)effectView;
- (id)attributedStringForTitle:(id)a3 value:(id)a4;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)setAverageVolLabel:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFiftyTwoWeeksHighLabel:(id)a3;
- (void)setFiftyTwoWeeksLowLabel:(id)a3;
- (void)setHighLabel:(id)a3;
- (void)setLowLabel:(id)a3;
- (void)setMarketCapLabel:(id)a3;
- (void)setOpenLabel:(id)a3;
- (void)setPOverELabel:(id)a3;
- (void)setStock:(id)a3;
- (void)setVolLabel:(id)a3;
- (void)setYieldLabel:(id)a3;
@end

@implementation SASiriTVInfoView

- (SASiriTVInfoView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SASiriTVInfoView;
  v3 = -[SASiriTVInfoView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    -[SASiriTVInfoView _createSubviews](v4, "_createSubviews");
    -[SASiriTVInfoView _createConstraints](v4, "_createConstraints");
  }

  return v4;
}

- (void)setStock:(id)a3
{
  id v4 = a3;
  id v72 = (id)objc_claimAutoreleasedReturnValue(+[StockDataFormatter sharedDataFormatter](&OBJC_CLASS___StockDataFormatter, "sharedDataFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 siriUILocalizedStringForKey:@"openTitleLabel" table:@"Localizable"]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 open]);
  [v7 floatValue];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v8 withPrecision:2 useGroupSeparator:1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v6, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView openLabel](self, "openLabel"));
  [v11 setAttributedText:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 siriUILocalizedStringForKey:@"highTitleLabel" table:@"Localizable"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 high]);
  [v14 floatValue];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v15 withPrecision:2 useGroupSeparator:1]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v13, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView highLabel](self, "highLabel"));
  [v18 setAttributedText:v17];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 siriUILocalizedStringForKey:@"lowTitleLabel" table:@"Localizable"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 low]);
  [v21 floatValue];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v22 withPrecision:2 useGroupSeparator:1]);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v20, v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView lowLabel](self, "lowLabel"));
  [v25 setAttributedText:v24];

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 siriUILocalizedStringForKey:@"volumeTitleLabel" table:@"Localizable"]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 volume]);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[Stock localizedMagnitudeAbbreviatedStringWithString:]( &OBJC_CLASS___Stock,  "localizedMagnitudeAbbreviatedStringWithString:",  v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v27, v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView volLabel](self, "volLabel"));
  [v31 setAttributedText:v30];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 siriUILocalizedStringForKey:@"priceEarningsTitleLabel" table:@"Localizable"]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 peRatio]);
  [v34 floatValue];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v35 withPrecision:2 useGroupSeparator:1]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v33, v36));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView pOverELabel](self, "pOverELabel"));
  [v38 setAttributedText:v37];

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v40 = (void *)objc_claimAutoreleasedReturnValue( [v39 siriUILocalizedStringForKey:@"marketCapTitleLabel" table:@"Localizable"]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v4 marketcap]);
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[Stock localizedMagnitudeAbbreviatedStringWithString:]( &OBJC_CLASS___Stock,  "localizedMagnitudeAbbreviatedStringWithString:",  v41));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v40, v42));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView marketCapLabel](self, "marketCapLabel"));
  [v44 setAttributedText:v43];

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v46 = (void *)objc_claimAutoreleasedReturnValue( [v45 siriUILocalizedStringForKey:@"high52WeekTitleLabel" table:@"Localizable"]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v4 yearHigh]);
  [v47 floatValue];
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v48 withPrecision:2 useGroupSeparator:1]);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v46, v49));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView fiftyTwoWeeksHighLabel](self, "fiftyTwoWeeksHighLabel"));
  [v51 setAttributedText:v50];

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v53 = (void *)objc_claimAutoreleasedReturnValue( [v52 siriUILocalizedStringForKey:@"low52WeekTitleLabel" table:@"Localizable"]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v4 yearLow]);
  [v54 floatValue];
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v55 withPrecision:2 useGroupSeparator:1]);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v53, v56));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView fiftyTwoWeeksLowLabel](self, "fiftyTwoWeeksLowLabel"));
  [v58 setAttributedText:v57];

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v60 = (void *)objc_claimAutoreleasedReturnValue( [v59 siriUILocalizedStringForKey:@"averageVolumeTitleLabel" table:@"Localizable"]);
  v61 = (void *)objc_claimAutoreleasedReturnValue([v4 averageVolume]);
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[Stock localizedMagnitudeAbbreviatedStringWithString:]( &OBJC_CLASS___Stock,  "localizedMagnitudeAbbreviatedStringWithString:",  v61));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v60, v62));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView averageVolLabel](self, "averageVolLabel"));
  [v64 setAttributedText:v63];

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[StocksBundles getBundle:](&OBJC_CLASS___StocksBundles, "getBundle:", 1LL));
  v66 = (void *)objc_claimAutoreleasedReturnValue( [v65 siriUILocalizedStringForKey:@"yieldTitleLabel" table:@"Localizable"]);
  v67 = (void *)objc_claimAutoreleasedReturnValue([v4 dividendYield]);

  [v67 floatValue];
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v72 formattedNumber:v68 withPrecision:2 useGroupSeparator:1]);
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView attributedStringForTitle:value:](self, "attributedStringForTitle:value:", v66, v69));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView yieldLabel](self, "yieldLabel"));
  [v71 setAttributedText:v70];
}

- (void)_createSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  id v35 = (id)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v3));

  id v4 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v35);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[SASiriTVInfoView addSubview:](self, "addSubview:", v4);
  -[SASiriTVInfoView setEffectView:](self, "setEffectView:", v4);
  Label = createLabel();
  v34 = (void *)objc_claimAutoreleasedReturnValue(Label);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v6 addSubview:v34];

  -[SASiriTVInfoView setOpenLabel:](self, "setOpenLabel:", v34);
  objc_super v7 = createLabel();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v8 addSubview:v33];

  -[SASiriTVInfoView setHighLabel:](self, "setHighLabel:", v33);
  v9 = createLabel();
  v32 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v10 addSubview:v32];

  -[SASiriTVInfoView setLowLabel:](self, "setLowLabel:", v32);
  v11 = createLabel();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v13 addSubview:v12];

  -[SASiriTVInfoView setVolLabel:](self, "setVolLabel:", v12);
  v14 = createLabel();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v16 addSubview:v15];

  -[SASiriTVInfoView setPOverELabel:](self, "setPOverELabel:", v15);
  v17 = createLabel();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v19 addSubview:v18];

  -[SASiriTVInfoView setMarketCapLabel:](self, "setMarketCapLabel:", v18);
  v20 = createLabel();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v22 addSubview:v21];

  -[SASiriTVInfoView setFiftyTwoWeeksHighLabel:](self, "setFiftyTwoWeeksHighLabel:", v21);
  v23 = createLabel();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v25 addSubview:v24];

  -[SASiriTVInfoView setFiftyTwoWeeksLowLabel:](self, "setFiftyTwoWeeksLowLabel:", v24);
  v26 = createLabel();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v28 addSubview:v27];

  -[SASiriTVInfoView setAverageVolLabel:](self, "setAverageVolLabel:", v27);
  v29 = createLabel();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v31 addSubview:v30];

  -[SASiriTVInfoView setYieldLabel:](self, "setYieldLabel:", v30);
}

- (void)_createConstraints
{
  v29 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView effectView](self, "effectView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  5LL,  0LL,  self,  5LL,  1.0,  0.0));
  [v29 addObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView effectView](self, "effectView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  6LL,  0LL,  self,  6LL,  1.0,  0.0));
  [v29 addObject:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView effectView](self, "effectView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  3LL,  0LL,  self,  3LL,  1.0,  0.0));
  [v29 addObject:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView effectView](self, "effectView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  4LL,  0LL,  self,  4LL,  1.0,  0.0));
  [v29 addObject:v10];

  p_openLabel = &self->_openLabel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openLabel);
  id v26 = objc_loadWeakRetained((id *)&self->_highLabel);
  id v11 = objc_loadWeakRetained((id *)&self->_lowLabel);
  id v12 = objc_loadWeakRetained((id *)&self->_volLabel);
  id v13 = objc_loadWeakRetained((id *)&self->_pOverELabel);
  id v14 = objc_loadWeakRetained((id *)&self->_marketCapLabel);
  id v15 = objc_loadWeakRetained((id *)&self->_fiftyTwoWeeksHighLabel);
  id v16 = objc_loadWeakRetained((id *)&self->_fiftyTwoWeeksLowLabel);
  id v17 = objc_loadWeakRetained((id *)&self->_averageVolLabel);
  id v18 = objc_loadWeakRetained((id *)&self->_yieldLabel);
  v19 = _NSDictionaryOfVariableBindings( @"_openLabel, _highLabel,_lowLabel, _volLabel, _pOverELabel, _marketCapLabel, _fiftyTwoWeeksHighLabel, _fiftyTw oWeeksLowLabel, _averageVolLabel, _yieldLabel",  WeakRetained,  v26,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"|-(8)-[_openLabel]-(spacing)-[_highLabel]-(spacing)-[_lowLabel]-(spacing)-[_volLabel]-(spacing)-[_pOverELabel]-(spacing)-[_marketCapLabel]-(spacing)-[_fiftyTwoWeeksHighLabel]-(spacing)-[_fiftyTwoWeeksLowLabel]-(spacing)-[_averageVolLabel]-(spacing)-[_yieldLabel]-(8)-|",  8LL,  &off_10838,  v20));
  [v29 addObjectsFromArray:v21];

  id v22 = objc_loadWeakRetained((id *)p_openLabel);
  v23 = _NSDictionaryOfVariableBindings(@"_openLabel", v22, 0LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"V:|-[_openLabel]-|",  0LL,  0LL,  v24));
  [v29 addObjectsFromArray:v25];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);
}

- (id)attributedStringForTitle:(id)a3 value:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v5, a4));
  objc_super v7 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  NSAttributedStringKey v16 = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_caption2Font](&OBJC_CLASS___UIFont, "siritvui_caption2Font"));
  id v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  v10 = -[NSMutableAttributedString initWithString:attributes:](v7, "initWithString:attributes:", v6, v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:", 23.0));
  id v12 = [v6 rangeOfString:v5];
  uint64_t v14 = v13;

  -[NSMutableAttributedString addAttribute:value:range:]( v10,  "addAttribute:value:range:",  NSFontAttributeName,  v11,  v12,  v14);
  return v10;
}

- (Stock)stock
{
  return self->_stock;
}

- (UIVisualEffectView)effectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
}

- (UILabel)openLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_openLabel);
}

- (void)setOpenLabel:(id)a3
{
}

- (UILabel)highLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_highLabel);
}

- (void)setHighLabel:(id)a3
{
}

- (UILabel)lowLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_lowLabel);
}

- (void)setLowLabel:(id)a3
{
}

- (UILabel)volLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_volLabel);
}

- (void)setVolLabel:(id)a3
{
}

- (UILabel)pOverELabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pOverELabel);
}

- (void)setPOverELabel:(id)a3
{
}

- (UILabel)marketCapLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_marketCapLabel);
}

- (void)setMarketCapLabel:(id)a3
{
}

- (UILabel)fiftyTwoWeeksHighLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_fiftyTwoWeeksHighLabel);
}

- (void)setFiftyTwoWeeksHighLabel:(id)a3
{
}

- (UILabel)fiftyTwoWeeksLowLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_fiftyTwoWeeksLowLabel);
}

- (void)setFiftyTwoWeeksLowLabel:(id)a3
{
}

- (UILabel)averageVolLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_averageVolLabel);
}

- (void)setAverageVolLabel:(id)a3
{
}

- (UILabel)yieldLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_yieldLabel);
}

- (void)setYieldLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end