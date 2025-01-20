@interface InstallmentPlanMerchant
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanMerchant:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)merchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteMerchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (InstallmentPlanMerchant)initWithInstallmentPlanMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)merchant;
- (void)updateWithMerchant:(id)a3;
@end

@implementation InstallmentPlanMerchant

+ (id)databaseTable
{
  return @"acorn";
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

- (InstallmentPlanMerchant)initWithInstallmentPlanMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlanMerchant:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  v15 = v14;
  -[SQLiteEntity setValue:forProperty:](v15, "setValue:forProperty:", v9, @"a");

  return v15;
}

+ (void)deleteMerchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)insertOrUpdateMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:v9]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  if (v12) {
    [v12 updateWithMerchant:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithInstallmentPlanMerchant:v8 forInstallmentPlanPID:v9 inDatabase:v10];
  }

  return v12;
}

- (void)updateWithMerchant:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForInstallmentPlanMerchant:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)merchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 merchant]);
  return v9;
}

- (id)merchant
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKInstallmentPlanMerchant);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10020BD48;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  uint64_t v11 = v8;

  return v11;
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertyValuesForInstallmentPlanMerchant:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 categoryCode], @"d");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 city]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"e");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 state]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"f");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 postalCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"g");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 country]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"h");

  id v11 = -[NSMutableDictionary copy](v4, "copy");
  return v11;
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064D2F8;
  v4[1] = &stru_10064D318;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10064D338;
  v4[3] = &stru_10064D358;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10064D378;
  v4[5] = &stru_10064D398;
  v3[6] = @"h";
  v4[6] = &stru_10064D3B8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end