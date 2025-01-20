@interface PayLaterFinancingPlanFundingSource
+ (id)_predicateForPlanPID:(int64_t)a3;
+ (id)_propertySettersForFundingSource;
+ (id)_propertyValuesForFundingSource:(id)a3;
+ (id)anyInDatabase:(id)a3 forPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteFinancingPlanFundingSourceForPlanPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateFinancingPlanFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanFundingSource)initWithFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)fundingSource;
- (void)updateWithFundingSource:(id)a3;
@end

@implementation PayLaterFinancingPlanFundingSource

+ (id)databaseTable
{
  return @"akebi";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlan, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFundingSourceDetails, v4) == a3) {
    return @"b";
  }
  return 0LL;
}

- (PayLaterFinancingPlanFundingSource)initWithFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForFundingSource:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (void)insertOrUpdateFinancingPlanFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPlanPID:a4]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (!v10)
  {
    id v10 = [objc_alloc((Class)a1) initWithFundingSource:v15 forPlanPID:a4 inDatabase:v8];
    goto LABEL_5;
  }

  [v10 updateWithFundingSource:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:@"b"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFundingSourceDetails anyInDatabase:forPID:]( &OBJC_CLASS___PayLaterFundingSourceDetails,  "anyInDatabase:forPID:",  v8,  v11));

  if (!v12)
  {
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue([v15 details]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFundingSourceDetails insertFundingSourceDetails:inDatabase:]( &OBJC_CLASS___PayLaterFundingSourceDetails,  "insertFundingSourceDetails:inDatabase:",  v14,  v8));

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
    [v10 setValue:v13 forProperty:@"b"];
    goto LABEL_6;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 details]);
  [v12 updateFundingSourceDetails:v13];
LABEL_6:
}

- (void)updateWithFundingSource:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForFundingSource:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 forPlanPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPlanPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deleteFinancingPlanFundingSourceForPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFundingSourceDetails anyInDatabase:forPID:]( &OBJC_CLASS___PayLaterFundingSourceDetails,  "anyInDatabase:forPID:",  v3,  v4));
  [v5 deleteFromDatabase];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PayLaterFinancingPlanFundingSource;
  return -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");
}

- (id)fundingSource
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterFinancingPlanFundingSource);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForFundingSource");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000DC3CC;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForPlanPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForFundingSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"c");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 type], @"d");
  id v6 = [v3 autoPayment];

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v6, @"e");
  id v7 = -[NSMutableDictionary copy](v4, "copy");

  return v7;
}

+ (id)_propertySettersForFundingSource
{
  v3[0] = @"c";
  v3[1] = @"d";
  v4[0] = &stru_1006421C0;
  v4[1] = &stru_1006421E0;
  v3[2] = @"e";
  v4[2] = &stru_100642200;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end