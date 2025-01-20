@interface InAppTransactionEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation InAppTransactionEntity

+ (id)databaseTable
{
  return @"iap_receipts";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___InAppTransaction);
}

@end