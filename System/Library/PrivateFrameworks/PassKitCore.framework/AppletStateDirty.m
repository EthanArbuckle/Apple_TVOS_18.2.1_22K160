@interface AppletStateDirty
+ (id)_predicateForAppletStateDirtyPID:(int64_t)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplications:(id)a3;
+ (id)_predicateForSetOfAppletStateDirtyPIDs:(id)a3;
+ (id)_predicateForTransitAppletStateDirty:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForTransitAppletStatesDirty:(id)a3 inDatabase:(id)a4;
+ (id)_propertySettersForAppletStateDirty;
+ (id)anyInDatabase:(id)a3 forTransitAppletStateDirty:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)dirtyAppletStatesInDatabase:(id)a3;
+ (id)dirtyAppletStatesInDatabase:(id)a3 fromSetOfTransitAppletStatesDirty:(id)a4;
+ (id)insertAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (int64_t)countInDatabase:(id)a3;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForAppletState:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForAppletStateDirtyPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForSetOfAppletStateDirtyPIDs:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForSetOfAppletStates:(id)a3 inDatabase:(id)a4;
- (AppletStateDirty)initWithTransitAppletStateDirty:(id)a3 inDatabase:(id)a4;
- (id)dirtyAppletState;
- (id)passUniqueIdentifier;
- (int64_t)paymentApplicationPID;
@end

@implementation AppletStateDirty

- (AppletStateDirty)initWithTransitAppletStateDirty:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 passUniqueIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 secureElementIdentifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationIdentifier]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication anyInDatabase:withPassUniqueIdentifier:secureElementIdentifier:paymentApplicationIdentifier:]( &OBJC_CLASS___PaymentApplication,  "anyInDatabase:withPassUniqueIdentifier:secureElementIdentifier:paymentApplicationIdentifier:",  v6,  v9,  v10,  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"payment_application_pid");

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AppletStateDirty;
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v16, "initWithPropertyValues:inDatabase:", v8, v6);

  return v14;
}

+ (id)databaseTable
{
  return @"applet_state_dirty";
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
  if (([v6 isEqualToString:@"payment_application.pid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.aid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.seid"] & 1) != 0
    || [v6 isEqualToString:@"payment_application.dpan_id"])
  {
    [v5 addObject:@"JOIN payment_application ON payment_application.pid = applet_state_dirty.payment_application_pid"];
  }
}

+ (id)insertAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithTransitAppletStateDirty:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v7 forTransitAppletStateDirty:v6]);
  if (!v8) {
    id v8 = [objc_alloc((Class)a1) initWithTransitAppletStateDirty:v6 inDatabase:v7];
  }

  return v8;
}

+ (void)deleteEntitiesForAppletStateDirtyPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletStateDirtyPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForSetOfAppletStateDirtyPIDs:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForSetOfAppletStateDirtyPIDs:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForSetOfAppletStates:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatesDirty:a3 inDatabase:v6]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForAppletState:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStateDirty:a3 inDatabase:v6]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (int64_t)countInDatabase:(id)a3
{
  return (int64_t)[a1 countInDatabase:a3 predicate:0];
}

+ (id)anyInDatabase:(id)a3 forTransitAppletStateDirty:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStateDirty:a4 inDatabase:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)dirtyAppletStatesInDatabase:(id)a3 fromSetOfTransitAppletStatesDirty:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatesDirty:a4 inDatabase:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v22[0] = @"pass.unique_id";
  v22[1] = @"payment_application.pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100338EC8;
  v18 = &unk_100639BF0;
  v20 = v9;
  id v21 = a1;
  id v19 = v6;
  v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = -[NSMutableSet copy](v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)dirtyAppletStatesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v19[0] = @"pass.unique_id";
  v19[1] = @"payment_application.pid";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_10033905C;
  v15 = &unk_100639BF0;
  v17 = v6;
  id v18 = a1;
  id v16 = v4;
  id v8 = v6;
  id v9 = v4;
  [v5 enumeratePersistentIDsAndProperties:v7 usingBlock:&v12];

  id v10 = -[NSMutableSet copy](v8, "copy", v12, v13, v14, v15);
  return v10;
}

- (id)passUniqueIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass.unique_id");
}

- (int64_t)paymentApplicationPID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"payment_application.pid"));
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (id)dirtyAppletState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKTransitAppletStateDirty);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AppletStateDirty _propertySettersForAppletStateDirty]( &OBJC_CLASS___AppletStateDirty,  "_propertySettersForAppletStateDirty"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003391D0;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  uint64_t v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_propertySettersForAppletStateDirty
{
  v3[0] = @"pass.unique_id";
  v3[1] = @"payment_application.aid";
  v4[0] = &stru_1006579F8;
  v4[1] = &stru_100657A18;
  v3[2] = @"payment_application.seid";
  v3[3] = @"payment_application.dpan_id";
  v4[2] = &stru_100657A38;
  v4[3] = &stru_100657A58;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (id)_predicateForTransitAppletStateDirty:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 passUniqueIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 secureElementIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationIdentifier]);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication anyInDatabase:withPassUniqueIdentifier:secureElementIdentifier:paymentApplicationIdentifier:]( &OBJC_CLASS___PaymentApplication,  "anyInDatabase:withPassUniqueIdentifier:secureElementIdentifier:paymentApplicationIdentifier:",  v6,  v8,  v9,  v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplication:v11]);

  return v12;
}

+ (id)_predicateForTransitAppletStatesDirty:(id)a3 inDatabase:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication paymentApplicationsInDatabase:forTransitAppletStatesDirty:]( &OBJC_CLASS___PaymentApplication,  "paymentApplicationsInDatabase:forTransitAppletStatesDirty:",  a4,  a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplications:v5]);

  return v6;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_predicateForPaymentApplication:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.pid",  v3));

  return v4;
}

+ (id)_predicateForAppletStateDirtyPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForSetOfAppletStateDirtyPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  a3);
}

+ (id)_predicateForPaymentApplications:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects", 0));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) persistentID]));
        -[NSMutableSet addObject:](v4, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_application.pid",  v4));
  return v11;
}

@end