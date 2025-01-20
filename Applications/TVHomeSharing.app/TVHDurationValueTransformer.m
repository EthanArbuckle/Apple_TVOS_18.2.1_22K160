@interface TVHDurationValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (NSDateComponentsFormatter)hoursMinutesFormatter;
- (NSDateComponentsFormatter)secondsFormatter;
- (TVHDurationValueTransformer)init;
- (id)transformedValue:(id)a3;
- (void)setHoursMinutesFormatter:(id)a3;
- (void)setSecondsFormatter:(id)a3;
@end

@implementation TVHDurationValueTransformer

- (TVHDurationValueTransformer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHDurationValueTransformer;
  v2 = -[TVHDurationValueTransformer init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    hoursMinutesFormatter = v2->_hoursMinutesFormatter;
    v2->_hoursMinutesFormatter = v3;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_hoursMinutesFormatter, "setUnitsStyle:", 2LL);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_hoursMinutesFormatter, "setAllowedUnits:", 96LL);
    v5 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    secondsFormatter = v2->_secondsFormatter;
    v2->_secondsFormatter = v5;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_secondsFormatter, "setUnitsStyle:", 2LL);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_secondsFormatter, "setAllowedUnits:", 128LL);
  }

  return v2;
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
  double v5 = v4;
  if (v4 >= 60.0) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHDurationValueTransformer hoursMinutesFormatter](self, "hoursMinutesFormatter"));
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHDurationValueTransformer secondsFormatter](self, "secondsFormatter"));
  }
  v7 = v6;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringFromTimeInterval:v5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", @", ", @" "));

  return v9;
}

- (NSDateComponentsFormatter)hoursMinutesFormatter
{
  return self->_hoursMinutesFormatter;
}

- (void)setHoursMinutesFormatter:(id)a3
{
}

- (NSDateComponentsFormatter)secondsFormatter
{
  return self->_secondsFormatter;
}

- (void)setSecondsFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end