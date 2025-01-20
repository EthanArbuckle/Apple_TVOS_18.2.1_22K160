@interface NSEnergyFormatter
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isForFoodEnergyUse;
- (NSEnergyFormatter)init;
- (NSEnergyFormatter)initWithCoder:(id)a3;
- (NSFormattingUnitStyle)unitStyle;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromJoules:(double)numberInJoules;
- (NSString)stringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit;
- (NSString)unitStringFromJoules:(double)numberInJoules usedUnit:(NSEnergyFormatterUnit *)unitp;
- (NSString)unitStringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)targetUnitFromJoules:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setForFoodEnergyUse:(BOOL)forFoodEnergyUse;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSEnergyFormatter

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  58LL,  @"Invalid parameter not satisfying: %@",  @"!value || _NSIsNSNumber(value)");
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSEnergyFormatter;
  -[NSEnergyFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSEnergyFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

- (int64_t)targetUnitFromJoules:(double)a3
{
  v4 = -[NSNumberFormatter locale](-[NSEnergyFormatter numberFormatter](self, "numberFormatter"), "locale");
  else {
    v5 = &us_units_1;
  }
  objc_super v6 = (double *)malloc(0x20uLL);
  uint64_t v7 = v6;
  uint64_t v8 = 0LL;
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = v5[v8];
    double v12 = 0.0;
    if (v11 > 1792)
    {
      if (v11 == 1793)
      {
        double v12 = a3 / 4.184;
      }

      else if (v11 == 1794)
      {
        double v12 = a3 / 4184.0;
      }
    }

    else
    {
      double v12 = a3;
      if (v11 != 11)
      {
        double v12 = 0.0;
        if (v11 == 14) {
          double v12 = a3 / 1000.0;
        }
      }
    }

    char v9 = 0;
    v13 = &v6[2 * v8];
    double *v13 = v12;
    *((void *)v13 + 1) = v11;
    uint64_t v8 = 1LL;
  }

  while ((v10 & 1) != 0);
  qsort(v6, 2uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_1);
  int64_t v14 = *(void *)&v7[2 * (*v7 <= 1.0) + 1];
  free(v7);
  return v14;
}

- (NSEnergyFormatter)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSEnergyFormatter;
  v2 = -[NSEnergyFormatter init](&v4, sel_init);
  if (v2) {
    v2->_unitFormatter = objc_alloc_init(&OBJC_CLASS___NSUnitFormatter);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSEnergyFormatter;
  -[NSEnergyFormatter dealloc](&v3, sel_dealloc);
}

- (NSNumberFormatter)numberFormatter
{
  return -[NSUnitFormatter numberFormatter](self->_unitFormatter, "numberFormatter");
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
}

- (NSFormattingUnitStyle)unitStyle
{
  return -[NSUnitFormatter unitStyle](self->_unitFormatter, "unitStyle");
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
}

- (NSString)unitStringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit
{
  uint64_t v6 = 3075LL;
  uint64_t v7 = 3072LL;
  if (unit != NSEnergyFormatterUnitCalorie) {
    uint64_t v7 = 0LL;
  }
  if (unit != NSEnergyFormatterUnitKilocalorie) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = 3074LL;
  uint64_t v9 = 3076LL;
  if (unit != NSEnergyFormatterUnitKilojoule) {
    uint64_t v9 = 0LL;
  }
  if (unit != NSEnergyFormatterUnitJoule) {
    uint64_t v8 = v9;
  }
  if (unit <= 1792) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  if (((unit == NSEnergyFormatterUnitKilocalorie) & -[NSEnergyFormatter isForFoodEnergyUse](self, "isForFoodEnergyUse")) != 0) {
    uint64_t v11 = 3073LL;
  }
  else {
    uint64_t v11 = v10;
  }
  return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:]( self->_unitFormatter,  "unitStringFromValue:unit:",  v11,  value);
}

- (NSString)unitStringFromJoules:(double)numberInJoules usedUnit:(NSEnergyFormatterUnit *)unitp
{
  NSEnergyFormatterUnit v7 = -[NSEnergyFormatter targetUnitFromJoules:](self, "targetUnitFromJoules:");
  double v8 = 0.0;
  if (v7 > 1792)
  {
    if (v7 == NSEnergyFormatterUnitCalorie)
    {
      double v9 = 4.184;
    }

    else
    {
      if (v7 != NSEnergyFormatterUnitKilocalorie) {
        goto LABEL_11;
      }
      double v9 = 4184.0;
    }
  }

  else
  {
    if (v7 == NSEnergyFormatterUnitJoule)
    {
      double v8 = numberInJoules;
      goto LABEL_11;
    }

    if (v7 != NSEnergyFormatterUnitKilojoule) {
      goto LABEL_11;
    }
    double v9 = 1000.0;
  }

  double v8 = numberInJoules / v9;
LABEL_11:
  if (unitp) {
    *unitp = v7;
  }
  return -[NSEnergyFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
}

- (NSString)stringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit
{
  uint64_t v6 = 3075LL;
  uint64_t v7 = 3072LL;
  if (unit != NSEnergyFormatterUnitCalorie) {
    uint64_t v7 = 0LL;
  }
  if (unit != NSEnergyFormatterUnitKilocalorie) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = 3074LL;
  uint64_t v9 = 3076LL;
  if (unit != NSEnergyFormatterUnitKilojoule) {
    uint64_t v9 = 0LL;
  }
  if (unit != NSEnergyFormatterUnitJoule) {
    uint64_t v8 = v9;
  }
  if (unit <= 1792) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  if (((unit == NSEnergyFormatterUnitKilocalorie) & -[NSEnergyFormatter isForFoodEnergyUse](self, "isForFoodEnergyUse")) != 0) {
    uint64_t v11 = 3073LL;
  }
  else {
    uint64_t v11 = v10;
  }
  return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v11, value);
}

- (NSString)stringFromJoules:(double)numberInJoules
{
  uint64_t v5 = -[NSEnergyFormatter targetUnitFromJoules:](self, "targetUnitFromJoules:");
  double v6 = 0.0;
  if (v5 > 1792)
  {
    if (v5 == 1793)
    {
      double v7 = 4.184;
      goto LABEL_10;
    }

    if (v5 == 1794)
    {
      double v7 = 4184.0;
      goto LABEL_10;
    }
  }

  else if (v5 == 11)
  {
    double v6 = numberInJoules;
  }

  else if (v5 == 14)
  {
    double v7 = 1000.0;
LABEL_10:
    double v6 = numberInJoules / v7;
  }

  return -[NSEnergyFormatter stringFromValue:unit:](self, "stringFromValue:unit:", v5, v6);
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  return -[NSEnergyFormatter stringFromJoules:](self, "stringFromJoules:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return  -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  -[NSEnergyFormatter stringFromJoules:](self, "stringFromJoules:"),  a4);
}

- (NSEnergyFormatter)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSEnergyFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSEnergyFormatter;
  uint64_t v5 = -[NSFormatter initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_unitFormatter = -[NSUnitFormatter initWithCoder:]( objc_alloc(&OBJC_CLASS___NSUnitFormatter),  "initWithCoder:",  a3);
    v5->_isForFoodEnergyUse = [a3 decodeBoolForKey:@"NS.forFoodEnergyUse"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSEnergyFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSEnergyFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  -[NSUnitFormatter encodeWithCoder:](self->_unitFormatter, "encodeWithCoder:", a3);
  if (self->_isForFoodEnergyUse) {
    [a3 encodeBool:1 forKey:@"NS.forFoodEnergyUse"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = -[NSUnitFormatter copyWithZone:](self->_unitFormatter, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_isForFoodEnergyUse;
  return (id)v5;
}

- (BOOL)isForFoodEnergyUse
{
  return self->_isForFoodEnergyUse;
}

- (void)setForFoodEnergyUse:(BOOL)forFoodEnergyUse
{
  self->_isForFoodEnergyUse = forFoodEnergyUse;
}

@end