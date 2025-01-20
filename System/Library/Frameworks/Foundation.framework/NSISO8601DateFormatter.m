@interface NSISO8601DateFormatter
+ (BOOL)supportsSecureCoding;
+ (NSString)stringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone formatOptions:(NSISO8601DateFormatOptions)formatOptions;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6;
- (NSDate)dateFromString:(NSString *)string;
- (NSISO8601DateFormatOptions)formatOptions;
- (NSISO8601DateFormatter)init;
- (NSISO8601DateFormatter)initWithCoder:(id)a3;
- (NSString)stringFromDate:(NSDate *)date;
- (NSTimeZone)timeZone;
- (id)stringForObjectValue:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFormatOptions:(NSISO8601DateFormatOptions)formatOptions;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)updateFormatter;
@end

@implementation NSISO8601DateFormatter

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  formatter = self->_formatter;
  if (formatter)
  {
    CFRelease(formatter);
    self->_formatter = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSISO8601DateFormatter;
  -[NSISO8601DateFormatter dealloc](&v4, sel_dealloc);
}

- (NSISO8601DateFormatter)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSISO8601DateFormatter;
  v2 = -[NSISO8601DateFormatter init](&v5, sel_init);
  if (v2)
  {
    v2->_timeZone = (NSTimeZone *)(id)[MEMORY[0x189604020] timeZoneWithName:@"GMT"];
    v2->_formatOptions = 1907LL;
    ISO8601Formatter = CFDateFormatterCreateISO8601Formatter((CFAllocatorRef)*MEMORY[0x189604DD0], 0x773uLL);
    v2->_formatter = ISO8601Formatter;
    if (ISO8601Formatter) {
      CFDateFormatterSetProperty(ISO8601Formatter, (CFStringRef)*MEMORY[0x189604EF0], v2->_timeZone);
    }
  }

  return v2;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  objc_super v4 = self->_timeZone;
  if (!timeZone)
  {
    if (-[NSString isEqualToString:](-[NSTimeZone name](v4, "name"), "isEqualToString:", @"GMT"))
    {
LABEL_8:
      -[NSISO8601DateFormatter updateFormatter](self, "updateFormatter");
      return;
    }

    self->_timeZone = 0LL;
    uint64_t v6 = (NSTimeZone *)(id)[MEMORY[0x189604020] timeZoneWithName:@"GMT"];
LABEL_7:
    self->_timeZone = v6;
    goto LABEL_8;
  }

  if (!-[NSTimeZone isEqualToTimeZone:](v4, "isEqualToTimeZone:"))
  {

    self->_timeZone = 0LL;
    uint64_t v6 = (NSTimeZone *)-[NSTimeZone copy](timeZone, "copy");
    goto LABEL_7;
  }

- (NSISO8601DateFormatOptions)formatOptions
{
  return self->_formatOptions;
}

- (void)setFormatOptions:(NSISO8601DateFormatOptions)formatOptions
{
  if ((formatOptions & 0xFFFFFFFFFFFFF008LL) != 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSISO8601DateFormatter.m",  67LL,  @"Invalid parameter not satisfying: %@",  @"formatOptions == 0 || !(formatOptions & ~(NSISO8601DateFormatWithYear | NSISO8601DateFormatWithMonth | NSISO8601DateFormatWithWeekOfYear | NSISO8601DateFormatWithDay | NSISO8601DateFormatWithTime | NSISO8601DateFormatWithTimeZone | NSISO8601DateFormatWithSpaceBetweenDateAndTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone | NSISO8601DateFormatWithFractionalSeconds | NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithFullTime | NSISO8601DateFormatWithInternetDateTime))");
  }
  if (self->_formatOptions != formatOptions)
  {
    self->_formatOptions = formatOptions;
    -[NSISO8601DateFormatter updateFormatter](self, "updateFormatter");
  }

- (void)updateFormatter
{
  formatter = self->_formatter;
  if (formatter)
  {
    CFRelease(formatter);
    self->_formatter = 0LL;
  }

  ISO8601Formatter = CFDateFormatterCreateISO8601Formatter((CFAllocatorRef)*MEMORY[0x189604DD0], self->_formatOptions);
  self->_formatter = ISO8601Formatter;
  if (ISO8601Formatter) {
    CFDateFormatterSetProperty(ISO8601Formatter, (CFStringRef)*MEMORY[0x189604EF0], self->_timeZone);
  }
}

- (NSString)stringFromDate:(NSDate *)date
{
  if (date) {
    return (NSString *)-[NSISO8601DateFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else {
    return 0LL;
  }
}

- (id)stringForObjectValue:(id)a3
{
  if (a3
    && _NSIsNSDate()
    && (formatter = self->_formatter) != 0LL
    && (StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate( (CFAllocatorRef)*MEMORY[0x189604DD0],  formatter,  (CFDateRef)a3)) != 0LL)
  {
    return StringWithDate;
  }

  else
  {
    return 0LL;
  }

- (NSDate)dateFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!string) {
    return 0LL;
  }
  v4[0] = 0LL;
  if (-[NSISO8601DateFormatter getObjectValue:forString:range:error:]( self,  "getObjectValue:forString:range:error:",  v4,  string,  0LL,  0LL))
  {
    return (NSDate *)v4[0];
  }

  else
  {
    return 0LL;
  }

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v9 = 0LL;
  if (a5) {
    uint64_t v6 = &v9;
  }
  else {
    uint64_t v6 = 0LL;
  }
  BOOL v7 = -[NSISO8601DateFormatter getObjectValue:forString:range:error:]( self,  "getObjectValue:forString:range:error:",  a3,  a4,  0LL,  v6,  v9,  v10);
  if (v9) {
    *a5 = (id)[v9 localizedDescription];
  }
  return v7;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a4 || [a4 isEqual:&stru_189CA6A28])
  {
    if (a3) {
      *a3 = 0LL;
    }
    return 1;
  }

  if (a5)
  {
    CFIndex location = a5->location;
    CFIndex length = a5->length;
  }

  else
  {
    CFIndex length = [a4 length];
    CFIndex location = 0LL;
  }

  v18.CFIndex location = location;
  v18.CFIndex length = length;
  formatter = self->_formatter;
  if (formatter)
  {
    CFDateRef v15 = CFDateFormatterCreateDateFromString((CFAllocatorRef)*MEMORY[0x189604DD0], formatter, (CFStringRef)a4, &v18);
    if (v15)
    {
      CFDateRef v16 = v15;
      CFAutorelease(v15);
      if (a5) {
        *(CFRange *)a5 = v18;
      }
      if (a3) {
        *a3 = v16;
      }
      return 1;
    }
  }

  if (!a6) {
    return 0;
  }
  v19 = @"NSInvalidValue";
  v20[0] = a4;
  v17 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  2048,  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1]);
  BOOL result = 0;
  *a6 = v17;
  return result;
}

+ (NSString)stringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone formatOptions:(NSISO8601DateFormatOptions)formatOptions
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 setTimeZone:timeZone];
  [v8 setFormatOptions:formatOptions];
  id v9 = (NSString *)[v8 stringFromDate:date];

  return v9;
}

- (NSISO8601DateFormatter)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSISO8601DateFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  uint64_t v5 = [a3 decodeIntegerForKey:@"NS.formatOptions"];
  if ([a3 containsValueForKey:@"NS.timeZone"])
  {
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.timeZone"];
    if (!v6)
    {

      uint64_t v10 = @"NSLocalizedDescription";
      v11[0] = @"Timezone has been corrupted!";
      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  id v8 = -[NSISO8601DateFormatter init](self, "init");
  BOOL v7 = v8;
  if (v8)
  {
    -[NSISO8601DateFormatter setFormatOptions:](v8, "setFormatOptions:", v5);
    -[NSISO8601DateFormatter setTimeZone:](v7, "setTimeZone:", v6);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_formatOptions forKey:@"NS.formatOptions"];
    timeZone = self->_timeZone;
    if (timeZone) {
      [a3 encodeObject:timeZone forKey:@"NS.timeZone"];
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Encoder does not allow key encoding" userInfo:0]);
    +[NSISO8601DateFormatter supportsSecureCoding](v6, v7);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end