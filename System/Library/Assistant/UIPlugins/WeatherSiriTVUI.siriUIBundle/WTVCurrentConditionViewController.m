@interface WTVCurrentConditionViewController
- (SAWeatherTVObject)siriWeatherObject;
- (UIImageView)conditionIconView;
- (UILabel)cityNameLabel;
- (UILabel)conditionDescriptionLabel;
- (UILabel)temperatureLabel;
- (UIView)cityConditionContainerView;
- (WTVUnitDelegate)unitDelegate;
- (unint64_t)textStyle;
- (void)_updateTextStyles;
- (void)_updateUI;
- (void)didReceiveMemoryWarning;
- (void)setCityConditionContainerView:(id)a3;
- (void)setCityNameLabel:(id)a3;
- (void)setConditionDescriptionLabel:(id)a3;
- (void)setConditionIconView:(id)a3;
- (void)setSiriWeatherObject:(id)a3;
- (void)setTemperatureLabel:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setUnitDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation WTVCurrentConditionViewController

- (void)viewDidLoad
{
  v101.receiver = self;
  v101.super_class = (Class)&OBJC_CLASS___WTVCurrentConditionViewController;
  -[WTVCurrentConditionViewController viewDidLoad](&v101, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setAllowsGroupBlending:0];

  v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  -[WTVCurrentConditionViewController setConditionIconView:](self, "setConditionIconView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  [v7 setBackgroundColor:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  [v8 addSubview:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  5LL,  0LL,  v13,  5LL,  1.0,  0.0));
  [v11 addConstraint:v14];

  v15 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[WTVCurrentConditionViewController setTemperatureLabel:](self, "setTemperatureLabel:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  [v17 setBackgroundColor:v16];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  [v18 addSubview:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v22,  5LL,  0LL,  v23,  6LL,  1.0,  6.0));
  [v21 addConstraint:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v26,  10LL,  0LL,  v27,  10LL,  1.0,  0.0));
  [v25 addConstraint:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v30,  10LL,  0LL,  v31,  10LL,  1.0,  0.0));
  [v29 addConstraint:v32];

  v33 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[WTVCurrentConditionViewController setCityConditionContainerView:](self, "setCityConditionContainerView:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 layer]);
  [v35 setAllowsGroupBlending:0];

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  [v37 setBackgroundColor:v36];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  [v38 addSubview:v39];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v42,  5LL,  0LL,  v43,  6LL,  1.0,  18.0));
  [v41 addConstraint:v44];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v46,  6LL,  0LL,  v47,  6LL,  1.0,  0.0));
  [v45 addConstraint:v48];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v50,  3LL,  0LL,  v51,  3LL,  1.0,  0.0));
  [v49 addConstraint:v52];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v54,  4LL,  0LL,  v55,  4LL,  1.0,  0.0));
  [v53 addConstraint:v56];

  v57 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[WTVCurrentConditionViewController setCityNameLabel:](self, "setCityNameLabel:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  [v59 setBackgroundColor:v58];

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  [v61 setFont:v60];

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  [v62 addSubview:v63];

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  [v64 setTranslatesAutoresizingMaskIntoConstraints:0];

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v66,  5LL,  0LL,  v67,  5LL,  1.0,  0.0));
  [v65 addConstraint:v68];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v70,  3LL,  0LL,  v71,  3LL,  1.0,  0.0));
  [v69 addConstraint:v72];

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v74,  6LL,  -1LL,  v75,  6LL,  1.0,  0.0));
  [v73 addConstraint:v76];

  v77 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[WTVCurrentConditionViewController setConditionDescriptionLabel:](self, "setConditionDescriptionLabel:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  [v79 setBackgroundColor:v78];

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  [v81 setFont:v80];

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  [v82 addSubview:v83];

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  [v84 setTranslatesAutoresizingMaskIntoConstraints:0];

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v86,  5LL,  0LL,  v87,  5LL,  1.0,  0.0));
  [v85 addConstraint:v88];

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v90,  6LL,  -1LL,  v91,  6LL,  1.0,  0.0));
  [v89 addConstraint:v92];

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v94,  3LL,  0LL,  v95,  4LL,  1.0,  0.0));
  [v93 addConstraint:v96];

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController view](self, "view"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityConditionContainerView](self, "cityConditionContainerView"));
  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v98,  4LL,  0LL,  v99,  4LL,  1.0,  0.0));
  [v97 addConstraint:v100];

  -[WTVCurrentConditionViewController _updateUI](self, "_updateUI");
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WTVCurrentConditionViewController;
  -[WTVCurrentConditionViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVCurrentConditionViewController;
  -[WTVCurrentConditionViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVCurrentConditionViewController _updateTextStyles](self, "_updateTextStyles");
}

- (void)setSiriWeatherObject:(id)a3
{
  v5 = (SAWeatherTVObject *)a3;
  if (self->_siriWeatherObject != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_siriWeatherObject, a3);
    -[WTVCurrentConditionViewController _updateUI](self, "_updateUI");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    -[WTVCurrentConditionViewController _updateTextStyles](self, "_updateTextStyles");
  }

- (void)_updateTextStyles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
  +[WTVUtilities configureConditionImageView:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureConditionImageView:forTextStyle:",  v3,  self->_textStyle);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v4,  self->_textStyle);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v5,  self->_textStyle);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v6,  self->_textStyle);
}

- (void)_updateUI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentConditions]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentConditions]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 condition]);
    id v8 = [v7 conditionCodeIndex];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WTVConditionIconManager sharedManager](&OBJC_CLASS___WTVConditionIconManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conditionIconForWeatherCondition:v8 type:1]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionIconView](self, "conditionIconView"));
    [v11 setImage:v10];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentConditions]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 temperature]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController unitDelegate](self, "unitDelegate"));
    else {
      uint64_t v16 = 1LL;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[WFTemperatureFormatter temperatureFormatterWithInputUnit:outputUnit:]( &OBJC_CLASS___WFTemperatureFormatter,  "temperatureFormatterWithInputUnit:outputUnit:",  v16,  v16));
    v54 = (void *)v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v53 stringForObjectValue:v14]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[UIFont _lightSystemFontOfSize:](&OBJC_CLASS___UIFont, "_lightSystemFontOfSize:", 106.0));
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  72.0,  UIFontWeightMedium));
    v20 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
    NSAttributedStringKey v57 = NSFontAttributeName;
    uint64_t v58 = v18;
    v51 = (void *)v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    v22 = -[NSMutableAttributedString initWithString:attributes:](v20, "initWithString:attributes:", v17, v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%C", 176LL));
    v52 = v17;
    id v24 = [v17 rangeOfString:v23];
    uint64_t v26 = v25;

    if (v24 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v55[0] = NSFontAttributeName;
      v55[1] = NSBaselineOffsetAttributeName;
      v56[0] = v19;
      v56[1] = &off_1E940;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
      -[NSMutableAttributedString addAttributes:range:](v22, "addAttributes:range:", v23, v24, v26);
    }

    v50 = (void *)v19;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController temperatureLabel](self, "temperatureLabel"));
    [v27 setAttributedText:v22];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 weatherLocation]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 city]);
    if (v30)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v23 weatherLocation]);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 city]);
    }

    else
    {
      v31 = @"--";
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController cityNameLabel](self, "cityNameLabel"));
    [v32 setText:v31];

    if (v30)
    {
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 currentConditions]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 condition]);
    uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 conditionCode]);
    if (v36)
    {
      v37 = (void *)v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 currentConditions]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 condition]);
      id v41 = [v40 conditionCodeIndex];

      if ((uint64_t)v41 <= 47)
      {
        v42 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController siriWeatherObject](self, "siriWeatherObject"));
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 currentConditions]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 condition]);
        v47 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v43,  "localizedStringForKey:value:table:",  WeatherDescription[(void)objc_msgSend(v46, "conditionCodeIndex")],  &stru_1D1D8,  @"WeatherFrameworkLocalizableStrings"));
        v48 = (void *)objc_claimAutoreleasedReturnValue( -[WTVCurrentConditionViewController conditionDescriptionLabel]( self,  "conditionDescriptionLabel"));
        [v48 setText:v47];

LABEL_17:
        -[WTVCurrentConditionViewController _updateTextStyles](self, "_updateTextStyles");

        return;
      }
    }

    else
    {
    }

    v49 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
    v43 = (void *)objc_claimAutoreleasedReturnValue(v49);
    v44 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"NotAvailable" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[WTVCurrentConditionViewController conditionDescriptionLabel](self, "conditionDescriptionLabel"));
    [v45 setText:v44];
    goto LABEL_17;
  }

- (SAWeatherTVObject)siriWeatherObject
{
  return self->_siriWeatherObject;
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

- (UIView)cityConditionContainerView
{
  return self->_cityConditionContainerView;
}

- (void)setCityConditionContainerView:(id)a3
{
}

- (UILabel)cityNameLabel
{
  return self->_cityNameLabel;
}

- (void)setCityNameLabel:(id)a3
{
}

- (UILabel)conditionDescriptionLabel
{
  return self->_conditionDescriptionLabel;
}

- (void)setConditionDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end