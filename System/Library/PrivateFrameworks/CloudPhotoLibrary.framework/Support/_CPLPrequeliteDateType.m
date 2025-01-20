@interface _CPLPrequeliteDateType
- (_CPLPrequeliteDateType)init;
- (id)_bindableValueForValue:(id)a3;
- (id)_valueForBindableValue:(id)a3;
- (id)defaultValueForNull;
@end

@implementation _CPLPrequeliteDateType

- (_CPLPrequeliteDateType)init
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____CPLPrequeliteDateType;
  return -[CPLPrequeliteType initWithTypeName:defaultValue:objcClass:]( &v5,  "initWithTypeName:defaultValue:objcClass:",  "TIMESTAMP",  0LL,  v3);
}

- (id)defaultValueForNull
{
  return +[NSDate date](&OBJC_CLASS___NSDate, "date");
}

- (id)_bindableValueForValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
      sub_10019B758((uint64_t)self, (uint64_t)v5, (uint64_t)a2);
    }
    [v5 timeIntervalSinceReferenceDate];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)_valueForBindableValue:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  [a3 doubleValue];
  return (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
}

@end