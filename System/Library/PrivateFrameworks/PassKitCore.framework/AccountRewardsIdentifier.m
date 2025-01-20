@interface AccountRewardsIdentifier
+ (id)_predicateForAccountRewardsPID:(int64_t)a3;
+ (id)identifiersWithAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteIdentifiersWithAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertIdentifiers:(id)a3 forAccountRewardsPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation AccountRewardsIdentifier

+ (void)insertIdentifiers:(id)a3 forAccountRewardsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v8;
  id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v15 setObjectOrNull:v14 forKey:@"b"];
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
        [v15 setObject:v16 forKey:@"a"];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }
}

+ (id)identifiersWithAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountRewardsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v19 = @"pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100067088;
  v15[3] = &unk_100639BF0;
  id v18 = a1;
  id v16 = v6;
  id v11 = v9;
  id v17 = v11;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v15];

  if ([v11 count]) {
    id v13 = [v11 copy];
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

+ (void)deleteIdentifiersWithAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountRewardsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)_predicateForAccountRewardsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

@end