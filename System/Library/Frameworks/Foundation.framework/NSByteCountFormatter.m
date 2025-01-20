@interface NSByteCountFormatter
+ (NSString)stringFromByteCount:(uint64_t)byteCount countStyle:(NSByteCountFormatterCountStyle)countStyle;
+ (NSString)stringFromMeasurement:(NSMeasurement *)measurement countStyle:(NSByteCountFormatterCountStyle)countStyle;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)allowsNonnumericFormatting;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)includesActualByteCount;
- (BOOL)includesCount;
- (BOOL)includesUnit;
- (BOOL)isAdaptive;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)zeroPadsFractionDigits;
- (NSByteCountFormatter)init;
- (NSByteCountFormatter)initWithCoder:(id)a3;
- (NSByteCountFormatterCountStyle)countStyle;
- (NSByteCountFormatterUnits)allowedUnits;
- (NSFormattingContext)formattingContext;
- (NSString)stringForObjectValue:(id)obj;
- (NSString)stringFromByteCount:(uint64_t)byteCount;
- (NSString)stringFromMeasurement:(NSMeasurement *)measurement;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_options;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setAdaptive:(BOOL)adaptive;
- (void)setAllowedUnits:(NSByteCountFormatterUnits)allowedUnits;
- (void)setAllowsNonnumericFormatting:(BOOL)allowsNonnumericFormatting;
- (void)setCountStyle:(NSByteCountFormatterCountStyle)countStyle;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setIncludesActualByteCount:(BOOL)includesActualByteCount;
- (void)setIncludesCount:(BOOL)includesCount;
- (void)setIncludesUnit:(BOOL)includesUnit;
- (void)setZeroPadsFractionDigits:(BOOL)zeroPadsFractionDigits;
@end

@implementation NSByteCountFormatter

- (NSByteCountFormatterUnits)allowedUnits
{
  return self->_allowedUnits;
}

- (void)setAllowedUnits:(NSByteCountFormatterUnits)allowedUnits
{
  self->_allowedUnits = allowedUnits;
}

- (NSByteCountFormatterCountStyle)countStyle
{
  return (uint64_t)self->_countStyle;
}

- (void)setCountStyle:(NSByteCountFormatterCountStyle)countStyle
{
  self->_countStyle = countStyle;
}

- (unint64_t)_options
{
  unint64_t v3 = -[NSByteCountFormatter countStyle](self, "countStyle") - 1;
  if (v3 > 2) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = qword_18399EBA0[v3];
  }
  NSByteCountFormatterUnits v5 = -[NSByteCountFormatter allowedUnits](self, "allowedUnits");
  if (v5 == 0xFFFF) {
    NSByteCountFormatterUnits v6 = 0LL;
  }
  else {
    NSByteCountFormatterUnits v6 = v5;
  }
  if (!v5) {
    NSByteCountFormatterUnits v6 = 0LL;
  }
  NSByteCountFormatterUnits v7 = v6 | v4;
  BOOL v8 = -[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting");
  BOOL v9 = -[NSByteCountFormatter includesUnit](self, "includesUnit");
  BOOL v10 = -[NSByteCountFormatter includesCount](self, "includesCount");
  BOOL v11 = -[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount");
  BOOL v12 = -[NSByteCountFormatter isAdaptive](self, "isAdaptive");
  BOOL v13 = -[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits");
  uint64_t v14 = 0x10000000LL;
  if (v8) {
    uint64_t v14 = 0x8000000LL;
  }
  uint64_t v15 = v14 | 0x40000000;
  if (!v9)
  {
    uint64_t v15 = v14;
    v14 |= 0x20000000uLL;
  }

  if (!v10) {
    uint64_t v14 = v15;
  }
  if (v11) {
    v14 |= 0x4000000uLL;
  }
  uint64_t v16 = 0x400000LL;
  if (v12) {
    uint64_t v16 = 0x200000LL;
  }
  uint64_t v17 = v14 | v16;
  if (v13) {
    v17 |= 0x1000000uLL;
  }
  return v7 | v17;
}

+ (NSString)stringFromByteCount:(uint64_t)byteCount countStyle:(NSByteCountFormatterCountStyle)countStyle
{
  else {
    unint64_t v5 = qword_18399EBA0[countStyle - 1];
  }
  return __NSLocalizedFileSizeDescription(byteCount, 0LL, v5, 0LL);
}

- (NSString)stringFromByteCount:(uint64_t)byteCount
{
  return __NSLocalizedFileSizeDescription( byteCount,  0LL,  -[NSByteCountFormatter _options](self, "_options"),  -[NSByteCountFormatter formattingContext](self, "formattingContext"));
}

+ (NSString)stringFromMeasurement:(NSMeasurement *)measurement countStyle:(NSByteCountFormatterCountStyle)countStyle
{
  else {
    unint64_t v6 = qword_18399EBA0[countStyle - 1];
  }
  return __NSLocalizedFileSizeDescriptionWithMeasurement(measurement, v6, 0LL);
}

- (NSString)stringFromMeasurement:(NSMeasurement *)measurement
{
  return __NSLocalizedFileSizeDescriptionWithMeasurement( measurement,  -[NSByteCountFormatter _options](self, "_options"),  -[NSByteCountFormatter formattingContext](self, "formattingContext"));
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSByteCountFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:]( &v9,  sel__mayDecorateAttributedStringForObjectValue_,  a3);
  }

  else
  {
    unint64_t v5 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    NSByteCountFormatterUnits v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation( v7,  sel_attributedStringForObjectValue_withDefaultAttributes_);
  }

- (NSString)stringForObjectValue:(id)obj
{
  if (_NSIsNSNumber()) {
    return __NSLocalizedFileSizeDescription( [obj longLongValue],  0,  -[NSByteCountFormatter _options](self, "_options"),  -[NSByteCountFormatter formattingContext](self, "formattingContext"));
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  NSByteCountFormatterAssertValidMeasurement(obj);
  return __NSLocalizedFileSizeDescriptionWithMeasurement( obj,  -[NSByteCountFormatter _options](self, "_options"),  -[NSByteCountFormatter formattingContext](self, "formattingContext"));
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return 0;
}

- (NSByteCountFormatter)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSByteCountFormatter;
  v2 = -[NSByteCountFormatter init](&v5, sel_init);
  unint64_t v3 = v2;
  if (v2)
  {
    -[NSByteCountFormatter setAdaptive:](v2, "setAdaptive:", 1LL);
    -[NSByteCountFormatter setAllowsNonnumericFormatting:](v3, "setAllowsNonnumericFormatting:", 1LL);
    -[NSByteCountFormatter setIncludesUnit:](v3, "setIncludesUnit:", 1LL);
    -[NSByteCountFormatter setIncludesCount:](v3, "setIncludesCount:", 1LL);
    -[NSByteCountFormatter setFormattingContext:](v3, "setFormattingContext:", 0LL);
  }

  return v3;
}

- (NSFormattingContext)formattingContext
{
  return (uint64_t)self->_formattingContext;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  self->_formattingContext = formattingContext;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowedUnits:", -[NSByteCountFormatter allowedUnits](self, "allowedUnits"));
  objc_msgSend(v4, "setCountStyle:", -[NSByteCountFormatter countStyle](self, "countStyle"));
  objc_msgSend( v4,  "setAllowsNonnumericFormatting:",  -[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting"));
  objc_msgSend(v4, "setIncludesUnit:", -[NSByteCountFormatter includesUnit](self, "includesUnit"));
  objc_msgSend(v4, "setIncludesCount:", -[NSByteCountFormatter includesCount](self, "includesCount"));
  objc_msgSend( v4,  "setIncludesActualByteCount:",  -[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount"));
  objc_msgSend(v4, "setAdaptive:", -[NSByteCountFormatter isAdaptive](self, "isAdaptive"));
  objc_msgSend( v4,  "setZeroPadsFractionDigits:",  -[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits"));
  objc_msgSend(v4, "setFormattingContext:", -[NSByteCountFormatter formattingContext](self, "formattingContext"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSByteCountFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSByteCountFormatter needs keyed archiver" userInfo:0]);
  }
  if (-[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits")) {
    [a3 encodeBool:1 forKey:@"NSZeroPad"];
  }
  if (-[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount")) {
    [a3 encodeBool:1 forKey:@"NSActual"];
  }
  if (!-[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting")) {
    [a3 encodeBool:1 forKey:@"NSNoNonnumeric"];
  }
  if (!-[NSByteCountFormatter includesUnit](self, "includesUnit")) {
    [a3 encodeBool:1 forKey:@"NSNoUnit"];
  }
  if (!-[NSByteCountFormatter includesCount](self, "includesCount")) {
    [a3 encodeBool:1 forKey:@"NSNoCount"];
  }
  if (!-[NSByteCountFormatter isAdaptive](self, "isAdaptive")) {
    [a3 encodeBool:1 forKey:@"NSNoAdaptive"];
  }
}

- (NSByteCountFormatter)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSByteCountFormatter;
  uint64_t v4 = -[NSFormatter initWithCoder:](&v8, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  if ([a3 allowsKeyedCoding])
  {
    -[NSByteCountFormatter setFormattingContext:]( v4,  "setFormattingContext:",  (int)[a3 decodeInt32ForKey:@"NSFormattingContext"]);
    -[NSByteCountFormatter setAllowedUnits:]( v4,  "setAllowedUnits:",  (int)[a3 decodeInt32ForKey:@"NSUnits"]);
    -[NSByteCountFormatter setCountStyle:]( v4,  "setCountStyle:",  (int)[a3 decodeInt32ForKey:@"NSKBSize"]);
    -[NSByteCountFormatter setZeroPadsFractionDigits:]( v4,  "setZeroPadsFractionDigits:",  [a3 decodeBoolForKey:@"NSZeroPad"]);
    -[NSByteCountFormatter setIncludesActualByteCount:]( v4,  "setIncludesActualByteCount:",  [a3 decodeBoolForKey:@"NSActual"]);
    -[NSByteCountFormatter setAllowsNonnumericFormatting:]( v4,  "setAllowsNonnumericFormatting:",  [a3 decodeBoolForKey:@"NSNoNonnumeric"] ^ 1);
    -[NSByteCountFormatter setIncludesUnit:]( v4,  "setIncludesUnit:",  [a3 decodeBoolForKey:@"NSNoUnit"] ^ 1);
    -[NSByteCountFormatter setIncludesCount:]( v4,  "setIncludesCount:",  [a3 decodeBoolForKey:@"NSNoCount"] ^ 1);
    -[NSByteCountFormatter setAdaptive:]( v4,  "setAdaptive:",  [a3 decodeBoolForKey:@"NSNoAdaptive"] ^ 1);
    return v4;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSByteCountFormatter needs keyed archiver" userInfo:0]);
  return (NSByteCountFormatter *)-[NSByteCountFormatter allowsNonnumericFormatting](v6, v7);
}

- (BOOL)allowsNonnumericFormatting
{
  return self->_allowsNonnumericFormatting;
}

- (void)setAllowsNonnumericFormatting:(BOOL)allowsNonnumericFormatting
{
  self->_allowsNonnumericFormatting = allowsNonnumericFormatting;
}

- (BOOL)includesUnit
{
  return self->_includesUnit;
}

- (void)setIncludesUnit:(BOOL)includesUnit
{
  self->_includesUnit = includesUnit;
}

- (BOOL)includesCount
{
  return self->_includesCount;
}

- (void)setIncludesCount:(BOOL)includesCount
{
  self->_includesCount = includesCount;
}

- (BOOL)includesActualByteCount
{
  return self->_includesActualByteCount;
}

- (void)setIncludesActualByteCount:(BOOL)includesActualByteCount
{
  self->_includesActualByteCount = includesActualByteCount;
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (void)setAdaptive:(BOOL)adaptive
{
  self->_adaptive = adaptive;
}

- (BOOL)zeroPadsFractionDigits
{
  return self->_zeroPadsFractionDigits;
}

- (void)setZeroPadsFractionDigits:(BOOL)zeroPadsFractionDigits
{
  self->_zeroPadsFractionDigits = zeroPadsFractionDigits;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  51LL,  @"Invalid parameter not satisfying: %@",  @"!value || _NSIsNSNumber(value)");
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSByteCountFormatter;
  -[NSByteCountFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSByteCountFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

@end