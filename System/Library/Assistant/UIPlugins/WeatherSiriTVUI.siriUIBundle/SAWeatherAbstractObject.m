@interface SAWeatherAbstractObject
+ (id)debug_weatherObjectWithCannedValues;
- (id)compressedDescription;
- (id)weatherCityRepresentation;
@end

@implementation SAWeatherAbstractObject

- (id)compressedDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject weatherLocation](self, "weatherLocation"));
  [v3 appendFormat:@"<<Location>>\n%@\n\n", v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject extendedForecastUrl](self, "extendedForecastUrl"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject units](self, "units"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v28 temperatureUnits]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject units](self, "units"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pressureUnits]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject units](self, "units"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 distanceUnits]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject units](self, "units"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 speedUnits]);
  [v3 appendFormat:@"<<URL>>\n%@\n\n<<Units>>\n%@/%@/%@/%@\n\n", v5, v6, v8, v10, v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
  [v3 appendFormat:@"<<Current Conditions>>\n%@\n\n", v14];

  [v3 appendFormat:@"<<Daily Forecasts>>\n"];
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject dailyForecasts](self, "dailyForecasts"));
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)v19) compressedDescription]);
        [v3 appendString:v20];

        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v17);
  }

  [v3 appendFormat:@"\n<<Hourly Forecasts>>\n"];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject hourlyForecasts](self, "hourlyForecasts"));
  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      v25 = 0LL;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)v25) compressedDescription]);
        [v3 appendString:v26];

        v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v23);
  }

  return v3;
}

+ (id)debug_weatherObjectWithCannedValues
{
  id v2 = objc_alloc_init((Class)objc_opt_class(a1));
  id v3 = objc_alloc_init(&OBJC_CLASS___SAWeatherObject);

  __int128 v30 = v3;
  [v3 setView:SAWeatherViewNOWValue];
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  for (uint64_t i = 1LL; i != 11; ++i)
  {
    v6 = -[SAWeatherDailyForecast initWithDictionary:]( objc_alloc(&OBJC_CLASS___SAWeatherDailyForecast),  "initWithDictionary:",  &off_1E790);
    -[SAWeatherDailyForecast setIsUserRequested:](v6, "setIsUserRequested:", &__kCFBooleanTrue);
    -[SAWeatherDailyForecast setChanceOfPrecipitation:](v6, "setChanceOfPrecipitation:", &off_1E278);
    id v7 = [[SAWeatherCondition alloc] initWithDictionary:&off_1E7B8];
    [v7 setConditionCode:@"MostlyCloudyDay"];
    [v7 setConditionCodeIndex:28];
    -[SAWeatherDailyForecast setCondition:](v6, "setCondition:", v7);
    v8 = (void *)v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", i));
    -[SAWeatherDailyForecast setTimeIndex:](v6, "setTimeIndex:", v9);

    v10 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (rand() % 10 + 20));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SAWeatherDailyForecast setHighTemperature:](v6, "setHighTemperature:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast highTemperature](v6, "highTemperature"));
    unsigned int v13 = [v12 intValue];
    int v14 = rand();
    int v15 = v13 + 5 * (v14 / 5) - v14;

    if (v15 <= -5) {
      int v16 = -5;
    }
    else {
      int v16 = v15;
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v16 + 5)));
    -[SAWeatherDailyForecast setLowTemperature:](v6, "setLowTemperature:", v17);

    uint64_t v4 = (uint64_t)v8;
    [v8 addObject:v6];
  }

  [v30 setDailyForecasts:v8];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  for (uint64_t j = 1LL; j != 24; ++j)
  {
    v20 = -[SAWeatherHourlyForecast initWithDictionary:]( objc_alloc(&OBJC_CLASS___SAWeatherHourlyForecast),  "initWithDictionary:",  &off_1E7E0);
    -[SAWeatherHourlyForecast setIsUserRequested:](v20, "setIsUserRequested:", &__kCFBooleanTrue);
    -[SAWeatherHourlyForecast setChanceOfPrecipitation:](v20, "setChanceOfPrecipitation:", &off_1E278);
    id v21 = [[SAWeatherCondition alloc] initWithDictionary:&off_1E808];
    [v21 setConditionCode:@"PartlyCloudyDay"];
    [v21 setConditionCodeIndex:30];
    -[SAWeatherHourlyForecast setCondition:](v20, "setCondition:", v21);
    -[SAWeatherHourlyForecast setTemperature:](v20, "setTemperature:", &off_1E290);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", j));
    -[SAWeatherHourlyForecast setTimeIndex:](v20, "setTimeIndex:", v22);

    [v18 addObject:v20];
  }

  [v30 setHourlyForecasts:v18];
  id v23 = [[SAWeatherCurrentConditions alloc] initWithDictionary:&off_1E830];
  [v23 setTemperature:@"15"];
  id v24 = [[SAWeatherCondition alloc] initWithDictionary:&off_1E858];
  [v24 setConditionCode:@"PartlyCloudyDay"];
  [v24 setConditionCodeIndex:30];
  [v23 setCondition:v24];
  [v23 setWindChill:@"15"];
  id v25 = [[SAWeatherWindSpeed alloc] initWithDictionary:&off_1E880];
  [v25 setValue:@"10"];
  [v25 setWindDirectionDegree:&off_1E2A8];
  [v23 setWindSpeed:v25];
  [v23 setSunrise:@"07:19"];
  [v23 setPercentHumidity:@"76"];
  [v23 setSunset:@"17:18"];
  [v23 setDewPoint:@"11"];
  [v23 setTimeOfObservation:@"16:05"];
  [v23 setTimeZone:@"Pacific Standard Time"];
  id v26 = [[SAWeatherBarometricPressure alloc] initWithDictionary:&off_1E8A8];
  [v26 setValue:@"1023.5"];
  [v23 setBarometricPressure:v26];
  [v23 setVisibility:@"14.48"];
  [v23 setDayOfWeek:&off_1E2C0];
  [v30 setCurrentConditions:v23];
  id v27 = [[SAWeatherUnits alloc] initWithDictionary:&off_1E8D0];
  [v27 setSpeedUnits:@"KPH"];
  [v27 setDistanceUnits:@"Kilometers"];
  [v27 setTemperatureUnits:@"Celsius"];
  [v27 setPressureUnits:@"MB"];
  [v30 setUnits:v27];
  [v30 setExtendedForecastUrl:@"http://www.weather.com/wx/today/?lat=37.31&lon=-122.02&locale=en_US&par=apple_siri"];
  [v30 setWeatherRequest:@"UNKNOWN"];
  id v28 = [[SAWeatherLocation alloc] initWithDictionary:&off_1E8F8];
  [v28 setCity:@"Cupertino"];
  [v28 setLongitude:&off_1E920];
  [v28 setLatitude:&off_1E930];
  [v28 setCountryCode:@"United States"];
  [v28 setTimezoneId:@"America/Los_Angeles"];
  [v28 setStateCode:@"CA"];
  [v30 setWeatherLocation:v28];

  return v30;
}

- (id)weatherCityRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject units](self, "units"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 temperatureUnits]);
  else {
    uint64_t v5 = 1LL;
  }

  v6 = objc_alloc_init(&OBJC_CLASS___City);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject weatherLocation](self, "weatherLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 city]);
  -[City setName:](v6, "setName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject weatherLocation](self, "weatherLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stateCode]);
  -[City setState:](v6, "setState:", v10);

  id v11 = objc_alloc(&OBJC_CLASS___WFTemperature);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 temperature]);
  [v13 doubleValue];
  unsigned int v143 = v5;
  id v14 = objc_msgSend(v11, "initWithTemperatureUnit:value:", v5);
  -[City setTemperature:](v6, "setTemperature:", v14);

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 condition]);
  -[City setConditionCode:](v6, "setConditionCode:", [v16 conditionCodeIndex]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[City setUpdateTime:](v6, "setUpdateTime:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 timeOfObservation]);
  v20 = (char *)[v19 length];

  if ((uint64_t)v20 >= 3)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 timeOfObservation]);
    id v23 = v20 - 2;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", v20 - 2, 2));

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 timeOfObservation]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "substringWithRange:", 0, v23));

    -[City setObservationTime:]( v6,  "setObservationTime:",  (char *)[v24 integerValue] + 100 * (void)objc_msgSend(v27, "integerValue"));
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 sunrise]);
  __int128 v30 = (char *)[v29 length];

  if ((uint64_t)v30 >= 3)
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sunrise]);
    __int128 v33 = v30 - 2;
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "substringWithRange:", v30 - 2, 2));

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 sunrise]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "substringWithRange:", 0, v33));

    -[City setSunriseTime:]( v6,  "setSunriseTime:",  (char *)[v34 integerValue] + 100 * (void)objc_msgSend(v37, "integerValue"));
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 sunset]);
  v40 = (char *)[v39 length];

  if ((uint64_t)v40 >= 3)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 sunset]);
    v43 = v40 - 2;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "substringWithRange:", v40 - 2, 2));

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 sunset]);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "substringWithRange:", 0, v43));

    -[City setSunsetTime:]( v6,  "setSunsetTime:",  (char *)[v44 integerValue] + 100 * (void)objc_msgSend(v47, "integerValue"));
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 uvIndex]);
  -[City setUVIndex:](v6, "setUVIndex:", [v49 unsignedIntegerValue]);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 totalDailyPrecipitation]);
  [v51 floatValue];
  -[City setPrecipitationPast24Hours:](v6, "setPrecipitationPast24Hours:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject extendedForecastUrl](self, "extendedForecastUrl"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v53));
  -[City setLink:](v6, "setLink:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject weatherLocation](self, "weatherLocation"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v55 latitude]);
  [v56 floatValue];
  -[City setLatitude:](v6, "setLatitude:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject weatherLocation](self, "weatherLocation"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v58 longitude]);
  [v59 floatValue];
  -[City setLongitude:](v6, "setLongitude:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject weatherLocation](self, "weatherLocation"));
  uint64_t v62 = objc_claimAutoreleasedReturnValue([v61 timezoneId]);

  if (v62)
  {
    uint64_t v63 = objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v62));
    if (v63)
    {
      v64 = (void *)v63;
      -[City setTimeZone:](v6, "setTimeZone:", v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[City setTimeZoneUpdateDate:](v6, "setTimeZoneUpdateDate:", v65);
    }
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 windChill]);
  [v67 floatValue];
  -[City setWindChill:](v6, "setWindChill:");

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v68 windSpeed]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 windDirectionDegree]);
  [v70 floatValue];
  -[City setWindDirection:](v6, "setWindDirection:");

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v71 windSpeed]);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v72 value]);
  [v73 floatValue];
  -[City setWindSpeed:](v6, "setWindSpeed:");

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v74 percentHumidity]);
  [v75 floatValue];
  -[City setHumidity:](v6, "setHumidity:");

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v76 visibility]);
  [v77 floatValue];
  -[City setVisibility:](v6, "setVisibility:");

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v78 barometricPressure]);
  v80 = (void *)objc_claimAutoreleasedReturnValue([v79 value]);
  [v80 floatValue];
  -[City setPressure:](v6, "setPressure:");

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v82 = (void *)objc_claimAutoreleasedReturnValue([v81 barometricPressure]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v82 trend]);
  unsigned __int8 v84 = [v83 isEqualToString:SAWeatherBarometricTrendRisingValue];

  if ((v84 & 1) != 0)
  {
    uint64_t v85 = 1LL;
  }

  else
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    v87 = (void *)objc_claimAutoreleasedReturnValue([v86 barometricPressure]);
    v88 = (void *)objc_claimAutoreleasedReturnValue([v87 trend]);
    unsigned int v89 = [v88 isEqualToString:SAWeatherBarometricTrendFallingValue];

    if (!v89) {
      goto LABEL_18;
    }
    uint64_t v85 = 2LL;
  }

  -[City setPressureRising:](v6, "setPressureRising:", v85);
LABEL_18:
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v90 dewPoint]);
  [v91 floatValue];
  -[City setDewPoint:](v6, "setDewPoint:");

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v93 = (void *)objc_claimAutoreleasedReturnValue([v92 heatIndex]);
  [v93 floatValue];
  -[City setHeatIndex:](v6, "setHeatIndex:");

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
  v95 = (void *)objc_claimAutoreleasedReturnValue([v94 windChill]);

  if (v95)
  {
    id v96 = objc_alloc(&OBJC_CLASS___WFTemperature);
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    v98 = (void *)objc_claimAutoreleasedReturnValue([v97 windChill]);
    [v98 doubleValue];
  }

  else
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    v101 = (void *)objc_claimAutoreleasedReturnValue([v100 heatIndex]);

    if (!v101) {
      goto LABEL_23;
    }
    id v96 = objc_alloc(&OBJC_CLASS___WFTemperature);
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject currentConditions](self, "currentConditions"));
    v98 = (void *)objc_claimAutoreleasedReturnValue([v97 heatIndex]);
    [v98 floatValue];
    double v99 = v102;
  }

  id v103 = [v96 initWithTemperatureUnit:v143 value:v99];
  -[City setFeelsLike:](v6, "setFeelsLike:", v103);

LABEL_23:
  v140 = (void *)v62;
  v141 = v6;
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject dailyForecasts](self, "dailyForecasts"));
  id v105 = [v104 countByEnumeratingWithState:&v148 objects:v153 count:16];
  if (v105)
  {
    id v106 = v105;
    uint64_t v107 = *(void *)v149;
    do
    {
      for (uint64_t i = 0LL; i != v106; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v149 != v107) {
          objc_enumerationMutation(v104);
        }
        v109 = *(void **)(*((void *)&v148 + 1) + 8LL * (void)i);
        id v110 = objc_alloc_init(&OBJC_CLASS___WADayForecast);
        id v111 = objc_alloc(&OBJC_CLASS___WFTemperature);
        v112 = (void *)objc_claimAutoreleasedReturnValue([v109 highTemperature]);
        [v112 doubleValue];
        id v113 = objc_msgSend(v111, "initWithTemperatureUnit:value:", v143);
        [v110 setHigh:v113];

        id v114 = objc_alloc(&OBJC_CLASS___WFTemperature);
        v115 = (void *)objc_claimAutoreleasedReturnValue([v109 lowTemperature]);
        [v115 doubleValue];
        id v116 = objc_msgSend(v114, "initWithTemperatureUnit:value:", v143);
        [v110 setLow:v116];

        v117 = (void *)objc_claimAutoreleasedReturnValue([v109 chanceOfPrecipitation]);
        [v117 floatValue];
        [v110 setPercentPrecipitation:v118];

        v119 = (void *)objc_claimAutoreleasedReturnValue([v109 condition]);
        objc_msgSend(v110, "setIcon:", objc_msgSend(v119, "conditionCodeIndex"));

        v120 = (void *)objc_claimAutoreleasedReturnValue([v109 timeIndex]);
        objc_msgSend(v110, "setDayNumber:", (char *)objc_msgSend(v120, "integerValue") - 1);

        [v142 addObject:v110];
      }

      id v106 = [v104 countByEnumeratingWithState:&v148 objects:v153 count:16];
    }

    while (v106);
  }

  -[City setDayForecasts:](v141, "setDayForecasts:", v142);
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v144 = 0u;
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherAbstractObject hourlyForecasts](self, "hourlyForecasts"));
  id v123 = [v122 countByEnumeratingWithState:&v144 objects:v152 count:16];
  if (v123)
  {
    id v124 = v123;
    uint64_t v125 = *(void *)v145;
    do
    {
      for (uint64_t j = 0LL; j != v124; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v145 != v125) {
          objc_enumerationMutation(v122);
        }
        v127 = *(void **)(*((void *)&v144 + 1) + 8LL * (void)j);
        id v128 = objc_alloc_init(&OBJC_CLASS___WAHourlyForecast);
        [v128 setEventType:0];
        v129 = (void *)objc_claimAutoreleasedReturnValue([v127 timeIndex]);

        if (v129)
        {
          v130 = (void *)objc_claimAutoreleasedReturnValue([v127 timeIndex]);
          v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%02zd:00",  [v130 integerValue]));
          [v128 setTime:v131];

          v132 = (void *)objc_claimAutoreleasedReturnValue([v127 timeIndex]);
          objc_msgSend(v128, "setHourIndex:", objc_msgSend(v132, "integerValue"));
        }

        id v133 = objc_alloc(&OBJC_CLASS___WFTemperature);
        v134 = (void *)objc_claimAutoreleasedReturnValue([v127 temperature]);
        [v134 doubleValue];
        id v135 = objc_msgSend(v133, "initWithTemperatureUnit:value:", v143);
        [v128 setTemperature:v135];

        v136 = (void *)objc_claimAutoreleasedReturnValue([v127 condition]);
        objc_msgSend(v128, "setConditionCode:", objc_msgSend(v136, "conditionCodeIndex"));

        v137 = (void *)objc_claimAutoreleasedReturnValue([v127 chanceOfPrecipitation]);
        [v137 floatValue];
        [v128 setPercentPrecipitation:v138];

        [v121 addObject:v128];
      }

      id v124 = [v122 countByEnumeratingWithState:&v144 objects:v152 count:16];
    }

    while (v124);
  }

  -[City setHourlyForecasts:](v141, "setHourlyForecasts:", v121);
  return v141;
}

@end