@interface PayLaterPaymentFundingSource
+ (id)_paymentFundingSourcesWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForInstallmentPaymentPID:(int64_t)a3;
+ (id)_propertySettersForFundingSource;
+ (id)_propertyValuesForFundingSource:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentFundingSourcesForPaymentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateInstallmentPaymentFundingSources:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PayLaterPaymentFundingSource)initWithFundingSource:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5;
- (id)fundingSource;
- (id)refundAmount;
- (void)updateWithFundingSource:(id)a3;
@end

@implementation PayLaterPaymentFundingSource

+ (id)databaseTable
{
  return @"tamarillo";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterPayment, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFundingSourceDetails, v4) == a3) {
    return @"b";
  }
  return 0LL;
}

- (PayLaterPaymentFundingSource)initWithFundingSource:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForFundingSource:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (void)insertOrUpdateInstallmentPaymentFundingSources:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  +[PayLaterPaymentFundingSource deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:inDatabase:]( &OBJC_CLASS___PayLaterPaymentFundingSource,  "deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:inDatabase:",  a4,  v9);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v14);
        id v16 = objc_alloc((Class)a1);
        id v17 = objc_msgSend(v16, "initWithFundingSource:forInstallmentPaymentPID:inDatabase:", v15, a4, v9, (void)v21);
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 details]);
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFundingSourceDetails insertFundingSourceDetails:inDatabase:]( &OBJC_CLASS___PayLaterFundingSourceDetails,  "insertFundingSourceDetails:inDatabase:",  v18,  v9));

          v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v19 persistentID]));
          [v17 setValue:v20 forProperty:@"b"];
        }

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }
}

- (void)updateWithFundingSource:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForFundingSource:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)paymentFundingSourcesForPaymentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPaymentPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentFundingSourcesWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (void)deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPaymentPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFundingSourceDetails anyInDatabase:forPID:]( &OBJC_CLASS___PayLaterFundingSourceDetails,  "anyInDatabase:forPID:",  v3,  v4));
  [v5 deleteFromDatabase];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PayLaterPaymentFundingSource;
  return -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");
}

+ (id)_paymentFundingSourcesWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForFundingSource]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10037452C;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v11 = v9;
  v20 = v11;
  id v12 = v6;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  if (-[NSMutableArray count](v11, "count", v15, v16, v17, v18)) {
    id v13 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

- (id)fundingSource
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterPaymentFundingSource);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForFundingSource");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100374670;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)refundAmount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ec"));
  objc_super v7 = (void *)v6;
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

+ (id)_predicateForInstallmentPaymentPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForFundingSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"c");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 type], @"d");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 refundAmount]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 amount]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 refundAmount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"ec");

  id v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

+ (id)_propertySettersForFundingSource
{
  v3[0] = @"c";
  v3[1] = @"d";
  v4[0] = &stru_100658540;
  v4[1] = &stru_100658560;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end