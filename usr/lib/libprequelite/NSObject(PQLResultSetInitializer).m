@interface NSObject(PQLResultSetInitializer)
- (uint64_t)initFromPQLResultSet:()PQLResultSetInitializer error:;
@end

@implementation NSObject(PQLResultSetInitializer)

- (uint64_t)initFromPQLResultSet:()PQLResultSetInitializer error:
{
  id v6 = a3;
  if ([v6 columns] == 1)
  {
    uint64_t v7 = [v6 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
  }

  else
  {
    if (a4)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:20 andMessage:@"This result set has more than one column"];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    a1 = (void *)[a1 init];
    uint64_t v7 = 0LL;
  }

  return v7;
}

@end