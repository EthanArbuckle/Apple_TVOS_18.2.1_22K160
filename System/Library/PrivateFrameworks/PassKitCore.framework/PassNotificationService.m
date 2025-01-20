@interface PassNotificationService
+ (id)_predicateForNotificationServicePID:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassNotificationServiceWithNotificationService:(id)a3 inDatabase:(id)a4;
+ (id)queryWithDatabase:(id)a3 transactionServicePID:(unint64_t)a4;
- (PassNotificationService)initWithNotificationServicePID:(unint64_t)a3 inDatabase:(id)a4;
- (id)lastUpdatedDate;
- (id)lastUpdatedTag;
- (id)lastUpdatedTagDate;
- (id)notificationService;
- (unint64_t)registrationStatus;
- (void)updateWithLastUpdatedDate:(id)a3;
- (void)updateWithLastUpdatedTag:(id)a3;
- (void)updateWithNotificationService:(id)a3;
- (void)updateWithRegistrationStatus:(unint64_t)a3;
@end

@implementation PassNotificationService

- (PassNotificationService)initWithNotificationServicePID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v7 setObject:v8 forKey:@"notification_service_pid"];

  [v7 setInteger:2 forKey:@"registration_status"];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PassNotificationService;
  v9 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v11, "initWithPropertyValues:inDatabase:", v7, v6);

  return v9;
}

+ (id)databaseTable
{
  return @"pass_notification_service";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___NotificationService, a2) == a3) {
    return @"notification_service_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, v4) == a3) {
    return @"pid";
  }
  return 0LL;
}

+ (id)insertPassNotificationServiceWithNotificationService:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = [v7 persistentID];

  id v10 = [v8 initWithNotificationServicePID:v9 inDatabase:v6];
  return v10;
}

+ (id)queryWithDatabase:(id)a3 transactionServicePID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationServicePID:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  return v9;
}

- (id)notificationService
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"notification_service_pid"));
  if (v3)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NotificationService);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (unint64_t)registrationStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"registration_status"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)lastUpdatedDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_updated_date"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)lastUpdatedTag
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_updated_tag");
}

- (id)lastUpdatedTagDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_updated_tag_date"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (void)updateWithRegistrationStatus:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"registration_status");
}

- (void)updateWithNotificationService:(id)a3
{
  id v4 = (id)_SQLValueForEntity(a3, a2);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"notification_service_pid");
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
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v6) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  else {
    id v5 = 0LL;
  }
  [v4 setObjectOrNull:v6 forKey:@"last_updated_tag"];
  [v4 setObjectOrNull:v5 forKey:@"last_updated_tag_date"];
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)_predicateForNotificationServicePID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"notification_service_pid",  a3);
}

@end