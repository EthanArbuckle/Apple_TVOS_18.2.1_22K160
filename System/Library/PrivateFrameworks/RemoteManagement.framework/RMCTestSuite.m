@interface RMCTestSuite
+ (id)registeredClasses;
@end

@implementation RMCTestSuite

+ (id)registeredClasses
{
  if (qword_100025380 != -1) {
    dispatch_once(&qword_100025380, &stru_10001C4E0);
  }
  return (id)qword_100025378;
}

@end