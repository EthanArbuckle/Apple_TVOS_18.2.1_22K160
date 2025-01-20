@interface NSCalendar
+ (BOOL)supportsSecureCoding;
+ (NSCalendar)allocWithZone:(_NSZone *)a3;
+ (NSCalendar)autoupdatingCurrentCalendar;
+ (NSCalendar)calendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant;
+ (NSCalendar)currentCalendar;
- (BOOL)date:(NSDate *)date matchesComponents:(NSDateComponents *)components;
- (BOOL)isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit;
- (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2;
- (BOOL)isDateInToday:(NSDate *)date;
- (BOOL)isDateInTomorrow:(NSDate *)date;
- (BOOL)isDateInWeekend:(NSDate *)date;
- (BOOL)isDateInYesterday:(NSDate *)date;
- (BOOL)isEqual:(id)a3;
- (BOOL)nextWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip options:(NSCalendarOptions)options afterDate:(NSDate *)date;
- (BOOL)rangeOfUnit:(NSCalendarUnit)unit startDate:(NSDate *)datep interval:(NSTimeInterval *)tip forDate:(NSDate *)date;
- (BOOL)rangeOfWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip containingDate:(NSDate *)date;
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
- (NSCalendar)init;
- (NSCalendar)initWithCoder:(id)a3;
- (NSCalendarIdentifier)calendarIdentifier;
- (NSComparisonResult)compareDate:(NSDate *)date1 toDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit;
- (NSDate)dateByAddingComponents:(NSDateComponents *)comps toDate:(NSDate *)date options:(NSCalendarOptions)opts;
- (NSDate)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date options:(NSCalendarOptions)options;
- (NSDate)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s ofDate:(NSDate *)date options:(NSCalendarOptions)opts;
- (NSDate)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v ofDate:(NSDate *)date options:(NSCalendarOptions)opts;
- (NSDate)dateFromComponents:(NSDateComponents *)comps;
- (NSDate)dateWithEra:(NSInteger)eraValue year:(NSInteger)yearValue month:(NSInteger)monthValue day:(NSInteger)dayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue;
- (NSDate)dateWithEra:(NSInteger)eraValue yearForWeekOfYear:(NSInteger)yearValue weekOfYear:(NSInteger)weekValue weekday:(NSInteger)weekdayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue;
- (NSDate)nextDateAfterDate:(NSDate *)date matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)options;
- (NSDate)nextDateAfterDate:(NSDate *)date matchingHour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue options:(NSCalendarOptions)options;
- (NSDate)nextDateAfterDate:(NSDate *)date matchingUnit:(NSCalendarUnit)unit value:(NSInteger)value options:(NSCalendarOptions)options;
- (NSDate)startOfDayForDate:(NSDate *)date;
- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date;
- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate options:(NSCalendarOptions)opts;
- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDateComponents:(NSDateComponents *)startingDateComp toDateComponents:(NSDateComponents *)resultDateComp options:(NSCalendarOptions)options;
- (NSDateComponents)componentsInTimeZone:(NSTimeZone *)timezone fromDate:(NSDate *)date;
- (NSInteger)component:(NSCalendarUnit)unit fromDate:(NSDate *)date;
- (NSLocale)locale;
- (NSRange)maximumRangeOfUnit:(NSCalendarUnit)unit;
- (NSRange)minimumRangeOfUnit:(NSCalendarUnit)unit;
- (NSRange)rangeOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date;
- (NSString)AMSymbol;
- (NSString)PMSymbol;
- (NSTimeZone)timeZone;
- (NSUInteger)firstWeekday;
- (NSUInteger)minimumDaysInFirstWeek;
- (NSUInteger)ordinalityOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)gregorianStartDate;
- (unint64_t)hash;
- (void)enumerateDatesStartingAfterDate:(NSDate *)start matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)opts usingBlock:(void *)block;
- (void)getEra:(NSInteger *)eraValuePointer year:(NSInteger *)yearValuePointer month:(NSInteger *)monthValuePointer day:(NSInteger *)dayValuePointer fromDate:(NSDate *)date;
- (void)getEra:(NSInteger *)eraValuePointer yearForWeekOfYear:(NSInteger *)yearValuePointer weekOfYear:(NSInteger *)weekValuePointer weekday:(NSInteger *)weekdayValuePointer fromDate:(NSDate *)date;
- (void)getHour:(NSInteger *)hourValuePointer minute:(NSInteger *)minuteValuePointer second:(NSInteger *)secondValuePointer nanosecond:(NSInteger *)nanosecondValuePointer fromDate:(NSDate *)date;
- (void)setFirstWeekday:(NSUInteger)firstWeekday;
- (void)setLocale:(NSLocale *)locale;
- (void)setMinimumDaysInFirstWeek:(NSUInteger)minimumDaysInFirstWeek;
- (void)setTimeZone:(NSTimeZone *)timeZone;
@end

@implementation NSCalendar

+ (NSCalendar)autoupdatingCurrentCalendar
{
  return (NSCalendar *)+[NSCalendar _autoupdatingCurrent](&OBJC_CLASS___NSCalendar, "_autoupdatingCurrent");
}

+ (NSCalendar)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSCalendar == a1) {
    return (NSCalendar *)-[objc_class allocWithZone:](objc_lookUpClass("_NSSwiftCalendar"), "allocWithZone:", a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSCalendar;
  return (NSCalendar *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSCalendar)init
{
  return 0LL;
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSCalendar calendarIdentifier](self, "calendarIdentifier"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }

  else
  {
    uint64_t v15 = v5;
    uint64_t v16 = v4;
    uint64_t v17 = v3;
    if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    LODWORD(v11) = -[NSString isEqual:]( -[NSCalendar calendarIdentifier](self, "calendarIdentifier"),  "isEqual:",  [a3 calendarIdentifier]);
    if ((_DWORD)v11)
    {
      LODWORD(v11) = -[NSTimeZone isEqual:]( -[NSCalendar timeZone](self, "timeZone"),  "isEqual:",  [a3 timeZone]);
      if ((_DWORD)v11)
      {
        LODWORD(v11) = -[NSLocale isEqual:]( -[NSCalendar locale](self, "locale"),  "isEqual:",  [a3 locale]);
        if ((_DWORD)v11)
        {
          NSUInteger v12 = -[NSCalendar firstWeekday](self, "firstWeekday");
          if (v12 != [a3 firstWeekday]) {
            goto LABEL_18;
          }
          NSUInteger v13 = -[NSCalendar minimumDaysInFirstWeek](self, "minimumDaysInFirstWeek");
          if (v13 != [a3 minimumDaysInFirstWeek]) {
            goto LABEL_18;
          }
          if (-[NSCalendar gregorianStartDate](self, "gregorianStartDate") && [a3 gregorianStartDate])
          {
            if (objc_msgSend( -[NSCalendar gregorianStartDate](self, "gregorianStartDate"),  "isEqual:",  objc_msgSend(a3, "gregorianStartDate")))
            {
LABEL_20:
              LOBYTE(v11) = 1;
              return v11;
            }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithCalendarIdentifier:",  -[NSCalendar calendarIdentifier](self, "calendarIdentifier"));
  objc_msgSend(v4, "setLocale:", -[NSCalendar locale](self, "locale"));
  objc_msgSend(v4, "setTimeZone:", -[NSCalendar timeZone](self, "timeZone"));
  objc_msgSend(v4, "setFirstWeekday:", -[NSCalendar firstWeekday](self, "firstWeekday"));
  objc_msgSend(v4, "setMinimumDaysInFirstWeek:", -[NSCalendar minimumDaysInFirstWeek](self, "minimumDaysInFirstWeek"));
  objc_msgSend(v4, "setGregorianStartDate:", -[NSCalendar gregorianStartDate](self, "gregorianStartDate"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCalendar)initWithCoder:(id)a3
{
  return 0LL;
}

+ (NSCalendar)currentCalendar
{
  return (NSCalendar *)+[NSCalendar _current](&OBJC_CLASS___NSCalendar, "_current");
}

+ (NSCalendar)calendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant
{
  return (NSCalendar *)(id)[objc_alloc((Class)a1) initWithCalendarIdentifier:calendarIdentifierConstant];
}

- (void)getEra:(NSInteger *)eraValuePointer year:(NSInteger *)yearValuePointer month:(NSInteger *)monthValuePointer day:(NSInteger *)dayValuePointer fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    NSUInteger v13 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 30LL, date);
    v14 = v13;
  }

  else
  {
    int v15 = getEra_year_month_day_fromDate____count__;
    if (getEra_year_month_day_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[NSCalendar getEra:year:month:day:fromDate:]");
      int v15 = getEra_year_month_day_fromDate____count__;
    }

    getEra_year_month_day_fromDate____count__ = v15 + 1;
  }

- (void)getEra:(NSInteger *)eraValuePointer yearForWeekOfYear:(NSInteger *)yearValuePointer weekOfYear:(NSInteger *)weekValuePointer weekday:(NSInteger *)weekdayValuePointer fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    NSUInteger v13 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 25090LL, date);
    v14 = v13;
  }

  else
  {
    int v15 = getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__;
    if (getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[NSCalendar getEra:yearForWeekOfYear:weekOfYear:weekday:fromDate:]");
      int v15 = getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__;
    }

    getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__ = v15 + 1;
  }

- (void)getHour:(NSInteger *)hourValuePointer minute:(NSInteger *)minuteValuePointer second:(NSInteger *)secondValuePointer nanosecond:(NSInteger *)nanosecondValuePointer fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    NSUInteger v13 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 32992LL, date);
    v14 = v13;
  }

  else
  {
    int v15 = getHour_minute_second_nanosecond_fromDate____count__;
    if (getHour_minute_second_nanosecond_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[NSCalendar getHour:minute:second:nanosecond:fromDate:]");
      int v15 = getHour_minute_second_nanosecond_fromDate____count__;
    }

    getHour_minute_second_nanosecond_fromDate____count__ = v15 + 1;
  }

- (NSInteger)component:(NSCalendarUnit)unit fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL)) {
    return -[NSDateComponents valueForComponent:]( -[NSCalendar components:fromDate:](self, "components:fromDate:", unit, date),  "valueForComponent:",  unit);
  }
  int v8 = component_fromDate____count__;
  if (component_fromDate____count__ <= 13)
  {
    objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
    CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCalendar component:fromDate:]");
    int v8 = component_fromDate____count__;
  }

  component_fromDate____count__ = v8 + 1;
  return 0LL;
}

- (NSDate)dateWithEra:(NSInteger)eraValue year:(NSInteger)yearValue month:(NSInteger)monthValue day:(NSInteger)dayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue
{
  id v17 = (id)objc_opt_new();
  [v17 setEra:eraValue];
  [v17 setYear:yearValue];
  [v17 setMonth:monthValue];
  [v17 setDay:dayValue];
  [v17 setHour:hourValue];
  [v17 setMinute:minuteValue];
  [v17 setSecond:secondValue];
  [v17 setNanosecond:nanosecondValue];
  return -[NSCalendar dateFromComponents:](self, "dateFromComponents:", v17);
}

- (NSDate)dateWithEra:(NSInteger)eraValue yearForWeekOfYear:(NSInteger)yearValue weekOfYear:(NSInteger)weekValue weekday:(NSInteger)weekdayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue
{
  id v17 = (id)objc_opt_new();
  [v17 setEra:eraValue];
  [v17 setYearForWeekOfYear:yearValue];
  [v17 setWeekOfYear:weekValue];
  [v17 setWeekday:weekdayValue];
  [v17 setHour:hourValue];
  [v17 setMinute:minuteValue];
  [v17 setSecond:secondValue];
  [v17 setNanosecond:nanosecondValue];
  return -[NSCalendar dateFromComponents:](self, "dateFromComponents:", v17);
}

- (NSDate)startOfDayForDate:(NSDate *)date
{
  v5[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 0LL;
  v5[0] = 0LL;
  -[NSCalendar rangeOfUnit:startDate:interval:forDate:]( self,  "rangeOfUnit:startDate:interval:forDate:",  16LL,  v5,  &v4,  date);
  return (NSDate *)v5[0];
}

- (NSDateComponents)componentsInTimeZone:(NSTimeZone *)timezone fromDate:(NSDate *)date
{
  uint64_t v7 = -[NSCalendar timeZone](self, "timeZone");
  -[NSCalendar setTimeZone:](self, "setTimeZone:", timezone);
  int v8 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 3276542LL, date);
  -[NSCalendar setTimeZone:](self, "setTimeZone:", v7);
  return v8;
}

- (NSComparisonResult)compareDate:(NSDate *)date1 toDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  -[NSDate timeIntervalSinceReferenceDate](date1, "timeIntervalSinceReferenceDate");
  double v10 = v9;
  -[NSDate timeIntervalSinceReferenceDate](date2, "timeIntervalSinceReferenceDate");
  if (v10 <= -2.11845067e11 || v10 >= 1.59271755e13 || v11 >= 1.59271755e13 || v11 <= -2.11845067e11)
  {
    BOOL v16 = v10 == v11;
    NSComparisonResult v17 = NSOrderedAscending;
    if (v10 > v11) {
      NSComparisonResult v17 = NSOrderedDescending;
    }
    goto LABEL_20;
  }

  if ((uint64_t)unit <= 127)
  {
    if (unit != 16 && unit != 32)
    {
      if (unit == 64)
      {
        -[NSDate timeIntervalSinceReferenceDate](date1, "timeIntervalSinceReferenceDate");
        -[NSDate timeIntervalSinceReferenceDate](date2, "timeIntervalSinceReferenceDate", modf(v18, (double *)v42));
        modf(v19, (double *)&v39);
        double v14 = floor(*(double *)v42 / 60.0);
        double v15 = floor(*(double *)&v39 / 60.0);
        goto LABEL_17;
      }

- (BOOL)isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit
{
  if (date1 || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    if (date2 || !_CFExecutableLinkedOnOrAfter(9uLL))
    {
      return -[NSCalendar compareDate:toDate:toUnitGranularity:]( self,  "compareDate:toDate:toUnitGranularity:",  date1,  date2,  unit) == NSOrderedSame;
    }

    else
    {
      int v17 = isDate_equalToDate_toUnitGranularity____count___17;
      if (isDate_equalToDate_toUnitGranularity____count___17 <= 13)
      {
        objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
        CFLog( 3LL,  (uint64_t)@"*** %s: date2 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[NSCalendar isDate:equalToDate:toUnitGranularity:]");
        int v17 = isDate_equalToDate_toUnitGranularity____count___17;
      }

      BOOL result = 0;
      isDate_equalToDate_toUnitGranularity____count___17 = v17 + 1;
    }
  }

  else
  {
    int v10 = isDate_equalToDate_toUnitGranularity____count__;
    if (isDate_equalToDate_toUnitGranularity____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date1 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[NSCalendar isDate:equalToDate:toUnitGranularity:]");
      int v10 = isDate_equalToDate_toUnitGranularity____count__;
    }

    BOOL result = 0;
    isDate_equalToDate_toUnitGranularity____count__ = v10 + 1;
  }

  return result;
}

- (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2
{
  if (date1 || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    if (date2 || !_CFExecutableLinkedOnOrAfter(9uLL))
    {
      return -[NSCalendar compareDate:toDate:toUnitGranularity:]( self,  "compareDate:toDate:toUnitGranularity:",  date1,  date2,  16LL) == NSOrderedSame;
    }

    else
    {
      int v15 = isDate_inSameDayAsDate____count___20;
      if (isDate_inSameDayAsDate____count___20 <= 13)
      {
        objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
        CFLog( 3LL,  (uint64_t)@"*** %s: date2 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[NSCalendar isDate:inSameDayAsDate:]");
        int v15 = isDate_inSameDayAsDate____count___20;
      }

      BOOL result = 0;
      isDate_inSameDayAsDate____count___20 = v15 + 1;
    }
  }

  else
  {
    int v8 = isDate_inSameDayAsDate____count__;
    if (isDate_inSameDayAsDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date1 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCalendar isDate:inSameDayAsDate:]");
      int v8 = isDate_inSameDayAsDate____count__;
    }

    BOOL result = 0;
    isDate_inSameDayAsDate____count__ = v8 + 1;
  }

  return result;
}

- (BOOL)isDateInToday:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL)) {
    return -[NSCalendar compareDate:toDate:toUnitGranularity:]( self,  "compareDate:toDate:toUnitGranularity:",  date,  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  16LL) == NSOrderedSame;
  }
  int v6 = isDateInToday____count__;
  if (isDateInToday____count__ <= 13)
  {
    objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
    CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCalendar isDateInToday:]");
    int v6 = isDateInToday____count__;
  }

  BOOL result = 0;
  isDateInToday____count__ = v6 + 1;
  return result;
}

- (BOOL)isDateInYesterday:(NSDate *)date
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    uint64_t v14 = 0LL;
    v15[0] = 0LL;
    BOOL v5 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:]( self,  "rangeOfUnit:startDate:interval:forDate:",  16LL,  v15,  &v14,  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
    if (v5) {
      LOBYTE(v5) = -[NSCalendar compareDate:toDate:toUnitGranularity:]( self,  "compareDate:toDate:toUnitGranularity:",  date,  [v15[0] dateByAddingTimeInterval:-60.0],  16) == NSOrderedSame;
    }
  }

  else
  {
    int v6 = isDateInYesterday____count__;
    if (isDateInYesterday____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCalendar isDateInYesterday:]");
      int v6 = isDateInYesterday____count__;
    }

    LOBYTE(v5) = 0;
    isDateInYesterday____count__ = v6 + 1;
  }

  return v5;
}

- (BOOL)isDateInTomorrow:(NSDate *)date
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    double v14 = 0.0;
    v15[0] = 0LL;
    BOOL v5 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:]( self,  "rangeOfUnit:startDate:interval:forDate:",  16LL,  v15,  &v14,  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
    if (v5) {
      LOBYTE(v5) = -[NSCalendar compareDate:toDate:toUnitGranularity:]( self,  "compareDate:toDate:toUnitGranularity:",  date,  [v15[0] dateByAddingTimeInterval:v14 + 60.0],  16) == NSOrderedSame;
    }
  }

  else
  {
    int v6 = isDateInTomorrow____count__;
    if (isDateInTomorrow____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCalendar isDateInTomorrow:]");
      int v6 = isDateInTomorrow____count__;
    }

    LOBYTE(v5) = 0;
    isDateInTomorrow____count__ = v6 + 1;
  }

  return v5;
}

- (BOOL)rangeOfWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip containingDate:(NSDate *)date
{
  v19[1] = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  v19[0] = 0LL;
  double v16 = 0.0;
  uint64_t v17 = 0LL;
  if (-[NSCalendar nextWeekendStartDate:interval:options:afterDate:]( self,  "nextWeekendStartDate:interval:options:afterDate:",  v19,  &v17,  0LL,  date))
  {
    char v9 = !-[NSCalendar nextWeekendStartDate:interval:options:afterDate:]( self,  "nextWeekendStartDate:interval:options:afterDate:",  &v18,  &v16,  4LL,  v19[0]);
  }

  else
  {
    char v9 = 1;
  }

  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  double v11 = v10;
  -[NSDate timeIntervalSinceReferenceDate](v18, "timeIntervalSinceReferenceDate");
  if ((v9 & 1) != 0) {
    return 0;
  }
  double v13 = v16;
  if (v12 > v11 || v11 >= v12 + v16) {
    return 0;
  }
  if (datep) {
    *datep = v18;
  }
  if (tip) {
    *tip = v13;
  }
  return 1;
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDateComponents:(NSDateComponents *)startingDateComp toDateComponents:(NSDateComponents *)resultDateComp options:(NSCalendarOptions)options
{
  double v11 = -[NSDateComponents calendar](startingDateComp, "calendar");
  if (!v11) {
    double v11 = self;
  }
  uint64_t v12 = -[NSCalendar dateFromComponents:](v11, "dateFromComponents:", startingDateComp);
  double v13 = -[NSDateComponents calendar](resultDateComp, "calendar");
  if (!v13) {
    double v13 = self;
  }
  return -[NSCalendar components:fromDate:toDate:options:]( self,  "components:fromDate:toDate:options:",  unitFlags,  v12,  -[NSCalendar dateFromComponents:](v13, "dateFromComponents:", resultDateComp),  options);
}

- (NSDate)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date options:(NSCalendarOptions)options
{
  id v11 = (id)objc_opt_new();
  [v11 setValue:value forComponent:unit];
  return -[NSCalendar dateByAddingComponents:toDate:options:]( self,  "dateByAddingComponents:toDate:options:",  v11,  date,  options);
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)options
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  id v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __59__NSCalendar_nextDateAfterDate_matchingComponents_options___block_invoke;
  v7[3] = &unk_1899EB708;
  v7[4] = &v8;
  -[NSCalendar enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:]( self,  "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:",  date,  comps,  options,  v7);
  BOOL v5 = (NSDate *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __59__NSCalendar_nextDateAfterDate_matchingComponents_options___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 40LL) = a2;
  *a4 = 1;
  return result;
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingUnit:(NSCalendarUnit)unit value:(NSInteger)value options:(NSCalendarOptions)options
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    id v11 = (id)objc_opt_new();
    [v11 setValue:value forComponent:unit];
    return -[NSCalendar nextDateAfterDate:matchingComponents:options:]( self,  "nextDateAfterDate:matchingComponents:options:",  date,  v11,  options);
  }

  else
  {
    int v13 = nextDateAfterDate_matchingUnit_value_options____count__;
    if (nextDateAfterDate_matchingUnit_value_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[NSCalendar nextDateAfterDate:matchingUnit:value:options:]");
      int v13 = nextDateAfterDate_matchingUnit_value_options____count__;
    }

    nextDateAfterDate_matchingUnit_value_options____count__ = v13 + 1;
    return 0LL;
  }

- (NSDate)nextDateAfterDate:(NSDate *)date matchingHour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue options:(NSCalendarOptions)options
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    id v13 = (id)objc_opt_new();
    [v13 setHour:hourValue];
    [v13 setMinute:minuteValue];
    [v13 setSecond:secondValue];
    return -[NSCalendar nextDateAfterDate:matchingComponents:options:]( self,  "nextDateAfterDate:matchingComponents:options:",  date,  v13,  options);
  }

  else
  {
    int v15 = nextDateAfterDate_matchingHour_minute_second_options____count__;
    if (nextDateAfterDate_matchingHour_minute_second_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[NSCalendar nextDateAfterDate:matchingHour:minute:second:options:]");
      int v15 = nextDateAfterDate_matchingHour_minute_second_options____count__;
    }

    nextDateAfterDate_matchingHour_minute_second_options____count__ = v15 + 1;
    return 0LL;
  }

- (NSDate)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v ofDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  uint64_t v7 = date;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (-[NSCalendar component:fromDate:](self, "component:fromDate:", unit, date) != v)
  {
    if (opts) {
      NSCalendarOptions v11 = opts;
    }
    else {
      NSCalendarOptions v11 = 1024LL;
    }
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setValue:forComponent:](v12, "setValue:forComponent:", v, unit);
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3052000000LL;
    uint64_t v18 = __Block_byref_object_copy__1;
    uint64_t v19 = __Block_byref_object_dispose__1;
    uint64_t v20 = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __53__NSCalendar_dateBySettingUnit_value_ofDate_options___block_invoke;
    v14[3] = &unk_1899EB708;
    v14[4] = &v15;
    -[NSCalendar enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:]( self,  "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:",  v7,  v12,  v11,  v14);

    uint64_t v7 = (NSDate *)v16[5];
    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

uint64_t __53__NSCalendar_dateBySettingUnit_value_ofDate_options___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 40LL) = a2;
  *a4 = 1;
  return result;
}

- (NSDate)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s ofDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  __int16 v7 = opts;
  v27[1] = *(id *)MEMORY[0x1895F89C0];
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    uint64_t v26 = 0LL;
    v27[0] = 0LL;
    -[NSCalendar rangeOfUnit:startDate:interval:forDate:]( self,  "rangeOfUnit:startDate:interval:forDate:",  16LL,  v27,  &v26,  date);
    if (v27[0])
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
      -[NSDateComponents setHour:](v13, "setHour:", h);
      -[NSDateComponents setMinute:](v13, "setMinute:", m);
      -[NSDateComponents setSecond:](v13, "setSecond:", s);
      uint64_t v14 = 2LL;
      if ((v7 & 2) == 0) {
        uint64_t v14 = 1024LL;
      }
      uint64_t v15 = 0x2000LL;
      if ((v7 & 0x2000) == 0) {
        uint64_t v15 = 4096LL;
      }
      uint64_t v16 = v14 | v15;
      uint64_t v17 = -[NSCalendar nextDateAfterDate:matchingComponents:options:]( self,  "nextDateAfterDate:matchingComponents:options:",  [v27[0] dateByAddingTimeInterval:-0.5],  v13,  v14 | v15);
      if (-[NSDate compare:](v17, "compare:", v27[0]) == NSOrderedAscending) {
        uint64_t v17 = -[NSCalendar nextDateAfterDate:matchingComponents:options:]( self,  "nextDateAfterDate:matchingComponents:options:",  v27[0],  v13,  v16);
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    int v18 = dateBySettingHour_minute_second_ofDate_options____count__;
    if (dateBySettingHour_minute_second_ofDate_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog( 3LL,  (uint64_t)@"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSCalendar dateBySettingHour:minute:second:ofDate:options:]");
      int v18 = dateBySettingHour_minute_second_ofDate_options____count__;
    }

    uint64_t v17 = 0LL;
    dateBySettingHour_minute_second_ofDate_options____count__ = v18 + 1;
  }

  return v17;
}

- (BOOL)date:(NSDate *)date matchesComponents:(NSDateComponents *)components
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  do
  {
    uint64_t v9 = qword_180D7E300[v7];
    if (-[NSDateComponents valueForComponent:](components, "valueForComponent:", v9) == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = v9;
    }
    v8 |= v10;
    ++v7;
  }

  while (v7 != 14);
  if (!v8 && -[NSDateComponents isLeapMonthSet](components, "isLeapMonthSet")) {
    return -[NSDateComponents isLeapMonthSet]( -[NSCalendar components:fromDate:](self, "components:fromDate:", 8LL, date),  "isLeapMonthSet");
  }
  uint64_t v12 = -[NSCalendar components:fromDate:](self, "components:fromDate:", v8, date);
  id v13 = (id)-[NSDateComponents copy](components, "copy");
  if (-[NSDateComponents isLeapMonthSet](v12, "isLeapMonthSet")
    && !-[NSDateComponents isLeapMonthSet](components, "isLeapMonthSet"))
  {
    objc_msgSend(v13, "setLeapMonth:", -[NSDateComponents isLeapMonth](v12, "isLeapMonth"));
  }

  uint64_t v14 = -[NSDateComponents valueForComponent:](v12, "valueForComponent:", 0x8000LL);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v14;
    uint64_t v16 = [v13 valueForComponent:0x8000];
    unint64_t v17 = v15 - v16;
    if (v15 - v16 < 0) {
      unint64_t v17 = v16 - v15;
    }
    if (v17 > 0x1F4) {
      return 0;
    }
    -[NSDateComponents setNanosecond:](v12, "setNanosecond:", 0LL);
    [v13 setNanosecond:0];
  }

  return [v13 isEqual:v12];
}

- (id)gregorianStartDate
{
  return 0LL;
}

- (BOOL)rangeOfUnit:(NSCalendarUnit)unit startDate:(NSDate *)datep interval:(NSTimeInterval *)tip forDate:(NSDate *)date
{
  return 0;
}

- (NSArray)eraSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterEraSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)monthSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)weekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSString)AMSymbol
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterAMSymbolKey");
  CFRelease(v3);
  return v4;
}

- (NSString)PMSymbol
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterPMSymbolKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)longEraSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterLongEraSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterStandaloneMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortStandaloneMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortStandaloneMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortStandaloneMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterStandaloneWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortStandaloneWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortStandaloneWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty( v3,  @"kCFDateFormatterVeryShortStandaloneWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)quarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortQuarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneQuarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterStandaloneQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneQuarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (CFLocaleRef)-[NSCalendar locale](self, "locale"),  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortStandaloneQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (BOOL)isDateInWeekend:(NSDate *)date
{
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v3);
  return 0;
}

- (BOOL)nextWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip options:(NSCalendarOptions)options afterDate:(NSDate *)date
{
  int v6 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v6);
  return 0;
}

- (void)enumerateDatesStartingAfterDate:(NSDate *)start matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)opts usingBlock:(void *)block
{
}

- (NSCalendarIdentifier)calendarIdentifier
{
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v2);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (void)setLocale:(NSLocale *)locale
{
}

- (NSLocale)locale
{
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v2);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
}

- (NSTimeZone)timeZone
{
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v2);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (void)setFirstWeekday:(NSUInteger)firstWeekday
{
}

- (NSUInteger)firstWeekday
{
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v2);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (void)setMinimumDaysInFirstWeek:(NSUInteger)minimumDaysInFirstWeek
{
}

- (NSUInteger)minimumDaysInFirstWeek
{
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v2);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (NSRange)minimumRangeOfUnit:(NSCalendarUnit)unit
{
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v3);
  OUTLINED_FUNCTION_5_3();
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSRange)maximumRangeOfUnit:(NSCalendarUnit)unit
{
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v3);
  OUTLINED_FUNCTION_5_3();
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSRange)rangeOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
{
  NSUInteger v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v5);
  OUTLINED_FUNCTION_5_3();
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSUInteger)ordinalityOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
{
  NSUInteger v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v5);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (NSDate)dateFromComponents:(NSDateComponents *)comps
{
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v3);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date
{
  NSUInteger v4 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v4);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (NSDate)dateByAddingComponents:(NSDateComponents *)comps toDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  NSUInteger v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v5);
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate options:(NSCalendarOptions)opts
{
  NSUInteger v6 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_23(v6);
  OUTLINED_FUNCTION_3_6();
  return result;
}

@end