@interface NSMassFormatter
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isForPersonMassUse;
- (NSFormattingUnitStyle)unitStyle;
- (NSMassFormatter)init;
- (NSMassFormatter)initWithCoder:(id)a3;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromKilograms:(double)numberInKilograms;
- (NSString)stringFromValue:(double)value unit:(NSMassFormatterUnit)unit;
- (NSString)unitStringFromKilograms:(double)numberInKilograms usedUnit:(NSMassFormatterUnit *)unitp;
- (NSString)unitStringFromValue:(double)value unit:(NSMassFormatterUnit)unit;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)targetUnitFromKilograms:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setForPersonMassUse:(BOOL)forPersonMassUse;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSMassFormatter

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  return -[NSMassFormatter stringFromKilograms:](self, "stringFromKilograms:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return  -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  -[NSMassFormatter stringFromKilograms:](self, "stringFromKilograms:"),  a4);
}

- (int64_t)targetUnitFromKilograms:(double)a3
{
  v4 = -[NSNumberFormatter locale](-[NSMassFormatter numberFormatter](self, "numberFormatter"), "locale");
  else {
    v5 = &us_units_0;
  }
  v6 = (double *)malloc(0x20uLL);
  v7 = v6;
  uint64_t v8 = 0LL;
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = v5[v8];
    if (v11 <= 1536)
    {
      double v12 = a3 / 0.001;
      if (v11 != 11)
      {
        if (v11 == 14) {
          double v12 = a3;
        }
        else {
          double v12 = 0.0;
        }
      }
    }

    else
    {
      if (v11 == 1539) {
        double v12 = a3 * 0.15747;
      }
      else {
        double v12 = 0.0;
      }
      if (v11 == 1538) {
        double v12 = a3 * 2.20462262;
      }
      if (v11 == 1537) {
        double v12 = a3 * 35.273962;
      }
    }

    char v9 = 0;
    v13 = &v6[2 * v8];
    double *v13 = v12;
    *((void *)v13 + 1) = v11;
    uint64_t v8 = 1LL;
  }

  while ((v10 & 1) != 0);
  qsort(v6, 2uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_0);
  int64_t v14 = *(void *)&v7[2 * (*v7 <= 1.0) + 1];
  free(v7);
  return v14;
}

- (NSMassFormatter)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSMassFormatter;
  v2 = -[NSMassFormatter init](&v4, sel_init);
  if (v2) {
    v2->_unitFormatter = objc_alloc_init(&OBJC_CLASS___NSUnitFormatter);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMassFormatter;
  -[NSMassFormatter dealloc](&v3, sel_dealloc);
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

- (NSString)unitStringFromKilograms:(double)numberInKilograms usedUnit:(NSMassFormatterUnit *)unitp
{
  NSMassFormatterUnit v7 = -[NSMassFormatter targetUnitFromKilograms:](self, "targetUnitFromKilograms:");
  double v8 = 0.0;
  if (v7 <= 1536)
  {
    if (v7 == NSMassFormatterUnitGram)
    {
      double v8 = numberInKilograms / 0.001;
      if (!unitp) {
        return -[NSMassFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
      }
      goto LABEL_16;
    }

    if (v7 == NSMassFormatterUnitKilogram) {
      double v8 = numberInKilograms;
    }
    if (unitp) {
LABEL_16:
    }
      *unitp = v7;
  }

  else
  {
    switch(v7)
    {
      case NSMassFormatterUnitOunce:
        double v9 = 35.273962;
LABEL_12:
        double v8 = numberInKilograms * v9;
        if (!unitp) {
          return -[NSMassFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
        }
        goto LABEL_16;
      case NSMassFormatterUnitPound:
        double v8 = numberInKilograms * 2.20462262;
        break;
      case NSMassFormatterUnitStone:
        double v9 = 0.15747;
        goto LABEL_12;
    }

    if (unitp) {
      goto LABEL_16;
    }
  }

  return -[NSMassFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
}

- (NSString)unitStringFromValue:(double)value unit:(NSMassFormatterUnit)unit
{
  uint64_t v4 = 1538LL;
  uint64_t v5 = 1539LL;
  uint64_t v6 = 1540LL;
  if (unit != NSMassFormatterUnitStone) {
    uint64_t v6 = 0LL;
  }
  if (unit != NSMassFormatterUnitPound) {
    uint64_t v5 = v6;
  }
  if (unit != NSMassFormatterUnitOunce) {
    uint64_t v4 = v5;
  }
  uint64_t v7 = 1536LL;
  uint64_t v8 = 1537LL;
  if (unit != NSMassFormatterUnitKilogram) {
    uint64_t v8 = 0LL;
  }
  if (unit != NSMassFormatterUnitGram) {
    uint64_t v7 = v8;
  }
  if (unit <= 1536) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v4;
  }
  return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:]( self->_unitFormatter,  "unitStringFromValue:unit:",  v9,  value);
}

- (NSString)stringFromKilograms:(double)numberInKilograms
{
  uint64_t v5 = -[NSMassFormatter targetUnitFromKilograms:](self, "targetUnitFromKilograms:");
  double v6 = 0.0;
  if (v5 <= 1536)
  {
    if (v5 == 11)
    {
      double v6 = numberInKilograms / 0.001;
    }

    else if (v5 == 14)
    {
      double v6 = numberInKilograms;
    }
  }

  else
  {
    switch(v5)
    {
      case 1537LL:
        double v7 = 35.273962;
        goto LABEL_12;
      case 1538LL:
        double v7 = 2.20462262;
        goto LABEL_12;
      case 1539LL:
        double v7 = 0.15747;
LABEL_12:
        double v6 = numberInKilograms * v7;
        break;
    }
  }

  return -[NSMassFormatter stringFromValue:unit:](self, "stringFromValue:unit:", v5, v6);
}

- (NSString)stringFromValue:(double)value unit:(NSMassFormatterUnit)unit
{
  v10[1] = *(double *)MEMORY[0x1895F89C0];
  if (unit <= 1536)
  {
    uint64_t v8 = 1537LL;
    if (unit != NSMassFormatterUnitKilogram) {
      uint64_t v8 = 0LL;
    }
    if (unit == NSMassFormatterUnitGram) {
      uint64_t v9 = 1536LL;
    }
    else {
      uint64_t v9 = v8;
    }
  }

  else
  {
    switch(unit)
    {
      case NSMassFormatterUnitOunce:
        uint64_t v9 = 1538LL;
        break;
      case NSMassFormatterUnitPound:
        uint64_t v9 = 1539LL;
        break;
      case NSMassFormatterUnitStone:
        v10[0] = 0.0;
        double v6 = modf(value, v10);
        if (v6 > 0.0) {
          return (NSString *)-[NSUnitFormatter stringForValue1:unit1:value2:unit2:]( self->_unitFormatter,  "stringForValue1:unit1:value2:unit2:",  1540LL,  1539LL,  v10[0],  v6 * 14.0);
        }
        uint64_t v9 = 1540LL;
        break;
      default:
        uint64_t v9 = 0LL;
        break;
    }
  }

  return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v9, value);
}

- (NSMassFormatter)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSMassFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSMassFormatter;
  uint64_t v5 = -[NSFormatter initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_unitFormatter = -[NSUnitFormatter initWithCoder:]( objc_alloc(&OBJC_CLASS___NSUnitFormatter),  "initWithCoder:",  a3);
    v5->_isForPersonMassUse = [a3 decodeBoolForKey:@"NS.forPersonMassUse"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSMassFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSMassFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  -[NSUnitFormatter encodeWithCoder:](self->_unitFormatter, "encodeWithCoder:", a3);
  if (self->_isForPersonMassUse) {
    [a3 encodeBool:1 forKey:@"NS.forPersonMassUse"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = -[NSUnitFormatter copyWithZone:](self->_unitFormatter, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_isForPersonMassUse;
  return (id)v5;
}

- (BOOL)isForPersonMassUse
{
  return self->_isForPersonMassUse;
}

- (void)setForPersonMassUse:(BOOL)forPersonMassUse
{
  self->_isForPersonMassUse = forPersonMassUse;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  65LL,  @"Invalid parameter not satisfying: %@",  @"!value || _NSIsNSNumber(value)");
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMassFormatter;
  -[NSMassFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSMassFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

@end