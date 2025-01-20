@interface FeatureApplicationDeclineDetails
+ (id)_predicateForApplicationPID:(int64_t)a3;
+ (id)_propertySettersForFeatureApplicationDeclineDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
- (FeatureApplicationDeclineDetails)initWithFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)featureApplicationDeclineDetails;
- (void)updateWithFeatureApplicationDeclineDetails:(id)a3;
@end

@implementation FeatureApplicationDeclineDetails

+ (id)databaseTable
{
  return @"prune";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return @"a";
}

- (FeatureApplicationDeclineDetails)initWithFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"a");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 declinedTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v12, @"b");

  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  v14 = v13;

  return v14;
}

+ (id)insertFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithFeatureApplicationDeclineDetails:v9 forApplicationPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteFeatureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)featureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 featureApplicationDeclineDetails]);
  return v9;
}

+ (void)updateFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithFeatureApplicationDeclineDetails:v12];
  }
  else {
    id v11 =  +[FeatureApplicationDeclineDetails insertFeatureApplicationDeclineDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationDeclineDetails,  "insertFeatureApplicationDeclineDetails:forApplicationPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithFeatureApplicationDeclineDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 declinedTermsIdentifier]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v5, @"b");
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

+ (id)_predicateForApplicationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForFeatureApplicationDeclineDetails
{
  v3 = @"b";
  id v4 = &stru_10065C5A0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)featureApplicationDeclineDetails
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKFeatureApplicationDeclineDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForFeatureApplicationDeclineDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003D8A90;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

@end