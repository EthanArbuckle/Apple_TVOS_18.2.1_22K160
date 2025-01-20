@interface PayLaterFinancingPlanScheduleSummary
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingPlanScheduleSummary;
+ (id)_propertyValuesForPayLaterScheduleSummary:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanScheduleSummary)initWithPayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)scheduleSummary;
- (void)updateWithPayLaterFinancingPlanScheduleSummary:(id)a3;
@end

@implementation PayLaterFinancingPlanScheduleSummary

+ (id)databaseTable
{
  return @"asparagus";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlan, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterFinancingPlanScheduleSummary)initWithPayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterScheduleSummary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (id)insertOrUpdatePayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWithPayLaterFinancingPlanScheduleSummary:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlanScheduleSummary:v8 forFinancingPlanPID:a4 inDatabase:v9];
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 payments]);
  id v13 =  +[PayLaterPayment insertOrUpdatePayLaterPayments:forScheduleSummaryPID:inDatabase:]( PayLaterPayment,  "insertOrUpdatePayLaterPayments:forScheduleSummaryPID:inDatabase:",  v12,  [v11 persistentID],  v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 installments]);
  id v15 =  +[PayLaterInstallment insertOrUpdatePayLaterInstallments:forScheduleSummaryPID:inDatabase:]( PayLaterInstallment,  "insertOrUpdatePayLaterInstallments:forScheduleSummaryPID:inDatabase:",  v14,  [v11 persistentID],  v9);

  return v11;
}

- (void)updateWithPayLaterFinancingPlanScheduleSummary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterScheduleSummary:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterInstallment deletePayLaterInstallmentsForScheduleSummaryPID:inDatabase:]( &OBJC_CLASS___PayLaterInstallment,  "deletePayLaterInstallmentsForScheduleSummaryPID:inDatabase:",  v3,  v4);

  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterPayment deletePayLaterPaymentsForScheduleSummaryPID:inDatabase:]( &OBJC_CLASS___PayLaterPayment,  "deletePayLaterPaymentsForScheduleSummaryPID:inDatabase:",  v5,  v6);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PayLaterFinancingPlanScheduleSummary;
  return -[SQLiteEntity deleteFromDatabase](&v8, "deleteFromDatabase");
}

- (id)scheduleSummary
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterFinancingPlanScheduleSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterFinancingPlanScheduleSummary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100065374;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  objc_super v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForPayLaterScheduleSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = [v3 scheduleSummaryReason];

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v5, @"b");
  return v4;
}

+ (id)_propertySettersForPayLaterFinancingPlanScheduleSummary
{
  id v3 = @"b";
  uint64_t v4 = &stru_10063D930;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end