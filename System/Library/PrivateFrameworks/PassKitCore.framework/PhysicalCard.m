@interface PhysicalCard
+ (id)_physicalCardsWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3 physicalCardIdentifier:(id)a4;
+ (id)_predicateForPhysicalCardIdentifier:(id)a3;
+ (id)_predicateForPhysicalCardStatusUpdatePID:(int64_t)a3;
+ (id)_propertySettersForPhysicalCard;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPhysicalCards:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)physicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)physicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)replacePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePhysicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePhysicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PhysicalCard)initWithPhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PhysicalCard)initWithPhysicalCard:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
- (id)physicalCard;
- (void)updateWithPhysicalCard:(id)a3;
@end

@implementation PhysicalCard

+ (id)databaseTable
{
  return @"blackberries";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountPhysicalCardStatusUpdate, v4) == a3) {
    return @"g";
  }
  return 0LL;
}

- (PhysicalCard)initWithPhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"a");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v12, @"b");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 accountUserAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v13, @"k");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 state]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v14, @"c");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 frontFaceImageURL]);
  v16 = (void *)_SQLValueForURL(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v16, @"d");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 nameOnCard]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v17, @"e");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdated]);
  v19 = (void *)_SQLValueForDate(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v19, @"f");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 FPANSuffix]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v20, @"h");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 trackingNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v21, @"i");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 shippingCompany]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v22, @"j");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 activationCodeHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v23, @"activation_code_hash");

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 expirationMonth]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v24, @"expiration_month");

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 expirationYear]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v25, @"expiration_year");

  v26 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  id v27 = -[SQLiteEntity persistentID](v26, "persistentID");
  v28 = (void *)objc_claimAutoreleasedReturnValue([v9 orderActivity]);

  id v29 =  +[PhysicalCardOrderActivityEvent insertPhysicalCardOrderActivityEvents:forPhysicalCardPID:inDatabase:]( &OBJC_CLASS___PhysicalCardOrderActivityEvent,  "insertPhysicalCardOrderActivityEvents:forPhysicalCardPID:inDatabase:",  v28,  v27,  v8);
  return v26;
}

- (PhysicalCard)initWithPhysicalCard:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"g"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 accountUserAltDSID]);
  [v10 setObjectOrNull:v13 forKey:@"k"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 state]));
  [v10 setObjectOrNull:v14 forKey:@"c"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 frontFaceImageURL]);
  v16 = (void *)_SQLValueForURL(v15);
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 nameOnCard]);
  [v10 setObjectOrNull:v17 forKey:@"e"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdated]);
  v19 = (void *)_SQLValueForDate(v18);
  [v10 setObjectOrNull:v19 forKey:@"f"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 FPANSuffix]);
  [v10 setObjectOrNull:v20 forKey:@"h"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 trackingNumber]);
  [v10 setObjectOrNull:v21 forKey:@"i"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 shippingCompany]);
  [v10 setObjectOrNull:v22 forKey:@"j"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 activationCodeHash]);
  [v10 setObjectOrNull:v23 forKey:@"activation_code_hash"];

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 expirationMonth]));
  [v10 setObjectOrNull:v24 forKey:@"expiration_month"];

  id v25 = [v9 expirationYear];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v25));
  [v10 setObjectOrNull:v26 forKey:@"expiration_year"];

  id v27 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v27;
}

+ (id)replacePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 insertOrUpdatePhysicalCards:a3 forAccountPID:a4 inDatabase:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_setByApplyingBlock:", &stru_100656A78));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v10));
  v18[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v14]);
  [v15 deleteAllEntities];
  id v16 = [v9 copy];

  return v16;
}

+ (id)insertOrUpdatePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertOrUpdatePhysicalCard:forAccountPID:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  a4,  v9,  (void)v19));
          if (v16) {
            -[NSMutableSet addObject:](v10, "addObject:", v16);
          }

          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v13);
    }

    id v17 = -[NSMutableSet copy](v10, "copy");
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

+ (id)insertOrUpdatePhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4 physicalCardIdentifier:v10]);
    id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v11]);

    if (v12) {
      [v12 updateWithPhysicalCard:v8];
    }
    else {
      id v12 = [objc_alloc((Class)a1) initWithPhysicalCard:v8 forAccountPID:a4 inDatabase:v9];
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 physicalCard]);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)insertPhysicalCards:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
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
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
        id v16 = objc_alloc(&OBJC_CLASS___PhysicalCard);
        id v17 = -[PhysicalCard initWithPhysicalCard:forPhysicalCardStatusUpdatePID:inDatabase:]( v16,  "initWithPhysicalCard:forPhysicalCardStatusUpdatePID:inDatabase:",  v15,  a4,  v8,  (void)v20);
        if (v17) {
          [v9 addObject:v17];
        }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  id v18 = [v9 copy];
  return v18;
}

- (void)updateWithPhysicalCard:(id)a3
{
  id v4 = a3;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v22 setObjectOrNull:v5 forKey:@"b"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountUserAltDSID]);
  [v22 setObjectOrNull:v6 forKey:@"k"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 state]));
  [v22 setObjectOrNull:v7 forKey:@"c"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 frontFaceImageURL]);
  id v9 = (void *)_SQLValueForURL(v8);
  [v22 setObjectOrNull:v9 forKey:@"d"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 nameOnCard]);
  [v22 setObjectOrNull:v10 forKey:@"e"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdated]);
  id v12 = (void *)_SQLValueForDate(v11);
  [v22 setObjectOrNull:v12 forKey:@"f"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 FPANSuffix]);
  [v22 setObjectOrNull:v13 forKey:@"h"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 trackingNumber]);
  [v22 setObjectOrNull:v14 forKey:@"i"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 shippingCompany]);
  [v22 setObjectOrNull:v15 forKey:@"j"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 activationCodeHash]);
  [v22 setObjectOrNull:v16 forKey:@"activation_code_hash"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 expirationMonth]));
  [v22 setObjectOrNull:v17 forKey:@"expiration_month"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 expirationYear]));
  [v22 setObjectOrNull:v18 forKey:@"expiration_year"];

  int64_t v19 = -[SQLiteEntity persistentID](self, "persistentID");
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 orderActivity]);

  +[PhysicalCardOrderActivityEvent updateActivityEvents:forPhysicalCardPID:inDatabase:]( &OBJC_CLASS___PhysicalCardOrderActivityEvent,  "updateActivityEvents:forPhysicalCardPID:inDatabase:",  v21,  v19,  v20);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v22);
}

+ (void)deletePhysicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deletePhysicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardStatusUpdatePID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PhysicalCardOrderActivityEvent deleteActivityEventsForPhysicalCardPID:inDatabase:]( &OBJC_CLASS___PhysicalCardOrderActivityEvent,  "deleteActivityEventsForPhysicalCardPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PhysicalCard;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)physicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _physicalCardsWithQuery:v8]);
  return v9;
}

+ (id)physicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardStatusUpdatePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _physicalCardsWithQuery:v8]);
  return v9;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3 physicalCardIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardIdentifier:v6]);

  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  return v10;
}

+ (id)_predicateForPhysicalCardStatusUpdatePID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"g",  v3));

  return v4;
}

+ (id)_predicateForPhysicalCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

- (id)physicalCard
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPhysicalCard);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPhysicalCard");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100320598;
  v17[3] = &unk_100638EF0;
  v17[4] = self;
  id v18 = v6;
  id v8 = v3;
  int64_t v19 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v17);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PhysicalCardOrderActivityEvent physicalCardOrderActivityEventsForPhysicalCardPID:inDatabase:]( &OBJC_CLASS___PhysicalCardOrderActivityEvent,  "physicalCardOrderActivityEventsForPhysicalCardPID:inDatabase:",  v10,  v11));
  -[PKPhysicalCard setOrderActivity:](v8, "setOrderActivity:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPhysicalCard identifier](v8, "identifier"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPhysicalCardShippingUpdate physicalCardShippingUpdatesForPhysicalCardWithIdentifier:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardShippingUpdate,  "physicalCardShippingUpdatesForPhysicalCardWithIdentifier:inDatabase:",  v13,  v11));

  -[PKPhysicalCard setShippingActivity:](v8, "setShippingActivity:", v14);
  uint64_t v15 = v8;

  return v15;
}

+ (id)_physicalCardsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPhysicalCard]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_10032070C;
  id v16 = &unk_100638F18;
  id v20 = a1;
  id v17 = v5;
  id v18 = v4;
  id v8 = v6;
  id v19 = v8;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  if (objc_msgSend(v8, "count", v13, v14, v15, v16)) {
    id v11 = [v8 copy];
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)_propertySettersForPhysicalCard
{
  v3[0] = @"b";
  v3[1] = @"k";
  v4[0] = &stru_100656AB8;
  v4[1] = &stru_100656AD8;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100656AF8;
  v4[3] = &stru_100656B18;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_100656B38;
  v4[5] = &stru_100656B58;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100656B78;
  v4[7] = &stru_100656B98;
  v3[8] = @"j";
  v3[9] = @"activation_code_hash";
  v4[8] = &stru_100656BB8;
  v4[9] = &stru_100656BD8;
  v3[10] = @"expiration_month";
  v3[11] = @"expiration_year";
  v4[10] = &stru_100656BF8;
  v4[11] = &stru_100656C18;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
}

@end