@interface NSDate
+ (BOOL)supportsSecureCoding;
+ (NSDate)allocWithZone:(_NSZone *)a3;
+ (NSDate)date;
+ (NSDate)dateWithDate:(id)a3;
+ (NSDate)dateWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date;
+ (NSDate)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;
+ (NSDate)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs;
+ (NSDate)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti;
+ (NSDate)distantFuture;
+ (NSDate)distantPast;
+ (NSDate)now;
+ (NSTimeInterval)timeIntervalSinceReferenceDate;
+ (id)dateWithString:(NSString *)aString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 toUnitGranularity:(unint64_t)a4;
- (BOOL)isEqualToDate:(NSDate *)otherDate;
- (BOOL)isInSameDayAsDate:(id)a3;
- (BOOL)isInToday;
- (BOOL)isInTomorrow;
- (BOOL)isInYesterday;
- (BOOL)isNSDate__;
- (NSComparisonResult)compare:(NSDate *)other;
- (NSDate)dateByAddingTimeInterval:(NSTimeInterval)ti;
- (NSDate)earlierDate:(NSDate *)anotherDate;
- (NSDate)initWithCoder:(NSCoder *)aDecoder;
- (NSDate)initWithDate:(id)a3;
- (NSDate)initWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date;
- (NSDate)initWithTimeIntervalSince1970:(NSTimeInterval)secs;
- (NSDate)initWithTimeIntervalSinceNow:(NSTimeInterval)secs;
- (NSDate)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti;
- (NSDate)laterDate:(NSDate *)anotherDate;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSTimeInterval)timeIntervalSince1970;
- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)anotherDate;
- (NSTimeInterval)timeIntervalSinceNow;
- (NSTimeInterval)timeIntervalSinceReferenceDate;
- (id)initWithString:(NSString *)description;
- (int64_t)compare:(id)a3 toUnitGranularity:(unint64_t)a4;
- (unint64_t)_cfTypeID;
- (unint64_t)hash;
@end

@implementation NSDate

- (BOOL)isNSDate__
{
  return 1;
}

- (unint64_t)_cfTypeID
{
  return 42LL;
}

+ (NSTimeInterval)timeIntervalSinceReferenceDate
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001;
}

+ (NSDate)distantFuture
{
  return (NSDate *)&_NSConstantDateDistantFuture;
}

+ (NSDate)distantPast
{
  return (NSDate *)&_NSConstantDateDistantPast;
}

+ (NSDate)now
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___NSDate);
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return  -[NSDate initWithTimeIntervalSinceReferenceDate:]( v2,  "initWithTimeIntervalSinceReferenceDate:",  (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

- (NSComparisonResult)compare:(NSDate *)other
{
  if (self == other) {
    return 0LL;
  }
  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  if (other) {
    -[NSDate timeIntervalSinceReferenceDate](other, "timeIntervalSinceReferenceDate");
  }
  else {
    double v6 = NAN;
  }
  if (v5 < v6) {
    return -1LL;
  }
  else {
    return (unint64_t)(v5 > v6);
  }
}

- (NSDate)earlierDate:(NSDate *)anotherDate
{
  double v6 = v5;
  if (anotherDate) {
    -[NSDate timeIntervalSinceReferenceDate](anotherDate, "timeIntervalSinceReferenceDate");
  }
  else {
    double v7 = NAN;
  }
  if (v6 <= v7) {
    return self;
  }
  else {
    return anotherDate;
  }
}

- (NSDate)laterDate:(NSDate *)anotherDate
{
  double v6 = v5;
  if (anotherDate) {
    -[NSDate timeIntervalSinceReferenceDate](anotherDate, "timeIntervalSinceReferenceDate");
  }
  else {
    double v7 = NAN;
  }
  if (v6 >= v7) {
    return self;
  }
  else {
    return anotherDate;
  }
}

- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)anotherDate
{
  double v5 = v4;
  if (anotherDate) {
    -[NSDate timeIntervalSinceReferenceDate](anotherDate, "timeIntervalSinceReferenceDate");
  }
  else {
    double v6 = NAN;
  }
  return v5 - v6;
}

- (NSTimeInterval)timeIntervalSinceNow
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  double v3 = v2;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return v3 - ((double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

- (NSTimeInterval)timeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (unint64_t)hash
{
  double v3 = -v2;
  if (v2 >= 0.0) {
    double v3 = v2;
  }
  double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v4, 1.84467441e19);
  if (v5 >= 0.0)
  {
    if (v5 > 0.0) {
      result += (unint64_t)v5;
    }
  }

  else
  {
    result -= (unint64_t)fabs(v5);
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else if (a3)
  {
    int v5 = _NSIsNSDate((uint64_t)a3);
    if (v5) {
      LOBYTE(v5) = -[NSDate isEqualToDate:](self, "isEqualToDate:", a3);
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isEqualToDate:(NSDate *)otherDate
{
  if (!otherDate) {
    return 0;
  }
  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  -[NSDate timeIntervalSinceReferenceDate](otherDate, "timeIntervalSinceReferenceDate");
  return v5 == v6;
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (!locale)
  {
    double v6 = CFLocaleCopyCurrent();
    os_unfair_lock_lock_with_options();
    BOOL v8 = (const __CFLocale *)descriptionWithLocale__cached_loc != v6 || descriptionWithLocale__cached_df == 0;
    char v9 = !v8;
    if (!v8)
    {
      v10 = (__CFDateFormatter *)CFRetain((CFTypeRef)descriptionWithLocale__cached_df);
      os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
      if (!v10)
      {
        double v7 = 0LL;
        goto LABEL_44;
      }

      int v11 = 0;
      goto LABEL_25;
    }

    int v11 = ++descriptionWithLocale__changeCounter;
    os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
    CFTimeZoneRef v13 = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0.0);
    CFTimeZoneRef v14 = v13;
    if (v13) {
      BOOL v15 = v6 == 0LL;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (!v13) {
        goto LABEL_28;
      }
    }

    else
    {
      v16 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v6,  kCFDateFormatterFullStyle,  kCFDateFormatterFullStyle);
      if (v16)
      {
        v10 = v16;
        CFDateFormatterSetProperty(v16, @"kCFDateFormatterTimeZoneKey", v14);
        CFDateFormatterSetFormat(v10, @"uuuu-MM-dd HH:mm:ss '+0000'");
        CFRelease(v14);
LABEL_25:
        CFDateFormatterCreateStringWithDate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v10, (CFDateRef)self);
        double v7 = (NSString *)_CFAutoreleasePoolAddObject();
        if ((v9 & 1) != 0) {
          goto LABEL_43;
        }
        char v17 = 0;
LABEL_29:
        os_unfair_lock_lock_with_options();
        if (descriptionWithLocale__changeCounter == v11)
        {
          if (descriptionWithLocale__cached_loc) {
            CFRelease((CFTypeRef)descriptionWithLocale__cached_loc);
          }
          if (v6) {
            CFTypeRef v18 = CFRetain(v6);
          }
          else {
            CFTypeRef v18 = 0LL;
          }
          descriptionWithLocale__cached_loc = (uint64_t)v18;
          if (descriptionWithLocale__cached_df) {
            CFRelease((CFTypeRef)descriptionWithLocale__cached_df);
          }
          if ((v17 & 1) != 0) {
            CFTypeRef v19 = 0LL;
          }
          else {
            CFTypeRef v19 = CFRetain(v10);
          }
          descriptionWithLocale__cached_df = (uint64_t)v19;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
        if ((v17 & 1) != 0)
        {
LABEL_44:
          if (!v6) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }

- (NSString)description
{
  return -[NSDate descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

+ (NSDate)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSDate == a1) {
    return (NSDate *)&___immutablePlaceholderDate;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDate;
  return (NSDate *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSDate)date
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc((Class)a1);
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (NSDate *)(id)[v2 initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001];
}

+ (NSDate)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti
{
  return (NSDate *)(id)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:ti];
}

+ (NSDate)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = objc_alloc((Class)a1);
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (NSDate *)(id)[v4 initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001 + secs];
}

- (NSDate)initWithTimeIntervalSinceNow:(NSTimeInterval)secs
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return -[NSDate initWithTimeIntervalSinceReferenceDate:]( self,  "initWithTimeIntervalSinceReferenceDate:",  (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001 + secs);
}

+ (NSDate)dateWithTimeIntervalSince1970:(NSTimeInterval)secs
{
  return (NSDate *)(id)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:secs + -978307200.0];
}

- (NSDate)initWithTimeIntervalSince1970:(NSTimeInterval)secs
{
  return -[NSDate initWithTimeIntervalSinceReferenceDate:]( self,  "initWithTimeIntervalSinceReferenceDate:",  secs + -978307200.0);
}

+ (NSDate)dateWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date
{
  if (date)
  {
    -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
    double v7 = v6;
  }

  else
  {
    double v7 = NAN;
  }

  return (NSDate *)(id)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:v7 + secsToBeAdded];
}

- (NSDate)initWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date
{
  if (date) {
    -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  }
  else {
    double v6 = NAN;
  }
  return -[NSDate initWithTimeIntervalSinceReferenceDate:]( self,  "initWithTimeIntervalSinceReferenceDate:",  v6 + secsToBeAdded);
}

+ (NSDate)dateWithDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    double v5 = v4;
  }

  else
  {
    double v5 = NAN;
  }

  return (NSDate *)(id)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:v5];
}

- (NSDate)initWithDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = NAN;
  }
  return -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", v4);
}

+ (id)dateWithString:(NSString *)aString
{
  return (id)[objc_alloc((Class)a1) initWithString:aString];
}

- (id)initWithString:(NSString *)description
{
  double v5 = (NSDate *)objc_opt_new();
  double v6 = -[NSString UTF8String](description, "UTF8String");
  if (!v6) {
    goto LABEL_60;
  }
  double v7 = v6;
  int v8 = *(unsigned __int8 *)v6;
  if ((v8 - 48) > 9)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    do
    {
      int v10 = *(unsigned __int8 *)++v7;
      uint64_t v9 = (v8 - 48) + 10 * v9;
      int v8 = v10;
    }

    while ((v10 - 48) < 0xA);
  }

  -[NSDate setYear:](v5, "setYear:", v9);
  if (!*v7) {
    goto LABEL_60;
  }
  v12 = v7 + 1;
  int v11 = *((unsigned __int8 *)v7 + 1);
  if ((v11 - 48) > 9)
  {
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v13 = (v11 - 48) + 10 * v13;
      int v14 = *++v12;
      int v11 = v14;
    }

    while ((v14 - 48) < 0xA);
    double v7 = v12 - 1;
  }

  -[NSDate setMonth:](v5, "setMonth:", v13);
  if (!*v12) {
    goto LABEL_60;
  }
  int v17 = *((unsigned __int8 *)v7 + 2);
  v16 = v7 + 2;
  int v15 = v17;
  if ((v17 - 48) > 9)
  {
    uint64_t v18 = 0LL;
  }

  else
  {
    uint64_t v18 = 0LL;
    do
    {
      int v19 = *++v16;
      uint64_t v18 = (v15 - 48) + 10 * v18;
      int v15 = v19;
    }

    while ((v19 - 48) < 0xA);
  }

  -[NSDate setDay:](v5, "setDay:", v18);
  if (!*v16) {
    goto LABEL_60;
  }
  v21 = v16 + 1;
  int v20 = v16[1];
  if ((v20 - 48) > 9)
  {
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v22 = 0LL;
    do
    {
      uint64_t v22 = (v20 - 48) + 10 * v22;
      int v23 = *++v21;
      int v20 = v23;
    }

    while ((v23 - 48) < 0xA);
    v16 = v21 - 1;
  }

  -[NSDate setHour:](v5, "setHour:", v22);
  if (!*v21) {
    goto LABEL_60;
  }
  int v26 = v16[2];
  v25 = v16 + 2;
  int v24 = v26;
  if ((v26 - 48) > 9)
  {
    uint64_t v27 = 0LL;
  }

  else
  {
    uint64_t v27 = 0LL;
    do
    {
      int v28 = *++v25;
      uint64_t v27 = (v24 - 48) + 10 * v27;
      int v24 = v28;
    }

    while ((v28 - 48) < 0xA);
  }

  -[NSDate setMinute:](v5, "setMinute:", v27);
  if (!*v25) {
    goto LABEL_60;
  }
  v30 = v25 + 1;
  int v29 = v25[1];
  if ((v29 - 48) > 9)
  {
    uint64_t v31 = 0LL;
  }

  else
  {
    uint64_t v31 = 0LL;
    do
    {
      uint64_t v31 = (v29 - 48) + 10 * v31;
      int v32 = *++v30;
      int v29 = v32;
    }

    while ((v32 - 48) < 0xA);
    v25 = v30 - 1;
  }

  -[NSDate setSecond:](v5, "setSecond:", v31);
  if (!*v30
    || _CFAppVersionCheck(@"com.apple.ist.Radar", 0LL)
    && -[NSString hasSuffix:](description, "hasSuffix:", @"GMT"))
  {
    goto LABEL_60;
  }

  if (!strncmp("GMT", v25 + 2, 3uLL))
  {
    unsigned int v33 = v25[5];
    if (v33 <= 0x2A)
    {
      uint64_t v36 = 0LL;
      if (v25[5] && v33 != 32) {
        goto LABEL_60;
      }
      goto LABEL_57;
    }

    uint64_t v34 = 5LL;
    if (v33 != 45 && v33 != 43) {
      goto LABEL_60;
    }
  }

  else
  {
    unsigned int v33 = v25[2];
    uint64_t v34 = 2LL;
  }

  if (v33 == 45)
  {
    uint64_t v35 = -60LL;
  }

  else
  {
    if ((char)v33 != 43)
    {
LABEL_60:

      v42 = 0LL;
      goto LABEL_61;
    }

    uint64_t v35 = 60LL;
  }

  int v37 = v25[v34 + 1];
  if ((v37 - 48) > 9)
  {
    uint64_t v38 = 0LL;
  }

  else
  {
    uint64_t v38 = 0LL;
    v39 = &v25[v34 + 2];
    do
    {
      uint64_t v38 = (v37 - 48) + 10 * v38;
      int v40 = *v39++;
      int v37 = v40;
    }

    while ((v40 - 48) < 0xA);
    if (v38 > 1600) {
      goto LABEL_60;
    }
  }

  uint64_t v36 = v35 * (v38 % 100 + 60 * (v38 / 100));
LABEL_57:
  v41 =  -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  @"gregorian");
  -[NSCalendar setTimeZone:]( v41,  "setTimeZone:",  +[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", v36));
  -[NSDate timeIntervalSinceReferenceDate]( -[NSCalendar dateFromComponents:](v41, "dateFromComponents:", v5),  "timeIntervalSinceReferenceDate");
  v42 = -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:");
  self = v5;
LABEL_61:

  return v42;
}

- (NSDate)dateByAddingTimeInterval:(NSTimeInterval)ti
{
  return (NSDate *)[(id)objc_opt_class() dateWithTimeIntervalSinceReferenceDate:v4 + ti];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)initWithCoder:(NSCoder *)aDecoder
{
  return 0LL;
}

- (BOOL)isInToday
{
  return -[NSCalendar isDateInToday:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "isDateInToday:",  self);
}

- (BOOL)isInTomorrow
{
  return -[NSCalendar isDateInTomorrow:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "isDateInTomorrow:",  self);
}

- (BOOL)isInYesterday
{
  return -[NSCalendar isDateInYesterday:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "isDateInYesterday:",  self);
}

- (BOOL)isInSameDayAsDate:(id)a3
{
  return -[NSCalendar isDate:inSameDayAsDate:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "isDate:inSameDayAsDate:",  self,  a3);
}

- (BOOL)isEqual:(id)a3 toUnitGranularity:(unint64_t)a4
{
  return -[NSCalendar compareDate:toDate:toUnitGranularity:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "compareDate:toDate:toUnitGranularity:",  self,  a3,  a4) == NSOrderedSame;
}

- (int64_t)compare:(id)a3 toUnitGranularity:(unint64_t)a4
{
  if (self == a3) {
    return 0LL;
  }
  else {
    return -[NSCalendar compareDate:toDate:toUnitGranularity:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "compareDate:toDate:toUnitGranularity:",  self,  a3,  a4);
  }
}

- (NSTimeInterval)timeIntervalSinceReferenceDate
{
  id v2 = __CFLookUpClass("NSDate");
  OUTLINED_FUNCTION_0_15(v2);
  return 0.0;
}

- (NSDate)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti
{
  double v4 = __CFLookUpClass("NSDate");
  OUTLINED_FUNCTION_0_15(v4);
  return self;
}

@end