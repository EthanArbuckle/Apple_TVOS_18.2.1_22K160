@interface DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer

+ (void)initialize
{
  if (qword_1000CCCD8 != -1) {
    dispatch_once(&qword_1000CCCD8, &stru_10009EA80);
  }
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000CCCE8 != -1) {
    dispatch_once(&qword_1000CCCE8, &stru_10009EAA0);
  }
  return (id)qword_1000CCCE0;
}

@end