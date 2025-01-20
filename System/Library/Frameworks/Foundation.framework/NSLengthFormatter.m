@interface NSLengthFormatter
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isForPersonHeightUse;
- (NSFormattingUnitStyle)unitStyle;
- (NSLengthFormatter)init;
- (NSLengthFormatter)initWithCoder:(id)a3;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromMeters:(double)numberInMeters;
- (NSString)stringFromValue:(double)value unit:(NSLengthFormatterUnit)unit;
- (NSString)unitStringFromMeters:(double)numberInMeters usedUnit:(NSLengthFormatterUnit *)unitp;
- (NSString)unitStringFromValue:(double)value unit:(NSLengthFormatterUnit)unit;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)targetUnitFromMeters:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setForPersonHeightUse:(BOOL)forPersonHeightUse;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSLengthFormatter

- (int64_t)targetUnitFromMeters:(double)a3
{
  v5 = -[NSNumberFormatter locale](-[NSLengthFormatter numberFormatter](self, "numberFormatter"), "locale");
  int v6 = objc_msgSend(-[NSLocale objectForKey:](v5, "objectForKey:", *MEMORY[0x189603B28]), "BOOLValue");
  if (-[NSLengthFormatter isForPersonHeightUse](self, "isForPersonHeightUse"))
  {
    if (v6 && !-[NSString isEqual:](-[NSLocale localeIdentifier](v5, "localeIdentifier"), "isEqual:", @"en_GB")) {
      return 9LL;
    }
    else {
      return 1282LL;
    }
  }

  else
  {
    if (v6) {
      v8 = (uint64_t *)&metric_units;
    }
    else {
      v8 = (uint64_t *)&us_units;
    }
    return findUnit(v8, a3);
  }

- (NSLengthFormatter)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSLengthFormatter;
  v2 = -[NSLengthFormatter init](&v4, sel_init);
  if (v2) {
    v2->_unitFormatter = objc_alloc_init(&OBJC_CLASS___NSUnitFormatter);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSLengthFormatter;
  -[NSLengthFormatter dealloc](&v3, sel_dealloc);
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

- (BOOL)isForPersonHeightUse
{
  return self->_isForPersonHeight;
}

- (void)setForPersonHeightUse:(BOOL)forPersonHeightUse
{
  self->_isForPersonHeight = forPersonHeightUse;
}

- (NSString)unitStringFromValue:(double)value unit:(NSLengthFormatterUnit)unit
{
  uint64_t v5 = 0LL;
  switch(unit)
  {
    case 8LL:
      uint64_t v5 = 1283LL;
      break;
    case 9LL:
      uint64_t v5 = 1281LL;
      break;
    case 10LL:
    case 12LL:
    case 13LL:
      return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:]( self->_unitFormatter,  "unitStringFromValue:unit:",  v5,  value);
    case 11LL:
      uint64_t v5 = 1280LL;
      break;
    case 14LL:
      uint64_t v5 = 1282LL;
      break;
    default:
      switch(unit)
      {
        case NSLengthFormatterUnitInch:
          uint64_t v5 = 1286LL;
          break;
        case NSLengthFormatterUnitFoot:
          uint64_t v5 = 1285LL;
          break;
        case NSLengthFormatterUnitYard:
          uint64_t v5 = 1288LL;
          break;
        case NSLengthFormatterUnitMile:
          uint64_t v5 = 1287LL;
          break;
        default:
          return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:]( self->_unitFormatter,  "unitStringFromValue:unit:",  v5,  value);
      }

      break;
  }

  return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:]( self->_unitFormatter,  "unitStringFromValue:unit:",  v5,  value);
}

- (NSString)unitStringFromMeters:(double)numberInMeters usedUnit:(NSLengthFormatterUnit *)unitp
{
  int64_t v7 = -[NSLengthFormatter targetUnitFromMeters:](self, "targetUnitFromMeters:");
  if (unitp) {
    *unitp = v7;
  }
  return -[NSLengthFormatter unitStringFromValue:unit:]( self,  "unitStringFromValue:unit:",  v7,  convertUnitFromMeters(v7, numberInMeters));
}

- (NSString)stringFromMeters:(double)numberInMeters
{
  if (!-[NSLengthFormatter isForPersonHeightUse](self, "isForPersonHeightUse"))
  {
    uint64_t v9 = -[NSLengthFormatter targetUnitFromMeters:](self, "targetUnitFromMeters:", numberInMeters);
    double v6 = convertUnitFromMeters(v9, numberInMeters);
    int64_t v7 = self;
    uint64_t v8 = v9;
    return -[NSLengthFormatter stringFromValue:unit:](v7, "stringFromValue:unit:", v8, v6);
  }

  uint64_t v5 = -[NSNumberFormatter locale](-[NSLengthFormatter numberFormatter](self, "numberFormatter"), "locale");
  if (objc_msgSend(-[NSLocale objectForKey:](v5, "objectForKey:", *MEMORY[0x189603B28]), "BOOLValue"))
  {
    double v6 = numberInMeters / 0.01;
    int64_t v7 = self;
    uint64_t v8 = 9LL;
    return -[NSLengthFormatter stringFromValue:unit:](v7, "stringFromValue:unit:", v8, v6);
  }

  double v11 = floor(numberInMeters * 3.28084);
  return (NSString *)-[NSUnitFormatter stringForValue1:unit1:value2:unit2:]( self->_unitFormatter,  "stringForValue1:unit1:value2:unit2:",  1285LL,  1286LL,  v11,  (numberInMeters - v11 / 3.28084) * 39.3701);
}

- (NSString)stringFromValue:(double)value unit:(NSLengthFormatterUnit)unit
{
  uint64_t v5 = 0LL;
  switch(unit)
  {
    case 8LL:
      uint64_t v5 = 1283LL;
      break;
    case 9LL:
      uint64_t v5 = 1281LL;
      break;
    case 10LL:
    case 12LL:
    case 13LL:
      return (NSString *)-[NSUnitFormatter stringForValue:unit:]( self->_unitFormatter,  "stringForValue:unit:",  v5,  value);
    case 11LL:
      uint64_t v5 = 1280LL;
      break;
    case 14LL:
      uint64_t v5 = 1282LL;
      break;
    default:
      switch(unit)
      {
        case NSLengthFormatterUnitInch:
          uint64_t v5 = 1286LL;
          break;
        case NSLengthFormatterUnitFoot:
          uint64_t v5 = 1285LL;
          break;
        case NSLengthFormatterUnitYard:
          uint64_t v5 = 1288LL;
          break;
        case NSLengthFormatterUnitMile:
          uint64_t v5 = 1287LL;
          break;
        default:
          return (NSString *)-[NSUnitFormatter stringForValue:unit:]( self->_unitFormatter,  "stringForValue:unit:",  v5,  value);
      }

      break;
  }

  return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v5, value);
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  return -[NSLengthFormatter stringFromMeters:](self, "stringFromMeters:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return  -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  -[NSLengthFormatter stringFromMeters:](self, "stringFromMeters:"),  a4);
}

- (NSLengthFormatter)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSLengthFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSLengthFormatter;
  uint64_t v5 = -[NSFormatter initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_unitFormatter = -[NSUnitFormatter initWithCoder:]( objc_alloc(&OBJC_CLASS___NSUnitFormatter),  "initWithCoder:",  a3);
    v5->_isForPersonHeight = [a3 decodeBoolForKey:@"NS.forPersonHeightUse"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSLengthFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSLengthFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  -[NSUnitFormatter encodeWithCoder:](self->_unitFormatter, "encodeWithCoder:", a3);
  if (self->_isForPersonHeight) {
    [a3 encodeBool:1 forKey:@"NS.forPersonHeightUse"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = -[NSUnitFormatter copyWithZone:](self->_unitFormatter, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_isForPersonHeight;
  return (id)v5;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  72LL,  @"Invalid parameter not satisfying: %@",  @"!value || _NSIsNSNumber(value)");
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSLengthFormatter;
  -[NSLengthFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSLengthFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

@end