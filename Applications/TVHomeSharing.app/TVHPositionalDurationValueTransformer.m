@interface TVHPositionalDurationValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (NSDateComponentsFormatter)formatter;
- (TVHPositionalDurationValueTransformer)init;
- (id)transformedValue:(id)a3;
- (void)setFormatter:(id)a3;
@end

@implementation TVHPositionalDurationValueTransformer

- (TVHPositionalDurationValueTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHPositionalDurationValueTransformer;
  v2 = -[TVHPositionalDurationValueTransformer init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_formatter, "setUnitsStyle:", 0LL);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_formatter, "setAllowedUnits:", 192LL);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2->_formatter, "setZeroFormattingBehavior:", 0LL);
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
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v7 = v6;
  if (v5 < 0.0)
  {
    -[NSMutableString appendString:](v6, "appendString:", @"-");
    double v5 = fabs(v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPositionalDurationValueTransformer formatter](self, "formatter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromTimeInterval:v5]);

  -[NSMutableString appendString:](v7, "appendString:", v9);
  return v7;
}

- (NSDateComponentsFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end