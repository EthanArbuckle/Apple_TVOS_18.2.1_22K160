@interface PendingIdentityCredential
+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3;
+ (id)_properties;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5;
- (PendingIdentityCredential)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
@end

@implementation PendingIdentityCredential

- (PendingIdentityCredential)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v10, @"base_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 sharingInstanceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"a");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 cardConfigurationIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"b");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 provisioningCredentialIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"c");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"d");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 attestations]);
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v16,  1LL,  0LL));
    -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v17, @"e");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", 0LL, @"e");
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 passTypeIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v18, @"f");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 passSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v19, @"g");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 accountKeyIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v20, @"h");

  v21 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v9);
  return v21;
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
    v22 = sub_10030426C;
    v23 = sub_10030427C;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100304284;
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
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PendingIdentityCredential,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v9,  0LL,  0LL,  1LL));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1003043DC;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyInDatabase:predicate:]( &OBJC_CLASS___PendingIdentityCredential,  "anyInDatabase:predicate:",  v6,  v8));

  [v7 deleteFromDatabase];
}

+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"base_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"pending_provisioning_identity_credential";
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
  v3[7] = @"h";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  8LL));
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100655D18;
  v4[1] = &stru_100655D38;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100655D58;
  v4[3] = &stru_100655D78;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_100655D98;
  v4[5] = &stru_100655DB8;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_100655DD8;
  v4[7] = &stru_100655DF8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

@end