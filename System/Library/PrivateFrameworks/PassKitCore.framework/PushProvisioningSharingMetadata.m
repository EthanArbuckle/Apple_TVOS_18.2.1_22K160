@interface PushProvisioningSharingMetadata
+ (id)_predicateForProvisioningSharingIdentifier:(id)a3;
+ (id)_predicateForProvisioningSharingStatus:(unint64_t)a3;
+ (id)_propertySettersForProvisioningSharingMetadata;
+ (id)databaseTable;
+ (id)insertOrUpdateSharingMetadata:(id)a3 inDatabase:(id)a4;
+ (id)pushProvisioningSharingMetadataForProvisioningSharingIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)pushProvisioningSharingMetadataForStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)pushProvisioningSharingMetadataInDatabase:(id)a3;
+ (void)deleteAllProvisioningTargetsInDatabase:(id)a3;
+ (void)deleteSharingMetadata:(id)a3 inDatabase:(id)a4;
- (PushProvisioningSharingMetadata)initWithSharingMetadata:(id)a3 inDatabase:(id)a4;
- (id)sharingMetaData;
- (void)_updateProvisioningSharingMetadata:(id)a3;
@end

@implementation PushProvisioningSharingMetadata

- (PushProvisioningSharingMetadata)initWithSharingMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 sharingStatus], @"b");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sharingInstanceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"a");

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 provisioningCredentialHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"c");

  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 source], @"e");
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 credentialAuthorityIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"f");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 createdAt]);
  v13 = (void *)_SQLValueForDate(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"g");

  id v14 = [v7 securityOptions];
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", v14, @"h");
  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);

  return v15;
}

+ (id)pushProvisioningSharingMetadataInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100173698;
  id v14 = &unk_10063BCB0;
  id v15 = v4;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = v16;
  id v8 = v4;
  [v6 enumeratePersistentIDsUsingBlock:&v11];
  id v9 = -[NSMutableSet copy](v7, "copy", v11, v12, v13, v14);

  return v9;
}

+ (id)pushProvisioningSharingMetadataForStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProvisioningSharingStatus:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1001737EC;
  v16 = &unk_10063BCB0;
  id v17 = v6;
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = v18;
  id v10 = v6;
  [v8 enumeratePersistentIDsUsingBlock:&v13];
  id v11 = -[NSMutableSet copy](v9, "copy", v13, v14, v15, v16);

  return v11;
}

+ (id)pushProvisioningSharingMetadataForProvisioningSharingIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProvisioningSharingIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateSharingMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_1001739D0;
  v21 = sub_1001739E0;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001739E8;
  v12[3] = &unk_1006477E8;
  id v15 = &v17;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  sub_1002CCC5C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ (void)deleteSharingMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100173B34;
  v9[3] = &unk_100647810;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_1002CCC5C((uint64_t)v7, v9);
}

+ (void)deleteAllProvisioningTargetsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

- (void)_updateProvisioningSharingMetadata:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v4 sharingStatus], @"b");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sharingInstanceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 provisioningCredentialHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = [v4 source];
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", v7, @"e");
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
}

- (id)sharingMetaData
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPushProvisioningSharingMetadata);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PushProvisioningSharingMetadata _propertySettersForProvisioningSharingMetadata]( &OBJC_CLASS___PushProvisioningSharingMetadata,  "_propertySettersForProvisioningSharingMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100173DE4;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForProvisioningSharingIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForProvisioningSharingStatus:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"rincon";
}

+ (id)_propertySettersForProvisioningSharingMetadata
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100647850;
  v4[1] = &stru_100647870;
  v3[2] = @"c";
  v3[3] = @"e";
  v4[2] = &stru_100647890;
  v4[3] = &stru_1006478B0;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_1006478D0;
  v4[5] = &stru_1006478F0;
  v3[6] = @"h";
  v4[6] = &stru_100647910;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end