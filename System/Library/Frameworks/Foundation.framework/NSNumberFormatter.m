@interface NSNumberFormatter
+ (NSNumberFormatterBehavior)defaultFormatterBehavior;
+ (NSString)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle;
+ (void)initialize;
+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior;
- (BOOL)_hasSetCurrencyCode;
- (BOOL)_hasSetCurrencySymbol;
- (BOOL)_hasSetInternationalCurrencySymbol;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_tracksCacheGenerationCount;
- (BOOL)_usesCharacterDirection;
- (BOOL)allowsFloats;
- (BOOL)alwaysShowsDecimalSeparator;
- (BOOL)checkLocaleChange;
- (BOOL)checkModify;
- (BOOL)generatesDecimalNumbers;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error;
- (BOOL)isLenient;
- (BOOL)isPartialStringValidationEnabled;
- (BOOL)usesGroupingSeparator;
- (BOOL)usesSignificantDigits;
- (NSDictionary)textAttributesForNegativeInfinity;
- (NSDictionary)textAttributesForNegativeValues;
- (NSDictionary)textAttributesForNil;
- (NSDictionary)textAttributesForNotANumber;
- (NSDictionary)textAttributesForPositiveInfinity;
- (NSDictionary)textAttributesForPositiveValues;
- (NSDictionary)textAttributesForZero;
- (NSFormattingContext)formattingContext;
- (NSLocale)locale;
- (NSNumber)maximum;
- (NSNumber)minimum;
- (NSNumber)multiplier;
- (NSNumber)numberFromString:(NSString *)string;
- (NSNumber)roundingIncrement;
- (NSNumberFormatter)init;
- (NSNumberFormatter)initWithCoder:(id)a3;
- (NSNumberFormatterBehavior)formatterBehavior;
- (NSNumberFormatterPadPosition)paddingPosition;
- (NSNumberFormatterRoundingMode)roundingMode;
- (NSNumberFormatterStyle)numberStyle;
- (NSString)currencyCode;
- (NSString)currencyDecimalSeparator;
- (NSString)currencyGroupingSeparator;
- (NSString)currencySymbol;
- (NSString)decimalSeparator;
- (NSString)exponentSymbol;
- (NSString)groupingSeparator;
- (NSString)internationalCurrencySymbol;
- (NSString)minusSign;
- (NSString)negativeFormat;
- (NSString)negativeInfinitySymbol;
- (NSString)negativePrefix;
- (NSString)negativeSuffix;
- (NSString)nilSymbol;
- (NSString)notANumberSymbol;
- (NSString)paddingCharacter;
- (NSString)perMillSymbol;
- (NSString)percentSymbol;
- (NSString)plusSign;
- (NSString)positiveFormat;
- (NSString)positiveInfinitySymbol;
- (NSString)positivePrefix;
- (NSString)positiveSuffix;
- (NSString)stringFromNumber:(NSNumber *)number;
- (NSString)zeroSymbol;
- (NSUInteger)formatWidth;
- (NSUInteger)groupingSize;
- (NSUInteger)maximumFractionDigits;
- (NSUInteger)maximumIntegerDigits;
- (NSUInteger)maximumSignificantDigits;
- (NSUInteger)minimumFractionDigits;
- (NSUInteger)minimumIntegerDigits;
- (NSUInteger)minimumSignificantDigits;
- (NSUInteger)secondaryGroupingSize;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)_cacheGenerationCount;
- (int64_t)minimumGroupingDigits;
- (void)__Keynote_NOOP;
- (void)_clearFormatter;
- (void)_invalidateCache;
- (void)_regenerateFormatter;
- (void)_reset;
- (void)_setUsesCharacterDirection:(BOOL)a3;
- (void)clearPropertyBit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getFormatter;
- (void)receiveObservedValue:(id)a3;
- (void)resetCheckLocaleChange;
- (void)resetCheckModify;
- (void)setAllowsFloats:(BOOL)allowsFloats;
- (void)setAlwaysShowsDecimalSeparator:(BOOL)alwaysShowsDecimalSeparator;
- (void)setCurrencyCode:(NSString *)currencyCode;
- (void)setCurrencyDecimalSeparator:(NSString *)currencyDecimalSeparator;
- (void)setCurrencyGroupingSeparator:(NSString *)currencyGroupingSeparator;
- (void)setCurrencySymbol:(NSString *)currencySymbol;
- (void)setDecimalSeparator:(NSString *)decimalSeparator;
- (void)setExponentSymbol:(NSString *)exponentSymbol;
- (void)setFormatWidth:(NSUInteger)formatWidth;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setGeneratesDecimalNumbers:(BOOL)generatesDecimalNumbers;
- (void)setGroupingSeparator:(NSString *)groupingSeparator;
- (void)setGroupingSize:(NSUInteger)groupingSize;
- (void)setInternationalCurrencySymbol:(NSString *)internationalCurrencySymbol;
- (void)setLenient:(BOOL)lenient;
- (void)setLocale:(NSLocale *)locale;
- (void)setMaximum:(NSNumber *)maximum;
- (void)setMaximumFractionDigits:(NSUInteger)maximumFractionDigits;
- (void)setMaximumIntegerDigits:(NSUInteger)maximumIntegerDigits;
- (void)setMaximumSignificantDigits:(NSUInteger)maximumSignificantDigits;
- (void)setMinimum:(NSNumber *)minimum;
- (void)setMinimumFractionDigits:(NSUInteger)minimumFractionDigits;
- (void)setMinimumGroupingDigits:(int64_t)a3;
- (void)setMinimumIntegerDigits:(NSUInteger)minimumIntegerDigits;
- (void)setMinimumSignificantDigits:(NSUInteger)minimumSignificantDigits;
- (void)setMinusSign:(NSString *)minusSign;
- (void)setMultiplier:(NSNumber *)multiplier;
- (void)setNegativeFormat:(NSString *)negativeFormat;
- (void)setNegativeInfinitySymbol:(NSString *)negativeInfinitySymbol;
- (void)setNegativePrefix:(NSString *)negativePrefix;
- (void)setNegativeSuffix:(NSString *)negativeSuffix;
- (void)setNilSymbol:(NSString *)nilSymbol;
- (void)setNotANumberSymbol:(NSString *)notANumberSymbol;
- (void)setNumberStyle:(NSNumberFormatterStyle)numberStyle;
- (void)setPaddingCharacter:(NSString *)paddingCharacter;
- (void)setPaddingPosition:(NSNumberFormatterPadPosition)paddingPosition;
- (void)setPartialStringValidationEnabled:(BOOL)partialStringValidationEnabled;
- (void)setPerMillSymbol:(NSString *)perMillSymbol;
- (void)setPercentSymbol:(NSString *)percentSymbol;
- (void)setPlusSign:(NSString *)plusSign;
- (void)setPositiveFormat:(NSString *)positiveFormat;
- (void)setPositiveInfinitySymbol:(NSString *)positiveInfinitySymbol;
- (void)setPositivePrefix:(NSString *)positivePrefix;
- (void)setPositiveSuffix:(NSString *)positiveSuffix;
- (void)setPropertyBit;
- (void)setRoundingIncrement:(NSNumber *)roundingIncrement;
- (void)setRoundingMode:(NSNumberFormatterRoundingMode)roundingMode;
- (void)setSecondaryGroupingSize:(NSUInteger)secondaryGroupingSize;
- (void)setTextAttributesForNegativeInfinity:(NSDictionary *)textAttributesForNegativeInfinity;
- (void)setTextAttributesForNegativeValues:(NSDictionary *)textAttributesForNegativeValues;
- (void)setTextAttributesForNil:(NSDictionary *)textAttributesForNil;
- (void)setTextAttributesForNotANumber:(NSDictionary *)textAttributesForNotANumber;
- (void)setTextAttributesForPositiveInfinity:(NSDictionary *)textAttributesForPositiveInfinity;
- (void)setTextAttributesForPositiveValues:(NSDictionary *)textAttributesForPositiveValues;
- (void)setTextAttributesForZero:(NSDictionary *)textAttributesForZero;
- (void)setUsesGroupingSeparator:(BOOL)usesGroupingSeparator;
- (void)setUsesSignificantDigits:(BOOL)usesSignificantDigits;
- (void)setZeroSymbol:(NSString *)zeroSymbol;
@end

@implementation NSNumberFormatter

+ (NSNumberFormatterBehavior)defaultFormatterBehavior
{
  return __NSNumberFormatterDefaultBehavior;
}

+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior
{
  NSNumberFormatterBehavior v3 = NSNumberFormatterBehavior10_4;
  if (behavior) {
    NSNumberFormatterBehavior v3 = behavior;
  }
  __NSNumberFormatterDefaultBehavior = v3;
}

+ (void)initialize
{
  if (!__NSNumberFormatterDefaultBehavior) {
    [a1 setDefaultFormatterBehavior:0];
  }
}

- (void)_invalidateCache
{
}

- (void)_clearFormatter
{
  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }
  self->_formatter = 0LL;
  ++self->_cacheGeneration;
}

- (void)_regenerateFormatter
{
  if (self->_formatter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  self->_counter = _CFLocaleGetNoteCount();
  NSNumberFormatterBehavior v3 = (const __CFLocale *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale");
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"numberStyle");
  v5 = (void *)v4;
  v6 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  if (v3)
  {
    if (v4)
    {
LABEL_5:
      CFNumberFormatterStyle v7 = [v5 integerValue];
      goto LABEL_8;
    }
  }

  else
  {
    NSNumberFormatterBehavior v3 = (const __CFLocale *)[MEMORY[0x189603F90] currentLocale];
    if (v5) {
      goto LABEL_5;
    }
  }

  CFNumberFormatterStyle v7 = kCFNumberFormatterNoStyle;
LABEL_8:
  v8 = CFNumberFormatterCreate(v6, v3, v7);
  self->_formatter = v8;
  if (!v8) {
    return;
  }
  uint64_t v9 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positiveFormat");
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativeFormat");
  v11 = v10;
  if (v9)
  {
    if (!v10 || ([v10 isEqualToString:v9] & 1) != 0)
    {
      formatter = self->_formatter;
      v13 = (const __CFString *)v9;
LABEL_19:
      CFNumberFormatterSetFormat(formatter, v13);
      goto LABEL_20;
    }

    v15 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@;%@", v9, v11);
    CFNumberFormatterSetFormat(self->_formatter, (CFStringRef)v15);
  }

  else if (v10)
  {
    id v14 = objc_autorelease((id)objc_msgSend( (id)-[__CFString componentsSeparatedByString:]( (id)CFNumberFormatterGetFormat(self->_formatter),  "componentsSeparatedByString:",  @";"),
                                 "mutableCopy"));
    else {
      [v14 addObject:v11];
    }
    v13 = (const __CFString *)[v14 componentsJoinedByString:@";"];
    formatter = self->_formatter;
    goto LABEL_19;
  }

- (void)__Keynote_NOOP
{
  return 0LL;
}

- (NSNumberFormatter)init
{
  v34[1] = *MEMORY[0x1895F89C0];
  if (objc_lookUpClass("ChartNumberFormatter")
    && objc_msgSend( @"com.apple.Keynote",  "isEqual:",  -[NSBundle bundleIdentifier]( +[NSBundle mainBundle](NSBundle, "mainBundle"),  "bundleIdentifier")))
  {
    NSNumberFormatterBehavior v3 = (objc_class *)objc_opt_self();
    uint64_t v4 = sel_registerName("__Keynote_NOOP");
    MethodImplementation = class_getMethodImplementation(v3, v4);
    v6 = (objc_class *)objc_opt_self();
    CFNumberFormatterStyle v7 = sel_registerName("_getNegative");
    InstanceMethod = class_getInstanceMethod(v6, v7);
    if (InstanceMethod) {
      method_setImplementation(InstanceMethod, MethodImplementation);
    }
    uint64_t v9 = (objc_class *)objc_opt_self();
    v10 = sel_registerName("_setNegativeFormat:");
    v11 = class_getInstanceMethod(v9, v10);
    if (v11) {
      method_setImplementation(v11, MethodImplementation);
    }
    v12 = (objc_class *)objc_opt_self();
    v13 = sel_registerName("_getPositive");
    id v14 = class_getInstanceMethod(v12, v13);
    if (v14) {
      method_setImplementation(v14, MethodImplementation);
    }
    v15 = (objc_class *)objc_opt_self();
    v16 = sel_registerName("_setPositiveFormat:");
    v17 = class_getInstanceMethod(v15, v16);
    if (v17) {
      method_setImplementation(v17, MethodImplementation);
    }
    v18 = (objc_class *)objc_opt_self();
    v19 = sel_registerName("setNegativeFormat:");
    v20 = class_getMethodImplementation(v18, v19);
    v21 = objc_lookUpClass("ChartNumberFormatter");
    v22 = sel_registerName("setNegativeFormat:");
    v23 = class_getInstanceMethod(v21, v22);
    if (v23) {
      method_setImplementation(v23, v20);
    }
    v24 = (objc_class *)objc_opt_self();
    v25 = sel_registerName("setPositiveFormat:");
    v26 = class_getMethodImplementation(v24, v25);
    v27 = objc_lookUpClass("ChartNumberFormatter");
    v28 = sel_registerName("setPositiveFormat:");
    v29 = class_getInstanceMethod(v27, v28);
    if (v29) {
      method_setImplementation(v29, v26);
    }
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
  v30 = -[NSNumberFormatter init](&v33, sel_init);
  if (v30)
  {
    v30->_lock = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    v31 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithCapacity:20];
    v30->_attributes = v31;
    -[NSMutableDictionary setValue:forKey:]( v31,  "setValue:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)objc_opt_class() defaultFormatterBehavior]),  @"formatterBehavior");
    -[NSNumberFormatter setNilSymbol:](v30, "setNilSymbol:", &stru_189CA6A28);
    v34[0] = 0x221E002D221E002BLL;
    -[NSNumberFormatter setPositiveInfinitySymbol:]( v30,  "setPositiveInfinitySymbol:",  +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v34, 2LL));
    -[NSNumberFormatter setNegativeInfinitySymbol:]( v30,  "setNegativeInfinitySymbol:",  +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  (char *)v34 + 4,  2LL));
    -[NSNumberFormatter setAllowsFloats:](v30, "setAllowsFloats:", 1LL);
    -[NSNumberFormatter _clearFormatter](v30, "_clearFormatter");
  }

  return v30;
}

- (void)_reset
{
  v4[1] = *MEMORY[0x1895F89C0];

  NSNumberFormatterBehavior v3 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithCapacity:20];
  self->_attributes = v3;
  -[NSMutableDictionary setValue:forKey:]( v3,  "setValue:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)objc_opt_class() defaultFormatterBehavior]),  @"formatterBehavior");
  -[NSNumberFormatter setNilSymbol:](self, "setNilSymbol:", &stru_189CA6A28);
  v4[0] = 0x221E002D221E002BLL;
  -[NSNumberFormatter setPositiveInfinitySymbol:]( self,  "setPositiveInfinitySymbol:",  +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v4, 2LL));
  -[NSNumberFormatter setNegativeInfinitySymbol:]( self,  "setNegativeInfinitySymbol:",  +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  (char *)v4 + 4,  2LL));
  -[NSNumberFormatter setAllowsFloats:](self, "setAllowsFloats:", 1LL);
  -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
  -[NSNumberFormatter dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5[1] setDictionary:self->_attributes];
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  [v5 _clearFormatter];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSNumberFormatters cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  [a3 encodeObject:self->_attributes forKey:@"NS.attributes"];
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatter)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
  objc_super v4 = -[NSFormatter initWithCoder:](&v13, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  v4->_lock = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
  if ([a3 allowsKeyedCoding])
  {
    objc_super v5 = (NSMutableDictionary *)(id)[a3 decodeObjectForKey:@"NS.attributes"];
    v4->_attributes = v5;
    uint64_t v6 = objc_msgSend( (id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"formatterBehavior"),  "integerValue");
    if (v6 != 1040)
    {
      attributes = v4->_attributes;
      if (v6) {
        uint64_t v8 = 1040LL;
      }
      else {
        uint64_t v8 = [(id)objc_opt_class() defaultFormatterBehavior];
      }
      -[NSMutableDictionary setValue:forKey:]( attributes,  "setValue:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8),  @"formatterBehavior");
    }

    v4->_behavior = objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( v4->_attributes,  "objectForKey:",  @"formatterBehavior"),  "integerValue");
    -[NSNumberFormatter _clearFormatter](v4, "_clearFormatter");
    return v4;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSNumberFormatters cannot be decoded by non-keyed archivers" userInfo:0]);
  return (NSNumberFormatter *)-[NSNumberFormatter stringForObjectValue:](v10, v11, v12);
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3) {
    return -[NSNumberFormatter nilSymbol](self, "nilSymbol");
  }
  if ((_NSIsNSNumber() & 1) == 0) {
    return 0LL;
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  [a3 doubleValue];
  double v6 = v5;
  switch(__fpclassifyd(v5))
  {
    case 1:
      CFNumberFormatterStyle v7 = -[NSNumberFormatter notANumberSymbol](self, "notANumberSymbol");
      goto LABEL_11;
    case 2:
      if ((*(void *)&v6 & 0x8000000000000000LL) != 0) {
        CFNumberFormatterStyle v7 = -[NSNumberFormatter negativeInfinitySymbol](self, "negativeInfinitySymbol");
      }
      else {
        CFNumberFormatterStyle v7 = -[NSNumberFormatter positiveInfinitySymbol](self, "positiveInfinitySymbol");
      }
      goto LABEL_11;
    case 3:
    case 5:
      CFNumberFormatterStyle v7 = -[NSNumberFormatter zeroSymbol](self, "zeroSymbol");
LABEL_11:
      uint64_t v9 = (const __CFString *)v7;
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_17;
    default:
LABEL_12:
      if (_CFLocaleGetNoteCount() != self->_counter) {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
      formatter = self->_formatter;
      if (formatter
        || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"),
            (formatter = self->_formatter) != 0LL))
      {
        uint64_t v9 = (id)CFNumberFormatterCreateStringWithNumber( (CFAllocatorRef)*MEMORY[0x189604DD0],  formatter,  (CFNumberRef)a3);
      }

      else
      {
        uint64_t v9 = 0LL;
      }

- (BOOL)_tracksCacheGenerationCount
{
  return object_getClass(self) == (Class)&OBJC_CLASS___NSNumberFormatter;
}

- (int64_t)_cacheGenerationCount
{
  if (!-[NSNumberFormatter _tracksCacheGenerationCount](self, "_tracksCacheGenerationCount")) {
    return -1LL;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  return self->_cacheGeneration;
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:]( &v12,  sel__mayDecorateAttributedStringForObjectValue_,  a3);
  }

  else
  {
    double v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    CFNumberFormatterStyle v7 = (objc_class *)objc_opt_class();
    if (MethodImplementation == class_getMethodImplementation( v7,  sel_attributedStringForObjectValue_withDefaultAttributes_))
    {
      if (a3)
      {
        [a3 doubleValue];
        double v10 = v9;
        switch(__fpclassifyd(v9))
        {
          case 1:
            SEL v11 = -[NSNumberFormatter textAttributesForNotANumber](self, "textAttributesForNotANumber");
            break;
          case 2:
            if ((*(void *)&v10 & 0x8000000000000000LL) != 0) {
              SEL v11 = -[NSNumberFormatter textAttributesForNegativeInfinity](self, "textAttributesForNegativeInfinity");
            }
            else {
              SEL v11 = -[NSNumberFormatter textAttributesForPositiveInfinity](self, "textAttributesForPositiveInfinity");
            }
            break;
          case 3:
          case 5:
            SEL v11 = -[NSNumberFormatter textAttributesForZero](self, "textAttributesForZero");
            break;
          default:
            if ((*(void *)&v10 & 0x8000000000000000LL) != 0) {
              SEL v11 = -[NSNumberFormatter textAttributesForNegativeValues](self, "textAttributesForNegativeValues");
            }
            else {
              SEL v11 = -[NSNumberFormatter textAttributesForPositiveValues](self, "textAttributesForPositiveValues");
            }
            break;
        }
      }

      else
      {
        SEL v11 = -[NSNumberFormatter textAttributesForNil](self, "textAttributesForNil");
      }

      return v11 != 0LL;
    }

    else
    {
      return 1;
    }
  }

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return 0LL;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  v16[1] = *(id *)MEMORY[0x1895F89C0];
  v16[0] = 0LL;
  if (!getObjectValue_forString_errorDescription__baseIMP_0)
  {
    double v9 = objc_lookUpClass("NSNumberFormatter");
    getObjectValue_forString_errorDescription__baseIMP_0 = (uint64_t)class_getMethodImplementation( v9,  sel_getObjectValue_forString_range_error_);
  }

  double v10 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v10, sel_getObjectValue_forString_range_error_);
  if (a5) {
    objc_super v12 = v16;
  }
  else {
    objc_super v12 = 0LL;
  }
  if (MethodImplementation == (IMP)getObjectValue_forString_errorDescription__baseIMP_0) {
    char ObjectValue_0 = getObjectValue_0((uint64_t)self, a3, (__CFString *)a4, 0LL, 1, v12);
  }
  else {
    char ObjectValue_0 = -[NSNumberFormatter getObjectValue:forString:range:error:]( self,  "getObjectValue:forString:range:error:",  a3,  a4,  0LL,  v12);
  }
  BOOL v14 = ObjectValue_0;
  if (a5) {
    *a5 = (id)[v16[0] localizedDescription];
  }
  return v14;
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error
{
  return getObjectValue_0((uint64_t)self, obj, (__CFString *)string, (CFIndex *)rangep, 0, error);
}

- (NSString)stringFromNumber:(NSNumber *)number
{
  if (number) {
    return (NSString *)-[NSNumberFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else {
    return 0LL;
  }
}

- (NSNumber)numberFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!string) {
    return 0LL;
  }
  v4[0] = 0LL;
  if (-[NSNumberFormatter getObjectValue:forString:errorDescription:]( self,  "getObjectValue:forString:errorDescription:",  v4,  string,  0LL))
  {
    return (NSNumber *)v4[0];
  }

  else
  {
    return 0LL;
  }

+ (NSString)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle
{
  if (!num) {
    return 0LL;
  }
  double v6 = (void *)objc_opt_new();
  [v6 setFormatterBehavior:1040];
  [v6 setNumberStyle:nstyle];
  CFNumberFormatterStyle v7 = (NSString *)[v6 stringForObjectValue:num];

  return v7;
}

- (NSFormattingContext)formattingContext
{
  NSNumberFormatterBehavior v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formattingContext");
  int v4 = [v3 intValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
    }

    int v4 = objc_msgSend( (id)(id)CFNumberFormatterCopyProperty( formatter,  @"kCFNumberFormatterFormattingContextKey"),  "intValue");
  }

  int v6 = v4;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  switch(v6)
  {
    case 256:
      goto LABEL_9;
    case 257:
      NSFormattingContext result = NSFormattingContextMiddleOfSentence;
      break;
    case 258:
      NSFormattingContext result = NSFormattingContextBeginningOfSentence;
      break;
    case 259:
      NSFormattingContext result = NSFormattingContextListItem;
      break;
    case 260:
      NSFormattingContext result = NSFormattingContextStandalone;
      break;
    default:
      if (v6 == -1) {
        NSFormattingContext result = NSFormattingContextDynamic;
      }
      else {
LABEL_9:
      }
        NSFormattingContext result = NSFormattingContextUnknown;
      break;
  }

  return result;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  switch(formattingContext)
  {
    case NSFormattingContextUnknown:
      uint64_t v4 = 256LL;
      goto LABEL_9;
    case NSFormattingContextDynamic:
      int v5 = 0;
      uint64_t v4 = 0xFFFFFFFFLL;
      goto LABEL_10;
    case NSFormattingContextStandalone:
      uint64_t v4 = 260LL;
      goto LABEL_9;
    case NSFormattingContextListItem:
      uint64_t v4 = 259LL;
      goto LABEL_9;
    case NSFormattingContextBeginningOfSentence:
      uint64_t v4 = 258LL;
      goto LABEL_9;
    case NSFormattingContextMiddleOfSentence:
      uint64_t v4 = 257LL;
      goto LABEL_9;
    default:
      uint64_t v4 = 0LL;
LABEL_9:
      int v5 = 1;
LABEL_10:
      int v6 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4);
      -[NSRecursiveLock lock](self->_lock, "lock");
      ++self->_cacheGeneration;
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v6, @"formattingContext");
      if (v5)
      {
        formatter = self->_formatter;
        if (formatter) {
          CFNumberFormatterSetProperty(formatter, @"kCFNumberFormatterFormattingContextKey", v6);
        }
      }

      self->_stateBitMask |= 1uLL;
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      return;
  }

- (NSNumberFormatterStyle)numberStyle
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSNumberFormatterBehavior v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"numberStyle");
  CFNumberFormatterStyle Style = [v3 integerValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
      if (!formatter)
      {
        NSNumberFormatterStyle v6 = NSNumberFormatterNoStyle;
        goto LABEL_8;
      }
    }

    CFNumberFormatterStyle Style = CFNumberFormatterGetStyle(formatter);
  }

  NSNumberFormatterStyle v6 = Style;
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (void)setNumberStyle:(NSNumberFormatterStyle)numberStyle
{
  if ((self->_stateBitMask & 2) == 0
    && objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"numberStyle"),  "integerValue") != numberStyle)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", numberStyle),  @"numberStyle");
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSLocale)locale
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  CFLocaleRef v3 = (CFLocaleRef)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale");
  if (!v3)
  {
    formatter = self->_formatter;
    if (formatter
      || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0LL))
    {
      CFLocaleRef Locale = CFNumberFormatterGetLocale(formatter);
    }

    else
    {
      CFLocaleRef Locale = (CFLocaleRef)[MEMORY[0x189603F90] currentLocale];
    }

    CFLocaleRef v3 = Locale;
  }

  NSNumberFormatterStyle v6 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSLocale *)v3;
}

- (void)setLocale:(NSLocale *)locale
{
  if ((objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale"),  "isEqual:",  locale) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSLocale copyWithZone:](locale, "copyWithZone:", 0LL),  @"locale");
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    self->_stateBitMask |= 5uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)generatesDecimalNumbers
{
  CFLocaleRef v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"generatesDecimalNumbers");
  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)setGeneratesDecimalNumbers:(BOOL)generatesDecimalNumbers
{
  BOOL v3 = generatesDecimalNumbers;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  int v5 = (void *)MEMORY[0x189604DE8];
  if (!v3) {
    int v5 = (void *)MEMORY[0x189604DE0];
  }
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v5, @"generatesDecimalNumbers");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatterBehavior)formatterBehavior
{
  return 1040LL;
}

- (NSString)negativeFormat
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativeFormat");
  char v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3) {
      goto LABEL_10;
    }
  }

  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4) {
      goto LABEL_10;
    }
  }

  formatter = self->_formatter;
  if (formatter)
  {
    NSNumberFormatterStyle v6 = (void *)-[__CFString componentsSeparatedByString:]( (id)CFNumberFormatterGetFormat(formatter),  "componentsSeparatedByString:",  @";");
    char v4 = (void *)objc_msgSend(v6, "objectAtIndex:", (unint64_t)objc_msgSend(v6, "count") > 1);
  }

  else
  {
    char v4 = 0LL;
  }

- (void)setNegativeFormat:(NSString *)negativeFormat
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSString copyWithZone:](negativeFormat, "copyWithZone:", 0LL),  @"negativeFormat");
  if (!negativeFormat) {
    goto LABEL_10;
  }
  formatter = self->_formatter;
  if (formatter
    || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0LL))
  {
    id v6 = objc_autorelease((id)objc_msgSend( (id)-[__CFString componentsSeparatedByString:]( (id)CFNumberFormatterGetFormat(formatter),  "componentsSeparatedByString:",  @";"),
                                "mutableCopy"));
    else {
      [v6 addObject:negativeFormat];
    }
    id v7 = (const __CFString *)[v6 componentsJoinedByString:@";"];
    CFNumberFormatterSetFormat(self->_formatter, v7);
    self->_stateBitMask |= 1uLL;
    if (!v7) {
LABEL_10:
    }
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForNegativeValues
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForNegativeValues");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNegativeValues:(NSDictionary *)textAttributesForNegativeValues
{
  int v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForNegativeValues");
  if ((textAttributesForNegativeValues == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:textAttributesForNegativeValues] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForNegativeValues, "copyWithZone:", 0LL),  @"textAttributesForNegativeValues");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)positiveFormat
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positiveFormat");
  id v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3) {
      goto LABEL_10;
    }
  }

  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4) {
      goto LABEL_10;
    }
  }

  formatter = self->_formatter;
  if (formatter) {
    id v4 = (void *)objc_msgSend( (id)-[__CFString componentsSeparatedByString:]( (id)CFNumberFormatterGetFormat(formatter),  "componentsSeparatedByString:",  @";"),
  }
                   "objectAtIndex:",
                   0LL);
  else {
    id v4 = 0LL;
  }
LABEL_10:
  id v6 = v4;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v4;
}

- (void)setPositiveFormat:(NSString *)positiveFormat
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSString copyWithZone:](positiveFormat, "copyWithZone:", 0LL),  @"positiveFormat");
  if (!positiveFormat) {
    goto LABEL_7;
  }
  formatter = self->_formatter;
  if (formatter
    || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0LL))
  {
    id v6 = objc_autorelease((id)objc_msgSend( (id)-[__CFString componentsSeparatedByString:]( (id)CFNumberFormatterGetFormat(formatter),  "componentsSeparatedByString:",  @";"),
                                "mutableCopy"));
    [v6 replaceObjectAtIndex:0 withObject:positiveFormat];
    id v7 = (const __CFString *)[v6 componentsJoinedByString:@";"];
    CFNumberFormatterSetFormat(self->_formatter, v7);
    self->_stateBitMask |= 1uLL;
    if (!v7) {
LABEL_7:
    }
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForPositiveValues
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForPositiveValues");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForPositiveValues:(NSDictionary *)textAttributesForPositiveValues
{
  int v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForPositiveValues");
  if ((textAttributesForPositiveValues == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:textAttributesForPositiveValues] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForPositiveValues, "copyWithZone:", 0LL),  @"textAttributesForPositiveValues");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)allowsFloats
{
  char v3 = objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"allowsFloats"),  "BOOLValue");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setAllowsFloats:(BOOL)allowsFloats
{
  BOOL v3 = allowsFloats;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  int v5 = (void *)MEMORY[0x189604DE8];
  if (!v3) {
    int v5 = (void *)MEMORY[0x189604DE0];
  }
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v5, @"allowsFloats");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)decimalSeparator
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"decimalSeparator");
  if (!v3)
  {
    id v6 = (__CFString **)MEMORY[0x189605048];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setDecimalSeparator:(NSString *)decimalSeparator
{
  id v4 = -[NSString copyWithZone:](decimalSeparator, "copyWithZone:", 0LL);
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v4, @"decimalSeparator");
  if (v4)
  {
    formatter = self->_formatter;
    if (formatter
      || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0LL))
    {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605048], v4);
    }
  }

  else
  {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }

  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)alwaysShowsDecimalSeparator
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"alwaysShowsDecimalSeparator");
  char v4 = [v3 BOOLValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
      if (!formatter)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
    }

    char v4 = objc_msgSend( (id)(id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605020]),  "BOOLValue");
  }

  BOOL v6 = v4;
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (void)setAlwaysShowsDecimalSeparator:(BOOL)alwaysShowsDecimalSeparator
{
  char v4 = (const void **)MEMORY[0x189604DE8];
  if (!alwaysShowsDecimalSeparator) {
    char v4 = (const void **)MEMORY[0x189604DE0];
  }
  int v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v5,  @"alwaysShowsDecimalSeparator");
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605020], v5);
  }
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)currencyDecimalSeparator
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"currencyDecimalSeparator");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605030];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setCurrencyDecimalSeparator:(NSString *)currencyDecimalSeparator
{
  if ((self->_stateBitMask & 2) == 0)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    int v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"currencyDecimalSeparator");
    if ((currencyDecimalSeparator == 0LL) == (v5 != 0LL)
      || ([v5 isEqual:currencyDecimalSeparator] & 1) == 0)
    {
      BOOL v6 = (const __CFString *)*MEMORY[0x189605030];
      id v7 = -[NSString copyWithZone:](currencyDecimalSeparator, "copyWithZone:", 0LL);
      -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"currencyDecimalSeparator");
      ++self->_cacheGeneration;
      if (v6)
      {
        if (v7 && (formatter = self->_formatter) != 0LL)
        {
          CFNumberFormatterSetProperty(formatter, v6, v7);
        }

        else if (!v7)
        {
          -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
        }
      }

      self->_stateBitMask |= 1uLL;
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

- (BOOL)usesGroupingSeparator
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"usesGroupingSeparator");
  char v4 = [v3 BOOLValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
      if (!formatter)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
    }

    char v4 = objc_msgSend( (id)(id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605130]),  "BOOLValue");
  }

  BOOL v6 = v4;
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (void)setUsesGroupingSeparator:(BOOL)usesGroupingSeparator
{
  char v4 = (const void **)MEMORY[0x189604DE8];
  if (!usesGroupingSeparator) {
    char v4 = (const void **)MEMORY[0x189604DE0];
  }
  int v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, @"usesGroupingSeparator");
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605130], v5);
  }
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)groupingSeparator
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"groupingSeparator");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605060];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setGroupingSeparator:(NSString *)groupingSeparator
{
  id v5 = -[NSString copyWithZone:](groupingSeparator, "copyWithZone:", 0LL);
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, @"groupingSeparator");
  if (v5)
  {
    formatter = self->_formatter;
    if (formatter
      || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0LL))
    {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605060], v5);
    }
  }

  else
  {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }

  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)zeroSymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"zeroSymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605148];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setZeroSymbol:(NSString *)zeroSymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"zeroSymbol");
  if ((zeroSymbol == 0) == (v5 != 0) || ([v5 isEqual:zeroSymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605148];
    id v7 = -[NSString copyWithZone:](zeroSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"zeroSymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForZero
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"textAttributesForZero");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForZero:(NSDictionary *)textAttributesForZero
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"textAttributesForZero");
  if ((textAttributesForZero == 0) == (v5 != 0) || ([v5 isEqual:textAttributesForZero] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForZero, "copyWithZone:", 0LL),  @"textAttributesForZero");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)nilSymbol
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"nilSymbol");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setNilSymbol:(NSString *)nilSymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"nilSymbol");
  if ((nilSymbol == 0) == (v5 != 0) || ([v5 isEqual:nilSymbol] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSString copyWithZone:](nilSymbol, "copyWithZone:", 0LL),  @"nilSymbol");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForNil
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"textAttributesForNil");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNil:(NSDictionary *)textAttributesForNil
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"textAttributesForNil");
  if ((textAttributesForNil == 0) == (v5 != 0) || ([v5 isEqual:textAttributesForNil] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForNil, "copyWithZone:", 0LL),  @"textAttributesForNil");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)notANumberSymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"notANumberSymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050C8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setNotANumberSymbol:(NSString *)notANumberSymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"notANumberSymbol");
  if ((notANumberSymbol == 0) == (v5 != 0) || ([v5 isEqual:notANumberSymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050C8];
    id v7 = -[NSString copyWithZone:](notANumberSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"notANumberSymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForNotANumber
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForNotANumber");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNotANumber:(NSDictionary *)textAttributesForNotANumber
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForNotANumber");
  if ((textAttributesForNotANumber == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:textAttributesForNotANumber] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForNotANumber, "copyWithZone:", 0LL),  @"textAttributesForNotANumber");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)positiveInfinitySymbol
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positiveInfinitySymbol");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setPositiveInfinitySymbol:(NSString *)positiveInfinitySymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positiveInfinitySymbol");
  if ((positiveInfinitySymbol == 0) == (v5 != 0) || ([v5 isEqual:positiveInfinitySymbol] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSString copyWithZone:](positiveInfinitySymbol, "copyWithZone:", 0LL),  @"positiveInfinitySymbol");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForPositiveInfinity
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForPositiveInfinity");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForPositiveInfinity:(NSDictionary *)textAttributesForPositiveInfinity
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForPositiveInfinity");
  if ((textAttributesForPositiveInfinity == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:textAttributesForPositiveInfinity] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForPositiveInfinity, "copyWithZone:", 0LL),  @"textAttributesForPositiveInfinity");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)negativeInfinitySymbol
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativeInfinitySymbol");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setNegativeInfinitySymbol:(NSString *)negativeInfinitySymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativeInfinitySymbol");
  if ((negativeInfinitySymbol == 0) == (v5 != 0) || ([v5 isEqual:negativeInfinitySymbol] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSString copyWithZone:](negativeInfinitySymbol, "copyWithZone:", 0LL),  @"negativeInfinitySymbol");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForNegativeInfinity
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForNegativeInfinity");
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    if (!self->_formatter) {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    }
  }

  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNegativeInfinity:(NSDictionary *)textAttributesForNegativeInfinity
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"textAttributesForNegativeInfinity");
  if ((textAttributesForNegativeInfinity == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:textAttributesForNegativeInfinity] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSDictionary copyWithZone:](textAttributesForNegativeInfinity, "copyWithZone:", 0LL),  @"textAttributesForNegativeInfinity");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)positivePrefix
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positivePrefix");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605108];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setPositivePrefix:(NSString *)positivePrefix
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positivePrefix");
  if ((positivePrefix == 0) == (v5 != 0) || ([v5 isEqual:positivePrefix] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605108];
    id v7 = -[NSString copyWithZone:](positivePrefix, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"positivePrefix");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)positiveSuffix
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positiveSuffix");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605110];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setPositiveSuffix:(NSString *)positiveSuffix
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"positiveSuffix");
  if ((positiveSuffix == 0) == (v5 != 0) || ([v5 isEqual:positiveSuffix] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605110];
    id v7 = -[NSString copyWithZone:](positiveSuffix, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"positiveSuffix");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)negativePrefix
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativePrefix");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050D0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setNegativePrefix:(NSString *)negativePrefix
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativePrefix");
  if ((negativePrefix == 0) == (v5 != 0) || ([v5 isEqual:negativePrefix] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050D0];
    id v7 = -[NSString copyWithZone:](negativePrefix, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"negativePrefix");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)negativeSuffix
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativeSuffix");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050D8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setNegativeSuffix:(NSString *)negativeSuffix
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"negativeSuffix");
  if ((negativeSuffix == 0) == (v5 != 0) || ([v5 isEqual:negativeSuffix] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050D8];
    id v7 = -[NSString copyWithZone:](negativeSuffix, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"negativeSuffix");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)currencyCode
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"currencyCode");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605028];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setCurrencyCode:(NSString *)currencyCode
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"currencyCode");
  if ((currencyCode == 0) == (v5 != 0) || ([v5 isEqual:currencyCode] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605028];
    id v7 = -[NSString copyWithZone:](currencyCode, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"currencyCode");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)_hasSetCurrencyCode
{
  BOOL v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"currencyCode") != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)currencySymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"currencySymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605040];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (BOOL)_hasSetCurrencySymbol
{
  BOOL v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"currencySymbol") != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setCurrencySymbol:(NSString *)currencySymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"currencySymbol");
  if ((currencySymbol == 0) == (v5 != 0) || ([v5 isEqual:currencySymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605040];
    id v7 = -[NSString copyWithZone:](currencySymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"currencySymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)internationalCurrencySymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"internationalCurrencySymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605070];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setInternationalCurrencySymbol:(NSString *)internationalCurrencySymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"internationalCurrencySymbol");
  if ((internationalCurrencySymbol == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:internationalCurrencySymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605070];
    id v7 = -[NSString copyWithZone:](internationalCurrencySymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"internationalCurrencySymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)_hasSetInternationalCurrencySymbol
{
  BOOL v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"internationalCurrencySymbol") != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)percentSymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"percentSymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050F8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setPercentSymbol:(NSString *)percentSymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"percentSymbol");
  if ((percentSymbol == 0) == (v5 != 0) || ([v5 isEqual:percentSymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050F8];
    id v7 = -[NSString copyWithZone:](percentSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"percentSymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)perMillSymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"perMillSymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050F0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setPerMillSymbol:(NSString *)perMillSymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"perMillSymbol");
  if ((perMillSymbol == 0) == (v5 != 0) || ([v5 isEqual:perMillSymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050F0];
    id v7 = -[NSString copyWithZone:](perMillSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"perMillSymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)minusSign
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minusSign");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050B8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setMinusSign:(NSString *)minusSign
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minusSign");
  if ((minusSign == 0) == (v5 != 0) || ([v5 isEqual:minusSign] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050B8];
    id v7 = -[NSString copyWithZone:](minusSign, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"minusSign");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)plusSign
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"plusSign");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605100];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setPlusSign:(NSString *)plusSign
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"plusSign");
  if ((plusSign == 0) == (v5 != 0) || ([v5 isEqual:plusSign] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605100];
    id v7 = -[NSString copyWithZone:](plusSign, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"plusSign");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)exponentSymbol
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"exponentSymbol");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605050];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setExponentSymbol:(NSString *)exponentSymbol
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"exponentSymbol");
  if ((exponentSymbol == 0) == (v5 != 0) || ([v5 isEqual:exponentSymbol] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605050];
    id v7 = -[NSString copyWithZone:](exponentSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"exponentSymbol");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)groupingSize
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"groupingSize");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605068];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setGroupingSize:(NSUInteger)groupingSize
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"groupingSize");
  if (!v5 || [v5 integerValue] != groupingSize)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605068];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", groupingSize);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"groupingSize");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)secondaryGroupingSize
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"secondaryGroupingSize");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605128];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setSecondaryGroupingSize:(NSUInteger)secondaryGroupingSize
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"secondaryGroupingSize");
  if (!v5 || [v5 integerValue] != secondaryGroupingSize)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605128];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", secondaryGroupingSize);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"secondaryGroupingSize");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)formatWidth
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formatWidth");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605058];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setFormatWidth:(NSUInteger)formatWidth
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formatWidth");
  if (!v5 || [v5 integerValue] != formatWidth)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605058];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", formatWidth);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"formatWidth");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)multiplier
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"multiplier");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050C0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setMultiplier:(NSNumber *)multiplier
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"multiplier");
  if ((multiplier == 0) == (v5 != 0) || ([v5 isEqual:multiplier] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050C0];
    id v7 = -[NSNumber copyWithZone:](multiplier, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"multiplier");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)paddingCharacter
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"paddingCharacter");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x1896050E0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setPaddingCharacter:(NSString *)paddingCharacter
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"paddingCharacter");
  if ((paddingCharacter == 0) == (v5 != 0) || ([v5 isEqual:paddingCharacter] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050E0];
    id v7 = -[NSString copyWithZone:](paddingCharacter, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"paddingCharacter");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatterPadPosition)paddingPosition
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"paddingPosition");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x1896050E8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumberFormatterPadPosition)v4;
}

- (void)setPaddingPosition:(NSNumberFormatterPadPosition)paddingPosition
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"paddingPosition");
  if (!v5 || [v5 integerValue] != paddingPosition)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050E8];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", paddingPosition);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"paddingPosition");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatterRoundingMode)roundingMode
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"roundingMode");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605120];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumberFormatterRoundingMode)v4;
}

- (void)setRoundingMode:(NSNumberFormatterRoundingMode)roundingMode
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"roundingMode");
  if (!v5 || [v5 integerValue] != roundingMode)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605120];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", roundingMode);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"roundingMode");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)roundingIncrement
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"roundingIncrement");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605118];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setRoundingIncrement:(NSNumber *)roundingIncrement
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"roundingIncrement");
  if ((roundingIncrement == 0) == (v5 != 0) || ([v5 isEqual:roundingIncrement] & 1) == 0)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605118];
    id v7 = -[NSNumber copyWithZone:](roundingIncrement, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"roundingIncrement");
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }

    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)minimumIntegerDigits
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumIntegerDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x1896050A8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMinimumIntegerDigits:(NSUInteger)minimumIntegerDigits
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumIntegerDigits");
  if (!v5 || [v5 integerValue] != minimumIntegerDigits)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050A8];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", minimumIntegerDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"minimumIntegerDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  double v9 = (const __CFString *)*MEMORY[0x189605088];
  double v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximumIntegerDigits");
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (!self->_formatter)
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v9) {
      goto LABEL_19;
    }
LABEL_22:
    SEL v11 = 0LL;
    goto LABEL_8;
  }

  if (!v9) {
    goto LABEL_22;
  }
LABEL_19:
  SEL v11 = self->_formatter;
  if (!v11) {
    goto LABEL_8;
  }
  double v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
LABEL_7:
  SEL v11 = (__CFNumberFormatter *)[v10 integerValue];
LABEL_8:
  if ((unint64_t)v11 < minimumIntegerDigits)
  {
    objc_super v12 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"maximumIntegerDigits");
    if (!v12 || [v12 integerValue] != minimumIntegerDigits)
    {
      uint64_t v13 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", minimumIntegerDigits);
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v13, @"maximumIntegerDigits");
      ++self->_cacheGeneration;
      if (v9)
      {
        BOOL v14 = self->_formatter;
        if (v14) {
          CFNumberFormatterSetProperty(v14, v9, v13);
        }
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)maximumIntegerDigits
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximumIntegerDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605088];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMaximumIntegerDigits:(NSUInteger)maximumIntegerDigits
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximumIntegerDigits");
  if (!v5 || [v5 integerValue] != maximumIntegerDigits)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605088];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", maximumIntegerDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"maximumIntegerDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  double v9 = (const __CFString *)*MEMORY[0x1896050A8];
  double v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumIntegerDigits");
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (!self->_formatter) {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  if (v9)
  {
    BOOL v14 = self->_formatter;
    if (v14)
    {
      double v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_7:
      if ([v10 integerValue] > maximumIntegerDigits)
      {
        SEL v11 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"minimumIntegerDigits");
        if (!v11 || [v11 integerValue] != maximumIntegerDigits)
        {
          objc_super v12 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", maximumIntegerDigits);
          -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v12,  @"minimumIntegerDigits");
          ++self->_cacheGeneration;
          if (v9)
          {
            uint64_t v13 = self->_formatter;
            if (v13) {
              CFNumberFormatterSetProperty(v13, v9, v12);
            }
          }
        }
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)minimumFractionDigits
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumFractionDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605098];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMinimumFractionDigits:(NSUInteger)minimumFractionDigits
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumFractionDigits");
  if (!v5 || [v5 integerValue] != minimumFractionDigits)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605098];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", minimumFractionDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"minimumFractionDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  double v9 = (const __CFString *)*MEMORY[0x189605080];
  double v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximumFractionDigits");
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (!self->_formatter)
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v9) {
      goto LABEL_19;
    }
LABEL_22:
    SEL v11 = 0LL;
    goto LABEL_8;
  }

  if (!v9) {
    goto LABEL_22;
  }
LABEL_19:
  SEL v11 = self->_formatter;
  if (!v11) {
    goto LABEL_8;
  }
  double v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
LABEL_7:
  SEL v11 = (__CFNumberFormatter *)[v10 integerValue];
LABEL_8:
  if ((unint64_t)v11 < minimumFractionDigits)
  {
    objc_super v12 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"maximumFractionDigits");
    if (!v12 || [v12 integerValue] != minimumFractionDigits)
    {
      uint64_t v13 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", minimumFractionDigits);
      -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v13,  @"maximumFractionDigits");
      ++self->_cacheGeneration;
      if (v9)
      {
        BOOL v14 = self->_formatter;
        if (v14) {
          CFNumberFormatterSetProperty(v14, v9, v13);
        }
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)maximumFractionDigits
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximumFractionDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605080];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMaximumFractionDigits:(NSUInteger)maximumFractionDigits
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximumFractionDigits");
  if (!v5 || [v5 integerValue] != maximumFractionDigits)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605080];
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", maximumFractionDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"maximumFractionDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  double v9 = (const __CFString *)*MEMORY[0x189605098];
  double v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumFractionDigits");
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (!self->_formatter) {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  if (v9)
  {
    BOOL v14 = self->_formatter;
    if (v14)
    {
      double v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_7:
      if ([v10 integerValue] > maximumFractionDigits)
      {
        SEL v11 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"minimumFractionDigits");
        if (!v11 || [v11 integerValue] != maximumFractionDigits)
        {
          objc_super v12 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", maximumFractionDigits);
          -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v12,  @"minimumFractionDigits");
          ++self->_cacheGeneration;
          if (v9)
          {
            uint64_t v13 = self->_formatter;
            if (v13) {
              CFNumberFormatterSetProperty(v13, v9, v12);
            }
          }
        }
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)minimum
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimum");
  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (void)setMinimum:(NSNumber *)minimum
{
  BOOL v3 = minimum;
  if (minimum
    && -[NSDecimalNumber isEqual:]( +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"),  "isEqual:",  minimum))
  {
    BOOL v3 = 0LL;
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimum");
  if ((v3 == 0) == (v5 != 0) || ([v5 isEqual:v3] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSNumber copyWithZone:](v3, "copyWithZone:", 0LL),  @"minimum");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)maximum
{
  BOOL v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximum");
  id v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (void)setMaximum:(NSNumber *)maximum
{
  BOOL v3 = maximum;
  if (maximum
    && -[NSDecimalNumber isEqual:]( +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"),  "isEqual:",  maximum))
  {
    BOOL v3 = 0LL;
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"maximum");
  if ((v3 == 0) == (v5 != 0) || ([v5 isEqual:v3] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  -[NSNumber copyWithZone:](v3, "copyWithZone:", 0LL),  @"maximum");
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)currencyGroupingSeparator
{
  BOOL v3 = (__CFString *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"currencyGroupingSeparator");
  if (!v3)
  {
    BOOL v6 = (__CFString **)MEMORY[0x189605038];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3) {
        goto LABEL_2;
      }
    }

    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0LL;
    }
  }

- (void)setCurrencyGroupingSeparator:(NSString *)currencyGroupingSeparator
{
  if ((self->_stateBitMask & 2) == 0)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"currencyGroupingSeparator");
    if ((currencyGroupingSeparator == 0LL) == (v5 != 0LL)
      || ([v5 isEqual:currencyGroupingSeparator] & 1) == 0)
    {
      BOOL v6 = (const __CFString *)*MEMORY[0x189605038];
      id v7 = -[NSString copyWithZone:](currencyGroupingSeparator, "copyWithZone:", 0LL);
      -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"currencyGroupingSeparator");
      ++self->_cacheGeneration;
      if (v6)
      {
        if (v7 && (formatter = self->_formatter) != 0LL)
        {
          CFNumberFormatterSetProperty(formatter, v6, v7);
        }

        else if (!v7)
        {
          -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
        }
      }

      self->_stateBitMask |= 1uLL;
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

- (BOOL)isLenient
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"lenient");
  id v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      id v5 = v4;
      goto LABEL_9;
    }
  }

  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4) {
      goto LABEL_5;
    }
  }

  formatter = self->_formatter;
  if (!formatter)
  {
    char v7 = 0;
    goto LABEL_10;
  }

  id v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605078]);
LABEL_9:
  char v7 = [v5 BOOLValue];
LABEL_10:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)setLenient:(BOOL)lenient
{
  if (lenient) {
    id v4 = (const void **)MEMORY[0x189604DE8];
  }
  else {
    id v4 = (const void **)MEMORY[0x189604DE0];
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((self->_stateBitMask & 2) == 0)
  {
    id v5 = *v4;
    ++self->_cacheGeneration;
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, @"lenient");
    formatter = self->_formatter;
    if (formatter) {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605078], v5);
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

- (BOOL)usesSignificantDigits
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"usesSignificantDigits");
  id v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      id v5 = v4;
      goto LABEL_9;
    }
  }

  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4) {
      goto LABEL_5;
    }
  }

  formatter = self->_formatter;
  if (!formatter)
  {
    char v7 = 0;
    goto LABEL_10;
  }

  id v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605138]);
LABEL_9:
  char v7 = [v5 BOOLValue];
LABEL_10:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)setUsesSignificantDigits:(BOOL)usesSignificantDigits
{
  id v4 = (const void **)MEMORY[0x189604DE8];
  if (!usesSignificantDigits) {
    id v4 = (const void **)MEMORY[0x189604DE0];
  }
  id v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, @"usesSignificantDigits");
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605138], v5);
  }
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)minimumSignificantDigits
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"minimumSignificantDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x1896050B0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    id v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      id v4 = 0LL;
      goto LABEL_3;
    }

    uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  id v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMinimumSignificantDigits:(NSUInteger)minimumSignificantDigits
{
  if (minimumSignificantDigits <= 1) {
    NSUInteger v4 = 1LL;
  }
  else {
    NSUInteger v4 = minimumSignificantDigits;
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"minimumSignificantDigits");
  if (!v5 || [v5 integerValue] != v4)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050B0];
    char v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"minimumSignificantDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  double v9 = (const __CFString *)*MEMORY[0x189605090];
  double v10 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"maximumSignificantDigits");
  if (v10)
  {
LABEL_10:
    goto LABEL_20;
  }

  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (self->_formatter)
  {
    if (!v9) {
      goto LABEL_20;
    }
  }

  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (!v9) {
      goto LABEL_20;
    }
  }

  SEL v11 = self->_formatter;
  if (v11)
  {
    double v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
    goto LABEL_10;
  }

- (NSUInteger)maximumSignificantDigits
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"maximumSignificantDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x189605090];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    NSUInteger v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      NSUInteger v4 = 0LL;
      goto LABEL_3;
    }

    uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  NSUInteger v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMaximumSignificantDigits:(NSUInteger)maximumSignificantDigits
{
  if (maximumSignificantDigits <= 1) {
    NSUInteger v4 = 1LL;
  }
  else {
    NSUInteger v4 = maximumSignificantDigits;
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"maximumSignificantDigits");
  if (!v5 || [v5 integerValue] != v4)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x189605090];
    char v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"maximumSignificantDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  double v9 = (const __CFString *)*MEMORY[0x1896050B0];
  double v10 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"minimumSignificantDigits");
  if (v10) {
    goto LABEL_10;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (!self->_formatter) {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  if (v9)
  {
    BOOL v14 = self->_formatter;
    if (v14)
    {
      double v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_10:
      if (v4 < [v10 integerValue])
      {
        SEL v11 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"minimumSignificantDigits");
        if (!v11 || [v11 integerValue] != v4)
        {
          objc_super v12 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
          -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v12,  @"minimumSignificantDigits");
          ++self->_cacheGeneration;
          if (v9)
          {
            uint64_t v13 = self->_formatter;
            if (v13) {
              CFNumberFormatterSetProperty(v13, v9, v12);
            }
          }
        }
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isPartialStringValidationEnabled
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"partialStringValidationEnabled");
  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)setPartialStringValidationEnabled:(BOOL)partialStringValidationEnabled
{
  BOOL v3 = partialStringValidationEnabled;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((self->_stateBitMask & 2) == 0)
  {
    if (v3) {
      uint64_t v5 = *MEMORY[0x189604DE8];
    }
    else {
      uint64_t v5 = *MEMORY[0x189604DE0];
    }
    ++self->_cacheGeneration;
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v5,  @"partialStringValidationEnabled");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

- (BOOL)_usesCharacterDirection
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"usesCharacterDirection");
  char v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      uint64_t v5 = v4;
      goto LABEL_9;
    }
  }

  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4) {
      goto LABEL_5;
    }
  }

  formatter = self->_formatter;
  if (!formatter)
  {
    char v7 = 0;
    goto LABEL_10;
  }

  uint64_t v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605140]);
LABEL_9:
  char v7 = [v5 BOOLValue];
LABEL_10:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)_setUsesCharacterDirection:(BOOL)a3
{
  char v4 = (const void **)MEMORY[0x189604DE8];
  if (!a3) {
    char v4 = (const void **)MEMORY[0x189604DE0];
  }
  uint64_t v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, @"usesCharacterDirection");
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x189605140], v5);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (int64_t)minimumGroupingDigits
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumGroupingDigits");
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x1896050A0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    }
    char v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }

    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4) {
        goto LABEL_3;
      }
    }

    formatter = self->_formatter;
    if (!formatter)
    {
      char v4 = 0LL;
      goto LABEL_3;
    }

    uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }

  char v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (int64_t)v4;
}

- (void)setMinimumGroupingDigits:(int64_t)a3
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"minimumGroupingDigits");
  if (!v5 || [v5 integerValue] != a3)
  {
    BOOL v6 = (const __CFString *)*MEMORY[0x1896050A0];
    char v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"minimumGroupingDigits");
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)getFormatter
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  if (!self->_formatter) {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  return (void *)_CFNumberFormatterGetFormatter();
}

- (void)setPropertyBit
{
  self->_stateBitMask |= 2uLL;
}

- (void)clearPropertyBit
{
  self->_stateBitMask &= ~2uLL;
}

- (BOOL)checkModify
{
  return self->_stateBitMask & 1;
}

- (void)resetCheckModify
{
  self->_stateBitMask &= ~1uLL;
}

- (void)resetCheckLocaleChange
{
  self->_stateBitMask &= ~4uLL;
}

- (BOOL)checkLocaleChange
{
  return (LOBYTE(self->_stateBitMask) >> 2) & 1;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((_NSIsNSNumber() & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  40LL,  @"Invalid parameter not satisfying: %@",  @"!value || _NSIsNSNumber(value)");
    }
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
    -[NSNumberFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSNumberFormatter stringFromNumber:](self, "stringFromNumber:", a3));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSNumberFormatter;
    -[NSNumberFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0LL);
  }

@end