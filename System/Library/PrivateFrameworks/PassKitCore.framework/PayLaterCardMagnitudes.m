@interface PayLaterCardMagnitudes
+ (id)_commonDictionaryForMagnitudes:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_propertySettersForMagnitudes;
+ (id)databaseTable;
+ (id)insertOrUpdateMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)magnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteMagnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (PayLaterCardMagnitudes)initWithMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
- (id)magnitudes;
- (void)updateWithMagnitudes:(id)a3;
@end

@implementation PayLaterCardMagnitudes

+ (id)databaseTable
{
  return @"radish";
}

- (PayLaterCardMagnitudes)initWithMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_commonDictionaryForMagnitudes:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  [v13 setObjectOrNull:v9 forKey:@"a"];
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);

  return v14;
}

+ (id)insertOrUpdateMagnitudes:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:v9]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);
  if (v12)
  {
    id v13 = v12;
    [v12 updateWithMagnitudes:v8];
  }

  else
  {
    id v13 = [objc_alloc((Class)a1) initWithMagnitudes:v8 forAccountIdentifier:v9 inDatabase:v10];
  }

  return v13;
}

+ (void)deleteMagnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)magnitudesForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 magnitudes]);
  return v9;
}

- (id)magnitudes
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterCardMagnitudes);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForMagnitudes");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F1914;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  uint64_t v11 = v8;

  return v11;
}

- (void)updateWithMagnitudes:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForMagnitudes:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertySettersForMagnitudes
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100643A70;
  v4[1] = &stru_100643A90;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100643AB0;
  v4[3] = &stru_100643AD0;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100643AF0;
  v4[5] = &stru_100643B10;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100643B30;
  v4[7] = &stru_100643B50;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)_commonDictionaryForMagnitudes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 unknownCount], @"b");
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 foodAndDrinksCount],  @"c");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 shoppingCount], @"d");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 travelCount], @"e");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 servicesCount], @"f");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 funCount], @"g");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 healthCount], @"h");
  id v5 = [v3 transportcount];

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v5, @"i");
  return v4;
}

@end