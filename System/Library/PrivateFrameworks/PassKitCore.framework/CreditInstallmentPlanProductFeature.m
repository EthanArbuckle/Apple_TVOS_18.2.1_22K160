@interface CreditInstallmentPlanProductFeature
+ (id)_predicateForProductPID:(id)a3;
+ (id)_propertyValuesForFeature:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featuresForProductPID:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateFeatures:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5;
+ (void)deleteFeatureForProductPID:(id)a3 inDatabase:(id)a4;
- (CreditInstallmentPlanProductFeature)initWithFeature:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5;
- (id)feature;
- (void)updateWithFeature:(id)a3;
@end

@implementation CreditInstallmentPlanProductFeature

+ (id)databaseTable
{
  return @"squash";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditInstallmentPlanProduct, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditInstallmentPlanProductFeature)initWithFeature:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForFeature:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  v15 = v14;
  -[SQLiteEntity setValue:forProperty:](v15, "setValue:forProperty:", v9, @"a");

  return v15;
}

+ (void)deleteFeatureForProductPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertOrUpdateFeatures:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 deleteFeatureForProductPID:v9 inDatabase:v10];
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithFeature:forProductPID:inDatabase:", v17, v9, v10, (void)v22);
        if (v19) {
          -[NSMutableSet addObject:](v11, "addObject:", v19);
        }

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

  if (-[NSMutableSet count](v11, "count")) {
    id v20 = -[NSMutableSet copy](v11, "copy");
  }
  else {
    id v20 = 0LL;
  }

  return v20;
}

- (void)updateWithFeature:(id)a3
{
}

+ (id)featuresForProductPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"b";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003A29E4;
  v14[3] = &unk_10063C0D0;
  uint64_t v11 = v9;
  uint64_t v15 = v11;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v14];
  if (-[NSMutableSet count](v11, "count")) {
    id v12 = -[NSMutableSet copy](v11, "copy");
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (id)feature
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b");
}

+ (id)_predicateForProductPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertyValuesForFeature:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v3, @"b");

  id v5 = -[NSMutableDictionary copy](v4, "copy");
  return v5;
}

@end