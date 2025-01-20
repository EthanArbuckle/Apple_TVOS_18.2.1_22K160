@interface BKIntegerEventStatistic
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)value;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)increment;
- (void)reset;
- (void)setValue:(int64_t)a3;
@end

@implementation BKIntegerEventStatistic

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_value));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___BKIntegerEventStatistic, v5);
  id v7 = v4;
  v8 = v7;
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

  id v11 = [v10 value];
  BOOL v12 = v11 == (id)self->_value;

  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  int64_t value = self->_value;
  if (value)
  {
    id v5 = a3;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    id v7 = [v5 appendInteger:value withName:v6];

    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___BKIntegerEventStatistic;
    -[BKEventStatistic appendDescriptionToFormatter:](&v8, "appendDescriptionToFormatter:", v5);
  }

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKIntegerEventStatistic;
  -[BKEventStatistic reset](&v3, "reset");
  self->_int64_t value = 0LL;
}

- (void)setValue:(int64_t)a3
{
  if (self->_value != a3)
  {
    self->_int64_t value = a3;
    -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1LL);
  }

- (void)increment
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BKIntegerEventStatistic;
  id result = -[BKEventStatistic copyWithZone:](&v5, "copyWithZone:", a3);
  *((void *)result + 4) = self->_value;
  return result;
}

- (int64_t)value
{
  return self->_value;
}

@end