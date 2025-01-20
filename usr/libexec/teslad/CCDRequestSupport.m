@interface CCDRequestSupport
+ (id)userAgentString;
@end

@implementation CCDRequestSupport

+ (id)userAgentString
{
  if (qword_100021618 != -1) {
    dispatch_once(&qword_100021618, &stru_100018988);
  }
  return (id)qword_100021610;
}

@end