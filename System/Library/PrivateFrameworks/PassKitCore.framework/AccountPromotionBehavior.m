@interface AccountPromotionBehavior
+ (id)_anyInDatabase:(id)a3 withAccountPID:(int64_t)a4;
+ (id)_insertAccountPromotionBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAccountPromotionBehavior;
+ (id)_propertyValuesForPromotionBehavior:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountPromotionBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAccountPromotionBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountPromotionBehavior:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPromotionBehavior)initWithAccountPromotionBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountPromotionBehavior;
- (void)_updateWithAccountPromotionBehavior:(id)a3 accountPID:(int64_t)a4;
@end

@implementation AccountPromotionBehavior

+ (id)databaseTable
{
  return @"nashi";
}

- (AccountPromotionBehavior)initWithAccountPromotionBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPromotionBehavior _propertyValuesForPromotionBehavior:accountPID:]( &OBJC_CLASS___AccountPromotionBehavior,  "_propertyValuesForPromotionBehavior:accountPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)accountPromotionBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:a4 withAccountPID:a3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountPromotionBehavior]);

  return v5;
}

+ (id)_anyInDatabase:(id)a3 withAccountPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

+ (void)insertOrUpdateAccountPromotionBehavior:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:v8 withAccountPID:a4]);
  v10 = v9;
  if (v9) {
    [v9 _updateWithAccountPromotionBehavior:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountPromotionBehavior:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountPromotionBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountPromotionBehavior:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountPromotionBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (void)_updateWithAccountPromotionBehavior:(id)a3 accountPID:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AccountPromotionBehavior _propertyValuesForPromotionBehavior:accountPID:]( &OBJC_CLASS___AccountPromotionBehavior,  "_propertyValuesForPromotionBehavior:accountPID:",  a3,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  return [a1 queryWithDatabase:a4 predicate:a3];
}

+ (id)_propertySettersForAccountPromotionBehavior
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065AA00;
  v4[1] = &stru_10065AA20;
  v3[2] = @"d";
  v4[2] = &stru_10065AA40;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

- (id)accountPromotionBehavior
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPromotionBehavior);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountPromotionBehavior");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003A830C;
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

+ (id)_propertyValuesForPromotionBehavior:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  [v5 minRefreshPeriod];
  objc_msgSend(v6, "setDouble:forKey:", @"b");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "maxImpressionCount"), @"c");
  [v5 timeVisibleAfterCompleted];
  double v9 = v8;

  [v6 setDouble:@"d" forKey:v9];
  id v10 = [v6 copy];

  return v10;
}

@end