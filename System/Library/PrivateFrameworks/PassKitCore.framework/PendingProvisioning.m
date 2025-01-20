@interface PendingProvisioning
+ (BOOL)deletePendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5;
+ (BOOL)hasPendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4;
+ (id)_pendingProvisioningsInDatabase:(id)a3 forQuery:(id)a4;
+ (id)_predicateForNoReceipt;
+ (id)_predicateForStatus:(int64_t)a3;
+ (id)_predicateForType:(id)a3;
+ (id)_predicateForTypes:(id)a3;
+ (id)_predicateForUniqueIdentifier:(id)a3 type:(id)a4;
+ (id)_propertySetters;
+ (id)allPendingProvisioningsInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 inDatabase:(id)a4;
+ (id)pendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5;
+ (id)pendingProvisioningsInDatabase:(id)a3 ofType:(id)a4;
+ (id)pendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4;
+ (id)pendingProvisioningsInDatabase:(id)a3 withStatus:(int64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)markInProgressPendingProvisioningsAsAvailableInDatabase:(id)a3;
- (BOOL)deleteFromDatabase;
- (PendingProvisioning)initWithPendingProvisioning:(id)a3 inDatabase:(id)a4;
- (id)pendingProvisioning;
@end

@implementation PendingProvisioning

- (PendingProvisioning)initWithPendingProvisioning:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 type]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"type");

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"uniqueIdentifier");

  uint64_t v11 = PKPendingProvisioningStatusToString([v7 status]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"status");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 createdAt]);
  v14 = (void *)_SQLValueForDate(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v14, @"created_at");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 shouldAutoProvision]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v15, @"should_auto_provision");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 provisioningState]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v16,  1LL,  0LL));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v17, @"provisioning_state");

  id v18 = [v7 provisioningAttemptCounter];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v18));
  -[NSMutableDictionary setObjectOrNull:forKey:]( v8,  "setObjectOrNull:forKey:",  v19,  @"provisioning_attempt_counter");

  v20 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v20;
}

+ (id)insertPendingProvisioning:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  if ([v8 length])
  {
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    v20 = sub_1002D8AB8;
    v21 = sub_1002D8AC8;
    id v22 = 0LL;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002D8AD0;
    v11[3] = &unk_1006391A8;
    id v12 = v6;
    id v16 = a1;
    id v13 = v7;
    id v14 = v8;
    v15 = &v17;
    sub_1002CCC5C((uint64_t)v13, v11);
    id v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)allPendingProvisioningsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PendingProvisioning _predicateForNoReceipt]( &OBJC_CLASS___PendingProvisioning,  "_predicateForNoReceipt"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingProvisioningsInDatabase:v4 forQuery:v6]);
  return v7;
}

+ (id)pendingProvisioningsInDatabase:(id)a3 ofType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PendingProvisioning _predicateForNoReceipt]( &OBJC_CLASS___PendingProvisioning,  "_predicateForNoReceipt"));
  v15[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:v6]);

  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingProvisioningsInDatabase:v7 forQuery:v12]);

  return v13;
}

+ (id)pendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PendingProvisioning _predicateForNoReceipt]( &OBJC_CLASS___PendingProvisioning,  "_predicateForNoReceipt"));
  v15[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTypes:v6]);

  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingProvisioningsInDatabase:v7 forQuery:v12]);

  return v13;
}

+ (id)pendingProvisioningsInDatabase:(id)a3 withStatus:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PendingProvisioning _predicateForNoReceipt]( &OBJC_CLASS___PendingProvisioning,  "_predicateForNoReceipt"));
  v14[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:a4]);
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingProvisioningsInDatabase:v6 forQuery:v11]);

  return v12;
}

+ (BOOL)hasPendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PendingProvisioning _predicateForNoReceipt]( &OBJC_CLASS___PendingProvisioning,  "_predicateForNoReceipt"));
  v13[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTypes:v6]);

  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  LOBYTE(a1) = [a1 existsInDatabase:v7 predicate:v11];
  return (char)a1;
}

+ (id)pendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForUniqueIdentifier:a5 type:a4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingProvisioningsInDatabase:v8 forQuery:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  return v12;
}

+ (void)markInProgressPendingProvisioningsAsAvailableInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:2]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002D92DC;
  v8[3] = &unk_10063BE98;
  id v9 = v4;
  id v6 = v4;
  [v7 enumeratePersistentIDsUsingBlock:v8];
}

+ (BOOL)deletePendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForUniqueIdentifier:v10 type:v9]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v11 orderingProperties:0 orderingDirections:0 limit:1]);

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  void v15[2] = sub_1002D9484;
  v15[3] = &unk_100651E00;
  id v13 = v8;
  id v16 = v13;
  uint64_t v17 = &v18;
  [v12 enumeratePersistentIDsUsingBlock:v15];
  LOBYTE(v11) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v11;
}

+ (id)_pendingProvisioningsInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002D9604;
  v16[3] = &unk_100653F98;
  id v20 = [v9 indexOfObject:@"type"];
  id v21 = a1;
  id v17 = v6;
  id v18 = v8;
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = v19;
  id v11 = v8;
  id v12 = v6;
  [v7 enumeratePersistentIDsAndProperties:v9 usingBlock:v16];

  if (-[NSMutableArray count](v10, "count")) {
    id v13 = v10;
  }
  else {
    id v13 = 0LL;
  }
  id v14 = v13;

  return v14;
}

- (id)pendingProvisioning
{
  v3 = (void *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"uniqueIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingProvisioningInDatabase:v4 ofType:v5 withUniqueIdentifier:v6]);

  return v7;
}

+ (id)_predicateForUniqueIdentifier:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"uniqueIdentifier",  a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:v6]);

  v12[0] = v8;
  v12[1] = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForType:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  a3);
}

+ (id)_predicateForTypes:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002D9A6C;
  v6[3] = &unk_100653FB8;
  v6[4] = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_arrayByApplyingBlock:", v6));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v3));

  return v4;
}

+ (id)_predicateForStatus:(int64_t)a3
{
  uint64_t v3 = PKPendingProvisioningStatusToString(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  v4));

  return v5;
}

+ (id)_predicateForNoReceipt
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"pending_provisioning_receipt.f");
}

- (BOOL)deleteFromDatabase
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  int64_t v4 = -[SQLiteEntity persistentID](self, "persistentID");
  if ([v3 isEqualToString:PKPendingProvisioningTypeCarKey])
  {
    v5 = off_100635E00;
LABEL_15:
    -[__objc2_class deleteEntitiesForBasePendingProvisioningPID:inDatabase:]( *v5,  "deleteEntitiesForBasePendingProvisioningPID:inDatabase:",  v4,  self->super._database);
    goto LABEL_16;
  }

  if ([v3 isEqualToString:PKPendingProvisioningTypePaymentRemoteCredential])
  {
    v5 = off_100635E10;
    goto LABEL_15;
  }

  if ([v3 isEqualToString:PKPendingProvisioningTypeShareableCredential])
  {
    v5 = off_100635E20;
    goto LABEL_15;
  }

  if ([v3 isEqualToString:PKPendingProvisioningTypeAccountCredential])
  {
    v5 = off_100635DF8;
    goto LABEL_15;
  }

  if ([v3 isEqualToString:PKPendingProvisioningTypeStatefulTransfer])
  {
    v5 = &off_100635E28;
    goto LABEL_15;
  }

  if ([v3 isEqualToString:PKPendingProvisioningTypePrecursorPass])
  {
    v5 = off_100635E18;
    goto LABEL_15;
  }

  if ([v3 isEqualToString:PKPendingProvisioningTypeIdentityCredential])
  {
    v5 = off_100635E08;
    goto LABEL_15;
  }

+ (id)databaseTable
{
  return @"onion";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pending_provisioning_receipt.f"]) {
    [v5 addObject:@"LEFT JOIN pending_provisioning_receipt ON onion.pid = pending_provisioning_receipt.f"];
  }
}

+ (id)_propertySetters
{
  v3[0] = @"type";
  v3[1] = @"uniqueIdentifier";
  v4[0] = &stru_100653FF8;
  v4[1] = &stru_100654018;
  v3[2] = @"status";
  v3[3] = @"created_at";
  v4[2] = &stru_100654038;
  v4[3] = &stru_100654058;
  v3[4] = @"should_auto_provision";
  v3[5] = @"provisioning_state";
  v4[4] = &stru_100654078;
  v4[5] = &stru_100654098;
  v3[6] = @"provisioning_attempt_counter";
  v4[6] = &stru_1006540B8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end