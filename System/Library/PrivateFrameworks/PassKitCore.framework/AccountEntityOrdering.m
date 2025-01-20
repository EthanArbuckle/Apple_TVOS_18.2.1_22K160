@interface AccountEntityOrdering
+ (id)_EntityOrderingsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_anyInDatabase:(id)a3 withContext:(unint64_t)a4 accountPID:(int64_t)a5;
+ (id)_insertAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3 entityType:(unint64_t)a4;
+ (id)_predicateForContext:(unint64_t)a3;
+ (id)_predicateForContext:(unint64_t)a3 accountPID:(int64_t)a4;
+ (id)_propertySettersForAccountEntityOrdering;
+ (id)_propertyValuesForEntityOrdering:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (void)deleteAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountEntityOrderings:(id)a3 accountPID:(int64_t)a4 entityType:(unint64_t)a5 inDatabase:(id)a6;
- (AccountEntityOrdering)initWithAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountEntityOrdering;
- (void)_updateWithAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4;
@end

@implementation AccountEntityOrdering

+ (id)databaseTable
{
  return @"daikon";
}

- (AccountEntityOrdering)initWithAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AccountEntityOrdering _propertyValuesForEntityOrdering:accountPID:]( &OBJC_CLASS___AccountEntityOrdering,  "_propertyValuesForEntityOrdering:accountPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)accountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3 entityType:a4]);
  if (v9) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _EntityOrderingsWithPredicate:v9 inDatabase:v8]);
  }
  else {
    v10 = 0LL;
  }

  return v10;
}

+ (id)_anyInDatabase:(id)a3 withContext:(unint64_t)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForContext:a4 accountPID:a5]);
  if (v9) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);
  }
  else {
    v10 = 0LL;
  }

  return v10;
}

+ (id)_EntityOrderingsWithPredicate:(id)a3 inDatabase:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _queryForPredicate:a3 database:a4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountEntityOrdering]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003DCF88;
  v13[3] = &unk_100639BF0;
  id v15 = v7;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  id v11 = [v9 copy];
  return v11;
}

+ (void)insertOrUpdateAccountEntityOrderings:(id)a3 accountPID:(int64_t)a4 entityType:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [a1 deleteAccountEntityOrderingsForAccountPID:a4 entityType:a5 inDatabase:v11];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend( a1,  "insertOrUpdateAccountEntityOrdering:accountPID:inDatabase:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)v16),  a4,  v11,  (void)v17);
        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }
}

+ (void)insertOrUpdateAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_anyInDatabase:withContext:accountPID:", v8, objc_msgSend(v12, "context"), a4));
  id v10 = v9;
  if (v9) {
    [v9 _updateWithAccountEntityOrdering:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountEntityOrdering:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountEntityOrdering:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3 entityType:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v10]);

  [v9 deleteAllEntities];
}

+ (void)deleteAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_anyInDatabase:withContext:accountPID:", v8, objc_msgSend(a3, "context"), a4));

  [v9 deleteFromDatabase];
}

+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (void)_updateWithAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AccountEntityOrdering _propertyValuesForEntityOrdering:accountPID:]( &OBJC_CLASS___AccountEntityOrdering,  "_propertyValuesForEntityOrdering:accountPID:",  a3,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

+ (id)_predicateForContext:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3 entityType:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v6));

  id v8 = 0LL;
  if (v5 && v7)
  {
    v11[0] = v5;
    v11[1] = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  }

  return v8;
}

+ (id)_predicateForContext:(unint64_t)a3 accountPID:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForContext:a3]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v8 = (void *)v7;
  id v9 = 0LL;
  if (v6 && v7)
  {
    v12[0] = v6;
    v12[1] = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
  }

  return v9;
}

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  return [a1 queryWithDatabase:a4 predicate:a3];
}

+ (id)_propertySettersForAccountEntityOrdering
{
  v3[0] = @"d";
  v3[1] = @"b";
  v4[0] = &stru_10065C9C0;
  v4[1] = &stru_10065C9E0;
  v3[2] = @"c";
  v4[2] = &stru_10065CA00;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

- (id)accountEntityOrdering
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountEntityOrdering);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountEntityOrdering");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003DD88C;
  v13[3] = &unk_100638EF0;
  void v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  uint64_t v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_propertyValuesForEntityOrdering:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "context"), @"b");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 orderingAsJSONString]);
  [v6 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v5 type];
  [v6 setInteger:v9 forKey:@"d"];
  id v10 = [v6 copy];

  return v10;
}

@end