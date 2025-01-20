@interface NSRelativeDateTimeFormatter
- (NSCalendar)calendar;
- (NSFormattingContext)formattingContext;
- (NSLocale)locale;
- (NSRelativeDateTimeFormatterStyle)dateTimeStyle;
- (NSRelativeDateTimeFormatterUnitsStyle)unitsStyle;
- (NSString)localizedStringForDate:(NSDate *)date relativeToDate:(NSDate *)referenceDate;
- (NSString)localizedStringFromTimeInterval:(NSTimeInterval)timeInterval;
- (NSString)stringForObjectValue:(id)obj;
- (id)_stringForCalendarUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)_stringFromDateComponents:(id)a3;
- (void)_clearFormatter;
- (void)dealloc;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDateTimeStyle:(NSRelativeDateTimeFormatterStyle)dateTimeStyle;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setLocale:(NSLocale *)locale;
- (void)setUnitsStyle:(NSRelativeDateTimeFormatterUnitsStyle)unitsStyle;
@end

@implementation NSRelativeDateTimeFormatter

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSRelativeDateTimeFormatter;
  -[NSRelativeDateTimeFormatter dealloc](&v4, sel_dealloc);
}

- (void)_clearFormatter
{
  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }
  self->_formatter = 0LL;
}

- (void)setLocale:(NSLocale *)locale
{
  v3 = self->_locale;
  if (v3 != locale)
  {
    self->_locale = (NSLocale *)-[NSLocale copy](locale, "copy");

    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }

- (NSLocale)locale
{
  if (self->_locale) {
    return self->_locale;
  }
  else {
    return -[NSCalendar locale](-[NSRelativeDateTimeFormatter calendar](self, "calendar"), "locale");
  }
}

- (void)setCalendar:(NSCalendar *)calendar
{
  v3 = self->_calendar;
  if (v3 != calendar)
  {
    self->_calendar = (NSCalendar *)-[NSCalendar copy](calendar, "copy");

    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }

- (NSCalendar)calendar
{
  result = self->_calendar;
  if (!result) {
    return (NSCalendar *)[MEMORY[0x189603F38] autoupdatingCurrentCalendar];
  }
  return result;
}

- (void)setUnitsStyle:(NSRelativeDateTimeFormatterUnitsStyle)unitsStyle
{
  if (self->_unitsStyle != unitsStyle)
  {
    self->_unitsStyle = unitsStyle;
    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }

- (NSRelativeDateTimeFormatterUnitsStyle)unitsStyle
{
  return self->_unitsStyle;
}

- (void)setDateTimeStyle:(NSRelativeDateTimeFormatterStyle)dateTimeStyle
{
  if (self->_dateTimeStyle != dateTimeStyle)
  {
    self->_dateTimeStyle = dateTimeStyle;
    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }

- (NSRelativeDateTimeFormatterStyle)dateTimeStyle
{
  return self->_dateTimeStyle;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  if (self->_formattingContext != formattingContext)
  {
    self->_formattingContext = formattingContext;
    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }

- (NSFormattingContext)formattingContext
{
  return self->_formattingContext;
}

- (NSString)localizedStringFromTimeInterval:(NSTimeInterval)timeInterval
{
  uint64_t v5 = [MEMORY[0x189603F50] date];
  return -[NSRelativeDateTimeFormatter localizedStringForDate:relativeToDate:]( self,  "localizedStringForDate:relativeToDate:",  [MEMORY[0x189603F50] dateWithTimeInterval:v5 sinceDate:timeInterval],  v5);
}

- (NSString)localizedStringForDate:(NSDate *)date relativeToDate:(NSDate *)referenceDate
{
  return (NSString *)-[NSRelativeDateTimeFormatter _stringFromDateComponents:]( self,  "_stringFromDateComponents:",  -[NSCalendar components:fromDate:toDate:options:]( -[NSRelativeDateTimeFormatter calendar](self, "calendar"),  "components:fromDate:toDate:options:",  4348LL,  referenceDate,  date,  0LL));
}

- (NSString)stringForObjectValue:(id)obj
{
  if (obj && _NSIsNSDate()) {
    return -[NSRelativeDateTimeFormatter localizedStringForDate:relativeToDate:]( self,  "localizedStringForDate:relativeToDate:",  obj,  [MEMORY[0x189603F50] date]);
  }
  else {
    return 0LL;
  }
}

- (id)_stringForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  if (!self->_formatter)
  {
    -[NSRelativeDateTimeFormatter locale](self, "locale", a3, a4);
    self->_formatter = (__CFRelativeDateTimeFormatter *)_CFRelativeDateTimeFormatterCreate();
  }

  StringWithCalendarUnit = (const void *)_CFRelativeDateTimeFormatterCreateStringWithCalendarUnit();
  return (id)CFAutorelease(StringWithCalendarUnit);
}

- (id)_stringFromDateComponents:(id)a3
{
  uint64_t v4 = 0LL;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1895F87A8];
  uint64_t v21 = 0LL;
  v9 = __57__NSRelativeDateTimeFormatter__stringFromDateComponents___block_invoke;
  v10 = &unk_189C9E698;
  uint64_t v14 = 0LL;
  v15 = &v14;
  v8[1] = 3221225472LL;
  id v11 = a3;
  v12 = &v18;
  v13 = &v14;
  do
  {
    char v22 = 0;
    v9((uint64_t)v8, allAllowedUnits[v4], &v22);
    if (v22) {
      break;
    }
  }

  while (v4++ != 6);
  if (v19[3] && v15[3] != 0x7FFFFFFFFFFFFFFFLL) {
    id v6 = -[NSRelativeDateTimeFormatter _stringForCalendarUnit:value:](self, "_stringForCalendarUnit:value:");
  }
  else {
    id v6 = 0LL;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

uint64_t __57__NSRelativeDateTimeFormatter__stringFromDateComponents___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
    if (result) {
      *a3 = 1;
    }
  }

  return result;
}

@end