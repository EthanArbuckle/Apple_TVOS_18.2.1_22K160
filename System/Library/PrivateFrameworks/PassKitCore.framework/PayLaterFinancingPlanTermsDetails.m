@interface PayLaterFinancingPlanTermsDetails
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingPlanTermsDetails;
+ (id)_propertyValuesForPayLaterTermsDetails:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanTermsDetails)initWithPayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)termsDetails;
- (void)updateWithPayLaterFinancingPlanTermsDetails:(id)a3;
@end

@implementation PayLaterFinancingPlanTermsDetails

+ (id)databaseTable
{
  return @"parsnip";
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

- (PayLaterFinancingPlanTermsDetails)initWithPayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterTermsDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (id)insertOrUpdatePayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWithPayLaterFinancingPlanTermsDetails:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlanTermsDetails:v8 forFinancingPlanPID:a4 inDatabase:v9];
  }

  return v11;
}

- (void)updateWithPayLaterFinancingPlanTermsDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterTermsDetails:", v4);
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

+ (void)deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PayLaterFinancingPlanTermsDetails;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

- (id)termsDetails
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterFinancingPlanTermsDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterFinancingPlanTermsDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003B229C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForPayLaterTermsDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentAgreementIdentifier]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");
  return v4;
}

+ (id)_propertySettersForPayLaterFinancingPlanTermsDetails
{
  id v3 = @"b";
  uint64_t v4 = &stru_10065B2C0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end