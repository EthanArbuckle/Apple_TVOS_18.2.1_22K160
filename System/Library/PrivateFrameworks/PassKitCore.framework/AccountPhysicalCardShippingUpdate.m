@interface AccountPhysicalCardShippingUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForPhysicalCardIdentifier:(id)a3;
+ (id)_propertySettersForAccountPhysicalCardShippingUpdate;
+ (id)_shippingUpdatesWithQuery:(id)a3;
+ (id)databaseTable;
+ (id)insertPhysicalCardShippingUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)physicalCardShippingUpdatesForPhysicalCardWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)physicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePhysicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)physicalCardShippingUpdate;
@end

@implementation AccountPhysicalCardShippingUpdate

+ (id)physicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _shippingUpdatesWithQuery:v8]);
  return v9;
}

+ (id)physicalCardShippingUpdatesForPhysicalCardWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _shippingUpdatesWithQuery:v8]);
  return v9;
}

+ (id)insertPhysicalCardShippingUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 physicalCardIdentifier]);
  [v10 setObjectOrNull:v11 forKey:@"b"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 shippingStatus]));
  [v10 setObject:v12 forKey:@"c"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDeliveryExceptionReason]);
  [v10 setObjectOrNull:v13 forKey:@"d"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 trackingNumber]);
  [v10 setObjectOrNull:v14 forKey:@"e"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 shippingCompany]);
  [v10 setObjectOrNull:v15 forKey:@"f"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 timestamp]);
  v17 = (void *)_SQLValueForDate(v16);
  [v10 setObjectOrNull:v17 forKey:@"g"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 estimatedDeliveryDate]);
  if (v18)
  {
    id v19 = [v18 day];
    id v20 = [v18 month];
    id v21 = [v18 year];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
    [v10 setObjectOrNull:v22 forKey:@"i"];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20));
    [v10 setObjectOrNull:v23 forKey:@"j"];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v21));
    [v10 setObjectOrNull:v24 forKey:@"k"];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v25 forKey:@"a"];

  id v26 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v26;
}

- (id)physicalCardShippingUpdate
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPhysicalCardShippingUpdate);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPhysicalCardShippingUpdate _propertySettersForAccountPhysicalCardShippingUpdate]( &OBJC_CLASS___AccountPhysicalCardShippingUpdate,  "_propertySettersForAccountPhysicalCardShippingUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_1002949E0;
  id v21 = &unk_100639EE8;
  id v6 = v4;
  id v22 = v6;
  v7 = v3;
  v23 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v18);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"i", v18, v19, v20, v21));
  id v9 = [v8 unsignedIntegerValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"j"));
  id v11 = [v10 unsignedIntegerValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"k"));
  id v13 = [v12 unsignedIntegerValue];

  if (v9 && v11 && v13)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setDay:](v14, "setDay:", v9);
    -[NSDateComponents setMonth:](v14, "setMonth:", v11);
    -[NSDateComponents setYear:](v14, "setYear:", v13);
    -[PKAccountPhysicalCardShippingUpdate setEstimatedDeliveryDate:](v7, "setEstimatedDeliveryDate:", v14);
  }

  v15 = v23;
  v16 = v7;

  return v16;
}

+ (void)deletePhysicalCardShippingUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"passionfruits";
}

+ (id)_shippingUpdatesWithQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"pid";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100294BA4;
  id v13 = &unk_100639E18;
  id v14 = v3;
  id v6 = v4;
  v15 = v6;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  if (-[NSMutableSet count](v6, "count", v10, v11, v12, v13)) {
    id v8 = -[NSMutableSet copy](v6, "copy");
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPhysicalCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_propertySettersForAccountPhysicalCardShippingUpdate
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100651CE8;
  v4[1] = &stru_100651D08;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100651D28;
  v4[3] = &stru_100651D48;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100651D68;
  v4[5] = &stru_100651D88;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end