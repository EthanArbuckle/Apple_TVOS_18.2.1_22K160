@interface TVSettingsPhotosAccessFacade
+ (id)sharedInstance;
@end

@implementation TVSettingsPhotosAccessFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004D478;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E16E8 != -1) {
    dispatch_once(&qword_1001E16E8, block);
  }
  return (id)qword_1001E16E0;
}

@end