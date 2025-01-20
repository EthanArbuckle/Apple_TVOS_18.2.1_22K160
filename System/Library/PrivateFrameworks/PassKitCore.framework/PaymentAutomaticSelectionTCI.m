@interface PaymentAutomaticSelectionTCI
+ (id)TCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
+ (id)_TCIsInDatabase:(id)a3 withPredicate:(id)a4;
+ (id)_predicateForIsPrimary:(BOOL)a3;
+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertPrimaryTCIs:(id)a3 TCIs:(id)a4 withPaymentAutomaticSelectionCriterion:(id)a5 inDatabase:(id)a6;
+ (id)primaryTCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
- (PaymentAutomaticSelectionTCI)initWithTCI:(id)a3 primary:(BOOL)a4 forPaymentAutomaticSelectionCriterionPID:(int64_t)a5 database:(id)a6;
@end

@implementation PaymentAutomaticSelectionTCI

+ (id)databaseTable
{
  return @"payment_automatic_selection_criterion_tci";
}

+ (id)primaryTCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4]);
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIsPrimary:1]);
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _TCIsInDatabase:v6 withPredicate:v10]);

  return v11;
}

+ (id)TCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4]);
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIsPrimary:0]);
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _TCIsInDatabase:v6 withPredicate:v10]);

  return v11;
}

+ (id)_TCIsInDatabase:(id)a3 withPredicate:(id)a4
{
  if (!a4) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryWithDatabase:predicate:", a3));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v13 = @"tci";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100172F1C;
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

+ (id)insertPrimaryTCIs:(id)a3 TCIs:(id)a4 withPaymentAutomaticSelectionCriterion:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 && ([v10 count] || objc_msgSend(v11, "count")))
  {
    id v32 = v12;
    id v14 = [v12 persistentID];
    v15 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  (char *)[v10 count] + (void)objc_msgSend(v11, "count"));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v34 = v10;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [objc_alloc((Class)a1) initWithTCI:*(void *)(*((void *)&v39 + 1) + 8 * (void)v20) primary:1 forPaymentAutomaticSelectionCriterionPID:v14 database:v13];
          if (v21) {
            -[NSMutableArray addObject:](v15, "addObject:", v21);
          }

          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }

      while (v18);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v33 = v11;
    id v22 = v11;
    id v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        v26 = 0LL;
        do
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)v26);
          if (!v16
            || ([v16 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * (void)v26)] & 1) == 0)
          {
            id v28 = [objc_alloc((Class)a1) initWithTCI:v27 primary:0 forPaymentAutomaticSelectionCriterionPID:v14 database:v13];
            if (v28) {
              -[NSMutableArray addObject:](v15, "addObject:", v28);
            }
          }

          v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }

      while (v24);
    }

    if (-[NSMutableArray count](v15, "count")) {
      v29 = v15;
    }
    else {
      v29 = 0LL;
    }
    v30 = v29;

    id v11 = v33;
    id v10 = v34;
    id v12 = v32;
  }

  else
  {
    v30 = 0LL;
  }

  return v30;
}

- (PaymentAutomaticSelectionTCI)initWithTCI:(id)a3 primary:(BOOL)a4 forPaymentAutomaticSelectionCriterionPID:(int64_t)a5 database:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v14,  @"payment_automatic_selection_criterion_pid");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, @"is_primary");

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = v13;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v16, @"tci");

  id v17 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v10);
  return v17;
}

+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_automatic_selection_criterion_pid",  v3));

  return v4;
}

+ (id)_predicateForIsPrimary:(BOOL)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_primary",  v3));

  return v4;
}

@end