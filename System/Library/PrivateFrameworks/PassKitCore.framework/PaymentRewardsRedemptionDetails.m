@interface PaymentRewardsRedemptionDetails
+ (id)_predicateForPaymentRewardsRedemptionPID:(int64_t)a3;
+ (id)_propertySettersForPaymentRewardsRedemptionDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePaymentRewardsRedemptionDetails:(id)a3 forPaymentRewardsRedemptionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)_intendedDetails;
- (id)_originalTransactionDetails;
- (id)_redeemedDetails;
- (id)paymentRewardsRedemptionDetails;
@end

@implementation PaymentRewardsRedemptionDetails

+ (id)databaseTable
{
  return @"granola_bar";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentRewardsRedemption, a2) == a3) {
    return @"rp";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdatePaymentRewardsRedemptionDetails:(id)a3 forPaymentRewardsRedemptionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:a4 inDatabase:v9];
  if (v8)
  {
    id v11 = objc_msgSend((id)objc_opt_class(a1, v10), "_propertySettersForPaymentRewardsRedemptionDetails:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    [v12 setObjectOrNull:v13 forKey:@"rp"];

    v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___PaymentRewardsRedemptionDetails),  "initWithPropertyValues:inDatabase:",  v12,  v9);
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

+ (id)paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentRewardsRedemptionPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentRewardsRedemptionDetails]);
  return v9;
}

+ (void)deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentRewardsRedemptionPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PaymentRewardsRedemptionDetails;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

- (id)paymentRewardsRedemptionDetails
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentRewardsRedemptionDetails);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentRewardsRedemptionDetails _intendedDetails](self, "_intendedDetails"));
  [v3 setIntended:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentRewardsRedemptionDetails _redeemedDetails](self, "_redeemedDetails"));
  [v3 setRedeemed:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentRewardsRedemptionDetails _originalTransactionDetails](self, "_originalTransactionDetails"));
  [v3 setOriginalTransaction:v6];

  return v3;
}

- (id)_intendedDetails
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
  id v4 = [v3 integerValue];
  uint64_t v6 = PKCurrencyStorageIntegerToCurrencyDecimal(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v9 = PKCurrencyStorageNumberToCurrencyDecimal(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"it"));
  id v13 = [v12 integerValue];

  id v14 = 0LL;
  if (v10 && v11)
  {
    uint64_t v15 = PKCurrencyAmountMake(v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v14 = [[PKPaymentRewardsRedemptionUnit alloc] initWithType:v13 monetaryValue:v16 value:v7];
  }

  return v14;
}

- (id)_redeemedDetails
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  id v4 = [v3 integerValue];
  uint64_t v6 = PKCurrencyStorageIntegerToCurrencyDecimal(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
  uint64_t v9 = PKCurrencyStorageNumberToCurrencyDecimal(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"f"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"rt"));
  id v13 = [v12 integerValue];

  id v14 = 0LL;
  if (v10 && v11)
  {
    uint64_t v15 = PKCurrencyAmountMake(v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v14 = [[PKPaymentRewardsRedemptionUnit alloc] initWithType:v13 monetaryValue:v16 value:v7];
  }

  return v14;
}

- (id)_originalTransactionDetails
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"g"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"h"));
  uint64_t v5 = (void *)_DateForSQLValue(v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"i"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"j"));
  uint64_t v8 = PKCurrencyStorageNumberToCurrencyDecimal(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"k"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"m"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"n"));
  id v13 = (void *)v12;
  if (v3 || v6 || v12)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___PKPaymentRewardsRedemptionTransactionDetails);
    [v14 setIdentifier:v3];
    [v14 setTimestamp:v5];
    [v14 setDescriptionText:v6];
    if (v9 && v10)
    {
      uint64_t v15 = PKCurrencyAmountMake(v9, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v14 setMonetaryValue:v16];
    }

    [v14 setMerchantCategoryCode:v11];
    [v14 setMerchantRawName:v13];
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)_predicateForPaymentRewardsRedemptionPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"rp",  v3));

  return v4;
}

+ (id)_propertySettersForPaymentRewardsRedemptionDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 intended]);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v5 type], @"it");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  uint64_t v7 = PKCurrencyDecimalToStorageNumber(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"a");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 monetaryValue]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 amount]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"b");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"c");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 redeemed]);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v14 type], @"rt");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
  uint64_t v16 = PKCurrencyDecimalToStorageNumber(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"d");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v14 monetaryValue]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 amount]);
  uint64_t v20 = PKCurrencyDecimalToStorageNumber(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"e");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v18 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"f");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 originalTransaction]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"g");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 timestamp]);
  v26 = (void *)_SQLValueForDate(v25);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v26, @"h");

  v27 = (void *)objc_claimAutoreleasedReturnValue([v23 descriptionText]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v27, @"i");

  v28 = (void *)objc_claimAutoreleasedReturnValue([v23 monetaryValue]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 amount]);
  uint64_t v30 = PKCurrencyDecimalToStorageNumber(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v31, @"j");

  v32 = (void *)objc_claimAutoreleasedReturnValue([v28 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v32, @"k");

  v33 = (void *)objc_claimAutoreleasedReturnValue([v23 merchantCategoryCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v33, @"m");

  v34 = (void *)objc_claimAutoreleasedReturnValue([v23 merchantRawName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v34, @"n");

  return v4;
}

@end