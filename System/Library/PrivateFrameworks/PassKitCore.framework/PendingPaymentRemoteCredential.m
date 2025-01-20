@interface PendingPaymentRemoteCredential
+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3;
+ (id)_properties;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5;
- (PendingPaymentRemoteCredential)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
@end

@implementation PendingPaymentRemoteCredential

- (PendingPaymentRemoteCredential)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"base_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 sanitizedPrimaryAccountNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"a");

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 credentialType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"b");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 cardIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"c");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 cardType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"d");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 ownershipToken]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v16, @"e");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 transferableFromDeviceSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v17, @"f");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 transferableFromDeviceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v18, @"g");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 passURL]);
  v20 = (void *)_SQLValueForURL(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v20, @"i");

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsSuperEasyProvisioning]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v21, @"j");

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 couldSupportSuperEasyProvisioning]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v22, @"k");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 passTypeIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v23, @"l");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 passSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v24, @"m");

  v25 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v25;
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
    v22 = sub_1002FBCD8;
    v23 = sub_1002FBCE8;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002FBCF0;
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
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PendingPaymentRemoteCredential,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v9,  0LL,  0LL,  1LL));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002FBE48;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PendingPaymentRemoteCredential,  "queryWithDatabase:predicate:",  v6,  v8));

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
  return @"pending_provisioning_remote_credential";
}

+ (id)_properties
{
  v3[0] = @"a";
  v3[1] = @"b";
  v3[2] = @"c";
  v3[3] = @"d";
  v3[4] = @"e";
  v3[5] = @"f";
  v3[6] = @"g";
  v3[7] = @"i";
  v3[8] = @"j";
  v3[9] = @"k";
  v3[10] = @"l";
  v3[11] = @"m";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  12LL));
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100655878;
  v4[1] = &stru_100655898;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_1006558B8;
  v4[3] = &stru_1006558D8;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_1006558F8;
  v4[5] = &stru_100655918;
  v3[6] = @"g";
  v3[7] = @"i";
  v4[6] = &stru_100655938;
  v4[7] = &stru_100655958;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_100655978;
  v4[9] = &stru_100655998;
  v3[10] = @"l";
  v3[11] = @"m";
  v4[10] = &stru_1006559B8;
  v4[11] = &stru_1006559D8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
}

@end