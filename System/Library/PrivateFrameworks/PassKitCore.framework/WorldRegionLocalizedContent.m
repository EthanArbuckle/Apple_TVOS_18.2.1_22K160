@interface WorldRegionLocalizedContent
+ (id)_predicateForLocaleIdentifier:(id)a3;
+ (id)_predicateForWorldRegionPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)localizedNameForWorldRegionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteLocalizedContentForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertName:(id)a3 localeIdentifier:(id)a4 forWorldRegionPID:(int64_t)a5 inDatabase:(id)a6;
@end

@implementation WorldRegionLocalizedContent

+ (id)databaseTable
{
  return @"world_region_localized_content";
}

+ (void)insertName:(id)a3 localeIdentifier:(id)a4 forWorldRegionPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForWorldRegionPID:a5]);
  v25[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v11]);
  v25[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v12 predicate:v16]);
  if (!v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
    [v19 setObjectOrNull:v20 forKey:@"world_region_pid"];

    [v19 setObjectOrNull:v10 forKey:@"name"];
    [v19 setObjectOrNull:v11 forKey:@"locale_identifier"];
    if (v10) {
      v21 = &off_100690650;
    }
    else {
      v21 = &off_100690668;
    }
    [v19 setObjectOrNull:v21 forKey:@"status"];

    goto LABEL_10;
  }

  v23[0] = @"name";
  if (v10)
  {
    v18 = &off_100690650;
    v19 = v10;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v18 = &off_100690668;
  }

  v23[1] = @"status";
  v24[0] = v19;
  v24[1] = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
  [v17 setValuesWithDictionary:v22];

  if (!v10) {
LABEL_10:
  }
}

+ (id)localizedNameForWorldRegionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForWorldRegionPID:a3]);
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v9]);

  v17[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForProperty:@"name"]);

  return v15;
}

+ (void)deleteLocalizedContentForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForWorldRegionPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)_predicateForWorldRegionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_pid",  v3));

  return v4;
}

+ (id)_predicateForLocaleIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"locale_identifier",  a3);
}

@end