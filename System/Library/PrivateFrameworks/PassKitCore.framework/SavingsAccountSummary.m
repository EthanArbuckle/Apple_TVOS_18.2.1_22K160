@interface SavingsAccountSummary
+ (id)_commonDictionaryForSavingsAccountSummary:(id)a3;
+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForSavingsAccountSummary;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)savingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (SavingsAccountSummary)initWithSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)savingsAccountSummary;
- (void)updateWithSavingsAccountSummary:(id)a3;
@end

@implementation SavingsAccountSummary

+ (id)databaseTable
{
  return @"cranberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___SavingsAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (SavingsAccountSummary)initWithSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForSavingsAccountSummary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithSavingsAccountSummary:v9 forSavingsAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteSavingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSavingsAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)savingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSavingsAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 savingsAccountSummary]);
  return v9;
}

+ (void)updateSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSavingsAccountDetailsPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithSavingsAccountSummary:v12];
  }
  else {
    id v11 =  +[SavingsAccountSummary insertSavingsAccountSummary:forSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountSummary,  "insertSavingsAccountSummary:forSavingsAccountDetailsPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithSavingsAccountSummary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForSavingsAccountSummary:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForSavingsAccountSummary
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100656D68;
  v4[1] = &stru_100656D88;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100656DA8;
  v4[3] = &stru_100656DC8;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100656DE8;
  v4[5] = &stru_100656E08;
  v3[6] = @"i";
  v3[7] = @"j";
  v4[6] = &stru_100656E28;
  v4[7] = &stru_100656E48;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

- (id)savingsAccountSummary
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForSavingsAccountSummary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100323FC8;
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

+ (id)_commonDictionaryForSavingsAccountSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 availableBalance]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"c");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingBalance]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"d");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 interestYTD]);
  uint64_t v15 = PKCurrencyDecimalToStorageNumber(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"e");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 interestTotal]);
  uint64_t v18 = PKCurrencyDecimalToStorageNumber(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"f");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 apy]);
  v21 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PKPercentageDecimalToStorageInteger(v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"g");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 hasWithdrawalLimit], @"i");
  id v23 = [v3 withdrawalsRemaining];

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v23, @"j");
  return v4;
}

@end