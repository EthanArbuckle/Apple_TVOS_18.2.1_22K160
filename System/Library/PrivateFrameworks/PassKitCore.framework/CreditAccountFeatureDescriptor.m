@interface CreditAccountFeatureDescriptor
+ (id)_creditAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountUserPID:(id)a3;
+ (id)_predicateForFeatureIdentifier:(id)a3;
+ (id)_propertySettersForCreditAccountFeatureDescriptor;
+ (id)_propertyValuesForCreditAccountFeatureDescriptor:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteCreditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (id)creditAccountFeatureDescriptor;
- (void)updateWithCreditFeatureDescriptor:(id)a3;
@end

@implementation CreditAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"strawberries";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountUser, v4) == a3) {
    return @"n";
  }
  return 0LL;
}

+ (void)deleteCreditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteCreditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountUserPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)creditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _creditAccountFeatureDescriptorsWithQuery:v8]);
  return v9;
}

+ (id)creditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountUserPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _creditAccountFeatureDescriptorsWithQuery:v8]);
  return v9;
}

- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForCreditAccountFeatureDescriptor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForCreditAccountFeatureDescriptor:", v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v13 mutableCopy];
  [v14 setObjectOrNull:v9 forKey:@"n"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v8);
  return v15;
}

+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
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
        id v10 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
        v33[0] = v12;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFeatureIdentifier:v11]);
        v33[1] = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
        v16 = (CreditAccountFeatureDescriptor *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16)
        {
          -[CreditAccountFeatureDescriptor updateWithCreditFeatureDescriptor:]( v16,  "updateWithCreditFeatureDescriptor:",  v10);
          a4 = v23;
        }

        else
        {
          a4 = v23;
          v16 = -[CreditAccountFeatureDescriptor initWithCreditAccountFeatureDescriptor:forAccountPID:inDatabase:]( objc_alloc(&OBJC_CLASS___CreditAccountFeatureDescriptor),  "initWithCreditAccountFeatureDescriptor:forAccountPID:inDatabase:",  v10,  v23,  v8);
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

+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v28)
  {
    id v24 = v8;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountUserPID:v8]);
        v34[0] = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFeatureIdentifier:v12]);
        v34[1] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));
        v17 = (CreditAccountFeatureDescriptor *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v16]);

        if (v17)
        {
          -[CreditAccountFeatureDescriptor updateWithCreditFeatureDescriptor:]( v17,  "updateWithCreditFeatureDescriptor:",  v11);
          id v8 = v24;
        }

        else
        {
          id v8 = v24;
          v17 = -[CreditAccountFeatureDescriptor initWithCreditAccountFeatureDescriptor:forAccountUserPID:inDatabase:]( objc_alloc(&OBJC_CLASS___CreditAccountFeatureDescriptor),  "initWithCreditAccountFeatureDescriptor:forAccountUserPID:inDatabase:",  v11,  v24,  v9);
        }

        -[NSMutableSet addObject:](v26, "addObject:", v12);
      }

      id v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v28);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v26));
  v33[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountUserPID:v8]);
  v33[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v21]);
  [v22 deleteAllEntities];
}

- (void)updateWithCreditFeatureDescriptor:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForCreditAccountFeatureDescriptor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForAccountUserPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"n",  a3);
}

+ (id)_predicateForFeatureIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

- (id)creditAccountFeatureDescriptor
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountFeatureDescriptor");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003AB834;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  uint64_t v11 = v8;

  return v11;
}

+ (id)_creditAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForCreditAccountFeatureDescriptor]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003AB980;
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

+ (id)_propertyValuesForCreditAccountFeatureDescriptor:(id)a3
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
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"d");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedNetworks]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"e");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 merchantIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"f");

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 merchantCapabilities]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"g");

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 paymentFundingSourceTypes]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"h");

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 paymentFrequencies]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"i");

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 paymentPresets]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"j");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"k");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 fundingSourceTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"l");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedFileFormatsForTransactionData]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"m");

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 maximumAccountUsers],  @"o");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 minimumOwnerAge], @"p");
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 minimumParticipantAge],  @"q");
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 osVersionRange]);
  id v24 = (void *)_SQLValueForOSVersionRequirementRange(v23);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v24,  @"os_version_requirement_range");

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedDestinations]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v26, @"r");

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 savingsAPY]);
  id v28 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PKPercentageDecimalToStorageInteger(v27));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v29, @"s");

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v3 savingsInterestRate]);
  __int128 v31 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PKPercentageDecimalToStorageInteger(v30));
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v32, @"savings_interest_rate");

  id v33 = -[NSMutableDictionary copy](v4, "copy");
  return v33;
}

+ (id)_propertySettersForCreditAccountFeatureDescriptor
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065AD10;
  v4[1] = &stru_10065AD30;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10065AD50;
  v4[3] = &stru_10065AD70;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10065AD90;
  v4[5] = &stru_10065ADB0;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_10065ADD0;
  v4[7] = &stru_10065ADF0;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_10065AE10;
  v4[9] = &stru_10065AE30;
  v3[10] = @"l";
  v3[11] = @"m";
  v4[10] = &stru_10065AE50;
  v4[11] = &stru_10065AE70;
  v3[12] = @"o";
  v3[13] = @"p";
  v4[12] = &stru_10065AE90;
  v4[13] = &stru_10065AEB0;
  v3[14] = @"q";
  v3[15] = @"os_version_requirement_range";
  v4[14] = &stru_10065AED0;
  v4[15] = &stru_10065AEF0;
  v3[16] = @"r";
  v3[17] = @"s";
  v4[16] = &stru_10065AF10;
  v4[17] = &stru_10065AF30;
  v3[18] = @"savings_interest_rate";
  v4[18] = &stru_10065AF50;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  19LL));
}

@end