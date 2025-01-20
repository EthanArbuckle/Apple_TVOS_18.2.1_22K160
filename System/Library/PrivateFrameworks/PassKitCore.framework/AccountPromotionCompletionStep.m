@interface AccountPromotionCompletionStep
+ (id)_anyInDatabase:(id)a3 withPromotionPID:(int64_t)a4 index:(int64_t)a5;
+ (id)_insertAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForIndex:(int64_t)a3;
+ (id)_predicateForPromotionPID:(int64_t)a3;
+ (id)_predicateForPromotionPID:(int64_t)a3 index:(int64_t)a4;
+ (id)_promotionCompletionStepsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_propertySettersForAccountPromotionCompletionStep;
+ (id)_propertyValuesForCompletionStep:(id)a3 promotionPID:(int64_t)a4;
+ (id)accountPromotionCompletionStepsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountPromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deletePromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdatePromotionCompletionSteps:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPromotionCompletionStep)initWithAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)completionStep;
- (void)_updateWithPromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4;
@end

@implementation AccountPromotionCompletionStep

+ (id)databaseTable
{
  return @"tomatillo";
}

- (AccountPromotionCompletionStep)initWithAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPromotionCompletionStep _propertyValuesForCompletionStep:promotionPID:]( &OBJC_CLASS___AccountPromotionCompletionStep,  "_propertyValuesForCompletionStep:promotionPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)accountPromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPromotionPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _promotionCompletionStepsWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)accountPromotionCompletionStepsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPromotion promotionPIDsForProgramIdentifier:accountPID:inDatabase:]( &OBJC_CLASS___AccountPromotion,  "promotionPIDsForProgramIdentifier:accountPID:inDatabase:",  a3,  a4,  v8));
  v10 = v9;
  if (v9 && [v9 count])
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "accountPromotionCompletionStepsForPromotionPID:inDatabase:",  objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)v16),  "longLongValue",  (void)v21),  v8));
          v18 = v17;
          if (v17 && [v17 count]) {
            -[NSMutableSet addObjectsFromArray:](v11, "addObjectsFromArray:", v18);
          }

          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v14);
    }

    if (-[NSMutableSet count](v11, "count")) {
      id v19 = -[NSMutableSet copy](v11, "copy");
    }
    else {
      id v19 = 0LL;
    }
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

+ (id)_promotionCompletionStepsWithPredicate:(id)a3 inDatabase:(id)a4
{
  v26 = @"b";
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v25 = @"ASC";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountPromotionCompletionStep]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_1000BBF34;
  __int128 v21 = &unk_100639BF0;
  id v23 = v12;
  id v24 = a1;
  id v22 = v11;
  id v14 = v12;
  id v15 = v11;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:&v18];

  id v16 = objc_msgSend(v14, "copy", v18, v19, v20, v21);
  return v16;
}

+ (void)insertOrUpdatePromotionCompletionSteps:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePromotionCompletionStepsForPromotionPID:a4 inDatabase:v9];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend( a1,  "insertOrUpdatePromotionCompletionStep:promotionPID:inDatabase:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v14),  a4,  v9,  (void)v15);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

+ (void)insertOrUpdatePromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_anyInDatabase:withPromotionPID:index:", v8, a4, objc_msgSend(v12, "index")));
  id v10 = v9;
  if (v9) {
    [v9 _updateWithPromotionCompletionStep:v12 promotionPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountPromotionCompletionStep:v12 forPromotionPID:a4 inDatabase:v8];
  }
}

+ (id)_anyInDatabase:(id)a3 withPromotionPID:(int64_t)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPromotionPID:a4 index:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)_insertAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountPromotionCompletionStep:v9 forPromotionPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPromotionPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (void)_updateWithPromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AccountPromotionCompletionStep _propertyValuesForCompletionStep:promotionPID:]( &OBJC_CLASS___AccountPromotionCompletionStep,  "_propertyValuesForCompletionStep:promotionPID:",  a3,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

+ (id)_predicateForPromotionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForIndex:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForPromotionPID:(int64_t)a3 index:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPromotionPID:a3]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 _predicateForIndex:a4]);
  id v8 = (void *)v7;
  id v9 = 0LL;
  if (v6 && v7)
  {
    v12[0] = v6;
    v12[1] = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
  }

  return v9;
}

+ (id)_propertySettersForAccountPromotionCompletionStep
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100640C18;
  v4[1] = &stru_100640C38;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100640C58;
  v4[3] = &stru_100640C78;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100640C98;
  v4[5] = &stru_100640CB8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

- (id)completionStep
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPromotionCompletionStep);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountPromotionCompletionStep");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000BC7C0;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  __int128 v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_propertyValuesForCompletionStep:(id)a3 promotionPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "index"), @"b");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "progressType"), @"c");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyCode]);
  [v6 setObjectOrNull:v8 forKey:@"d"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 endValue]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v6 setObjectOrNull:v11 forKey:@"e"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 currentValue]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v6 setObjectOrNull:v14 forKey:@"f"];

  id v15 = [v5 completed];
  [v6 setBool:v15 forKey:@"g"];
  id v16 = [v6 copy];

  return v16;
}

@end