@interface CKSiriSettingsMonitor
+ (id)sharedInstance;
@end

@implementation CKSiriSettingsMonitor

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003314;
  block[3] = &unk_100018630;
  block[4] = a1;
  if (qword_10001DE20 != -1) {
    dispatch_once(&qword_10001DE20, block);
  }
  return (id)qword_10001DE28;
}

@end