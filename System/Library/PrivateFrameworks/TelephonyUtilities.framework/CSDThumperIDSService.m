@interface CSDThumperIDSService
+ (id)sharedInstance;
@end

@implementation CSDThumperIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011C904;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044D050 != -1) {
    dispatch_once(&qword_10044D050, block);
  }
  return (id)qword_10044D048;
}

@end