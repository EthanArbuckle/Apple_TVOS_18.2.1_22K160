@interface PassShare
+ (BOOL)_passSharesExistWithQuery:(id)a3 inDatabase:(id)a4;
+ (BOOL)activeExternalPassSharesInDatabase:(id)a3;
+ (BOOL)addPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
+ (BOOL)externalPassSharesForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (BOOL)passSharesExistForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_passSharesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForActiveExternalShares;
+ (id)_predicateForCredentialShareIdentifier:(id)a3;
+ (id)_predicateForCredentialShareIdentifiers:(id)a3;
+ (id)_predicateForExternalCredentialShare;
+ (id)_predicateForExternalSharesForPassPID:(int64_t)a3;
+ (id)_predicateForGroupIdentifier:(id)a3;
+ (id)_predicateForHasCredentialShares;
+ (id)_predicateForHasGroupIdentifier;
+ (id)_predicateForNoCredentialShares;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForShareIdentifier:(id)a3;
+ (id)_predicateForSubcredentialIdentifier:(id)a3;
+ (id)_propertySettersForPassShare;
+ (id)_propertyValuesForPassShare:(id)a3;
+ (id)databaseTable;
+ (id)passShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passShareForForPassPID:(int64_t)a3 shareIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)passShareForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passSharesForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)passSharesForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passSharesPIDsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (int64_t)passPIDForShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)_deleteForQuery:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePassShareForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)mergeInShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (PassShare)initWithPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passShare;
- (void)updateWithPassShare:(id)a3;
- (void)updateWithPassShare:(id)a3 keepingNonnilValuesFrom:(id)a4;
@end

@implementation PassShare

+ (id)databaseTable
{
  return @"cherimoya";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"kohlrabi.a"] & 1) != 0
    || ([v6 isEqualToString:@"kohlrabi.d"] & 1) != 0
    || [v6 isEqualToString:@"kohlrabi.e"])
  {
    [v5 addObject:@"LEFT JOIN kohlrabi ON cherimoya.pid = kohlrabi.b"];
  }
}

- (PassShare)initWithPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPassShare:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"g"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithPassShare:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPassShare:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

- (void)updateWithPassShare:(id)a3 keepingNonnilValuesFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28 = v6;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForPassShare:", v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 mutableCopy];

  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_propertyValuesForPassShare:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v27 = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v11 setObject:v15 forKey:@"a"];
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allKeys", self));
  id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v21]);
        if (!v22
          || (v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
              int v24 = PKEqualObjects(v22, v23),
              v23,
              v24))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v21]);
          [v11 setObject:v25 forKeyedSubscript:v21];
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v18);
  }

  [v26 setValuesWithDictionary:v11];
}

+ (void)insertOrUpdatePassShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (objc_msgSend((id)objc_opt_class(a1, v12), "addPassShare:forPassPID:inDatabase:", v16, a4, v9))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
          if (v17)
          {
            -[NSMutableSet addObject:](v25, "addObject:", v17);
          }

          else
          {
            uint64_t Object = PKLogFacilityTypeGetObject(27LL);
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v32 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "ERROR: Unable to save share because missing identifier: %@",  buf,  0xCu);
            }
          }
        }
      }

      id v13 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v13);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  v25));
  v30[0] = v20;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v30[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  int v24 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v23]);
  [v24 deleteAllEntities];
}

+ (void)mergeInShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v58 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id obj = v7;
  id v59 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v62;
    id v57 = a1;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v62 != v56) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v9);
        id v11 = objc_alloc(&OBJC_CLASS___NSMutableArray);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShareIdentifier:v12]);
        v69 = v13;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
        v15 = -[NSMutableArray initWithArray:](v11, "initWithArray:", v14);

        v16 = (void *)objc_claimAutoreleasedReturnValue([v10 groupIdentifier]);
        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForGroupIdentifier:v16]);
          -[NSMutableArray addObject:](v15, "addObject:", v17);
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 credentialShares]);

        if (v18)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 credentialShares]);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pk_arrayByApplyingBlock:", &stru_10064D118));
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCredentialShareIdentifiers:v20]);
          -[NSMutableArray addObject:](v15, "addObject:", v21);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v15));
        v68[0] = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
        v68[1] = v23;
        id v24 = a1;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 2LL));
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v25));
        __int128 v27 = (PassShare *)objc_claimAutoreleasedReturnValue([v24 anyInDatabase:v8 predicate:v26]);

        if (!v27) {
          goto LABEL_14;
        }
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 credentialShares]);

        if (!v28) {
          goto LABEL_13;
        }
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[PassShare passShare](v27, "passShare"));
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sharedEntitlements]);
        id v31 = objc_msgSend(v30, "pk_createSetByApplyingBlock:", &stru_10064D158);

        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v10 sharedEntitlements]);
        id v33 = objc_msgSend(v32, "pk_createSetByApplyingBlock:", &stru_10064D178);

        LODWORD(v32) = [v31 isEqualToSet:v33];
        if ((_DWORD)v32)
        {
LABEL_13:
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[PassShare passShare](v27, "passShare"));
          -[PassShare updateWithPassShare:keepingNonnilValuesFrom:]( v27,  "updateWithPassShare:keepingNonnilValuesFrom:",  v10,  v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v27, "valueForProperty:", @"a"));
        }

        else
        {
LABEL_14:
          v36 = -[PassShare initWithPassShare:forPassPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassShare),  "initWithPassShare:forPassPID:inDatabase:",  v10,  a4,  v8);

          v35 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          __int128 v27 = v36;
        }

        id v37 = -[SQLiteEntity persistentID](v27, "persistentID");
        v38 = (void *)objc_claimAutoreleasedReturnValue([v10 sharedEntitlements]);
        +[PassSharedEntitlement insertOrUpdatePassSharedEntitlements:forPassSharePID:inDatabase:]( &OBJC_CLASS___PassSharedEntitlement,  "insertOrUpdatePassSharedEntitlements:forPassSharePID:inDatabase:",  v38,  v37,  v8);

        v39 = (void *)objc_claimAutoreleasedReturnValue([v10 credentialShares]);
        +[PassCredentialShare mergeInCredentialShares:sharePID:inDatabase:]( &OBJC_CLASS___PassCredentialShare,  "mergeInCredentialShares:sharePID:inDatabase:",  v39,  v37,  v8);

        v40 = (void *)objc_claimAutoreleasedReturnValue([v10 activationOptions]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 options]);
        +[PassShareActivationOption mergeInPassShareActivationOption:forPassSharePID:inDatabase:]( &OBJC_CLASS___PassShareActivationOption,  "mergeInPassShareActivationOption:forPassSharePID:inDatabase:",  v41,  v37,  v8);

        -[NSMutableSet addObject:](v58, "addObject:", v35);
        id v9 = (char *)v9 + 1;
        a1 = v57;
      }

      while (v59 != v9);
      id v59 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    }

    while (v59);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  v58));
  v43 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForHasCredentialShares]);
  v67[0] = v43;
  id v44 = a1;
  v45 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForHasGroupIdentifier]);
  v67[1] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v46));

  v66[0] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue([v44 _predicateForNoCredentialShares]);
  v66[1] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 2LL));
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v49));

  v65[0] = v42;
  v51 = (void *)objc_claimAutoreleasedReturnValue([v44 _predicateForPassPID:a4]);
  v65[1] = v51;
  v65[2] = v50;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 3LL));
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v52));

  v54 = (void *)objc_claimAutoreleasedReturnValue([v44 queryWithDatabase:v8 predicate:v53]);
  [v54 deleteAllEntities];
}

+ (BOOL)addPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v22[0] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShareIdentifier:v10]);
  v22[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  v15 = (PassShare *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v14]);

  if (v15) {
    -[PassShare updateWithPassShare:](v15, "updateWithPassShare:", v8);
  }
  else {
    v15 = -[PassShare initWithPassShare:forPassPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassShare),  "initWithPassShare:forPassPID:inDatabase:",  v8,  a4,  v9);
  }
  id v16 = -[SQLiteEntity persistentID](v15, "persistentID");
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 sharedEntitlements]);
  +[PassSharedEntitlement insertOrUpdatePassSharedEntitlements:forPassSharePID:inDatabase:]( &OBJC_CLASS___PassSharedEntitlement,  "insertOrUpdatePassSharedEntitlements:forPassSharePID:inDatabase:",  v17,  v16,  v9);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialShares]);
  +[PassCredentialShare insertOrUpdatePassCredentialShares:sharePID:inDatabase:]( &OBJC_CLASS___PassCredentialShare,  "insertOrUpdatePassCredentialShares:sharePID:inDatabase:",  v18,  v16,  v9);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 activationOptions]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 options]);
  +[PassShareActivationOption insertOrUpdatePassShareActivationOption:forPassSharePID:inDatabase:]( &OBJC_CLASS___PassShareActivationOption,  "insertOrUpdatePassShareActivationOption:forPassSharePID:inDatabase:",  v20,  v16,  v9);

  return v15 != 0LL;
}

+ (BOOL)activeExternalPassSharesInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveExternalShares]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);
  LOBYTE(a1) = [a1 _passSharesExistWithQuery:v6 inDatabase:v4];

  return (char)a1;
}

+ (BOOL)externalPassSharesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForExternalSharesForPassPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  LOBYTE(a1) = [a1 _passSharesExistWithQuery:v8 inDatabase:v6];

  return (char)a1;
}

+ (id)passSharesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passSharesWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (BOOL)passSharesExistForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  LOBYTE(a1) = [a1 _passSharesExistWithQuery:v8 inDatabase:v6];

  return (char)a1;
}

+ (id)passSharesForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSubcredentialIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passSharesWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)passSharesPIDsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10020A728;
  v12[3] = &unk_10063BE98;
  id v10 = v7;
  id v13 = v10;
  [v9 enumeratePersistentIDsUsingBlock:v12];

  return v10;
}

+ (id)passShareForForPassPID:(int64_t)a3 shareIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShareIdentifier:v9]);

  v17[1] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v13]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 passShare]);
  return v15;
}

+ (id)passShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCredentialShareIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 passShare]);
  return v9;
}

+ (id)passShareForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShareIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 passShare]);
  return v9;
}

+ (int64_t)passPIDForShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShareIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"g"]);
  id v10 = [v9 longLongValue];

  return (int64_t)v10;
}

+ (void)deletePassShareForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  [a1 _deleteForQuery:v7 inDatabase:v6];
}

+ (void)deletePassShareWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForShareIdentifier:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  [a1 _deleteForQuery:v7 inDatabase:v6];
}

+ (void)_deleteForQuery:(id)a3 inDatabase:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10020ABB0;
  v7[3] = &unk_10063BE98;
  id v8 = a4;
  id v6 = v8;
  id v5 = a3;
  [v5 enumeratePersistentIDsUsingBlock:v7];
  [v5 deleteAllEntities];
}

+ (id)_passSharesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPassShare]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_10020AD30;
  uint64_t v19 = &unk_100638F18;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  id v11 = v9;
  v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (-[NSMutableArray count](v11, "count", v16, v17, v18, v19)) {
    id v14 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (BOOL)_passSharesExistWithQuery:(id)a3 inDatabase:(id)a4
{
  return [a3 exists];
}

- (id)passShare
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassShare);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPassShare");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10020AFF8;
  v16[3] = &unk_100638EF0;
  v16[4] = self;
  id v17 = v6;
  id v8 = v3;
  id v18 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v16);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PassSharedEntitlement passSharedEntitlementsForPassSharePID:inDatabase:]( &OBJC_CLASS___PassSharedEntitlement,  "passSharedEntitlementsForPassSharePID:inDatabase:",  self->super._persistentID,  self->super._database));
  -[PKPassShare setSharedEntitlements:](v8, "setSharedEntitlements:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PassCredentialShare passCredentialSharesForSharePID:inDatabase:]( &OBJC_CLASS___PassCredentialShare,  "passCredentialSharesForSharePID:inDatabase:",  self->super._persistentID,  self->super._database));
  -[PKPassShare setCredentialShares:](v8, "setCredentialShares:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PassShareActivationOption passShareActivationOptionForPassSharePID:inDatabase:]( &OBJC_CLASS___PassShareActivationOption,  "passShareActivationOptionForPassSharePID:inDatabase:",  self->super._persistentID,  self->super._database));
  id v13 = [[PKPassShareActivationOptions alloc] initWithOptions:v12];
  -[PKPassShare setActivationOptions:](v8, "setActivationOptions:", v13);

  id v14 = v8;
  return v14;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"g",  v3));

  return v4;
}

+ (id)_predicateForShareIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForGroupIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  a3);
}

+ (id)_predicateForSubcredentialIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i",  a3);
}

+ (id)_predicateForCredentialShareIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"kohlrabi.a",  a3);
}

+ (id)_predicateForCredentialShareIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"kohlrabi.a",  a3);
}

+ (id)_predicateForNoCredentialShares
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"kohlrabi.a");
}

+ (id)_predicateForHasCredentialShares
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"kohlrabi.a");
}

+ (id)_predicateForHasGroupIdentifier
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"f");
}

+ (id)_predicateForExternalCredentialShare
{
  uint64_t v2 = PKPassCredentialShareTargetDeviceToString(3LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v11 = v3;
  uint64_t v4 = PKPassCredentialShareTargetDeviceToString(4LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v12 = v5;
  uint64_t v6 = PKPassCredentialShareTargetDeviceToString(5LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v13 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 3LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"kohlrabi.d",  v8,  v11,  v12));
  return v9;
}

+ (id)_predicateForActiveExternalShares
{
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNoCredentialShares]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForExternalCredentialShare]);
  uint64_t v5 = PKShareStatusToString(1LL, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v33[0] = v6;
  uint64_t v8 = PKShareStatusToString(2LL, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v33[1] = v9;
  uint64_t v11 = PKShareStatusToString(3LL, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v33[2] = v12;
  uint64_t v14 = PKShareStatusToString(4LL, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v33[3] = v15;
  uint64_t v17 = PKShareStatusToString(5LL, v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v33[4] = v18;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 5LL));

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"h",  v19));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"kohlrabi.e",  v19));
  v32[0] = v29;
  v32[1] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  v31[0] = v3;
  v31[1] = v21;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v24));

  v30[0] = v23;
  v30[1] = v25;
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v26));

  return v27;
}

+ (id)_predicateForExternalSharesForPassPID:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNoCredentialShares]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForExternalCredentialShare]);
  v14[0] = v5;
  v14[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v13[0] = v9;
  v13[1] = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  return v11;
}

+ (id)_propertyValuesForPassShare:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 recipientNickname]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 senderShareIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);
  uint64_t v9 = PKW3CDateStringFromDate();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"d");

  uint64_t v11 = PKPassShareManageabilityToString([v3 manageability]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"k");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 groupIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"f");

  id v14 = [v3 status];
  uint64_t v16 = PKShareStatusToString(v14, v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"h");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 subcredentialIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"i");

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 recipientHandle]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"j");

  return v4;
}

+ (id)_propertySettersForPassShare
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10064D1B8;
  v4[1] = &stru_10064D1D8;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_10064D1F8;
  v4[3] = &stru_10064D218;
  v3[4] = @"k";
  v3[5] = @"f";
  v4[4] = &stru_10064D238;
  v4[5] = &stru_10064D258;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_10064D278;
  v4[7] = &stru_10064D298;
  v3[8] = @"j";
  v4[8] = &stru_10064D2B8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
}

@end