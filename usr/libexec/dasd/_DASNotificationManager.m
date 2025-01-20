@interface _DASNotificationManager
+ (id)sharedManager;
- (_DASNotificationManager)init;
- (void)postNotificationAtDate:(id)a3 withTitle:(id)a4 withTextContent:(id)a5 icon:(id)a6 url:(id)a7 expirationDate:(id)a8;
@end

@implementation _DASNotificationManager

- (_DASNotificationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____DASNotificationManager;
  return -[_DASNotificationManager init](&v3, "init");
}

+ (id)sharedManager
{
  if (qword_100157880 != -1) {
    dispatch_once(&qword_100157880, &stru_100115D30);
  }
  return 0LL;
}

- (void)postNotificationAtDate:(id)a3 withTitle:(id)a4 withTextContent:(id)a5 icon:(id)a6 url:(id)a7 expirationDate:(id)a8
{
}

@end