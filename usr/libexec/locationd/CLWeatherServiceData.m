@interface CLWeatherServiceData
- (NSString)precipitationType;
- (double)timestamp;
- (float)feelsLikeTemperature;
- (float)temperature;
- (float)weatherPressure;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFeelsLikeTemperature:(float)a3;
- (void)setPrecipitationType:(id)a3;
- (void)setTemperature:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setWeatherPressure:(float)a3;
@end

@implementation CLWeatherServiceData

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  -[CLWeatherServiceData timestamp](self, "timestamp");
  objc_msgSend(v7, "setTimestamp:");
  -[CLWeatherServiceData weatherPressure](self, "weatherPressure");
  objc_msgSend(v7, "setWeatherPressure:");
  objc_msgSend( v7,  "setPrecipitationType:",  +[NSString stringWithString:]( NSString,  "stringWithString:",  -[CLWeatherServiceData precipitationType](self, "precipitationType")));
  -[CLWeatherServiceData temperature](self, "temperature");
  objc_msgSend(v7, "setTemperature:");
  -[CLWeatherServiceData feelsLikeTemperature](self, "feelsLikeTemperature");
  objc_msgSend(v7, "setFeelsLikeTemperature:");
  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)weatherPressure
{
  return self->_weatherPressure;
}

- (void)setWeatherPressure:(float)a3
{
  self->_weatherPressure = a3;
}

- (NSString)precipitationType
{
  return self->_precipitationType;
}

- (void)setPrecipitationType:(id)a3
{
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (float)feelsLikeTemperature
{
  return self->_feelsLikeTemperature;
}

- (void)setFeelsLikeTemperature:(float)a3
{
  self->_feelsLikeTemperature = a3;
}

@end