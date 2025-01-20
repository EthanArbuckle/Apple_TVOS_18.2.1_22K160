@interface TVSettingsMediaLibraryAccessFacade
+ (id)sharedInstance;
@end

@implementation TVSettingsMediaLibraryAccessFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A6D4;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E16D8 != -1) {
    dispatch_once(&qword_1001E16D8, block);
  }
  return (id)qword_1001E16D0;
}

@end