@interface WTVSnippetViewController
- (BOOL)_isWeatherBackgroundShown;
- (BOOL)_layoutTypeIsLowerThird:(unint64_t)a3;
- (BOOL)_shouldShowWeatherBackgroundForLayoutType:(unint64_t)a3;
- (BOOL)appliedFullscreen;
- (BOOL)canBePresentedFullScreen;
- (BOOL)debug_isIteratingConditionsOnTimer;
- (BOOL)isDataMetricForUnitType:(unint64_t)a3;
- (BOOL)shouldShowMetricForUnitType:(unint64_t)a3;
- (BOOL)viewIsVisible;
- (CGSize)effectivePreferredContentSize;
- (CGSize)preferredContentSize;
- (City)city;
- (NSArray)layoutConstraints;
- (NSArray)snapshotsConstraints;
- (NSMutableArray)dividerLineViews;
- (NSSet)snapshots;
- (NSSet)viewsToFadeIn;
- (NSSet)viewsToFadeOut;
- (SAWeatherTVObject)siriWeatherObject;
- (UIImageView)attributionImageView;
- (UILabel)debug_conditionLabel;
- (UILabel)summaryLabel;
- (WTVConditionDetailViewController)conditionDetailViewController;
- (WTVConstraintInterpolator)transitionConstraintInterpolator;
- (WTVCurrentConditionViewController)currentConditionsViewController;
- (WTVDailyForecastViewController)dailyForecastViewController;
- (WTVHourlyForecastViewController)hourlyForecastViewController;
- (WTVTemperatureGraphViewController)temperatureGraphViewController;
- (WUIDynamicWeatherBackground)weatherBackground;
- (WeatherPreferences)weatherPreferences;
- (double)_requiredExtraHeightForSummaryLabel;
- (double)singleLinePreferredContentHeight;
- (id)_addDividerLineView;
- (id)_allSnippetViewControllers;
- (id)_childViewControllersForLayoutType:(unint64_t)a3;
- (id)_fullscreenAttributionImageViewConstraints;
- (unint64_t)_targetLayoutTypeForLowerThird:(BOOL)a3;
- (unint64_t)_textStyleForLayoutType:(unint64_t)a3;
- (unint64_t)_transitionTypeForTransitionToLayoutType:(unint64_t)a3;
- (unint64_t)layoutType;
- (unint64_t)transitionFromLayoutType;
- (void)_addSnapshotsOfCurrentViews;
- (void)_animateTransitionToFullScreen:(BOOL)a3;
- (void)_crossDissolveLabelsForLayoutType:(unint64_t)a3 ToTextStyle:(unint64_t)a4;
- (void)_debug_iterateConditions:(id)a3;
- (void)_debug_setDebugConditionCode:(int64_t)a3 isNight:(BOOL)a4;
- (void)_prepareForLayoutType:(unint64_t)a3 showWeatherBackground:(BOOL)a4 textStyle:(unint64_t)a5;
- (void)_removeSnapshots;
- (void)_setLayoutType:(unint64_t)a3 andChangeTextStyle:(BOOL)a4;
- (void)_setTextStyle:(unint64_t)a3 withChildViewControllers:(id)a4;
- (void)_setWeatherBackgroundShown:(BOOL)a3;
- (void)_updateConstraintsForDailyForecastFullscreen;
- (void)_updateConstraintsForDailyForecastSmall;
- (void)_updateConstraintsForForecastsFullscreen;
- (void)_updateConstraintsForHourlyForecastSmall;
- (void)_updateConstraintsForTodayConditionsSmall;
- (void)_updateConstraintsForTodayFullscreen;
- (void)_updateEffectivePreferredContentSize;
- (void)_updateSummaryLabel;
- (void)_updateSummaryLabelVibrancy;
- (void)_updateUI;
- (void)didUpdateInteractiveTransitionWithFullScreenFraction:(double)a3;
- (void)setAppliedFullscreen:(BOOL)a3;
- (void)setAttributionImageView:(id)a3;
- (void)setCity:(id)a3;
- (void)setConditionDetailViewController:(id)a3;
- (void)setCurrentConditionsViewController:(id)a3;
- (void)setCurrentUtterance:(id)a3;
- (void)setDailyForecastViewController:(id)a3;
- (void)setDebug_conditionLabel:(id)a3;
- (void)setDebug_isIteratingConditionsOnTimer:(BOOL)a3;
- (void)setDividerLineViews:(id)a3;
- (void)setEffectivePreferredContentSize:(CGSize)a3;
- (void)setHourlyForecastViewController:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLayoutType:(unint64_t)a3;
- (void)setSingleLinePreferredContentHeight:(double)a3;
- (void)setSiriWeatherObject:(id)a3;
- (void)setSnapshots:(id)a3;
- (void)setSnapshotsConstraints:(id)a3;
- (void)setSnippet:(id)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setTemperatureGraphViewController:(id)a3;
- (void)setTransitionConstraintInterpolator:(id)a3;
- (void)setTransitionFromLayoutType:(unint64_t)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)setViewsToFadeIn:(id)a3;
- (void)setViewsToFadeOut:(id)a3;
- (void)setWeatherBackground:(id)a3;
- (void)setWeatherPreferences:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginInteractiveTransition;
- (void)willEndInteractiveTransitionFromFullScreenFraction:(double)a3 toFullScreenFraction:(double)a4 velocity:(CGPoint)a5;
@end

@implementation WTVSnippetViewController

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  [v3 setClipsToBounds:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  [v5 setAllowsGroupBlending:0];

  v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[WTVSnippetViewController setSummaryLabel:](self, "setSummaryLabel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v8 setBackgroundColor:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v10 setFont:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v11 setTextAlignment:1];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v12 setNumberOfLines:2];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v13 addSubview:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  -[WTVSnippetViewController _updateSummaryLabelVibrancy](self, "_updateSummaryLabelVibrancy");
  v16 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  -[WTVSnippetViewController setAttributionImageView:](self, "setAttributionImageView:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  [v17 addSubview:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[WeatherInternalPreferences sharedInternalPreferences]( &OBJC_CLASS___WeatherInternalPreferences,  "sharedInternalPreferences"));
  if ([v20 isInternalInstall])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"EasyConditionToggling"]);
    unsigned int v22 = [v21 BOOLValue];

    if (v22)
    {
      v23 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_debug_iterateConditions:");
      -[UITapGestureRecognizer setAllowedPressTypes:](v23, "setAllowedPressTypes:", &off_1E760);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
      [v24 addGestureRecognizer:v23];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[WTVSnippetViewController _updateUI](self, "_updateUI");
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVSnippetViewController _updateSummaryLabelVibrancy](self, "_updateSummaryLabelVibrancy");
}

- (double)_requiredExtraHeightForSummaryLabel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  [v3 bounds];
  double Width = CGRectGetWidth(v22);
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v6 = Width - v5;
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v8 = v6 - v7;

  NSAttributedStringKey v20 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 font]);
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  v12 = objc_alloc_init(&OBJC_CLASS___NSStringDrawingContext);
  objc_msgSend(@"a", "boundingRectWithSize:options:attributes:context:", 1, v11, v12, v8, 1.79769313e308);
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 text]);
  objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v11, v12, v8, 1.79769313e308);
  double v18 = v17;

  return fmax(v18 - v14, 0.0);
}

- (BOOL)canBePresentedFullScreen
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[WTVSnippetViewController setViewIsVisible:](self, "setViewIsVisible:", 1LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[WTVSnippetViewController setViewIsVisible:](self, "setViewIsVisible:", 0LL);
}

- (void)_updateSummaryLabel
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentUtterance](self, "currentUtterance"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
    [v3 setText:v4];
  }

  -[WTVSnippetViewController _updateEffectivePreferredContentSize](self, "_updateEffectivePreferredContentSize");
}

- (void)_updateSummaryLabelVibrancy
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController traitCollection](self, "traitCollection"));
  id v4 = (char *)[v3 userInterfaceStyle];
  double v5 = &kCAFilterPlusL;
  if (v4 != (_BYTE *)&dword_0 + 2) {
    double v5 = &kCAFilterPlusD;
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v5));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  [v8 setCompositingFilter:v6];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController traitCollection](self, "traitCollection"));
  else {
    double v9 = 0.666666667;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v9,  v9,  v9,  1.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  [v11 setTextColor:v10];
}

- (void)_updateUI
{
  if (-[WTVSnippetViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController delegate](self, "delegate"));
    uint64_t v4 = [v3 isPresentedFullScreen] ^ 1;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1FF0;
    v9[3] = &unk_1C4E8;
    v9[4] = self;
    v9[5] = -[WTVSnippetViewController _targetLayoutTypeForLowerThird:](self, "_targetLayoutTypeForLowerThird:", v4);
    double v5 = objc_retainBlock(v9);
    if (-[WTVSnippetViewController viewIsVisible](self, "viewIsVisible"))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_2148;
      v7[3] = &unk_1C510;
      double v8 = v5;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v6,  5242881LL,  v7,  0LL,  0.25);
    }

    else
    {
      ((void (*)(void *))v5[2])(v5);
    }
  }

- (void)setSnippet:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController setSnippet:](&v25, "setSnippet:", v4);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAWeatherForecastSnippet);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 aceWeathers]);
    id v8 = [v7 count];

    if (v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 aceWeathers]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
      -[WTVSnippetViewController setSiriWeatherObject:](self, "setSiriWeatherObject:", v10);
    }

    else
    {
      uint64_t v18 = WALogForCategory(0LL);
      double v9 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_11A4C((uint64_t)v6, (os_log_s *)v9, v19, v20, v21, v22, v23, v24);
      }
    }
  }

  else
  {
    uint64_t v11 = WALogForCategory(0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_11AB0((uint64_t)v4, (os_log_s *)v6, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)setSiriWeatherObject:(id)a3
{
  p_siriWeatherObject = &self->_siriWeatherObject;
  id v10 = a3;
  if (([v10 isEqual:*p_siriWeatherObject] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_siriWeatherObject, a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherTVObject weatherCityRepresentation](*p_siriWeatherObject, "weatherCityRepresentation"));
    -[WTVSnippetViewController setCity:](self, "setCity:", v6);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 superview]);

    if (v8) {
      -[WTVSnippetViewController _updateUI](self, "_updateUI");
    }
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  [v9 layoutIfNeeded];
}

- (void)setCurrentUtterance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController setCurrentUtterance:](&v6, "setCurrentUtterance:", a3);
  if (-[WTVSnippetViewController viewIsVisible](self, "viewIsVisible"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_2414;
    v5[3] = &unk_1C538;
    v5[4] = self;
    +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v4,  5242880LL,  v5,  0LL,  0.25);
  }

  else
  {
    -[WTVSnippetViewController _updateSummaryLabel](self, "_updateSummaryLabel");
  }

- (WeatherPreferences)weatherPreferences
{
  weatherPreferences = self->_weatherPreferences;
  if (!weatherPreferences)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___WeatherPreferences);
    uint64_t v5 = self->_weatherPreferences;
    self->_weatherPreferences = v4;

    -[WeatherPreferences synchronizeStateToDisk](self->_weatherPreferences, "synchronizeStateToDisk");
    -[WeatherPreferences registerTemperatureUnits](self->_weatherPreferences, "registerTemperatureUnits");
    -[WeatherPreferences synchronizeStateToDisk](self->_weatherPreferences, "synchronizeStateToDisk");
    -[WeatherPreferences readTemperatureUnits](self->_weatherPreferences, "readTemperatureUnits");
    weatherPreferences = self->_weatherPreferences;
  }

  return weatherPreferences;
}

- (WUIDynamicWeatherBackground)weatherBackground
{
  weatherBackground = self->_weatherBackground;
  if (!weatherBackground)
  {
    id v4 = objc_alloc(&OBJC_CLASS___WUIDynamicWeatherBackground);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    [v5 bounds];
    objc_super v6 = -[WUIDynamicWeatherBackground initWithFrame:](v4, "initWithFrame:");
    double v7 = self->_weatherBackground;
    self->_weatherBackground = v6;

    -[WUIDynamicWeatherBackground setClipsToBounds:](self->_weatherBackground, "setClipsToBounds:", 1LL);
    weatherBackground = self->_weatherBackground;
  }

  return weatherBackground;
}

- (WTVCurrentConditionViewController)currentConditionsViewController
{
  currentConditionsViewController = self->_currentConditionsViewController;
  if (!currentConditionsViewController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___WTVCurrentConditionViewController);
    uint64_t v5 = self->_currentConditionsViewController;
    self->_currentConditionsViewController = v4;

    -[WTVCurrentConditionViewController setUnitDelegate:]( self->_currentConditionsViewController,  "setUnitDelegate:",  self);
    currentConditionsViewController = self->_currentConditionsViewController;
  }

  return currentConditionsViewController;
}

- (WTVHourlyForecastViewController)hourlyForecastViewController
{
  hourlyForecastViewController = self->_hourlyForecastViewController;
  if (!hourlyForecastViewController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___WTVHourlyForecastViewController);
    uint64_t v5 = self->_hourlyForecastViewController;
    self->_hourlyForecastViewController = v4;

    -[WTVHourlyForecastViewController setUnitDelegate:](self->_hourlyForecastViewController, "setUnitDelegate:", self);
    hourlyForecastViewController = self->_hourlyForecastViewController;
  }

  return hourlyForecastViewController;
}

- (WTVDailyForecastViewController)dailyForecastViewController
{
  dailyForecastViewController = self->_dailyForecastViewController;
  if (!dailyForecastViewController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___WTVDailyForecastViewController);
    uint64_t v5 = self->_dailyForecastViewController;
    self->_dailyForecastViewController = v4;

    -[WTVDailyForecastViewController setUnitDelegate:](self->_dailyForecastViewController, "setUnitDelegate:", self);
    dailyForecastViewController = self->_dailyForecastViewController;
  }

  return dailyForecastViewController;
}

- (WTVConditionDetailViewController)conditionDetailViewController
{
  conditionDetailViewController = self->_conditionDetailViewController;
  if (!conditionDetailViewController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___WTVConditionDetailViewController);
    uint64_t v5 = self->_conditionDetailViewController;
    self->_conditionDetailViewController = v4;

    -[WTVConditionDetailViewController setUnitDelegate:](self->_conditionDetailViewController, "setUnitDelegate:", self);
    conditionDetailViewController = self->_conditionDetailViewController;
  }

  return conditionDetailViewController;
}

- (WTVTemperatureGraphViewController)temperatureGraphViewController
{
  temperatureGraphViewController = self->_temperatureGraphViewController;
  if (!temperatureGraphViewController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___WTVTemperatureGraphViewController);
    uint64_t v5 = self->_temperatureGraphViewController;
    self->_temperatureGraphViewController = v4;

    -[WTVTemperatureGraphViewController setUnitDelegate:]( self->_temperatureGraphViewController,  "setUnitDelegate:",  self);
    temperatureGraphViewController = self->_temperatureGraphViewController;
  }

  return temperatureGraphViewController;
}

- (CGSize)preferredContentSize
{
  if (v3 == CGSizeZero.width && v4 == CGSizeZero.height)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
    -[WTVSnippetViewController preferredContentSize](&v6, "preferredContentSize");
  }

  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_addSnapshotsOfCurrentViews
{
  uint64_t v23 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, a2);
  double v4 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subviews]);

  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
        if (v11 != (void *)v12)
        {
          uint64_t v13 = (void *)v12;
          [v11 frame];
          double v15 = v14;

          if (v15 <= 0.0) {
            goto LABEL_10;
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 snapshotViewWithFullLayerHierarchy]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
          [v17 insertSubview:v16 aboveSubview:v11];

          [v23 addObject:v16];
          [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  5LL,  0LL,  v11,  5LL,  1.0,  0.0));
          [v4 addObject:v18];

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  6LL,  0LL,  v11,  6LL,  1.0,  0.0));
          [v4 addObject:v19];

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  3LL,  0LL,  v11,  3LL,  1.0,  0.0));
          [v4 addObject:v20];

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  4LL,  0LL,  v11,  4LL,  1.0,  0.0));
          [v4 addObject:v21];

          uint64_t v11 = v16;
        }

LABEL_10:
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v8);
  }

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v4);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  [v22 setNeedsLayout];

  -[WTVSnippetViewController setSnapshots:](self, "setSnapshots:", v23);
  -[WTVSnippetViewController setSnapshotsConstraints:](self, "setSnapshotsConstraints:", v4);
}

- (void)_removeSnapshots
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController snapshots](self, "snapshots", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) removeFromSuperview];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController snapshotsConstraints](self, "snapshotsConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  [v9 setNeedsLayout];

  -[WTVSnippetViewController setSnapshots:](self, "setSnapshots:", 0LL);
  -[WTVSnippetViewController setSnapshotsConstraints:](self, "setSnapshotsConstraints:", 0LL);
}

- (void)willBeginInteractiveTransition
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController willBeginInteractiveTransition](&v32, "willBeginInteractiveTransition");
  if (-[WTVSnippetViewController _layoutTypeIsLowerThird:]( self,  "_layoutTypeIsLowerThird:",  -[WTVSnippetViewController layoutType](self, "layoutType")))
  {
    unint64_t v3 = -[WTVSnippetViewController _targetLayoutTypeForLowerThird:](self, "_targetLayoutTypeForLowerThird:", 0LL);
    if ((char *)-[WTVSnippetViewController _transitionTypeForTransitionToLayoutType:]( self,  "_transitionTypeForTransitionToLayoutType:",  v3) == (char *)&dword_0 + 1)
    {
      -[WTVSnippetViewController setTransitionFromLayoutType:]( self,  "setTransitionFromLayoutType:",  -[WTVSnippetViewController layoutType](self, "layoutType"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subviews]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
      -[WTVSnippetViewController _addSnapshotsOfCurrentViews](self, "_addSnapshotsOfCurrentViews");
      -[WTVSnippetViewController _setLayoutType:andChangeTextStyle:]( self,  "_setLayoutType:andChangeTextStyle:",  v3,  1LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subviews]);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

      __int128 v27 = v6;
      id v12 = [v6 mutableCopy];
      [v12 minusSet:v11];
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController snapshots](self, "snapshots"));
      [v12 unionSet:v13];

      -[WTVSnippetViewController setViewsToFadeOut:](self, "setViewsToFadeOut:", v12);
      __int128 v26 = v11;
      id v14 = [v11 mutableCopy];
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController snapshots](self, "snapshots"));
      [v14 minusSet:v15];

      -[WTVSnippetViewController setViewsToFadeIn:](self, "setViewsToFadeIn:", v14);
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      id v16 = v14;
      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v20);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));

            if (v21 != v22) {
              [v21 setAlpha:0.0];
            }
            uint64_t v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }

        while (v18);
      }

      -[WTVSnippetViewController _setWeatherBackgroundShown:](self, "_setWeatherBackgroundShown:", 1LL);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
      [v23 setAlpha:0.0];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
      -[WTVSnippetViewController setLayoutType:](self, "setLayoutType:", v3);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
    }

    __int128 v24 = -[WTVConstraintInterpolator initWithStartConstraints:endConstraints:]( objc_alloc(&OBJC_CLASS___WTVConstraintInterpolator),  "initWithStartConstraints:endConstraints:",  v7,  v8);
    -[WTVSnippetViewController setTransitionConstraintInterpolator:](self, "setTransitionConstraintInterpolator:", v24);

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController transitionConstraintInterpolator]( self,  "transitionConstraintInterpolator"));
    [v25 updateConstraintConstantsWithTransitionProgress:0.0];
  }

- (void)didUpdateInteractiveTransitionWithFullScreenFraction:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController didUpdateInteractiveTransitionWithFullScreenFraction:]( &v10,  "didUpdateInteractiveTransitionWithFullScreenFraction:");
  if (-[WTVSnippetViewController _layoutTypeIsLowerThird:]( self,  "_layoutTypeIsLowerThird:",  -[WTVSnippetViewController layoutType](self, "layoutType")))
  {
    unint64_t v5 = -[WTVSnippetViewController _targetLayoutTypeForLowerThird:](self, "_targetLayoutTypeForLowerThird:", 0LL);
  }

  else
  {
    unint64_t v5 = -[WTVSnippetViewController layoutType](self, "layoutType");
  }

  if ((char *)-[WTVSnippetViewController _transitionTypeForTransitionToLayoutType:]( self,  "_transitionTypeForTransitionToLayoutType:",  v5) == (char *)&dword_0 + 1)
  {
    -[WTVSnippetViewController _animateTransitionToFullScreen:](self, "_animateTransitionToFullScreen:", a3 >= 0.2);
    double v6 = 0.0;
    if (a3 >= 0.0) {
      double v6 = a3;
    }
    double v7 = fmin(v6, 1.0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    [v8 setAlpha:v7];
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController transitionConstraintInterpolator](self, "transitionConstraintInterpolator"));
  [v9 updateConstraintConstantsWithTransitionProgress:a3];
}

- (void)willEndInteractiveTransitionFromFullScreenFraction:(double)a3 toFullScreenFraction:(double)a4 velocity:(CGPoint)a5
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___WTVSnippetViewController;
  -[WTVSnippetViewController willEndInteractiveTransitionFromFullScreenFraction:toFullScreenFraction:velocity:]( &v34,  "willEndInteractiveTransitionFromFullScreenFraction:toFullScreenFraction:velocity:",  a3,  a4,  a5.x,  a5.y);
  if (-[WTVSnippetViewController _layoutTypeIsLowerThird:]( self,  "_layoutTypeIsLowerThird:",  -[WTVSnippetViewController layoutType](self, "layoutType")))
  {
    unint64_t v7 = -[WTVSnippetViewController layoutType](self, "layoutType");
    unint64_t v8 = -[WTVSnippetViewController _targetLayoutTypeForLowerThird:](self, "_targetLayoutTypeForLowerThird:", 0LL);
  }

  else
  {
    unint64_t v7 = -[WTVSnippetViewController _targetLayoutTypeForLowerThird:](self, "_targetLayoutTypeForLowerThird:", 1LL);
    unint64_t v8 = -[WTVSnippetViewController layoutType](self, "layoutType");
  }

  if (a4 == 1.0)
  {
    -[WTVSnippetViewController setLayoutType:](self, "setLayoutType:", v8);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subviews]);

    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * (void)i) setAlpha:1.0];
        }

        id v12 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v12);
    }

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    [v15 setAlpha:1.0];

    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController transitionConstraintInterpolator]( self,  "transitionConstraintInterpolator"));
    id v17 = v16;
    double v18 = 1.0;
  }

  else
  {
    -[WTVSnippetViewController setLayoutType:](self, "setLayoutType:", v7);
    -[WTVSnippetViewController _setWeatherBackgroundShown:](self, "_setWeatherBackgroundShown:", 0LL);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 subviews]);

    id v21 = [v20 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) setAlpha:1.0];
        }

        id v22 = [v20 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }

      while (v22);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController transitionConstraintInterpolator]( self,  "transitionConstraintInterpolator"));
    id v17 = v16;
    double v18 = 0.0;
  }

  [v16 updateConstraintConstantsWithTransitionProgress:v18];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_329C;
  v25[3] = &unk_1C538;
  v25[4] = self;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v25);
  -[WTVSnippetViewController _removeSnapshots](self, "_removeSnapshots");
}

- (void)_crossDissolveLabelsForLayoutType:(unint64_t)a3 ToTextStyle:(unint64_t)a4
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subviews]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_3474;
        v14[3] = &unk_1C560;
        v14[4] = self;
        v14[5] = a3;
        v14[6] = a4;
        +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v13,  5242880LL,  v14,  &stru_1C5A0,  0.2);
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }
}

- (void)_animateTransitionToFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[WTVSnippetViewController appliedFullscreen](self, "appliedFullscreen") != a3)
  {
    -[WTVSnippetViewController setAppliedFullscreen:](self, "setAppliedFullscreen:", v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_355C;
    v5[3] = &unk_1C5C8;
    v5[4] = self;
    BOOL v6 = v3;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v5,  0LL,  0.2,  0.0);
  }

- (unint64_t)_transitionTypeForTransitionToLayoutType:(unint64_t)a3
{
  return -[WTVSnippetViewController _shouldShowWeatherBackgroundForLayoutType:]( self,  "_shouldShowWeatherBackgroundForLayoutType:",  a3);
}

- (void)setLayoutType:(unint64_t)a3
{
}

- (void)_setLayoutType:(unint64_t)a3 andChangeTextStyle:(BOOL)a4
{
  if (self->_layoutType != a3)
  {
    BOOL v4 = a4;
    self->_layoutType = a3;
    switch(a3)
    {
      case 1uLL:
        -[WTVSnippetViewController _updateConstraintsForTodayConditionsSmall]( self,  "_updateConstraintsForTodayConditionsSmall");
        if (v4) {
          goto LABEL_13;
        }
        goto LABEL_14;
      case 2uLL:
        -[WTVSnippetViewController _updateConstraintsForHourlyForecastSmall]( self,  "_updateConstraintsForHourlyForecastSmall");
        if (v4) {
          goto LABEL_13;
        }
        goto LABEL_14;
      case 3uLL:
        -[WTVSnippetViewController _updateConstraintsForDailyForecastSmall]( self,  "_updateConstraintsForDailyForecastSmall");
        if (v4) {
          goto LABEL_13;
        }
        goto LABEL_14;
      case 4uLL:
        -[WTVSnippetViewController _updateConstraintsForForecastsFullscreen]( self,  "_updateConstraintsForForecastsFullscreen");
        if (v4) {
          goto LABEL_13;
        }
        goto LABEL_14;
      case 5uLL:
        -[WTVSnippetViewController _updateConstraintsForTodayFullscreen](self, "_updateConstraintsForTodayFullscreen");
        goto LABEL_12;
      case 6uLL:
        -[WTVSnippetViewController _updateConstraintsForDailyForecastFullscreen]( self,  "_updateConstraintsForDailyForecastFullscreen");
        if (!v4) {
          goto LABEL_14;
        }
        goto LABEL_13;
      default:
LABEL_12:
        if (v4)
        {
LABEL_13:
          unint64_t v7 = -[WTVSnippetViewController _textStyleForLayoutType:](self, "_textStyleForLayoutType:", a3);
          unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController _childViewControllersForLayoutType:]( self,  "_childViewControllersForLayoutType:",  a3));
          -[WTVSnippetViewController _setTextStyle:withChildViewControllers:]( self,  "_setTextStyle:withChildViewControllers:",  v7,  v8);
        }

- (BOOL)_layoutTypeIsLowerThird:(unint64_t)a3
{
  return a3 - 1 < 3;
}

- (unint64_t)_targetLayoutTypeForLowerThird:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    unint64_t v4 = 1LL;
  }
  else {
    unint64_t v4 = 4LL;
  }
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController siriWeatherObject](self, "siriWeatherObject"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

  if (([v6 isEqualToString:SAWeatherTVViewGENERALValue] & 1) == 0)
  {
    if ([v6 isEqualToString:SAWeatherTVViewTODAYValue])
    {
      if (v3) {
        unint64_t v4 = 1LL;
      }
      else {
        unint64_t v4 = 5LL;
      }
    }

    else if ([v6 isEqualToString:SAWeatherTVViewHOURLYValue])
    {
      if (v3) {
        unint64_t v4 = 2LL;
      }
      else {
        unint64_t v4 = 5LL;
      }
    }

    else
    {
      unsigned int v7 = [v6 isEqualToString:SAWeatherTVViewDAILYValue];
      uint64_t v8 = 6LL;
      if (v3) {
        uint64_t v8 = 3LL;
      }
      if (v7) {
        unint64_t v4 = v8;
      }
    }
  }

  return v4;
}

- (void)_setTextStyle:(unint64_t)a3 withChildViewControllers:(id)a4
{
  id v6 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___WTVChildViewControllerProtocol])
        {
          id v12 = v11;
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController siriWeatherObject](self, "siriWeatherObject"));
          [v12 setSiriWeatherObject:v13];

          [v12 setTextStyle:a3];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  +[WTVUtilities configureLabel:forTextStyle:](&OBJC_CLASS___WTVUtilities, "configureLabel:forTextStyle:", v14, a3);
}

- (void)_prepareForLayoutType:(unint64_t)a3 showWeatherBackground:(BOOL)a4 textStyle:(unint64_t)a5
{
  BOOL v5 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController _childViewControllersForLayoutType:]( self,  "_childViewControllersForLayoutType:",  a3));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController _allSnippetViewControllers](self, "_allSnippetViewControllers"));
  id v9 = [v8 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 parentViewController]);
        if (v14)
        {
          __int128 v15 = (void *)v14;
          unsigned __int8 v16 = [v7 containsObject:v13];

          if ((v16 & 1) == 0)
          {
            [v13 willMoveToParentViewController:0];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
            [v17 removeFromSuperview];

            [v13 removeFromParentViewController];
            [v13 didMoveToParentViewController:0];
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v61 objects:v67 count:16];
    }

    while (v10);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dividerLineViews](self, "dividerLineViews"));
  id v19 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v57 + 1) + 8 * (void)j) removeFromSuperview];
      }

      id v20 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }

    while (v20);
  }

  -[WTVSnippetViewController setDividerLineViews:](self, "setDividerLineViews:", 0LL);
  -[WTVSnippetViewController _setWeatherBackgroundShown:](self, "_setWeatherBackgroundShown:", v5);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v23 = v7;
  id v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v54;
    do
    {
      for (k = 0LL; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v54 != v26) {
          objc_enumerationMutation(v23);
        }
        __int128 v28 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)k);
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 parentViewController]);

        if (!v29)
        {
          [v28 willMoveToParentViewController:self];
          -[WTVSnippetViewController addChildViewController:](self, "addChildViewController:", v28);
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v28 view]);
          [v30 addSubview:v31];

          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 view]);
          [v32 setAlpha:1.0];

          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v28 view]);
          [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

          [v28 didMoveToParentViewController:self];
          [v28 traitCollectionDidChange:0];
          if ([v28 conformsToProtocol:&OBJC_PROTOCOL___WTVChildViewControllerProtocol])
          {
            id v34 = v28;
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController siriWeatherObject](self, "siriWeatherObject"));
            [v34 setSiriWeatherObject:v35];
          }
        }
      }

      id v25 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }

    while (v25);
  }

  BOOL v36 = -[WTVSnippetViewController _layoutTypeIsLowerThird:]( self,  "_layoutTypeIsLowerThird:",  -[WTVSnippetViewController layoutType](self, "layoutType"));
  uint64_t v37 = objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  [(id)v37 setHidden:v36];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  LOBYTE(v37) = [v38 isHidden];

  if ((v37 & 1) == 0)
  {
    v39 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"ATV-Weather-Channel-Logo",  v40,  0LL));

    [v41 size];
    double width = v68.width;
    double height = v68.height;
    double y = CGPointZero.y;
    UIGraphicsBeginImageContextWithOptions(v68, 0, 0.0);
    objc_msgSend(v41, "drawInRect:", CGPointZero.x, y, width, height);
    if (v5)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.35));
    }

    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor siritvui_textColorForUserInterfaceStyle:]( &OBJC_CLASS___UIColor,  "siritvui_textColorForUserInterfaceStyle:",  2LL));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v46 colorWithAlphaComponent:0.4]);
    }

    [v45 setFill];
    v69.origin.x = CGPointZero.x;
    v69.origin.double y = y;
    v69.size.double width = width;
    v69.size.double height = height;
    UIRectFillUsingBlendMode(v69, kCGBlendModeSourceIn);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v48 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
    [v49 setImage:v48];

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
    +[WTVUtilities configureView:forTextStyle:](&OBJC_CLASS___WTVUtilities, "configureView:forTextStyle:", v50, a5);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v51);

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0LL);
}

- (void)_updateEffectivePreferredContentSize
{
  if (v3 <= 0.0)
  {
    -[WTVSnippetViewController setEffectivePreferredContentSize:]( self,  "setEffectivePreferredContentSize:",  CGSizeZero.width,  CGSizeZero.height);
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController delegate](self, "delegate"));
    [v9 suggestedContentSize];
    double v5 = v4;
    -[WTVSnippetViewController singleLinePreferredContentHeight](self, "singleLinePreferredContentHeight");
    double v7 = v6;
    -[WTVSnippetViewController _requiredExtraHeightForSummaryLabel](self, "_requiredExtraHeightForSummaryLabel");
    -[WTVSnippetViewController setEffectivePreferredContentSize:]( self,  "setEffectivePreferredContentSize:",  v5,  v7 + v8);
  }

- (id)_childViewControllersForLayoutType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      double v4 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController currentConditionsViewController]( self,  "currentConditionsViewController"));
      unsigned __int8 v16 = v4;
      double v5 = &v16;
      goto LABEL_6;
    case 2uLL:
      double v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
      __int128 v15 = v4;
      double v5 = &v15;
      goto LABEL_6;
    case 3uLL:
      double v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
      uint64_t v14 = v4;
      double v5 = &v14;
LABEL_6:
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 1LL));
      goto LABEL_12;
    case 4uLL:
      double v4 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController currentConditionsViewController]( self,  "currentConditionsViewController"));
      v13[0] = v4;
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
      v13[1] = v8;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
      v13[2] = v9;
      id v10 = v13;
      goto LABEL_9;
    case 5uLL:
      double v4 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController currentConditionsViewController]( self,  "currentConditionsViewController"));
      v12[0] = v4;
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
      v12[1] = v8;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController conditionDetailViewController](self, "conditionDetailViewController"));
      v12[2] = v9;
      id v10 = v12;
LABEL_9:
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL));

      goto LABEL_11;
    case 6uLL:
      double v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController temperatureGraphViewController]( self,  "temperatureGraphViewController",  v4));
      v11[1] = v8;
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
LABEL_11:

LABEL_12:
      id result = v7;
      break;
    default:
      id result = 0LL;
      break;
  }

  return result;
}

- (unint64_t)_textStyleForLayoutType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 4;
}

- (id)_allSnippetViewControllers
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v4 = v3;
  if (self->_currentConditionsViewController) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_hourlyForecastViewController) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_dailyForecastViewController) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_conditionDetailViewController) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_temperatureGraphViewController) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)_addDividerLineView
{
  double v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  +[WTVUtilities configureLineView:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLineView:forTextStyle:",  v3,  0LL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  [v4 addSubview:v3];

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  5LL,  0LL,  v6,  5LL,  1.0));
  [v5 addConstraint:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  6LL,  0LL,  v9,  6LL,  1.0,  -v10));
  [v8 addConstraint:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  8LL,  0LL,  0LL,  0LL,  1.0,  2.0));
  [v12 addConstraint:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dividerLineViews](self, "dividerLineViews"));
  if (!v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[WTVSnippetViewController setDividerLineViews:](self, "setDividerLineViews:", v15);
  }

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dividerLineViews](self, "dividerLineViews"));
  [v16 addObject:v3];

  return v3;
}

- (BOOL)_isWeatherBackgroundShown
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 superview]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_setWeatherBackgroundShown:(BOOL)a3
{
  unsigned int v5 = -[WTVSnippetViewController _isWeatherBackgroundShown](self, "_isWeatherBackgroundShown");
  if (a3)
  {
    if ((v5 & 1) != 0) {
      return;
    }
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    [v6 insertSubview:v7 atIndex:0];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController delegate](self, "delegate"));
    [v9 maximumContentSize];
    double v11 = v10;
    double v13 = v12;

    id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  1LL,  0LL,  v15,  1LL,  1.0,  0.0));
    [v26 addObject:v16];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  3LL,  0LL,  v18,  3LL,  1.0,  0.0));
    [v26 addObject:v19];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  7LL,  0LL,  0LL,  0LL,  1.0,  v11));
    [v26 addObject:v21];

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v22,  8LL,  0LL,  0LL,  0LL,  1.0,  v13));
    [v26 addObject:v23];

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v26);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController city](self, "city"));
    [v24 setCity:v25];
  }

  else
  {
    if (!v5) {
      return;
    }
    id v26 = (id)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
    [v26 removeFromSuperview];
  }
}

- (BOOL)_shouldShowWeatherBackgroundForLayoutType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)_fullscreenAttributionImageViewConstraints
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  double Height = CGRectGetHeight(v13);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  4LL,  0LL,  v7,  3LL,  1.0,  Height + -30.0));
  [v3 addObject:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  6LL,  0LL,  v10,  6LL,  1.0,  -30.0));
  [v3 addObject:v11];

  return v3;
}

- (void)_updateConstraintsForTodayConditionsSmall
{
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  3LL,  0LL,  v5,  3LL,  1.0,  52.0));
  [v23 addObject:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  9LL,  0LL,  v9,  9LL,  1.0,  0.0));
  [v23 addObject:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  3LL,  0LL,  v13,  4LL,  1.0,  20.0));
  [v23 addObject:v14];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v15,  5LL,  0LL,  v16,  5LL,  1.0));
  [v23 addObject:v17];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  6LL,  0LL,  v19,  6LL,  1.0,  -v20));
  [v23 addObject:v21];

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", v23);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);
}

- (void)_updateConstraintsForHourlyForecastSmall
{
  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  3LL,  0LL,  v4,  3LL,  1.0,  38.0));
  [v32 addObject:v5];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  5LL,  0LL,  v7,  5LL,  1.0));
  [v32 addObject:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  6LL,  0LL,  v10,  6LL,  1.0,  -v11));
  [v32 addObject:v12];

  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 collectionViewLayout]);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  3LL,  0LL,  v17,  4LL,  1.0,  12.0));
  [v32 addObject:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);
  [v14 itemSize];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v32 addObject:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v23,  5LL,  0LL,  v24,  5LL,  1.0));
  [v32 addObject:v25];

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 view]);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v27,  6LL,  0LL,  v28,  6LL,  1.0,  -v29));
  [v32 addObject:v30];

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", v32);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);
}

- (void)_updateConstraintsForDailyForecastSmall
{
  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  3LL,  0LL,  v4,  3LL,  1.0,  38.0));
  [v32 addObject:v5];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  5LL,  0LL,  v7,  5LL,  1.0));
  [v32 addObject:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  6LL,  0LL,  v10,  6LL,  1.0,  -v11));
  [v32 addObject:v12];

  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 collectionViewLayout]);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  3LL,  0LL,  v17,  4LL,  1.0,  12.0));
  [v32 addObject:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);
  [v14 itemSize];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v32 addObject:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v23,  5LL,  0LL,  v24,  5LL,  1.0));
  [v32 addObject:v25];

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 view]);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v27,  6LL,  0LL,  v28,  6LL,  1.0,  -v29));
  [v32 addObject:v30];

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", v32);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);
}

- (void)_updateConstraintsForForecastsFullscreen
{
  id v65 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  3LL,  0LL,  v5,  3LL,  1.0,  146.0));
  [v65 addObject:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  9LL,  0LL,  v9,  9LL,  1.0,  0.0));
  [v65 addObject:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  3LL,  0LL,  v13,  4LL,  1.0,  54.0));
  [v65 addObject:v14];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v15,  5LL,  0LL,  v16,  5LL,  1.0));
  [v65 addObject:v17];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  6LL,  0LL,  v19,  6LL,  1.0,  -v20));
  [v65 addObject:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController _addDividerLineView](self, "_addDividerLineView"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v22,  3LL,  0LL,  v23,  4LL,  1.0,  62.0));
  [v65 addObject:v24];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 collectionViewLayout]);

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 view]);
  double v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v28,  3LL,  0LL,  v22,  4LL,  1.0,  46.0));
  [v65 addObject:v29];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 view]);
  [v26 itemSize];
  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v31,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v65 addObject:v32];

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 view]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v34,  5LL,  0LL,  v35,  5LL,  1.0));
  [v65 addObject:v36];

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 view]);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v38,  6LL,  0LL,  v39,  6LL,  1.0,  -v40));
  [v65 addObject:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController _addDividerLineView](self, "_addDividerLineView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 view]);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v42,  3LL,  0LL,  v44,  4LL,  1.0,  44.0));
  [v65 addObject:v45];

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 collectionViewLayout]);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 view]);
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v49,  3LL,  0LL,  v42,  4LL,  1.0,  86.0));
  [v65 addObject:v50];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v51 view]);
  [v47 itemSize];
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v52,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v65 addObject:v53];

  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 view]);
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v55,  5LL,  0LL,  v56,  5LL,  1.0));
  [v65 addObject:v57];

  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 view]);
  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v59,  6LL,  0LL,  v60,  6LL,  1.0,  -v61));
  [v65 addObject:v62];

  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController _fullscreenAttributionImageViewConstraints]( self,  "_fullscreenAttributionImageViewConstraints"));
  [v65 addObjectsFromArray:v63];

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", v65);
  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v64);
}

- (void)_updateConstraintsForTodayFullscreen
{
  id v76 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v3 = -[WTVSnippetViewController transitionFromLayoutType](self, "transitionFromLayoutType");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  if (v3 == 2)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
    double v7 = -54.0;
    double v8 = 1.0;
    id v9 = v5;
    uint64_t v10 = 4LL;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    double v7 = 146.0;
    double v8 = 1.0;
    id v9 = v5;
    uint64_t v10 = 3LL;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  v10,  0LL,  v6,  3LL,  v8,  v7));
  [v76 addObject:v11];

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  9LL,  0LL,  v14,  9LL,  1.0,  0.0));
  [v76 addObject:v15];

  unint64_t v16 = -[WTVSnippetViewController transitionFromLayoutType](self, "transitionFromLayoutType");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  if (v16 == 2)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  3LL,  0LL,  v18,  3LL,  1.0,  296.0));
    [v76 addObject:v19];
  }

  else
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController currentConditionsViewController](self, "currentConditionsViewController"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
    double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  3LL,  0LL,  v19,  4LL,  1.0,  54.0));
    [v76 addObject:v20];
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v21,  5LL,  0LL,  v22,  5LL,  1.0));
  [v76 addObject:v23];

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v24,  6LL,  0LL,  v25,  6LL,  1.0,  -v26));
  [v76 addObject:v27];

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController _addDividerLineView](self, "_addDividerLineView"));
  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 view]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v28,  3LL,  0LL,  v30,  3LL,  1.0,  -48.0));

  LODWORD(v32) = 1144750080;
  [v31 setPriority:v32];
  [v76 addObject:v31];
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v28,  3LL,  1LL,  v33,  4LL,  1.0,  10.0));
  [v76 addObject:v34];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v35 collectionViewLayout]);

  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 view]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v37,  3LL,  0LL,  v38,  4LL,  1.0,  110.0));
  [v76 addObject:v39];

  double v40 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 view]);
  [v75 itemSize];
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v41,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v76 addObject:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 view]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v44,  5LL,  0LL,  v45,  5LL,  1.0));
  [v76 addObject:v46];

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v47 view]);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v48,  6LL,  0LL,  v49,  6LL,  1.0,  -v50));
  [v76 addObject:v51];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController _addDividerLineView](self, "_addDividerLineView"));
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController hourlyForecastViewController](self, "hourlyForecastViewController"));
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 view]);
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v52,  3LL,  0LL,  v54,  4LL,  1.0,  44.0));
  [v76 addObject:v55];

  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController conditionDetailViewController](self, "conditionDetailViewController"));
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v56 collectionViewLayout]);

  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController conditionDetailViewController](self, "conditionDetailViewController"));
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 view]);
  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v59,  3LL,  0LL,  v52,  4LL,  1.0,  86.0));
  [v76 addObject:v60];

  double v61 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController conditionDetailViewController](self, "conditionDetailViewController"));
  __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v61 view]);
  [v57 itemSize];
  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v62,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v76 addObject:v63];

  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController conditionDetailViewController](self, "conditionDetailViewController"));
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 view]);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v65,  5LL,  0LL,  v66,  5LL,  1.0));
  [v76 addObject:v67];

  CGSize v68 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController conditionDetailViewController](self, "conditionDetailViewController"));
  CGRect v69 = (void *)objc_claimAutoreleasedReturnValue([v68 view]);
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v69,  6LL,  0LL,  v70,  6LL,  1.0,  -v71));
  [v76 addObject:v72];

  v73 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController _fullscreenAttributionImageViewConstraints]( self,  "_fullscreenAttributionImageViewConstraints"));
  [v76 addObjectsFromArray:v73];

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", v76);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v74);
}

- (void)_updateConstraintsForDailyForecastFullscreen
{
  id v54 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  3LL,  0LL,  v4,  3LL,  1.0,  96.0));
  [v54 addObject:v5];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  5LL,  0LL,  v7,  5LL,  1.0));
  [v54 addObject:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  6LL,  0LL,  v10,  6LL,  1.0,  -v11));
  [v54 addObject:v12];

  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 collectionViewLayout]);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController summaryLabel](self, "summaryLabel"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  3LL,  0LL,  v17,  4LL,  1.0,  64.0));

  LODWORD(v19) = 1144733696;
  [v18 setPriority:v19];
  [v54 addObject:v18];
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
  [v14 itemSize];
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v21,  8LL,  0LL,  0LL,  0LL,  1.0));
  [v54 addObject:v22];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 view]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  double v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v24,  5LL,  0LL,  v25,  5LL,  1.0));
  [v54 addObject:v26];

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 view]);
  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  -[WTVSnippetViewController contentMargins](self, "contentMargins");
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v28,  6LL,  0LL,  v29,  6LL,  1.0,  -v30));
  [v54 addObject:v31];

  double v32 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController temperatureGraphViewController](self, "temperatureGraphViewController"));
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 view]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController dailyForecastViewController](self, "dailyForecastViewController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 view]);
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v33,  3LL,  0LL,  v35,  4LL,  1.0,  14.0));
  [v54 addObject:v36];

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController temperatureGraphViewController](self, "temperatureGraphViewController"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 view]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v38,  8LL,  0LL,  0LL,  0LL,  1.0,  498.0));
  [v54 addObject:v39];

  double v40 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController temperatureGraphViewController](self, "temperatureGraphViewController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 view]);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v41,  5LL,  0LL,  v42,  5LL,  1.0,  0.0));
  [v54 addObject:v43];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController temperatureGraphViewController](self, "temperatureGraphViewController"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 view]);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v45,  6LL,  0LL,  v46,  6LL,  1.0,  0.0));
  [v54 addObject:v47];

  v48 = (void *)objc_claimAutoreleasedReturnValue( -[WTVSnippetViewController _fullscreenAttributionImageViewConstraints]( self,  "_fullscreenAttributionImageViewConstraints"));
  [v54 addObjectsFromArray:v48];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController temperatureGraphViewController](self, "temperatureGraphViewController"));
  double v50 = (void *)objc_claimAutoreleasedReturnValue([v49 view]);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController attributionImageView](self, "attributionImageView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v50,  4LL,  -1LL,  v51,  3LL,  1.0,  -15.0));
  [v54 addObject:v52];

  -[WTVSnippetViewController setLayoutConstraints:](self, "setLayoutConstraints:", v54);
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController layoutConstraints](self, "layoutConstraints"));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v53);
}

- (BOOL)isDataMetricForUnitType:(unint64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController siriWeatherObject](self, "siriWeatherObject"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 units]);

  switch(a3)
  {
    case 0uLL:
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 temperatureUnits]);
      if (!v6) {
        goto LABEL_12;
      }
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 temperatureUnits]);
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
      id v9 = v8;
      uint64_t v10 = @"celsius";
      goto LABEL_11;
    case 1uLL:
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pressureUnits]);
      if (!v6) {
        goto LABEL_12;
      }
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pressureUnits]);
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
      id v9 = v8;
      uint64_t v10 = @"mb";
      goto LABEL_11;
    case 2uLL:
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 speedUnits]);
      if (!v6) {
        goto LABEL_12;
      }
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 speedUnits]);
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
      id v9 = v8;
      uint64_t v10 = @"kph";
      goto LABEL_11;
    case 3uLL:
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 distanceUnits]);
      if (v6)
      {
        double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 distanceUnits]);
        double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
        id v9 = v8;
        uint64_t v10 = @"kilometers";
LABEL_11:
        unsigned __int8 v11 = [v8 isEqualToString:v10];
      }

      else
      {
LABEL_12:
        unsigned __int8 v11 = 1;
      }

LABEL_14:
      return v11;
    default:
      unsigned __int8 v11 = 1;
      goto LABEL_14;
  }

- (BOOL)shouldShowMetricForUnitType:(unint64_t)a3
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherPreferences](self, "weatherPreferences", a3));
  unsigned __int8 v4 = [v3 isCelsius];

  return v4;
}

- (void)_debug_iterateConditions:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController delegate](self, "delegate", a3));
  [v4 userInteractionDidOccurForSnippetViewController:self];

  if (qword_23AC8 == 3200)
  {
    qword_23AC8 = 0LL;
    if (!self->_debug_conditionLabel)
    {
      double v6 = (UILabel *)objc_opt_new(&OBJC_CLASS___UILabel, v5);
      debug_conditionLabel = self->_debug_conditionLabel;
      self->_debug_conditionLabel = v6;

      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
      -[UILabel setTextColor:](self->_debug_conditionLabel, "setTextColor:", v8);

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  40.0,  UIFontWeightBold));
      -[UILabel setFont:](self->_debug_conditionLabel, "setFont:", v9);

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController view](self, "view"));
      [v10 addSubview:self->_debug_conditionLabel];
    }
  }

  else
  {
    unint64_t v11 = ++qword_23AC8;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue([&off_1E778 objectAtIndex:qword_23AC8]);
  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@"_"]);
  if ([v13 count])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    id v15 = [v14 integerValue];

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 lastObject]);
    id v17 = [v16 isEqualToString:@"night"];

    __int128 v18 = &stru_1D1D8;
    if ((_DWORD)v17) {
      __int128 v18 = @"(Night) ";
    }
  }

  else
  {
    id v15 = [v12 integerValue];
    id v17 = 0LL;
    __int128 v18 = &stru_1D1D8;
  }

  else {
    unsigned int v19 = -(int)v15;
  }
  double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%d %@",  v18,  v15,  WeatherDescription[v19]));
  -[WTVSnippetViewController _debug_setDebugConditionCode:isNight:]( self,  "_debug_setDebugConditionCode:isNight:",  v15,  v17);
  uint64_t v21 = WALogForCategory(0LL);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_11B14((uint64_t)v20, v22);
  }

  -[UILabel setText:](self->_debug_conditionLabel, "setText:", v20);
  -[UILabel sizeToFit](self->_debug_conditionLabel, "sizeToFit");
  double y = CGPointZero.y;
  -[UILabel frame](self->_debug_conditionLabel, "frame");
  -[UILabel setFrame:](self->_debug_conditionLabel, "setFrame:", CGPointZero.x, y);
}

- (void)_debug_setDebugConditionCode:(int64_t)a3 isNight:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 condition]);

  [v8 setForcesCondition:1];
  [v8 setForcesNight:v4];
  [v8 setCondition:a3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 city]);
  uint64_t v10 = v9;
  if (a3 >= 0) {
    int64_t v11 = a3;
  }
  else {
    int64_t v11 = -a3;
  }
  [v9 setConditionCode:v11];
  BOOL v12 = a3 == 27 || a3 < 0;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0x1D) {
    BOOL v12 = 1;
  }
  if (a3 == 33) {
    BOOL v12 = 1;
  }
  if (a3 == 47) {
    BOOL v12 = 1;
  }
  if (v12 || v4) {
    double v13 = -59.0;
  }
  else {
    double v13 = 59.0;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13));
  [v14 setSunHeightOverride:v15];

  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
  double v29 = v10;
  [v16 setCity:v10];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController weatherBackground](self, "weatherBackground"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
  [v17 addSublayer:v18];

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController siriWeatherObject](self, "siriWeatherObject"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currentConditions]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 condition]);
  [v21 setConditionCodeIndex:a3];
  [v20 setCondition:v21];
  [v19 setCurrentConditions:v20];
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 hourlyForecasts]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_73C8;
  v34[3] = &unk_1C5E8;
  v34[4] = a3;
  [v22 enumerateObjectsUsingBlock:v34];
  [v19 setHourlyForecasts:v22];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetViewController _allSnippetViewControllers](self, "_allSnippetViewControllers"));
  id v24 = [v23 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        __int128 v28 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        [v28 setSiriWeatherObject:0];
        [v28 setSiriWeatherObject:v19];
      }

      id v25 = [v23 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v25);
  }
}

- (void)setWeatherPreferences:(id)a3
{
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (SAWeatherTVObject)siriWeatherObject
{
  return self->_siriWeatherObject;
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (double)singleLinePreferredContentHeight
{
  return self->_singleLinePreferredContentHeight;
}

- (void)setSingleLinePreferredContentHeight:(double)a3
{
  self->_singleLinePreferredContentdouble Height = a3;
}

- (CGSize)effectivePreferredContentSize
{
  double width = self->_effectivePreferredContentSize.width;
  double height = self->_effectivePreferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEffectivePreferredContentSize:(CGSize)a3
{
  self->_effectivePreferredContentSize = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (unint64_t)transitionFromLayoutType
{
  return self->_transitionFromLayoutType;
}

- (void)setTransitionFromLayoutType:(unint64_t)a3
{
  self->_transitionFromLayoutType = a3;
}

- (WTVConstraintInterpolator)transitionConstraintInterpolator
{
  return self->_transitionConstraintInterpolator;
}

- (void)setTransitionConstraintInterpolator:(id)a3
{
}

- (NSSet)viewsToFadeIn
{
  return self->_viewsToFadeIn;
}

- (void)setViewsToFadeIn:(id)a3
{
}

- (NSSet)viewsToFadeOut
{
  return self->_viewsToFadeOut;
}

- (void)setViewsToFadeOut:(id)a3
{
}

- (NSSet)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
{
}

- (NSArray)snapshotsConstraints
{
  return self->_snapshotsConstraints;
}

- (void)setSnapshotsConstraints:(id)a3
{
}

- (BOOL)appliedFullscreen
{
  return self->_appliedFullscreen;
}

- (void)setAppliedFullscreen:(BOOL)a3
{
  self->_appliedFullscreen = a3;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
}

- (UIImageView)attributionImageView
{
  return self->_attributionImageView;
}

- (void)setAttributionImageView:(id)a3
{
}

- (void)setWeatherBackground:(id)a3
{
}

- (NSMutableArray)dividerLineViews
{
  return self->_dividerLineViews;
}

- (void)setDividerLineViews:(id)a3
{
}

- (void)setCurrentConditionsViewController:(id)a3
{
}

- (void)setHourlyForecastViewController:(id)a3
{
}

- (void)setDailyForecastViewController:(id)a3
{
}

- (void)setConditionDetailViewController:(id)a3
{
}

- (void)setTemperatureGraphViewController:(id)a3
{
}

- (BOOL)debug_isIteratingConditionsOnTimer
{
  return self->_debug_isIteratingConditionsOnTimer;
}

- (void)setDebug_isIteratingConditionsOnTimer:(BOOL)a3
{
  self->_debug_isIteratingConditionsOnTimer = a3;
}

- (UILabel)debug_conditionLabel
{
  return self->_debug_conditionLabel;
}

- (void)setDebug_conditionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end