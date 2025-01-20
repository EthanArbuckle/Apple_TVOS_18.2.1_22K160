@interface AccountEventEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation AccountEventEntity

+ (id)databaseTable
{
  return @"account_events";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AccountEvent, a2);
}

@end