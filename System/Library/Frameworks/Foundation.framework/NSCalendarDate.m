@interface NSCalendarDate
+ (BOOL)supportsSecureCoding;
+ (NSCalendarDate)dateWithNaturalLanguageString:(id)a3 date:(id)a4 locale:(id)a5;
+ (NSCalendarDate)distantFuture;
+ (NSCalendarDate)distantPast;
+ (id)calendarDate;
+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format;
+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale;
+ (id)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone;
- (Class)classForCoder;
- (NSCalendarDate)dateByAddingYears:(NSInteger)year months:(NSInteger)month days:(NSInteger)day hours:(NSInteger)hour minutes:(NSInteger)minute seconds:(NSInteger)second;
- (NSCalendarDate)init;
- (NSCalendarDate)initWithCoder:(id)a3;
- (NSCalendarDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (NSInteger)dayOfCommonEra;
- (NSInteger)dayOfMonth;
- (NSInteger)dayOfWeek;
- (NSInteger)dayOfYear;
- (NSInteger)hourOfDay;
- (NSInteger)minuteOfHour;
- (NSInteger)monthOfYear;
- (NSInteger)secondOfMinute;
- (NSInteger)yearOfCommonEra;
- (NSString)calendarFormat;
- (NSString)descriptionWithCalendarFormat:(NSString *)format;
- (NSString)descriptionWithCalendarFormat:(NSString *)format locale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale;
- (NSTimeZone)timeZone;
- (double)timeIntervalSinceReferenceDate;
- (id)addTimeInterval:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initWithString:(NSString *)description;
- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format;
- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale;
- (id)initWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone;
- (id)replacementObjectForPortCoder:(id)a3;
- (int64_t)microsecondOfSecond;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)release;
- (void)setCalendarFormat:(NSString *)format;
- (void)setTimeZone:(NSTimeZone *)aTimeZone;
- (void)years:(NSInteger *)yp months:(NSInteger *)mop days:(NSInteger *)dp hours:(NSInteger *)hp minutes:(NSInteger *)mip seconds:(NSInteger *)sp sinceDate:(NSCalendarDate *)date;
@end

@implementation NSCalendarDate

- (id)initWithString:(NSString *)description
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCalendarDate;
  return -[NSCalendarDate initWithString:](&v4, sel_initWithString_, description);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCalendarDate;
  -[NSCalendarDate dealloc](&v3, sel_dealloc);
}

- (void)release
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if ((release_do_check & 1) == 0)
  {
    if (_CFAppVersionCheckLessThan()
      || _CFAppVersionCheckLessThan()
      || _CFAppVersionCheckLessThan())
    {
      objc_super v3 = self;
    }

    else
    {
      release_do_check = 1;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCalendarDate;
  -[NSCalendarDate release](&v4, sel_release);
}

- (NSCalendarDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  self->_timeIntervalSinceReferenceDate = a3;
  if (!self->_timeZone) {
    self->_timeZone = (NSTimeZone *)(id)[MEMORY[0x189604020] defaultTimeZone];
  }
  if (!self->_formatString) {
    self->_formatString = (NSString *)@"%Y-%m-%d %H:%M:%S %z";
  }
  return self;
}

+ (NSCalendarDate)distantFuture
{
  id v2 = objc_allocWithZone((Class)a1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "distantFuture"), "timeIntervalSinceReferenceDate");
  return (NSCalendarDate *)(id)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
}

+ (NSCalendarDate)distantPast
{
  id v2 = objc_allocWithZone((Class)a1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "distantPast"), "timeIntervalSinceReferenceDate");
  return (NSCalendarDate *)(id)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
}

- (NSCalendarDate)init
{
  return -[NSCalendarDate initWithTimeIntervalSinceReferenceDate:]( self,  "initWithTimeIntervalSinceReferenceDate:",  CFAbsoluteTimeGetCurrent());
}

- (id)initWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone
{
  v10 = aTimeZone;
  unint64_t v11 = year | ((unint64_t)month << 32) & 0xFF0000FFFFFFFFFFLL | ((unint64_t)day << 40) & 0xFF00FFFFFFFFFFFFLL | ((unint64_t)hour << 48) | (minute << 56);
  double v12 = (double)second;
  if (!aTimeZone) {
    v10 = (NSTimeZone *)[MEMORY[0x189604020] defaultTimeZone];
  }
  v14.second = v12;
  *(void *)&v14.year = v11;
  self->_timeIntervalSinceReferenceDate = CFGregorianDateGetAbsoluteTime(v14, (CFTimeZoneRef)v10);
  self->_timeZone = v10;
  if (!self->_formatString) {
    self->_formatString = (NSString *)@"%Y-%m-%d %H:%M:%S %z";
  }
  return self;
}

+ (id)calendarDate
{
  return (id)[objc_allocWithZone((Class)a1) init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithTimeIntervalSinceReferenceDate:",  self->_timeIntervalSinceReferenceDate);
  [v4 setTimeZone:self->_timeZone];
  [v4 setCalendarFormat:self->_formatString];
  return v4;
}

- (double)timeIntervalSinceReferenceDate
{
  return self->_timeIntervalSinceReferenceDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)aTimeZone
{
  objc_super v3 = aTimeZone;
  if (!aTimeZone) {
    objc_super v3 = (NSTimeZone *)[MEMORY[0x189604020] defaultTimeZone];
  }
  uint64_t v5 = v3;

  self->_timeZone = v3;
}

- (NSString)calendarFormat
{
  return self->_formatString;
}

- (void)setCalendarFormat:(NSString *)format
{
  uint64_t v5 = self->_formatString;
  if (format) {
    v6 = -[NSString copyWithZone:](format, "copyWithZone:", 0LL);
  }
  else {
    v6 = (NSString *)@"%Y-%m-%d %H:%M:%S %z";
  }
  self->_formatString = v6;
}

- (NSInteger)dayOfCommonEra
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  return (uint64_t)((timeIntervalSinceReferenceDate
                  + (double)-[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self))
                 / 86400.0
                 + 730486.0);
}

- (NSInteger)yearOfCommonEra
{
  return CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone).year;
}

- (NSInteger)monthOfYear
{
  return (uint64_t)((unint64_t)*(_OWORD *)&CFAbsoluteTimeGetGregorianDate( self->_timeIntervalSinceReferenceDate,  (CFTimeZoneRef)self->_timeZone) << 24) >> 56;
}

- (NSInteger)dayOfMonth
{
  return (uint64_t)((unint64_t)*(_OWORD *)&CFAbsoluteTimeGetGregorianDate( self->_timeIntervalSinceReferenceDate,  (CFTimeZoneRef)self->_timeZone) << 16) >> 56;
}

- (NSInteger)dayOfWeek
{
  return CFAbsoluteTimeGetDayOfWeek(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) % 7;
}

- (NSInteger)dayOfYear
{
  return CFAbsoluteTimeGetDayOfYear(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone);
}

- (NSInteger)hourOfDay
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  uint64_t v3 = -[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self);
  double v4 = (timeIntervalSinceReferenceDate + (double)v3) / 3600.0
     - floor((timeIntervalSinceReferenceDate + (double)v3) / 3600.0 / 24.0) * 24.0;
  else {
    return (uint64_t)v4 + 24;
  }
}

- (NSInteger)minuteOfHour
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  uint64_t v3 = -[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self);
  double v4 = (timeIntervalSinceReferenceDate + (double)v3) / 60.0
     - floor((timeIntervalSinceReferenceDate + (double)v3) / 60.0 / 60.0) * 60.0;
  else {
    return (uint64_t)v4 + 60;
  }
}

- (NSInteger)secondOfMinute
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  uint64_t v3 = -[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self);
  double v4 = timeIntervalSinceReferenceDate + (double)v3 - floor((timeIntervalSinceReferenceDate + (double)v3) / 60.0) * 60.0;
  else {
    return (uint64_t)v4 + 60;
  }
}

- (int64_t)microsecondOfSecond
{
  return (uint64_t)((self->_timeIntervalSinceReferenceDate - floor(self->_timeIntervalSinceReferenceDate)) * 1000000.0
                 + 0.5);
}

+ (id)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone
{
  return (id)[objc_allocWithZone((Class)a1) initWithYear:year month:month day:day hour:hour minute:minute second:second timeZone:aTimeZone];
}

- (NSCalendarDate)dateByAddingYears:(NSInteger)year months:(NSInteger)month days:(NSInteger)day hours:(NSInteger)hour minutes:(NSInteger)minute seconds:(NSInteger)second
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  timeZone = self->_timeZone;
  units.years = year;
  units.months = month;
  units.days = day;
  units.hours = hour;
  units.minutes = minute;
  units.seconds = (double)second;
  double v11 = CFAbsoluteTimeAddGregorianUnits(timeIntervalSinceReferenceDate, (CFTimeZoneRef)timeZone, &units);
  double v12 = (void *)[objc_allocWithZone((Class)objc_opt_class()) initWithTimeIntervalSinceReferenceDate:v11];
  [v12 setTimeZone:self->_timeZone];
  [v12 setCalendarFormat:self->_formatString];
  return (NSCalendarDate *)v12;
}

- (void)years:(NSInteger *)yp months:(NSInteger *)mop days:(NSInteger *)dp hours:(NSInteger *)hp minutes:(NSInteger *)mip seconds:(NSInteger *)sp sinceDate:(NSCalendarDate *)date
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!date)
  {
    v19 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: sinceDate: argument cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v19);
  }

  CFOptionFlags v16 = (yp != 0LL) | (2LL * (mop != 0LL)) | (4LL * (dp != 0LL)) | (8LL * (hp != 0LL)) | (16LL * (mip != 0LL)) | (32LL * (sp != 0LL));
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  -[NSCalendarDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  CFAbsoluteTimeGetDifferenceAsGregorianUnits( &v20,  timeIntervalSinceReferenceDate,  v18,  (CFTimeZoneRef)self->_timeZone,  v16);
  if (yp) {
    *yp = v20.years;
  }
  if (mop) {
    *mop = v20.months;
  }
  if (dp) {
    *dp = v20.days;
  }
  if (hp) {
    *hp = v20.hours;
  }
  if (mip) {
    *mip = v20.minutes;
  }
  if (sp) {
    *sp = (uint64_t)v20.seconds;
  }
}

- (id)addTimeInterval:(double)a3
{
  v6 = +[NSCalendarDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSCalendarDate,  "dateWithTimeIntervalSinceReferenceDate:",  v5 + a3);
  -[NSCalendarDate setTimeZone:](v6, "setTimeZone:", self->_timeZone);
  -[NSCalendarDate setCalendarFormat:](v6, "setCalendarFormat:", self->_formatString);
  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    -[NSCalendarDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
    objc_msgSend(a3, "encodeDouble:forKey:", @"NS.time");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSCalendarDate timeZone](self, "timeZone"), @"NS.timezone");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSCalendarDate calendarFormat](self, "calendarFormat"),  @"NS.format");
  }

  else
  {
    [a3 encodeValueOfObjCType:"d" at:&self->_timeIntervalSinceReferenceDate];
    [a3 encodeValueOfObjCType:"@" at:&self->_timeZone];
    [a3 encodeValueOfObjCType:"@" at:&self->_formatString];
  }

- (NSCalendarDate)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    double v5 = 0.0;
    if ([a3 containsValueForKey:@"NS.time"])
    {
      [a3 decodeDoubleForKey:@"NS.time"];
      double v5 = v6;
    }

    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.timezone"];
    uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.format"];
    if ([a3 error])
    {
      return 0LL;
    }

    else
    {
      v9 = -[NSCalendarDate initWithTimeIntervalSinceReferenceDate:]( self,  "initWithTimeIntervalSinceReferenceDate:",  v5);
      self = v9;
      if (v9)
      {
        -[NSCalendarDate setTimeZone:](v9, "setTimeZone:", v7);
        -[NSCalendarDate setCalendarFormat:](self, "setCalendarFormat:", v8);
      }
    }
  }

  else
  {
    [a3 decodeValueOfObjCType:"d" at:&self->_timeIntervalSinceReferenceDate size:8];
    [a3 decodeValueOfObjCType:"@" at:&self->_timeZone size:8];
    [a3 decodeValueOfObjCType:"@" at:&self->_formatString size:8];
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[NSCalendarDate descriptionWithCalendarFormat:locale:]( self,  "descriptionWithCalendarFormat:locale:",  self->_formatString,  0LL);
}

- (NSString)descriptionWithLocale:(id)locale
{
  return -[NSCalendarDate descriptionWithCalendarFormat:locale:]( self,  "descriptionWithCalendarFormat:locale:",  self->_formatString,  locale);
}

- (NSString)descriptionWithCalendarFormat:(NSString *)format
{
  return -[NSCalendarDate descriptionWithCalendarFormat:locale:]( self,  "descriptionWithCalendarFormat:locale:",  format,  0LL);
}

- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format
{
  return -[NSCalendarDate initWithString:calendarFormat:locale:]( self,  "initWithString:calendarFormat:locale:",  description,  format,  0LL);
}

+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format
{
  return (id)[objc_allocWithZone((Class)a1) initWithString:description calendarFormat:format locale:0];
}

+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale
{
  return (id)[objc_allocWithZone((Class)a1) initWithString:description calendarFormat:format locale:locale];
}

- (NSString)descriptionWithCalendarFormat:(NSString *)format locale:(id)locale
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  double v5 = (NSString *)(id)[objc_allocWithZone((Class)NSMutableString) init];
  NSUInteger v6 = -[NSString length](format, "length");
  uint64_t v7 = +[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet");
  if (v6)
  {
    uint64_t v8 = v7;
    NSUInteger v9 = 0LL;
    allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      uint64_t v10 = -[NSString rangeOfString:options:range:]( format,  "rangeOfString:options:range:",  @"%",  0LL,  v9,  v6 - v9);
      uint64_t v12 = v11;
      if (v11) {
        NSUInteger v13 = v10;
      }
      else {
        NSUInteger v13 = v6;
      }
      if (v13 > v9) {
        -[NSString replaceCharactersInRange:withString:]( v5,  "replaceCharactersInRange:withString:",  -[NSString length](v5, "length"),  0LL,  -[NSString substringWithRange:](format, "substringWithRange:", v9, v13 - v9));
      }
      NSUInteger v9 = v13 + v12;
      if (v12)
      {
        NSUInteger v14 = v13 + v12;
        if (v9 >= v6)
        {
          __str[0] = 0;
        }

        else
        {
          while (1)
          {
            BOOL v15 = -[NSCharacterSet characterIsMember:]( v8,  "characterIsMember:",  -[NSString characterAtIndex:](format, "characterAtIndex:", v14));
            BOOL v16 = v15;
            if (!v15) {
              break;
            }
            if (++v14 >= v6)
            {
              NSUInteger v14 = v6;
              goto LABEL_15;
            }
          }

          if (v9 >= v14)
          {
            __str[0] = 0;
            goto LABEL_18;
          }

- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale
{
  v88[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:");
  uint64_t v8 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", format);
  uint64_t v81 = 0LL;
  v77 = +[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet");
  if (oldInitWithString_doExcelLittleY == -1)
  {
    if (objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "objectForKey:",  @"NSUseExcelTwoDigitYearSemantics"))
    {
      uint64_t v9 = objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSUseExcelTwoDigitYearSemantics");
    }

    else
    {
      uint64_t v9 = 1LL;
    }

    oldInitWithString_doExcelLittleY = v9;
  }

  uint64_t v82 = 0LL;
  uint64_t v83 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v85 = 0LL;
  uint64_t v86 = 0LL;
  uint64_t v87 = 0LL;
  uint64_t v10 = -1LL;
  v88[0] = -1LL;
  v73 = format;
  if (!-[NSScanner isAtEnd](v8, "isAtEnd"))
  {
    uint64_t v74 = 0LL;
    NSUInteger v14 = @"%";
    allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
    while (1)
    {
      if (-[NSScanner isAtEnd](v7, "isAtEnd")) {
        goto LABEL_136;
      }
      skipWhitespace(v7);
      if (-[NSScanner isAtEnd](v7, "isAtEnd")) {
        goto LABEL_136;
      }
      if (!-[NSScanner scanString:intoString:](v8, "scanString:intoString:", v14, 0LL))
      {
        uint64_t v17 = -[NSScanner scanLocation](v8, "scanLocation");
        uint64_t v18 = -[NSScanner scanLocation](v7, "scanLocation");
        if (-[NSScanner isAtEnd](v8, "isAtEnd") && !-[NSScanner isAtEnd](v7, "isAtEnd")) {
          goto LABEL_136;
        }
        v19 = v14;
        int v20 = -[NSString characterAtIndex:](format, "characterAtIndex:", v17);
        NSUInteger v14 = v19;
        -[NSScanner setScanLocation:](v7, "setScanLocation:", v18 + 1);
        uint64_t v21 = v17 + 1;
        goto LABEL_109;
      }

      if (-[NSScanner isAtEnd](v8, "isAtEnd")) {
        goto LABEL_136;
      }
      -[NSScanner scanCharactersFromSet:intoString:](v8, "scanCharactersFromSet:intoString:", v77, 0LL);
      int v15 = -[NSString characterAtIndex:](format, "characterAtIndex:", -[NSScanner scanLocation](v8, "scanLocation"));
      switch(v15)
      {
        case 'A':
          v23 = (void *)[locale objectForKey:@"NSWeekDayNameArray"];
          if (v23) {
            goto LABEL_46;
          }
          uint64_t v24 = objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"Sunday",  @"Monday",  @"Tuesday",  @"Wednesday",  @"Thursday",  @"Friday",  @"Saturday",  0);
          goto LABEL_45;
        case 'B':
          double v25 = (void *)[locale objectForKey:@"NSMonthNameArray"];
          if (v25) {
            goto LABEL_53;
          }
          uint64_t v26 = objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"January",  @"February",  @"March",  @"April",  @"May",  @"June",  @"July",  @"August",  @"September",  @"October",  @"November",  @"December",  0);
          goto LABEL_52;
        case 'C':
        case 'D':
        case 'E':
        case 'G':
        case 'J':
        case 'K':
        case 'L':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case '[':
        case '\\':
        case ']':
        case '^':
        case '_':
          goto LABEL_136;
        case 'F':
          BOOL v16 = &v82;
          int64_t v27 = v7;
          uint64_t v28 = 3LL;
          goto LABEL_64;
        case 'H':
        case 'I':
          BOOL v16 = &v85;
          goto LABEL_63;
        case 'M':
          BOOL v16 = &v84;
          goto LABEL_63;
        case 'S':
          BOOL v16 = &v83;
          goto LABEL_63;
        case 'X':
          uint64_t v29 = [locale objectForKey:@"NSTimeDateFormatString"];
          BOOL v30 = v29 == 0;
          NSInteger v31 = @"%H:%M:%S %Z";
          goto LABEL_74;
        case 'Y':
          NSInteger v32 = (void *)[locale objectForKey:@"AppleLocale"];
          if (v32)
          {
            id v33 = v32;
            if ([v32 isEqualToString:@"ja_JP_TRADITIONAL"])
            {
              uint64_t v34 = -[NSString substringFromIndex:]( description,  "substringFromIndex:",  -[NSScanner scanLocation](v7, "scanLocation"));
              BOOL v35 = CFLocaleCreate(0LL, @"ja_JP_TRADITIONAL");
              v36 = CFDateFormatterCreate(allocator, v35, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
              CFDateFormatterSetFormat(v36, @"Gy");
              CFRelease(v35);
              rangep.location = 0LL;
              rangep.length = -[NSString length](v34, "length");
              if (!CFDateFormatterGetAbsoluteTimeFromString(v36, (CFStringRef)v34, &rangep, &atp)) {
                goto LABEL_148;
              }
              -[NSScanner setScanLocation:]( v7,  "setScanLocation:",  -[NSScanner scanLocation](v7, "scanLocation") + rangep.length);
              NSInteger v37 = CFTimeZoneCopyDefault();
              SInt32 year = CFAbsoluteTimeGetGregorianDate(atp, v37).year;
              CFRelease(v37);
              v88[0] = year;
              CFRelease(v36);
              NSUInteger v14 = @"%";
            }

            else
            {
              if ([v33 isEqualToString:@"th_TH_TRADITIONAL"])
              {
                uint64_t v49 = v88[0] - 543LL;
                v88[0] -= 543LL;
                goto LABEL_97;
              }
            }
          }

          else if (!-[NSScanner _scanDecimal:into:](v7, "_scanDecimal:into:", 4LL, v88))
          {
            goto LABEL_136;
          }

          uint64_t v49 = v88[0];
LABEL_97:
          if (v49 < 1) {
            goto LABEL_136;
          }
          goto LABEL_108;
        case 'Z':
          skipWhitespace(v7);
          if (!-[NSScanner scanUpToCharactersFromSet:intoString:]( v7,  "scanUpToCharactersFromSet:intoString:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"),  &v81)) {
            goto LABEL_136;
          }
          goto LABEL_108;
        case 'a':
          v23 = (void *)[locale objectForKey:@"NSShortWeekDayNameArray"];
          if (v23) {
            goto LABEL_46;
          }
          uint64_t v24 = objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"Sun",  @"Mon",  @"Tue",  @"Wed",  @"Thu",  @"Fri",  @"Sat",  0);
LABEL_45:
          v23 = (void *)v24;
LABEL_46:
          uint64_t v39 = 0LL;
          while (!-[NSScanner scanString:intoString:]( v7,  "scanString:intoString:",  [v23 objectAtIndex:v39],  0))
          {
            if (++v39 == 7) {
              goto LABEL_136;
            }
          }

          goto LABEL_108;
        case 'b':
          double v25 = (void *)[locale objectForKey:@"NSShortMonthNameArray"];
          if (v25) {
            goto LABEL_53;
          }
          uint64_t v26 = objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"Jan",  @"Feb",  @"Mar",  @"Apr",  @"May",  @"Jun",  @"Jul",  @"Aug",  @"Sep",  @"Oct",  @"Nov",  @"Dec",  0);
LABEL_52:
          double v25 = (void *)v26;
LABEL_53:
          uint64_t v40 = 1LL;
          while (!-[NSScanner scanString:intoString:]( v7,  "scanString:intoString:",  [v25 objectAtIndex:v40 - 1],  0))
          {
            if (++v40 == 13) {
              goto LABEL_136;
            }
          }

          uint64_t v87 = v40;
          goto LABEL_108;
        case 'c':
          uint64_t v29 = [locale objectForKey:@"NSTimeDateFormatString"];
          BOOL v30 = v29 == 0;
          NSInteger v31 = @"%a %b %d %H:%M:%S %Z %Y";
LABEL_74:
          if (v30) {
            v42 = (void *)v31;
          }
          else {
            v42 = (void *)v29;
          }
          -[NSScanner setScanLocation:](v8, "setScanLocation:", -[NSScanner scanLocation](v8, "scanLocation") + 1);
          format = (NSString *)objc_msgSend( v42,  "stringByAppendingString:",  -[NSScanner _remainingString](v8, "_remainingString"));
          uint64_t v8 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", format);
          goto LABEL_110;
        case 'd':
          BOOL v16 = &v86;
LABEL_63:
          int64_t v27 = v7;
          uint64_t v28 = 2LL;
LABEL_64:
          goto LABEL_108;
        case 'e':
          if (!-[NSScanner scanInt:](v7, "scanInt:", &v80)) {
            goto LABEL_136;
          }
          uint64_t v86 = v80;
          goto LABEL_108;
        default:
          switch(v15)
          {
            case 'j':
              if (!-[NSScanner scanInt:](v7, "scanInt:", &v80)) {
                goto LABEL_136;
              }
              uint64_t v74 = v80;
              goto LABEL_108;
            case 'k':
            case 'l':
            case 'n':
            case 'o':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
              goto LABEL_136;
            case 'm':
              BOOL v16 = &v87;
              goto LABEL_63;
            case 'p':
              v41 = (void *)[locale objectForKey:@"NSAMPMDesignation"];
              if (!v41) {
                v41 = (void *)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", @"AM", @"PM", 0);
              }
              if (-[NSScanner scanString:intoString:]( v7,  "scanString:intoString:",  [v41 objectAtIndex:1],  0))
              {
                if (v85 <= 11) {
                  v85 += 12LL;
                }
              }

              else
              {
                if (!-[NSScanner scanString:intoString:]( v7,  "scanString:intoString:",  [v41 objectAtIndex:0],  0)) {
                  goto LABEL_136;
                }
                if (v85 == 12) {
                  uint64_t v85 = 0LL;
                }
              }

              goto LABEL_108;
            case 'w':
              uint64_t v22 = -[NSScanner scanLocation](v7, "scanLocation");
              goto LABEL_72;
            case 'x':
              uint64_t v29 = [locale objectForKey:@"NSTimeDateFormatString"];
              BOOL v30 = v29 == 0;
              NSInteger v31 = @"%a %b %d %Y";
              goto LABEL_74;
            case 'y':
              uint64_t v43 = (void *)[locale objectForKey:@"AppleLocale"];
              if (!v43)
              {
LABEL_102:
                if (oldInitWithString_doExcelLittleY)
                {
                  uint64_t v51 = 1900LL;
                  if (v88[0] < 30LL) {
                    uint64_t v51 = 2000LL;
                  }
                  uint64_t v50 = v51 + v88[0];
                }

                else
                {
                  uint64_t v50 = v88[0] + 1900LL;
                }

                goto LABEL_107;
              }

              NSInteger v44 = v43;
              if ([v43 isEqualToString:@"ja_JP_TRADITIONAL"])
              {
                v45 = -[NSString substringFromIndex:]( description,  "substringFromIndex:",  -[NSScanner scanLocation](v7, "scanLocation"));
                uint64_t v46 = CFLocaleCreate(0LL, @"ja_JP_TRADITIONAL");
                v36 = CFDateFormatterCreate(allocator, v46, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
                CFDateFormatterSetFormat(v36, @"Gy");
                CFRelease(v46);
                rangep.location = 0LL;
                rangep.length = -[NSString length](v45, "length");
                if (!CFDateFormatterGetAbsoluteTimeFromString(v36, (CFStringRef)v45, &rangep, &atp))
                {
LABEL_148:
                  CFRelease(v36);
                  goto LABEL_136;
                }

                -[NSScanner setScanLocation:]( v7,  "setScanLocation:",  -[NSScanner scanLocation](v7, "scanLocation") + rangep.length);
                uint64_t v47 = CFTimeZoneCopyDefault();
                SInt32 v48 = CFAbsoluteTimeGetGregorianDate(atp, v47).year;
                CFRelease(v47);
                v88[0] = v48;
                CFRelease(v36);
                NSUInteger v14 = @"%";
                goto LABEL_108;
              }

              uint64_t v50 = v88[0] + 1957LL;
LABEL_107:
              v88[0] = v50;
LABEL_108:
              uint64_t v21 = -[NSScanner scanLocation](v8, "scanLocation") + 1;
LABEL_109:
              -[NSScanner setScanLocation:](v8, "setScanLocation:", v21);
LABEL_110:
              if (-[NSScanner isAtEnd](v8, "isAtEnd")) {
                goto LABEL_8;
              }
              break;
            case 'z':
              if (!-[NSScanner scanInt:](v7, "scanInt:", &rangep)) {
                goto LABEL_136;
              }
              if ((rangep.location & 0x80000000) != 0) {
                uint64_t v10 = (int)(-60 * (-LODWORD(rangep.location) % 0x64u) - 3600 * (-LODWORD(rangep.location) / 0x64u));
              }
              else {
                uint64_t v10 = 60 * (LODWORD(rangep.location) % 0x64) + 3600 * (LODWORD(rangep.location) / 0x64);
              }
              goto LABEL_108;
            default:
              if (v15 != 37) {
                goto LABEL_136;
              }
              uint64_t v22 = -[NSScanner scanLocation](v7, "scanLocation");
LABEL_72:
              -[NSScanner setScanLocation:](v7, "setScanLocation:", v22 + 1);
              goto LABEL_108;
          }

          break;
      }
    }
  }

  uint64_t v74 = 0LL;
LABEL_8:
  if (!-[NSScanner isAtEnd](v8, "isAtEnd")) {
    goto LABEL_136;
  }
  if (v81)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x189604020], "timeZoneWithName:");
    uint64_t v12 = v74;
    if (v11) {
      goto LABEL_116;
    }
    uint64_t v13 = [MEMORY[0x189604020] timeZoneWithAbbreviation:v81];
  }

  else
  {
    uint64_t v12 = v74;
    if (v10 == -1) {
      uint64_t v13 = [MEMORY[0x189604020] defaultTimeZone];
    }
    else {
      uint64_t v13 = [MEMORY[0x189604020] timeZoneForSecondsFromGMT:v10];
    }
  }

  uint64_t v11 = v13;
LABEL_116:
  uint64_t v52 = v88[0];
  if (v88[0] == -1LL)
  {
    uint64_t v52 = objc_msgSend(+[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate"), "yearOfCommonEra");
    v88[0] = v52;
    if (v12)
    {
LABEL_118:
      uint64_t v53 = v52 - 1;
      uint64_t v54 = v52 + 2;
      if (v52 >= 1) {
        uint64_t v54 = v52 - 1;
      }
      uint64_t v55 = v12 + 365 * (v52 - 1) + (v54 >> 2);
      uint64_t v56 = ((unsigned __int128)(v53 * (__int128)0x5C28F5C28F5C28F5LL) >> 64) - v52 + 1;
      uint64_t v57 = v55 + v53 / 400 + (v56 >> 6) + ((unint64_t)v56 >> 63);
      uint64_t v58 = ((v57 / 366) << 16) + 0x10000;
      int64_t v59 = v57 / 366 - 1;
      unsigned int v60 = ((v57 / 366) << 16) - 0x10000;
      do
      {
        uint64_t v61 = absolute_from_gregorian(v58 & 0xFFFF0000 | 0x101);
        LODWORD(v58) = v58 + 0x10000;
        ++v59;
        v60 += 0x10000;
      }

      while (v61 <= v57);
      uint64_t v62 = 0LL;
      int64_t v63 = v59 & 3;
      uint64_t v64 = v59 % 400;
      unsigned __int8 v65 = 1;
      if ((v59 & 3) == 0) {
        goto LABEL_125;
      }
LABEL_130:
      for (unsigned __int8 i = days_per_month[v62]; ; unsigned __int8 i = 29)
      {
        int v67 = v65;
        int64_t v59 = v59 & 0xFFFFFFFF00000000LL | (v60 + v65 + (i << 8));
        if (absolute_from_gregorian(v59) >= v57) {
          break;
        }
        ++v62;
        unsigned __int8 v65 = v67 + 1;
        if (v63) {
          goto LABEL_130;
        }
LABEL_125:
        if (v62 != 1 || v64 == 100 || v64 == 300 || v64 == 200) {
          goto LABEL_130;
        }
      }

      uint64_t v68 = (v62 + 1);
      char v69 = absolute_from_gregorian(v67 + v60 + 256);
      if (v87 && v87 != v68 || (uint64_t v87 = (v62 + 1), v86) && v86 != (v57 - v69 + 1))
      {
LABEL_136:

        return 0LL;
      }

      uint64_t v86 = (v57 - v69 + 1);
      if ((_BYTE)v62 == 0xFF) {
        goto LABEL_140;
      }
      goto LABEL_141;
    }
  }

  else if (v12)
  {
    goto LABEL_118;
  }

  uint64_t v68 = v87;
  if (!v87)
  {
LABEL_140:
    uint64_t v68 = 1LL;
    uint64_t v87 = 1LL;
  }

+ (NSCalendarDate)dateWithNaturalLanguageString:(id)a3 date:(id)a4 locale:(id)a5
{
  id v123 = a5;
  v130[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)objc_msgSend( a3,  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if ([v8 isEqual:@"now"])
  {
    if (a4) {
      return (NSCalendarDate *)a4;
    }
    return (NSCalendarDate *)+[NSCalendarDate calendarDate](&OBJC_CLASS___NSCalendarDate, "calendarDate");
  }

  if ([v8 isEqual:@"today"])
  {
    if (!a4) {
      a4 = +[NSCalendarDate calendarDate](&OBJC_CLASS___NSCalendarDate, "calendarDate");
    }
    uint64_t v10 = [a4 yearOfCommonEra];
    uint64_t v11 = [a4 monthOfYear];
    uint64_t v12 = [a4 dayOfMonth];
    return (NSCalendarDate *)objc_msgSend( a1,  "dateWithYear:month:day:hour:minute:second:timeZone:",  v10,  v11,  v12,  0,  0,  0,  objc_msgSend(MEMORY[0x189604020], "defaultTimeZone"));
  }

  v130[0] = 0LL;
  uint64_t v13 = (__CFString *)objc_msgSend( (id)objc_msgSend(v123, "objectForKey:", @"NSDateTimeOrdering"),  "uppercaseString");
  if (!v13) {
    uint64_t v13 = @"MDYH";
  }
  -[__CFString getCharacters:range:](v13, "getCharacters:range:", v130, 0LL, 4LL);
  NSUInteger v14 = +[NSCharacterSet letterCharacterSet](&OBJC_CLASS___NSCharacterSet, "letterCharacterSet");
  v124 = +[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet");
  v119 = +[NSCharacterSet alphanumericCharacterSet](&OBJC_CLASS___NSCharacterSet, "alphanumericCharacterSet");
  id v15 =  -[NSMutableCharacterSet mutableCopyWithZone:]( +[NSMutableCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "decimalDigitCharacterSet"),  "mutableCopyWithZone:",  0LL);
  BOOL v16 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", a3);
  uint64_t v17 = (void *)[MEMORY[0x189603FA8] array];
  *(void *)&__int128 v18 = -1LL;
  *((void *)&v18 + 1) = -1LL;
  __int128 v127 = v18;
  __int128 v128 = v18;
  v121 = v15;
  [v15 addCharactersInString:@"-+"];
  if (dateWithNaturalLanguageString_date_locale__doExcelLittleY == -1)
  {
    if (objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "objectForKey:",  @"NSUseExcelTwoDigitYearSemantics"))
    {
      uint64_t v19 = objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSUseExcelTwoDigitYearSemantics");
    }

    else
    {
      uint64_t v19 = 1LL;
    }

    dateWithNaturalLanguageString_date_locale__doExcelLittleY = v19;
  }

  memset(v129, 0, sizeof(v129));
  -[NSScanner setCharactersToBeSkipped:](v16, "setCharactersToBeSkipped:", 0LL);
  if (!-[NSScanner isAtEnd](v16, "isAtEnd"))
  {
    do
    {
      BOOL v20 = -[NSScanner scanCharactersFromSet:intoString:]( v16,  "scanCharactersFromSet:intoString:",  +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"),  0LL);
      if (-[NSScanner isAtEnd](v16, "isAtEnd")) {
        break;
      }
      if (!-[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", v124, &v126)
        && (!v20
         || !-[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", v121, &v126))
        && !-[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", v14, &v126)
        && !-[NSScanner scanUpToCharactersFromSet:intoString:]( v16,  "scanUpToCharactersFromSet:intoString:",  v119,  &v126))
      {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"format error" reason:@"internal error" userInfo:0]);
        return (NSCalendarDate *)buildTokenMapWithDictionary(v108);
      }

      [v17 addObject:v126];
    }

    while (!-[NSScanner isAtEnd](v16, "isAtEnd"));
  }

  id v110 = a1;
  uint64_t v125 = [v17 count];
  if (v125 <= 0)
  {
    uint64_t v24 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v67 = 0LL;
    uint64_t v25 = -1LL;
    *(void *)&__int128 v127 = -1LL;
    uint64_t v68 = -1LL;
    goto LABEL_125;
  }

  id v111 = a4;
  uint64_t v112 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v115 = -1LL;
  uint64_t v116 = -1LL;
  uint64_t v117 = -1LL;
  uint64_t v118 = -1LL;
  uint64_t v120 = -1LL;
  uint64_t v25 = -1LL;
  v122 = v14;
  do
  {
    v126 = (__CFString *)[v17 objectAtIndex:v23];
    uint64_t v26 = -[__CFString characterAtIndex:](v126, "characterAtIndex:", 0LL);
    if (-[NSCharacterSet characterIsMember:](v14, "characterIsMember:", v26))
    {
      int64_t v27 = v126;
      uint64_t v28 = buildTokenMapWithDictionary(v123);
      Value = CFDictionaryGetValue(v28, (const void *)-[__CFString lowercaseString](v27, "lowercaseString"));
      if (Value && (unsigned __int16)Value != 65LL)
      {
        v129[(unsigned __int16)Value - 65] = 1;
LABEL_29:
        NSUInteger v14 = v122;
        goto LABEL_58;
      }

      if (-[__CFString isEqual:](v126, "isEqual:", @"GMT"))
      {
        uint64_t v33 = v23 + 1;
        uint64_t v34 = [v17 count];
        NSUInteger v14 = v122;
        if (v23 + 1 < v34
          && objc_msgSend( v121,  "characterIsMember:",  objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v23 + 1), "characterAtIndex:", 0)))
        {
          v23 += 2LL;
          uint64_t v35 = [v17 count];
          v113 = (void *)MEMORY[0x189604020];
          v36 = (void *)objc_msgSend(@"GMT", "stringByAppendingString:", objc_msgSend(v17, "objectAtIndex:", v33));
          if (v23 >= v35)
          {
            uint64_t v24 = [v113 timeZoneWithAbbreviation:v36];
            uint64_t v23 = v33;
          }

          else
          {
            uint64_t v24 = objc_msgSend( v113,  "timeZoneWithAbbreviation:",  objc_msgSend(v36, "stringByAppendingString:", objc_msgSend(v17, "objectAtIndex:", v23)));
          }

          goto LABEL_29;
        }

        NSInteger v44 = (void *)MEMORY[0x189604020];
        v45 = @"GMT";
      }

      else
      {
        v42 = (void *)[MEMORY[0x189604020] abbreviationDictionary];
        uint64_t v43 = [v42 objectForKey:v126];
        NSUInteger v14 = v122;
        if (!v43) {
          goto LABEL_58;
        }
        NSInteger v44 = (void *)MEMORY[0x189604020];
        v45 = v126;
      }

      uint64_t v41 = [v44 timeZoneWithAbbreviation:v45];
LABEL_57:
      uint64_t v24 = v41;
      goto LABEL_58;
    }

    if (!-[NSCharacterSet characterIsMember:](v124, "characterIsMember:", v26))
    {
      if (![v121 characterIsMember:v26])
      {
        -[NSScanner scanUpToCharactersFromSet:intoString:](v16, "scanUpToCharactersFromSet:intoString:", v119, 0LL);
        goto LABEL_58;
      }

      uint64_t v37 = -[__CFString integerValue](v126, "integerValue");
      if (v37 >= 0) {
        unint64_t v38 = v37;
      }
      else {
        unint64_t v38 = -v37;
      }
      uint64_t v39 = -3600LL;
      if (v37 >= 0) {
        uint64_t v39 = 3600LL;
      }
      uint64_t v40 = -60LL;
      if (v37 >= 0) {
        uint64_t v40 = 60LL;
      }
      uint64_t v41 = [MEMORY[0x189604020] timeZoneForSecondsFromGMT:v38 % 0x64 * v40 + v38 / 0x64 * v39];
      goto LABEL_57;
    }

    uint64_t v30 = -[__CFString integerValue](v126, "integerValue");
    uint64_t v31 = v30;
    if (v30 < 32)
    {
      if (v30 >= 24 && v120 != -1)
      {
        uint64_t v112 = v30;
        goto LABEL_58;
      }

      uint64_t v114 = v24;
      if (v23 + 1 >= v125 || v30 >= 24)
      {
        uint64_t v49 = v115;
        uint64_t v50 = v116;
        if (v115 == -1) {
          uint64_t v51 = v30;
        }
        else {
          uint64_t v51 = v115;
        }
        if (v116 == -1)
        {
          uint64_t v51 = v115;
          uint64_t v52 = v30;
        }

        else
        {
          uint64_t v52 = v116;
        }

        uint64_t v53 = v117;
        uint64_t v54 = v118;
        if (v117 == -1)
        {
          uint64_t v51 = v115;
          uint64_t v52 = v116;
          uint64_t v55 = v30;
        }

        else
        {
          uint64_t v55 = v117;
        }

        if (v118 != -1)
        {
          uint64_t v49 = v51;
          uint64_t v50 = v52;
        }

        uint64_t v115 = v49;
        uint64_t v116 = v50;
        if (v118 == -1) {
          uint64_t v54 = v30;
        }
        else {
          uint64_t v53 = v55;
        }
        uint64_t v117 = v53;
        uint64_t v118 = v54;
        goto LABEL_113;
      }

      v126 = (__CFString *)[v17 objectAtIndex:v23 + 1];
      uint64_t v46 = -[__CFString characterAtIndex:](v126, "characterAtIndex:", 0LL);
      if ((_DWORD)v46 == 58)
      {
        if (v23 + 2 >= v125)
        {
          ++v23;
          goto LABEL_29;
        }

        uint64_t v109 = v23 + 2;
        v126 = (__CFString *)objc_msgSend(v17, "objectAtIndex:");
        uint64_t v47 = -[__CFString characterAtIndex:](v126, "characterAtIndex:", 0LL);
        if (-[NSCharacterSet characterIsMember:](v124, "characterIsMember:", v47))
        {
          uint64_t v48 = -[__CFString integerValue](v126, "integerValue");
          if (v48 > 59)
          {
            ++v23;
LABEL_115:
            uint64_t v25 = v31;
            goto LABEL_29;
          }

          uint64_t v63 = v48;
          if (v23 + 3 >= v125)
          {
            v23 += 2LL;
            uint64_t v21 = v48;
            goto LABEL_115;
          }

          v126 = (__CFString *)[v17 objectAtIndex:v23 + 3];
          uint64_t v64 = -[__CFString characterAtIndex:](v126, "characterAtIndex:", 0LL);
          if ((_DWORD)v64 == 58)
          {
            if (v23 + 4 >= v125)
            {
              v23 += 3LL;
              goto LABEL_118;
            }

            uint64_t v109 = v23 + 4;
            v126 = (__CFString *)objc_msgSend(v17, "objectAtIndex:");
            uint64_t v47 = -[__CFString characterAtIndex:](v126, "characterAtIndex:", 0LL);
            if (-[NSCharacterSet characterIsMember:](v124, "characterIsMember:", v47))
            {
              uint64_t v65 = -[__CFString integerValue](v126, "integerValue");
              if (v65 > 60)
              {
                v23 += 4LL;
LABEL_118:
                uint64_t v21 = v63;
                uint64_t v25 = v31;
                goto LABEL_29;
              }

              uint64_t v56 = -1LL;
              uint64_t v22 = v65;
            }

            else
            {
              uint64_t v56 = -1LL;
              uint64_t v109 = v23 + 3;
            }
          }

          else
          {
            uint64_t v47 = v64;
            uint64_t v56 = -1LL;
          }

          uint64_t v21 = v63;
LABEL_85:
          if (-[NSCharacterSet characterIsMember:](v122, "characterIsMember:", v47))
          {
            uint64_t v57 = v21;
            uint64_t v58 = v126;
            int64_t v59 = buildTokenMapWithDictionary(v123);
            unsigned int v60 = CFDictionaryGetValue(v59, (const void *)-[__CFString lowercaseString](v58, "lowercaseString"));
            unsigned int v61 = (unsigned __int16)v60;
            if (!v60) {
              unsigned int v61 = 65;
            }
            if ((v61 & 0xFFFE) == 0x76)
            {
              *((_BYTE *)&v122 + v61 + 7) = 1;
              uint64_t v23 = v109 + 1;
              NSUInteger v14 = v122;
              uint64_t v21 = v57;
              if (v56 != -1 && v31 == -1)
              {
                uint64_t v25 = v56;
LABEL_113:
                uint64_t v24 = v114;
                goto LABEL_58;
              }
            }

            else
            {
              uint64_t v23 = v109;
              NSUInteger v14 = v122;
              uint64_t v21 = v57;
            }
          }

          else
          {
            uint64_t v23 = v109;
            NSUInteger v14 = v122;
          }

          if (v56 != -1)
          {
            if (v118 == -1)
            {
              uint64_t v118 = v56;
            }

            else if (v117 == -1)
            {
              uint64_t v117 = v56;
            }

            else if (v116 == -1)
            {
              uint64_t v116 = v56;
            }

            else
            {
              uint64_t v62 = v115;
              if (v115 == -1) {
                uint64_t v62 = v56;
              }
              uint64_t v115 = v62;
            }
          }

          uint64_t v25 = v31;
          goto LABEL_113;
        }

        uint64_t v109 = v23 + 1;
      }

      else
      {
        uint64_t v47 = v46;
        uint64_t v109 = v23;
      }

      uint64_t v56 = v31;
      uint64_t v31 = v25;
      goto LABEL_85;
    }

    uint64_t v32 = v30 + 1900;
    uint64_t v120 = v32;
LABEL_58:
    ++v23;
  }

  while (v23 < v125);
  *(void *)&__int128 v128 = v116;
  *((void *)&v128 + 1) = v115;
  *(void *)&__int128 v127 = v118;
  *((void *)&v127 + 1) = v117;
  if (v129[1])
  {
    uint64_t v66 = 1LL;
    a4 = v111;
    uint64_t v67 = v112;
    uint64_t v68 = v120;
    goto LABEL_148;
  }

  a4 = v111;
  uint64_t v67 = v112;
  uint64_t v68 = v120;
  if (v129[2])
  {
    uint64_t v66 = 2LL;
    goto LABEL_148;
  }

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSCalendarDate;
    return -[NSDate replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return self;
}

@end