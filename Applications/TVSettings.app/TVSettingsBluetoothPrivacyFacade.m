@interface TVSettingsBluetoothPrivacyFacade
+ (id)sharedInstance;
+ (id)whileUsingSharedInstance;
@end

@implementation TVSettingsBluetoothPrivacyFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FC14;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1960 != -1) {
    dispatch_once(&qword_1001E1960, block);
  }
  return (id)qword_1001E1958;
}

+ (id)whileUsingSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FCC0;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1970 != -1) {
    dispatch_once(&qword_1001E1970, block);
  }
  return (id)qword_1001E1968;
}

@end