@interface PaymentRewardsBalance
+ (id)_monetaryValueUsingProperties:(id)a3 values:(const void *)a4;
+ (id)_predicateForBalanceIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertOrUpdateRewardsBalances:(id)a3 withPass:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateRewardsBalances:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)rewardsBalancesForPass:(id)a3 inDatabase:(id)a4;
+ (id)rewardsBalancesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)rewardsBalancesWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsBalanceForPass:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsBalanceForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
- (PaymentRewardsBalance)initWithPaymentRewardsBalance:(id)a3 paymentPass:(id)a4 orderIndex:(unint64_t)a5 inDatabase:(id)a6;
- (id)paymentRewardsBalance;
@end

@implementation PaymentRewardsBalance

+ (id)databaseTable
{
  return @"coffeebeans";
}

+ (id)insertOrUpdateRewardsBalances:(id)a3 withPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 deleteRewardsBalanceForPass:v9 inDatabase:v10];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1003A930C;
  v17[3] = &unk_100640EE0;
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v22 = a1;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v11 = v21;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  sub_1002CCC5C((uint64_t)v12, v17);
  id v15 = -[NSMutableArray copy](v11, "copy");

  return v15;
}

+ (id)insertOrUpdateRewardsBalances:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v9, a4));
  if (v10) {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 insertOrUpdateRewardsBalances:v8 withPass:v10 inDatabase:v9]);
  }
  else {
    v11 = &__NSArray0__struct;
  }

  return v11;
}

+ (id)rewardsBalancesWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBalanceIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentRewardsBalance]);
  return v9;
}

+ (id)rewardsBalancesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  v26 = @"order_index";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v25 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_1003A96E0;
  v21 = &unk_100639BF0;
  v23 = v12;
  id v24 = a1;
  id v22 = v11;
  id v14 = v12;
  id v15 = v11;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:&v18];

  id v16 = -[NSMutableArray copy](v14, "copy", v18, v19, v20, v21);
  return v16;
}

+ (id)_monetaryValueUsingProperties:(id)a3 values:(const void *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = 0LL;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v28;
    v25 = a4;
LABEL_3:
    uint64_t v14 = 0LL;
    uint64_t v26 = v11;
    id v15 = &a4[v11];
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v7);
      }
      id v16 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      if (objc_msgSend(v16, "isEqualToString:", @"d", v25))
      {
        v17 = (void *)v15[v14];
        if (v17 == v6) {
          v17 = 0LL;
        }
        id v18 = v12;
        id v12 = v17;
      }

      else
      {
        v17 = (void *)v15[v14];
        if (v17 == v6) {
          v17 = 0LL;
        }
        id v18 = v10;
        id v10 = v17;
      }

      id v19 = v17;

LABEL_15:
      if (v12 && v10)
      {

        uint64_t v20 = PKCurrencyStorageNumberToCurrencyDecimal(v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v22 = PKCurrencyAmountMake(v21, v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        goto LABEL_23;
      }

      if (v9 == (id)++v14)
      {
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        a4 = v25;
        uint64_t v11 = v26 + v14;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
  }

  id v12 = 0LL;
  id v10 = 0LL;
LABEL_22:
  v23 = 0LL;
  v21 = v7;
LABEL_23:

  return v23;
}

+ (id)rewardsBalancesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v6, a3));
  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 rewardsBalancesForPass:v7 inDatabase:v6]);
  }
  else {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

+ (void)deleteRewardsBalanceForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteRewardsBalanceForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:"));
  if (v5) {
    [a1 deleteRewardsBalanceForPass:v5 inDatabase:v6];
  }
}

- (id)paymentRewardsBalance
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentRewardsBalance);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003A9BA4;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  uint64_t v11 = v8;

  return v11;
}

+ (id)_predicateForBalanceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPaymentPass:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10065AB68;
  v4[1] = &stru_10065AB88;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_10065ABA8;
  v4[3] = &stru_10065ABC8;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_10065ABE8;
  v4[5] = &stru_10065AC08;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_10065AC28;
  v4[7] = &stru_10065AC48;
  v3[8] = @"i";
  v3[9] = @"j";
  v4[8] = &stru_10065AC68;
  v4[9] = &stru_10065AC88;
  v3[10] = @"k";
  v4[10] = &stru_10065ACA8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
}

- (PaymentRewardsBalance)initWithPaymentRewardsBalance:(id)a3 paymentPass:(id)a4 orderIndex:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v14 = [v11 persistentID];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v15, @"pass_pid");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v16, @"a");

  -[NSMutableDictionary setInteger:forKey:](v13, "setInteger:forKey:", [v12 type], @"b");
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
  uint64_t v18 = PKCurrencyDecimalToStorageNumber(v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v19, @"c");

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 monetaryValue]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 amount]);
  uint64_t v22 = PKCurrencyDecimalToStorageNumber(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v23, @"d");

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v24, @"e");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v12 conversionRate]);
  uint64_t v26 = PKCurrencyDecimalToStorageNumber(v25);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v27, @"f");

  -[NSMutableDictionary setInteger:forKey:]( v13,  "setInteger:forKey:",  [v12 roundingStrategy],  @"g");
  -[NSMutableDictionary setInteger:forKey:](v13, "setInteger:forKey:", [v12 eligibility], @"h");
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v12 programName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v28, @"i");

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v12 programURL]);
  __int128 v30 = (void *)_SQLValueForURL(v29);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v30, @"j");

  v31 = (void *)objc_claimAutoreleasedReturnValue([v12 lastFetchedAt]);
  v32 = (void *)_SQLValueForDate(v31);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v32, @"k");

  -[NSMutableDictionary setInteger:forKey:](v13, "setInteger:forKey:", a5, @"order_index");
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___PaymentRewardsBalance;
  v33 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v35, "initWithPropertyValues:inDatabase:", v13, v10);

  return v33;
}

@end