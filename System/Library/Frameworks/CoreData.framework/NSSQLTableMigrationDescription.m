@interface NSSQLTableMigrationDescription
@end

@implementation NSSQLTableMigrationDescription

uint64_t __97___NSSQLTableMigrationDescription__doAttributesHaveChangesRequiringCopyForMigration_withContext___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [a2 count];
  if (result == 2)
  {
    uint64_t result = objc_msgSend( (id)objc_msgSend(a2, "firstObject"),  "isEqualToString:",  objc_msgSend(*(id *)(a1 + 32), "tableName"));
    if ((_DWORD)result)
    {
      uint64_t result = [a2 lastObject];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
      *a4 = 1;
    }
  }

  return result;
}

uint64_t __83___NSSQLTableMigrationDescription_appendStatementsToRenameTables_migrationContext___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "columnName"),  "compare:options:",  objc_msgSend((id)objc_msgSend(a2, "firstObject"), "columnName"),  64);
}

uint64_t __83___NSSQLTableMigrationDescription_appendStatementsToRenameTables_migrationContext___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a3, "firstObject"), "compare:", objc_msgSend(a2, "firstObject"));
}

@end