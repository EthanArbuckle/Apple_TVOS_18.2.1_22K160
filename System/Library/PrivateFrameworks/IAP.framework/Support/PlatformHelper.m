@interface PlatformHelper
+ (id)sharedInstance;
@end

@implementation PlatformHelper

+ (id)sharedInstance
{
  if (qword_10011BD60 != -1) {
    dispatch_once(&qword_10011BD60, &stru_100104BC0);
  }
  return (id)qword_10011BD58;
}

@end