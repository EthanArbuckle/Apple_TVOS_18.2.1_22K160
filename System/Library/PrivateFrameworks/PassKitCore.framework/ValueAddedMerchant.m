@interface ValueAddedMerchant
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySettersForValueAddedMerchant;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(id)a4;
+ (id)databaseTable;
+ (id)insertValueAddedMerchant:(id)a3 inDatabase:(id)a4;
- (ValueAddedMerchant)initWithValueAddedMerchant:(id)a3 inDatabase:(id)a4;
- (id)valueAddedMerchant;
- (void)updateWithValueAddedMerchant:(id)a3;
@end

@implementation ValueAddedMerchant

- (ValueAddedMerchant)initWithValueAddedMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hexEncoding]);

  [v8 setObjectOrNull:v10 forKey:@"identifier"];
  id v11 = [v7 timesPresented];

  [v8 setInteger:v11 forKey:@"times_presented"];
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);

  return v12;
}

+ (id)insertValueAddedMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithValueAddedMerchant:v7 inDatabase:v6];

  return v8;
}

- (void)updateWithValueAddedMerchant:(id)a3
{
  id v4 = a3;
  database = self->super._database;
  id v10 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hexEncoding]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedMerchant anyInDatabase:withIdentifier:]( &OBJC_CLASS___ValueAddedMerchant,  "anyInDatabase:withIdentifier:",  database,  v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 timesPresented]));
    [v8 setValue:v9 forProperty:@"times_presented"];
  }
}

+ (id)databaseTable
{
  return @"value_added_merchant";
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

- (id)valueAddedMerchant
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKValueAddedMerchant);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedMerchant _propertySettersForValueAddedMerchant]( &OBJC_CLASS___ValueAddedMerchant,  "_propertySettersForValueAddedMerchant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10032C4AC;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  v9 = v6;

  return v9;
}

+ (id)_propertySettersForValueAddedMerchant
{
  v3[0] = @"identifier";
  v3[1] = @"times_presented";
  v4[0] = &stru_100657320;
  v4[1] = &stru_100657340;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end