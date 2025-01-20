@interface SecureElementPassField
+ (id)_paymentPassFieldsQueryWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassPID:(int64_t)a3 source:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7;
+ (id)joinClauseForProperty:(id)a3;
+ (id)paymentPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4 source:(int64_t)a5;
+ (id)paymentPassFieldsInDatabase:(id)a3 forQuery:(id)a4;
+ (id)secureElementPassFieldsFromDatabaseSecureElementFields:(id)a3;
+ (id)secureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4;
+ (void)deleteSecureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4;
- (SecureElementPassField)initWithBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7;
@end

@implementation SecureElementPassField

+ (id)databaseTable
{
  return @"secure_element_pass_field";
}

+ (id)joinClauseForProperty:(id)a3
{
  else {
    return 0LL;
  }
}

- (SecureElementPassField)initWithBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_10024C37C;
  v38 = sub_10024C38C;
  id v39 = 0LL;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v16, "setEntityPIDOrNull:forKey:", v13, @"pass_pid");
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 key]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v16, "setObjectOrNull:forKey:", v17, @"key");

  uint64_t v18 = SecureElementPassFieldSourceFromString(v14);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    v19 = 0LL;
  }
  else {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
  }
  -[NSMutableDictionary setObjectOrNull:forKey:](v16, "setObjectOrNull:forKey:", v19, @"source");
  -[NSMutableDictionary setInteger:forKey:](v16, "setInteger:forKey:", a6, @"field_order");
  uint64_t v20 = _PKEnumValueToString( [v12 unitType],  @"PKFieldUnitType",  @"PKFieldUnitTypeNone, PKFieldUnitTypeDefault, PKFieldUnitTypeRides, PKFieldUnitTypeTickets, PKFieldUnitTypeLoyaltyPoints");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v16,  "setObjectOrNull:forKey:",  v21,  @"unit_type",  -1LL,  0LL,  1LL,  2LL,  3LL);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10024C394;
  v28[3] = &unk_10064F3A0;
  v33 = &v34;
  v22 = self;
  v29 = v22;
  v23 = v16;
  v30 = v23;
  id v24 = v15;
  id v31 = v24;
  id v25 = v12;
  id v32 = v25;
  sub_1002CCC5C((uint64_t)v24, v28);
  v26 = (SecureElementPassField *)(id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v26;
}

+ (id)insertBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = -[SecureElementPassField initWithBalanceFieldUnit:forPass:passDictionaryKey:order:inDatabase:]( objc_alloc(&OBJC_CLASS___SecureElementPassField),  "initWithBalanceFieldUnit:forPass:passDictionaryKey:order:inDatabase:",  v14,  v13,  v12,  a6,  v11);

  return v15;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPassPID:(int64_t)a3 source:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    v6 = 0LL;
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"source",  v6));
  v11[0] = v5;
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)paymentPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4 source:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4 source:a5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentPassFieldsQueryWithPredicate:v9 inDatabase:v8]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 paymentPassFieldsInDatabase:v8 forQuery:v10]);
  return v11;
}

+ (id)paymentPassFieldsInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10024C794;
  v13[3] = &unk_100643FD8;
  id v16 = a1;
  id v14 = v6;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = v8;
  id v9 = v6;
  [v7 enumeratePersistentIDsUsingBlock:v13];

  v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)secureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentPassFieldsQueryWithPredicate:v7 inDatabase:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 paymentPassFieldsInDatabase:v6 forQuery:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 secureElementPassFieldsFromDatabaseSecureElementFields:v9]);

  return v10;
}

+ (id)secureElementPassFieldsFromDatabaseSecureElementFields:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v9 = objc_alloc_init(&OBJC_CLASS___PKSecureElementPassField);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"key"]);
        [v9 setKey:v10];
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 database]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SecureElementPassFieldForeignReferenceIdentifier identifiersForSecureElementPassField:inDatabase:]( &OBJC_CLASS___SecureElementPassFieldForeignReferenceIdentifier,  "identifiersForSecureElementPassField:inDatabase:",  v8,  v11));

        [v9 setForeignReferenceIdentifiers:v12];
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"unit_type"]);
        id v14 = (void *)v13;
        if (v13) {
          objc_msgSend( v9,  "setUnitType:",  (int)_PKEnumValueFromString( v13,  0,  @"PKFieldUnitType",  @"PKFieldUnitTypeNone, PKFieldUnitTypeDefault, PKFieldUnitTypeRides, PKFieldUnitTypeTickets, PKFieldUnitTypeLoyaltyPoints"),  -1,  0,  1,  2,  3);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"source"]);
        id v16 = NSStringFromSecureElementPassFieldSource((uint64_t)[v15 integerValue]);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
        uint64_t v18 = (void *)v17;
        if (v15 && v17)
        {
          v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v17));
          if (!v19) {
            v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray safelyAddObject:](v19, "safelyAddObject:", v9);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, v18);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v6);
  }

  uint64_t v20 = -[PKSecureElementPassFieldCollection initWithFieldsDictionary:]( objc_alloc(&OBJC_CLASS___PKSecureElementPassFieldCollection),  "initWithFieldsDictionary:",  v4);
  return v20;
}

+ (void)deleteSecureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10024CBE4;
  v10[3] = &unk_10063BE98;
  id v11 = v6;
  id v8 = v6;
  [v7 enumeratePersistentIDsUsingBlock:v10];
  [v7 deleteAllEntities];
}

+ (id)_paymentPassFieldsQueryWithPredicate:(id)a3 inDatabase:(id)a4
{
  uint64_t v13 = @"field_order";
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v12 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:0 groupingProperties:0]);

  return v10;
}

@end