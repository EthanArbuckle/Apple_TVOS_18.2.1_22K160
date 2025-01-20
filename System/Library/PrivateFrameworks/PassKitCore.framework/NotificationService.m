@interface NotificationService
+ (id)_notificationServicesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForNoRegistrationURL;
+ (id)_predicateForNotificationServicePID:(id)a3;
+ (id)_predicateForPushTopic:(id)a3;
+ (id)_predicateForRegistrationURL:(id)a3;
+ (id)_predicateForServiceType:(unint64_t)a3;
+ (id)_predicateForServiceURL:(id)a3;
+ (id)_propertySettersForPaymentTransaction;
+ (id)anyInDatabase:(id)a3 withPushTopic:(id)a4;
+ (id)anyInDatabase:(id)a3 withPushTopic:(id)a4 serviceType:(unint64_t)a5 serviceURL:(id)a6 registrationURL:(id)a7;
+ (id)anyInDatabase:(id)a3 withServiceURL:(id)a4 registrationURL:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertNotificationServiceWithPushTopic:(id)a3 serviceType:(unint64_t)a4 serviceURL:(id)a5 registrationURL:(id)a6 deviceIdentifier:(id)a7 inDatabase:(id)a8;
+ (id)notificationServicesInDatabase:(id)a3;
+ (id)notificationServicesInDatabase:(id)a3 withPushTopic:(id)a4;
+ (id)notificationServicesInDatabase:(id)a3 withPushTopic:(id)a4 serviceType:(unint64_t)a5 serviceURL:(id)a6 registrationURL:(id)a7;
- (NotificationService)initWithPushTopic:(id)a3 serviceType:(unint64_t)a4 serviceURL:(id)a5 registrationURL:(id)a6 deviceIdentifier:(id)a7 inDatabase:(id)a8;
- (id)notificationService;
- (void)updateWithAppLaunchToken:(id)a3;
- (void)updateWithAuthenticationToken:(id)a3;
- (void)updateWithLastUpdatedDate:(id)a3;
- (void)updateWithLastUpdatedTag:(id)a3;
- (void)updateWithNotificationService:(id)a3;
- (void)updateWithPushToken:(id)a3;
@end

@implementation NotificationService

- (NotificationService)initWithPushTopic:(id)a3 serviceType:(unint64_t)a4 serviceURL:(id)a5 registrationURL:(id)a6 deviceIdentifier:(id)a7 inDatabase:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v19 setObjectOrNull:v15 forKey:@"device_identifier"];

  [v19 setObjectOrNull:v18 forKey:@"push_topic"];
  [v19 setInteger:a4 forKey:@"service_type"];
  v20 = (void *)_SQLValueForURL(v17);

  [v19 setObjectOrNull:v20 forKey:@"service_url"];
  v21 = (void *)_SQLValueForURL(v16);

  [v19 setObjectOrNull:v21 forKey:@"registration_url"];
  v22 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v19, v14);

  return v22;
}

+ (id)databaseTable
{
  return @"notification_service";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PassNotificationService, a2) == a3) {
    return @"pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertNotificationServiceWithPushTopic:(id)a3 serviceType:(unint64_t)a4 serviceURL:(id)a5 registrationURL:(id)a6 deviceIdentifier:(id)a7 inDatabase:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithPushTopic:v18 serviceType:a4 serviceURL:v17 registrationURL:v16 deviceIdentifier:v15 inDatabase:v14];

  return v19;
}

+ (id)anyInDatabase:(id)a3 withPushTopic:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPushTopic:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withServiceURL:(id)a4 registrationURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForServiceURL:v9]);

  -[NSMutableArray addObject:](v11, "addObject:", v12);
  if (v8) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([a1 _predicateForRegistrationURL:v8]);
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([a1 _predicateForNoRegistrationURL]);
  }
  id v14 = (void *)v13;
  -[NSMutableArray addObject:](v11, "addObject:", v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v15]);

  return v16;
}

+ (id)anyInDatabase:(id)a3 withPushTopic:(id)a4 serviceType:(unint64_t)a5 serviceURL:(id)a6 registrationURL:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForServiceType:a5]);
  -[NSMutableArray addObject:](v16, "addObject:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPushTopic:v14]);
  -[NSMutableArray addObject:](v16, "addObject:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForServiceURL:v13]);
  -[NSMutableArray addObject:](v16, "addObject:", v19);

  if (v12) {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([a1 _predicateForRegistrationURL:v12]);
  }
  else {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([a1 _predicateForNoRegistrationURL]);
  }
  v21 = (void *)v20;
  -[NSMutableArray addObject:](v16, "addObject:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));
  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v15 predicate:v22]);

  return v23;
}

+ (id)notificationServicesInDatabase:(id)a3
{
  return [a1 _notificationServicesInDatabase:a3 matchingPredicate:0];
}

+ (id)notificationServicesInDatabase:(id)a3 withPushTopic:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPushTopic:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _notificationServicesInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)notificationServicesInDatabase:(id)a3 withPushTopic:(id)a4 serviceType:(unint64_t)a5 serviceURL:(id)a6 registrationURL:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForServiceType:a5]);
  -[NSMutableArray addObject:](v16, "addObject:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPushTopic:v14]);
  -[NSMutableArray addObject:](v16, "addObject:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForServiceURL:v13]);
  -[NSMutableArray addObject:](v16, "addObject:", v19);

  if (v12) {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([a1 _predicateForRegistrationURL:v12]);
  }
  else {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([a1 _predicateForNoRegistrationURL]);
  }
  v21 = (void *)v20;
  -[NSMutableArray addObject:](v16, "addObject:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));
  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _notificationServicesInDatabase:v15 matchingPredicate:v22]);

  return v23;
}

- (id)notificationService
{
  v3 = objc_alloc_init(&OBJC_CLASS___PDNotificationService);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NotificationService _propertySettersForPaymentTransaction]( &OBJC_CLASS___NotificationService,  "_propertySettersForPaymentTransaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010DA10;
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

- (void)updateWithPushToken:(id)a3
{
}

- (void)updateWithAuthenticationToken:(id)a3
{
}

- (void)updateWithAppLaunchToken:(id)a3
{
}

- (void)updateWithLastUpdatedDate:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObjectOrNull:v4 forKey:@"last_updated_date"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

- (void)updateWithLastUpdatedTag:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v6 setObjectOrNull:v4 forKey:@"last_updated_tag"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 setObjectOrNull:v5 forKey:@"last_updated_tag_date"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

- (void)updateWithNotificationService:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
  [v11 setObjectOrNull:v5 forKey:@"push_token"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
  [v11 setObjectOrNull:v6 forKey:@"authentication_token"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 appLaunchToken]);
  [v11 setObjectOrNull:v7 forKey:@"app_launch_token"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedDate]);
  [v11 setObjectOrNull:v8 forKey:@"last_updated_date"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedTag]);
  [v11 setObjectOrNull:v9 forKey:@"last_updated_tag"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedTagDate]);
  [v11 setObjectOrNull:v10 forKey:@"last_updated_tag_date"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
}

+ (id)_notificationServicesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransaction]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v6]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10010DDD0;
  v17[3] = &unk_100639BF0;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  id v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)_predicateForPushTopic:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"push_topic",  a3);
}

+ (id)_predicateForServiceType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"service_type",  v3));

  return v4;
}

+ (id)_predicateForServiceURL:(id)a3
{
  v3 = (void *)_SQLValueForURL(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"service_url",  v3));

  return v4;
}

+ (id)_predicateForRegistrationURL:(id)a3
{
  v3 = (void *)_SQLValueForURL(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"registration_url",  v3));

  return v4;
}

+ (id)_predicateForNoRegistrationURL
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"registration_url");
}

+ (id)_predicateForNotificationServicePID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_propertySettersForPaymentTransaction
{
  v3[0] = @"push_topic";
  v3[1] = @"push_token";
  v4[0] = &stru_1006449C8;
  v4[1] = &stru_1006449E8;
  v3[2] = @"service_type";
  v3[3] = @"service_url";
  v4[2] = &stru_100644A08;
  v4[3] = &stru_100644A28;
  v3[4] = @"registration_url";
  v3[5] = @"authentication_token";
  v4[4] = &stru_100644A48;
  v4[5] = &stru_100644A68;
  v3[6] = @"app_launch_token";
  v3[7] = @"device_identifier";
  v4[6] = &stru_100644A88;
  v4[7] = &stru_100644AA8;
  v3[8] = @"last_updated_date";
  v3[9] = @"last_updated_tag";
  v4[8] = &stru_100644AC8;
  v4[9] = &stru_100644AE8;
  v3[10] = @"last_updated_tag_date";
  v4[10] = &stru_100644B08;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
}

@end