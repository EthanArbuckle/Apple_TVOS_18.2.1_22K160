@interface AccountWebServiceEndpointMetadata
+ (id)_predicateFoEndpoint:(unint64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3 endpoint:(unint64_t)a4;
+ (id)_propertySettersForAccountEndpointMetadata;
+ (id)_propertyValuesForAccountEndpointMetadata:(id)a3;
+ (id)anyInDatabase:(id)a3 accountIdentifier:(id)a4 endpoint:(unint64_t)a5;
+ (id)anyInDatabase:(id)a3 endpointMetadata:(id)a4;
+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4 endpoint:(unint64_t)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateinitWithAccountEndpointMetadata:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountWebServiceEndpointMetadata)initWithAccountEndpointMetadata:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)endpointMetadata;
- (void)updateWithAccountEndpointMetadata:(id)a3;
@end

@implementation AccountWebServiceEndpointMetadata

+ (id)databaseTable
{
  return @"salmonberry";
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

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pears.a"
    || v7
    && (unsigned int v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"pears.a"), v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.pid = salmonberry.a"];
  }
}

- (AccountWebServiceEndpointMetadata)initWithAccountEndpointMetadata:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForAccountEndpointMetadata:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (id)insertOrUpdateinitWithAccountEndpointMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v7,  v8));

  if (v9)
  {
    id v10 = [v9 persistentID];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "anyInDatabase:withAccountPID:endpoint:", v7, v10, objc_msgSend(v6, "endpoint")));
    if (v11)
    {
      id v12 = v11;
      [v11 updateWithAccountEndpointMetadata:v6];
    }

    else
    {
      id v12 = [objc_alloc((Class)a1) initWithAccountEndpointMetadata:v6 accountPID:v10 inDatabase:v7];
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (void)updateWithAccountEndpointMetadata:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForAccountEndpointMetadata:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 endpointMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = [v6 endpoint];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v7 accountIdentifier:v8 endpoint:v9]);
  return v10;
}

+ (id)anyInDatabase:(id)a3 accountIdentifier:(id)a4 endpoint:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v8,  a4));
  id v10 = v9;
  if (v9) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "anyInDatabase:withAccountPID:endpoint:", v8, objc_msgSend(v9, "persistentID"), a5));
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4 endpoint:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4 endpoint:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterFinancingPlan deletePayLaterFinancingPlansForAccountEndpointMetadataPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlan,  "deletePayLaterFinancingPlansForAccountEndpointMetadataPID:inDatabase:",  -[SQLiteEntity persistentID](v2, "persistentID"),  v3);
  v5.receiver = v2;
  v5.super_class = (Class)&OBJC_CLASS___AccountWebServiceEndpointMetadata;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForAccountPID:(int64_t)a3 endpoint:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateFoEndpoint:a4]);
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateFoEndpoint:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v3));

  return v4;
}

- (id)endpointMetadata
{
  v3 = objc_alloc_init(&OBJC_CLASS___PDAccountWebServiceEndpointMetadata);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountEndpointMetadata");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100324994;
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

+ (id)_propertyValuesForAccountEndpointMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localLastUpdated]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"e");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 isDirty], @"c");
  id v9 = [v3 endpoint];

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v9, @"d");
  return v4;
}

+ (id)_propertySettersForAccountEndpointMetadata
{
  v3[0] = @"b";
  v3[1] = @"e";
  v4[0] = &stru_100656E88;
  v4[1] = &stru_100656EA8;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100656EC8;
  v4[3] = &stru_100656EE8;
  v3[4] = @"pears.a";
  v4[4] = &stru_100656F08;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end