@interface DMDSecureUnarchiveFromConfigurationSourceDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation DMDSecureUnarchiveFromConfigurationSourceDataTransformer

+ (void)initialize
{
  if (qword_1000CCCA8 != -1) {
    dispatch_once(&qword_1000CCCA8, &stru_10009E678);
  }
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000CCCB8 != -1) {
    dispatch_once(&qword_1000CCCB8, &stru_10009E698);
  }
  return (id)qword_1000CCCB0;
}

@end