@interface AccountPromotion
+ (id)_anyInDatabase:(id)a3 withProgramIdentifier:(id)a4 accountPID:(int64_t)a5;
+ (id)_insertAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForProgramIdentifier:(id)a3;
+ (id)_predicateForProgramIdentifier:(id)a3 accountPID:(int64_t)a4;
+ (id)_promotionsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_propertySettersForAccountPromotion;
+ (id)_propertyValuesForPromotion:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountPromotionForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)promotionPIDsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)populateAssociatedCompletionStepsForPromotion:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)updateImpressionCountsForPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPromotion)initWithAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountPromotion;
- (void)_updateWithAccountPromotion:(id)a3 accountPID:(int64_t)a4;
- (void)updateWithPromotionCompletionSteps:(id)a3;
@end

@implementation AccountPromotion

+ (id)databaseTable
{
  return @"yuzu";
}

- (AccountPromotion)initWithAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPromotion _propertyValuesForPromotion:accountPID:]( &OBJC_CLASS___AccountPromotion,  "_propertyValuesForPromotion:accountPID:",  v9,  a4));
  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 completionSteps]);

  if (v13 && [v13 count]) {
    -[AccountPromotion updateWithPromotionCompletionSteps:](v12, "updateWithPromotionCompletionSteps:", v13);
  }

  return v12;
}

+ (id)accountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _promotionsWithPredicate:v7 inDatabase:v6]);
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)promotionPIDsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProgramIdentifier:a3 accountPID:a4]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _queryForPredicate:v9 database:v8]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003F2B0;
    v14[3] = &unk_10063BE98;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v15 = v11;
    [v10 enumeratePersistentIDsUsingBlock:v14];
    if ([v11 count]) {
      id v12 = [v11 copy];
    }
    else {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)_promotionsWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _queryForPredicate:a3 database:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountPromotion]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_10003F420;
  v19 = &unk_100638F18;
  id v20 = v8;
  id v21 = v6;
  id v22 = v9;
  id v23 = a1;
  id v11 = v9;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  id v14 = objc_msgSend(v11, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)_anyInDatabase:(id)a3 withProgramIdentifier:(id)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProgramIdentifier:a4 accountPID:a5]);
  if (v9) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);
  }
  else {
    v10 = 0LL;
  }

  return v10;
}

+ (id)accountPromotionForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:a5 withProgramIdentifier:a3 accountPID:a4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountPromotion]);

  return v6;
}

+ (void)insertOrUpdateAccountPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteAccountPromotionsForAccountPID:a4 inDatabase:v9];
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
        objc_msgSend( a1,  "insertOrUpdateAccountPromotion:accountPID:inDatabase:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v14),  a4,  v9,  (void)v15);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

+ (void)insertOrUpdateAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 programIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:v8 withProgramIdentifier:v9 accountPID:a4]);

  if (v10) {
    [v10 _updateWithAccountPromotion:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountPromotion:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountPromotion:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 programIdentifier]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:v8 withProgramIdentifier:v9 accountPID:a4]);

  [v10 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountPromotionCompletionStep deletePromotionCompletionStepsForPromotionPID:inDatabase:]( &OBJC_CLASS___AccountPromotionCompletionStep,  "deletePromotionCompletionStepsForPromotionPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AccountPromotion;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (void)updateImpressionCountsForPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v15 = [v14 impressionCount];
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 programIdentifier]);
        [a1 updateImpressionCount:v15 promotionProgramIdentifier:v16 accountPID:a4 inDatabase:v9];
      }

      id v11 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

+ (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:a6 withProgramIdentifier:a4 accountPID:a5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v8 setValue:v7 forProperty:@"j"];
}

- (void)_updateWithAccountPromotion:(id)a3 accountPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[AccountPromotion _propertyValuesForPromotion:accountPID:]( &OBJC_CLASS___AccountPromotion,  "_propertyValuesForPromotion:accountPID:",  v6,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 completionSteps]);

  -[AccountPromotion updateWithPromotionCompletionSteps:](self, "updateWithPromotionCompletionSteps:", v7);
}

+ (id)_predicateForProgramIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3));
  }
  else {
    return 0LL;
  }
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForProgramIdentifier:(id)a3 accountPID:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProgramIdentifier:a3]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
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

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  uint64_t v13 = @"d";
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  uint64_t v12 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  return v10;
}

+ (id)_propertySettersForAccountPromotion
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10063BED8;
  v4[1] = &stru_10063BEF8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10063BF18;
  v4[3] = &stru_10063BF38;
  v3[4] = @"f";
  v3[5] = @"i";
  v4[4] = &stru_10063BF58;
  v4[5] = &stru_10063BF78;
  v3[6] = @"j";
  v4[6] = &stru_10063BF98;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

- (id)accountPromotion
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPromotion);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountPromotion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004011C;
  v17[3] = &unk_100638EF0;
  v17[4] = self;
  id v18 = v6;
  id v8 = v3;
  __int128 v19 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v17);

  id v11 = (void *)objc_opt_class(self, v10);
  int64_t v12 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  [v11 populateAssociatedCompletionStepsForPromotion:v8 promotionPID:v12 inDatabase:v13];

  id v14 = v19;
  id v15 = v8;

  return v15;
}

- (void)updateWithPromotionCompletionSteps:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountPromotionCompletionStep insertOrUpdatePromotionCompletionSteps:promotionPID:inDatabase:]( &OBJC_CLASS___AccountPromotionCompletionStep,  "insertOrUpdatePromotionCompletionSteps:promotionPID:inDatabase:",  v4,  v5,  v6);
}

+ (void)populateAssociatedCompletionStepsForPromotion:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v10 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPromotionCompletionStep accountPromotionCompletionStepsForPromotionPID:inDatabase:]( &OBJC_CLASS___AccountPromotionCompletionStep,  "accountPromotionCompletionStepsForPromotionPID:inDatabase:",  a4,  a5));
  if ([v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  [v10 setCompletionSteps:v9];
}

+ (id)_propertyValuesForPromotion:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 programIdentifier]);
  [v6 setObjectOrNull:v8 forKey:@"b"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "type"), @"c");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 startDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  [v6 setObjectOrNull:v10 forKey:@"d"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 endDate]);
  int64_t v12 = (void *)_SQLValueForDate(v11);
  [v6 setObjectOrNull:v12 forKey:@"e"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  [v6 setObjectOrNull:v13 forKey:@"f"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 termsURL]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
  [v6 setObjectOrNull:v15 forKey:@"h"];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 templateIdentifier]);
  [v6 setObjectOrNull:v16 forKey:@"g"];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v5 layoutData]);
  [v6 setObjectOrNull:v17 forKey:@"i"];

  id v18 = [v5 impressionCount];
  [v6 setInteger:v18 forKey:@"j"];
  id v19 = [v6 copy];

  return v19;
}

@end