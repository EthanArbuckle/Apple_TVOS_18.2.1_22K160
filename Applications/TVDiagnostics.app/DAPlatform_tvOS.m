@interface DAPlatform_tvOS
+ (id)sharedInstance;
@end

@implementation DAPlatform_tvOS

+ (id)sharedInstance
{
  if (qword_10003A640 != -1) {
    dispatch_once(&qword_10003A640, &stru_10002CF00);
  }
  return (id)qword_10003A638;
}

@end