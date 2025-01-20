@interface TVSettingsMicrophoneAccessFacade
+ (id)sharedInstance;
@end

@implementation TVSettingsMicrophoneAccessFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EAE68;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1CD0 != -1) {
    dispatch_once(&qword_1001E1CD0, block);
  }
  return (id)qword_1001E1CC8;
}

@end