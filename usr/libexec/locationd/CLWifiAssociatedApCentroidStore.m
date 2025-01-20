@interface CLWifiAssociatedApCentroidStore
- (BOOL)addRecord:(id)a3;
- (BOOL)deleteAllRecords;
- (BOOL)deleteRecordsByMac:(id)a3;
- (BOOL)deleteRecordsLastUpdatedEarlierThan:(double)a3;
- (BOOL)isEmpty;
- (id)fetchAllRecords;
- (id)fetchAllRecordsForMac:(id)a3;
- (id)fetchRecord:(id)a3;
- (id)getSampleMacs:(int)a3;
- (int)count;
@end

@implementation CLWifiAssociatedApCentroidStore

- (BOOL)addRecord:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1009988F8;
  v5[3] = &unk_10181A328;
  v5[4] = self;
  v5[5] = a3;
  -[NSManagedObjectContext performBlockAndWait:]( -[CLStore managedObjectContext](self, "managedObjectContext"),  "performBlockAndWait:",  v5);
  return -[CLStore commitChangesToStore](self, "commitChangesToStore");
}

- (BOOL)deleteAllRecords
{
  return -[CLStore deleteRecordsWithEntityName:byAndPredicates:]( self,  "deleteRecordsWithEntityName:byAndPredicates:",  NSStringFromClass(v3),  &__NSArray0__struct);
}

- (BOOL)deleteRecordsByMac:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", @"mac = %@", a3);
  objc_opt_class(&OBJC_CLASS___CLWifiAssociatedApCentroidMO);
  v7 = v4;
  return -[CLStore deleteRecordsWithEntityName:byAndPredicates:]( self,  "deleteRecordsWithEntityName:byAndPredicates:",  NSStringFromClass(v5),  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
}

- (BOOL)deleteRecordsLastUpdatedEarlierThan:(double)a3
{
  v4 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"lastUpdated < %f",  *(void *)&a3);
  objc_opt_class(&OBJC_CLASS___CLWifiAssociatedApCentroidMO);
  v7 = v4;
  return -[CLStore deleteRecordsWithEntityName:byAndPredicates:]( self,  "deleteRecordsWithEntityName:byAndPredicates:",  NSStringFromClass(v5),  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
}

- (id)fetchAllRecords
{
  return -[CLStore fetchRecordsWithEntityName:byAndPredicates:]( self,  "fetchRecordsWithEntityName:byAndPredicates:",  NSStringFromClass(v3),  &__NSArray0__struct);
}

- (id)fetchAllRecordsForMac:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", @"mac = %@", a3);
  objc_opt_class(&OBJC_CLASS___CLWifiAssociatedApCentroidMO);
  v7 = v4;
  return -[CLStore fetchRecordsWithEntityName:byAndPredicates:]( self,  "fetchRecordsWithEntityName:byAndPredicates:",  NSStringFromClass(v5),  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
}

- (id)fetchRecord:(id)a3
{
  id v3 = -[CLWifiAssociatedApCentroidStore fetchAllRecordsForMac:](self, "fetchAllRecordsForMac:", a3);
  if (!v3) {
    return 0LL;
  }
  v4 = v3;
  if (![v3 count]) {
    return 0LL;
  }
  int v5 = [v4 count];
  uint64_t v6 = (v5 - 1);
  if (v5 >= 2)
  {
    uint64_t v7 = 0LL;
    do

    while (v6 != v7);
  }

  return [v4 objectAtIndex:(int)v6];
}

- (int)count
{
  id v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___CLWifiAssociatedApCentroidMO);
  v4 = NSStringFromClass(v3);
  return -[CLStore countRecordsWithEntityName:predicates:]( self,  "countRecordsWithEntityName:predicates:",  v4,  &__NSArray0__struct);
}

- (BOOL)isEmpty
{
  return -[CLWifiAssociatedApCentroidStore count](self, "count") == 0;
}

- (id)getSampleMacs:(int)a3
{
  if (a3 < 1) {
    return &stru_1018A4B00;
  }
  id v4 = -[CLWifiAssociatedApCentroidStore fetchAllRecords](self, "fetchAllRecords");
  if (!v4) {
    return &stru_1018A4B00;
  }
  int v5 = v4;
  if (![v4 count]) {
    return &stru_1018A4B00;
  }
  int v6 = [v5 count];
  if (v6 <= a3) {
    LODWORD(v7) = 0;
  }
  else {
    LODWORD(v7) = arc4random_uniform(v6 - a3);
  }
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if ((int)v7 < v6)
  {
    uint64_t v7 = (int)v7;
    do
    {
      objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v5, "objectAtIndex:", v7++), "mac"));
    }

    while (v6 != v7);
  }

  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; [v5 objectAtIndex:i++])
      ;
  }

  return objc_msgSend(v9, "componentsJoinedByString:", @", ");
}

@end