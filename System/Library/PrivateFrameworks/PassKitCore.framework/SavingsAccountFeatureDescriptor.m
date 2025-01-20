@interface SavingsAccountFeatureDescriptor
+ (id)_commonDictionaryForSavingsAccountFeatureDescriptor:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForFeatureIdentifier:(id)a3;
+ (id)_propertySettersForSavingsAccountFeatureDescriptor;
+ (id)_savingsAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)savingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateSavingsAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (SavingsAccountFeatureDescriptor)initWithSavingsAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)savingsAccountFeatureDescriptor;
- (void)updateWithSavingsFeatureDescriptor:(id)a3;
@end

@implementation SavingsAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"rhubarb";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)savingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _savingsAccountFeatureDescriptorsWithQuery:v8]);
  return v9;
}

- (SavingsAccountFeatureDescriptor)initWithSavingsAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForSavingsAccountFeatureDescriptor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (void)deleteSavingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)updateSavingsAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
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
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
        v33[0] = v12;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFeatureIdentifier:v11]);
        v33[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v16 = (SavingsAccountFeatureDescriptor *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16)
        {
          -[SavingsAccountFeatureDescriptor updateWithSavingsFeatureDescriptor:]( v16,  "updateWithSavingsFeatureDescriptor:",  v10);
          a4 = v23;
        }

        else
        {
          a4 = v23;
          v16 = -[SavingsAccountFeatureDescriptor initWithSavingsAccountFeatureDescriptor:forAccountPID:inDatabase:]( objc_alloc(&OBJC_CLASS___SavingsAccountFeatureDescriptor),  "initWithSavingsAccountFeatureDescriptor:forAccountPID:inDatabase:",  v10,  v23,  v8);
        }

        [v26 addObject:v11];
      }

      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v27);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v26));
  v32[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v32[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v20]);
  [v21 deleteAllEntities];
}

- (void)updateWithSavingsFeatureDescriptor:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForSavingsAccountFeatureDescriptor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForFeatureIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

- (id)savingsAccountFeatureDescriptor
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForSavingsAccountFeatureDescriptor");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100276A24;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_savingsAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForSavingsAccountFeatureDescriptor]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100276B70;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_commonDictionaryForSavingsAccountFeatureDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 minimumAmount]);
  uint64_t v7 = PKCurrencyDecimalToStorageNumber(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 maximumAmount]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"d");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedNetworks]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"e");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 merchantIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"f");

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 merchantCapabilities]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"g");

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 fundingSourceTypes]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"h");

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 transferFrequencies]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"i");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 transferTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"j");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 fundingSourceTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"k");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedFileFormatsForTransactionData]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"l");

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 contactMethod]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"m");

  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 showCreditRewardsHubBalance]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"n");

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 showCreditDashboardBalance]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"q");

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 showSettingsBalance]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v25, @"r");

  id v26 = [v3 hideCreditRewardsHubSignage];
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v27, @"s");

  id v28 = -[NSMutableDictionary copy](v4, "copy");
  return v28;
}

+ (id)_propertySettersForSavingsAccountFeatureDescriptor
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100650DB8;
  v4[1] = &stru_100650DD8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100650DF8;
  v4[3] = &stru_100650E18;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100650E38;
  v4[5] = &stru_100650E58;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100650E78;
  v4[7] = &stru_100650E98;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_100650EB8;
  v4[9] = &stru_100650ED8;
  v3[10] = @"l";
  v3[11] = @"m";
  v4[10] = &stru_100650EF8;
  v4[11] = &stru_100650F18;
  v3[12] = @"n";
  v3[13] = @"q";
  v4[12] = &stru_100650F38;
  v4[13] = &stru_100650F58;
  v3[14] = @"r";
  v3[15] = @"s";
  v4[14] = &stru_100650F78;
  v4[15] = &stru_100650F98;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  16LL));
}

@end