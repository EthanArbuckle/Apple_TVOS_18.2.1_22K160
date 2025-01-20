@interface WTVHourlyForecast
- (NSNumber)temperature;
- (NSString)formattedTimeString;
- (int)timeIntValue;
- (int64_t)condition;
- (unint64_t)type;
- (void)setCondition:(int64_t)a3;
- (void)setFormattedTimeString:(id)a3;
- (void)setTemperature:(id)a3;
- (void)setTimeIntValue:(int)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation WTVHourlyForecast

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (int64_t)condition
{
  return self->_condition;
}

- (void)setCondition:(int64_t)a3
{
  self->_condition = a3;
}

- (NSNumber)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(id)a3
{
}

- (NSString)formattedTimeString
{
  return self->_formattedTimeString;
}

- (void)setFormattedTimeString:(id)a3
{
}

- (int)timeIntValue
{
  return self->_timeIntValue;
}

- (void)setTimeIntValue:(int)a3
{
  self->_timeIntValue = a3;
}

- (void).cxx_destruct
{
}

@end