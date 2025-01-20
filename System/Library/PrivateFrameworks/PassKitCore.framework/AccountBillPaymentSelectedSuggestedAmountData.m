@interface AccountBillPaymentSelectedSuggestedAmountData
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForBillPaymentSelectedSuggestedAmountData;
+ (id)billPaymentSelectedSuggestedAmountDataWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertBillPaymentSelectedSuggestedAmountData:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)predicateForStatementIdentifier:(id)a3;
+ (void)deleteBillPaymentSelectedSuggestedAmountDataPID:(int64_t)a3 inDatabase:(id)a4;
- (id)billPaymentSelectedSuggestedAmountData;
@end

@implementation AccountBillPaymentSelectedSuggestedAmountData

+ (id)billPaymentSelectedSuggestedAmountDataWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v19 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1003DA104;
  v16[3] = &unk_100639E18;
  id v17 = v6;
  id v11 = v9;
  id v18 = v11;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v16];

  v13 = v18;
  id v14 = v11;

  return v14;
}

+ (id)insertBillPaymentSelectedSuggestedAmountData:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 transactionAmount]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  [v10 setObjectOrNull:v13 forKey:@"d"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 statementIdentifier]);
  [v10 setObjectOrNull:v14 forKey:@"b"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 transactionDate]);
  v16 = (void *)_SQLValueForDate(v15);
  [v10 setObjectOrNull:v16 forKey:@"c"];

  id v17 = [v9 suggestedAmountCategory];
  [v10 setInteger:v17 forKey:@"e"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v18 forKey:@"a"];

  id v19 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v19;
}

- (id)billPaymentSelectedSuggestedAmountData
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKBillPaymentSelectedSuggestedAmountData);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountBillPaymentSelectedSuggestedAmountData _propertySettersForBillPaymentSelectedSuggestedAmountData]( &OBJC_CLASS___AccountBillPaymentSelectedSuggestedAmountData,  "_propertySettersForBillPaymentSelectedSuggestedAmountData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003DA3B8;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)predicateForStatementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (void)deleteBillPaymentSelectedSuggestedAmountDataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"starfruits";
}

+ (id)_propertySettersForBillPaymentSelectedSuggestedAmountData
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065C758;
  v4[1] = &stru_10065C778;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10065C798;
  v4[3] = &stru_10065C7B8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end