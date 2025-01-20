@interface NSCKDatabaseMetadata
+ (NSManagedObject)databaseMetadataForScope:(uint64_t)a3 forStore:(void *)a4 inContext:(uint64_t)a5 error:;
+ (NSString)entityPath;
- (BOOL)hasSubscription;
- (int64_t)databaseScope;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setHasSubscription:(BOOL)a3;
@end

@implementation NSCKDatabaseMetadata

- (BOOL)hasSubscription
{
  return objc_msgSend((id)-[NSCKDatabaseMetadata hasSubscriptionNum](self, "hasSubscriptionNum"), "BOOLValue");
}

- (void)setHasSubscription:(BOOL)a3
{
}

- (int64_t)databaseScope
{
  return objc_msgSend((id)-[NSCKDatabaseMetadata databaseScopeNum](self, "databaseScopeNum"), "integerValue");
}

- (void)setDatabaseScope:(int64_t)a3
{
}

+ (NSManagedObject)databaseMetadataForScope:(uint64_t)a3 forStore:(void *)a4 inContext:(uint64_t)a5 error:
{
  v14[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKDatabaseMetadata entityPath](&OBJC_CLASS___NSCKDatabaseMetadata, "entityPath"));
  v14[0] = a3;
  -[NSFetchRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v14 count:1]);
  -[NSFetchRequest setPredicate:]( v9,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"databaseScopeNum = %@", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", a2)]);
  -[NSFetchRequest setPropertiesToFetch:](v9, "setPropertiesToFetch:", &unk_189F0B2E0);
  v10 = (void *)[a4 executeFetchRequest:v9 error:a5];
  if (!v10) {
    return 0LL;
  }
  v11 = (NSManagedObject *)[v10 lastObject];
  if (!v11)
  {
    v11 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKDatabaseMetadata entityPath](&OBJC_CLASS___NSCKDatabaseMetadata, "entityPath"),  a4);
    -[NSManagedObject setDatabaseScope:](v11, "setDatabaseScope:", a2);
    objc_opt_self();
    else {
      v12 = off_189EAA948[a2 - 1];
    }
    -[NSManagedObject setDatabaseName:](v11, "setDatabaseName:", v12);
    -[NSManagedObject setHasSubscriptionNum:](v11, "setHasSubscriptionNum:", &unk_189F04530);
    [a4 assignObject:v11 toPersistentStore:a3];
  }

  return v11;
}

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

@end