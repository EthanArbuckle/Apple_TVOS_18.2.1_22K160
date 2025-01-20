@interface BKHexadecimalIntegerEventStatistic
+ (id)statisticWithLabel:(id)a3 hexFormatModifier:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)value;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)excludeBitNumber:(int64_t)a3;
- (void)excludeMask:(unint64_t)a3;
- (void)includeBitNumber:(int64_t)a3;
- (void)includeMask:(unint64_t)a3;
- (void)reset;
- (void)setValue:(unint64_t)a3;
@end

@implementation BKHexadecimalIntegerEventStatistic

+ (id)statisticWithLabel:(id)a3 hexFormatModifier:(int64_t)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___BKHexadecimalIntegerEventStatistic;
  id v5 = objc_msgSendSuper2(&v8, "statisticWithLabel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6) {
    v6[5] = a4;
  }
  return v6;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_value));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___BKHexadecimalIntegerEventStatistic, v5);
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

  id v11 = [v10 value];
  BOOL v12 = v11 == (id)self->_value;

  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  unint64_t value = self->_value;
  if (value)
  {
    int64_t hexFormatModifier = self->_hexFormatModifier;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    if (hexFormatModifier)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10004D830;
      v10[3] = &unk_1000B7E88;
      v10[4] = self;
      [v4 appendCustomFormatWithName:v7 block:v10];
    }

    else
    {
      id v8 = [v4 appendUnsignedInteger:value withName:v7 format:1];
    }

    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___BKHexadecimalIntegerEventStatistic;
    -[BKEventStatistic appendDescriptionToFormatter:](&v9, "appendDescriptionToFormatter:", v4);
  }
}

- (void)setValue:(unint64_t)a3
{
  if (self->_value != a3)
  {
    self->_unint64_t value = a3;
    unsigned int v5 = !-[BKEventStatistic automaticResetDisabled](self, "automaticResetDisabled");
    if (a3) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = v5;
    }
    -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", v6);
  }

- (void)includeBitNumber:(int64_t)a3
{
}

- (void)excludeBitNumber:(int64_t)a3
{
}

- (void)includeMask:(unint64_t)a3
{
}

- (void)excludeMask:(unint64_t)a3
{
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKHexadecimalIntegerEventStatistic;
  -[BKEventStatistic reset](&v3, "reset");
  self->_unint64_t value = 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BKHexadecimalIntegerEventStatistic;
  id result = -[BKEventStatistic copyWithZone:](&v5, "copyWithZone:", a3);
  *((void *)result + 4) = self->_value;
  return result;
}

- (unint64_t)value
{
  return self->_value;
}

@end