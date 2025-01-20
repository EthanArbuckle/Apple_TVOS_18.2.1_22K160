@interface VPANVirtualCard
+ (id)_predicateForVirtualCardIdentifier:(id)a3;
+ (id)anyInDatabase:(id)a3 withVirtualCardIdentifier:(id)a4;
+ (id)databaseTable;
+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 cardholderNameFromSafari:(id)a4 inDatabase:(id)a5;
+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 dateLastUsedBySafari:(id)a4 inDatabase:(id)a5;
+ (void)updateVirtualCard:(id)a3 fromDatabase:(id)a4;
- (VPANVirtualCard)initWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4;
- (void)updateCardholderNameFromSafari:(id)a3;
- (void)updateDateLastUsedBySafari:(id)a3;
- (void)updateVirtualCard:(id)a3;
@end

@implementation VPANVirtualCard

- (VPANVirtualCard)initWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v8 setObjectOrNull:v7 forKey:@"a"];

  v9 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v9;
}

+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 dateLastUsedBySafari:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithVirtualCardIdentifier:v10 inDatabase:v8];

  [v11 updateDateLastUsedBySafari:v9];
  return v11;
}

+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 cardholderNameFromSafari:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithVirtualCardIdentifier:v10 inDatabase:v8];

  [v11 updateCardholderNameFromSafari:v9];
  return v11;
}

+ (id)anyInDatabase:(id)a3 withVirtualCardIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForVirtualCardIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (void)updateDateLastUsedBySafari:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)_SQLValueForDate(v4);

  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v5, @"b");
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

- (void)updateCardholderNameFromSafari:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)_SQLValueForString(v4);

  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v5, @"c");
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

+ (void)updateVirtualCard:(id)a3 fromDatabase:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 type] == (id)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[VPANVirtualCard anyInDatabase:withVirtualCardIdentifier:]( &OBJC_CLASS___VPANVirtualCard,  "anyInDatabase:withVirtualCardIdentifier:",  v5,  v6));

    [v7 updateVirtualCard:v8];
  }
}

- (void)updateVirtualCard:(id)a3
{
  id v7 = a3;
  if ([v7 type] == (id)2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
    id v5 = (void *)_DateForSQLValue(v4);

    [v7 setLastAutoFilledBySafari:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
    [v7 setNameFromSafari:v6];
  }
}

+ (id)databaseTable
{
  return @"melomakarono";
}

+ (id)_predicateForVirtualCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

@end