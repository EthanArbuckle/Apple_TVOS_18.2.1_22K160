@interface SAWeatherDailyForecast
- (id)compressedDescription;
@end

@implementation SAWeatherDailyForecast

- (id)compressedDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast timeIndex](self, "timeIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast condition](self, "condition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 conditionCode]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast condition](self, "condition"));
  id v7 = [v6 conditionCodeIndex];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast highTemperature](self, "highTemperature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast lowTemperature](self, "lowTemperature"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast chanceOfPrecipitation](self, "chanceOfPrecipitation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherDailyForecast isUserRequested](self, "isUserRequested"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Time: %@, Cond: %@ (%ld), Temp: %@/%@, Rain: %@, Reqsted: %@\n",  v3,  v5,  v7,  v8,  v9,  v10,  v11));

  return v12;
}

@end