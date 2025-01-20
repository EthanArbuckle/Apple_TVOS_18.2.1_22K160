@interface CSDFaceTimeVideoIDSService
+ (id)sharedInstance;
@end

@implementation CSDFaceTimeVideoIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006728C;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044CEE8 != -1) {
    dispatch_once(&qword_10044CEE8, block);
  }
  return (id)qword_10044CEE0;
}

@end