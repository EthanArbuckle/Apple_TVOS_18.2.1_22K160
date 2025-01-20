@interface PassType
+ (id)_insertionDictionaryWithPassTypeID:(id)a3 teamID:(id)a4;
+ (id)_passTypeIDPredicate:(id)a3;
+ (id)_passTypeIdentifierHashPredicate:(id)a3;
+ (id)anyInDatabase:(id)a3 withPassTypeID:(id)a4;
+ (id)anyInDatabase:(id)a3 withPassTypeIdentifierHash:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassTypeWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (PassType)initWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5;
- (double)frequencyScore;
- (id)identifierHash;
- (id)lastPushDate;
- (id)lastUpdateDate;
- (id)passTypeID;
- (id)teamID;
- (void)updateFrequencyScore:(double)a3;
- (void)updateIdentifierHash;
- (void)updateLastPushDate:(id)a3;
- (void)updateLastUpdateDate:(id)a3;
@end

@implementation PassType

+ (id)databaseTable
{
  return @"pass_type";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  v5 = @"pid";
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) != a3 && (Class)objc_opt_class(&OBJC_CLASS___WebService, v4) != a3) {
    return 0LL;
  }
  return (id)v5;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  v9[0] = @"pass.pid";
  v9[1] = @"pass.template";
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  unsigned int v8 = [v7 containsObject:v6];

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass_type.pid = pass.pass_type_pid"];
  }
}

+ (id)_insertionDictionaryWithPassTypeID:(id)a3 teamID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 SHA256Hash]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hexEncoding]);

  [v7 setObjectOrNull:v10 forKey:@"identifier_hash"];
  [v7 setObjectOrNull:v6 forKey:@"identifier"];

  [v7 setObjectOrNull:v5 forKey:@"team_identifier"];
  return v7;
}

- (PassType)initWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[PassType _insertionDictionaryWithPassTypeID:teamID:]( &OBJC_CLASS___PassType,  "_insertionDictionaryWithPassTypeID:teamID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

- (id)lastPushDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_push_date"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)lastUpdateDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_update_date"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (double)frequencyScore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"push_frequency_score"));
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)passTypeID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (id)teamID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"team_identifier");
}

- (id)identifierHash
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier_hash");
}

- (void)updateLastPushDate:(id)a3
{
}

- (void)updateLastUpdateDate:(id)a3
{
}

- (void)updateFrequencyScore:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"push_frequency_score");
}

- (void)updateIdentifierHash
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PassType passTypeID](self, "passTypeID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 SHA256Hash]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 hexEncoding]);

  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v6, @"identifier_hash");
}

+ (id)insertPassTypeWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPassTypeID:v10 teamID:v9 inDatabase:v8];

  return v11;
}

+ (id)_passTypeIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_passTypeIdentifierHashPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier_hash",  a3);
}

+ (id)anyInDatabase:(id)a3 withPassTypeID:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _passTypeIDPredicate:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPassTypeIdentifierHash:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _passTypeIdentifierHashPredicate:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

@end