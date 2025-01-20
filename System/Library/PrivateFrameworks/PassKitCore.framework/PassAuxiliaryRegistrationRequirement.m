@interface PassAuxiliaryRegistrationRequirement
+ (BOOL)updateAuxiliaryRegistrationRequirement:(id)a3 passPID:(int64_t)a4 isRegistered:(BOOL)a5 inDatabase:(id)a6;
+ (BOOL)updateAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 isRegistered:(BOOL)a4 inDatabase:(id)a5;
+ (BOOL)updateRegistrationStatusTo:(BOOL)a3 role:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForRole:(unint64_t)a3 type:(unint64_t)a4;
+ (id)_predicateForUnregistered;
+ (id)_propertyValuesFor:(id)a3;
+ (id)auxiliaryRegistrationRequirementStatusForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)unregisteredAuxiliaryRegistrationRequirementIdentifiersForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAuxiliaryRegistrationRequirements:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
- (PassAuxiliaryRegistrationRequirement)initWithObject:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithObject:(id)a3;
@end

@implementation PassAuxiliaryRegistrationRequirement

- (PassAuxiliaryRegistrationRequirement)initWithObject:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesFor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  [v12 setObjectOrNull:&__kCFBooleanFalse forKey:@"e"];
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);

  return v14;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesFor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)databaseTable
{
  return @"waffle";
}

+ (id)unregisteredAuxiliaryRegistrationRequirementIdentifiersForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v23[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForUnregistered]);
  v23[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22[0] = @"d";
  v22[1] = @"f";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100164EE8;
  v20 = &unk_10063D7F0;
  v14 = v12;
  v21 = v14;
  [v11 enumerateProperties:v13 usingBlock:&v17];

  if (-[NSMutableArray count](v14, "count", v17, v18, v19, v20)) {
    id v15 = -[NSMutableArray copy](v14, "copy");
  }
  else {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)auxiliaryRegistrationRequirementStatusForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v22 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21[0] = @"d";
  v21[1] = @"e";
  v21[2] = @"f";
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = sub_10016510C;
  v19 = &unk_10063D7F0;
  v13 = v11;
  v20 = v13;
  [v10 enumerateProperties:v12 usingBlock:&v16];

  if (-[NSMutableArray count](v13, "count", v16, v17, v18, v19)) {
    id v14 = -[NSMutableArray copy](v13, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (void)insertOrUpdateAuxiliaryRegistrationRequirements:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
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
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
        v33[0] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v11]);
        v33[1] = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v16 = (PassAuxiliaryRegistrationRequirement *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16)
        {
          -[PassAuxiliaryRegistrationRequirement updateWithObject:](v16, "updateWithObject:", v10);
          a4 = v23;
        }

        else
        {
          a4 = v23;
          v16 = -[PassAuxiliaryRegistrationRequirement initWithObject:forPassPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassAuxiliaryRegistrationRequirement),  "initWithObject:forPassPID:inDatabase:",  v10,  v23,  v8);
        }

        -[NSMutableSet addObject:](v26, "addObject:", v11);
      }

      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v27);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"d",  v26));
  v32[0] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v32[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v20]);
  [v21 deleteAllEntities];
}

+ (void)deleteAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (BOOL)updateAuxiliaryRegistrationRequirement:(id)a3 passPID:(int64_t)a4 isRegistered:(BOOL)a5 inDatabase:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v22[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v13]);
  v22[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  uint64_t v17 = (PassAuxiliaryRegistrationRequirement *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v11 predicate:v16]);
  if (!v17) {
    uint64_t v17 = -[PassAuxiliaryRegistrationRequirement initWithObject:forPassPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassAuxiliaryRegistrationRequirement),  "initWithObject:forPassPID:inDatabase:",  v10,  a4,  v11);
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  if (-[SQLiteEntity setValue:forProperty:](v17, "setValue:forProperty:", v18, @"e"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 registrationBackoffCounter]));
    unsigned __int8 v20 = -[SQLiteEntity setValue:forProperty:](v17, "setValue:forProperty:", v19, @"f");
  }

  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

+ (BOOL)updateAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 isRegistered:(BOOL)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  uint64_t v24 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v11]);
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100165848;
  v16[3] = &unk_100646F48;
  id v13 = v8;
  id v17 = v13;
  uint64_t v18 = &v20;
  BOOL v19 = a4;
  [v12 enumeratePersistentIDsUsingBlock:v16];
  BOOL v14 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (BOOL)updateRegistrationStatusTo:(BOOL)a3 role:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRole:a4 type:a5]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v11]);
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    char v22 = 1;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100165A14;
    v15[3] = &unk_100646F48;
    id v16 = v10;
    id v17 = &v19;
    BOOL v18 = a3;
    [v12 enumeratePersistentIDsUsingBlock:v15];
    BOOL v13 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  a3);
}

+ (id)_predicateForUnregistered
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  &__kCFBooleanFalse);
}

+ (id)_predicateForRole:(unint64_t)a3 type:(unint64_t)a4
{
  if (a3 != 2)
  {
    if (a3 != 1) {
      return 0LL;
    }
    uint64_t v6 = PKDeviceDecryptionTypeToString(a4, a2);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v7));
  }

  uint64_t v9 = PKDeviceSignatureTypeToString(a4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v10));

  if (v11)
  {
    uint64_t v12 = PKAuxiliaryCapabilityRoleToString(a3);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v13));
    v18[0] = v14;
    v18[1] = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

    return v16;
  }

  return 0LL;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = PKAuxiliaryCapabilityRoleToString([v3 role]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PKPassAuxiliaryRegistrationSignatureRequirement, v7);
  if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
  {
    uint64_t v10 = PKDeviceSignatureTypeToString([v3 type]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
LABEL_5:
    id v16 = (void *)v11;
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"c");

    goto LABEL_6;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___PKPassAuxiliaryRegistrationDecryptionRequirement, v9);
  if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
  {
    id v13 = [v3 type];
    uint64_t v15 = PKDeviceDecryptionTypeToString(v13, v14);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_5;
  }

@end