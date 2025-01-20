@interface WTVHourlyForecastViewController
- (NSArray)displayedHourlyForecasts;
- (SAWeatherTVObject)siriWeatherObject;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (WTVHourlyForecastViewController)init;
- (WTVUnitDelegate)unitDelegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)textStyle;
- (void)_updateDisplayedHourlyForecasts;
- (void)didReceiveMemoryWarning;
- (void)setDisplayedHourlyForecasts:(id)a3;
- (void)setSiriWeatherObject:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setUnitDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WTVHourlyForecastViewController

- (WTVHourlyForecastViewController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 1LL);
  -[UICollectionViewFlowLayout setItemSize:](v3, "setItemSize:", 145.0, 180.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WTVHourlyForecastViewController;
  v4 = -[WTVHourlyForecastViewController initWithCollectionViewLayout:](&v6, "initWithCollectionViewLayout:", v3);

  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WTVHourlyForecastViewController;
  -[WTVHourlyForecastViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController collectionView](self, "collectionView"));
  [v3 setAllowsSelection:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController collectionView](self, "collectionView"));
  [v5 setBackgroundColor:v4];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController collectionView](self, "collectionView"));
  [v6 registerClass:objc_opt_class(WTVHourlyForecastCell) forCellWithReuseIdentifier:@"HourlyForecastCell"];

  -[WTVHourlyForecastViewController _updateDisplayedHourlyForecasts](self, "_updateDisplayedHourlyForecasts");
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WTVHourlyForecastViewController;
  -[WTVHourlyForecastViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setSiriWeatherObject:(id)a3
{
  v5 = (SAWeatherTVObject *)a3;
  if (self->_siriWeatherObject != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_siriWeatherObject, a3);
    -[WTVHourlyForecastViewController _updateDisplayedHourlyForecasts](self, "_updateDisplayedHourlyForecasts");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController collectionView](self, "collectionView"));
    [v3 reloadData];
  }

- (void)_updateDisplayedHourlyForecasts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController siriWeatherObject](self, "siriWeatherObject"));

  if (v3)
  {
    id v51 = (id)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hourlyForecasts]);
    id v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0LL;
      do
      {
        if ((v8 & 1) == 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hourlyForecasts]);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v8]);

          v12 = objc_alloc_init(&OBJC_CLASS___WTVHourlyForecast);
          -[WTVHourlyForecast setType:](v12, "setType:", 0LL);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v11 condition]);
          -[WTVHourlyForecast setCondition:](v12, "setCondition:", [v13 conditionCodeIndex]);

          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 temperature]);
          -[WTVHourlyForecast setTemperature:](v12, "setTemperature:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue([v11 timeIndex]);
          id v16 = [v15 integerValue];

          -[WTVHourlyForecast setTimeIntValue:](v12, "setTimeIntValue:", (100 * (_DWORD)v16));
          v17 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
          -[NSDateComponents setHour:](v17, "setHour:", v16);
          -[NSDateComponents setMinute:](v17, "setMinute:", 0LL);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v51 dateFromComponents:v17]);
          uint64_t v19 = FormatShortTime(v18, 0LL, 1LL);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          -[WTVHourlyForecast setFormattedTimeString:](v12, "setFormattedTimeString:", v20);

          [v4 addObject:v12];
        }

        ++v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 hourlyForecasts]);
        id v23 = [v22 count];
      }

      while (v8 < (unint64_t)v23);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currentConditions]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sunrise]);

    if (v26)
    {
      v27 = objc_alloc_init(&OBJC_CLASS___WTVHourlyForecast);
      -[WTVHourlyForecast setType:](v27, "setType:", 1LL);
      -[WTVHourlyForecast setTimeIntValue:](v27, "setTimeIntValue:", TimeStringToIntValue(v26));
      uint64_t v28 = TimeInRegionFormatFromFourDigitTime(v26, 1LL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[WTVHourlyForecast setFormattedTimeString:](v27, "setFormattedTimeString:", v29);

      if ([v4 count])
      {
        unint64_t v30 = 1LL;
        while (1)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v30 - 1]);
          v32 = (char *)(v30 - 1) >= (char *)[v4 count] - 1
              ? 0LL
              : (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v30]);
          int v33 = -[WTVHourlyForecast timeIntValue](v27, "timeIntValue");
          if (v33 >= (int)[v31 timeIntValue])
          {
            if (!v32) {
              break;
            }
            int v34 = [v32 timeIntValue];
            if (v34 > -[WTVHourlyForecast timeIntValue](v27, "timeIntValue")) {
              break;
            }
          }

          BOOL v35 = v30++ >= (unint64_t)[v4 count];
          if (v35) {
            goto LABEL_21;
          }
        }

        [v4 insertObject:v27 atIndex:v30];
      }

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController displayedHourlyForecasts](self, "displayedHourlyForecasts", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController displayedHourlyForecasts](self, "displayedHourlyForecasts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item")));

  v10 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableCellWithReuseIdentifier:@"HourlyForecastCell" forIndexPath:v6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController unitDelegate](self, "unitDelegate"));
  [v10 setUnitDelegate:v11];

  [v10 setHourlyForecast:v9];
  objc_msgSend(v10, "setTextStyle:", -[WTVHourlyForecastViewController textStyle](self, "textStyle"));

  return v10;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController displayedHourlyForecasts](self, "displayedHourlyForecasts"));
  id v8 = [v7 count];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController view](self, "view"));
  [v9 frame];
  double v11 = v10;
  [v6 itemSize];
  double v13 = v11 - (double)(uint64_t)v8 * v12;
  [v6 minimumLineSpacing];
  double v15 = v14;

  double v16 = (v13 - (double)((unint64_t)v8 - 1) * v15) * 0.5;
  double v17 = 0.0;
  if (v16 >= 0.0) {
    double v18 = v16;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = 0.0;
  double v20 = v18;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
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

- (NSArray)displayedHourlyForecasts
{
  return self->_displayedHourlyForecasts;
}

- (void)setDisplayedHourlyForecasts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end