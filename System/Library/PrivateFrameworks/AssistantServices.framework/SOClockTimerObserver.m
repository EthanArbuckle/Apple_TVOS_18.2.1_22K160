@interface SOClockTimerObserver
+ (id)sharedObserver;
@end

@implementation SOClockTimerObserver

+ (id)sharedObserver
{
  if (qword_100577BD8 != -1) {
    dispatch_once(&qword_100577BD8, &stru_1004F0068);
  }
  return (id)qword_100577BE0;
}

@end