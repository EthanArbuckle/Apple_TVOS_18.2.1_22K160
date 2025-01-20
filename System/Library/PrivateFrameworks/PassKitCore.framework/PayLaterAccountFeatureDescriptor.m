@interface PayLaterAccountFeatureDescriptor
+ (id)_payLaterAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForFeatureIdentifier:(id)a3;
+ (id)_propertySettersForPayLaterAccountFeatureDescriptor;
+ (id)_propertyValuesForPayLaterAccountFeatureDescriptor:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)payLaterAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePayLaterAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PayLaterAccountFeatureDescriptor)initWithPayLaterAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)payLaterAccountFeatureDescriptor;
- (void)updateWithPayLaterFeatureDescriptor:(id)a3;
@end

@implementation PayLaterAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"feijoa";
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

- (PayLaterAccountFeatureDescriptor)initWithPayLaterAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterAccountFeatureDescriptor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

- (void)updateWithPayLaterFeatureDescriptor:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterAccountFeatureDescriptor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (void)insertOrUpdatePayLaterAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
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
        v16 = (PayLaterAccountFeatureDescriptor *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16)
        {
          -[PayLaterAccountFeatureDescriptor updateWithPayLaterFeatureDescriptor:]( v16,  "updateWithPayLaterFeatureDescriptor:",  v10);
          a4 = v23;
        }

        else
        {
          a4 = v23;
          v16 = -[PayLaterAccountFeatureDescriptor initWithPayLaterAccountFeatureDescriptor:forAccountPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PayLaterAccountFeatureDescriptor),  "initWithPayLaterAccountFeatureDescriptor:forAccountPID:inDatabase:",  v10,  v23,  v8);
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

+ (void)deletePayLaterAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)payLaterAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _payLaterAccountFeatureDescriptorsWithQuery:v8]);
  return v9;
}

- (id)payLaterAccountFeatureDescriptor
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountFeatureDescriptor);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterAccountFeatureDescriptor");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C198C;
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

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForFeatureIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_payLaterAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterAccountFeatureDescriptor]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000C1B44;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[NSMutableSet copy](v8, "copy");
  return v10;
}

+ (id)_propertyValuesForPayLaterAccountFeatureDescriptor:(id)a3
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

  id v15 = [v3 merchantCapabilities];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"g");

  id v17 = -[NSMutableDictionary copy](v4, "copy");
  return v17;
}

+ (id)_propertySettersForPayLaterAccountFeatureDescriptor
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100640F20;
  v4[1] = &stru_100640F40;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100640F60;
  v4[3] = &stru_100640F80;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100640FA0;
  v4[5] = &stru_100640FC0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end