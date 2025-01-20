@interface PassCredentialShare
+ (BOOL)deletePassCredentialShareForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_passCredentialSharesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForCredentialShareIdentifier:(id)a3;
+ (id)_predicateForSharePID:(int64_t)a3;
+ (id)_predicateForSharePIDs:(id)a3;
+ (id)_predicateForTransportIdentifier:(id)a3;
+ (id)_propertySettersForPassCredentialShare;
+ (id)_propertyValuesForPassCredentialShare:(id)a3;
+ (id)databaseTable;
+ (id)dbPassCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passCredentialShareForIdentifier:(id)a3 sharePIDs:(id)a4 inDatabase:(id)a5;
+ (id)passCredentialShareForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passCredentialSharesForSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassCredentialShareForSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)mergeInCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5;
- (PassCredentialShare)initWithPassCredentialShare:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5;
- (id)passCredentialShare;
- (void)setIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)updateWithPassCredentialShare:(id)a3;
- (void)updateWithPassCredentialShare:(id)a3 mergingInCredentialShare:(id)a4;
@end

@implementation PassCredentialShare

+ (id)databaseTable
{
  return @"kohlrabi";
}

- (PassCredentialShare)initWithPassCredentialShare:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPassCredentialShare:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"b"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithPassCredentialShare:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPassCredentialShare:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

- (void)updateWithPassCredentialShare:(id)a3 mergingInCredentialShare:(id)a4
{
  id v6 = a4;
  id v11 = [a3 copy];
  unint64_t v7 = (unint64_t)[v6 targetDevice];

  if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [v11 setTargetDevice:v7];
  }
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForPassCredentialShare:", v11);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);
}

+ (void)insertOrUpdatePassCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5
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
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCredentialShareIdentifier:v11]);
        v33[0] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharePID:a4]);
        v33[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v16 = (PassCredentialShare *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16)
        {
          -[PassCredentialShare updateWithPassCredentialShare:](v16, "updateWithPassCredentialShare:", v10);
          a4 = v23;
        }

        else
        {
          a4 = v23;
          v16 = -[PassCredentialShare initWithPassCredentialShare:sharePID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassCredentialShare),  "initWithPassCredentialShare:sharePID:inDatabase:",  v10,  v23,  v8);
        }

        -[NSMutableSet addObject:](v26, "addObject:", v11);
      }

      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v27);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  v26));
  v32[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharePID:a4]);
  v32[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v20]);
  [v21 deleteAllEntities];
}

+ (void)mergeInCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v7;
  id v20 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForCredentialShareIdentifier:"));
        v26[0] = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharePID:a4]);
        v26[1] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
        v15 = (PassCredentialShare *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v14]);

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[PassCredentialShare passCredentialShare](v15, "passCredentialShare"));
          -[PassCredentialShare updateWithPassCredentialShare:mergingInCredentialShare:]( v15,  "updateWithPassCredentialShare:mergingInCredentialShare:",  v10,  v16);
        }

        else
        {
          v15 = -[PassCredentialShare initWithPassCredentialShare:sharePID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassCredentialShare),  "initWithPassCredentialShare:sharePID:inDatabase:",  v10,  a4,  v8);
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v20);
  }
}

+ (id)passCredentialSharesForSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passCredentialSharesWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)passCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 dbPassCredentialShareForCredentialShareIdentifier:a3 inDatabase:a4]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 passCredentialShare]);

  return v5;
}

+ (id)passCredentialShareForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransportIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 passCredentialShare]);
  return v9;
}

+ (id)dbPassCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCredentialShareIdentifier:a3]);
  v12 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v9]);

  return v10;
}

+ (id)passCredentialShareForIdentifier:(id)a3 sharePIDs:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCredentialShareIdentifier:a3]);
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharePIDs:v9]);

  v17[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 passCredentialShare]);

  return v15;
}

+ (void)deletePassCredentialShareForSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForSharePID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (BOOL)deletePassCredentialShareForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCredentialShareIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v6) = [v8 deleteAllEntities];
  return (char)v6;
}

+ (id)_passCredentialSharesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPassCredentialShare]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000BB5FC;
  v13[3] = &unk_100639BF0;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  v15 = v9;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  if (-[NSMutableArray count](v9, "count")) {
    id v11 = -[NSMutableArray copy](v9, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (id)passCredentialShare
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassCredentialShare);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPassCredentialShare");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000BB750;
  v13[3] = &unk_100638EF0;
  void v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setStatus:(unint64_t)a3
{
  uint64_t v4 = PKShareStatusToString(a3, a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v5, @"e");
}

+ (id)_predicateForSharePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForSharePIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"b",  a3);
}

+ (id)_predicateForCredentialShareIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForTransportIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  a3);
}

+ (id)_propertyValuesForPassCredentialShare:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 channelTransportIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  uint64_t v7 = PKPassCredentialShareTargetDeviceToString([v3 targetDevice]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = [v3 status];
  uint64_t v11 = PKShareStatusToString(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"e");

  return v4;
}

+ (id)_propertySettersForPassCredentialShare
{
  v3[0] = @"a";
  v3[1] = @"c";
  v4[0] = &stru_100640B78;
  v4[1] = &stru_100640B98;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100640BB8;
  v4[3] = &stru_100640BD8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end