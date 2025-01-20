@interface HMDCoreDataTransformerNSPersistentHistoryToken
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerNSPersistentHistoryToken

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSPersistentHistoryToken, a2);
}

@end