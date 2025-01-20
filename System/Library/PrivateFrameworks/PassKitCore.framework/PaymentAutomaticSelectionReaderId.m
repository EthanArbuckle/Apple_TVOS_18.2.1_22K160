@interface PaymentAutomaticSelectionReaderId
+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3;
+ (id)_readerIDsInDatabase:(id)a3 withPredicate:(id)a4;
+ (id)databaseTable;
+ (id)insertReaderIds:(id)a3 withPaymentAutomaticSelectionCriterion:(id)a4 inDatabase:(id)a5;
+ (id)readerIDsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
- (PaymentAutomaticSelectionReaderId)initWithReaderId:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4 database:(id)a5;
@end

@implementation PaymentAutomaticSelectionReaderId

+ (id)databaseTable
{
  return @"payment_automatic_selection_criterion_reader_id";
}

+ (id)readerIDsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _readerIDsInDatabase:v6 withPredicate:v7]);

  return v8;
}

+ (id)_readerIDsInDatabase:(id)a3 withPredicate:(id)a4
{
  if (!a4) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryWithDatabase:predicate:", a3));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v13 = @"reader_id";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100145158;
  v11[3] = &unk_10063C0D0;
  v12 = v5;
  v7 = v5;
  [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v11];

  if (-[NSMutableSet count](v7, "count")) {
    v8 = v7;
  }
  else {
    v8 = 0LL;
  }
  v9 = v8;

  return v9;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertReaderIds:(id)a3 withPaymentAutomaticSelectionCriterion:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v8 count])
  {
    id v11 = [v9 persistentID];
    v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v22 = v8;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [objc_alloc((Class)a1) initWithReaderId:*(void *)(*((void *)&v23 + 1) + 8 * (void)v17) forPaymentAutomaticSelectionCriterionPID:v11 database:v10];
          -[NSMutableArray safelyAddObject:](v12, "safelyAddObject:", v18);

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v15);
    }

    if (-[NSMutableArray count](v12, "count")) {
      v19 = v12;
    }
    else {
      v19 = 0LL;
    }
    v20 = v19;

    id v8 = v22;
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (PaymentAutomaticSelectionReaderId)initWithReaderId:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4 database:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  @"payment_automatic_selection_criterion_pid");

  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = v11;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, @"reader_id");

  id v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v14;
}

+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_automatic_selection_criterion_pid",  v3));

  return v4;
}

@end