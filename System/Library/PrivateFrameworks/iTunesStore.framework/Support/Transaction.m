@interface Transaction
+ (Class)databaseEntityClass;
@end

@implementation Transaction

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TransactionEntity);
}

@end