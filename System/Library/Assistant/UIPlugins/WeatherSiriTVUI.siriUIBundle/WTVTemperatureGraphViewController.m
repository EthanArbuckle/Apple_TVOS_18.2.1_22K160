@interface WTVTemperatureGraphViewController
- (BOOL)isInvalid;
- (NSArray)barViews;
- (NSArray)gridlineViews;
- (NSArray)leadingLabels;
- (NSArray)trailingLabels;
- (SAWeatherTVObject)siriWeatherObject;
- (UIView)gridContainerView;
- (WTVUnitDelegate)unitDelegate;
- (int64_t)_displayedNumberOfForecasts;
- (int64_t)increment;
- (int64_t)incrementFactor;
- (int64_t)max;
- (int64_t)min;
- (int64_t)numberOfGridlines;
- (unint64_t)textStyle;
- (void)_update;
- (void)_updateBars;
- (void)_updateGridlineAndLabelConstraints;
- (void)_updateLabelValues;
- (void)_updateRange;
- (void)_updateTextStyles;
- (void)didReceiveMemoryWarning;
- (void)setBarViews:(id)a3;
- (void)setGridContainerView:(id)a3;
- (void)setGridlineViews:(id)a3;
- (void)setIncrement:(int64_t)a3;
- (void)setIncrementFactor:(int64_t)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setLeadingLabels:(id)a3;
- (void)setMax:(int64_t)a3;
- (void)setMin:(int64_t)a3;
- (void)setNumberOfGridlines:(int64_t)a3;
- (void)setSiriWeatherObject:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setTrailingLabels:(id)a3;
- (void)setUnitDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation WTVTemperatureGraphViewController

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___WTVTemperatureGraphViewController;
  -[WTVTemperatureGraphViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setAllowsGroupBlending:0];

  v5 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[WTVTemperatureGraphViewController setGridContainerView:](self, "setGridContainerView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
  [v6 addSubview:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  5LL,  0LL,  v11,  5LL,  1.0,  0.0));
  [v9 addConstraint:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  6LL,  0LL,  v15,  6LL,  1.0,  0.0));
  [v13 addConstraint:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  3LL,  0LL,  v19,  3LL,  1.0,  12.0));
  [v17 addConstraint:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v22,  4LL,  0LL,  v23,  4LL,  1.0,  -12.0));
  [v21 addConstraint:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController siriWeatherObject](self, "siriWeatherObject"));
  if (v25) {
    -[WTVTemperatureGraphViewController _update](self, "_update");
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WTVTemperatureGraphViewController;
  -[WTVTemperatureGraphViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVTemperatureGraphViewController;
  -[WTVTemperatureGraphViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVTemperatureGraphViewController _updateTextStyles](self, "_updateTextStyles");
}

- (void)setSiriWeatherObject:(id)a3
{
  v5 = (SAWeatherTVObject *)a3;
  if (self->_siriWeatherObject != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_siriWeatherObject, a3);
    -[WTVTemperatureGraphViewController _update](self, "_update");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    -[WTVTemperatureGraphViewController _updateTextStyles](self, "_updateTextStyles");
  }

- (void)_update
{
}

- (int64_t)_displayedNumberOfForecasts
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController siriWeatherObject](self, "siriWeatherObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dailyForecasts]);
  id v4 = [v3 count];

  else {
    return (int64_t)v4;
  }
}

- (void)_updateGridlineAndLabelConstraints
{
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController leadingLabels](self, "leadingLabels"));
  id v4 = [v3 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v78;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v78 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v77 + 1) + 8 * (void)i) removeFromSuperview];
      }

      id v5 = [v3 countByEnumeratingWithState:&v77 objects:v83 count:16];
    }

    while (v5);
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController trailingLabels](self, "trailingLabels"));
  id v9 = [v8 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v74;
    do
    {
      for (j = 0LL; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v74 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v73 + 1) + 8 * (void)j) removeFromSuperview];
      }

      id v10 = [v8 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }

    while (v10);
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridlineViews](self, "gridlineViews"));
  id v14 = [v13 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v70;
    do
    {
      for (k = 0LL; k != v15; k = (char *)k + 1)
      {
        if (*(void *)v70 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v69 + 1) + 8 * (void)k) removeFromSuperview];
      }

      id v15 = [v13 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }

    while (v15);
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[WTVTemperatureGraphViewController numberOfGridlines](self, "numberOfGridlines") >= 1)
  {
    id v18 = 0LL;
    v19 = 0LL;
    uint64_t v20 = 0LL;
    v21 = (void **)&CAEncodeLayerTree_ptr;
    v22 = &CAEncodeLayerTree_ptr;
    do
    {
      v23 = objc_alloc_init(&OBJC_CLASS___UIView);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      [v24 addSubview:v23];

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      objc_super v26 = v21[29];
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
      if (v20)
      {
        double v28 = (double)v20
            / (double)((unint64_t)-[WTVTemperatureGraphViewController numberOfGridlines]( self,  "numberOfGridlines")
                     - 1);
        v29 = v26;
        v30 = v23;
        v31 = v27;
        uint64_t v32 = 4LL;
      }

      else
      {
        double v28 = 1.0;
        v29 = v26;
        v30 = v23;
        v31 = v27;
        uint64_t v32 = 3LL;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue( [v29 constraintWithItem:v30 attribute:10 relatedBy:0 toItem:v31 attribute:v32 multiplier:v28 constant:0.0]);
      [v25 addConstraint:v33];

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v35 = (void *)objc_claimAutoreleasedReturnValue( [v21[29] constraintWithItem:v23 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:2.0]);
      [v34 addConstraint:v35];

      [v65 addObject:v23];
      id v36 = objc_alloc_init((Class)v22[58]);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      [v36 setBackgroundColor:v37];

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
      [v36 setFont:v38];

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      [v39 addSubview:v36];

      [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
      if (v18)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        v41 = (void *)objc_claimAutoreleasedReturnValue( [v21[29] constraintWithItem:v36 attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:0.0]);
        [v40 addConstraint:v41];
      }

      v68 = v18;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v43 = v21[29];
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v45 = (void *)objc_claimAutoreleasedReturnValue( [v43 constraintWithItem:v36 attribute:5 relatedBy:-1 toItem:v44 attribute:5 multiplier:1.0 constant:90.0]);
      [v42 addConstraint:v45];

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v47 = (void *)objc_claimAutoreleasedReturnValue( [v21[29] constraintWithItem:v36 attribute:10 relatedBy:0 toItem:v23 attribute:10 multiplier:1.0 constant:0.0]);
      [v46 addConstraint:v47];

      [v67 insertObject:v36 atIndex:0];
      id v48 = objc_alloc_init((Class)v22[58]);
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      [v48 setBackgroundColor:v49];

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
      [v48 setFont:v50];

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      [v51 addSubview:v48];

      [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
      if (v19)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        v53 = (void *)objc_claimAutoreleasedReturnValue( [v21[29] constraintWithItem:v48 attribute:5 relatedBy:0 toItem:v19 attribute:5 multiplier:1.0 constant:0.0]);
        [v52 addConstraint:v53];
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v55 = v21[29];
      v56 = v21;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v58 = (void *)objc_claimAutoreleasedReturnValue( [v55 constraintWithItem:v48 attribute:6 relatedBy:1 toItem:v57 attribute:6 multiplier:1.0 constant:-90.0]);
      [v54 addConstraint:v58];

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v60 = (void *)objc_claimAutoreleasedReturnValue( [v56[29] constraintWithItem:v48 attribute:10 relatedBy:0 toItem:v23 attribute:10 multiplier:1.0 constant:0.0]);
      [v59 addConstraint:v60];

      [v66 insertObject:v48 atIndex:0];
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v62 = (void *)objc_claimAutoreleasedReturnValue( [v56[29] constraintWithItem:v23 attribute:5 relatedBy:0 toItem:v36 attribute:6 multiplier:1.0 constant:20.0]);
      [v61 addConstraint:v62];

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
      v64 = (void *)objc_claimAutoreleasedReturnValue( [v56[29] constraintWithItem:v23 attribute:6 relatedBy:0 toItem:v48 attribute:5 multiplier:1.0 constant:-20.0]);
      [v63 addConstraint:v64];

      v21 = v56;
      ++v20;
      id v18 = v36;
      v19 = v48;
      v22 = &CAEncodeLayerTree_ptr;
    }

    while (v20 < -[WTVTemperatureGraphViewController numberOfGridlines](self, "numberOfGridlines"));
  }

  -[WTVTemperatureGraphViewController setLeadingLabels:](self, "setLeadingLabels:", v67);
  -[WTVTemperatureGraphViewController setTrailingLabels:](self, "setTrailingLabels:", v66);
  -[WTVTemperatureGraphViewController setGridlineViews:](self, "setGridlineViews:", v65);
}

- (void)_updateRange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController unitDelegate](self, "unitDelegate"));
  [v3 isDataMetricForUnitType:0];

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v27 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController siriWeatherObject](self, "siriWeatherObject"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dailyForecasts]);

  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 0x8000000000000000LL;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowTemperature]);
        id v14 = [v13 integerValue];

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 highTemperature]);
        id v16 = [v15 integerValue];

        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 lowTemperature]);
        id v18 = [v17 integerValue];

        v19 = (void *)objc_claimAutoreleasedReturnValue([v12 highTemperature]);
        id v20 = [v19 integerValue];

        else {
          uint64_t v21 = (uint64_t)v18;
        }
        if (v21 > v10) {
          uint64_t v10 = v21;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 0x8000000000000000LL;
  }

  -[WTVTemperatureGraphViewController setMin:](v27, "setMin:", 0LL);
  -[WTVTemperatureGraphViewController setMax:](v27, "setMax:", 25LL);
  -[WTVTemperatureGraphViewController setNumberOfGridlines:](v27, "setNumberOfGridlines:", 5LL);
  -[WTVTemperatureGraphViewController setIncrementFactor:](v27, "setIncrementFactor:", 5LL);
  -[WTVTemperatureGraphViewController setIncrement:](v27, "setIncrement:", 5LL);
  -[WTVTemperatureGraphViewController setIsInvalid:](v27, "setIsInvalid:", 1LL);
  if (v9 != 0x8000000000000000LL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v22 = (double)v9;
    if (v10 - v9 <= 20) {
      uint64_t v23 = 5LL;
    }
    else {
      uint64_t v23 = 10LL;
    }
    uint64_t v24 = (uint64_t)((floor( (double)((uint64_t)(ceil((double)v10 / (double)v23) * (double)v23)
                              - (uint64_t)(floor(v22 / (double)v23) * (double)v23))
                     / (double)((4 * v23) | 1))
                   + 1.0)
                  * (double)v23);
    if (v24)
    {
      uint64_t v25 = (uint64_t)(ceil((double)v10 / (double)v24) * (double)v24);
      uint64_t v26 = (uint64_t)(ceil((double)(v25 - (uint64_t)(floor(v22 / (double)v24) * (double)v24)) / (double)v24) + 1.0);
      -[WTVTemperatureGraphViewController setMin:](v27, "setMin:");
      -[WTVTemperatureGraphViewController setMax:](v27, "setMax:", v25);
      -[WTVTemperatureGraphViewController setNumberOfGridlines:](v27, "setNumberOfGridlines:", v26);
      -[WTVTemperatureGraphViewController setIncrementFactor:](v27, "setIncrementFactor:", v23);
      -[WTVTemperatureGraphViewController setIncrement:](v27, "setIncrement:", v24);
      -[WTVTemperatureGraphViewController setIsInvalid:](v27, "setIsInvalid:", 0LL);
    }
  }

- (void)_updateLabelValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController leadingLabels](self, "leadingLabels"));
  id v4 = [v3 count];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController trailingLabels](self, "trailingLabels"));
  id v6 = [v5 count];

  if (v4 >= v6) {
    uint64_t v7 = (uint64_t)v6;
  }
  else {
    uint64_t v7 = (uint64_t)v4;
  }
  if (v7 >= 1)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  (char *)-[WTVTemperatureGraphViewController min](self, "min")
                     + -[WTVTemperatureGraphViewController increment](self, "increment") * i));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController leadingLabels](self, "leadingLabels"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:i]);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController trailingLabels](self, "trailingLabels"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:i]);

      [v11 setText:v9];
      [v13 setText:v9];
    }
  }

- (void)_updateBars
{
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController barViews](self, "barViews"));
  id v4 = [v3 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v63;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * (void)i) removeFromSuperview];
      }

      id v5 = [v3 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }

    while (v5);
  }

  -[WTVTemperatureGraphViewController setBarViews:](self, "setBarViews:", 0LL);
  if (!-[WTVTemperatureGraphViewController isInvalid](self, "isInvalid"))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController siriWeatherObject](self, "siriWeatherObject"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dailyForecasts]);

    id obj = v9;
    id v53 = [v9 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v53)
    {
      uint64_t v56 = 0LL;
      uint64_t v52 = *(void *)v59;
LABEL_11:
      uint64_t v10 = 0LL;
      uint64_t v11 = 9LL;
      if (v56 > 9) {
        uint64_t v11 = v56;
      }
      uint64_t v54 = v56 - v11;
      while (1)
      {
        if (*(void *)v59 != v52) {
          objc_enumerationMutation(obj);
        }
        if (!(v54 + v10)) {
          break;
        }
        v12 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowTemperature]);
        id v14 = [v13 integerValue];

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 highTemperature]);
        id v16 = [v15 integerValue];

        else {
          unint64_t v17 = (unint64_t)v14;
        }
        unint64_t v57 = v17;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 lowTemperature]);
        v19 = [v18 integerValue];

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 highTemperature]);
        uint64_t v21 = [v20 integerValue];

        else {
          double v22 = v19;
        }
        uint64_t v23 = objc_alloc_init(&OBJC_CLASS___WTVTemperatureGraphBarView);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        [v24 addSubview:v23];

        -[WTVTemperatureGraphBarView setTranslatesAutoresizingMaskIntoConstraints:]( v23,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v23,  9LL,  0LL,  v26,  6LL,  ((double)(v56 + v10) + 1.0)
                        / (double)(-[WTVTemperatureGraphViewController _displayedNumberOfForecasts]( self,  "_displayedNumberOfForecasts")
                                 + 1),
                          0.0));
        [v25 addConstraint:v27];

        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v23,  7LL,  0LL,  0LL,  0LL,  1.0,  50.0));
        [v28 addConstraint:v29];

        double v30 = (double)(v22 - (_BYTE *)-[WTVTemperatureGraphViewController min](self, "min"));
        int64_t v31 = -[WTVTemperatureGraphViewController max](self, "max");
        double v32 = v30 / (double)(v31 - -[WTVTemperatureGraphViewController min](self, "min"));
        int64_t v33 = -[WTVTemperatureGraphViewController min](self, "min");
        int64_t v34 = -[WTVTemperatureGraphViewController max](self, "max");
        int64_t v35 = -[WTVTemperatureGraphViewController min](self, "min");
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
        if (vabdd_f64(1.0, v32) >= 2.22044605e-16)
        {
          double v38 = 1.0 - v32;
          v39 = v23;
          v40 = v37;
          uint64_t v41 = 4LL;
        }

        else
        {
          double v38 = 1.0;
          v39 = v23;
          v40 = v37;
          uint64_t v41 = 3LL;
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v39,  4LL,  0LL,  v40,  v41,  v38,  0.0));
        double v43 = (double)(uint64_t)(v57 - v33) / (double)(v34 - v35);
        [v36 addConstraint:v42];

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController view](self, "view"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridContainerView](self, "gridContainerView"));
        if (vabdd_f64(1.0, v43) >= 2.22044605e-16)
        {
          double v46 = 1.0 - v43;
          v47 = v23;
          id v48 = v45;
          uint64_t v49 = 4LL;
        }

        else
        {
          double v46 = 1.0;
          v47 = v23;
          id v48 = v45;
          uint64_t v49 = 3LL;
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v47,  3LL,  0LL,  v48,  v49,  v46,  0.0));
        [v44 addConstraint:v50];

        [v55 addObject:v23];
        if (v53 == (id)++v10)
        {
          v56 += v10;
          id v53 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v53) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

    -[WTVTemperatureGraphViewController setBarViews:](self, "setBarViews:", v55);
  }

- (void)_updateTextStyles
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController leadingLabels](self, "leadingLabels"));
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v7),  -[WTVTemperatureGraphViewController textStyle](self, "textStyle"));
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v5);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController trailingLabels](self, "trailingLabels"));
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12),  -[WTVTemperatureGraphViewController textStyle](self, "textStyle"));
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphViewController gridlineViews](self, "gridlineViews"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_E5A4;
  v14[3] = &unk_1C638;
  v14[4] = self;
  [v13 enumerateObjectsUsingBlock:v14];
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

- (UIView)gridContainerView
{
  return self->_gridContainerView;
}

- (void)setGridContainerView:(id)a3
{
}

- (NSArray)leadingLabels
{
  return self->_leadingLabels;
}

- (void)setLeadingLabels:(id)a3
{
}

- (NSArray)trailingLabels
{
  return self->_trailingLabels;
}

- (void)setTrailingLabels:(id)a3
{
}

- (NSArray)gridlineViews
{
  return self->_gridlineViews;
}

- (void)setGridlineViews:(id)a3
{
}

- (NSArray)barViews
{
  return self->_barViews;
}

- (void)setBarViews:(id)a3
{
}

- (int64_t)min
{
  return self->_min;
}

- (void)setMin:(int64_t)a3
{
  self->_min = a3;
}

- (int64_t)max
{
  return self->_max;
}

- (void)setMax:(int64_t)a3
{
  self->_max = a3;
}

- (int64_t)incrementFactor
{
  return self->_incrementFactor;
}

- (void)setIncrementFactor:(int64_t)a3
{
  self->_incrementFactor = a3;
}

- (int64_t)increment
{
  return self->_increment;
}

- (void)setIncrement:(int64_t)a3
{
  self->_increment = a3;
}

- (int64_t)numberOfGridlines
{
  return self->_numberOfGridlines;
}

- (void)setNumberOfGridlines:(int64_t)a3
{
  self->_numberOfGridlines = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (void).cxx_destruct
{
}

@end