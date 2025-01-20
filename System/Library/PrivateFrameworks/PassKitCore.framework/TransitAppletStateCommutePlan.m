@interface TransitAppletStateCommutePlan
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPassPID:(int64_t)a3;
+ (id)_predicateForTransitAppletStatePID:(int64_t)a3;
+ (id)_propertySettersForCommutePlanItem;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)insertTransitAppletCommutePlans:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)transitAppletCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (id)transitAppletStateCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateWithTransitAppletCommutePlans:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (TransitAppletStateCommutePlan)initWithTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (id)_valuesDictionaryForTransitAppletCommutePlan:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5;
- (id)commutePlan;
@end

@implementation TransitAppletStateCommutePlan

- (TransitAppletStateCommutePlan)initWithTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TransitAppletStateCommutePlan _valuesDictionaryForTransitAppletCommutePlan:paymentPassPID:transitAppletStatePID:]( self,  "_valuesDictionaryForTransitAppletCommutePlan:paymentPassPID:transitAppletStatePID:",  a3,  a4,  a5));
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v10);

  return v12;
}

+ (id)databaseTable
{
  return @"transit_applet_state_commute_plan";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___TransitAppletState, v4) == a3) {
    return @"transit_applet_state_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"transit_applet_state.pid"] & 1) != 0
    || [v6 isEqualToString:@"transit_applet_state_pid"])
  {
    [v5 addObject:@"JOIN transit_applet_state ON transit_applet_state_commute_plan.transit_applet_state_pid = transit_applet_state.pid"];
  }

  if (([v6 isEqualToString:@"pass.pid"] & 1) != 0
    || [v6 isEqualToString:@"pass.unique_id"])
  {
    [v5 addObject:@"JOIN pass ON pass.pid = transit_applet_state_commute_plan.pass_pid"];
  }
}

+ (id)insertTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithTransitAppletCommutePlan:v11 withPaymentPassPID:a4 withTransitAppletStatePID:a5 inDatabase:v10];

  return v12;
}

+ (id)insertTransitAppletCommutePlans:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16);
        v18 = objc_alloc(&OBJC_CLASS___TransitAppletStateCommutePlan);
        v19 = -[TransitAppletStateCommutePlan initWithTransitAppletCommutePlan:withPaymentPassPID:withTransitAppletStatePID:inDatabase:]( v18,  "initWithTransitAppletCommutePlan:withPaymentPassPID:withTransitAppletStatePID:inDatabase:",  v17,  a4,  a5,  v10,  (void)v22);
        -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v19);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

  id v20 = -[NSMutableArray copy](v11, "copy");
  return v20;
}

+ (void)updateWithTransitAppletCommutePlans:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v11 = a3;
  id v9 = a6;
  if (v11 && [v11 count])
  {
    +[TransitAppletStateCommutePlan deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:",  a4,  a5,  v9);
    id v10 =  +[TransitAppletStateCommutePlan insertTransitAppletCommutePlans:withPaymentPassPID:withTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "insertTransitAppletCommutePlans:withPaymentPassPID:withTransitAppletStatePID:inDatabase:",  v11,  a4,  a5,  v9);
  }
}

+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPassPID:a3]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatePID:a4]);
  v14[0] = v9;
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v12]);
  [v13 deleteAllEntities];
}

+ (id)transitAppletStateCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPassPID:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatePID:a5]);
  v28[0] = v10;
  v28[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "queryWithDatabase:predicate:",  v8,  v13));
  v27[0] = @"transit_applet_state.pid";
  v27[1] = @"pass.pid";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  __int128 v22 = sub_1003A8B24;
  __int128 v23 = &unk_100639BF0;
  __int128 v25 = v9;
  id v26 = a1;
  id v24 = v8;
  v16 = v9;
  id v17 = v8;
  [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:&v20];

  id v18 = -[NSMutableArray copy](v16, "copy", v20, v21, v22, v23);
  return v18;
}

+ (id)transitAppletCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [a1 transitAppletStateCommutePlansInDatabase:a3 forPaymentPassPID:a4 andTransitAppletStatePID:a5]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v11), "commutePlan", (void)v15));
        if (v12) {
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = -[NSMutableArray copy](v6, "copy");
  return v13;
}

- (id)commutePlan
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKTransitAppletCommutePlan);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TransitAppletStateCommutePlan _propertySettersForCommutePlanItem]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "_propertySettersForCommutePlanItem"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003A8D94;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)_valuesDictionaryForTransitAppletCommutePlan:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, @"transit_applet_state_pid");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"pass_pid");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"identifier");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"unique_identifier");

  uint64_t v13 = PKTransitAppletCommutePlanStatusToString([v7 status]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v14, @"status");

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
  __int128 v16 = (void *)_SQLValueForDate(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v16, @"start_date");

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 expirationDate]);
  __int128 v18 = (void *)_SQLValueForDate(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v18, @"expiration_date");

  id v19 = -[NSMutableDictionary copy](v8, "copy");
  return v19;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPaymentPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForTransitAppletStatePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transit_applet_state_pid",  v3));

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_propertySettersForCommutePlanItem
{
  v3[0] = @"identifier";
  v3[1] = @"unique_identifier";
  v4[0] = &stru_10065AA80;
  v4[1] = &stru_10065AAA0;
  v3[2] = @"status";
  v3[3] = @"start_date";
  v4[2] = &stru_10065AAC0;
  v4[3] = &stru_10065AAE0;
  v3[4] = @"expiration_date";
  v4[4] = &stru_10065AB00;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end