@interface NSDateComponents
+ (BOOL)supportsSecureCoding;
+ (NSDateComponents)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeapMonth;
- (BOOL)isLeapMonthSet;
- (BOOL)isValidDate;
- (BOOL)isValidDateInCalendar:(NSCalendar *)calendar;
- (NSCalendar)calendar;
- (NSDate)date;
- (NSDateComponents)init;
- (NSDateComponents)initWithCoder:(id)a3;
- (NSInteger)day;
- (NSInteger)era;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)month;
- (NSInteger)nanosecond;
- (NSInteger)quarter;
- (NSInteger)second;
- (NSInteger)valueForComponent:(NSCalendarUnit)unit;
- (NSInteger)week;
- (NSInteger)weekOfMonth;
- (NSInteger)weekOfYear;
- (NSInteger)weekday;
- (NSInteger)weekdayOrdinal;
- (NSInteger)year;
- (NSInteger)yearForWeekOfYear;
- (NSTimeZone)timeZone;
- (__CFDateComponents)_dateComponents;
- (id)_initWithCFDateComponents:(__CFDateComponents *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dayOfYear;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDay:(NSInteger)day;
- (void)setDayOfYear:(int64_t)a3;
- (void)setEra:(NSInteger)era;
- (void)setHour:(NSInteger)hour;
- (void)setLeapMonth:(BOOL)leapMonth;
- (void)setMinute:(NSInteger)minute;
- (void)setMonth:(NSInteger)month;
- (void)setNanosecond:(NSInteger)nanosecond;
- (void)setQuarter:(NSInteger)quarter;
- (void)setSecond:(NSInteger)second;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setValue:(NSInteger)value forComponent:(NSCalendarUnit)unit;
- (void)setWeek:(NSInteger)v;
- (void)setWeekOfMonth:(NSInteger)weekOfMonth;
- (void)setWeekOfYear:(NSInteger)weekOfYear;
- (void)setWeekday:(NSInteger)weekday;
- (void)setWeekdayOrdinal:(NSInteger)weekdayOrdinal;
- (void)setYear:(NSInteger)year;
- (void)setYearForWeekOfYear:(NSInteger)yearForWeekOfYear;
@end

@implementation NSDateComponents

- (__CFDateComponents)_dateComponents
{
  return *(__CFDateComponents **)object_getIndexedIvars(self);
}

+ (NSDateComponents)allocWithZone:(_NSZone *)a3
{
  return (NSDateComponents *)__CFAllocateObject((objc_class *)a1, 8uLL);
}

- (NSDateComponents)init
{
  IndexedIvars = object_getIndexedIvars(self);
  CFDateComponentsCreate((const __CFAllocator *)&__kCFAllocatorSystemDefault, v4, v5, v6, v7, v8, v9, v10);
  void *IndexedIvars = v11;
  return self;
}

- (id)_initWithCFDateComponents:(__CFDateComponents *)a3
{
  IndexedIvars = object_getIndexedIvars(self);
  void *IndexedIvars = CFDateComponentsCreateCopy( (const __CFAllocator *)&__kCFAllocatorSystemDefault,  (uint64_t)a3,  v6,  v7,  v8,  v9,  v10,  v11);
  return self;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v3 = *(const void **)object_getIndexedIvars(self);
  if (v3) {
    CFRelease(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSDateComponents;
  -[NSDateComponents dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  IndexedIvars = (CFTypeRef *)object_getIndexedIvars(self);
  return CFHash(*IndexedIvars);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(const void **)object_getIndexedIvars(self);
  IndexedIvars = (CFTypeRef *)object_getIndexedIvars(a3);
  return CFEqual(v5, *IndexedIvars) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (__objc2_class *)objc_opt_class();
  if (v5 == &OBJC_CLASS___NSDateComponents) {
    return -[NSDateComponents _initWithCFDateComponents:]( +[NSDateComponents allocWithZone:](&OBJC_CLASS___NSDateComponents, "allocWithZone:", a3),  "_initWithCFDateComponents:",  *(void *)object_getIndexedIvars(self));
  }
  uint64_t v6 = -[__objc2_class init](-[__objc2_class allocWithZone:](v5, "allocWithZone:", a3), "init");
  -[__objc2_class setCalendar:](v6, "setCalendar:", -[NSDateComponents calendar](self, "calendar"));
  -[__objc2_class setTimeZone:](v6, "setTimeZone:", -[NSDateComponents timeZone](self, "timeZone"));
  -[__objc2_class setEra:](v6, "setEra:", -[NSDateComponents era](self, "era"));
  -[__objc2_class setYear:](v6, "setYear:", -[NSDateComponents year](self, "year"));
  -[__objc2_class setQuarter:](v6, "setQuarter:", -[NSDateComponents quarter](self, "quarter"));
  -[__objc2_class setMonth:](v6, "setMonth:", -[NSDateComponents month](self, "month"));
  -[__objc2_class setDay:](v6, "setDay:", -[NSDateComponents day](self, "day"));
  -[__objc2_class setHour:](v6, "setHour:", -[NSDateComponents hour](self, "hour"));
  -[__objc2_class setMinute:](v6, "setMinute:", -[NSDateComponents minute](self, "minute"));
  -[__objc2_class setSecond:](v6, "setSecond:", -[NSDateComponents second](self, "second"));
  -[__objc2_class setNanosecond:](v6, "setNanosecond:", -[NSDateComponents nanosecond](self, "nanosecond"));
  -[__objc2_class setWeek:](v6, "setWeek:", -[NSDateComponents week](self, "week"));
  -[__objc2_class setWeekOfYear:](v6, "setWeekOfYear:", -[NSDateComponents weekOfYear](self, "weekOfYear"));
  -[__objc2_class setWeekOfMonth:](v6, "setWeekOfMonth:", -[NSDateComponents weekOfMonth](self, "weekOfMonth"));
  -[__objc2_class setYearForWeekOfYear:]( v6,  "setYearForWeekOfYear:",  -[NSDateComponents yearForWeekOfYear](self, "yearForWeekOfYear"));
  -[__objc2_class setWeekday:](v6, "setWeekday:", -[NSDateComponents weekday](self, "weekday"));
  -[__objc2_class setWeekdayOrdinal:]( v6,  "setWeekdayOrdinal:",  -[NSDateComponents weekdayOrdinal](self, "weekdayOrdinal"));
  -[__objc2_class setDayOfYear:](v6, "setDayOfYear:", -[NSDateComponents dayOfYear](self, "dayOfYear"));
  if (-[NSDateComponents isLeapMonthSet](self, "isLeapMonthSet")) {
    -[__objc2_class setLeapMonth:](v6, "setLeapMonth:", -[NSDateComponents isLeapMonth](self, "isLeapMonth"));
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateComponents)initWithCoder:(id)a3
{
  return 0LL;
}

- (NSCalendar)calendar
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return (NSCalendar *)(id)CFDateComponentsCopyCalendar(*IndexedIvars);
}

- (NSTimeZone)timeZone
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return (NSTimeZone *)(id)CFDateComponentsCopyTimeZone(*IndexedIvars);
}

- (NSInteger)era
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 2LL);
}

- (NSInteger)year
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 4LL);
}

- (NSInteger)month
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 8LL);
}

- (NSInteger)day
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 16LL);
}

- (NSInteger)hour
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 32LL);
}

- (NSInteger)minute
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 64LL);
}

- (NSInteger)second
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 128LL);
}

- (NSInteger)week
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 256LL);
}

- (NSInteger)weekday
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 512LL);
}

- (NSInteger)weekdayOrdinal
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 1024LL);
}

- (NSInteger)quarter
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 2048LL);
}

- (NSInteger)nanosecond
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x8000LL);
}

- (NSInteger)weekOfYear
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x2000LL);
}

- (NSInteger)weekOfMonth
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 4096LL);
}

- (NSInteger)yearForWeekOfYear
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x4000LL);
}

- (int64_t)dayOfYear
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x10000LL);
}

- (BOOL)isLeapMonth
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  uint64_t Value = CFDateComponentsGetValue(*IndexedIvars, 0x40000000LL);
  return Value != 0x7FFFFFFFFFFFFFFFLL && Value != 0;
}

- (BOOL)isLeapMonthSet
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x40000000LL) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  CFDateComponentsSetCalendar(*IndexedIvars, calendar);
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  CFDateComponentsSetTimeZone(*IndexedIvars, timeZone);
}

- (void)setEra:(NSInteger)era
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 2LL, era);
}

- (void)setYear:(NSInteger)year
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 4LL, year);
}

- (void)setMonth:(NSInteger)month
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 8LL, month);
}

- (void)setDay:(NSInteger)day
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 16LL, day);
}

- (void)setHour:(NSInteger)hour
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 32LL, hour);
}

- (void)setMinute:(NSInteger)minute
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 64LL, minute);
}

- (void)setSecond:(NSInteger)second
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 128LL, second);
}

- (void)setWeek:(NSInteger)v
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 256LL, v);
}

- (void)setWeekday:(NSInteger)weekday
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 512LL, weekday);
}

- (void)setWeekdayOrdinal:(NSInteger)weekdayOrdinal
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 1024LL, weekdayOrdinal);
}

- (void)setQuarter:(NSInteger)quarter
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 2048LL, quarter);
}

- (void)setNanosecond:(NSInteger)nanosecond
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x8000LL, nanosecond);
}

- (void)setWeekOfYear:(NSInteger)weekOfYear
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x2000LL, weekOfYear);
}

- (void)setWeekOfMonth:(NSInteger)weekOfMonth
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 4096LL, weekOfMonth);
}

- (void)setYearForWeekOfYear:(NSInteger)yearForWeekOfYear
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x4000LL, yearForWeekOfYear);
}

- (void)setDayOfYear:(int64_t)a3
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x10000LL, a3);
}

- (void)setLeapMonth:(BOOL)leapMonth
{
  BOOL v3 = leapMonth;
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x40000000LL, v3);
}

- (NSDate)date
{
  BOOL v3 = -[NSDateComponents timeZone](self, "timeZone");
  if (v3) {
    -[NSCalendar setTimeZone:](-[NSDateComponents calendar](self, "calendar"), "setTimeZone:", v3);
  }
  return -[NSCalendar dateFromComponents:](-[NSDateComponents calendar](self, "calendar"), "dateFromComponents:", self);
}

- (void)setValue:(NSInteger)value forComponent:(NSCalendarUnit)unit
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, unit, value);
}

- (NSInteger)valueForComponent:(NSCalendarUnit)unit
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, unit);
}

- (BOOL)isValidDate
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  return CFDateComponentsIsValidDate(*IndexedIvars);
}

- (BOOL)isValidDateInCalendar:(NSCalendar *)calendar
{
  if (calendar || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    IndexedIvars = (void **)object_getIndexedIvars(self);
    return CFDateComponentsIsValidDateInCalendar(*IndexedIvars, calendar);
  }

  else
  {
    int v7 = isValidDateInCalendar____count__;
    if (isValidDateInCalendar____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: calendar cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSDateComponents isValidDateInCalendar:]");
      int v7 = isValidDateInCalendar____count__;
    }

    BOOL result = 0;
    isValidDateInCalendar____count__ = v7 + 1;
  }

  return result;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  IndexedIvars = (void **)object_getIndexedIvars(self);
  objc_super v4 = _CFDateComponentsCopyDescriptionInner(*IndexedIvars);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSDateComponents;
  id v5 = -[NSObject description](&v8, sel_description);
  uint64_t v6 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@ %@", v5, v4);
  CFRelease(v4);
  return v6;
}

@end