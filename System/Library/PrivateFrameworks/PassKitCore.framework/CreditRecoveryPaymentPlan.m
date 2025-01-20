@interface CreditRecoveryPaymentPlan
+ (id)_insertPaymentPlan:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_propertySettersForCreditRecoveryPaymentPlan;
+ (id)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)propertyValuesForPaymentPlan:(id)a3 accountIdentifier:(id)a4;
+ (id)replaceCreditRecoveryPaymentPlans:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (id)creditRecoveryPaymentPlan;
- (void)_updateWithPaymentPlan:(id)a3 accountIdentifier:(id)a4;
@end

@implementation CreditRecoveryPaymentPlan

+ (id)databaseTable
{
  return @"credit_recovery_payment_plan";
}

+ (id)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21 = @"ROWID";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1000DCF90;
  v18 = &unk_100639E18;
  id v19 = v6;
  v20 = v9;
  v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = -[NSMutableArray copy](v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (void)deleteCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)replaceCreditRecoveryPaymentPlans:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_1000DD16C;
  v17 = &unk_10063E468;
  id v18 = a4;
  id v19 = a5;
  id v20 = v7;
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = v21;
  id v9 = v7;
  id v10 = v19;
  id v11 = v18;
  sub_1002CCC5C((uint64_t)v10, &v14);
  id v12 = -[NSMutableArray copy](v8, "copy", v14, v15, v16, v17);

  return v12;
}

- (void)_updateWithPaymentPlan:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "propertyValuesForPaymentPlan:accountIdentifier:", v7, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);
}

+ (id)_insertPaymentPlan:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 propertyValuesForPaymentPlan:v10 accountIdentifier:v9]);

  id v13 = [v11 initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

+ (id)propertyValuesForPaymentPlan:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v5, @"account_identifier");

  -[NSMutableDictionary setBool:forKey:](v7, "setBool:forKey:", [v6 enrolled], @"enrolled");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v8, @"identifier");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v9, @"display_name");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 enrollmentDate]);
  id v11 = (void *)_SQLValueForDate(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v11, @"enrollment_date");

  return v7;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_identifier",  a3);
}

+ (id)_propertySettersForCreditRecoveryPaymentPlan
{
  v3[0] = @"enrolled";
  v3[1] = @"identifier";
  v4[0] = &stru_100642240;
  v4[1] = &stru_100642260;
  v3[2] = @"display_name";
  v3[3] = @"enrollment_date";
  v4[2] = &stru_100642280;
  v4[3] = &stru_1006422A0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

- (id)creditRecoveryPaymentPlan
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditRecoveryPaymentPlan);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditRecoveryPaymentPlan");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000DD708;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  uint64_t v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

@end