@interface CSDFaceTimeAudioIDSService
+ (id)sharedInstance;
@end

@implementation CSDFaceTimeAudioIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010FEA0;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044D040 != -1) {
    dispatch_once(&qword_10044D040, block);
  }
  return (id)qword_10044D038;
}

@end