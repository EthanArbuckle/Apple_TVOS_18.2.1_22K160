@interface NSCKRecordZoneQuery
+ (NSManagedObject)zoneQueryForRecordType:(void *)a3 inZone:(uint64_t)a4 inStore:(void *)a5 managedObjectContext:(uint64_t)a6 error:;
+ (NSString)entityPath;
- (void)createQueryForUpdatingRecords;
@end

@implementation NSCKRecordZoneQuery

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (void)createQueryForUpdatingRecords
{
  v1 = a1;
  v11[2] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (void *)MEMORY[0x186E3E5D8]();
    id v3 = (id)[v1 predicate];
    uint64_t v4 = [v1 mostRecentRecordModificationDate];
    if (v3)
    {
      if (v4)
      {
        id v5 = objc_alloc(MEMORY[0x189607820]);
        v11[0] = [MEMORY[0x1896079C8] predicateWithFormat:@"modificationDate > %@", objc_msgSend(v1, "mostRecentRecordModificationDate")];
        v11[1] = v3;
        id v6 = (id)objc_msgSend( v5,  "initWithType:subpredicates:",  1,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v11, 2));
      }

      else
      {
        id v6 = v3;
      }
    }

    else
    {
      if (v4) {
        v7 = (void *)[MEMORY[0x1896079C8] predicateWithFormat:@"modificationDate > %@", objc_msgSend(v1, "mostRecentRecordModificationDate")];
      }
      else {
        v7 = (void *)[MEMORY[0x1896079C8] predicateWithValue:1];
      }
      id v6 = v7;
    }

    v8 = v6;

    objc_autoreleasePoolPop(v2);
    v1 = (void *)objc_msgSend( objc_alloc((Class)getCloudKitCKQueryClass[0]()),  "initWithRecordType:predicate:",  objc_msgSend(v1, "recordType"),  v8);
    uint64_t v10 = [MEMORY[0x189607A20] sortDescriptorWithKey:@"modificationDate" ascending:1];
    objc_msgSend(v1, "setSortDescriptors:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v10, 1));
  }

  return v1;
}

+ (NSManagedObject)zoneQueryForRecordType:(void *)a3 inZone:(uint64_t)a4 inStore:(void *)a5 managedObjectContext:(uint64_t)a6 error:
{
  v15[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v11 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneQuery entityPath](&OBJC_CLASS___NSCKRecordZoneQuery, "entityPath"));
  -[NSFetchRequest setPredicate:]( v11,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordType = %@ AND recordZone = %@", a2, objc_msgSend(a3, "objectID")]);
  v15[0] = a4;
  -[NSFetchRequest setAffectedStores:]( v11,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v15 count:1]);
  v12 = (void *)[a5 executeFetchRequest:v11 error:a6];
  if (!v12) {
    return 0LL;
  }
  v13 = (NSManagedObject *)[v12 lastObject];
  if (!v13)
  {
    v13 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordZoneQuery entityPath](&OBJC_CLASS___NSCKRecordZoneQuery, "entityPath"),  a5);
    -[NSManagedObject setRecordType:](v13, "setRecordType:", a2);
    -[NSManagedObject setRecordZone:](v13, "setRecordZone:", a3);
  }

  return v13;
}

@end