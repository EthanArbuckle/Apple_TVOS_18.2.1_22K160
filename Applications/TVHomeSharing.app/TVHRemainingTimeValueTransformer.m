@interface TVHRemainingTimeValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (id)new;
- (NSDate)targetDate;
- (NSDateComponentsFormatter)daysFormatter;
- (NSDateComponentsFormatter)hoursFormatter;
- (NSDateComponentsFormatter)minutesFormatter;
- (TVHRemainingTimeValueTransformer)init;
- (TVHRemainingTimeValueTransformer)initWithTargetDate:(id)a3;
- (id)transformedValue:(id)a3;
- (void)setDaysFormatter:(id)a3;
- (void)setHoursFormatter:(id)a3;
- (void)setMinutesFormatter:(id)a3;
- (void)setTargetDate:(id)a3;
@end

@implementation TVHRemainingTimeValueTransformer

+ (id)new
{
  return 0LL;
}

- (TVHRemainingTimeValueTransformer)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHRemainingTimeValueTransformer)initWithTargetDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHRemainingTimeValueTransformer;
  v5 = -[TVHRemainingTimeValueTransformer init](&v9, "init");
  if (v5)
  {
    v6 = (NSDate *)[v4 copy];
    targetDate = v5->_targetDate;
    v5->_targetDate = v6;
  }

  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString);
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The input parameter to TVHRemainingTimeValueTransformer -transformedValue must be an NSDate");
  }
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRemainingTimeValueTransformer targetDate](self, "targetDate"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 laterDate:v6]);

  if (v8 == v6)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRemainingTimeValueTransformer minutesFormatter](self, "minutesFormatter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 stringFromTimeInterval:0.0]);
  }

  else
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 components:240 fromDate:v6 toDate:v7 options:0]);
    uint64_t v11 = (uint64_t)[v10 day];
    v12 = (char *)[v10 hour];
    id v13 = [v10 minute];
    id v14 = [v10 second];
    v15 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    -[NSDateComponentsFormatter setUnitsStyle:](v15, "setUnitsStyle:", 3LL);
    v16 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    v17 = v16;
    if (v11 < 2)
    {
      if (&v12[24 * v11])
      {
        -[NSDateComponents setHour:](v16, "setHour:");
        uint64_t v18 = 32LL;
      }

      else if (v13)
      {
        -[NSDateComponents setMinute:](v16, "setMinute:", v13);
        uint64_t v18 = 64LL;
      }

      else
      {
        -[NSDateComponents setSecond:](v16, "setSecond:", v14);
        uint64_t v18 = 128LL;
      }
    }

    else
    {
      -[NSDateComponents setDay:](v16, "setDay:", v11);
      uint64_t v18 = 16LL;
    }

    -[NSDateComponentsFormatter setAllowedUnits:](v15, "setAllowedUnits:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromDateComponents:](v15, "stringFromDateComponents:", v17));
  }

  return v19;
}

- (NSDateComponentsFormatter)daysFormatter
{
  return self->_daysFormatter;
}

- (void)setDaysFormatter:(id)a3
{
}

- (NSDateComponentsFormatter)hoursFormatter
{
  return self->_hoursFormatter;
}

- (void)setHoursFormatter:(id)a3
{
}

- (NSDateComponentsFormatter)minutesFormatter
{
  return self->_minutesFormatter;
}

- (void)setMinutesFormatter:(id)a3
{
}

- (NSDate)targetDate
{
  return self->_targetDate;
}

- (void)setTargetDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end