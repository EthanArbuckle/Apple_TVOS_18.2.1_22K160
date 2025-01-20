@interface PayLaterPayment
+ (id)_paymentsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAssociatedTransactionPaymentHash:(id)a3;
+ (id)_predicateForPaymentIdentifier:(id)a3;
+ (id)_predicateForPaymentIdentifiers:(id)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifier:(id)a4;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4;
+ (id)_propertySettersForPayLaterPayment;
+ (id)_propertyValuesForPayLaterPayment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterPayments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterFinancingPlanIdentifierForPaymentWithPaymentAssociatedTransactionPaymentHash:(id)a3 inDatabase:(id)a4;
+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterPayment)initWithPayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amount;
- (id)_interestPaid;
- (id)_principalPaid;
- (id)planIdentifier;
- (void)updateWithPayLaterPayment:(id)a3;
@end

@implementation PayLaterPayment

+ (id)databaseTable
{
  return @"pineberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlanScheduleSummary, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"huckleberry.b"
    || v7 && (unsigned int v8 = [@"huckleberry.b" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN huckleberry ON huckleberry.pid = asparagus.a"];
    [v6 addObject:@"JOIN asparagus ON asparagus.pid = pineberry.a"];
  }
}

- (PayLaterPayment)initWithPayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterPayment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a4 paymentIdentifier:v10]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v11]);

  if (v12) {
    [v12 updateWithPayLaterPayment:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterPayment:v8 forScheduleSummaryPID:a4 inDatabase:v9];
  }
  id v13 = [v12 persistentID];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 fundingSources]);
  id v15 = [v14 count];

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 fundingSources]);
    +[PayLaterPaymentFundingSource insertOrUpdateInstallmentPaymentFundingSources:forInstallmentPaymentPID:inDatabase:]( &OBJC_CLASS___PayLaterPaymentFundingSource,  "insertOrUpdateInstallmentPaymentFundingSources:forInstallmentPaymentPID:inDatabase:",  v16,  v13,  v9);
  }

  else
  {
    +[PayLaterPaymentFundingSource deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:inDatabase:]( &OBJC_CLASS___PayLaterPaymentFundingSource,  "deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:inDatabase:",  v13,  v9);
  }

  return v12;
}

+ (id)insertOrUpdatePayLaterPayments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterPaymentsForScheduleSummaryPID:a4 inDatabase:v9];
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
      id v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertOrUpdatePayLaterPayment:forScheduleSummaryPID:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  a4,  v9,  (void)v19));
        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v16);

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  id v17 = -[NSMutableArray copy](v10, "copy");
  return v17;
}

- (void)updateWithPayLaterPayment:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterPayment:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3 paymentIdentifiers:a4]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsWithPredicate:v9 inDatabase:v8]);

  return v10;
}

+ (id)payLaterFinancingPlanIdentifierForPaymentWithPaymentAssociatedTransactionPaymentHash:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedTransactionPaymentHash:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  return v9;
}

+ (id)_paymentsWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v30 = @"f";
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  v29 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterPayment]);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  __int128 v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  __int128 v22 = sub_10015AA98;
  v23 = &unk_100646948;
  v27 = v12;
  id v28 = a1;
  id v24 = v10;
  id v25 = v11;
  id v26 = v6;
  uint64_t v14 = v12;
  id v15 = v6;
  id v16 = v11;
  id v17 = v10;
  [v17 enumeratePersistentIDsAndProperties:v13 usingBlock:&v20];

  id v18 = -[NSMutableArray copy](v14, "copy", v20, v21, v22, v23);
  return v18;
}

+ (void)deletePayLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterPaymentFundingSource deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:inDatabase:]( &OBJC_CLASS___PayLaterPaymentFundingSource,  "deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterPayment;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

- (id)_amount
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"g"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"gc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_interestPaid
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"h"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"hc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_principalPaid
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"i"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ic"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)planIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"huckleberry.b");
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentIdentifier:v6]);

  v12[0] = v7;
  v12[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentIdentifiers:v6]);

  v12[0] = v7;
  v12[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPaymentIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForPaymentIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate falsePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "falsePredicate"));
  if ([v4 count])
  {
    id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForPaymentIdentifier:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v11),  (void)v15));
          -[NSMutableArray addObject:](v6, "addObject:", v12);

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));
    uint64_t v5 = (void *)v13;
  }

  return v5;
}

+ (id)_predicateForAssociatedTransactionPaymentHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"l",  a3);
}

+ (id)_propertyValuesForPayLaterPayment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 type], @"d");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 subtype], @"subtype");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 postedDate]);
  id v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"f");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 amount]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"g");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"gc");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 interestPaid]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 amount]);
  uint64_t v16 = PKCurrencyDecimalToStorageNumber(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"h");

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 interestPaid]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"hc");

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v3 principalPaid]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 amount]);
  uint64_t v22 = PKCurrencyDecimalToStorageNumber(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"i");

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 principalPaid]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v25, @"ic");

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedTransactionPaymentHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v26, @"l");

  id v27 = -[NSMutableDictionary copy](v4, "copy");
  return v27;
}

+ (id)_propertySettersForPayLaterPayment
{
  v3[0] = @"b";
  v3[1] = @"d";
  v4[0] = &stru_100646988;
  v4[1] = &stru_1006469A8;
  v3[2] = @"subtype";
  v3[3] = @"f";
  v4[2] = &stru_1006469C8;
  v4[3] = &stru_1006469E8;
  v3[4] = @"l";
  v4[4] = &stru_100646A08;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end