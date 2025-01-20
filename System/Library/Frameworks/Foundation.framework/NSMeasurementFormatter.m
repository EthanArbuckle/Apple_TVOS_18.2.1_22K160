@interface NSMeasurementFormatter
+ (BOOL)supportsSecureCoding;
- (NSFormattingUnitStyle)unitStyle;
- (NSLocale)locale;
- (NSMeasurementFormatter)init;
- (NSMeasurementFormatter)initWithCoder:(id)a3;
- (NSMeasurementFormatterUnitOptions)unitOptions;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromMeasurement:(NSMeasurement *)measurement;
- (NSString)stringFromUnit:(NSUnit *)unit;
- (id)measurementFromString:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitOptions:(NSMeasurementFormatterUnitOptions)unitOptions;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSMeasurementFormatter

- (NSMeasurementFormatter)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSMeasurementFormatter;
  v2 = -[NSMeasurementFormatter init](&v4, sel_init);
  if (v2)
  {
    v2->_formatter = objc_alloc_init(&OBJC_CLASS___NSUnitFormatter);
    -[NSMeasurementFormatter setUnitOptions:](v2, "setUnitOptions:", 0LL);
    -[NSMeasurementFormatter setUnitStyle:](v2, "setUnitStyle:", 2LL);
    -[NSMeasurementFormatter setLocale:](v2, "setLocale:", [MEMORY[0x189603F90] currentLocale]);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMeasurementFormatter;
  -[NSMeasurementFormatter dealloc](&v3, sel_dealloc);
}

- (NSMeasurementFormatterUnitOptions)unitOptions
{
  return [self->_formatter unitOptions];
}

- (void)setUnitOptions:(NSMeasurementFormatterUnitOptions)unitOptions
{
  if (unitOptions >= 8) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSMeasurementFormatter.m",  44LL,  @"Invalid parameter not satisfying: %@",  @"unitOptions == 0 || !(unitOptions & ~(NSMeasurementFormatterUnitOptionsProvidedUnit | NSMeasurementFormatterUnitOptionsNaturalScale | NSMeasurementFormatterUnitOptionsTemperatureWithoutUnit))");
  }
  [self->_formatter setUnitOptions:unitOptions];
}

- (NSFormattingUnitStyle)unitStyle
{
  return [self->_formatter unitStyle];
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
}

- (NSLocale)locale
{
  return (NSLocale *)[self->_formatter locale];
}

- (void)setLocale:(NSLocale *)locale
{
}

- (NSNumberFormatter)numberFormatter
{
  return (NSNumberFormatter *)[self->_formatter numberFormatter];
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
}

- (NSString)stringFromMeasurement:(NSMeasurement *)measurement
{
  result = -[NSMeasurementFormatter stringForObjectValue:](self, "stringForObjectValue:", measurement);
  if (!result) {
    return (NSString *)&stru_189CA6A28;
  }
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0) {
    return (id)[self->_formatter stringForObjectValue:a3];
  }
  else {
    return 0LL;
  }
}

- (id)measurementFromString:(id)a3
{
  return 0LL;
}

- (NSString)stringFromUnit:(NSUnit *)unit
{
  return (NSString *)[self->_formatter stringFromUnit:unit];
}

- (NSMeasurementFormatter)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSMeasurementFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.unitFormatter"];
  if (v5)
  {
    v6 = (void *)v5;
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSMeasurementFormatter;
    v7 = -[NSMeasurementFormatter init](&v9, sel_init);
    if (v7) {
      v7->_formatter = v6;
    }
  }

  else
  {

    v10 = @"NSLocalizedDescription";
    v11[0] = @"Formatter has been corrupted!";
    objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
    return 0LL;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end