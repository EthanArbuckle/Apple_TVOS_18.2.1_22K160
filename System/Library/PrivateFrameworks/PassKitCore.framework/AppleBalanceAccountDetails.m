@interface AppleBalanceAccountDetails
+ (id)_commonDictionaryForAppleBalanceAccountDetails:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAppleBalanceAccountDetails;
+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AppleBalanceAccountDetails)initWithAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountDetails;
- (void)updateWitDetails:(id)a3;
@end

@implementation AppleBalanceAccountDetails

+ (id)databaseTable
{
  return @"broccoli";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (AppleBalanceAccountDetails)initWithAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 appleBalanceDetails]);
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForAppleBalanceAccountDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  id v15 = -[SQLiteEntity persistentID](v14, "persistentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 accountSummary]);
  id v17 =  +[AppleBalanceAccountSummary insertAppleBalanceAccountSummary:forAppleBalanceAccountDetailsPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountSummary,  "insertAppleBalanceAccountSummary:forAppleBalanceAccountDetailsPID:inDatabase:",  v16,  v15,  v8);

  return v14;
}

+ (id)insertOrUpdateAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWitDetails:v8];
  }
  else {
    id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithAccountDetails:forAccountPID:inDatabase:",  v8,  a4,  v9);
  }

  return v11;
}

+ (void)deleteAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[AppleBalanceAccountSummary deleteAppleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountSummary,  "deleteAppleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___AppleBalanceAccountDetails;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountDetails]);
  return v9;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAppleBalanceAccountDetails
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100642D90;
  v4[1] = &stru_100642DB0;
  v3[2] = @"f";
  v3[3] = @"e";
  v4[2] = &stru_100642DD0;
  v4[3] = &stru_100642DF0;
  v3[4] = @"g";
  v3[5] = @"h";
  v4[4] = &stru_100642E10;
  v4[5] = &stru_100642E30;
  v3[6] = @"i";
  v3[7] = @"j";
  v4[6] = &stru_100642E50;
  v4[7] = &stru_100642E70;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

- (id)accountDetails
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKAppleBalanceAccountDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAppleBalanceAccountDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E5CDC;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v3;
  id v8 = v3;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v15);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AppleBalanceAccountSummary appleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountSummary,  "appleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKAppleBalanceAccountDetails setAccountSummary:](v8, "setAccountSummary:", v12);

  id v13 = [[PKAccountDetails alloc] initWithAppleBalanceDetails:v8];
  return v13;
}

+ (id)_commonDictionaryForAppleBalanceAccountDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 createdDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdatedDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"b");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"f");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 fpanIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"g");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedPassSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"h");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedPassTypeIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"i");

  id v14 = [v3 cardType];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"j");

  return v4;
}

- (void)updateWitDetails:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 appleBalanceDetails]);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_commonDictionaryForAppleBalanceAccountDetails:", v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 accountSummary]);
  +[AppleBalanceAccountSummary updateAppleBalanceAccountSummary:forAppleBalanceAccountDetailsPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountSummary,  "updateAppleBalanceAccountSummary:forAppleBalanceAccountDetailsPID:inDatabase:",  v9,  v7,  v8);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

@end