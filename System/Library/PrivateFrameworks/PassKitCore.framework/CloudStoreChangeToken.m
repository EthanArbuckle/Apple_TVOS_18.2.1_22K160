@interface CloudStoreChangeToken
+ (id)_predicateForZoneName:(id)a3;
+ (id)_propertyValuesForChangeToken:(id)a3 inZoneWithName:(id)a4;
+ (id)changeTokenForZoneWithName:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)saveChangeToken:(id)a3 forZoneWithName:(id)a4 inDatabase:(id)a5;
- (void)updateWithChangeToken:(id)a3 forZoneName:(id)a4;
@end

@implementation CloudStoreChangeToken

+ (id)databaseTable
{
  return @"cloud_store_token";
}

+ (void)saveChangeToken:(id)a3 forZoneWithName:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Deleting token for zone %{public}@",  (uint8_t *)&v20,  0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForZoneName:v9]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v12]);
    [v18 deleteFromDatabase];
    goto LABEL_12;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForZoneName:v9]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  uint64_t v13 = PKLogFacilityTypeGetObject(9LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v15)
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Inserting new token %@ for zone %{public}@",  (uint8_t *)&v20,  0x16u);
    }

    id v19 = objc_alloc((Class)a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertyValuesForChangeToken:v8 inZoneWithName:v9]);

LABEL_12:
    goto LABEL_13;
  }

  if (v15)
  {
    int v20 = 138412546;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Updating token %@ for zone %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  [v12 updateWithChangeToken:v8 forZoneName:v9];
LABEL_13:
}

+ (id)changeTokenForZoneWithName:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForZoneName:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  if (v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"token_data"]);
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (void)updateWithChangeToken:(id)a3 forZoneName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForChangeToken:inZoneWithName:", v7, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);
}

+ (id)_propertyValuesForChangeToken:(id)a3 inZoneWithName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v6, @"token_data");

  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v5, @"zone_name");
  id v8 = -[NSMutableDictionary copy](v7, "copy");

  return v8;
}

+ (id)_predicateForZoneName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"zone_name",  a3);
}

@end