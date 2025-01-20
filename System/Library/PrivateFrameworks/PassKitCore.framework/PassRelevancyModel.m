@interface PassRelevancyModel
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertForPass:(id)a3 inDatabase:(id)a4;
+ (id)passRelevancyModelInDatabase:(id)a3 forPass:(id)a4;
+ (id)passRelevancyModelInDatabase:(id)a3 forPassUniqueID:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)initForPass:(id)a3 inDatabase:(id)a4;
- (id)passRelevancyModel;
@end

@implementation PassRelevancyModel

+ (id)databaseTable
{
  return @"pass_relevancy_model";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    v3 = @"pass_pid";
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
}

+ (id)passRelevancyModelInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyInDatabase:predicate:]( &OBJC_CLASS___PassRelevancyModel,  "anyInDatabase:predicate:",  v6,  v7));

  return v8;
}

+ (id)passRelevancyModelInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id result = a4;
  if (result)
  {
    id v8 = result;
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:result]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyInDatabase:predicate:]( &OBJC_CLASS___PassRelevancyModel,  "anyInDatabase:predicate:",  v6,  v9));

    return v10;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (id)initForPass:(id)a3 inDatabase:(id)a4
{
  v11 = @"pass_pid";
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v12 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  v9 = -[SQLiteEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___PassRelevancyModel),  "initWithPropertyValues:inDatabase:",  v8,  v6);
  return v9;
}

- (id)passRelevancyModel
{
  id v2 = -[PKPassRelevancyModel _init](objc_alloc(&OBJC_CLASS___PKPassRelevancyModel), "_init");
  [v2 setRelevancyActive:1];
  return v2;
}

+ (id)insertForPass:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id result = a4;
  if (v5)
  {
    id v7 = result;
    id v8 = -[PassRelevancyModel initForPass:inDatabase:]( objc_alloc(&OBJC_CLASS___PassRelevancyModel),  "initForPass:inDatabase:",  v5,  result);

    return v8;
  }

  else
  {
    __break(1u);
  }

  return result;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

    [v7 deleteAllEntities];
  }

+ (id)_predicateForPass:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PassRelevancyModel;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

@end