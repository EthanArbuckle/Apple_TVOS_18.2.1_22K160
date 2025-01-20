@interface AccountVirtualCardStatusUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountVirtualCardStatusUpdate;
+ (id)databaseTable;
+ (id)insertVirtualCardStatusUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)virtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)virtualCardStatusUpdate;
@end

@implementation AccountVirtualCardStatusUpdate

+ (id)virtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1000F1F7C;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertVirtualCardStatusUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v8, "reason"), @"b");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v11 forKey:@"a"];

  id v12 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v9];
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 updatedVirtualCards]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    id v15 =  +[VirtualCard insertVirtualCards:forVirtualCardStatusUpdatePID:inDatabase:]( VirtualCard,  "insertVirtualCards:forVirtualCardStatusUpdatePID:inDatabase:",  v14,  [v12 persistentID],  v9);
  }

  return v12;
}

- (id)virtualCardStatusUpdate
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountVirtualCardStatusUpdate _propertySettersForAccountVirtualCardStatusUpdate]( &OBJC_CLASS___AccountVirtualCardStatusUpdate,  "_propertySettersForAccountVirtualCardStatusUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000F21F8;
  v10[3] = &unk_100638EF0;
  id v11 = v4;
  id v6 = v3;
  id v12 = v6;
  id v13 = self;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v10);

  id v8 = v6;
  return v8;
}

+ (void)deleteVirtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[VirtualCard deleteVirtualCardsForVirtualCardStatusUpdatePID:inDatabase:]( &OBJC_CLASS___VirtualCard,  "deleteVirtualCardsForVirtualCardStatusUpdatePID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AccountVirtualCardStatusUpdate;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)databaseTable
{
  return @"blueberries";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAccountVirtualCardStatusUpdate
{
  int64_t v3 = @"b";
  v4 = &stru_100643B90;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end