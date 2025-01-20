@interface WTVHourlyForecastCell
- (UIImageView)conditionIconView;
- (UILabel)temperatureLabel;
- (UILabel)timeLabel;
- (WTVHourlyForecast)hourlyForecast;
- (WTVHourlyForecastCell)initWithFrame:(CGRect)a3;
- (WTVUnitDelegate)unitDelegate;
- (unint64_t)textStyle;
- (void)_updateTextStyles;
- (void)_updateUI;
- (void)prepareForReuse;
- (void)setConditionIconView:(id)a3;
- (void)setHourlyForecast:(id)a3;
- (void)setTemperatureLabel:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setTimeLabel:(id)a3;
- (void)setUnitDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WTVHourlyForecastCell

- (WTVHourlyForecastCell)initWithFrame:(CGRect)a3
{
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___WTVHourlyForecastCell;
  v3 = -[WTVHourlyForecastCell initWithFrame:]( &v48,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVHourlyForecastCell setTimeLabel:](v4, "setTimeLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    [v8 setFont:v7];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    [v10 setBackgroundColor:v9];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    [v11 setTextAlignment:1];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    [v12 setAdjustsFontSizeToFitWidth:1];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    [v13 setNumberOfLines:1];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    -[WTVHourlyForecastCell addSubview:](v4, "addSubview:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  3LL,  0LL,  v4,  3LL,  1.0,  0.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  5LL,  0LL,  v4,  5LL,  1.0,  0.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  6LL,  0LL,  v4,  6LL,  1.0,  0.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v21);

    v22 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[WTVHourlyForecastCell setConditionIconView:](v4, "setConditionIconView:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](v4, "conditionIconView"));
    -[WTVHourlyForecastCell addSubview:](v4, "addSubview:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](v4, "conditionIconView"));
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](v4, "conditionIconView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](v4, "timeLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v25,  3LL,  0LL,  v26,  4LL,  1.0,  9.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](v4, "conditionIconView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v28,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v29);

    v30 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVHourlyForecastCell setTemperatureLabel:](v4, "setTemperatureLabel:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    [v32 setFont:v31];

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    [v34 setBackgroundColor:v33];

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    [v35 setTextAlignment:1];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    [v36 setAdjustsFontSizeToFitWidth:1];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    [v37 setNumberOfLines:1];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    -[WTVHourlyForecastCell addSubview:](v4, "addSubview:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](v4, "conditionIconView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v40,  3LL,  0LL,  v41,  4LL,  1.0,  -9.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v43,  5LL,  0LL,  v4,  5LL,  1.0,  0.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](v4, "temperatureLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v45,  6LL,  0LL,  v4,  6LL,  1.0,  0.0));
    -[WTVHourlyForecastCell addConstraint:](v4, "addConstraint:", v46);
  }

  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WTVHourlyForecastCell;
  -[WTVHourlyForecastCell prepareForReuse](&v3, "prepareForReuse");
  -[WTVHourlyForecastCell setHourlyForecast:](self, "setHourlyForecast:", 0LL);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVHourlyForecastCell;
  -[WTVHourlyForecastCell traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVHourlyForecastCell _updateTextStyles](self, "_updateTextStyles");
}

- (void)setHourlyForecast:(id)a3
{
  v5 = (WTVHourlyForecast *)a3;
  if (self->_hourlyForecast != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hourlyForecast, a3);
    -[WTVHourlyForecastCell _updateUI](self, "_updateUI");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    -[WTVHourlyForecastCell _updateTextStyles](self, "_updateTextStyles");
  }

- (void)_updateUI
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell hourlyForecast](self, "hourlyForecast"));

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell hourlyForecast](self, "hourlyForecast"));
    v5 = (char *)[v4 type];

    if (v5 == (_BYTE *)&dword_0 + 2)
    {
      v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"sunset",  v21,  0LL));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](self, "conditionIconView"));
      [v23 setImage:v22];

      v24 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = v25;
      v27 = @"SUNSET";
    }

    else
    {
      if (v5 != (_BYTE *)&dword_0 + 1)
      {
        if (v5)
        {
LABEL_14:
          -[WTVHourlyForecastCell _updateTextStyles](self, "_updateTextStyles");
          return;
        }

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell unitDelegate](self, "unitDelegate"));
        else {
          uint64_t v7 = 1LL;
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue( +[WFTemperatureFormatter temperatureFormatterWithInputUnit:outputUnit:]( &OBJC_CLASS___WFTemperatureFormatter,  "temperatureFormatterWithInputUnit:outputUnit:",  v7,  v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[WTVConditionIconManager sharedManager](&OBJC_CLASS___WTVConditionIconManager, "sharedManager"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell hourlyForecast](self, "hourlyForecast"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "conditionIconForWeatherCondition:type:", objc_msgSend(v10, "condition"), 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](self, "conditionIconView"));
        [v12 setImage:v11];

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell hourlyForecast](self, "hourlyForecast"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 temperature]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForObjectValue:v14]);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](self, "temperatureLabel"));
        [v16 setText:v15];

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell hourlyForecast](self, "hourlyForecast"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 formattedTimeString]);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](self, "timeLabel"));
        [v19 setText:v18];

LABEL_13:
        goto LABEL_14;
      }

      v28 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"sunrise",  v29,  0LL));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](self, "conditionIconView"));
      [v31 setImage:v30];

      v32 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v26 = v25;
      v27 = @"SUNRISE";
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:v27 value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](self, "temperatureLabel"));
    [v34 setText:v33];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell hourlyForecast](self, "hourlyForecast"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 formattedTimeString]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](self, "timeLabel"));
    [v17 setText:v15];
    goto LABEL_13;
  }

- (void)_updateTextStyles
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell conditionIconView](self, "conditionIconView"));
  +[WTVUtilities configureConditionImageView:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureConditionImageView:forTextStyle:",  v3,  self->_textStyle);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell temperatureLabel](self, "temperatureLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v4,  self->_textStyle);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastCell timeLabel](self, "timeLabel"));
  +[WTVUtilities configureSecondaryLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureSecondaryLabel:forTextStyle:",  v5,  self->_textStyle);
}

- (WTVHourlyForecast)hourlyForecast
{
  return self->_hourlyForecast;
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

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end