@interface AFHomeAnnouncementObserver
+ (id)sharedObserver;
@end

@implementation AFHomeAnnouncementObserver

+ (id)sharedObserver
{
  if (qword_1005782F8 != -1) {
    dispatch_once(&qword_1005782F8, &stru_1004F8CD0);
  }
  return (id)qword_100578300;
}

@end