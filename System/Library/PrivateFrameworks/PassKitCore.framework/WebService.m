@interface WebService
+ (id)_insertionDictionaryWithPassType:(id)a3 serviceURL:(id)a4;
+ (id)_predicateForPassType:(id)a3;
+ (id)_predicateForPassType:(id)a3 serviceURL:(id)a4;
+ (id)_propertySettersForWebService;
+ (id)_updateDictionaryWithWebService:(id)a3;
+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serviceURL:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertWebServiceWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5;
+ (id)webServicesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)webServicesInDatabase:(id)a3 withPassType:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (WebService)initWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5;
- (id)lastDeletionDate;
- (id)lastUpdatedTag;
- (id)tagLastUpdateDate;
- (id)webService;
- (void)updateWithLastDeletionDate:(id)a3;
- (void)updateWithLastUpdatedTag:(id)a3;
- (void)updateWithWebService:(id)a3;
@end

@implementation WebService

+ (id)databaseTable
{
  return @"web_service";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PassType, v4) == a3) {
    return @"pass_type_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"pass_type.identifier"] & 1) != 0
    || [v6 isEqualToString:@"pass_type.team_identifier"])
  {
    [v5 addObject:@"JOIN pass_type ON pass_type.pid = web_service.pass_type_pid"];
  }
}

+ (id)_insertionDictionaryWithPassType:(id)a3 serviceURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = [v6 persistentID];

  [v7 setLongLong:v8 forKey:@"pass_type_pid"];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);

  [v7 setObjectOrNull:v9 forKey:@"service_url"];
  return v7;
}

+ (id)_updateDictionaryWithWebService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 pushToken]);
  [v4 setObjectOrNull:v5 forKey:@"push_token"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);
  [v4 setObjectOrNull:v6 forKey:@"device_identifier"];

  return v4;
}

- (WebService)initWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[WebService _insertionDictionaryWithPassType:serviceURL:]( &OBJC_CLASS___WebService,  "_insertionDictionaryWithPassType:serviceURL:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)insertWebServiceWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPassType:v10 serviceURL:v9 inDatabase:v8];

  return v11;
}

- (void)updateWithWebService:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[WebService _updateDictionaryWithWebService:]( &OBJC_CLASS___WebService,  "_updateDictionaryWithWebService:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

- (void)updateWithLastDeletionDate:(id)a3
{
}

- (void)updateWithLastUpdatedTag:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"tag_last_update_date");
}

+ (id)webServicesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForWebService]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v6]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001CDA1C;
  v17[3] = &unk_100639BF0;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)webServicesInDatabase:(id)a3 withPassType:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassType:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 webServicesInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

- (id)webService
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WebService _propertySettersForWebService](&OBJC_CLASS___WebService, "_propertySettersForWebService"));
  id v4 = objc_alloc_init(&OBJC_CLASS___PDWebService);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001CDBDC;
  v11[3] = &unk_100639EE8;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)lastDeletionDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_deletion_date"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)lastUpdatedTag
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_updated_tag");
}

- (id)tagLastUpdateDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"tag_last_update_date"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

+ (id)_predicateForPassType:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_type_pid",  v3));

  return v4;
}

+ (id)_predicateForPassType:(id)a3 serviceURL:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassType:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"service_url",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v7, v9, 0LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
  return v11;
}

+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serviceURL:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassType:a4 serviceURL:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)_propertySettersForWebService
{
  v3[0] = @"pass_type.identifier";
  v3[1] = @"pass_type.team_identifier";
  v4[0] = &stru_10064AFB8;
  v4[1] = &stru_10064AFD8;
  v3[2] = @"service_url";
  v3[3] = @"push_token";
  v4[2] = &stru_10064AFF8;
  v4[3] = &stru_10064B018;
  v3[4] = @"device_identifier";
  v4[4] = &stru_10064B038;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end