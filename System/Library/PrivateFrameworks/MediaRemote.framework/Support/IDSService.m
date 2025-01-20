@interface IDSService
+ (id)mr_sharedGroupSessionService;
+ (id)mr_sharedGroupSessionServiceName;
@end

@implementation IDSService

+ (id)mr_sharedGroupSessionServiceName
{
  return @"com.apple.private.alloy.groupRemoteControl.messaging";
}

+ (id)mr_sharedGroupSessionService
{
  if (qword_1003FDD08 != -1) {
    dispatch_once(&qword_1003FDD08, &stru_10039C1D0);
  }
  return (id)qword_1003FDD00;
}

@end