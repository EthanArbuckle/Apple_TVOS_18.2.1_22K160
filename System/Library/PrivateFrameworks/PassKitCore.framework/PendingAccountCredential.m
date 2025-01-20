@interface PendingAccountCredential
+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3;
+ (id)_properties;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5;
- (PendingAccountCredential)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
@end

@implementation PendingAccountCredential

- (PendingAccountCredential)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"base_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"a");

  uint64_t v13 = PKFeatureIdentifierToString([v10 feature]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"b");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 sharingInstanceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"c");

  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v16;
}

+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0LL;
  if (v8 && v9)
  {
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    v22 = sub_100044EB8;
    v23 = sub_100044EC8;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100044ED0;
    v13[3] = &unk_10063C260;
    v17 = &v19;
    id v18 = a1;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    sub_1002CCC5C((uint64_t)v16, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  if (v12)
  {
    id v8 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBasePendingProvisioningPID:a4]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PendingAccountCredential,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v9,  0LL,  0LL,  1LL));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100045028;
    v13[3] = &unk_10063C288;
    id v15 = a1;
    id v14 = v12;
    [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBasePendingProvisioningPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PendingAccountCredential,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"base_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"pending_provisioning_account_credential";
}

+ (id)_properties
{
  v3[0] = @"a";
  v3[1] = @"b";
  v3[2] = @"c";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10063C2C8;
  v4[1] = &stru_10063C2E8;
  v3[2] = @"c";
  v4[2] = &stru_10063C308;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end