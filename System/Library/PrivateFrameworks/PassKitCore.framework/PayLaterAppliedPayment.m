@interface PayLaterAppliedPayment
+ (id)_appliedPaymentsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForDisputePID:(int64_t)a3;
+ (id)_predicateForInstallmentPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAppliedPayment;
+ (id)_propertyValuesForPayLaterAppliedPayment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)payLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5;
- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amountApplied;
@end

@implementation PayLaterAppliedPayment

+ (id)databaseTable
{
  return @"oregano";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterInstallment, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlanDispute, v4) == a3) {
    return @"b";
  }
  return 0LL;
}

- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterAppliedPayment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterAppliedPayment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"b"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterAppliedPaymentsForInstallmentPID:a4 inDatabase:v9];
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v15);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend( v17,  "initWithPayLaterAppliedPayment:forInstallmentPID:inDatabase:",  v16,  a4,  v9,  (void)v21);
        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v18);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  id v19 = -[NSMutableArray copy](v10, "copy");
  return v19;
}

+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterAppliedPaymentsForDisputePID:a4 inDatabase:v9];
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v15);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend(v17, "initWithPayLaterAppliedPayment:forDisputePID:inDatabase:", v16, a4, v9, (void)v21);
        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v18);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  id v19 = -[NSMutableArray copy](v10, "copy");
  return v19;
}

+ (id)payLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _appliedPaymentsWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)payLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisputePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _appliedPaymentsWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)_appliedPaymentsWithPredicate:(id)a3 inDatabase:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a4 predicate:a3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterAppliedPayment]);
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_1002F7EA8;
  id v17 = &unk_100638F18;
  id v18 = v5;
  id v19 = v6;
  v20 = v7;
  id v21 = a1;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  [v11 enumeratePersistentIDsAndProperties:v8 usingBlock:&v14];

  id v12 = -[NSMutableArray copy](v9, "copy", v14, v15, v16, v17);
  return v12;
}

+ (void)deletePayLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deletePayLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForDisputePID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PayLaterAppliedPayment;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

- (id)_amountApplied
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

+ (id)_predicateForInstallmentPID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForDisputePID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_propertyValuesForPayLaterAppliedPayment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"c");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 amountApplied]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 amount]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"d");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 amountApplied]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"e");

  id v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

+ (id)_propertySettersForPayLaterAppliedPayment
{
  id v3 = @"c";
  uint64_t v4 = &stru_100655400;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end