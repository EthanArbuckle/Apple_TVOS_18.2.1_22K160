@interface WTVDailyForecastCell
- (SAWeatherDailyForecast)dailyForecast;
- (UIImageView)conditionIconView;
- (UILabel)dayNameLabel;
- (UILabel)highTemperatureLabel;
- (UILabel)lowTemperatureLabel;
- (UIView)temperatureContainer;
- (WTVDailyForecastCell)initWithFrame:(CGRect)a3;
- (WTVUnitDelegate)unitDelegate;
- (unint64_t)textStyle;
- (void)_updateTextStyles;
- (void)_updateUI;
- (void)prepareForReuse;
- (void)setConditionIconView:(id)a3;
- (void)setDailyForecast:(id)a3;
- (void)setDayNameLabel:(id)a3;
- (void)setHighTemperatureLabel:(id)a3;
- (void)setLowTemperatureLabel:(id)a3;
- (void)setTemperatureContainer:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setUnitDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WTVDailyForecastCell

- (WTVDailyForecastCell)initWithFrame:(CGRect)a3
{
  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___WTVDailyForecastCell;
  v3 = -[WTVDailyForecastCell initWithFrame:]( &v77,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVDailyForecastCell setDayNameLabel:](v4, "setDayNameLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    [v7 setAdjustsFontSizeToFitWidth:1];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    [v8 setTextAlignment:1];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    [v10 setFont:v9];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    [v12 setBackgroundColor:v11];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    -[WTVDailyForecastCell addSubview:](v4, "addSubview:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v15,  3LL,  0LL,  v4,  3LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  5LL,  0LL,  v4,  5LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v19,  6LL,  0LL,  v4,  6LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v20);

    v21 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[WTVDailyForecastCell setConditionIconView:](v4, "setConditionIconView:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](v4, "conditionIconView"));
    -[WTVDailyForecastCell addSubview:](v4, "addSubview:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](v4, "conditionIconView"));
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](v4, "conditionIconView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](v4, "dayNameLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v24,  3LL,  0LL,  v25,  4LL,  1.0,  9.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](v4, "conditionIconView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v27,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v28);

    v29 = objc_alloc_init(&OBJC_CLASS___UIView);
    -[WTVDailyForecastCell setTemperatureContainer:](v4, "setTemperatureContainer:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 layer]);
    [v31 setAllowsGroupBlending:0];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    -[WTVDailyForecastCell addSubview:](v4, "addSubview:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](v4, "conditionIconView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v34,  3LL,  0LL,  v35,  4LL,  1.0,  -9.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v37,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v38);

    v39 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVDailyForecastCell setHighTemperatureLabel:](v4, "setHighTemperatureLabel:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    [v41 setFont:v40];

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    [v43 setBackgroundColor:v42];

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    [v44 addSubview:v45];

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v47,  3LL,  0LL,  v48,  3LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v50,  4LL,  0LL,  v51,  4LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v53,  5LL,  0LL,  v54,  5LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v55);

    v56 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVDailyForecastCell setLowTemperatureLabel:](v4, "setLowTemperatureLabel:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    [v58 setFont:v57];

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    [v60 setBackgroundColor:v59];

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    [v61 addSubview:v62];

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    [v63 setTranslatesAutoresizingMaskIntoConstraints:0];

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v64,  3LL,  0LL,  v65,  3LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v66);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v67,  4LL,  0LL,  v68,  4LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v69);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](v4, "highTemperatureLabel"));
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v70,  5LL,  0LL,  v71,  6LL,  1.0,  12.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v72);

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](v4, "lowTemperatureLabel"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell temperatureContainer](v4, "temperatureContainer"));
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v73,  6LL,  0LL,  v74,  6LL,  1.0,  0.0));
    -[WTVDailyForecastCell addConstraint:](v4, "addConstraint:", v75);
  }

  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WTVDailyForecastCell;
  -[WTVDailyForecastCell prepareForReuse](&v3, "prepareForReuse");
  -[WTVDailyForecastCell setDailyForecast:](self, "setDailyForecast:", 0LL);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVDailyForecastCell;
  -[WTVDailyForecastCell traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVDailyForecastCell _updateTextStyles](self, "_updateTextStyles");
}

- (void)setDailyForecast:(id)a3
{
  v5 = (SAWeatherDailyForecast *)a3;
  if (self->_dailyForecast != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dailyForecast, a3);
    -[WTVDailyForecastCell _updateUI](self, "_updateUI");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    -[WTVDailyForecastCell _updateTextStyles](self, "_updateTextStyles");
  }

- (void)_updateUI
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dailyForecast](self, "dailyForecast"));

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell unitDelegate](self, "unitDelegate"));
    else {
      uint64_t v5 = 1LL;
    }

    id v27 = (id)objc_claimAutoreleasedReturnValue( +[WFTemperatureFormatter temperatureFormatterWithInputUnit:outputUnit:]( &OBJC_CLASS___WFTemperatureFormatter,  "temperatureFormatterWithInputUnit:outputUnit:",  v5,  v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dailyForecast](self, "dailyForecast"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 condition]);
    id v8 = [v7 conditionCodeIndex];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WTVConditionIconManager sharedManager](&OBJC_CLASS___WTVConditionIconManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conditionIconForWeatherCondition:v8 type:0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](self, "conditionIconView"));
    [v11 setImage:v10];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dailyForecast](self, "dailyForecast"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 highTemperature]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v27 stringForObjectValue:v13]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](self, "highTemperatureLabel"));
    [v15 setText:v14];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dailyForecast](self, "dailyForecast"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lowTemperature]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v27 stringForObjectValue:v17]);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](self, "lowTemperatureLabel"));
    [v19 setText:v18];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dailyForecast](self, "dailyForecast"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 timeIndex]);
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dailyForecast](self, "dailyForecast"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 timeIndex]);
      uint64_t v24 = shortWeekdayNameForDayOfWeek([v23 integerValue]);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
    }

    else
    {
      v25 = &stru_1D1D8;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](self, "dayNameLabel"));
    [v26 setText:v25];

    -[WTVDailyForecastCell _updateTextStyles](self, "_updateTextStyles");
  }

- (void)_updateTextStyles
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell conditionIconView](self, "conditionIconView"));
  +[WTVUtilities configureConditionImageView:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureConditionImageView:forTextStyle:",  v3,  self->_textStyle);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell highTemperatureLabel](self, "highTemperatureLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v4,  self->_textStyle);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell lowTemperatureLabel](self, "lowTemperatureLabel"));
  +[WTVUtilities configureSecondaryLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureSecondaryLabel:forTextStyle:",  v5,  self->_textStyle);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastCell dayNameLabel](self, "dayNameLabel"));
  +[WTVUtilities configureSecondaryLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureSecondaryLabel:forTextStyle:",  v6,  self->_textStyle);
}

- (SAWeatherDailyForecast)dailyForecast
{
  return self->_dailyForecast;
}

- (WTVUnitDelegate)unitDelegate
{
  return (WTVUnitDelegate *)objc_loadWeakRetained((id *)&self->_unitDelegate);
}

- (void)setUnitDelegate:(id)a3
{
}

- (unint64_t)textStyle
{
  return self->_textStyle;
}

- (UIImageView)conditionIconView
{
  return self->_conditionIconView;
}

- (void)setConditionIconView:(id)a3
{
}

- (UIView)temperatureContainer
{
  return self->_temperatureContainer;
}

- (void)setTemperatureContainer:(id)a3
{
}

- (UILabel)highTemperatureLabel
{
  return self->_highTemperatureLabel;
}

- (void)setHighTemperatureLabel:(id)a3
{
}

- (UILabel)lowTemperatureLabel
{
  return self->_lowTemperatureLabel;
}

- (void)setLowTemperatureLabel:(id)a3
{
}

- (UILabel)dayNameLabel
{
  return self->_dayNameLabel;
}

- (void)setDayNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end