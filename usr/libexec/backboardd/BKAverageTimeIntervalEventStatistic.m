@interface BKAverageTimeIntervalEventStatistic
+ (id)statisticWithLabel:(id)a3 scale:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)begin;
- (void)end;
- (void)reset;
- (void)setValue:(double)a3;
@end

@implementation BKAverageTimeIntervalEventStatistic

+ (id)statisticWithLabel:(id)a3 scale:(int64_t)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___BKAverageTimeIntervalEventStatistic;
  id v5 = objc_msgSendSuper2(&v8, "statisticWithLabel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v6[4] = a4;
  return v6;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_value));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___BKAverageTimeIntervalEventStatistic, v5);
  id v7 = v4;
  objc_super v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  id v10 = v9;

  [v10 value];
  double v12 = v11;

  BOOL v13 = v12 == self->_value;
  return v13;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  double value = self->_value;
  if (value != 0.0)
  {
    int64_t scale = self->_scale;
    if (scale <= 0)
    {
      self->_int64_t scale = 1LL;
      double value = self->_value;
      id v7 = @" (s)";
      double v8 = 1.0;
    }

    else
    {
      uint64_t v6 = @" (s)";
      if (scale == 1000000) {
        uint64_t v6 = @" (µs)";
      }
      if (scale == 1000) {
        id v7 = @" (ms)";
      }
      else {
        id v7 = v6;
      }
      double v8 = (double)scale;
    }

    double v9 = value * v8;
    id v10 = a3;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:v7]);
    id v13 = [v10 appendDouble:v12 withName:2 decimalPrecision:v9];

    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___BKAverageTimeIntervalEventStatistic;
    -[BKEventStatistic appendDescriptionToFormatter:](&v14, "appendDescriptionToFormatter:", v10);
  }

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKAverageTimeIntervalEventStatistic;
  -[BKEventStatistic reset](&v3, "reset");
  self->_double value = 0.0;
  self->_cumulativeInterval = 0.0;
  self->_count = 0LL;
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_double value = a3;
    -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1LL);
  }

- (void)begin
{
  self->_startInterval = v3;
}

- (void)end
{
  double v4 = v3 - self->_startInterval + self->_cumulativeInterval;
  self->_cumulativeInterval = v4;
  int64_t v5 = self->_count + 1;
  self->_count = v5;
  self->_double value = v4 / (double)v5;
  -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BKAverageTimeIntervalEventStatistic;
  id result = -[BKEventStatistic copyWithZone:](&v5, "copyWithZone:", a3);
  *((void *)result + 8) = *(void *)&self->_value;
  return result;
}

- (double)value
{
  return self->_value;
}

@end