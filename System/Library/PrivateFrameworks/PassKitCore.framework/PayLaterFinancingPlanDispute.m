@interface PayLaterFinancingPlanDispute
+ (id)_diputesForQuery:(id)a3;
+ (id)_predicateForDisputeIdentifier:(id)a3;
+ (id)_predicateForDisputeState:(unint64_t)a3;
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_predicateForFinancingPlanPID:(int64_t)a3 disputeIdentifier:(id)a4;
+ (id)_propertySettersForFinancingPlanDispute;
+ (id)_propertyValuesForFinancingPlanDispute:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)disputeIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4;
+ (id)financingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateFinancingPlanDisputes:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFinancingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanDispute)initWithFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)disputeIdentifier;
- (id)planIdentifier;
- (void)updateWithFinancingPlanDispute:(id)a3;
@end

@implementation PayLaterFinancingPlanDispute

+ (id)databaseTable
{
  return @"chickpeas";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlan, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterFinancingPlanDispute)initWithFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForFinancingPlanDispute:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdateFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4 disputeIdentifier:v10]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v11]);

  if (v12) {
    [v12 updateWithFinancingPlanDispute:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithFinancingPlanDispute:v9 forFinancingPlanPID:a4 inDatabase:v8];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 appliedPayments]);

  id v14 =  +[PayLaterAppliedPayment insertOrUpdatePayLaterAppliedPayments:forDisputePID:inDatabase:]( PayLaterAppliedPayment,  "insertOrUpdatePayLaterAppliedPayments:forDisputePID:inDatabase:",  v13,  [v12 persistentID],  v8);
  return v12;
}

+ (id)insertOrUpdateFinancingPlanDisputes:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteFinancingPlanDisputesForFinancingPlanPID:a4 inDatabase:v9];
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertOrUpdateFinancingPlanDispute:forFinancingPlanPID:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  a4,  v9,  (void)v19));
        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v16);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  id v17 = -[NSMutableArray copy](v10, "copy");
  return v17;
}

- (void)updateWithFinancingPlanDispute:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForFinancingPlanDispute:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)disputeIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisputeState:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_100388714;
  v16 = &unk_10063BCB0;
  id v17 = v6;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v18 = v9;
  id v10 = v6;
  [v8 enumeratePersistentIDsUsingBlock:&v13];
  if (-[NSMutableSet count](v9, "count", v13, v14, v15, v16)) {
    id v11 = -[NSMutableSet copy](v9, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)financingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  uint64_t v14 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v13 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _diputesForQuery:v10]);
  return v11;
}

+ (id)_diputesForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForFinancingPlanDispute]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003889B8;
  v15[3] = &unk_100646948;
  __int128 v19 = v6;
  id v20 = a1;
  id v16 = v5;
  id v17 = v7;
  id v18 = v4;
  id v9 = v6;
  id v10 = v4;
  id v11 = v7;
  id v12 = v5;
  [v10 enumeratePersistentIDsAndProperties:v8 usingBlock:v15];

  id v13 = -[NSMutableArray copy](v9, "copy");
  return v13;
}

+ (void)deleteFinancingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterAppliedPayment deletePayLaterAppliedPaymentsForDisputePID:inDatabase:]( &OBJC_CLASS___PayLaterAppliedPayment,  "deletePayLaterAppliedPaymentsForDisputePID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterFinancingPlanDispute;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3 disputeIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisputeIdentifier:v6]);

  v12[0] = v7;
  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForDisputeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForDisputeState:(unint64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v3));

  return v4;
}

- (id)planIdentifier
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlan anyInDatabase:withPlanPID:]( &OBJC_CLASS___PayLaterFinancingPlan,  "anyInDatabase:withPlanPID:",  self->super._database,  v3));
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)disputeIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b");
}

+ (id)_propertyValuesForFinancingPlanDispute:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 emailAddress]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"h");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 state], @"c");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 requiredDocuments], @"i");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 openDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 deadlineDate]);
  id v12 = (void *)_SQLValueForDate(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"f");

  id v13 = -[NSMutableDictionary copy](v4, "copy");
  return v13;
}

+ (id)_propertySettersForFinancingPlanDispute
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_1006590D8;
  v4[1] = &stru_1006590F8;
  v3[2] = @"i";
  v3[3] = @"d";
  v4[2] = &stru_100659118;
  v4[3] = &stru_100659138;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_100659158;
  v4[5] = &stru_100659178;
  v3[6] = @"h";
  v4[6] = &stru_100659198;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end