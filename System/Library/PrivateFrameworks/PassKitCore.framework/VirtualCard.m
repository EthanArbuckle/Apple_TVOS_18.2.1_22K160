@interface VirtualCard
+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3;
+ (id)_predicateForVirtualCardIdentifier:(id)a3;
+ (id)_predicateForVirtualCardStatusUpdatePID:(int64_t)a3;
+ (id)_propertySettersForVirtualCard;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateVirtualCards:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertVirtualCards:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)virtualCardForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)virtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)virtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
- (VirtualCard)initWithVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (VirtualCard)initWithVirtualCard:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
- (id)virtualCard;
- (void)removeVirtualCardEncryptedData;
- (void)updateWithVirtualCard:(id)a3;
@end

@implementation VirtualCard

- (VirtualCard)initWithVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 cardholderName]);
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 state]));
  [v10 setObjectOrNull:v14 forKey:@"d"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 FPANSuffix]);
  [v10 setObjectOrNull:v15 forKey:@"e"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 lastUpdatedDate]);
  v17 = (void *)_SQLValueForDate(v16);
  [v10 setObjectOrNull:v17 forKey:@"f"];

  if ([v8 supportsLocalStorage])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptedData]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 base64EncodedStringWithOptions:0]);
    [v10 setObjectOrNull:v19 forKey:@"g"];
  }

  else
  {
    [v10 setObjectOrNull:0 forKey:@"g"];
  }

  if ([v8 supportsLocalStorage])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v8 ephemeralPublicKey]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);
    [v10 setObjectOrNull:v21 forKey:@"h"];
  }

  else
  {
    [v10 setObjectOrNull:0 forKey:@"h"];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 expiration]);
  [v10 setObjectOrNull:v22 forKey:@"i"];

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 type]));
  [v10 setObjectOrNull:v23 forKey:@"j"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 lastAutoFilledBySafari]);
  v25 = (void *)_SQLValueForDate(v24);
  [v10 setObjectOrNull:v25 forKey:@"l"];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 supportsLocalStorage]));
  [v10 setObjectOrNull:v26 forKey:@"m"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v8 securityCodeIdentifier]);
  [v10 setObjectOrNull:v27 forKey:@"n"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 securityCodeExpiration]);
  v29 = (void *)_SQLValueForDate(v28);
  [v10 setObjectOrNull:v29 forKey:@"o"];

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 hasDynamicSecurityCode]));
  [v10 setObjectOrNull:v30 forKey:@"p"];

  v31 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v9);
  return v31;
}

+ (id)insertOrUpdateVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 virtualCardForIdentifier:v10 inDatabase:v9]);

  if (v11) {
    [v11 updateWithVirtualCard:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithVirtualCard:v8 forCreditAccountDetailsPID:a4 inDatabase:v9];
  }

  return v11;
}

+ (id)virtualCardForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForVirtualCardIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)virtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1003A6370;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertOrUpdateVirtualCards:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v38 = a5;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v34 = *(void *)v40;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v32 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier", v32));
        v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a4]);
        v46[0] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForVirtualCardIdentifier:v13]);
        v46[1] = v15;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));

        v18 = (VirtualCard *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v38 predicate:v17]);
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v21)
          {
            *(_DWORD *)buf = v32;
            v45 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Updating virtual card with identifier: %@",  buf,  0xCu);
          }

          -[VirtualCard updateWithVirtualCard:](v18, "updateWithVirtualCard:", v12);
        }

        else
        {
          if (v21)
          {
            *(_DWORD *)buf = v32;
            v45 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Inserting virtual card with identifier: %@",  buf,  0xCu);
          }

          v18 = -[VirtualCard initWithVirtualCard:forCreditAccountDetailsPID:inDatabase:]( objc_alloc(&OBJC_CLASS___VirtualCard),  "initWithVirtualCard:forCreditAccountDetailsPID:inDatabase:",  v12,  a4,  v38);
        }

        [v36 addObject:v13];
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[VirtualCard virtualCard](v18, "virtualCard"));
        [v35 addObject:v22];
      }

      id v10 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v10);
  }

  uint64_t v23 = PKLogFacilityTypeGetObject(14LL);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Removing invalid leftover virtual cards for account",  buf,  2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v36));
  v43[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a4]);
  v43[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v38 predicate:v28]);
  [v29 deleteAllEntities];
  id v30 = [v35 copy];

  return v30;
}

- (void)updateWithVirtualCard:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v5 setObjectOrNull:v6 forKey:@"b"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cardholderName]);
  [v5 setObjectOrNull:v7 forKey:@"c"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 state]));
  [v5 setObjectOrNull:v8 forKey:@"d"];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 type]));
  [v5 setObjectOrNull:v9 forKey:@"j"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 FPANSuffix]);
  [v5 setObjectOrNull:v10 forKey:@"e"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 expiration]);
  [v5 setObjectOrNull:v11 forKey:@"i"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedDate]);
  id v13 = (void *)_SQLValueForDate(v12);
  [v5 setObjectOrNull:v13 forKey:@"f"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 lastAutoFilledBySafari]);
  v15 = (void *)_SQLValueForDate(v14);
  [v5 setObjectOrNull:v15 forKey:@"l"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 supportsLocalStorage]));
  [v5 setObjectOrNull:v16 forKey:@"m"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 securityCodeIdentifier]);
  [v5 setObjectOrNull:v17 forKey:@"n"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 securityCodeExpiration]);
  id v19 = (void *)_SQLValueForDate(v18);
  [v5 setObjectOrNull:v19 forKey:@"o"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 hasDynamicSecurityCode]));
  [v5 setObjectOrNull:v20 forKey:@"p"];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1003A6C8C;
  v36[3] = &unk_100639300;
  id v21 = v5;
  id v37 = v21;
  v22 = objc_retainBlock(v36);
  if ([v4 supportsLocalStorage])
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 encryptedData]);
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v4 ephemeralPublicKey]);

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v4 encryptedData]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 base64EncodedStringWithOptions:0]);
        [v21 setObjectOrNull:v27 forKey:@"g"];

        v28 = (void *)objc_claimAutoreleasedReturnValue([v4 ephemeralPublicKey]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 base64EncodedStringWithOptions:0]);
        [v21 setObjectOrNull:v29 forKey:@"h"];
      }
    }
  }

  else
  {
    ((void (*)(void *))v22[2])(v22);
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedDate]);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"f"));
  __int128 v32 = (void *)_DateForSQLValue(v31);

  if ([v32 compare:v30] == (id)-1) {
    ((void (*)(void *))v22[2])(v22);
  }
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[VirtualCard virtualCard](self, "virtualCard"));
    *(_DWORD *)buf = 138412546;
    __int128 v39 = v35;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Updating old virtual card: %@\n with new virtual card: %@",  buf,  0x16u);
  }

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v21);
}

- (void)removeVirtualCardEncryptedData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObjectOrNull:0 forKey:@"g"];
  [v3 setObjectOrNull:0 forKey:@"h"];
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing virtual card encrypted data from database",  v6,  2u);
  }

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v3);
}

+ (void)deleteVirtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003A6E7C;
  v5[3] = &unk_10063E308;
  id v7 = a1;
  int64_t v8 = a3;
  id v6 = a4;
  id v4 = v6;
  sub_1002CCC5C((uint64_t)v4, v5);
}

+ (id)databaseTable
{
  return @"raspberries";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)_predicateForVirtualCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForVirtualCardStatusUpdatePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"k",  v3));

  return v4;
}

- (id)virtualCard
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKVirtualCard);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[VirtualCard _propertySettersForVirtualCard]( &OBJC_CLASS___VirtualCard,  "_propertySettersForVirtualCard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003A715C;
  v11[3] = &unk_100638EF0;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  int64_t v8 = v13;
  __int128 v9 = v6;

  return v9;
}

- (VirtualCard)initWithVirtualCard:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"k"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v10 setObjectOrNull:v12 forKey:@"b"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 cardholderName]);
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 state]));
  [v10 setObjectOrNull:v14 forKey:@"d"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 FPANSuffix]);
  [v10 setObjectOrNull:v15 forKey:@"e"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdatedDate]);
  v17 = (void *)_SQLValueForDate(v16);
  [v10 setObjectOrNull:v17 forKey:@"f"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 encryptedData]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 base64EncodedStringWithOptions:0]);
  [v10 setObjectOrNull:v19 forKey:@"g"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 ephemeralPublicKey]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);
  [v10 setObjectOrNull:v21 forKey:@"h"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 expiration]);
  [v10 setObjectOrNull:v22 forKey:@"i"];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 type]));
  [v10 setObjectOrNull:v23 forKey:@"j"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 lastAutoFilledBySafari]);
  v25 = (void *)_SQLValueForDate(v24);
  [v10 setObjectOrNull:v25 forKey:@"l"];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 supportsLocalStorage]));
  [v10 setObjectOrNull:v26 forKey:@"m"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v9 securityCodeIdentifier]);
  [v10 setObjectOrNull:v27 forKey:@"n"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v9 securityCodeExpiration]);
  v29 = (void *)_SQLValueForDate(v28);
  [v10 setObjectOrNull:v29 forKey:@"o"];

  id v30 = [v9 hasDynamicSecurityCode];
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
  [v10 setObjectOrNull:v31 forKey:@"p"];

  __int128 v32 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v32;
}

+ (id)virtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForVirtualCardStatusUpdatePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v21 = @"pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1003A7684;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertVirtualCards:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
        uint64_t v16 = objc_alloc(&OBJC_CLASS___VirtualCard);
        v17 = -[VirtualCard initWithVirtualCard:forVirtualCardStatusUpdatePID:inDatabase:]( v16,  "initWithVirtualCard:forVirtualCardStatusUpdatePID:inDatabase:",  v15,  a4,  v8,  (void)v20);
        if (v17) {
          [v9 addObject:v17];
        }

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  id v18 = [v9 copy];
  return v18;
}

+ (void)deleteVirtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForVirtualCardStatusUpdatePID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_propertySettersForVirtualCard
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065A820;
  v4[1] = &stru_10065A840;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10065A860;
  v4[3] = &stru_10065A880;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10065A8A0;
  v4[5] = &stru_10065A8C0;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_10065A8E0;
  v4[7] = &stru_10065A900;
  v3[8] = @"j";
  v3[9] = @"l";
  v4[8] = &stru_10065A920;
  v4[9] = &stru_10065A940;
  v3[10] = @"m";
  v3[11] = @"n";
  v4[10] = &stru_10065A960;
  v4[11] = &stru_10065A980;
  v3[12] = @"o";
  v3[13] = @"p";
  v4[12] = &stru_10065A9A0;
  v4[13] = &stru_10065A9C0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  14LL));
}

@end