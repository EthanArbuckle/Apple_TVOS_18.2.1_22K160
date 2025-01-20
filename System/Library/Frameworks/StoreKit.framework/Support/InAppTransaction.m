@interface InAppTransaction
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isFinished;
- (NSString)receipt;
@end

@implementation InAppTransaction

- (BOOL)isFinished
{
  return -[SQLiteMemoryEntity BOOLValueForProperty:](self, "BOOLValueForProperty:", @"is_finished");
}

- (NSString)receipt
{
  return (NSString *)-[SQLiteMemoryEntity stringValueForProperty:](self, "stringValueForProperty:", @"receipt");
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___InAppTransactionEntity);
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_id";
  v3[1] = @"is_finished";
  v3[2] = @"is_upgraded";
  v3[3] = @"product_id";
  v3[4] = @"product_type";
  v3[5] = @"receipt";
  v3[6] = @"revocation_date";
  v3[7] = @"transaction_date";
  v3[8] = @"transaction_id";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  9LL));
}

@end