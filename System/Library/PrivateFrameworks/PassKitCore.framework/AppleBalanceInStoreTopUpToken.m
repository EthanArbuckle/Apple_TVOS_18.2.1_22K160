@interface AppleBalanceInStoreTopUpToken
+ (id)_commonDictionaryForInStoreTopUpToken:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForInStoreTopUpToken;
+ (id)databaseTable;
+ (id)inStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteInStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AppleBalanceInStoreTopUpToken)initWithInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)topUpToken;
- (void)updateWithInStoreTopUpToken:(id)a3;
@end

@implementation AppleBalanceInStoreTopUpToken

+ (id)databaseTable
{
  return @"garlic";
}

- (AppleBalanceInStoreTopUpToken)initWithInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForInStoreTopUpToken:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    id v10 = [objc_alloc((Class)a1) initWithInStoreTopUpToken:v9 forAccountPID:a4 inDatabase:v8];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (void)deleteInStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)insertOrUpdateInStoreTopUpToken:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v10]);

  if (v11) {
    [v11 updateWithInStoreTopUpToken:v9];
  }
  else {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AppleBalanceInStoreTopUpToken insertInStoreTopUpToken:forAccountPID:inDatabase:]( &OBJC_CLASS___AppleBalanceInStoreTopUpToken,  "insertInStoreTopUpToken:forAccountPID:inDatabase:",  v9,  a4,  v8));
  }

  return v11;
}

- (void)updateWithInStoreTopUpToken:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForInStoreTopUpToken:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)inStoreTopUpTokenForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topUpToken]);
  return v9;
}

- (id)topUpToken
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAppleBalanceInStoreTopUpToken);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForInStoreTopUpToken");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10038D3C4;
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

+ (id)_propertySettersForInStoreTopUpToken
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100659320;
  v4[1] = &stru_100659340;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100659360;
  v4[3] = &stru_100659380;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_1006593A0;
  v4[5] = &stru_1006593C0;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_1006593E0;
  v4[7] = &stru_100659400;
  v3[8] = @"j";
  v4[8] = &stru_100659420;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_commonDictionaryForInStoreTopUpToken:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 token]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 tokenType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 tokenIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
  id v9 = (void *)_SQLValueForDate(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 state]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"f");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 termsURL]);
  v12 = (void *)_SQLValueForURL(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"g");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 certificateChain]);
  id v14 = _SQLValueForCertificateChain(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"h");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 payload]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"i");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 signature]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"j");

  return v4;
}

@end