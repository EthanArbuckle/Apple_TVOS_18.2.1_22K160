@interface SAWeatherHourlyForecast
- (id)compressedDescription;
@end

@implementation SAWeatherHourlyForecast

- (id)compressedDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherHourlyForecast timeIndex](self, "timeIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherHourlyForecast condition](self, "condition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 conditionCode]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherHourlyForecast condition](self, "condition"));
  id v7 = [v6 conditionCodeIndex];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherHourlyForecast temperature](self, "temperature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherHourlyForecast chanceOfPrecipitation](self, "chanceOfPrecipitation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAWeatherHourlyForecast isUserRequested](self, "isUserRequested"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Time: %@, Cond: %@ (%ld), Temp: %@, Rain: %@, Reqsted: %@\n",  v3,  v5,  v7,  v8,  v9,  v10));

  return v11;
}

@end