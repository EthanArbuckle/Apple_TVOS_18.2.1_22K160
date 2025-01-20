@interface NSDate
- (id)descriptionWithFormat:(id)a3;
- (id)roundMinuteToNearstFifteen;
- (id)roundMinuteToNearstFive;
- (id)storedCalendar;
- (id)storedFormatter;
@end

@implementation NSDate

- (id)descriptionWithFormat:(id)a3
{
  id v5 = -[NSDate storedFormatter](self, "storedFormatter");
  [v5 setDateFormat:a3];
  return [v5 stringFromDate:self];
}

- (id)storedFormatter
{
  id result = (id)qword_2AE3E8;
  if (!qword_2AE3E8)
  {
    v3 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"English");
    qword_2AE3E8 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    [(id)qword_2AE3E8 setLocale:v3];

    return (id)qword_2AE3E8;
  }

  return result;
}

- (id)storedCalendar
{
  id result = (id)qword_2AE3F0;
  if (!qword_2AE3F0)
  {
    id result = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
    qword_2AE3F0 = (uint64_t)result;
  }

  return result;
}

- (id)roundMinuteToNearstFifteen
{
  id v3 = objc_msgSend( objc_msgSend(-[NSDate storedCalendar](self, "storedCalendar"), "components:fromDate:", 96, self),  "minute");
  return -[NSDate dateByAddingTimeInterval:]( self,  "dateByAddingTimeInterval:",  (float)((float)((float)(uint64_t)v3 - (float)(floorf((float)(uint64_t)v3 / 15.0) * 15.0)) * -60.0));
}

- (id)roundMinuteToNearstFive
{
  id v3 = objc_msgSend( objc_msgSend(-[NSDate storedCalendar](self, "storedCalendar"), "components:fromDate:", 96, self),  "minute");
  return -[NSDate dateByAddingTimeInterval:]( self,  "dateByAddingTimeInterval:",  (float)((float)((float)(uint64_t)v3 - (float)(floorf((float)(uint64_t)v3 / 5.0) * 5.0)) * -60.0));
}

@end