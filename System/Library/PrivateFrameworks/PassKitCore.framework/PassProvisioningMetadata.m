@interface PassProvisioningMetadata
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForObject;
+ (id)_propertyValuesFor:(id)a3;
+ (id)_provisioningMetadatasWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)provisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteProvisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateProvisioningMetadata:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (PassProvisioningMetadata)initWithObject:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
- (id)provisioningMetadata;
- (void)updateWithObject:(id)a3;
@end

@implementation PassProvisioningMetadata

- (PassProvisioningMetadata)initWithObject:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesFor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  [v12 setUnsignedLongLong:a4 forKey:@"a"];
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);

  return v13;
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
  return @"pass_provisioning_metadata";
}

+ (id)provisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _provisioningMetadatasWithQuery:v8 inDatabase:v6]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  return v10;
}

+ (id)_provisioningMetadatasWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForObject]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001CF240;
  v13[3] = &unk_10064B060;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  v15 = v9;
  id v10 = v6;
  [v5 enumerateProperties:v8 usingBlock:v13];

  if (-[NSMutableArray count](v9, "count")) {
    id v11 = -[NSMutableArray copy](v9, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (void)insertOrUpdateProvisioningMetadata:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v10 = (PassProvisioningMetadata *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);
  if (v10)
  {
    id v11 = v10;
    -[PassProvisioningMetadata updateWithObject:](v10, "updateWithObject:", v12);
  }

  else
  {
    id v11 = -[PassProvisioningMetadata initWithObject:passPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassProvisioningMetadata),  "initWithObject:passPID:inDatabase:",  v12,  a4,  v8);
  }
}

+ (void)deleteProvisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (id)provisioningMetadata
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassProvisioningMetadata);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForObject");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001CF4BC;
  v13[3] = &unk_100638EF0;
  void v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = PKPassProvisioningMetadataSourceDeviceTypeToString([v3 sourceDeviceType]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedSourceDeviceDescription]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  return v4;
}

+ (id)_propertySettersForObject
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064B0A0;
  v4[1] = &stru_10064B0C0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end