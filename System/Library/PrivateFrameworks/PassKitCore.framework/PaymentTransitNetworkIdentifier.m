@interface PaymentTransitNetworkIdentifier
+ (BOOL)passExistsInDatabase:(id)a3 forTransitNetworks:(id)a4 isTransitCard:(unint64_t)a5 expired:(unint64_t)a6;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitNetworkIdentifiers:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (id)predicateForNotExpired;
+ (id)predicateForPaymentCardType:(int64_t)a3;
+ (id)predicateForTransitNetworkIdentifiers:(id)a3;
+ (id)transitNetworkIdentifiersInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)transitNetworkIdentifiersInDatabase:(id)a3 forPredicate:(id)a4;
+ (id)transitNetworksInDatabase:(id)a3 forPassesMatchingTransitType:(unint64_t)a4 expired:(unint64_t)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (PaymentTransitNetworkIdentifier)initWithTransitNetworkIdentifier:(id)a3 networkOrder:(int64_t)a4 forPaymentApplication:(id)a5 database:(id)a6;
@end

@implementation PaymentTransitNetworkIdentifier

+ (id)databaseTable
{
  return @"payment_transit_network_identifier";
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
  id v5 = a3;
  id v6 = a4;
  v13[0] = @"payment_application_pid";
  v13[1] = @"payment_application.pass_pid";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v12 = @"pass.card_type";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  v11 = @"pass_annotations.sorting_state";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  if ([v7 containsObject:v5])
  {
    v10 = @"JOIN payment_application ON payment_application.pid = payment_application_pid";
  }

  else
  {
    [v6 addObject:@"JOIN payment_application ON payment_application.pid = payment_application_pid"];
    v10 = @"JOIN pass ON pass.pid = payment_application.pass_pid";
  }

  [v6 addObject:v10];
LABEL_6:
  if ([v9 containsObject:v5])
  {
    [v6 addObject:@"JOIN payment_application ON payment_application.pid = payment_application_pid"];
    [v6 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
    [v6 addObject:@"JOIN pass_annotations ON pass_annotations.pass_pid = pass.pid"];
  }
}

+ (id)transitNetworkIdentifiersInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 transitNetworkIdentifiersInDatabase:v6 forPredicate:v7]);

  return v8;
}

+ (id)transitNetworkIdentifiersInDatabase:(id)a3 forPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21 = @"identifier";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v20 = @"network_order";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v6 orderingProperties:v10]);

  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1000C0430;
  v18 = &unk_10063C0D0;
  v12 = v8;
  v19 = v12;
  [v11 enumeratePersistentIDsAndProperties:v9 usingBlock:&v15];
  if (-[NSMutableArray count](v12, "count", v15, v16, v17, v18)) {
    id v13 = -[NSMutableArray copy](v12, "copy");
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)transitNetworksInDatabase:(id)a3 forPassesMatchingTransitType:(unint64_t)a4 expired:(unint64_t)a5
{
  id v8 = a3;
  v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 2LL);
  if (a4 == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransitNetworkIdentifier predicateForPaymentCardType:]( &OBJC_CLASS___PaymentTransitNetworkIdentifier,  "predicateForPaymentCardType:",  2LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate negatedPredicate:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "negatedPredicate:",  v10));
    -[NSMutableArray addObject:](v9, "addObject:", v11);
  }

  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPaymentCardType:2]);
    -[NSMutableArray addObject:](v9, "addObject:", v10);
  }

LABEL_6:
  if (a5 == 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotExpired]);
    -[NSMutableArray addObject:](v9, "addObject:", v12);
    goto LABEL_10;
  }

  if (a5 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotExpired]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate negatedPredicate:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "negatedPredicate:",  v12));
    -[NSMutableArray addObject:](v9, "addObject:", v13);

LABEL_10:
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransitNetworkIdentifier transitNetworkIdentifiersInDatabase:forPredicate:]( &OBJC_CLASS___PaymentTransitNetworkIdentifier,  "transitNetworkIdentifiersInDatabase:forPredicate:",  v8,  v14));

  return v15;
}

+ (BOOL)passExistsInDatabase:(id)a3 forTransitNetworks:(id)a4 isTransitCard:(unint64_t)a5 expired:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 3LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForTransitNetworkIdentifiers:v10]);

  -[NSMutableArray addObject:](v12, "addObject:", v13);
  if (a5 == 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPaymentCardType:2]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate negatedPredicate:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "negatedPredicate:",  v14));
    -[NSMutableArray addObject:](v12, "addObject:", v15);
  }

  else
  {
    if (a5 != 1) {
      goto LABEL_6;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPaymentCardType:2]);
    -[NSMutableArray addObject:](v12, "addObject:", v14);
  }

LABEL_6:
  if (a6 == 2)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotExpired]);
    -[NSMutableArray addObject:](v12, "addObject:", v16);
    goto LABEL_10;
  }

  if (a6 == 1)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotExpired]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate negatedPredicate:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "negatedPredicate:",  v16));
    -[NSMutableArray addObject:](v12, "addObject:", v17);

LABEL_10:
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v11 predicate:v18]);

  BOOL v20 = [v19 countOfEntities] != 0;
  return v20;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplication:a4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertTransitNetworkIdentifiers:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000C09C4;
    v16[3] = &unk_100640EE0;
    id v17 = v8;
    id v21 = a1;
    id v18 = v9;
    id v19 = v10;
    BOOL v20 = v11;
    v12 = v11;
    sub_1002CCC5C((uint64_t)v19, v16);
    if (-[NSMutableArray count](v12, "count")) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }
    v14 = v13;
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (PaymentTransitNetworkIdentifier)initWithTransitNetworkIdentifier:(id)a3 networkOrder:(int64_t)a4 forPaymentApplication:(id)a5 database:(id)a6
{
  if (a5)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v15 = [v11 persistentID];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v16,  @"payment_application_pid");

    if (v12) {
      id v17 = v12;
    }
    else {
      id v17 = v14;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v17, @"identifier");

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v18,  @"network_order");

    id v19 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v10);
    self = v19;

    BOOL v20 = self;
  }

  else
  {
    BOOL v20 = 0LL;
  }

  return v20;
}

+ (id)_predicateForPaymentApplication:(id)a3
{
  if (a3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPaymentApplicationPID:", objc_msgSend(a3, "persistentID")));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate falsePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "falsePredicate"));
  }
  return v3;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

+ (id)predicateForTransitNetworkIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"identifier",  a3);
}

+ (id)predicateForPaymentCardType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.card_type",  v3));

  return v4;
}

+ (id)predicateForNotExpired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_annotations.sorting_state",  v2));

  return v3;
}

@end