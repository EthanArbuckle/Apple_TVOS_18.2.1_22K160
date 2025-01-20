@interface PaymentCommutePlanDetail
+ (id)_postProcessValue:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_propertySettersForPaymentPlan;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentPlan:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5;
+ (id)paymentPlansInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (id)updateWitPaymentPlans:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5;
+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (PaymentCommutePlanDetail)initWithPaymentPlan:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5;
- (id)identifier;
- (id)passUniqueIdentifier;
- (id)paymentPlan;
@end

@implementation PaymentCommutePlanDetail

- (PaymentCommutePlanDetail)initWithPaymentPlan:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"a");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"b");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"i");

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 value]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v16, @"e");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 startDate]);
  v18 = (void *)_SQLValueForDate(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v18, @"f");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 expiryDate]);
  v20 = (void *)_SQLValueForDate(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v20, @"g");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 lastUpdateDate]);
  v22 = (void *)_SQLValueForDate(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v22, @"h");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedTitle]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v23, @"c");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v24, @"d");

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PaymentCommutePlanDetail;
  v25 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v27, "initWithPropertyValues:inDatabase:", v11, v8);

  return v25;
}

+ (id)databaseTable
{
  return @"carambola";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  id v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = carambola.a"];
  }
}

+ (id)insertPaymentPlan:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPaymentPlan:v10 paymentPass:v9 inDatabase:v8];

  return v11;
}

+ (id)updateWitPaymentPlans:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  [a1 deleteEntitiesForPass:v9 inDatabase:v10];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertPaymentPlan:withPaymentPass:inDatabase:",  *(void *)(*((void *)&v21 + 1) + 8 * (void)v16),  v9,  v10,  (void)v21));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 paymentPlan]);
        -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v18);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v14);
  }

  id v19 = -[NSMutableArray copy](v11, "copy");
  return v19;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  v18 = @"h";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v17 = @"ASC";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002F8D58;
  v14[3] = &unk_100651A08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a4]);
  id v8 = [a1 countInDatabase:v6 predicate:v7];

  return (int64_t)v8;
}

+ (id)paymentPlansInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a4]);
  v26 = @"h";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v25 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentPlan]);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_1002F8FD8;
  __int128 v21 = &unk_100639BF0;
  __int128 v23 = v12;
  id v24 = a1;
  id v22 = v11;
  id v14 = v12;
  id v15 = v11;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:&v18];

  id v16 = -[NSMutableArray copy](v14, "copy", v18, v19, v20, v21);
  return v16;
}

- (id)paymentPlan
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentCommutePlanDetail);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentCommutePlanDetail _propertySettersForPaymentPlan]( &OBJC_CLASS___PaymentCommutePlanDetail,  "_propertySettersForPaymentPlan"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_1002F9158;
  id v13 = &unk_100639EE8;
  id v14 = v4;
  id v15 = v3;
  id v6 = v3;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v10);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentCommutePlanDetail _postProcessValue:]( &OBJC_CLASS___PaymentCommutePlanDetail,  "_postProcessValue:",  v6,  v10,  v11,  v12,  v13));
  return v8;
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b");
}

- (id)passUniqueIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass.unique_id");
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForPaymentPass:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_propertySettersForPaymentPlan
{
  v3[0] = @"b";
  v3[1] = @"i";
  v4[0] = &stru_100655440;
  v4[1] = &stru_100655460;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100655480;
  v4[3] = &stru_1006554A0;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_1006554C0;
  v4[5] = &stru_1006554E0;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_100655500;
  v4[7] = &stru_100655520;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)_postProcessValue:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
  if (v4)
  {

    BOOL v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 expiryDate]);
    BOOL v5 = v6 == 0LL;
  }

  [v3 setPlanType:v5];
  return v3;
}

@end