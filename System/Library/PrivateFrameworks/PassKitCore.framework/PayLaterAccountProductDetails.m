@interface PayLaterAccountProductDetails
+ (id)_commonDictionaryForProductDetails:(id)a3;
+ (id)_predicateForProductPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountProductDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterProductDetailsForProductPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterProductDetailsForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4;
- (PayLaterAccountProductDetails)initWithAccountProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amountPaid;
- (id)_currentBalance;
- (id)_maximumSinglePurchaseAmount;
- (id)_minimumSinglePurchaseAmount;
- (id)_totalFinanced;
- (id)productDetails;
- (void)updateWitProductDetails:(id)a3;
@end

@implementation PayLaterAccountProductDetails

+ (id)databaseTable
{
  return @"lucuma";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterAccountProduct, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterAccountProductDetails)initWithAccountProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForProductDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertOrUpdatePayLaterProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a4]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

    if (v11) {
      [v11 updateWitProductDetails:v8];
    }
    else {
      id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithAccountProductDetails:forPayLaterAccountProductPID:inDatabase:",  v8,  a4,  v9);
    }
  }

  else
  {
    [a1 deletePayLaterProductDetailsForPayLaterProductPID:a4 inDatabase:v9];
    id v11 = 0LL;
  }

  return v11;
}

+ (void)deletePayLaterProductDetailsForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)payLaterProductDetailsForProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 productDetails]);
  return v9;
}

- (void)updateWitProductDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForProductDetails:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForProductPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForPayLaterAccountProductDetails
{
  v3 = @"d";
  id v4 = &stru_10064A0E8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)productDetails
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountProductDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterAccountProductDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001B4764;
  v18[3] = &unk_100638EF0;
  v18[4] = self;
  id v19 = v6;
  id v8 = v3;
  v20 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v18);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountProductDetails _minimumSinglePurchaseAmount](self, "_minimumSinglePurchaseAmount"));
  -[PKPayLaterAccountProductDetails setMinimumSinglePurchaseAmount:](v8, "setMinimumSinglePurchaseAmount:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountProductDetails _maximumSinglePurchaseAmount](self, "_maximumSinglePurchaseAmount"));
  -[PKPayLaterAccountProductDetails setMaximumSinglePurchaseAmount:](v8, "setMaximumSinglePurchaseAmount:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountProductDetails _currentBalance](self, "_currentBalance"));
  -[PKPayLaterAccountProductDetails setCurrentBalance:](v8, "setCurrentBalance:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountProductDetails _totalFinanced](self, "_totalFinanced"));
  -[PKPayLaterAccountProductDetails setTotalFinanced:](v8, "setTotalFinanced:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountProductDetails _amountPaid](self, "_amountPaid"));
  -[PKPayLaterAccountProductDetails setAmountPaid:](v8, "setAmountPaid:", v14);

  v15 = v20;
  v16 = v8;

  return v16;
}

- (id)_minimumSinglePurchaseAmount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"f"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"g"));
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

- (id)_maximumSinglePurchaseAmount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"r"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"s"));
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

- (id)_currentBalance
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"l"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"m"));
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

- (id)_totalFinanced
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"n"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"o"));
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

- (id)_amountPaid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"p"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"q"));
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

+ (id)_commonDictionaryForProductDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 productTimeZone]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"d");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 minimumSinglePurchaseAmount]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 amount]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"f");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 minimumSinglePurchaseAmount]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"g");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 maximumSinglePurchaseAmount]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 amount]);
  uint64_t v15 = PKCurrencyDecimalToStorageNumber(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"r");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 maximumSinglePurchaseAmount]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"s");

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 amount]);
  uint64_t v21 = PKCurrencyDecimalToStorageNumber(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"l");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"m");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 totalFinanced]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 amount]);
  uint64_t v27 = PKCurrencyDecimalToStorageNumber(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v28, @"n");

  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 totalFinanced]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v30, @"o");

  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 amountPaid]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 amount]);
  uint64_t v33 = PKCurrencyDecimalToStorageNumber(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v34, @"p");

  v35 = (void *)objc_claimAutoreleasedReturnValue([v3 amountPaid]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v36, @"q");

  return v4;
}

@end