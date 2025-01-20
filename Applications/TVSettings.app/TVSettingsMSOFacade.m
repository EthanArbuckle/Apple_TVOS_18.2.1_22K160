@interface TVSettingsMSOFacade
+ (id)sharedInstance;
@end

@implementation TVSettingsMSOFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F024;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E16F8 != -1) {
    dispatch_once(&qword_1001E16F8, block);
  }
  return (id)qword_1001E16F0;
}

@end