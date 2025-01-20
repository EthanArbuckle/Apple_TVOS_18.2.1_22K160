@interface SATVExpressTapToSetupView
- (SATVExpressTapToSetupView)initWithFrame:(CGRect)a3;
- (SATVExpressTapToSetupViewDataSource)dataSource;
- (SATVExpressTapToSetupViewDelegate)delegate;
- (TVSKLabel)subtitleLabel;
- (TVSKLabel)titleLabel;
- (UIStackView)cardsStackView;
- (void)_handleCustomizeSetupButton;
- (void)_handleLearnMoreButton;
- (void)_handlePerformExpressSetupButton;
- (void)_populateCardsStackView;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SATVExpressTapToSetupView

- (SATVExpressTapToSetupView)initWithFrame:(CGRect)a3
{
  v69.receiver = self;
  v69.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupView;
  v3 = -[SATVExpressTapToSetupView initWithFrame:]( &v69,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc(&OBJC_CLASS___TVSKLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = -[TVSKLabel initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    -[TVSKLabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v12 = v4->_titleLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewTitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewTitleFont"));
    -[TVSKLabel setFont:](v12, "setFont:", v13);

    v14 = v4->_titleLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
    -[TVSKLabel setTextColor:](v14, "setTextColor:", v15);

    -[TVSKLabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1LL);
    -[TVSKLabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0LL);
    v16 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v16;

    -[TVSKLabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v18 = v4->_subtitleLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
    -[TVSKLabel setFont:](v18, "setFont:", v19);

    v20 = v4->_subtitleLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
    -[TVSKLabel setTextColor:](v20, "setTextColor:", v21);

    -[TVSKLabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1LL);
    -[TVSKLabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0LL);
    v22 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    cardsStackView = v4->_cardsStackView;
    v4->_cardsStackView = v22;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_cardsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v4->_cardsStackView, "setAxis:", 0LL);
    -[UIStackView setSpacing:](v4->_cardsStackView, "setSpacing:", 30.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 addTarget:v4 action:"_handlePerformExpressSetupButton" forControlEvents:0x2000];
    id v25 = sub_10000D7CC(@"CONTINUE_BUTTON", @"Localizable");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    [v24 setTitle:v26 forState:0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v27 addTarget:v4 action:"_handleCustomizeSetupButton" forControlEvents:0x2000];
    id v28 = sub_10000D7CC(@"EXPRESS_SETUP_CUSTOMIZE_SETTING_BUTTON_TITLE", @"Localizable");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v68 = v27;
    [v27 setTitle:v29 forState:0];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v30 addTarget:v4 action:"_handleLearnMoreButton" forControlEvents:0x2000];
    id v31 = sub_10000D7CC(@"EXPRESS_SETUP_LEARN_MORE_BUTTON_TITLE", @"Localizable");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v67 = v30;
    [v30 setTitle:v32 forState:0];

    v33 = objc_alloc(&OBJC_CLASS___UIStackView);
    v72[0] = v24;
    v72[1] = v27;
    v58 = v24;
    v72[2] = v30;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 3LL));
    v35 = -[UIStackView initWithArrangedSubviews:](v33, "initWithArrangedSubviews:", v34);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v35,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v35, "setAxis:", 1LL);
    -[UIStackView setSpacing:](v35, "setSpacing:", 14.0);
    v36 = objc_alloc(&OBJC_CLASS___UIStackView);
    v71[0] = v4->_titleLabel;
    v71[1] = v4->_subtitleLabel;
    v71[2] = v4->_cardsStackView;
    v71[3] = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 4LL));
    v38 = -[UIStackView initWithArrangedSubviews:](v36, "initWithArrangedSubviews:", v37);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v38,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v38, "setAxis:", 1LL);
    -[UIStackView setDistribution:](v38, "setDistribution:", 0LL);
    -[UIStackView setAlignment:](v38, "setAlignment:", 3LL);
    -[UIStackView setSpacing:](v38, "setSpacing:", 0.0);
    -[UIStackView setCustomSpacing:afterView:](v38, "setCustomSpacing:afterView:", v4->_cardsStackView, 60.0);
    -[SATVExpressTapToSetupView addSubview:](v4, "addSubview:", v38);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v38, "centerXAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView centerXAnchor](v4, "centerXAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToAnchor:v65]);
    v70[0] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v38, "centerYAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView centerYAnchor](v4, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
    v70[1] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel widthAnchor](v4->_titleLabel, "widthAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintLessThanOrEqualToConstant:1000.0]);
    v70[2] = v59;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel widthAnchor](v4->_subtitleLabel, "widthAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintLessThanOrEqualToConstant:1000.0]);
    v70[3] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel firstBaselineAnchor](v4->_subtitleLabel, "firstBaselineAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel lastBaselineAnchor](v4->_titleLabel, "lastBaselineAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54 constant:80.0]);
    v70[4] = v53;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_cardsStackView, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel lastBaselineAnchor](v4->_subtitleLabel, "lastBaselineAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50 constant:60.0]);
    v70[5] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v24 heightAnchor]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToConstant:66.0]);
    v70[6] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v27 heightAnchor]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToConstant:66.0]);
    v70[7] = v41;
    v52 = v35;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v35, "widthAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintGreaterThanOrEqualToConstant:440.0]);
    v70[8] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v35, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintLessThanOrEqualToConstant:960.0]);
    v70[9] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 10LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v46);
  }

  return v4;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SATVExpressTapToSetupView _populateCardsStackView](self, "_populateCardsStackView");
    v5 = obj;
  }
}

- (void)_handlePerformExpressSetupButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView delegate](self, "delegate"));
  [v3 expressTapToSetupViewDidSelectPerformExpressSetup:self];
}

- (void)_handleCustomizeSetupButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView delegate](self, "delegate"));
  [v3 expressTapToSetupViewDidSelectCustomizeSetup:self];
}

- (void)_handleLearnMoreButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView delegate](self, "delegate"));
  [v3 expressTapToSetupViewDidSelectLearnMore:self];
}

- (void)_populateCardsStackView
{
  id v26 = (id)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView dataSource](self, "dataSource"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v26 deviceClassForExpressTapToSetupView:self]);
  id v4 = sub_10000D7CC(@"EXPRESS_SETUP_TITLE_FORMAT", @"Localizable");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v25 = (void *)v3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView titleLabel](self, "titleLabel"));
  v24 = (void *)v6;
  [v7 setText:v6];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v26 deviceNameForExpressTapToSetupView:self]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByReplacingOccurrencesOfString:@" " withString:@" "]);
  id v9 = sub_10000D7CC(@"EXPRESS_SETUP_SUBTITLE_FORMAT", @"Localizable");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView subtitleLabel](self, "subtitleLabel"));
  [v12 setText:v11];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView cardsStackView](self, "cardsStackView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrangedSubviews]);
  [v14 makeObjectsPerformSelector:"removeFromSuperview"];

  v15 = (char *)[v26 numberOfSettingItemsForExpressTapToSetupView:self];
  if (v15)
  {
    v16 = v15;
    for (i = 0LL; i != v16; ++i)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v26 expressTapToSetupView:self textForSettingItemAtIndex:i]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v26 expressTapToSetupView:self imageSymbolNameForSettingItemAtIndex:i]);
      v20 = (void *)v19;
      if (v18 && v19)
      {
        v21 = objc_alloc_init(&OBJC_CLASS___SATVExpressTapToSetupCardView);
        -[SATVExpressTapToSetupCardView setTranslatesAutoresizingMaskIntoConstraints:]( v21,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        -[SATVExpressTapToSetupCardView setImageSymbolName:andSymbolSize:]( v21,  "setImageSymbolName:andSymbolSize:",  v20,  [v26 expressTapToSetupView:self imageSymbolScaleForSettingItemAtIndex:i]);
        -[SATVExpressTapToSetupCardView setDescriptionText:](v21, "setDescriptionText:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupView cardsStackView](self, "cardsStackView"));
        [v22 addArrangedSubview:v21];
      }
    }
  }
}

- (SATVExpressTapToSetupViewDataSource)dataSource
{
  return (SATVExpressTapToSetupViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SATVExpressTapToSetupViewDelegate)delegate
{
  return (SATVExpressTapToSetupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSKLabel)titleLabel
{
  return self->_titleLabel;
}

- (TVSKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIStackView)cardsStackView
{
  return self->_cardsStackView;
}

- (void).cxx_destruct
{
}

@end