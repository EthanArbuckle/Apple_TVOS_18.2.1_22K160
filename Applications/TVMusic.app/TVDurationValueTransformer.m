@interface TVDurationValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (void)load;
- (NSDateComponentsFormatter)minutesFormatter;
- (NSDateComponentsFormatter)secondsFormatter;
- (TVDurationValueTransformer)init;
- (id)transformedValue:(id)a3;
- (void)setMinutesFormatter:(id)a3;
- (void)setSecondsFormatter:(id)a3;
@end

@implementation TVDurationValueTransformer

+ (void)load
{
  id v2 = objc_alloc_init((Class)a1);
  +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"TVDurationValueTransformer");
}

- (TVDurationValueTransformer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVDurationValueTransformer;
  id v2 = -[TVDurationValueTransformer init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    minutesFormatter = v2->_minutesFormatter;
    v2->_minutesFormatter = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    secondsFormatter = v2->_secondsFormatter;
    v2->_secondsFormatter = v5;

    -[NSDateComponentsFormatter setAllowedUnits:](v2->_secondsFormatter, "setAllowedUnits:", 192LL);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:]( v2->_secondsFormatter,  "setZeroFormattingBehavior:",  0x10000LL);
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
    -[NSMutableString appendString:](v6, "appendString:", @"-");
    double v5 = fabs(v5);
  }

  if (v5 >= 60.0)
  {
    objc_super v8 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(-[TVDurationValueTransformer minutesFormatter](self, "minutesFormatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponents stringFromTimeInterval:](v8, "stringFromTimeInterval:", v5));
  }

  else
  {
    objc_super v8 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setSecond:](v8, "setSecond:", (uint64_t)v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVDurationValueTransformer secondsFormatter](self, "secondsFormatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringFromDateComponents:v8]);
  }

  -[NSMutableString appendString:](v7, "appendString:", v10);
  return v7;
}

- (NSDateComponentsFormatter)minutesFormatter
{
  return self->_minutesFormatter;
}

- (void)setMinutesFormatter:(id)a3
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