@interface PaymentOfferRewardsCriteria
+ (id)_commonDictionaryForRewardsCriteria:(id)a3;
+ (id)_predicateForCatalogPID:(int64_t)a3;
+ (id)_predicateForEligibleCriteriaWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassSerialNumber:(id)a3;
+ (id)_predicateForPassTypeIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)anyEligiblePaymentOfferRewardsCriteriaInDatabase:(id)a3 withPassTypeIdentifier:(id)a4 passSerialNumber:(id)a5;
+ (id)databaseTable;
+ (id)rewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5;
+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateRewardsCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
@end

@implementation PaymentOfferRewardsCriteria

+ (id)databaseTable
{
  return @"cowboy";
}

+ (void)insertOrUpdateRewardsCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferRewardsCriteriaForCatalogPID:a4 criteria:v8 inDatabase:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonDictionaryForRewardsCriteria:v8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 safelySetObject:v11 forKey:@"c_pid"];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100167DA8;
  v15[3] = &unk_10063FDF8;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = a1;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  sub_1002CCC5C((uint64_t)v13, v15);
}

+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCatalogPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v19]);
  v20[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 passTypeIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassTypeIdentifier:v11]);
  v20[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 passSerialNumber]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSerialNumber:v13]);
  v20[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCatalogPID:a3]);
  v20[3] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 4LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v17]);

  [v18 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[PaymentOfferCurrencyAmount deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:inDatabase:]( &OBJC_CLASS___PaymentOfferCurrencyAmount,  "deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PaymentOfferRewardsCriteria;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)rewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCatalogPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_100168230;
  v20 = &unk_100638F18;
  id v21 = v9;
  id v22 = v6;
  v23 = v10;
  id v24 = a1;
  id v12 = v10;
  id v13 = v6;
  id v14 = v9;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:&v17];

  id v15 = -[NSMutableArray copy](v12, "copy", v17, v18, v19, v20);
  return v15;
}

+ (id)anyEligiblePaymentOfferRewardsCriteriaInDatabase:(id)a3 withPassTypeIdentifier:(id)a4 passSerialNumber:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEligibleCriteriaWithPassTypeIdentifier:a4 passSerialNumber:a5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
    id v12 = objc_alloc_init(&OBJC_CLASS___PKPaymentOfferRewardsCriteria);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10016844C;
    v19[3] = &unk_100647038;
    id v22 = a1;
    id v20 = v11;
    id v14 = v12;
    id v21 = v14;
    id v15 = v11;
    [v10 getValuesForProperties:v13 withApplier:v19];

    id v16 = v21;
    id v17 = v14;
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

+ (id)_predicateForCatalogPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c_pid",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPassTypeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  a3);
}

+ (id)_predicateForPassSerialNumber:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  a3);
}

+ (id)_predicateForEligibleCriteriaWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v5));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  &off_100690080));
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100647078;
  v4[1] = &stru_100647098;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_1006470B8;
  v4[3] = &stru_1006470D8;
  v3[4] = @"e";
  v3[5] = @"i";
  v4[4] = &stru_1006470F8;
  v4[5] = &stru_100647118;
  v3[6] = @"h";
  v3[7] = @"f";
  v4[6] = &stru_100647138;
  v4[7] = &stru_100647158;
  v3[8] = @"ma";
  v3[9] = @"mb";
  v4[8] = &stru_100647178;
  v4[9] = &stru_100647198;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL));
}

+ (id)_commonDictionaryForRewardsCriteria:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 eligibility]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 passSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 passTypeIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 fpanIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"i");

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 redemptionTermsURL]);
  id v12 = (void *)_SQLValueForURL(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"h");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedCurrencyCodes]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"f");

  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportedDeferredPayments],  @"ma");
  id v16 = [v3 supportedRecurringPayments];

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v16, @"mb");
  return v4;
}

@end