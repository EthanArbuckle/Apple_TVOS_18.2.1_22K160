@interface TVSettingsCameraAccessFacade
+ (id)sharedInstance;
@end

@implementation TVSettingsCameraAccessFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3CE4;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1A28 != -1) {
    dispatch_once(&qword_1001E1A28, block);
  }
  return (id)qword_1001E1A20;
}

@end