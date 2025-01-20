@interface TransitAppletState
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)allStatesInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)transitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
- (TransitAppletState)initWithTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForAppletState:(id)a3;
- (id)paymentTransactionIdentifier;
- (id)transitAppletState;
- (int64_t)paymentPassPid;
- (void)setPaymentTransactionIdentifier:(id)a3;
- (void)updateWithAppletState:(id)a3;
@end

@implementation TransitAppletState

+ (id)databaseTable
{
  return @"transit_applet_state";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentApplication, a2) == a3) {
    return @"payment_application_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"payment_application.aid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.seid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.pass_pid"] & 1) != 0
    || [v6 isEqualToString:@"payment_application.pid"])
  {
    [v5 addObject:@"JOIN payment_application ON transit_applet_state.payment_application_pid = payment_application.pid"];
  }
}

+ (id)insertTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)a1) initWithTransitAppletState:v8 forPaymentApplicationPID:a4 inDatabase:v9];
  id v11 = [v10 persistentID];
  id v12 = [v10 paymentPassPid];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 balances]);
  v14 = v13;
  if (v13 && [v13 count]) {
    id v15 =  +[TransitAppletStateBalance insertTransitAppletBalances:withPaymentPassPID:withTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateBalance,  "insertTransitAppletBalances:withPaymentPassPID:withTransitAppletStatePID:inDatabase:",  v14,  v12,  v11,  v9);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 commutePlans]);
  v17 = v16;
  if (v16 && [v16 count]) {
    id v18 =  +[TransitAppletStateCommutePlan insertTransitAppletCommutePlans:withPaymentPassPID:withTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "insertTransitAppletCommutePlans:withPaymentPassPID:withTransitAppletStatePID:inDatabase:",  v17,  v12,  v11,  v9);
  }

  return v10;
}

+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v16 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v16 predicate:v6]);
  [v7 deleteAllEntities];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v16 predicate:v6]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transitAppletState]);
  id v10 = [v8 persistentID];
  id v11 = [v8 paymentPassPid];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 balances]);
  v13 = v12;
  if (v12 && [v12 count]) {
    +[TransitAppletStateBalance deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateBalance,  "deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:",  v11,  v10,  v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 commutePlans]);
  id v15 = v14;
  if (v14 && [v14 count]) {
    +[TransitAppletStateCommutePlan deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:",  v11,  v10,  v16);
  }
}

+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)allStatesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TransitAppletState,  "queryWithDatabase:predicate:",  v4,  0LL));
  v17[0] = @"payment_application.pid";
  v17[1] = @"pass.pid";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002DF440;
  v13[3] = &unk_100639BF0;
  id v16 = a1;
  id v14 = v4;
  id v8 = v5;
  id v15 = v8;
  id v9 = v4;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v13];

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)transitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  v13));

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.seid",  v12));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.aid",  v11));

  v32[0] = v15;
  v32[1] = v16;
  v32[2] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TransitAppletState,  "queryWithDatabase:predicate:",  v10,  v19));

  v31[0] = @"payment_application.pid";
  v31[1] = @"pass.pid";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1002DF6CC;
  v27[3] = &unk_100639BF0;
  id v30 = a1;
  id v28 = v10;
  v22 = v14;
  v29 = v22;
  id v23 = v10;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:v27];

  v24 = v29;
  v25 = v22;

  return v25;
}

- (TransitAppletState)initWithTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAppletState _valuesDictionaryForAppletState:](self, "_valuesDictionaryForAppletState:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  [v9 setObject:v10 forKeyedSubscript:@"payment_application_pid"];

  id v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);
  return v11;
}

- (void)updateWithAppletState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAppletState _valuesDictionaryForAppletState:](self, "_valuesDictionaryForAppletState:", v4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 balances]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 commutePlans]);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v9 = -[TransitAppletState paymentPassPid](self, "paymentPassPid");
  +[TransitAppletStateBalance updateWithTransitAppletBalances:forPaymentPassPID:andTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateBalance,  "updateWithTransitAppletBalances:forPaymentPassPID:andTransitAppletStatePID:inDatabase:",  v6,  v9,  v8,  v10);
  +[TransitAppletStateCommutePlan updateWithTransitAppletCommutePlans:forPaymentPassPID:andTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "updateWithTransitAppletCommutePlans:forPaymentPassPID:andTransitAppletStatePID:inDatabase:",  v7,  v9,  v8,  v10);
}

- (id)_valuesDictionaryForAppletState:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isBlacklisted]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"blacklisted");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 appletStateDirty]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v7,  @"applet_state_dirty");

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 historySequenceNumber]);
  int64_t v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v10,  @"history_sequence_number");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 balance]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, @"balance");

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v3 loyaltyBalance]);
  id v15 = (void *)v14;
  if (v14) {
    id v16 = (void *)v14;
  }
  else {
    id v16 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, @"loyalty_balance");

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v3 currency]);
  id v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, @"currency");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
  uint64_t v21 = PKDateToStorageValue();
  uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
  id v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v24, @"expiration_date");

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 needsStationProcessing]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v25,  @"needs_station_processing");

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v3 serverRefreshIdentifier]);
  v27 = (void *)v26;
  if (v26) {
    id v28 = (void *)v26;
  }
  else {
    id v28 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v28,  @"last_refresh_sequence_number");

  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 enrouteTransitTypes]);
  if (v29) {
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v29,  1LL,  0LL));
  }
  else {
    id v30 = 0LL;
  }
  if (v30) {
    v31 = v30;
  }
  else {
    v31 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v31, @"en_route_flags");

  return v4;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

- (id)paymentTransactionIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"payment_transaction_identifier");
}

- (void)setPaymentTransactionIdentifier:(id)a3
{
  if (a3)
  {
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", a3, @"payment_transaction_identifier");
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"payment_transaction_identifier");
  }

- (int64_t)paymentPassPid
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1002DFD40;
  id v11 = sub_1002DFD50;
  id v12 = 0LL;
  v13[0] = @"pass.pid";
  v13[1] = @"payment_application.pid";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002DFD58;
  v6[3] = &unk_10064DD98;
  v6[4] = &v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v3, v6);

  id v4 = [(id)v8[5] longLongValue];
  _Block_object_dispose(&v7, 8);

  return (int64_t)v4;
}

+ (id)_propertySetters
{
  v3[0] = @"history_sequence_number";
  v3[1] = @"balance";
  v4[0] = &stru_100654208;
  v4[1] = &stru_100654228;
  v3[2] = @"loyalty_balance";
  v3[3] = @"blacklisted";
  v4[2] = &stru_100654248;
  v4[3] = &stru_100654268;
  v3[4] = @"currency";
  v3[5] = @"applet_state_dirty";
  v4[4] = &stru_100654288;
  v4[5] = &stru_1006542A8;
  v3[6] = @"expiration_date";
  v3[7] = @"needs_station_processing";
  v4[6] = &stru_1006542C8;
  v4[7] = &stru_1006542E8;
  v3[8] = @"last_refresh_sequence_number";
  v3[9] = @"en_route_flags";
  v4[8] = &stru_100654308;
  v4[9] = &stru_100654328;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL));
}

- (id)transitAppletState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKTransitAppletState);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitAppletState _propertySetters](&OBJC_CLASS___TransitAppletState, "_propertySetters"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_1002E0568;
  v56[3] = &unk_100639EE8;
  id v6 = v4;
  id v57 = v6;
  uint64_t v7 = v3;
  v58 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v56);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v9 = -[TransitAppletState paymentPassPid](self, "paymentPassPid");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransitAppletStateBalance transitAppletBalancesInDatabase:forPaymentPassPID:andTransitAppletStatePID:]( &OBJC_CLASS___TransitAppletStateBalance,  "transitAppletBalancesInDatabase:forPaymentPassPID:andTransitAppletStatePID:",  v10,  v9,  v8));
  -[NSMutableArray pk_safelyAddObjectsFromArray:](v11, "pk_safelyAddObjectsFromArray:", v12);
  if (!-[NSMutableArray count](v11, "count"))
  {
    v37 = v12;
    int64_t v38 = v8;
    v40 = v7;
    id v41 = v6;
    v39 = v10;
    int64_t v36 = v9;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentBalance paymentBalancesInDatabase:forPassPID:]( &OBJC_CLASS___PaymentBalance,  "paymentBalancesInDatabase:forPassPID:",  v10,  v9));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    v35 = v14;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v14 components:252 fromDate:v15]);

    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id obj = v13;
    id v44 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v53;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v53 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = v16;
          uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifiers]);
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          v45 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);
          id v20 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v49;
            do
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                v24 = v11;
                if (*(void *)v49 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v25 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
                uint64_t v26 = objc_alloc(&OBJC_CLASS___PKTransitAppletBalance);
                v27 = (void *)objc_claimAutoreleasedReturnValue([v17 value]);
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v17 currencyCode]);
                v29 = -[PKTransitAppletBalance initWithIdentifier:balance:currency:exponent:expirationDate:]( v26,  "initWithIdentifier:balance:currency:exponent:expirationDate:",  v25,  v27,  v28,  [v17 exponent],  v47);

                id v11 = v24;
                -[NSMutableArray addObject:](v24, "addObject:", v29);
              }

              id v21 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
            }

            while (v21);
          }

          uint64_t v16 = v46 + 1;
        }

        while ((id)(v46 + 1) != v44);
        id v44 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      }

      while (v44);
    }

    uint64_t v7 = v40;
    id v6 = v41;
    int64_t v8 = v38;
    id v10 = v39;
    int64_t v9 = v36;
    id v12 = v37;
  }

  id v30 = -[NSMutableArray copy](v11, "copy");
  -[PKTransitAppletState setBalances:](v7, "setBalances:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TransitAppletStateCommutePlan transitAppletCommutePlansInDatabase:forPaymentPassPID:andTransitAppletStatePID:]( &OBJC_CLASS___TransitAppletStateCommutePlan,  "transitAppletCommutePlansInDatabase:forPaymentPassPID:andTransitAppletStatePID:",  v10,  v9,  v8));
  id v32 = [v31 copy];
  -[PKTransitAppletState setCommutePlans:](v7, "setCommutePlans:", v32);

  v33 = v7;
  return v33;
}

@end