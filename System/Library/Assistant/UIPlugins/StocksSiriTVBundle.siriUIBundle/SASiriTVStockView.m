@interface SASiriTVStockView
- (BOOL)isComparison;
- (CGSize)intrinsicContentSize;
- (NSArray)layoutConstraints;
- (SASiriTVStockView)initWithStock:(id)a3 comparison:(BOOL)a4;
- (Stock)stock;
- (UILabel)bigLabel;
- (UILabel)bottomLabel;
- (UILabel)percentChangeLabel;
- (UILabel)priceChangeLabel;
- (UILabel)priceLabel;
- (UILabel)symbolLabel;
- (UILabel)topLabel;
- (UIVisualEffectView)effectView;
- (void)_createConstraints;
- (void)_createLabels;
- (void)_updateLabels;
- (void)setBigLabel:(id)a3;
- (void)setBottomLabel:(id)a3;
- (void)setComparison:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setPercentChangeLabel:(id)a3;
- (void)setPriceChangeLabel:(id)a3;
- (void)setPriceLabel:(id)a3;
- (void)setStock:(id)a3;
- (void)setSymbolLabel:(id)a3;
- (void)setTopLabel:(id)a3;
@end

@implementation SASiriTVStockView

- (CGSize)intrinsicContentSize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView symbolLabel](self, "symbolLabel"));
  [v3 intrinsicContentSize];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView symbolLabel](self, "symbolLabel"));
  [v6 intrinsicContentSize];
  double v8 = v7 + 8.0 + 20.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView bigLabel](self, "bigLabel"));
  [v9 intrinsicContentSize];
  double v11 = v8 + v10 + 15.0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView topLabel](self, "topLabel"));
  [v12 intrinsicContentSize];
  double v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView bottomLabel](self, "bottomLabel"));
  [v15 intrinsicContentSize];
  double v17 = v16;

  if (v14 >= v17) {
    double v18 = v14;
  }
  else {
    double v18 = v17;
  }
  double v19 = v11 + v18 + 8.0;

  double v20 = v19;
  double v21 = v5;
  result.height = v21;
  result.width = v20;
  return result;
}

- (SASiriTVStockView)initWithStock:(id)a3 comparison:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SASiriTVStockView;
  double v8 = -[SASiriTVStockView init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView layer](v8, "layer"));
    [v10 setAllowsGroupBlending:0];

    -[SASiriTVStockView _createLabels](v9, "_createLabels");
    v9->_comparison = a4;
    objc_storeStrong((id *)&v9->_stock, a3);
    -[SASiriTVStockView _updateLabels](v9, "_updateLabels");
  }

  return v9;
}

- (void)setStock:(id)a3
{
}

- (void)setComparison:(BOOL)a3
{
  self->_comparison = a3;
  -[SASiriTVStockView _updateLabels](self, "_updateLabels");
}

- (void)_updateLabels
{
  if (-[SASiriTVStockView isComparison](self, "isComparison"))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView percentChangeLabel](self, "percentChangeLabel"));
    -[SASiriTVStockView setBigLabel:](self, "setBigLabel:", v4);

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceChangeLabel](self, "priceChangeLabel"));
    -[SASiriTVStockView setTopLabel:](self, "setTopLabel:", v5);

    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceLabel](self, "priceLabel"));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceLabel](self, "priceLabel"));
    -[SASiriTVStockView setBigLabel:](self, "setBigLabel:", v7);

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView percentChangeLabel](self, "percentChangeLabel"));
    -[SASiriTVStockView setTopLabel:](self, "setTopLabel:", v8);

    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceChangeLabel](self, "priceChangeLabel"));
  }

  v9 = (void *)v6;
  -[SASiriTVStockView setBottomLabel:](self, "setBottomLabel:", v6);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _lightSystemFontOfSize:](&OBJC_CLASS___UIFont, "_lightSystemFontOfSize:", 79.0));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView bigLabel](self, "bigLabel"));
  [v11 setFont:v10];

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView topLabel](self, "topLabel"));
  [v13 setFont:v12];

  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView bottomLabel](self, "bottomLabel"));
  [v15 setFont:v14];

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 listName]);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView symbolLabel](self, "symbolLabel"));
  [v18 setText:v17];

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 price]);
  id v21 = [v20 length];
  if (v21)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v2 formattedPrice]);
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[Stock BlankValueString](&OBJC_CLASS___Stock, "BlankValueString"));
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceLabel](self, "priceLabel"));
  [v23 setText:v22];

  if (v21)
  {

    v22 = v2;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
  unsigned int v25 = [v24 changeIsNegative];
  v26 = @"+";
  if (v25) {
    v26 = @"-";
  }
  v27 = v26;

  if (-[SASiriTVStockView isComparison](self, "isComparison"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 formattedChangePercent:0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v29));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceChangeLabel](self, "priceChangeLabel"));
    [v31 setText:v30];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 formattedChangePercent:1]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v27, "stringByAppendingString:", v33));
  }

  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 formattedChangePercent:0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v27, "stringByAppendingString:", v36));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceChangeLabel](self, "priceChangeLabel"));
    [v38 setText:v37];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 formattedChangePercent:1]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v33));
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView percentChangeLabel](self, "percentChangeLabel"));
  [v39 setText:v34];

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[StocksPreferences sharedPreferences](&OBJC_CLASS___StocksPreferences, "sharedPreferences"));
  unsigned __int8 v41 = [v40 isChangeColorSwapped];

  if ((v41 & 1) != 0)
  {
    id v53 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkRedColor](&OBJC_CLASS___UIColor, "systemDarkRedColor"));
    uint64_t v42 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGreenColor](&OBJC_CLASS___UIColor, "systemDarkGreenColor"));
  }

  else
  {
    id v53 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGreenColor](&OBJC_CLASS___UIColor, "systemDarkGreenColor"));
    uint64_t v42 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkRedColor](&OBJC_CLASS___UIColor, "systemDarkRedColor"));
  }

  v43 = (void *)v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView stock](self, "stock"));
  else {
    v45 = v53;
  }
  id v46 = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceLabel](self, "priceLabel"));
  [v47 setTextColor:v46];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceChangeLabel](self, "priceChangeLabel"));
  [v48 setTextColor:v46];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView percentChangeLabel](self, "percentChangeLabel"));
  [v49 setTextColor:v46];

  if (-[SASiriTVStockView isComparison](self, "isComparison"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView effectView](self, "effectView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 contentView]);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceLabel](self, "priceLabel"));
    [v51 addSubview:v52];
  }

  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView priceLabel](self, "priceLabel"));
    -[SASiriTVStockView addSubview:](self, "addSubview:", v50);
  }

  -[SASiriTVStockView _createConstraints](self, "_createConstraints");
}

- (void)_createLabels
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v3));

  double v4 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v15);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[SASiriTVStockView addSubview:](self, "addSubview:", v4);
  -[SASiriTVStockView setEffectView:](self, "setEffectView:", v4);
  double v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _lightSystemFontOfSize:](&OBJC_CLASS___UIFont, "_lightSystemFontOfSize:", 79.0));
  -[UILabel setFont:](v5, "setFont:", v7);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v8 addSubview:v5];

  -[SASiriTVStockView setSymbolLabel:](self, "setSymbolLabel:", v5);
  v9 = objc_alloc_init(&OBJC_CLASS___UILabel);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[SASiriTVStockView addSubview:](self, "addSubview:", v9);
  -[SASiriTVStockView setPriceLabel:](self, "setPriceLabel:", v9);
  double v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[SASiriTVStockView addSubview:](self, "addSubview:", v11);
  -[SASiriTVStockView setPriceChangeLabel:](self, "setPriceChangeLabel:", v11);
  double v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[SASiriTVStockView addSubview:](self, "addSubview:", v13);
  -[SASiriTVStockView setPercentChangeLabel:](self, "setPercentChangeLabel:", v13);
}

- (void)_createConstraints
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v3);

  id v40 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView effectView](self, "effectView"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  5LL,  0LL,  self,  5LL,  1.0,  0.0));
  [v40 addObject:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView effectView](self, "effectView"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  6LL,  0LL,  self,  6LL,  1.0,  0.0));
  [v40 addObject:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView effectView](self, "effectView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  3LL,  0LL,  self,  3LL,  1.0,  0.0));
  [v40 addObject:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView effectView](self, "effectView"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  4LL,  0LL,  self,  4LL,  1.0,  0.0));
  [v40 addObject:v12];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView symbolLabel](self, "symbolLabel"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 topAnchor]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView topAnchor](self, "topAnchor"));
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToSystemSpacingBelowAnchor:v15 multiplier:1.0]);
  [v40 addObject:v16];

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView bottomAnchor](self, "bottomAnchor"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVStockView symbolLabel](self, "symbolLabel"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bottomAnchor]);
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToSystemSpacingBelowAnchor:v19 multiplier:1.0]);
  [v40 addObject:v20];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_symbolLabel);
  id v22 = objc_loadWeakRetained((id *)&self->_bigLabel);
  id v23 = objc_loadWeakRetained((id *)&self->_topLabel);
  v24 = _NSDictionaryOfVariableBindings(@"_symbolLabel, _bigLabel, _topLabel", WeakRetained, v22, v23, 0LL);
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:|-[_symbolLabel]-(20)-[_bigLabel]-(15@700)-[_topLabel]-(>=0)-|",  0LL,  0LL,  v25));
  [v40 addObjectsFromArray:v26];

  id v27 = objc_loadWeakRetained((id *)&self->_bigLabel);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v27,  3LL,  0LL,  self,  3LL,  1.0,  0.0));
  [v40 addObject:v28];

  id v29 = objc_loadWeakRetained((id *)&self->_topLabel);
  id v30 = objc_loadWeakRetained((id *)&self->_bigLabel);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v29,  3LL,  0LL,  v30,  3LL,  1.0,  13.0));
  [v40 addObject:v31];

  id v32 = objc_loadWeakRetained((id *)&self->_topLabel);
  id v33 = objc_loadWeakRetained((id *)&self->_bottomLabel);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v32,  5LL,  0LL,  v33,  5LL,  1.0,  0.0));
  [v40 addObject:v34];

  id v35 = objc_loadWeakRetained((id *)&self->_bigLabel);
  id v36 = objc_loadWeakRetained((id *)&self->_bottomLabel);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v35,  11LL,  0LL,  v36,  11LL,  1.0,  0.0));
  [v40 addObject:v37];

  id v38 = objc_loadWeakRetained((id *)&self->_bottomLabel);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v38,  6LL,  -1LL,  self,  6LL,  1.0,  0.0));
  [v40 addObject:v39];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v40);
  -[SASiriTVStockView setLayoutConstraints:](self, "setLayoutConstraints:", v40);
}

- (Stock)stock
{
  return self->_stock;
}

- (BOOL)isComparison
{
  return self->_comparison;
}

- (UIVisualEffectView)effectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
}

- (UILabel)symbolLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_symbolLabel);
}

- (void)setSymbolLabel:(id)a3
{
}

- (UILabel)priceLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_priceLabel);
}

- (void)setPriceLabel:(id)a3
{
}

- (UILabel)priceChangeLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_priceChangeLabel);
}

- (void)setPriceChangeLabel:(id)a3
{
}

- (UILabel)percentChangeLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_percentChangeLabel);
}

- (void)setPercentChangeLabel:(id)a3
{
}

- (UILabel)bigLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_bigLabel);
}

- (void)setBigLabel:(id)a3
{
}

- (UILabel)topLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_topLabel);
}

- (void)setTopLabel:(id)a3
{
}

- (UILabel)bottomLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_bottomLabel);
}

- (void)setBottomLabel:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end