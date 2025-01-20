@interface CreditInstallmentPlanProduct
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanProduct:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)productForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteProductForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (CreditInstallmentPlanProduct)initWithInstallmentPlanProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)product;
- (void)updateWithProduct:(id)a3;
@end

@implementation CreditInstallmentPlanProduct

+ (id)databaseTable
{
  return @"peanut";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditInstallmentPlan, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditInstallmentPlanProduct)initWithInstallmentPlanProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlanProduct:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  -[SQLiteEntity setValue:forProperty:](v14, "setValue:forProperty:", v9, @"a");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v14, "persistentID")));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 features]);

  id v17 =  +[CreditInstallmentPlanProductFeature insertOrUpdateFeatures:forProductPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProductFeature,  "insertOrUpdateFeatures:forProductPID:inDatabase:",  v16,  v15,  v8);
  return v14;
}

+ (void)deleteProductForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[CreditInstallmentPlanProductFeature deleteFeatureForProductPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProductFeature,  "deleteFeatureForProductPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___CreditInstallmentPlanProduct;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)insertOrUpdateProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:v9]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  if (v12) {
    [v12 updateWithProduct:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithInstallmentPlanProduct:v8 forInstallmentPlanPID:v9 inDatabase:v10];
  }

  return v12;
}

- (void)updateWithProduct:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForInstallmentPlanProduct:", v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 features]);

  id v10 =  +[CreditInstallmentPlanProductFeature insertOrUpdateFeatures:forProductPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProductFeature,  "insertOrUpdateFeatures:forProductPID:inDatabase:",  v9,  v7,  v8);
}

+ (id)productForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 product]);
  return v9;
}

- (id)product
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlanProduct);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003A3030;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v6;
  id v8 = v3;
  id v17 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v15);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CreditInstallmentPlanProductFeature featuresForProductPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProductFeature,  "featuresForProductPID:inDatabase:",  v10,  v11));
  -[PKCreditInstallmentPlanProduct setFeatures:](v8, "setFeatures:", v12);
  v13 = v8;

  return v13;
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertyValuesForInstallmentPlanProduct:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 capacity]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 color]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"e");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 isUpgradeEligible], @"f");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 warrantyYears], @"g");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 serialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"i");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 iconURLs]);
  id v11 = _SQLValueForImageURLs(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"l");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 splashImageURLs]);
  id v14 = _SQLValueForImageURLs(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"m");

  id v16 = -[NSMutableDictionary copy](v4, "copy");
  return v16;
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065A580;
  v4[1] = &stru_10065A5A0;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10065A5C0;
  v4[3] = &stru_10065A5E0;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10065A600;
  v4[5] = &stru_10065A620;
  v3[6] = @"i";
  v3[7] = @"l";
  v4[6] = &stru_10065A640;
  v4[7] = &stru_10065A660;
  v3[8] = @"m";
  v4[8] = &stru_10065A680;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
}

@end