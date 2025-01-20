@interface PassEntitlement
+ (BOOL)hasShareablePassEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_passEntitlementsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPassEntitlementIdentifier:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForShareableEntitlement;
+ (id)_predicateForSubcredentialIdentifier:(id)a3;
+ (id)_propertySettersForPassEntitlement;
+ (id)_propertyValuesForPassEntitlement:(id)a3;
+ (id)databaseTable;
+ (id)passEntitlementForIdentifier:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)passEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)passEntitlementsForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deletePassEntitlementForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassEntitlements:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (PassEntitlement)initWithPassEntitlement:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passEntitlement;
- (void)updateWithEntitlement:(id)a3;
@end

@implementation PassEntitlement

+ (id)databaseTable
{
  return @"loquat";
}

- (PassEntitlement)initWithPassEntitlement:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPassEntitlement:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithEntitlement:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPassEntitlement:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (void)insertOrUpdatePassEntitlements:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 identifier]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
        v35[0] = v12;
        v29 = (void *)v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassEntitlementIdentifier:v11]);
        v35[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
        int64_t v15 = a4;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v17 = (PassEntitlement *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v16]);

        if (v17) {
          -[PassEntitlement updateWithEntitlement:](v17, "updateWithEntitlement:", v10);
        }
        else {
          v17 = -[PassEntitlement initWithPassEntitlement:forPassPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassEntitlement),  "initWithPassEntitlement:forPassPID:inDatabase:",  v10,  v15,  v8);
        }
        a4 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 timeConfiguration]);
        +[PassShareTimeConfiguration insertOrUpdatePassShareTimeConfiguration:forPassEntitlementPID:inDatabase:]( &OBJC_CLASS___PassShareTimeConfiguration,  "insertOrUpdatePassShareTimeConfiguration:forPassEntitlementPID:inDatabase:",  v18,  -[SQLiteEntity persistentID](v17, "persistentID"),  v8);

        -[NSMutableSet addObject:](v27, "addObject:", v29);
      }

      id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v28);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v27));
  v34[0] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v34[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v22]);
  [v23 deleteAllEntities];
}

+ (id)passEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passEntitlementsWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)passEntitlementsForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSubcredentialIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passEntitlementsWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)passEntitlementForIdentifier:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v17[0] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassEntitlementIdentifier:v9]);

  v17[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v13]);
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 passEntitlement]);

  return v15;
}

+ (void)deletePassEntitlementForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  [v7 deleteAllEntities];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003EFA28;
  v10[3] = &unk_10063BE98;
  id v11 = v6;
  id v8 = v6;
  [v7 enumeratePersistentIDsUsingBlock:v10];
}

+ (BOOL)hasShareablePassEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v13[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShareableEntitlement]);
  v13[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  LOBYTE(v6) = [v11 exists];

  return (char)v6;
}

+ (id)_passEntitlementsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPassEntitlement]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1003EFC78;
  v19 = &unk_100638F18;
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

- (id)passEntitlement
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassEntitlement);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPassEntitlement");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003EFE70;
  v14[3] = &unk_100638EF0;
  v14[4] = self;
  id v15 = v6;
  id v8 = v3;
  v16 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v14);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[PassShareTimeConfiguration passShareTimeConfigurationsForPassEntitlementPID:inDatabase:]( &OBJC_CLASS___PassShareTimeConfiguration,  "passShareTimeConfigurationsForPassEntitlementPID:inDatabase:",  -[SQLiteEntity persistentID](self, "persistentID"),  self->super._database));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  -[PKPassEntitlement setTimeConfiguration:](v8, "setTimeConfiguration:", v11);
  id v12 = v8;

  return v12;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPassEntitlementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForSubcredentialIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"l",  a3);
}

+ (id)_predicateForShareableEntitlement
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"h");
}

+ (id)_propertyValuesForPassEntitlement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 entitlementTemplate]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"e");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 active]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"f");

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 hasRemainingShares]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"m");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"g");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 shareability]);
  uint64_t v11 = PKSharingCapabilityShareabilitiesToStringArray();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"h");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 visibility]);
  uint64_t v15 = PKSharingCapabilityVisibilitiesToStringArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"i");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 manageability]);
  uint64_t v19 = PKSharingCapabilityManageabilitiesToStringArray();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"j");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 templateFields]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v22,  1LL,  0LL));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"k");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 subcredentialIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"l");

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v3 activeCapabilityRole]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v25, @"q");

  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 activeShareability]);
  v27 = v26;
  if (v26)
  {
    uint64_t v28 = PKSharingCapabilityShareabilityToString([v26 unsignedIntegerValue]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v29, @"n");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", 0LL, @"n");
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v3 activeManageability]);

  if (v30)
  {
    uint64_t v31 = PKSharingCapabilityManageabilityToString([v30 unsignedIntegerValue]);
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v32, @"o");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", 0LL, @"o");
  }

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v3 activeVisibility]);

  if (v33)
  {
    uint64_t v34 = PKSharingCapabilityVisibilityToString([v33 unsignedIntegerValue]);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v35, @"p");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", 0LL, @"p");
  }

  return v4;
}

+ (id)_propertySettersForPassEntitlement
{
  v3[0] = @"b";
  v3[1] = @"e";
  v4[0] = &stru_10065D238;
  v4[1] = &stru_10065D258;
  v3[2] = @"f";
  v3[3] = @"m";
  v4[2] = &stru_10065D278;
  v4[3] = &stru_10065D298;
  v3[4] = @"g";
  v3[5] = @"h";
  v4[4] = &stru_10065D2B8;
  v4[5] = &stru_10065D2D8;
  v3[6] = @"i";
  v3[7] = @"j";
  v4[6] = &stru_10065D2F8;
  v4[7] = &stru_10065D318;
  v3[8] = @"k";
  v3[9] = @"l";
  v4[8] = &stru_10065D338;
  v4[9] = &stru_10065D358;
  v3[10] = @"n";
  v3[11] = @"o";
  v4[10] = &stru_10065D378;
  v4[11] = &stru_10065D398;
  v3[12] = @"p";
  v3[13] = @"q";
  v4[12] = &stru_10065D3B8;
  v4[13] = &stru_10065D3D8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  14LL));
}

@end