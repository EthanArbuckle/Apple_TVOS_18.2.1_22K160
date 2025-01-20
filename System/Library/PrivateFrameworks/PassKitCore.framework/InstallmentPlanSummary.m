@interface InstallmentPlanSummary
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanSummary:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)summaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteSummaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (InstallmentPlanSummary)initWithInstallmentPlanSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)summary;
- (void)updateWithSummary:(id)a3;
@end

@implementation InstallmentPlanSummary

+ (id)databaseTable
{
  return @"gojiberry";
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

- (InstallmentPlanSummary)initWithInstallmentPlanSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlanSummary:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  v15 = v14;
  -[SQLiteEntity setValue:forProperty:](v15, "setValue:forProperty:", v9, @"a");

  return v15;
}

+ (void)deleteSummaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)insertOrUpdateSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:v9]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  if (v12) {
    [v12 updateWithSummary:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithInstallmentPlanSummary:v8 forInstallmentPlanPID:v9 inDatabase:v10];
  }

  return v12;
}

- (void)updateWithSummary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForInstallmentPlanSummary:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)summaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
  return v9;
}

- (id)summary
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKInstallmentPlanSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10022F968;
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

+ (id)_propertyValuesForInstallmentPlanSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 originalEndDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 currentEndDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"d");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"e");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 minimumDue]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"f");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 minimumDueDate]);
  v16 = (void *)_SQLValueForDate(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"g");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 interestCharged]);
  uint64_t v18 = PKCurrencyDecimalToStorageNumber(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"h");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentsToDateAmount]);
  uint64_t v21 = PKCurrencyDecimalToStorageNumber(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"i");

  id v23 = -[NSMutableDictionary copy](v4, "copy");
  return v23;
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064DDD8;
  v4[1] = &stru_10064DDF8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10064DE18;
  v4[3] = &stru_10064DE38;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10064DE58;
  v4[5] = &stru_10064DE78;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_10064DE98;
  v4[7] = &stru_10064DEB8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

@end