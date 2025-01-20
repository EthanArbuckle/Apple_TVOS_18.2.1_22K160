@interface PassShareActivationOption
+ (id)_passShareActivationOptionsWithQuery:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassSharePID:(int64_t)a3;
+ (id)_propertySettersForPassShareActivationOption;
+ (id)_propertyValuesForPassShareActivationOption:(id)a3;
+ (id)databaseTable;
+ (id)passShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)mergeInPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
- (PassShareActivationOption)initWithPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
- (id)passShareActivationOption;
- (void)updateWithPassShareActivationOption:(id)a3;
@end

@implementation PassShareActivationOption

+ (id)databaseTable
{
  return @"muffin";
}

- (PassShareActivationOption)initWithPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPassShareActivationOption:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithPassShareActivationOption:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPassShareActivationOption:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (void)mergeInPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue([a1 passShareActivationOptionForPassSharePID:a4 inDatabase:v8]);
  id v10 = [[PKPassShareActivationOptions alloc] initWithOptions:v9];

  id v11 = [[PKPassShareActivationOptions alloc] initWithOptions:v14];
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[PKPassShareActivationOptions optionsFromRemoteOptions:localOptions:]( &OBJC_CLASS___PKPassShareActivationOptions,  "optionsFromRemoteOptions:localOptions:",  v10,  v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 options]);
  [a1 insertOrUpdatePassShareActivationOption:v13 forPassSharePID:a4 inDatabase:v8];
}

+ (void)insertOrUpdatePassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v7;
  id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    int64_t v23 = a4;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSharePID:a4]);
        v33[0] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v11]);
        v33[1] = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v16 = (PassShareActivationOption *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16)
        {
          -[PassShareActivationOption updateWithPassShareActivationOption:]( v16,  "updateWithPassShareActivationOption:",  v10);
          a4 = v23;
        }

        else
        {
          a4 = v23;
          v16 = -[PassShareActivationOption initWithPassShareActivationOption:forPassSharePID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassShareActivationOption),  "initWithPassShareActivationOption:forPassSharePID:inDatabase:",  v10,  v23,  v8);
        }

        -[NSMutableSet addObject:](v26, "addObject:", v11);
      }

      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v27);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v26));
  v32[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSharePID:a4]);
  v32[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v20]);
  [v21 deleteAllEntities];
}

+ (id)passShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSharePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passShareActivationOptionsWithQuery:v8]);
  return v9;
}

+ (void)deletePassShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSharePID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_passShareActivationOptionsWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPassShareActivationOption]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10033D938;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableArray count](v8, "count")) {
    id v10 = -[NSMutableArray copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

- (id)passShareActivationOption
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassShareActivationOption);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPassShareActivationOption");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10033DA8C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForPassSharePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_propertyValuesForPassShareActivationOption:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  uint64_t v6 = PKPassShareActivationOptionTypeToString([v3 type]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = [v3 valueLength];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

  return v4;
}

+ (id)_propertySettersForPassShareActivationOption
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100657EB8;
  v4[1] = &stru_100657ED8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100657EF8;
  v4[3] = &stru_100657F18;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end