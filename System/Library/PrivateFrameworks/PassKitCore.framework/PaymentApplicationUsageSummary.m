@interface PaymentApplicationUsageSummary
+ (id)_predicateForPassUniqueIdentifier:(id)a3;
+ (id)_predicateForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4;
+ (id)_predicateForPaymentApplicationIdentifier:(id)a3;
+ (id)_propertySettersForObject;
+ (id)_propertyValuesFor:(id)a3;
+ (id)_usageSummariesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)allUsageSummariesInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)usageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateUsageSummary:(id)a3 inDatabase:(id)a4;
- (PaymentApplicationUsageSummary)initWithObject:(id)a3 inDatabase:(id)a4;
- (id)usageSummary;
- (void)updateWithObject:(id)a3;
@end

@implementation PaymentApplicationUsageSummary

- (PaymentApplicationUsageSummary)initWithObject:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesFor:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
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
  return @"payment_application_usage_summary";
}

+ (id)usageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueIdentifier:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _usageSummariesWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)allUsageSummariesInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _usageSummariesWithQuery:v5 inDatabase:v4]);

  return v6;
}

+ (id)_usageSummariesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForObject]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002CF08C;
  v13[3] = &unk_10064B060;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  v15 = v9;
  id v10 = v6;
  [v5 enumerateProperties:v8 usingBlock:v13];

  if (-[NSMutableArray count](v9, "count")) {
    id v11 = -[NSMutableArray copy](v9, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (void)insertOrUpdateUsageSummary:(id)a3 inDatabase:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 passUniqueIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 paymentApplicationIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueIdentifier:v7 paymentApplicationIdentifier:v8]);

  id v10 = (PaymentApplicationUsageSummary *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v9]);
  if (v10)
  {
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentApplicationUsageSummary usageSummary](v10, "usageSummary"));
    [v12 updateWithSummary:v13];
    -[PaymentApplicationUsageSummary updateWithObject:](v11, "updateWithObject:", v12);
  }

  else
  {
    id v11 = -[PaymentApplicationUsageSummary initWithObject:inDatabase:]( objc_alloc(&OBJC_CLASS___PaymentApplicationUsageSummary),  "initWithObject:inDatabase:",  v13,  v6);
  }
}

+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueIdentifier:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueIdentifier:a3 paymentApplicationIdentifier:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v10]);

  [v9 deleteAllEntities];
}

- (id)usageSummary
{
  v3 = objc_alloc(&OBJC_CLASS___PKPaymentApplicationUsageSummary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentApplicationUsageSummary _databaseInit](v3, "_databaseInit"));

  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertySettersForObject");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002CF3F0;
  v14[3] = &unk_100638EF0;
  v14[4] = self;
  id v15 = v7;
  id v9 = v4;
  id v16 = v9;
  id v10 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v8, v14);

  id v11 = v16;
  id v12 = v9;

  return v12;
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueIdentifier:a3]);
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationIdentifier:v6]);

  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_unique_identifier",  a3);
}

+ (id)_predicateForPaymentApplicationIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_identifier",  a3);
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 passUniqueIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"pass_unique_identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentApplicationIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v6,  @"payment_application_identifier");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUsed]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"last_used");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUsedTransaction]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"last_used_transaction");

  return v4;
}

+ (id)_propertySettersForObject
{
  v3[0] = @"pass_unique_identifier";
  v3[1] = @"payment_application_identifier";
  v4[0] = &stru_1006537F8;
  v4[1] = &stru_100653818;
  v3[2] = @"last_used";
  v3[3] = @"last_used_transaction";
  v4[2] = &stru_100653838;
  v4[3] = &stru_100653858;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end