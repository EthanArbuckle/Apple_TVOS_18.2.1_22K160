@interface TransactionEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
- (int64_t)_typeForDownload:(id)a3;
@end

@implementation TransactionEntity

+ (id)databaseTable
{
  return @"trnsaction";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___Transaction);
}

- (int64_t)_typeForDownload:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:@"kind"]);
  if ([v4 isEqualToString:SSDownloadKindSoftwareApplication])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:@"is_automatic"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:@"is_restore"]);
    if ([v5 integerValue] == (id)2)
    {
      int64_t v7 = 2LL;
    }

    else if ([v6 BOOLValue])
    {
      int64_t v7 = 3LL;
    }

    else
    {
      int64_t v7 = 1LL;
    }
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return v7;
}

@end