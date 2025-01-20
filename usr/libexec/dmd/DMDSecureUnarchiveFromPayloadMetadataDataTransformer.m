@interface DMDSecureUnarchiveFromPayloadMetadataDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation DMDSecureUnarchiveFromPayloadMetadataDataTransformer

+ (void)initialize
{
  if (qword_1000CCDF8 != -1) {
    dispatch_once(&qword_1000CCDF8, &stru_10009F050);
  }
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000CCE08 != -1) {
    dispatch_once(&qword_1000CCE08, &stru_10009F070);
  }
  return (id)qword_1000CCE00;
}

@end