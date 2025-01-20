@interface WallClock
- (NSDate)now;
@end

@implementation WallClock

- (NSDate)now
{
  return +[NSDate date](&OBJC_CLASS___NSDate, "date");
}

@end