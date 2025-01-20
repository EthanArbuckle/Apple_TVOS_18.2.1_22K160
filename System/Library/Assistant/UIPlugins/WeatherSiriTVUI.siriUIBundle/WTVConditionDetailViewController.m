@interface WTVConditionDetailViewController
- (NSArray)displayedConditionDetailTypes;
- (NSDictionary)conditionDetailTypeToDescriptionMap;
- (NSDictionary)conditionDetailTypeToIconMap;
- (NSDictionary)conditionDetailTypeToValueMap;
- (SAWeatherTVObject)siriWeatherObject;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (WTVConditionDetailViewController)init;
- (WTVUnitDelegate)unitDelegate;
- (id)_percentFormatter;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)textStyle;
- (void)_updateDisplayedConditionDetailTypes;
- (void)didReceiveMemoryWarning;
- (void)setConditionDetailTypeToDescriptionMap:(id)a3;
- (void)setConditionDetailTypeToIconMap:(id)a3;
- (void)setConditionDetailTypeToValueMap:(id)a3;
- (void)setDisplayedConditionDetailTypes:(id)a3;
- (void)setSiriWeatherObject:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setUnitDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WTVConditionDetailViewController

- (WTVConditionDetailViewController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 1LL);
  -[UICollectionViewFlowLayout setItemSize:](v3, "setItemSize:", 200.0, 250.0);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WTVConditionDetailViewController;
  v4 = -[WTVConditionDetailViewController initWithCollectionViewLayout:](&v6, "initWithCollectionViewLayout:", v3);

  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WTVConditionDetailViewController;
  -[WTVConditionDetailViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController collectionView](self, "collectionView"));
  [v3 setAllowsSelection:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController collectionView](self, "collectionView"));
  [v5 setBackgroundColor:v4];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController collectionView](self, "collectionView"));
  [v6 registerClass:objc_opt_class(WTVConditionDetailCell) forCellWithReuseIdentifier:@"ConditionDetailCell"];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WTVConditionDetailViewController;
  -[WTVConditionDetailViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setSiriWeatherObject:(id)a3
{
  v5 = (SAWeatherTVObject *)a3;
  if (self->_siriWeatherObject != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_siriWeatherObject, a3);
    -[WTVConditionDetailViewController _updateDisplayedConditionDetailTypes]( self,  "_updateDisplayedConditionDetailTypes");
    v5 = v6;
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController collectionView](self, "collectionView"));
    [v3 reloadData];
  }

- (id)_percentFormatter
{
  objc_super v2 = (void *)qword_23F00;
  if (!qword_23F00)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    v4 = (void *)qword_23F00;
    qword_23F00 = (uint64_t)v3;

    [(id)qword_23F00 setNumberStyle:3];
    objc_super v2 = (void *)qword_23F00;
  }

  return v2;
}

- (void)_updateDisplayedConditionDetailTypes
{
  id v146 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));

  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 weatherCityRepresentation]);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hourlyForecasts]);
    id v11 = [v10 count];

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 hourlyForecasts]);
      double v13 = ChanceOfRainWithHourlyForecasts();

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController _percentFormatter](self, "_percentFormatter"));
      double v15 = v13 / 100.0;
      *(float *)&double v15 = v13 / 100.0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v14 stringFromNumber:v16]);

      v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = PrecipitationDescription(v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:v21 value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);

      v23 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-Rain",  v24,  0LL));

      [v146 addObject:&off_1E2D8];
      [v4 setObject:v17 forKeyedSubscript:&off_1E2D8];
      [v5 setObject:v22 forKeyedSubscript:&off_1E2D8];
      if (v25) {
        [v3 setObject:v25 forKeyedSubscript:&off_1E2D8];
      }
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 currentConditions]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 percentHumidity]);

    v144 = v8;
    v145 = v3;
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 currentConditions]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 percentHumidity]);
      [v31 floatValue];
      double v33 = v32 / 100.0;

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController _percentFormatter](self, "_percentFormatter"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v34 stringFromNumber:v35]);

      v37 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-Humidity",  v38,  0LL));

      [v146 addObject:&off_1E2F0];
      [v4 setObject:v36 forKeyedSubscript:&off_1E2F0];
      v40 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue( [v41 localizedStringForKey:@"HUMIDITY" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      [v5 setObject:v42 forKeyedSubscript:&off_1E2F0];

      id v3 = v145;
      if (v39) {
        [v145 setObject:v39 forKeyedSubscript:&off_1E2F0];
      }
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 currentConditions]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 windSpeed]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);

    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 currentConditions]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 windSpeed]);
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 value]);
      [v50 floatValue];
      double v52 = v51;

      v53 = (void *)objc_claimAutoreleasedReturnValue( +[WeatherWindSpeedFormatter convenienceFormatter]( &OBJC_CLASS___WeatherWindSpeedFormatter,  "convenienceFormatter"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v52));
      v55 = (void *)objc_claimAutoreleasedReturnValue([v53 stringForObjectValue:v54]);

      v56 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-Wind",  v57,  0LL));

      [v146 addObject:&off_1E308];
      [v4 setObject:v55 forKeyedSubscript:&off_1E308];
      v59 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue( [v60 localizedStringForKey:@"WIND" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      [v5 setObject:v61 forKeyedSubscript:&off_1E308];

      id v3 = v145;
      if (v58) {
        [v145 setObject:v58 forKeyedSubscript:&off_1E308];
      }
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue([v8 feelsLike]);

    if (v62)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue([v8 feelsLike]);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController unitDelegate](self, "unitDelegate"));
      else {
        uint64_t v65 = 1LL;
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue( +[WFTemperatureFormatter temperatureFormatterWithInputUnit:outputUnit:]( &OBJC_CLASS___WFTemperatureFormatter,  "temperatureFormatterWithInputUnit:outputUnit:",  v65,  v65));
      v67 = (void *)objc_claimAutoreleasedReturnValue([v66 stringForObjectValue:v63]);
      v68 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-FeelsLike",  v69,  0LL));

      [v146 addObject:&off_1E320];
      [v4 setObject:v67 forKeyedSubscript:&off_1E320];
      v71 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue( [v72 localizedStringForKey:@"FEELS_LIKE" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      id v3 = v145;
      [v5 setObject:v73 forKeyedSubscript:&off_1E320];

      if (v70) {
        [v145 setObject:v70 forKeyedSubscript:&off_1E320];
      }
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 currentConditions]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v75 totalDailyPrecipitation]);

    if (v76)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
      v78 = (void *)objc_claimAutoreleasedReturnValue([v77 currentConditions]);
      v79 = (void *)objc_claimAutoreleasedReturnValue([v78 totalDailyPrecipitation]);
      [v79 floatValue];
      double v81 = v80;

      v82 = (void *)objc_claimAutoreleasedReturnValue( +[WeatherPrecipitationFormatter convenienceFormatter]( &OBJC_CLASS___WeatherPrecipitationFormatter,  "convenienceFormatter"));
      v83 = (void *)objc_claimAutoreleasedReturnValue([v82 stringFromCentimeters:v81]);

      v84 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-Precipitation",  v85,  0LL));

      [v146 addObject:&off_1E338];
      [v4 setObject:v83 forKeyedSubscript:&off_1E338];
      v87 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
      v89 = (void *)objc_claimAutoreleasedReturnValue( [v88 localizedStringForKey:@"PRECIPITATION" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      [v5 setObject:v89 forKeyedSubscript:&off_1E338];

      if (v86) {
        [v3 setObject:v86 forKeyedSubscript:&off_1E338];
      }
    }

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v91 = (void *)objc_claimAutoreleasedReturnValue([v90 currentConditions]);
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 barometricPressure]);
    v93 = (void *)objc_claimAutoreleasedReturnValue([v92 value]);

    if (v93)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
      v95 = (void *)objc_claimAutoreleasedReturnValue([v94 currentConditions]);
      v96 = (void *)objc_claimAutoreleasedReturnValue([v95 barometricPressure]);
      v97 = (void *)objc_claimAutoreleasedReturnValue([v96 value]);
      [v97 floatValue];
      int v99 = v98;

      v100 = (void *)objc_claimAutoreleasedReturnValue( +[WeatherPressureFormatter convenienceFormatter]( &OBJC_CLASS___WeatherPressureFormatter,  "convenienceFormatter"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController unitDelegate](self, "unitDelegate"));
      id v102 = [v101 isDataMetricForUnitType:1];

      LODWORD(v103) = v99;
      v104 = (void *)objc_claimAutoreleasedReturnValue([v100 stringFromPressure:v102 isDataMetric:v103]);
      v105 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
      v107 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-Pressure",  v106,  0LL));

      [v146 addObject:&off_1E350];
      [v4 setObject:v104 forKeyedSubscript:&off_1E350];
      v108 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
      v110 = (void *)objc_claimAutoreleasedReturnValue( [v109 localizedStringForKey:@"PRESSURE" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      [v5 setObject:v110 forKeyedSubscript:&off_1E350];

      if (v107) {
        [v3 setObject:v107 forKeyedSubscript:&off_1E350];
      }
    }

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v112 = (void *)objc_claimAutoreleasedReturnValue([v111 currentConditions]);
    v113 = (void *)objc_claimAutoreleasedReturnValue([v112 visibility]);

    if (v113)
    {
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
      v115 = (void *)objc_claimAutoreleasedReturnValue([v114 currentConditions]);
      v116 = (void *)objc_claimAutoreleasedReturnValue([v115 visibility]);
      [v116 floatValue];
      double v118 = v117;

      v119 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController unitDelegate](self, "unitDelegate"));
      id v120 = [v119 isDataMetricForUnitType:3];

      v121 = (void *)objc_claimAutoreleasedReturnValue( +[WeatherVisibilityFormatter convenienceFormatter]( &OBJC_CLASS___WeatherVisibilityFormatter,  "convenienceFormatter"));
      v122 = (void *)objc_claimAutoreleasedReturnValue([v121 stringFromDistance:v120 isDataMetric:v118]);
      v123 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
      v125 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-Visibility",  v124,  0LL));

      [v146 addObject:&off_1E368];
      [v4 setObject:v122 forKeyedSubscript:&off_1E368];
      v126 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
      v128 = (void *)objc_claimAutoreleasedReturnValue( [v127 localizedStringForKey:@"VISIBILITY" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      [v5 setObject:v128 forKeyedSubscript:&off_1E368];

      if (v125) {
        [v3 setObject:v125 forKeyedSubscript:&off_1E368];
      }
    }

    v129 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
    v130 = (void *)objc_claimAutoreleasedReturnValue([v129 currentConditions]);
    v131 = (void *)objc_claimAutoreleasedReturnValue([v130 uvIndex]);

    if (v131)
    {
      v132 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController siriWeatherObject](self, "siriWeatherObject"));
      v133 = (void *)objc_claimAutoreleasedReturnValue([v132 currentConditions]);
      v134 = (void *)objc_claimAutoreleasedReturnValue([v133 uvIndex]);
      id v135 = [v134 integerValue];

      v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v135));
      v137 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
      v139 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Siri-Weather-UVIndex",  v138,  0LL));

      [v146 addObject:&off_1E380];
      [v4 setObject:v136 forKeyedSubscript:&off_1E380];
      v140 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___WeatherPreferences));
      v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
      v142 = (void *)objc_claimAutoreleasedReturnValue( [v141 localizedStringForKey:@"UV_INDEX" value:&stru_1D1D8 table:@"WeatherFrameworkLocalizableStrings"]);
      [v5 setObject:v142 forKeyedSubscript:&off_1E380];

      if (v139) {
        [v3 setObject:v139 forKeyedSubscript:&off_1E380];
      }
    }

    -[WTVConditionDetailViewController setDisplayedConditionDetailTypes:]( self,  "setDisplayedConditionDetailTypes:",  v146);
    -[WTVConditionDetailViewController setConditionDetailTypeToIconMap:](self, "setConditionDetailTypeToIconMap:", v3);
    -[WTVConditionDetailViewController setConditionDetailTypeToValueMap:](self, "setConditionDetailTypeToValueMap:", v4);
    -[WTVConditionDetailViewController setConditionDetailTypeToDescriptionMap:]( self,  "setConditionDetailTypeToDescriptionMap:",  v5);
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController collectionView](self, "collectionView"));
    [v143 reloadData];
  }

  else
  {
    -[WTVConditionDetailViewController setDisplayedConditionDetailTypes:]( self,  "setDisplayedConditionDetailTypes:",  v146);
    -[WTVConditionDetailViewController setConditionDetailTypeToIconMap:](self, "setConditionDetailTypeToIconMap:", v3);
    -[WTVConditionDetailViewController setConditionDetailTypeToValueMap:](self, "setConditionDetailTypeToValueMap:", v4);
    -[WTVConditionDetailViewController setConditionDetailTypeToDescriptionMap:]( self,  "setConditionDetailTypeToDescriptionMap:",  v5);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[WTVConditionDetailViewController displayedConditionDetailTypes]( self,  "displayedConditionDetailTypes",  a3,  a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithReuseIdentifier:@"ConditionDetailCell" forIndexPath:v6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[WTVConditionDetailViewController displayedConditionDetailTypes]( self,  "displayedConditionDetailTypes"));
  id v9 = [v6 item];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v9]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController conditionDetailTypeToIconMap](self, "conditionDetailTypeToIconMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
  [v7 setIcon:v12];

  double v13 = (void *)objc_claimAutoreleasedReturnValue( -[WTVConditionDetailViewController conditionDetailTypeToValueMap]( self,  "conditionDetailTypeToValueMap"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);
  [v7 setValueString:v14];

  double v15 = (void *)objc_claimAutoreleasedReturnValue( -[WTVConditionDetailViewController conditionDetailTypeToDescriptionMap]( self,  "conditionDetailTypeToDescriptionMap"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v10]);
  [v7 setDescriptionString:v16];

  objc_msgSend(v7, "setTextStyle:", -[WTVConditionDetailViewController textStyle](self, "textStyle"));
  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( -[WTVConditionDetailViewController displayedConditionDetailTypes]( self,  "displayedConditionDetailTypes"));
  id v8 = [v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailViewController view](self, "view"));
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

- (NSArray)displayedConditionDetailTypes
{
  return self->_displayedConditionDetailTypes;
}

- (void)setDisplayedConditionDetailTypes:(id)a3
{
}

- (NSDictionary)conditionDetailTypeToIconMap
{
  return self->_conditionDetailTypeToIconMap;
}

- (void)setConditionDetailTypeToIconMap:(id)a3
{
}

- (NSDictionary)conditionDetailTypeToValueMap
{
  return self->_conditionDetailTypeToValueMap;
}

- (void)setConditionDetailTypeToValueMap:(id)a3
{
}

- (NSDictionary)conditionDetailTypeToDescriptionMap
{
  return self->_conditionDetailTypeToDescriptionMap;
}

- (void)setConditionDetailTypeToDescriptionMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end