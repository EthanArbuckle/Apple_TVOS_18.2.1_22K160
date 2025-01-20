@interface PendingProvisioningReceipt
+ (id)_allProperties;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForObject;
+ (id)_propertyValuesFor:(id)a3;
+ (id)databaseTable;
+ (id)pendingProvisioningReceiptsInDatabase:(id)a3;
+ (void)deleteAllPendingProvisioningReceptsInDatabase:(id)a3;
+ (void)insertOrUpdateReceipt:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PendingProvisioningReceipt)initWithObject:(id)a3 inDatabase:(id)a4;
- (id)receipt;
- (void)updateWithObject:(id)a3;
@end

@implementation PendingProvisioningReceipt

- (PendingProvisioningReceipt)initWithObject:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesFor:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesFor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)databaseTable
{
  return @"pending_provisioning_receipt";
}

+ (id)pendingProvisioningReceiptsInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForObject]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);
  id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "_allProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1001CF8E8;
  v19 = &unk_10064B0E8;
  id v23 = a1;
  id v20 = v5;
  id v21 = v4;
  v11 = v6;
  v22 = v11;
  id v12 = v4;
  id v13 = v5;
  [v7 enumerateProperties:v10 usingBlock:&v16];

  if (-[NSMutableArray count](v11, "count", v16, v17, v18, v19)) {
    id v14 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (void)insertOrUpdateReceipt:(id)a3 inDatabase:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v7]);

  id v9 = (PendingProvisioningReceipt *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v14 predicate:v8]);
  if (v9)
  {
    v10 = v9;
    -[PendingProvisioningReceipt updateWithObject:](v9, "updateWithObject:", v6);
  }

  else
  {
    v10 = -[PendingProvisioningReceipt initWithObject:inDatabase:]( objc_alloc(&OBJC_CLASS___PendingProvisioningReceipt),  "initWithObject:inDatabase:",  v6,  v14);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 pendingProvisioning]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PendingProvisioning insertPendingProvisioning:inDatabase:]( &OBJC_CLASS___PendingProvisioning,  "insertPendingProvisioning:inDatabase:",  v11,  v14));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
  -[SQLiteEntity setValue:forProperty:](v10, "setValue:forProperty:", v13, @"f");
}

+ (void)deleteAllPendingProvisioningReceptsInDatabase:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001CFB8C;
  v7[3] = &unk_10063BE98;
  id v8 = v4;
  id v5 = v4;
  [v6 enumeratePersistentIDsUsingBlock:v7];
}

- (id)receipt
{
  id v3 = -[PKPendingProvisioningReceipt initForDatabase]( objc_alloc(&OBJC_CLASS___PKPendingProvisioningReceipt),  "initForDatabase");
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForObject");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_allProperties");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001CFCC0;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v6;
  id v10 = v3;
  id v17 = v10;
  id v11 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v9, v15);

  id v12 = v17;
  id v13 = v10;

  return v13;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"f"));
  id v4 = [v3 longLongValue];

  id v5 = objc_alloc(&OBJC_CLASS___PendingProvisioning);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  uint64_t v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v5, "initWithPersistentID:inDatabase:", v4, v6);

  -[PendingProvisioning deleteFromDatabase](v7, "deleteFromDatabase");
  v9.receiver = v2;
  v9.super_class = (Class)&OBJC_CLASS___PendingProvisioningReceipt;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v9, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  uint64_t v6 = PKPendingProvisioningReceiptTypeToString([v3 type]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

  [v3 createdAt];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v3 passUniqueID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"d");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v10,  1LL,  0LL));
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"e");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", 0LL, @"e");
  }

  return v4;
}

+ (id)_allProperties
{
  v3[0] = @"a";
  v3[1] = @"b";
  v3[2] = @"c";
  v3[3] = @"d";
  v3[4] = @"e";
  v3[5] = @"f";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  6LL));
}

+ (id)_propertySettersForObject
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10064B128;
  v4[1] = &stru_10064B148;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_10064B168;
  v4[3] = &stru_10064B188;
  v3[4] = @"e";
  v4[4] = &stru_10064B1A8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end