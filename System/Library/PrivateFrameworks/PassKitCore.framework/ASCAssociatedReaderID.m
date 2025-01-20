@interface ASCAssociatedReaderID
+ (id)_associatedReaderIDsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAutomaticSelectionCriterionPID:(int64_t)a3;
+ (id)_predicateForReaderID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)associatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedReaderIDs:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5;
- (ASCAssociatedReaderID)initWithObject:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)associatedReaderID;
- (void)updateWithObject:(id)a3;
@end

@implementation ASCAssociatedReaderID

- (ASCAssociatedReaderID)initWithObject:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesFor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"automatic_selection_criterion_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesFor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)databaseTable
{
  return @"associated_reader_id";
}

+ (id)associatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAutomaticSelectionCriterionPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _associatedReaderIDsWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (void)deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAutomaticSelectionCriterionPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100158E94;
  v10[3] = &unk_10063BE98;
  id v11 = v6;
  id v8 = v6;
  [v7 enumeratePersistentIDsUsingBlock:v10];
  [v7 deleteAllEntities];
}

+ (void)insertOrUpdateAssociatedReaderIDs:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 readerID]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAutomaticSelectionCriterionPID:a4]);
        v35[0] = v12;
        v29 = (void *)v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForReaderID:v11]);
        v35[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
        int64_t v15 = a4;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v17 = (ASCAssociatedReaderID *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v16]);

        if (v17) {
          -[ASCAssociatedReaderID updateWithObject:](v17, "updateWithObject:", v10);
        }
        else {
          v17 = -[ASCAssociatedReaderID initWithObject:forAutomaticSelectionCriterionPID:inDatabase:]( objc_alloc(&OBJC_CLASS___ASCAssociatedReaderID),  "initWithObject:forAutomaticSelectionCriterionPID:inDatabase:",  v10,  v15,  v8);
        }
        a4 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 readerCA]);
        if (v18) {
          +[ASCAssociatedReaderIDReaderCA insertOrUpdateAssociatedReaderIDReaderCA:associatedReaderIDPID:inDatabase:]( &OBJC_CLASS___ASCAssociatedReaderIDReaderCA,  "insertOrUpdateAssociatedReaderIDReaderCA:associatedReaderIDPID:inDatabase:",  v18,  -[SQLiteEntity persistentID](v17, "persistentID"),  v8);
        }
        -[NSMutableSet addObject:](v27, "addObject:", v29);
      }

      id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v28);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"reader_id",  v27));
  v34[0] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAutomaticSelectionCriterionPID:a4]);
  v34[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v22]);
  [v23 deleteAllEntities];
}

+ (id)_associatedReaderIDsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1001592F0;
  v19 = &unk_100638F18;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  uint64_t v11 = v9;
  v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (-[NSMutableSet count](v11, "count", v16, v17, v18, v19)) {
    id v14 = -[NSMutableSet copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

- (id)associatedReaderID
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKASCAssociatedReaderID);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001594DC;
  v16[3] = &unk_100638EF0;
  v16[4] = self;
  id v17 = v6;
  id v8 = v3;
  v18 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v16);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ASCAssociatedReaderIDReaderCA associatedReaderIDReaderCAForAssociatedReaderIDPID:inDatabase:]( &OBJC_CLASS___ASCAssociatedReaderIDReaderCA,  "associatedReaderIDReaderCAForAssociatedReaderIDPID:inDatabase:",  v10,  v11));
  -[PKASCAssociatedReaderID setReaderCA:](v8, "setReaderCA:", v12);

  id v13 = v18;
  id v14 = v8;

  return v14;
}

+ (id)_predicateForAutomaticSelectionCriterionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"automatic_selection_criterion_pid",  v3));

  return v4;
}

+ (id)_predicateForReaderID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"reader_id",  a3);
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 readerID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"reader_id");

  id v6 = [v3 priority];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"priority");

  return v4;
}

+ (id)_propertySetters
{
  v3[0] = @"reader_id";
  v3[1] = @"priority";
  v4[0] = &stru_1006468E8;
  v4[1] = &stru_100646908;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end