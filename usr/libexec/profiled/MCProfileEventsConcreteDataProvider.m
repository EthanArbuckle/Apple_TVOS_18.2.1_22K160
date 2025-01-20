@interface MCProfileEventsConcreteDataProvider
- (id)currentTime;
@end

@implementation MCProfileEventsConcreteDataProvider

- (id)currentTime
{
  return +[NSDate date](&OBJC_CLASS___NSDate, "date");
}

@end