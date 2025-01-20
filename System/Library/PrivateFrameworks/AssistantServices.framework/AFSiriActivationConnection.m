@interface AFSiriActivationConnection
+ (id)sharedConnection;
@end

@implementation AFSiriActivationConnection

+ (id)sharedConnection
{
  if (qword_100577A78 != -1) {
    dispatch_once(&qword_100577A78, &stru_1004EEFC0);
  }
  return (id)qword_100577A80;
}

@end