@interface PayLaterFinancingOption
+ (id)_commonDictionaryForFinancingOption:(id)a3;
+ (id)_predicateForEligibleSpendPID:(int64_t)a3;
+ (id)_predicateForEligibleSpendPID:(int64_t)a3 identifier:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForFinancingOption;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterFinancingOptions:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingOption)initWithPayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_installmentAmount;
- (id)_installmentFees;
- (id)_totalAmount;
- (id)_totalFees;
- (id)_totalInterest;
- (id)_totalPrincipal;
- (void)updateWithFinancingOption:(id)a3;
@end

@implementation PayLaterFinancingOption

+ (id)databaseTable
{
  return @"wasabi";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterAccountProductEligibleSpend, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterFinancingOption)initWithPayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForFinancingOption:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertOrUpdatePayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEligibleSpendPID:a4 identifier:v10]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v11]);

  if (v12) {
    [v12 updateWithFinancingOption:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterFinancingOption:v9 forEligibleSpendPID:a4 inDatabase:v8];
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 installments]);

  id v14 =  +[PayLaterFinancingOptionInstallment insertOrUpdatePayLaterFinancingOptionInstallments:forFinancingOptionPID:inDatabase:]( PayLaterFinancingOptionInstallment,  "insertOrUpdatePayLaterFinancingOptionInstallments:forFinancingOptionPID:inDatabase:",  v13,  [v12 persistentID],  v8);
  return v12;
}

+ (id)insertOrUpdatePayLaterFinancingOptions:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:a4 inDatabase:v9];
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
        v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertOrUpdatePayLaterFinancingOption:forEligibleSpendPID:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  a4,  v9,  (void)v19));
        if (v16) {
          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }

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

+ (void)deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForEligibleSpendPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterFinancingOptionInstallment deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingOptionInstallment,  "deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterFinancingOption;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)payLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEligibleSpendPID:a3]);
  v26 = @"h";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForFinancingOption]);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  __int128 v20 = sub_1003A3EF0;
  __int128 v21 = &unk_100638F18;
  id v22 = v6;
  id v23 = v10;
  v24 = v11;
  id v25 = a1;
  id v13 = v11;
  id v14 = v10;
  id v15 = v6;
  [v9 enumeratePersistentIDsAndProperties:v12 usingBlock:&v18];

  id v16 = -[NSMutableArray copy](v13, "copy", v18, v19, v20, v21);
  return v16;
}

- (void)updateWithFinancingOption:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForFinancingOption:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForEligibleSpendPID:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEligibleSpendPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v6]);

  v12[0] = v7;
  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForEligibleSpendPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_propertySettersForFinancingOption
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065A6C0;
  v4[1] = &stru_10065A6E0;
  v3[2] = @"e";
  v3[3] = @"g";
  v4[2] = &stru_10065A700;
  v4[3] = &stru_10065A720;
  v3[4] = @"h";
  v4[4] = &stru_10065A740;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

- (id)_totalAmount
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"i"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"j"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v10];
  }

  return v11;
}

- (id)_totalInterest
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"k"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"l"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v10];
  }

  return v11;
}

- (id)_totalPrincipal
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"m"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"n"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v10];
  }

  return v11;
}

- (id)_totalFees
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"o"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"p"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v10];
  }

  return v11;
}

- (id)_installmentAmount
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"q"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"r"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v10];
  }

  return v11;
}

- (id)_installmentFees
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"s"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"t"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v10];
  }

  return v11;
}

+ (id)_commonDictionaryForFinancingOption:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 productType], @"c");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 installmentCount], @"e");
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 hasAPR], @"g");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 apr]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v6),  @"h");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currencyAmount]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 amount]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v9),  @"i");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"j");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 totalInterest]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currencyAmount]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 amount]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v15),  @"k");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 totalInterest]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currencyAmount]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"l");

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 totalPrincipal]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currencyAmount]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 amount]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v21),  @"m");

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 totalPrincipal]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 currencyAmount]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"n");

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 totalFees]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currencyAmount]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 amount]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v27),  @"o");

  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 totalFees]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 currencyAmount]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v30, @"p");

  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentAmount]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 currencyAmount]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 amount]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v33),  @"q");

  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentAmount]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 currencyAmount]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v36, @"r");

  v37 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentFees]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 currencyAmount]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 amount]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v39),  @"s");

  v40 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentFees]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 currencyAmount]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v42, @"t");

  return v4;
}

@end