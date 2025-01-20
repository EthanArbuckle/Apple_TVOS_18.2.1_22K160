@interface DeviceEnvironment
+ (id)_predicateForDeviceEnvironmentWithClientIdentifier:(id)a3;
+ (id)_propertySettersForDeviceEnvironment;
+ (id)databaseTable;
+ (id)environmentForClient:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateEnvironment:(id)a3 forClient:(int64_t)a4 inDatabase:(id)a5;
- (DeviceEnvironment)initWithClientIdentifier:(id)a3 countryCode:(id)a4 deviceLanguage:(id)a5 database:(id)a6;
@end

@implementation DeviceEnvironment

+ (id)databaseTable
{
  return @"device_environment";
}

+ (id)environmentForClient:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v24 = 0LL;
  id v7 = 0LL;
  if (PKDeviceEnvironmentClientToString(a3, &v24))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForDeviceEnvironment]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDeviceEnvironmentWithClientIdentifier:v24]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DeviceEnvironment,  "queryWithDatabase:predicate:",  v6,  v9));
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_1002EB5C0;
    v22 = sub_1002EB5D0;
    id v23 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002EB5D8;
    v14[3] = &unk_10063FD80;
    v16 = &v18;
    id v17 = a1;
    id v12 = v8;
    id v15 = v12;
    [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];

    id v7 = (id)v19[5];
    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

+ (id)insertOrUpdateEnvironment:(id)a3 forClient:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1002EB5C0;
  id v23 = sub_1002EB5D0;
  id v24 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002EB780;
  v13[3] = &unk_100645878;
  int64_t v17 = a4;
  id v18 = a1;
  v16 = &v19;
  id v9 = a5;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  sub_1002CCC5C((uint64_t)v9, v13);
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (DeviceEnvironment)initWithClientIdentifier:(id)a3 countryCode:(id)a4 deviceLanguage:(id)a5 database:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v13,  @"client_identifier");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v12, @"country_code");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v11,  @"device_language");

  id v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);
  return v15;
}

+ (id)_propertySettersForDeviceEnvironment
{
  v3[0] = @"country_code";
  v3[1] = @"device_language";
  v4[0] = &stru_1006549F0;
  v4[1] = &stru_100654A10;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

+ (id)_predicateForDeviceEnvironmentWithClientIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_identifier",  a3);
}

@end