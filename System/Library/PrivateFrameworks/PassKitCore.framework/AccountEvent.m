@interface AccountEvent
+ (BOOL)insertOrUpdateAccountEvent:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAccountEventExcludingTypes:(id)a3;
+ (id)_predicateForAccountEventTypes:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAltDSID:(id)a3;
+ (id)_predicateForBillPaymentSelectedSuggestedAmountEndDate:(id)a3;
+ (id)_predicateForBillPaymentSelectedSuggestedAmountStartDate:(id)a3;
+ (id)_predicateForBillPaymentSelectedSuggestedAmountStatementIdenfitier:(id)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForEventTypes:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPersistentPID:(int64_t)a3;
+ (id)_predicateForRedemptionToDestination:(unint64_t)a3;
+ (id)_predicateForRewardsAddedIdentifier:(id)a3;
+ (id)_predicateForServicingActivityIdentifier:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_predicateForSuccessfulRedemption;
+ (id)_predicateForTransactionIdentifier:(id)a3;
+ (id)_propertySettersForAccountEvent;
+ (id)accountEventWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountEventsForAccountIdentifier:(id)a3 altDSID:(id)a4 types:(id)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(unint64_t)a9 inDatabase:(id)a10;
+ (id)accountEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 inDatabase:(id)a5;
+ (id)accountEventsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4;
+ (id)billPaymentSelectedSuggestedAmountsWithAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6;
+ (id)billPaymentSelectedSuggestedAmountsWithStatementIdenfitier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (id)eventIdentifiersForEventsWithServicingStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 inDatabase:(id)a6;
+ (id)redemptionAccountEventWithRewardsAddedIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)redemptionAccountEventWithTransactionIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)servicingAccountEventsWithTransactionIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (unint64_t)successfulRedemptionEventsToPeerPaymentForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountEventWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountEventsForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountEventsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountEvent)initWithAccountEvent:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)event;
- (id)identifier;
- (void)insertItemsFromEvent:(id)a3 forPersistentID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
- (void)updateWithAccountEvent:(id)a3;
@end

@implementation AccountEvent

+ (id)accountEventsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002C5BCC;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)accountEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v29[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEventExcludingTypes:v11]);
  v29[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v14]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v28 = @"pid";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  v24 = sub_1002C5E10;
  v25 = &unk_100639E18;
  id v26 = v8;
  id v27 = v16;
  id v18 = v16;
  id v19 = v8;
  [v15 enumeratePersistentIDsAndProperties:v17 usingBlock:&v22];

  id v20 = objc_msgSend(v18, "copy", v22, v23, v24, v25);
  return v20;
}

+ (id)accountEventsForAccountIdentifier:(id)a3 altDSID:(id)a4 types:(id)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(unint64_t)a9 inDatabase:(id)a10
{
  id v16 = a10;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v47[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:v20]);

  v47[1] = v22;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEventTypes:v19]);
  v47[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStartDate:v18]);

  v47[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEndDate:v17]);

  v47[4] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventTypes:v19]);

  v47[5] = v26;
  uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 6LL));

  v28 = (void *)v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v27));
  v46 = @"d";
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  v31 = SQLiteOrderAscending;
  if (a8 != -1) {
    v31 = &SQLiteOrderDescending;
  }
  v45 = *v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL, a8));
  v33 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v16 predicate:v29 orderingProperties:v30 orderingDirections:v32 limit:a9]);

  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v44 = @"pid";
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1002C616C;
  v41[3] = &unk_100639E18;
  id v42 = v16;
  v43 = v34;
  v36 = v34;
  id v37 = v16;
  [v33 enumeratePersistentIDsAndProperties:v35 usingBlock:v41];

  id v38 = -[NSMutableArray copy](v36, "copy");
  return v38;
}

+ (id)redemptionAccountEventWithTransactionIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionIdentifier:v6]);
    v27[0] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSuccessfulRedemption]);
    v27[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

    id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v7 predicate:v11 orderingProperties:0 orderingDirections:0 limit:1]);
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    uint64_t v23 = sub_1002C6408;
    v24 = sub_1002C6418;
    id v25 = 0LL;
    v26[0] = @"avocados.a";
    v26[1] = @"cantaloupes.a";
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002C6420;
    v17[3] = &unk_1006432D8;
    id v19 = &v20;
    id v18 = v7;
    [v12 enumeratePersistentIDsAndProperties:v13 usingBlock:v17];

    v14 = (void *)v21[5];
    if (v14) {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 event]);
    }
    else {
      v15 = 0LL;
    }

    _Block_object_dispose(&v20, 8);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (id)redemptionAccountEventWithRewardsAddedIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRewardsAddedIdentifier:v6]);
  v28[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSuccessfulRedemption]);
  v28[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v7 predicate:v11 orderingProperties:0 orderingDirections:0 limit:1]);
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1002C6408;
  id v25 = sub_1002C6418;
  id v26 = 0LL;
  v27[0] = @"avocados.a";
  v27[1] = @"jackfruits.a";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1002C66AC;
  v18[3] = &unk_1006432D8;
  uint64_t v20 = &v21;
  id v14 = v7;
  id v19 = v14;
  [v12 enumeratePersistentIDsAndProperties:v13 usingBlock:v18];

  v15 = (void *)v22[5];
  if (v15) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 event]);
  }
  else {
    id v16 = 0LL;
  }

  _Block_object_dispose(&v21, 8);
  return v16;
}

+ (id)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 inDatabase:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:v10]);
  v41[0] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRedemptionToDestination:a3]);
  v41[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:v11]);
  v41[2] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));

  v40 = @"d";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  v39 = @"DESC";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v17 orderingProperties:v18 orderingDirections:v19 limit:1]);

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_1002C6408;
  v36 = sub_1002C6418;
  id v37 = 0LL;
  id v38 = @"avocados.a";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  v28 = sub_1002C69C4;
  v29 = &unk_1006432D8;
  v31 = &v32;
  id v22 = v12;
  id v30 = v22;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:&v26];

  uint64_t v23 = (void *)v33[5];
  if (v23) {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "event", v26, v27, v28, v29));
  }
  else {
    v24 = 0LL;
  }

  _Block_object_dispose(&v32, 8);
  return v24;
}

+ (unint64_t)successfulRedemptionEventsToPeerPaymentForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForRedemptionToDestination:", 1, v7));
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSuccessfulRedemption]);
  v14[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  unint64_t v12 = +[SQLiteEntity countInDatabase:predicate:](&OBJC_CLASS___AccountEvent, "countInDatabase:predicate:", v6, v11);
  return v12;
}

+ (id)servicingAccountEventsWithTransactionIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a4]);
  v32[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForServicingActivityIdentifier:v9]);

  v32[1] = v11;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  v31 = @"tomatoes.j";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  id v30 = @"DESC";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v13 orderingProperties:v14 orderingDirections:v15]);

  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v29 = @"pid";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  id v25 = sub_1002C6D78;
  id v26 = &unk_100639E18;
  id v27 = v8;
  id v19 = v17;
  v28 = v19;
  id v20 = v8;
  [v16 enumeratePersistentIDsAndProperties:v18 usingBlock:&v23];

  if (-[NSMutableOrderedSet count](v19, "count", v23, v24, v25, v26)) {
    id v21 = -[NSMutableOrderedSet copy](v19, "copy");
  }
  else {
    id v21 = 0LL;
  }

  return v21;
}

+ (id)eventIdentifiersForEventsWithServicingStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"tomatoes.g",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v22 = @"pid";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_1002C6F60;
  id v19 = &unk_100639E18;
  id v20 = v6;
  id v21 = v10;
  unint64_t v12 = v10;
  id v13 = v6;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:&v16];

  id v14 = -[NSMutableSet copy](v12, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)billPaymentSelectedSuggestedAmountsWithStatementIdenfitier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a4]);
  v26[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEventTypes:&off_100691130]);
  v26[1] = v11;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBillPaymentSelectedSuggestedAmountStatementIdenfitier:v9]);

  void v26[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v14]);

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v25 = @"pid";
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1002C71DC;
  v22[3] = &unk_100639E18;
  id v23 = v8;
  id v18 = v16;
  uint64_t v24 = v18;
  id v19 = v8;
  [v15 enumeratePersistentIDsAndProperties:v17 usingBlock:v22];

  if (-[NSMutableSet count](v18, "count")) {
    id v20 = -[NSMutableSet copy](v18, "copy");
  }
  else {
    id v20 = 0LL;
  }

  return v20;
}

+ (id)billPaymentSelectedSuggestedAmountsWithAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v33[0] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEventTypes:&off_100691148]);
  v33[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBillPaymentSelectedSuggestedAmountStartDate:v12]);

  v33[2] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBillPaymentSelectedSuggestedAmountEndDate:v11]);

  v33[3] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 4LL));

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v18]);

  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v32 = @"pid";
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  v28 = sub_1002C746C;
  v29 = &unk_100639E18;
  id v30 = v10;
  id v22 = v20;
  v31 = v22;
  id v23 = v10;
  [v19 enumeratePersistentIDsAndProperties:v21 usingBlock:&v26];

  if (-[NSMutableSet count](v22, "count", v26, v27, v28, v29)) {
    id v24 = -[NSMutableSet copy](v22, "copy");
  }
  else {
    id v24 = 0LL;
  }

  return v24;
}

+ (id)accountEventWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (BOOL)insertOrUpdateAccountEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 accountEventWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithAccountEvent:v6];
  }
  else {

  }
  return v9 == 0LL;
}

- (AccountEvent)initWithAccountEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[Account accountWithIdentifier:inDatabase:]( &OBJC_CLASS___Account,  "accountWithIdentifier:inDatabase:",  v8,  v7));
  if (v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v6 type], @"c");
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"alt_dsid");

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v12, @"b");

    -[NSMutableDictionary setLongLong:forKey:](v10, "setLongLong:forKey:", [v9 persistentID], @"a");
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
    id v14 = (void *)_SQLValueForDate(v13);
    -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v14, @"d");

    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);
    id v16 = (void *)_SQLValueForDate(v15);
    -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v16, @"e");

    self = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v7);
    -[AccountEvent insertItemsFromEvent:forPersistentID:accountIdentifier:inDatabase:]( self,  "insertItemsFromEvent:forPersistentID:accountIdentifier:inDatabase:",  v6,  -[SQLiteEntity persistentID](self, "persistentID"),  v8,  v7);

    uint64_t v17 = self;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No account found when trying to insert event with id %@",  (uint8_t *)&v21,  0xCu);
    }

    uint64_t v17 = 0LL;
  }

  return v17;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (void)insertItemsFromEvent:(id)a3 forPersistentID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v94 = a5;
  id v10 = a6;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 items]);
  id v12 = [v11 countByEnumeratingWithState:&v95 objects:v101 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v96;
    *(void *)&__int128 v13 = 138412290LL;
    __int128 v93 = v13;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v96 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v95 + 1) + 8LL * (void)i);
        switch((unint64_t)objc_msgSend(v9, "type", v93))
        {
          case 1uLL:
          case 2uLL:
            uint64_t v37 = objc_opt_class(&OBJC_CLASS___PKAccountRewards, v18);
            if ((objc_opt_isKindOfClass(v17, v37) & 1) == 0)
            {
              uint64_t Object = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v65 = (void *)objc_opt_class(v17, v64);
              *(_DWORD *)buf = v93;
              v100 = v65;
              id v29 = v65;
              id v30 = v26;
              v31 = "Wrong class for PKAccountRewards item: %@";
              goto LABEL_63;
            }

            id v38 =  +[AccountRewards insertRewards:forEventPID:inDatabase:]( &OBJC_CLASS___AccountRewards,  "insertRewards:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 3uLL:
            uint64_t v44 = objc_opt_class(&OBJC_CLASS___PKCreditAccountStatement, v18);
            if ((objc_opt_isKindOfClass(v17, v44) & 1) == 0)
            {
              uint64_t v69 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v71 = (void *)objc_opt_class(v17, v70);
              *(_DWORD *)buf = v93;
              v100 = v71;
              id v29 = v71;
              id v30 = v26;
              v31 = "Wrong class for PKCreditAccountStatement item: %@";
              goto LABEL_63;
            }

            id v45 =  +[CreditAccountStatement insertCreditAccountStatement:forEventPID:withAccountIdentifier:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "insertCreditAccountStatement:forEventPID:withAccountIdentifier:inDatabase:",  v17,  a4,  v94,  v10);
            break;
          case 4uLL:
            uint64_t v46 = objc_opt_class(&OBJC_CLASS___PKAccountServicingEvent, v18);
            if ((objc_opt_isKindOfClass(v17, v46) & 1) == 0)
            {
              uint64_t v72 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v74 = (void *)objc_opt_class(v17, v73);
              *(_DWORD *)buf = v93;
              v100 = v74;
              id v29 = v74;
              id v30 = v26;
              v31 = "Wrong class for PKAccountServicingEvent item: %@";
              goto LABEL_63;
            }

            id v47 =  +[AccountServicingEvent insertServicingEvent:forEventPID:inDatabase:]( &OBJC_CLASS___AccountServicingEvent,  "insertServicingEvent:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
            uint64_t v21 = objc_opt_class(&OBJC_CLASS___PKAccountPayment, v18);
            if ((objc_opt_isKindOfClass(v17, v21) & 1) == 0)
            {
              uint64_t v34 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v36 = (void *)objc_opt_class(v17, v35);
              *(_DWORD *)buf = v93;
              v100 = v36;
              id v29 = v36;
              id v30 = v26;
              v31 = "Wrong class for PKAccountPayment item: %@";
              goto LABEL_63;
            }

            id v22 =  +[AccountPayment insertPayment:forEventPID:accountIdentifier:inDatabase:]( &OBJC_CLASS___AccountPayment,  "insertPayment:forEventPID:accountIdentifier:inDatabase:",  v17,  a4,  v94,  v10);
            break;
          case 9uLL:
            uint64_t v48 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentReminder, v18);
            if ((objc_opt_isKindOfClass(v17, v48) & 1) == 0)
            {
              uint64_t v75 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v77 = (void *)objc_opt_class(v17, v76);
              *(_DWORD *)buf = v93;
              v100 = v77;
              id v29 = v77;
              id v30 = v26;
              v31 = "Wrong class for PKAccountPaymentReminder item: %@";
              goto LABEL_63;
            }

            id v49 =  +[AccountPaymentReminder insertPaymentReminder:forEventPID:inDatabase:]( &OBJC_CLASS___AccountPaymentReminder,  "insertPaymentReminder:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0xAuLL:
            uint64_t v50 = objc_opt_class(&OBJC_CLASS___PKAccountCreditTermsUpdate, v18);
            if ((objc_opt_isKindOfClass(v17, v50) & 1) == 0)
            {
              uint64_t v78 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v80 = (void *)objc_opt_class(v17, v79);
              *(_DWORD *)buf = v93;
              v100 = v80;
              id v29 = v80;
              id v30 = v26;
              v31 = "Wrong class for PKAccountCreditTerms item: %@";
              goto LABEL_63;
            }

            id v51 =  +[AccountCreditTermsUpdate insertCreditTermsUpdate:forEventPID:inDatabase:]( &OBJC_CLASS___AccountCreditTermsUpdate,  "insertCreditTermsUpdate:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0xBuLL:
            uint64_t v52 = objc_opt_class(&OBJC_CLASS___PKAccountPhysicalCardStatusUpdate, v18);
            if ((objc_opt_isKindOfClass(v17, v52) & 1) == 0)
            {
              uint64_t v81 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v83 = (void *)objc_opt_class(v17, v82);
              *(_DWORD *)buf = v93;
              v100 = v83;
              id v29 = v83;
              id v30 = v26;
              v31 = "Wrong class for PKAccountPhysicalCardStatusUpdate item: %@";
              goto LABEL_63;
            }

            id v53 =  +[AccountPhysicalCardStatusUpdate insertPhysicalCardStatusUpdate:forEventPID:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardStatusUpdate,  "insertPhysicalCardStatusUpdate:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0xCuLL:
            uint64_t v54 = objc_opt_class(&OBJC_CLASS___PKAccountPhysicalCardShippingUpdate, v18);
            if ((objc_opt_isKindOfClass(v17, v54) & 1) == 0)
            {
              uint64_t v84 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v86 = (void *)objc_opt_class(v17, v85);
              *(_DWORD *)buf = v93;
              v100 = v86;
              id v29 = v86;
              id v30 = v26;
              v31 = "Wrong class for PKAccountPhysicalCardShippingUpdate item: %@";
              goto LABEL_63;
            }

            id v55 =  +[AccountPhysicalCardShippingUpdate insertPhysicalCardShippingUpdate:forEventPID:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardShippingUpdate,  "insertPhysicalCardShippingUpdate:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0xDuLL:
            uint64_t v56 = objc_opt_class(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate, v18);
            if ((objc_opt_isKindOfClass(v17, v56) & 1) == 0)
            {
              uint64_t v87 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v89 = (void *)objc_opt_class(v17, v88);
              *(_DWORD *)buf = v93;
              v100 = v89;
              id v29 = v89;
              id v30 = v26;
              v31 = "Wrong class for PKAccountVirtualCardStatusUpdate item: %@";
              goto LABEL_63;
            }

            id v57 =  +[AccountVirtualCardStatusUpdate insertVirtualCardStatusUpdate:forEventPID:inDatabase:]( &OBJC_CLASS___AccountVirtualCardStatusUpdate,  "insertVirtualCardStatusUpdate:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0xEuLL:
            uint64_t v58 = objc_opt_class(&OBJC_CLASS___PKBillPaymentSelectedSuggestedAmountData, v18);
            if ((objc_opt_isKindOfClass(v17, v58) & 1) == 0)
            {
              uint64_t v90 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v92 = (void *)objc_opt_class(v17, v91);
              *(_DWORD *)buf = v93;
              v100 = v92;
              id v29 = v92;
              id v30 = v26;
              v31 = "Wrong class for PKBillPaymentSelectedSuggestedAmountData item: %@";
              goto LABEL_63;
            }

            id v59 =  +[AccountBillPaymentSelectedSuggestedAmountData insertBillPaymentSelectedSuggestedAmountData:forEventPID:inDatabase:]( &OBJC_CLASS___AccountBillPaymentSelectedSuggestedAmountData,  "insertBillPaymentSelectedSuggestedAmountData:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0xFuLL:
            uint64_t v42 = objc_opt_class(&OBJC_CLASS___PKAccountUserInfoUpdate, v18);
            if ((objc_opt_isKindOfClass(v17, v42) & 1) == 0)
            {
              uint64_t v66 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v68 = (void *)objc_opt_class(v17, v67);
              *(_DWORD *)buf = v93;
              v100 = v68;
              id v29 = v68;
              id v30 = v26;
              v31 = "Wrong class for AccountUserInfoUpdate item: %@";
              goto LABEL_63;
            }

            id v43 =  +[AccountUserInfoUpdate insertUserInfoUpdate:forEventPID:inDatabase:]( &OBJC_CLASS___AccountUserInfoUpdate,  "insertUserInfoUpdate:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
            uint64_t v23 = objc_opt_class(&OBJC_CLASS___PKAccountAssistanceProgramMessage, v18);
            if ((objc_opt_isKindOfClass(v17, v23) & 1) == 0)
            {
              uint64_t v39 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v41 = (void *)objc_opt_class(v17, v40);
              *(_DWORD *)buf = v93;
              v100 = v41;
              id v29 = v41;
              id v30 = v26;
              v31 = "Wrong class for PKAccountAssistanceProgramMessage item: %@";
              goto LABEL_63;
            }

            id v24 =  +[AccountAssistanceProgramMessage insertAssistanceProgramMessage:forEventPID:inDatabase:]( &OBJC_CLASS___AccountAssistanceProgramMessage,  "insertAssistanceProgramMessage:forEventPID:inDatabase:",  v17,  a4,  v10);
            break;
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___PKAccountTransfer, v18);
            if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
            {
              uint64_t v25 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v28 = (void *)objc_opt_class(v17, v27);
              *(_DWORD *)buf = v93;
              v100 = v28;
              id v29 = v28;
              id v30 = v26;
              v31 = "Wrong class for PKAccountTransfer item: %@";
              goto LABEL_63;
            }

            id v20 =  +[AccountTransfer insertTransfer:forEventPID:accountIdentifier:inDatabase:]( &OBJC_CLASS___AccountTransfer,  "insertTransfer:forEventPID:accountIdentifier:inDatabase:",  v17,  a4,  v94,  v10);
            break;
          case 0x19uLL:
          case 0x1AuLL:
            uint64_t v32 = objc_opt_class(&OBJC_CLASS___PKAccountHold, v18);
            if ((objc_opt_isKindOfClass(v17, v32) & 1) != 0)
            {
              id v33 =  +[AccountHold insertOrUpdateHold:forEventPID:accountIdentifier:inDatabase:]( &OBJC_CLASS___AccountHold,  "insertOrUpdateHold:forEventPID:accountIdentifier:inDatabase:",  v17,  a4,  v94,  v10);
            }

            else
            {
              uint64_t v60 = PKLogFacilityTypeGetObject(14LL);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v62 = (void *)objc_opt_class(v17, v61);
                *(_DWORD *)buf = v93;
                v100 = v62;
                id v29 = v62;
                id v30 = v26;
                v31 = "Wrong class for PKAccountHold item: %@";
LABEL_63:
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
              }

- (void)updateWithAccountEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[Account accountWithIdentifier:inDatabase:]( &OBJC_CLASS___Account,  "accountWithIdentifier:inDatabase:",  v5,  self->super._database));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v4, "type"), @"c");
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
    [v7 setObjectOrNull:v8 forKey:@"alt_dsid"];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);
    id v10 = (void *)_SQLValueForDate(v9);
    [v7 setObjectOrNull:v10 forKey:@"d"];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
    id v12 = (void *)_SQLValueForDate(v11);
    [v7 setObjectOrNull:v12 forKey:@"e"];

    -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002C84E4;
    v15[3] = &unk_100640EE0;
    int64_t v20 = -[SQLiteEntity persistentID](self, "persistentID");
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    uint64_t v17 = self;
    id v18 = v4;
    id v19 = v5;
    id v13 = v16;
    sub_1002CCC5C((uint64_t)v13, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "No account found when trying to insert event with id %@",  buf,  0xCu);
    }
  }
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b");
}

- (id)event
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountEvent);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountEvent _propertySettersForAccountEvent]( &OBJC_CLASS___AccountEvent,  "_propertySettersForAccountEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1002C88F8;
  uint64_t v17 = &unk_100639EE8;
  id v6 = v4;
  id v18 = v6;
  id v7 = v3;
  id v19 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v14);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID", v14, v15, v16, v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  switch((unint64_t)-[PKAccountEvent type](v7, "type"))
  {
    case 1uLL:
    case 2uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountRewards rewardsWithEventPID:inDatabase:]( &OBJC_CLASS___AccountRewards,  "rewardsWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 3uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[CreditAccountStatement creditAccountStatementsWithEventPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "creditAccountStatementsWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 4uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountServicingEvent servicingEventsWithEventPID:inDatabase:]( &OBJC_CLASS___AccountServicingEvent,  "servicingEventsWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountPayment paymentsWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPayment,  "paymentsWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 9uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountPaymentReminder paymentRemindersWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPaymentReminder,  "paymentRemindersWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0xAuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountCreditTermsUpdate creditTermsUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountCreditTermsUpdate,  "creditTermsUpdatesWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0xBuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountPhysicalCardStatusUpdate physicalCardStatusUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardStatusUpdate,  "physicalCardStatusUpdatesWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0xCuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountPhysicalCardShippingUpdate physicalCardShippingUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardShippingUpdate,  "physicalCardShippingUpdatesWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0xDuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountVirtualCardStatusUpdate virtualCardStatusUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountVirtualCardStatusUpdate,  "virtualCardStatusUpdatesWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0xEuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountBillPaymentSelectedSuggestedAmountData billPaymentSelectedSuggestedAmountDataWithEventPID:inDatabase:]( &OBJC_CLASS___AccountBillPaymentSelectedSuggestedAmountData,  "billPaymentSelectedSuggestedAmountDataWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0xFuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountUserInfoUpdate userInfoUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountUserInfoUpdate,  "userInfoUpdatesWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountAssistanceProgramMessage assistanceProgramMessagesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountAssistanceProgramMessage,  "assistanceProgramMessagesWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountTransfer transfersWithEventPID:inDatabase:]( &OBJC_CLASS___AccountTransfer,  "transfersWithEventPID:inDatabase:",  v8,  v9));
      goto LABEL_16;
    case 0x19uLL:
    case 0x1AuLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[AccountHold holdsWithEventPID:inDatabase:]( &OBJC_CLASS___AccountHold,  "holdsWithEventPID:inDatabase:",  v8,  v9));
LABEL_16:
      id v11 = (void *)v10;
      -[PKAccountEvent setItems:](v7, "setItems:", v10);

      break;
    default:
      break;
  }

  id v12 = v7;

  return v12;
}

- (id)accountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pears.a");
}

+ (id)databaseTable
{
  return @"grapes";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  uint64_t v40 = v7;
  if (v7 == @"pears.a") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"pears.a");

    if ((v8 & 1) != 0)
    {
LABEL_4:
      id v9 = @"JOIN pears ON pears.pid = grapes.a";
LABEL_32:
      [v6 addObject:v9];
      goto LABEL_33;
    }

    uint64_t v10 = v40;
    if (v10 == @"jackfruits.a"
      || (id v11 = v10,
          unsigned __int8 v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"jackfruits.a"),
          v11,
          (v12 & 1) != 0)
      || (id v13 = v11, v13 == @"jackfruits.b")
      || (id v14 = v13,
          unsigned __int8 v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", @"jackfruits.b"),
          v14,
          (v15 & 1) != 0))
    {
      id v9 = @"JOIN jackfruits ON jackfruits.a = avocados.pid";
      goto LABEL_32;
    }

    id v16 = v14;
    if (v16 == @"cantaloupes.a"
      || (uint64_t v17 = v16,
          unsigned __int8 v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", @"cantaloupes.a"),
          v17,
          (v18 & 1) != 0)
      || (id v19 = v17, v19 == @"cantaloupes.b")
      || (int64_t v20 = v19,
          unsigned __int8 v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", @"cantaloupes.b"),
          v20,
          (v21 & 1) != 0))
    {
      id v9 = @"JOIN cantaloupes ON cantaloupes.a = avocados.pid";
      goto LABEL_32;
    }

    id v22 = v20;
    if (v22 == @"avocados.a") {
      goto LABEL_21;
    }
    uint64_t v23 = v22;
    unsigned __int8 v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", @"avocados.a");

    if ((v24 & 1) != 0) {
      goto LABEL_21;
    }
    uint64_t v25 = v23;
    if (v25 == @"avocados.e"
      || (id v26 = v25,
          unsigned __int8 v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", @"avocados.e"),
          v26,
          (v27 & 1) != 0)
      || (v28 = v26, v28 == @"avocados.f")
      || (id v29 = v28,
          unsigned __int8 v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", @"avocados.f"),
          v29,
          (v30 & 1) != 0))
    {
LABEL_21:
      id v9 = @"JOIN avocados ON avocados.a = grapes.pid";
      goto LABEL_32;
    }

    v31 = v29;
    if (v31 == @"tomatoes.f") {
      goto LABEL_28;
    }
    uint64_t v32 = v31;
    unsigned __int8 v33 = -[__CFString isEqualToString:](v31, "isEqualToString:", @"tomatoes.f");

    if ((v33 & 1) != 0) {
      goto LABEL_28;
    }
    uint64_t v34 = v32;
    if (v34 == @"tomatoes.j") {
      goto LABEL_28;
    }
    uint64_t v35 = v34;
    unsigned __int8 v36 = -[__CFString isEqualToString:](v34, "isEqualToString:", @"tomatoes.j");

    if ((v36 & 1) != 0
      || (uint64_t v37 = v35, v37 == @"tomatoes.g")
      || (id v38 = v37,
          unsigned __int8 v39 = -[__CFString isEqualToString:](v37, "isEqualToString:", @"tomatoes.g"),
          v38,
          id v7 = v40,
          (v39 & 1) != 0))
    {
LABEL_28:
      id v9 = @"JOIN tomatoes ON tomatoes.a = grapes.pid";
      goto LABEL_32;
    }
  }

  if ((PKEqualObjects(v7, @"starfruits.b") & 1) != 0 || PKEqualObjects(v40, @"starfruits.c"))
  {
    id v9 = @"JOIN starfruits ON starfruits.a = grapes.pid";
    goto LABEL_32;
  }

+ (void)deleteAccountEventWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 accountEventWithIdentifier:a3 inDatabase:a4]);
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (void)deleteAccountEventsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteAccountEventsForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[AccountRewards deleteRewardsWithEventPID:inDatabase:]( &OBJC_CLASS___AccountRewards,  "deleteRewardsWithEventPID:inDatabase:",  v3,  v4);
  +[CreditAccountStatement deleteCreditAccountStatementForEventPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "deleteCreditAccountStatementForEventPID:inDatabase:",  v3,  v4);
  +[AccountServicingEvent deleteServicingEventWithEventPID:inDatabase:]( &OBJC_CLASS___AccountServicingEvent,  "deleteServicingEventWithEventPID:inDatabase:",  v3,  v4);
  +[AccountPayment deletePaymentWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPayment,  "deletePaymentWithEventPID:inDatabase:",  v3,  v4);
  +[AccountPaymentReminder deletePaymentReminderWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPaymentReminder,  "deletePaymentReminderWithEventPID:inDatabase:",  v3,  v4);
  +[AccountCreditTermsUpdate deleteCreditTermsUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountCreditTermsUpdate,  "deleteCreditTermsUpdatesWithEventPID:inDatabase:",  v3,  v4);
  +[AccountPhysicalCardStatusUpdate deletePhysicalCardStatusUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardStatusUpdate,  "deletePhysicalCardStatusUpdatesWithEventPID:inDatabase:",  v3,  v4);
  +[AccountPhysicalCardShippingUpdate deletePhysicalCardShippingUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountPhysicalCardShippingUpdate,  "deletePhysicalCardShippingUpdatesWithEventPID:inDatabase:",  v3,  v4);
  +[AccountVirtualCardStatusUpdate deleteVirtualCardStatusUpdatesWithEventPID:inDatabase:]( &OBJC_CLASS___AccountVirtualCardStatusUpdate,  "deleteVirtualCardStatusUpdatesWithEventPID:inDatabase:",  v3,  v4);
  +[AccountBillPaymentSelectedSuggestedAmountData deleteBillPaymentSelectedSuggestedAmountDataPID:inDatabase:]( &OBJC_CLASS___AccountBillPaymentSelectedSuggestedAmountData,  "deleteBillPaymentSelectedSuggestedAmountDataPID:inDatabase:",  v3,  v4);
  +[AccountUserInfoUpdate deleteUserInfoUpdatePID:inDatabase:]( &OBJC_CLASS___AccountUserInfoUpdate,  "deleteUserInfoUpdatePID:inDatabase:",  v3,  v4);
  +[AccountAssistanceProgramMessage deleteAssistanceProgramMessagePID:inDatabase:]( &OBJC_CLASS___AccountAssistanceProgramMessage,  "deleteAssistanceProgramMessagePID:inDatabase:",  v3,  v4);
  +[AccountTransfer deleteTransferWithEventPID:inDatabase:]( &OBJC_CLASS___AccountTransfer,  "deleteTransferWithEventPID:inDatabase:",  v3,  v4);
  +[AccountHold deleteHoldWithEventPID:inDatabase:]( &OBJC_CLASS___AccountHold,  "deleteHoldWithEventPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___AccountEvent;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForBillPaymentSelectedSuggestedAmountStatementIdenfitier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"starfruits.b",  a3);
}

+ (id)_predicateForBillPaymentSelectedSuggestedAmountStartDate:(id)a3
{
  if (a3)
  {
    int64_t v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"starfruits.c",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForBillPaymentSelectedSuggestedAmountEndDate:(id)a3
{
  if (a3)
  {
    int64_t v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"starfruits.c",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pears.a",  a3);
}

+ (id)_predicateForAltDSID:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"alt_dsid",  v3));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }
  id v5 = (void *)v4;

  return v5;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPersistentPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForAccountEventTypes:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"c",  a3);
}

+ (id)_predicateForAccountEventExcludingTypes:(id)a3
{
  return +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"c",  a3);
}

+ (id)_predicateForTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"cantaloupes.b",  a3);
}

+ (id)_predicateForSuccessfulRedemption
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"avocados.f",  @"success");
}

+ (id)_predicateForRedemptionToDestination:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"avocados.e",  v3));

  return v4;
}

+ (id)_predicateForRewardsAddedIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"jackfruits.b",  a3);
}

+ (id)_predicateForServicingActivityIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"tomatoes.f",  a3);
}

+ (id)_predicateForStartDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate(a3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"d",  v3));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForEndDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate(a3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"d",  v3));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForEventTypes:(id)a3
{
  if (a3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"c",  a3));
  }
  else {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }
  return v3;
}

+ (id)_propertySettersForAccountEvent
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100653688;
  v4[1] = &stru_1006536A8;
  v3[2] = @"pears.a";
  v3[3] = @"d";
  v4[2] = &stru_1006536C8;
  v4[3] = &stru_1006536E8;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_100653708;
  v4[5] = &stru_100653728;
  v3[6] = @"alt_dsid";
  v4[6] = &stru_100653748;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end