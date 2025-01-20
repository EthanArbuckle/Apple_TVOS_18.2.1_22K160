@interface NSDateFormatter
+ (NSDateFormatterBehavior)defaultFormatterBehavior;
+ (NSString)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale;
+ (NSString)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle;
+ (id)_componentsFromFormatString:(id)a3;
+ (id)_formatStringFromComponents:(id)a3;
+ (void)initialize;
+ (void)setDefaultFormatterBehavior:(NSDateFormatterBehavior)defaultFormatterBehavior;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_tracksCacheGenerationCount;
- (BOOL)_usesCharacterDirection;
- (BOOL)doesRelativeDateFormatting;
- (BOOL)generatesCalendarDates;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error;
- (BOOL)isLenient;
- (NSArray)eraSymbols;
- (NSArray)longEraSymbols;
- (NSArray)monthSymbols;
- (NSArray)quarterSymbols;
- (NSArray)shortMonthSymbols;
- (NSArray)shortQuarterSymbols;
- (NSArray)shortStandaloneMonthSymbols;
- (NSArray)shortStandaloneQuarterSymbols;
- (NSArray)shortStandaloneWeekdaySymbols;
- (NSArray)shortWeekdaySymbols;
- (NSArray)standaloneMonthSymbols;
- (NSArray)standaloneQuarterSymbols;
- (NSArray)standaloneWeekdaySymbols;
- (NSArray)veryShortMonthSymbols;
- (NSArray)veryShortStandaloneMonthSymbols;
- (NSArray)veryShortStandaloneWeekdaySymbols;
- (NSArray)veryShortWeekdaySymbols;
- (NSArray)weekdaySymbols;
- (NSCalendar)calendar;
- (NSDate)dateFromString:(NSString *)string;
- (NSDate)defaultDate;
- (NSDate)gregorianStartDate;
- (NSDate)twoDigitStartDate;
- (NSDateFormatter)init;
- (NSDateFormatter)initWithCoder:(id)a3;
- (NSDateFormatterBehavior)formatterBehavior;
- (NSDateFormatterStyle)dateStyle;
- (NSDateFormatterStyle)timeStyle;
- (NSFormattingContext)formattingContext;
- (NSLocale)locale;
- (NSString)AMSymbol;
- (NSString)PMSymbol;
- (NSString)dateFormat;
- (NSString)stringFromDate:(NSDate *)date;
- (NSTimeZone)timeZone;
- (id)_attributedStringWithFieldsFromDate:(id)a3;
- (id)_dateFormat;
- (id)_getLocaleAlreadyLocked:(BOOL)a3;
- (id)_locale_forOldMethods;
- (id)_nextChangeDateAfterDate:(id)a3;
- (id)_timeZone_forOldMethods;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)_cacheGenerationCount;
- (void)_clearFormatter;
- (void)_invalidateCache;
- (void)_regenerateFormatter;
- (void)_regenerateFormatterIfAbsent;
- (void)_reset;
- (void)_setDateFormat:(id)a3;
- (void)_setDateFormat:(id)a3 alreadyLocked:(BOOL)a4;
- (void)_setIsLenient:(BOOL)a3;
- (void)_setUsesCharacterDirection:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setAMSymbol:(NSString *)AMSymbol;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDateFormat:(NSString *)dateFormat;
- (void)setDateStyle:(NSDateFormatterStyle)dateStyle;
- (void)setDefaultDate:(NSDate *)defaultDate;
- (void)setDoesRelativeDateFormatting:(BOOL)doesRelativeDateFormatting;
- (void)setEraSymbols:(NSArray *)eraSymbols;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setGeneratesCalendarDates:(BOOL)generatesCalendarDates;
- (void)setGregorianStartDate:(NSDate *)gregorianStartDate;
- (void)setLenient:(BOOL)lenient;
- (void)setLocale:(NSLocale *)locale;
- (void)setLocalizedDateFormatFromTemplate:(NSString *)dateFormatTemplate;
- (void)setLongEraSymbols:(NSArray *)longEraSymbols;
- (void)setMonthSymbols:(NSArray *)monthSymbols;
- (void)setPMSymbol:(NSString *)PMSymbol;
- (void)setQuarterSymbols:(NSArray *)quarterSymbols;
- (void)setShortMonthSymbols:(NSArray *)shortMonthSymbols;
- (void)setShortQuarterSymbols:(NSArray *)shortQuarterSymbols;
- (void)setShortStandaloneMonthSymbols:(NSArray *)shortStandaloneMonthSymbols;
- (void)setShortStandaloneQuarterSymbols:(NSArray *)shortStandaloneQuarterSymbols;
- (void)setShortStandaloneWeekdaySymbols:(NSArray *)shortStandaloneWeekdaySymbols;
- (void)setShortWeekdaySymbols:(NSArray *)shortWeekdaySymbols;
- (void)setStandaloneMonthSymbols:(NSArray *)standaloneMonthSymbols;
- (void)setStandaloneQuarterSymbols:(NSArray *)standaloneQuarterSymbols;
- (void)setStandaloneWeekdaySymbols:(NSArray *)standaloneWeekdaySymbols;
- (void)setTimeStyle:(NSDateFormatterStyle)timeStyle;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setTwoDigitStartDate:(NSDate *)twoDigitStartDate;
- (void)setVeryShortMonthSymbols:(NSArray *)veryShortMonthSymbols;
- (void)setVeryShortStandaloneMonthSymbols:(NSArray *)veryShortStandaloneMonthSymbols;
- (void)setVeryShortStandaloneWeekdaySymbols:(NSArray *)veryShortStandaloneWeekdaySymbols;
- (void)setVeryShortWeekdaySymbols:(NSArray *)veryShortWeekdaySymbols;
- (void)setWeekdaySymbols:(NSArray *)weekdaySymbols;
@end

@implementation NSDateFormatter

- (void)_invalidateCache
{
}

+ (NSDateFormatterBehavior)defaultFormatterBehavior
{
  return __NSDateFormatterDefaultBehavior;
}

+ (void)setDefaultFormatterBehavior:(NSDateFormatterBehavior)defaultFormatterBehavior
{
  NSDateFormatterBehavior v3 = NSDateFormatterBehavior10_4;
  if (defaultFormatterBehavior) {
    NSDateFormatterBehavior v3 = defaultFormatterBehavior;
  }
  __NSDateFormatterDefaultBehavior = v3;
}

+ (void)initialize
{
  if (!__NSDateFormatterDefaultBehavior) {
    [a1 setDefaultFormatterBehavior:0];
  }
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

- (void)_regenerateFormatterIfAbsent
{
  if (!self->_formatter) {
    -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
}

- (void)_regenerateFormatter
{
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v4 = _CFTimeZoneGetNoteCount() + NoteCount;
  self->_counter = v4 + _CFCalendarGetMidnightNoteCount();
  v5 = (const __CFLocale *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateStyle");
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"timeStyle");
  v8 = (const __CFAllocator **)MEMORY[0x189604DD0];
  if (!v5) {
    v5 = (const __CFLocale *)[MEMORY[0x189603F90] currentLocale];
  }
  v9 = *v8;
  if (v6) {
    v6 = (void *)[v6 integerValue];
  }
  if (v7) {
    CFDateFormatterStyle v10 = [v7 integerValue];
  }
  else {
    CFDateFormatterStyle v10 = kCFDateFormatterNoStyle;
  }
  v11 = CFDateFormatterCreate(v9, v5, (CFDateFormatterStyle)v6, v10);
  self->_formatter = v11;
  if (v11)
  {
    v12 = (const __CFString *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"dateFormat");
    if (v12) {
      CFDateFormatterSetFormat(self->_formatter, v12);
    }
    v13 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"timeZone");
    if (v13) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EF0], v13);
    }
    v14 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"calendar");
    if (v14) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E58], v14);
    }
    v15 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"lenient");
    if (v15) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E80], v15);
    }
    v16 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"twoDigitStartDate");
    if (v16) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EF8], v16);
    }
    v17 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"defaultDate");
    if (v17) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E60], v17);
    }
    v18 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"eraSymbols");
    if (v18) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E70], v18);
    }
    v19 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"monthSymbols");
    if (v19) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E90], v19);
    }
    v20 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortMonthSymbols");
    if (v20) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EA8], v20);
    }
    v21 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"weekdaySymbols");
    if (v21) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604F28], v21);
    }
    v22 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortWeekdaySymbols");
    if (v22) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604ED0], v22);
    }
    v23 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"AMSymbol");
    if (v23) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E50], v23);
    }
    v24 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"PMSymbol");
    if (v24) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E98], v24);
    }
    v25 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"longEraSymbols");
    if (v25) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E88], v25);
    }
    v26 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortMonthSymbols");
    if (v26) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604F08], v26);
    }
    v27 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneMonthSymbols");
    if (v27) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604ED8], v27);
    }
    v28 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneMonthSymbols");
    if (v28) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EB8], v28);
    }
    v29 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortStandaloneMonthSymbols");
    if (v29) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604F10], v29);
    }
    v30 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortWeekdaySymbols");
    if (v30) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604F20], v30);
    }
    v31 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneWeekdaySymbols");
    if (v31) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EE8], v31);
    }
    v32 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneWeekdaySymbols");
    if (v32) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EC8], v32);
    }
    v33 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortStandaloneWeekdaySymbols");
    if (v33) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604F18], v33);
    }
    v34 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"quarterSymbols");
    if (v34) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EA0], v34);
    }
    v35 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortQuarterSymbols");
    if (v35) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EB0], v35);
    }
    v36 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneQuarterSymbols");
    if (v36) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EE0], v36);
    }
    v37 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneQuarterSymbols");
    if (v37) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604EC0], v37);
    }
    v38 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"gregorianStartDate");
    if (v38) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E78], v38);
    }
    v39 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"doesRelativeDateFormatting");
    if (v39) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604E68], v39);
    }
    v40 = (const void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"usesCharacterDirection");
    if (v40) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x189604F00], v40);
    }
    v41 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formattingContext");
    if (v41)
    {
      v42 = v41;
    }
  }

- (NSDateFormatter)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
  v2 = -[NSDateFormatter init](&v6, sel_init);
  NSDateFormatterBehavior v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithCapacity:20];
    v3->_attributes = v4;
    -[NSMutableDictionary setValue:forKey:]( v4,  "setValue:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)objc_opt_class() defaultFormatterBehavior]),  @"formatterBehavior");
  }

  return v3;
}

- (void)_reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  uint64_t v4 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithCapacity:20];
  self->_attributes = v4;
  -[NSMutableDictionary setValue:forKey:]( v4,  "setValue:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)objc_opt_class() defaultFormatterBehavior]),  @"formatterBehavior");
  -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
  -[NSDateFormatter dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v6 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v6[1] setDictionary:self->_attributes];
  os_unfair_lock_unlock(p_lock);
  [v6 _clearFormatter];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDateFormatters cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  os_unfair_lock_lock(&self->_lock);
  [a3 encodeObject:self->_attributes forKey:@"NS.attributes"];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateFormatter)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
  uint64_t v4 = -[NSFormatter initWithCoder:](&v13, sel_initWithCoder_);
  objc_super v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_lock._os_unfair_lock_opaque = 0;
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = (NSMutableDictionary *)(id)[a3 decodeObjectForKey:@"NS.attributes"];
    v5->_attributes = v6;
    uint64_t v7 = objc_msgSend( (id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"formatterBehavior"),  "integerValue");
    if (v7 != 1040)
    {
      attributes = v5->_attributes;
      if (v7) {
        uint64_t v9 = 1040LL;
      }
      else {
        uint64_t v9 = [(id)objc_opt_class() defaultFormatterBehavior];
      }
      -[NSMutableDictionary setValue:forKey:]( attributes,  "setValue:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9),  @"formatterBehavior");
    }

    -[NSDateFormatter _clearFormatter](v5, "_clearFormatter");
    return v5;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDateFormatters cannot be decoded by non-keyed archivers" userInfo:0]);
  return (NSDateFormatter *)-[NSDateFormatter _timeZone_forOldMethods](v11, v12);
}

- (id)_timeZone_forOldMethods
{
  objc_super v3 = (objc_class *)objc_opt_class();
  if ((-[NSDateFormatter isMemberOfClass:](self, "isMemberOfClass:", v3) & 1) != 0) {
    return (id)[MEMORY[0x189604020] localTimeZone];
  }
  uint64_t v4 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v4, sel_timeZone);
  if (MethodImplementation == class_getMethodImplementation(v3, sel_timeZone)) {
    return (id)[MEMORY[0x189604020] localTimeZone];
  }
  else {
    return -[NSDateFormatter timeZone](self, "timeZone");
  }
}

- (id)_locale_forOldMethods
{
  else {
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"), "dictionaryRepresentation");
  }
}

- (id)stringForObjectValue:(id)a3
{
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v6 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v6 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  formatter = self->_formatter;
  if (formatter
    && (StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate( (CFAllocatorRef)*MEMORY[0x189604DD0],  formatter,  (CFDateRef)a3)) != 0LL)
  {
    uint64_t v9 = StringWithDate;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"formattingContext"),  "intValue") == -1)
  {
    CFDateFormatterStyle v10 = objc_alloc_init(&OBJC_CLASS____NSStringProxyForContext);
    -[_NSStringProxyForContext setString:](v10, "setString:", v9);
    -[_NSStringProxyForContext setItem:](v10, "setItem:", a3);
    v11 = (id *)[objc_allocWithZone((Class)objc_opt_class()) init];
    [v11[1] setDictionary:self->_attributes];
    -[_NSStringProxyForContext _retainFormatter:](v10, "_retainFormatter:", v11);

    uint64_t v9 = v10;
  }

  os_unfair_lock_unlock(&self->_lock);
  return v9;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  v16[1] = *(id *)MEMORY[0x1895F89C0];
  v16[0] = 0LL;
  if (!getObjectValue_forString_errorDescription__baseIMP)
  {
    uint64_t v9 = objc_lookUpClass("NSDateFormatter");
    getObjectValue_forString_errorDescription__baseIMP = (uint64_t)class_getMethodImplementation( v9,  sel_getObjectValue_forString_range_error_);
  }

  CFDateFormatterStyle v10 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v10, sel_getObjectValue_forString_range_error_);
  if (a5) {
    SEL v12 = (NSError **)v16;
  }
  else {
    SEL v12 = 0LL;
  }
  if (MethodImplementation == (IMP)getObjectValue_forString_errorDescription__baseIMP) {
    char ObjectValue = getObjectValue((uint64_t)self, a3, (__CFString *)a4, 0LL, 1, v12);
  }
  else {
    char ObjectValue = -[NSDateFormatter getObjectValue:forString:range:error:]( self,  "getObjectValue:forString:range:error:",  a3,  a4,  0LL,  v12);
  }
  BOOL v14 = ObjectValue;
  if (a5) {
    *a5 = (id)[v16[0] localizedDescription];
  }
  return v14;
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error
{
  return getObjectValue((uint64_t)self, obj, (__CFString *)string, (CFIndex *)rangep, 0, error);
}

- (NSString)stringFromDate:(NSDate *)date
{
  if (date) {
    return (NSString *)-[NSDateFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else {
    return 0LL;
  }
}

- (NSDate)dateFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!string) {
    return 0LL;
  }
  v4[0] = 0LL;
  if (-[NSDateFormatter getObjectValue:forString:errorDescription:]( self,  "getObjectValue:forString:errorDescription:",  v4,  string,  0LL))
  {
    return (NSDate *)v4[0];
  }

  else
  {
    return 0LL;
  }

+ (NSString)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle
{
  if (!date) {
    return 0LL;
  }
  v8 = (void *)objc_opt_new();
  [v8 setFormatterBehavior:1040];
  [v8 setDateStyle:dstyle];
  [v8 setTimeStyle:tstyle];
  uint64_t v9 = (NSString *)[v8 stringForObjectValue:date];

  return v9;
}

+ (NSString)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale
{
  return (NSString *)_dateFormatFromTemplate((const __CFString *)tmplate, opts, (CFLocaleRef)locale);
}

- (void)setLocalizedDateFormatFromTemplate:(NSString *)dateFormatTemplate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDateFormatter _setDateFormat:alreadyLocked:]( self,  "_setDateFormat:alreadyLocked:",  _dateFormatFromTemplate( (const __CFString *)dateFormatTemplate,  0LL,  (CFLocaleRef)-[NSDateFormatter _getLocaleAlreadyLocked:](self, "_getLocaleAlreadyLocked:", 1LL)),  1LL);
  os_unfair_lock_unlock(p_lock);
}

- (NSDateFormatterStyle)dateStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateStyle");
  if (v6)
  {
    CFDateFormatterStyle DateStyle = [v6 integerValue];
  }

  else
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      NSDateFormatterStyle v9 = NSDateFormatterNoStyle;
      goto LABEL_8;
    }

    CFDateFormatterStyle DateStyle = CFDateFormatterGetDateStyle(formatter);
  }

  NSDateFormatterStyle v9 = DateStyle;
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)setDateStyle:(NSDateFormatterStyle)dateStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateStyle");
  uint64_t v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", dateStyle);
  if (!v6
    || ![v6 isEqualToNumber:v7]
    || -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateFormat"))
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"dateStyle");
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", 0LL, @"dateFormat");
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSDateFormatterStyle)timeStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"timeStyle");
  if (v6)
  {
    CFDateFormatterStyle TimeStyle = [v6 integerValue];
  }

  else
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      NSDateFormatterStyle v9 = NSDateFormatterNoStyle;
      goto LABEL_8;
    }

    CFDateFormatterStyle TimeStyle = CFDateFormatterGetTimeStyle(formatter);
  }

  NSDateFormatterStyle v9 = TimeStyle;
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)setTimeStyle:(NSDateFormatterStyle)timeStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"timeStyle");
  uint64_t v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", timeStyle);
  if (!v6
    || ![v6 isEqualToNumber:v7]
    || -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateFormat"))
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"timeStyle");
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", 0LL, @"dateFormat");
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)_getLocaleAlreadyLocked:(BOOL)a3
{
  if (!a3) {
    os_unfair_lock_lock(&self->_lock);
  }
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v6 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v6 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  CFLocaleRef Locale = (CFLocaleRef)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale");
  if (!Locale)
  {
    formatter = self->_formatter;
    if (formatter) {
      CFLocaleRef Locale = CFDateFormatterGetLocale(formatter);
    }
    else {
      CFLocaleRef Locale = 0LL;
    }
  }

  NSDateFormatterStyle v9 = Locale;
  if (!a3) {
    os_unfair_lock_unlock(&self->_lock);
  }
  return Locale;
}

- (NSLocale)locale
{
  return (NSLocale *)-[NSDateFormatter _getLocaleAlreadyLocked:](self, "_getLocaleAlreadyLocked:", 0LL);
}

- (void)setLocale:(NSLocale *)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale");
  if (locale && !v6 || ([v6 isEqual:locale] & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  (id)-[NSLocale copyWithZone:](locale, "copyWithZone:", 0LL),  @"locale");
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)generatesCalendarDates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"generatesCalendarDates");
  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setGeneratesCalendarDates:(BOOL)generatesCalendarDates
{
  BOOL v3 = generatesCalendarDates;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  uint64_t v6 = (void *)MEMORY[0x189604DE8];
  if (!v3) {
    uint64_t v6 = (void *)MEMORY[0x189604DE0];
  }
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v6, @"generatesCalendarDates");
  os_unfair_lock_unlock(p_lock);
}

- (NSDateFormatterBehavior)formatterBehavior
{
  return 1040LL;
}

- (NSString)dateFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  Format = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateFormat");
  if (!Format)
  {
    formatter = self->_formatter;
    if (formatter) {
      Format = (__CFString *)CFDateFormatterGetFormat(formatter);
    }
    else {
      Format = 0LL;
    }
  }

  v8 = Format;
  os_unfair_lock_unlock(p_lock);
  return (NSString *)Format;
}

- (void)_setDateFormat:(id)a3 alreadyLocked:(BOOL)a4
{
  if (!a4) {
    os_unfair_lock_lock(&self->_lock);
  }
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateFormat");
  if (!a3 || v7) && ([v7 isEqualToString:a3]) {
    goto LABEL_11;
  }
  ++self->_cacheGeneration;
  v8 = (const __CFString *)(id)[a3 copyWithZone:0];
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, @"dateFormat");
  if (!v8 || (formatter = self->_formatter) == 0LL)
  {
    if (!v8)
    {
      -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      if (a4) {
        return;
      }
LABEL_14:
      os_unfair_lock_unlock(&self->_lock);
      return;
    }

- (void)setDateFormat:(NSString *)dateFormat
{
}

- (id)_dateFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  id v6 = (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"dateFormat");
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_setDateFormat:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  id v6 = (const __CFString *)(id)[a3 copyWithZone:0];
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v6, @"dateFormat");
  formatter = self->_formatter;
  if (formatter) {
    CFDateFormatterSetFormat(formatter, v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_setIsLenient:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  id v6 = (void *)MEMORY[0x189604DE8];
  if (!v3) {
    id v6 = (void *)MEMORY[0x189604DE0];
  }
  uint64_t v7 = (const void *)*v6;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v6, @"lenient");
  formatter = self->_formatter;
  if (formatter) {
    CFDateFormatterSetProperty(formatter, (CFStringRef)*MEMORY[0x189604E80], v7);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSTimeZone)timeZone
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"timeZone");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EF0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSTimeZone *)v4;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"timeZone");
  if ((timeZone == 0) == (v5 != 0) || ([v5 isEqual:timeZone] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EF0];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSTimeZone copyWithZone:](timeZone, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"timeZone");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSCalendar)calendar
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"calendar");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E58];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSCalendar *)v4;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"calendar");
  if ((calendar == 0) == (v5 != 0) || ([v5 isEqual:calendar] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E58];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSCalendar copyWithZone:](calendar, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"calendar");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isLenient
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  id v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"lenient");
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      char v8 = 0;
      goto LABEL_7;
    }

    id v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x189604E80]);
  }

  char v8 = [v6 BOOLValue];
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setLenient:(BOOL)lenient
{
  uint64_t v4 = (void **)MEMORY[0x189604DE8];
  if (!lenient) {
    uint64_t v4 = (void **)MEMORY[0x189604DE0];
  }
  uint64_t v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"lenient");
  if ((v5 == 0) == (v6 != 0) || ([v6 isEqual:v5] & 1) == 0)
  {
    id v7 = (const __CFString *)*MEMORY[0x189604E80];
    ++self->_cacheGeneration;
    id v8 = (id)[v5 copyWithZone:0];
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, @"lenient");
    if (v7)
    {
      formatter = self->_formatter;
      if (v8) {
        BOOL v10 = formatter == 0LL;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
        }
      }

      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)twoDigitStartDate
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"twoDigitStartDate");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EF8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSDate *)v4;
}

- (void)setTwoDigitStartDate:(NSDate *)twoDigitStartDate
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"twoDigitStartDate");
  if ((twoDigitStartDate == 0) == (v5 != 0) || ([v5 isEqual:twoDigitStartDate] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EF8];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSDate copyWithZone:](twoDigitStartDate, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"twoDigitStartDate");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)defaultDate
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"defaultDate");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E60];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSDate *)v4;
}

- (void)setDefaultDate:(NSDate *)defaultDate
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"defaultDate");
  if ((defaultDate == 0) == (v5 != 0) || ([v5 isEqual:defaultDate] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E60];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSDate copyWithZone:](defaultDate, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"defaultDate");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)eraSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"eraSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E70];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setEraSymbols:(NSArray *)eraSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"eraSymbols");
  if ((eraSymbols == 0) == (v5 != 0) || ([v5 isEqual:eraSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E70];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](eraSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"eraSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)monthSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"monthSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E90];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setMonthSymbols:(NSArray *)monthSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"monthSymbols");
  if ((monthSymbols == 0) == (v5 != 0) || ([v5 isEqual:monthSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E90];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](monthSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"monthSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortMonthSymbols
{
  if (!self->_attributes && _CFAppVersionCheckLessThan())
  {
    -[NSDateFormatter init](self, "init");
    _NSDateFormatterNoInit();
  }

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortMonthSymbols");
  if (!formatter)
  {
    id v6 = (const __CFString **)MEMORY[0x189604EA8];
    uint64_t NoteCount = _CFLocaleGetNoteCount();
    uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
    if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
      -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
    }
    NSDateFormatterStyle v9 = *v6;
    if (self->_formatter)
    {
      if (v9) {
        goto LABEL_10;
      }
    }

    else
    {
      -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (v9)
      {
LABEL_10:
        formatter = self->_formatter;
        if (formatter) {
          formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
        }
        goto LABEL_5;
      }
    }

    formatter = 0LL;
  }

- (void)setShortMonthSymbols:(NSArray *)shortMonthSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"shortMonthSymbols");
  if ((shortMonthSymbols == 0) == (v5 != 0) || ([v5 isEqual:shortMonthSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EA8];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](shortMonthSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"shortMonthSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)weekdaySymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"weekdaySymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604F28];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setWeekdaySymbols:(NSArray *)weekdaySymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"weekdaySymbols");
  if ((weekdaySymbols == 0) == (v5 != 0) || ([v5 isEqual:weekdaySymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604F28];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](weekdaySymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"weekdaySymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortWeekdaySymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortWeekdaySymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604ED0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortWeekdaySymbols:(NSArray *)shortWeekdaySymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"shortWeekdaySymbols");
  if ((shortWeekdaySymbols == 0) == (v5 != 0) || ([v5 isEqual:shortWeekdaySymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604ED0];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](shortWeekdaySymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"shortWeekdaySymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)AMSymbol
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"AMSymbol");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E50];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSString *)v4;
}

- (void)setAMSymbol:(NSString *)AMSymbol
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"AMSymbol");
  if ((AMSymbol == 0) == (v5 != 0) || ([v5 isEqual:AMSymbol] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E50];
    ++self->_cacheGeneration;
    id v7 = -[NSString copyWithZone:](AMSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"AMSymbol");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)PMSymbol
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"PMSymbol");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E98];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSString *)v4;
}

- (void)setPMSymbol:(NSString *)PMSymbol
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"PMSymbol");
  if ((PMSymbol == 0) == (v5 != 0) || ([v5 isEqual:PMSymbol] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E98];
    ++self->_cacheGeneration;
    id v7 = -[NSString copyWithZone:](PMSymbol, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"PMSymbol");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)longEraSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"longEraSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E88];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setLongEraSymbols:(NSArray *)longEraSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"longEraSymbols");
  if ((longEraSymbols == 0) == (v5 != 0) || ([v5 isEqual:longEraSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E88];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](longEraSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"longEraSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortMonthSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortMonthSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604F08];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortMonthSymbols:(NSArray *)veryShortMonthSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"veryShortMonthSymbols");
  if ((veryShortMonthSymbols == 0) == (v5 != 0) || ([v5 isEqual:veryShortMonthSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604F08];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](veryShortMonthSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"veryShortMonthSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneMonthSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneMonthSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604ED8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setStandaloneMonthSymbols:(NSArray *)standaloneMonthSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"standaloneMonthSymbols");
  if ((standaloneMonthSymbols == 0) == (v5 != 0) || ([v5 isEqual:standaloneMonthSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604ED8];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](standaloneMonthSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"standaloneMonthSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneMonthSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneMonthSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EB8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortStandaloneMonthSymbols:(NSArray *)shortStandaloneMonthSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneMonthSymbols");
  if ((shortStandaloneMonthSymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:shortStandaloneMonthSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EB8];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](shortStandaloneMonthSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"shortStandaloneMonthSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortStandaloneMonthSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortStandaloneMonthSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604F10];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortStandaloneMonthSymbols:(NSArray *)veryShortStandaloneMonthSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortStandaloneMonthSymbols");
  if ((veryShortStandaloneMonthSymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:veryShortStandaloneMonthSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604F10];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](veryShortStandaloneMonthSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"veryShortStandaloneMonthSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortWeekdaySymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortWeekdaySymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604F20];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortWeekdaySymbols:(NSArray *)veryShortWeekdaySymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortWeekdaySymbols");
  if ((veryShortWeekdaySymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:veryShortWeekdaySymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604F20];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](veryShortWeekdaySymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"veryShortWeekdaySymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneWeekdaySymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneWeekdaySymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EE8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setStandaloneWeekdaySymbols:(NSArray *)standaloneWeekdaySymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneWeekdaySymbols");
  if ((standaloneWeekdaySymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:standaloneWeekdaySymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EE8];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](standaloneWeekdaySymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"standaloneWeekdaySymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneWeekdaySymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EC8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortStandaloneWeekdaySymbols:(NSArray *)shortStandaloneWeekdaySymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneWeekdaySymbols");
  if ((shortStandaloneWeekdaySymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:shortStandaloneWeekdaySymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EC8];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](shortStandaloneWeekdaySymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"shortStandaloneWeekdaySymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortStandaloneWeekdaySymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortStandaloneWeekdaySymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604F18];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortStandaloneWeekdaySymbols:(NSArray *)veryShortStandaloneWeekdaySymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"veryShortStandaloneWeekdaySymbols");
  if ((veryShortStandaloneWeekdaySymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:veryShortStandaloneWeekdaySymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604F18];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](veryShortStandaloneWeekdaySymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"veryShortStandaloneWeekdaySymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)quarterSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"quarterSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EA0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setQuarterSymbols:(NSArray *)quarterSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"quarterSymbols");
  if ((quarterSymbols == 0) == (v5 != 0) || ([v5 isEqual:quarterSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EA0];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](quarterSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"quarterSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortQuarterSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortQuarterSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EB0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortQuarterSymbols:(NSArray *)shortQuarterSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"shortQuarterSymbols");
  if ((shortQuarterSymbols == 0) == (v5 != 0) || ([v5 isEqual:shortQuarterSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EB0];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](shortQuarterSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"shortQuarterSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneQuarterSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneQuarterSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EE0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setStandaloneQuarterSymbols:(NSArray *)standaloneQuarterSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"standaloneQuarterSymbols");
  if ((standaloneQuarterSymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:standaloneQuarterSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EE0];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](standaloneQuarterSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"standaloneQuarterSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneQuarterSymbols
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneQuarterSymbols");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604EC0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortStandaloneQuarterSymbols:(NSArray *)shortStandaloneQuarterSymbols
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"shortStandaloneQuarterSymbols");
  if ((shortStandaloneQuarterSymbols == 0LL) == (v5 != 0LL)
    || ([v5 isEqual:shortStandaloneQuarterSymbols] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604EC0];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSArray copyWithZone:](shortStandaloneQuarterSymbols, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v7,  @"shortStandaloneQuarterSymbols");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)gregorianStartDate
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"gregorianStartDate");
  if (formatter) {
    goto LABEL_2;
  }
  id v6 = (const __CFString **)MEMORY[0x189604E78];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  NSDateFormatterStyle v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    formatter = 0LL;
    goto LABEL_2;
  }

  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSDate *)v4;
}

- (void)setGregorianStartDate:(NSDate *)gregorianStartDate
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"gregorianStartDate");
  if ((gregorianStartDate == 0) == (v5 != 0) || ([v5 isEqual:gregorianStartDate] & 1) == 0)
  {
    id v6 = (const __CFString *)*MEMORY[0x189604E78];
    ++self->_cacheGeneration;
    id v7 = (id)-[NSDate copyWithZone:](gregorianStartDate, "copyWithZone:", 0LL);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, @"gregorianStartDate");
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0LL)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }

      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  switch(formattingContext)
  {
    case NSFormattingContextUnknown:
      char v4 = 0;
      uint64_t v5 = 256LL;
      goto LABEL_9;
    case NSFormattingContextDynamic:
      id v6 = 0LL;
      uint64_t v5 = 0xFFFFFFFFLL;
      char v4 = 1;
      goto LABEL_10;
    case NSFormattingContextStandalone:
      char v4 = 0;
      uint64_t v5 = 260LL;
      goto LABEL_9;
    case NSFormattingContextListItem:
      char v4 = 0;
      uint64_t v5 = 259LL;
      goto LABEL_9;
    case NSFormattingContextBeginningOfSentence:
      char v4 = 0;
      uint64_t v5 = 258LL;
      goto LABEL_9;
    case NSFormattingContextMiddleOfSentence:
      char v4 = 0;
      uint64_t v5 = 257LL;
      goto LABEL_9;
    default:
      char v4 = 0;
      uint64_t v5 = 0LL;
LABEL_9:
      id v6 = @"kCFDateFormatterFormattingContextKey";
LABEL_10:
      id v7 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5);
      os_unfair_lock_lock(&self->_lock);
      uint64_t v8 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formattingContext");
      if ((v7 == 0) == (v8 != 0) || ([v8 isEqual:v7] & 1) == 0)
      {
        ++self->_cacheGeneration;
        id v9 = -[NSNumber copyWithZone:](v7, "copyWithZone:", 0LL);
        -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v9, @"formattingContext");
        if ((v4 & 1) == 0)
        {
          if (v9 && (formatter = self->_formatter) != 0LL)
          {
            CFDateFormatterSetProperty(formatter, v6, v9);
          }

          else if (!v9)
          {
            -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
          }
        }
      }

      os_unfair_lock_unlock(&self->_lock);
      return;
  }

- (NSFormattingContext)formattingContext
{
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"formattingContext");
  if (!formatter)
  {
    uint64_t NoteCount = _CFLocaleGetNoteCount();
    uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
    if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
      -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
    }
    formatter = self->_formatter;
    if (formatter
      || (-[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0LL))
    {
      formatter = (id)CFDateFormatterCopyProperty( formatter,  @"kCFDateFormatterFormattingContextKey");
    }
  }

  id v6 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  id v7 = v6;
  int v8 = -[__CFDateFormatter intValue](v7, "intValue");
  if (!v7 && self->_formatter) {
    int v8 = objc_msgSend( (id)(id)CFDateFormatterCopyProperty( self->_formatter,  @"kCFDateFormatterFormattingContextKey"),  "intValue");
  }
  switch(v8)
  {
    case 256:
      goto LABEL_14;
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
      if (v8 == -1) {
        NSFormattingContext result = NSFormattingContextDynamic;
      }
      else {
LABEL_14:
      }
        NSFormattingContext result = NSFormattingContextUnknown;
      break;
  }

  return result;
}

- (BOOL)doesRelativeDateFormatting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  id v6 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"doesRelativeDateFormatting");
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      char v8 = 0;
      goto LABEL_7;
    }

    id v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x189604E68]);
  }

  char v8 = [v6 BOOLValue];
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setDoesRelativeDateFormatting:(BOOL)doesRelativeDateFormatting
{
  char v4 = (void **)MEMORY[0x189604DE8];
  if (!doesRelativeDateFormatting) {
    char v4 = (void **)MEMORY[0x189604DE0];
  }
  uint64_t v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"doesRelativeDateFormatting");
  if ((v5 == 0) == (v6 != 0) || ([v6 isEqual:v5] & 1) == 0)
  {
    id v7 = (const __CFString *)*MEMORY[0x189604E68];
    ++self->_cacheGeneration;
    id v8 = (id)[v5 copyWithZone:0];
    -[NSMutableDictionary setValue:forKey:]( self->_attributes,  "setValue:forKey:",  v8,  @"doesRelativeDateFormatting");
    if (v7)
    {
      formatter = self->_formatter;
      if (v8) {
        BOOL v10 = formatter == 0LL;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
        }
      }

      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_usesCharacterDirection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  id v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"usesCharacterDirection");
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      char v8 = 0;
      goto LABEL_7;
    }

    id v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x189604F00]);
  }

  char v8 = [v6 BOOLValue];
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_setUsesCharacterDirection:(BOOL)a3
{
  char v4 = (void **)MEMORY[0x189604DE8];
  if (!a3) {
    char v4 = (void **)MEMORY[0x189604DE0];
  }
  uint64_t v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"usesCharacterDirection");
  if ((v5 == 0) == (v6 != 0) || ([v6 isEqual:v5] & 1) == 0)
  {
    id v7 = (const __CFString *)*MEMORY[0x189604F00];
    ++self->_cacheGeneration;
    id v8 = (id)[v5 copyWithZone:0];
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, @"usesCharacterDirection");
    if (v7)
    {
      formatter = self->_formatter;
      if (v8) {
        BOOL v10 = formatter == 0LL;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
        }
      }

      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)_cacheGenerationCount
{
  if (!-[NSDateFormatter _tracksCacheGenerationCount](self, "_tracksCacheGenerationCount")) {
    return -1LL;
  }
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v4 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v4 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  return self->_cacheGeneration;
}

- (BOOL)_tracksCacheGenerationCount
{
  return object_getClass(self) == (Class)&OBJC_CLASS___NSDateFormatter;
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSDate() & 1) != 0)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    id v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation( v7,  sel_attributedStringForObjectValue_withDefaultAttributes_);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:]( &v9,  sel__mayDecorateAttributedStringForObjectValue_,  a3);
  }

- (id)_attributedStringWithFieldsFromDate:(id)a3
{
  v15[5] = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v7 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v7 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  if (self->_formatter)
  {
    [a3 timeIntervalSinceReferenceDate];
    AttributedStringAndFieldsWithAbsoluteTime = (void *)_CFDateFormatterCreateAttributedStringAndFieldsWithAbsoluteTime();
  }

  else
  {
    AttributedStringAndFieldsWithAbsoluteTime = 0LL;
  }

  objc_super v9 = AttributedStringAndFieldsWithAbsoluteTime;
  if (objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_attributes,  "objectForKey:",  @"formattingContext"),  "intValue") == -1)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS____NSStringProxyForContext);
    -[_NSStringProxyForContext setString:](v10, "setString:", -[NSAttributedString string](v9, "string"));
    -[_NSStringProxyForContext setItem:](v10, "setItem:", a3);
    v11 = (id *)[objc_allocWithZone((Class)objc_opt_class()) init];
    [v11[1] setDictionary:self->_attributes];
    -[_NSStringProxyForContext _retainFormatter:](v10, "_retainFormatter:", v11);

    SEL v12 =  -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v10);
    uint64_t v13 = -[NSAttributedString length](v9, "length");
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __64__NSDateFormatter_Private___attributedStringWithFieldsFromDate___block_invoke;
    v15[3] = &unk_189C9A220;
    v15[4] = v12;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:]( v9,  "enumerateAttributesInRange:options:usingBlock:",  0LL,  v13,  0LL,  v15);
    objc_super v9 = v12;
  }

  os_unfair_lock_unlock(p_lock);
  return v9;
}

uint64_t __64__NSDateFormatter_Private___attributedStringWithFieldsFromDate___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

+ (id)_componentsFromFormatString:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  v29 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v4 = [a3 length];
  if (qword_18C494A00 != -1) {
    dispatch_once(&qword_18C494A00, &__block_literal_global_7);
  }
  v28 = (void *)_MergedGlobals_5;
  CFStringRef theString = (CFStringRef)a3;
  uint64_t v35 = 0LL;
  int64_t v36 = v4;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0LL;
  v33 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  }
  int64_t v37 = 0LL;
  int64_t v38 = 0LL;
  v34 = CStringPtr;
  uint64_t v7 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  if (v4 < 1)
  {
    uint64_t v20 = 0LL;
    uint64_t v11 = 0LL;
    int v18 = 1;
  }

  else
  {
    uint64_t v8 = 0LL;
    UniChar v9 = 0;
    char v10 = 0;
    uint64_t v11 = 0LL;
    int64_t v12 = 0LL;
    char v13 = 1;
    uint64_t v14 = 64LL;
    for (i = v4; i != v12; uint64_t v20 = i)
    {
      else {
        uint64_t v15 = v12;
      }
      int64_t v16 = v36;
      if (v36 <= v12)
      {
        UniChar v17 = 0;
      }

      else if (v33)
      {
        UniChar v17 = v33[v12 + v35];
      }

      else if (v34)
      {
        UniChar v17 = v34[v35 + v12];
      }

      else
      {
        int64_t v21 = v37;
        if (v38 <= v12 || v37 > v12)
        {
          uint64_t v23 = v15 + v8;
          uint64_t v24 = v14 - v15;
          int64_t v25 = v12 - v15;
          int64_t v26 = v25 + 64;
          if (v25 + 64 >= v36) {
            int64_t v26 = v36;
          }
          int64_t v37 = v25;
          int64_t v38 = v26;
          if (v36 >= v24) {
            int64_t v16 = v24;
          }
          v40.length = v16 + v23;
          v40.location = v25 + v35;
          CFStringGetCharacters(theString, v40, buffer);
          int64_t v21 = v37;
        }

        UniChar v17 = buffer[v12 - v21];
      }

      if ((v10 & 1) != 0) {
        int v18 = 0;
      }
      else {
        int v18 = [v28 characterIsMember:v17];
      }
      if ((v18 & 1) == 0 && ((v13 ^ 1) & 1) == 0 || (v17 != v9 ? (int v19 = v18) : (int v19 = 0), v19 == 1))
      {
        if (v12 > v11)
        {
          objc_msgSend(v29, "addObject:", _CreateComponent((uint64_t)v7, v11, v12 - v11, (v13 ^ 1) & 1));
          uint64_t v7 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
          uint64_t v11 = v12;
        }
      }

      if (v17 == 39)
      {
        if (v9 == 39) {
          -[NSString appendString:](v7, "appendString:", @"'");
        }
        v10 ^= 1u;
      }

      else
      {
        -[NSString appendFormat:](v7, "appendFormat:", @"%C", v17);
      }

      ++v12;
      --v8;
      ++v14;
      UniChar v9 = v17;
      char v13 = v18;
    }
  }

  if (-[NSString length](v7, "length")) {
    objc_msgSend(v29, "addObject:", _CreateComponent((uint64_t)v7, v11, v20 - v11, v18 ^ 1u));
  }
  return v29;
}

+ (id)_formatStringFromComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x189603A38];
    uint64_t v9 = *MEMORY[0x189603A28];
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        int64_t v12 = (NSString *)[v11 valueForKey:v8];
        if (objc_msgSend((id)objc_msgSend(v11, "valueForKey:", v9), "BOOLValue")) {
          goto LABEL_10;
        }
        if (qword_18C494A10 != -1) {
          dispatch_once(&qword_18C494A10, &__block_literal_global_302);
        }
        if (-[NSString rangeOfCharacterFromSet:](v12, "rangeOfCharacterFromSet:", qword_18C494A08) != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_10:
          int64_t v12 = -[NSString stringByReplacingOccurrencesOfString:withString:]( v12,  "stringByReplacingOccurrencesOfString:withString:",  @"'",  @"''");
          if (qword_18C494A00 != -1) {
            dispatch_once(&qword_18C494A00, &__block_literal_global_7);
          }
          if (-[NSString rangeOfCharacterFromSet:](v12, "rangeOfCharacterFromSet:", _MergedGlobals_5) != 0x7FFFFFFFFFFFFFFFLL) {
            int64_t v12 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"'%@'", v12);
          }
        }

        -[NSString appendString:](v4, "appendString:", v12);
        ++v10;
      }

      while (v6 != v10);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)_nextChangeDateAfterDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = -[NSDateFormatter dateFormat](self, "dateFormat");
  if (!-[NSString length](v5, "length")) {
    return 0LL;
  }
  -[NSDateFormatter locale](self, "locale");
  uint64_t SkeletonFromTemplate = _CFDateFormatterCreateSkeletonFromTemplate();
  if (!SkeletonFromTemplate) {
    return 0LL;
  }
  uint64_t v7 = (const void *)SkeletonFromTemplate;
  uint64_t UnitsFromDateFormat = _CFCalendarGetUnitsFromDateFormat();
  if (!UnitsFromDateFormat)
  {
    int64_t v12 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v16 = v5;
      __int16 v17 = 2112;
      __int128 v18 = v7;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Fail to get calendar units from date format %@; skeleton: %@",
        buf,
        0x16u);
    }

    CFRelease(v7);
    return 0LL;
  }

  uint64_t v9 = 0LL;
  while (1)
  {
    uint64_t v10 = qword_18388EF60[v9];
    if ((v10 & UnitsFromDateFormat) != 0) {
      break;
    }
    if (++v9 == 14)
    {
      uint64_t v11 = 0LL;
      goto LABEL_16;
    }
  }

  uint64_t v14 = -[NSDateFormatter calendar](self, "calendar");
  uint64_t v11 = -[NSCalendar nextDateAfterDate:matchingUnit:value:options:]( v14,  "nextDateAfterDate:matchingUnit:value:options:",  a3,  v10,  -[NSCalendar component:fromDate:](v14, "component:fromDate:", v10, a3) + 1,  1024LL);
LABEL_16:
  CFRelease(v7);
  return v11;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((_NSIsNSDate() & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  16LL,  @"Invalid parameter not satisfying: %@",  @"!value || _NSIsNSDate(value)");
    }
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
    -[NSDateFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSDateFormatter stringFromDate:](self, "stringFromDate:", a3));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSDateFormatter;
    -[NSDateFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0LL);
  }

@end