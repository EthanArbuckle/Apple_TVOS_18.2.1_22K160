@interface TVMusicDurationValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (NSDateComponentsFormatter)hoursFormatter;
- (NSDateComponentsFormatter)minutesFormatter;
- (TVMusicDurationValueTransformer)init;
- (id)transformedValue:(id)a3;
- (void)setHoursFormatter:(id)a3;
- (void)setMinutesFormatter:(id)a3;
@end

@implementation TVMusicDurationValueTransformer

- (TVMusicDurationValueTransformer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicDurationValueTransformer;
  v2 = -[TVMusicDurationValueTransformer init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    hoursFormatter = v2->_hoursFormatter;
    v2->_hoursFormatter = v3;

    -[NSDateComponentsFormatter setAllowedUnits:](v2->_hoursFormatter, "setAllowedUnits:", 224LL);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2->_hoursFormatter, "setZeroFormattingBehavior:", 0LL);
    v5 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    minutesFormatter = v2->_minutesFormatter;
    v2->_minutesFormatter = v5;

    -[NSDateComponentsFormatter setAllowedUnits:](v2->_minutesFormatter, "setAllowedUnits:", 192LL);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2->_minutesFormatter, "setZeroFormattingBehavior:", 0LL);
  }

  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  double v5 = v4;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v7 = v6;
  if (v5 < 0.0)
  {
    -[NSMutableString appendString:](v6, "appendString:", @"- ");
    double v5 = fabs(v5);
  }

  if (v5 >= 3600.0) {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicDurationValueTransformer hoursFormatter](self, "hoursFormatter"));
  }
  else {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicDurationValueTransformer minutesFormatter](self, "minutesFormatter"));
  }
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromTimeInterval:v5]);
  -[NSMutableString appendString:](v7, "appendString:", v10);

  return v7;
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

- (void).cxx_destruct
{
}

@end