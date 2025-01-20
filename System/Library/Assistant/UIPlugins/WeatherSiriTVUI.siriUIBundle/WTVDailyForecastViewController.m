@interface WTVDailyForecastViewController
- (NSArray)displayedSiriDailyForecasts;
- (SAWeatherTVObject)siriWeatherObject;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (WTVDailyForecastViewController)init;
- (WTVUnitDelegate)unitDelegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)textStyle;
- (void)_updateDisplayedDailyForecasts;
- (void)didReceiveMemoryWarning;
- (void)setDisplayedSiriDailyForecasts:(id)a3;
- (void)setSiriWeatherObject:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setUnitDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WTVDailyForecastViewController

- (WTVDailyForecastViewController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 1LL);
  -[UICollectionViewFlowLayout setItemSize:](v3, "setItemSize:", 193.0, 250.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WTVDailyForecastViewController;
  v4 = -[WTVDailyForecastViewController initWithCollectionViewLayout:](&v6, "initWithCollectionViewLayout:", v3);

  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WTVDailyForecastViewController;
  -[WTVDailyForecastViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController collectionView](self, "collectionView"));
  [v3 setAllowsSelection:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController collectionView](self, "collectionView"));
  [v5 setBackgroundColor:v4];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController collectionView](self, "collectionView"));
  [v6 registerClass:objc_opt_class(WTVDailyForecastCell) forCellWithReuseIdentifier:@"HourlyForecastCell"];

  -[WTVDailyForecastViewController _updateDisplayedDailyForecasts](self, "_updateDisplayedDailyForecasts");
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WTVDailyForecastViewController;
  -[WTVDailyForecastViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setSiriWeatherObject:(id)a3
{
  v5 = (SAWeatherTVObject *)a3;
  if (self->_siriWeatherObject != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_siriWeatherObject, a3);
    -[WTVDailyForecastViewController _updateDisplayedDailyForecasts](self, "_updateDisplayedDailyForecasts");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController collectionView](self, "collectionView"));
    [v3 reloadData];
  }

- (void)_updateDisplayedDailyForecasts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController siriWeatherObject](self, "siriWeatherObject"));

  if (v3)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    for (unint64_t i = 0LL; ; ++i)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dailyForecasts]);
      id v7 = [v6 count];

      unint64_t v8 = (unint64_t)((unint64_t)v7 >= 9 ? &dword_8 + 1 : v7);
      if (i >= v8) {
        break;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dailyForecasts]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:i]);
      [v13 addObject:v11];
    }

    -[WTVDailyForecastViewController setDisplayedSiriDailyForecasts:](self, "setDisplayedSiriDailyForecasts:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController collectionView](self, "collectionView"));
    [v12 reloadData];
  }

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[WTVDailyForecastViewController displayedSiriDailyForecasts]( self,  "displayedSiriDailyForecasts",  a3,  a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dailyForecasts]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item")));

  v11 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableCellWithReuseIdentifier:@"HourlyForecastCell" forIndexPath:v6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController unitDelegate](self, "unitDelegate"));
  [v11 setUnitDelegate:v12];

  [v11 setDailyForecast:v10];
  objc_msgSend(v11, "setTextStyle:", -[WTVDailyForecastViewController textStyle](self, "textStyle"));

  return v11;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController displayedSiriDailyForecasts](self, "displayedSiriDailyForecasts"));
  id v8 = [v7 count];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVDailyForecastViewController view](self, "view"));
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

- (NSArray)displayedSiriDailyForecasts
{
  return self->_displayedSiriDailyForecasts;
}

- (void)setDisplayedSiriDailyForecasts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end