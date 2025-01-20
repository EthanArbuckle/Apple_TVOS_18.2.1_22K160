@interface NSDate(NSCalendarDateStuff)
- (NSCalendarDate)dateWithCalendarFormat:()NSCalendarDateStuff timeZone:;
- (uint64_t)descriptionWithCalendarFormat:()NSCalendarDateStuff timeZone:locale:;
@end

@implementation NSDate(NSCalendarDateStuff)

- (NSCalendarDate)dateWithCalendarFormat:()NSCalendarDateStuff timeZone:
{
  v6 = +[NSCalendarDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSCalendarDate,  "dateWithTimeIntervalSinceReferenceDate:");
  -[NSCalendarDate setTimeZone:](v6, "setTimeZone:", a4);
  -[NSCalendarDate setCalendarFormat:](v6, "setCalendarFormat:", a3);
  return v6;
}

- (uint64_t)descriptionWithCalendarFormat:()NSCalendarDateStuff timeZone:locale:
{
  id v9 = objc_allocWithZone((Class)&OBJC_CLASS___NSCalendarDate);
  [a1 timeIntervalSinceReferenceDate];
  v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  [v10 setTimeZone:a4];
  [v10 setCalendarFormat:a3];
  uint64_t v11 = [v10 descriptionWithLocale:a5];

  return v11;
}

@end