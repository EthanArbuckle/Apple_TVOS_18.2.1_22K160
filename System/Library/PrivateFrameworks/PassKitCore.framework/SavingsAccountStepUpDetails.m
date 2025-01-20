@interface SavingsAccountStepUpDetails
+ (id)_commonDictionaryForStepUpDetails:(id)a3;
+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForSavingsStepUpDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)savingsAccountStepUpDetailsForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountStepUpForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (SavingsAccountStepUpDetails)initWithSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)savingsAccountStepUpDetails;
- (void)updateWithSavingsAccountStepUpDetails:(id)a3;
@end

@implementation SavingsAccountStepUpDetails

+ (id)databaseTable
{
  return @"savings_account_step_up_details";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___SavingsAccountDetails, a2) == a3) {
    return @"details_pid";
  }
  else {
    return 0LL;
  }
}

- (SavingsAccountStepUpDetails)initWithSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForStepUpDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"details_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithSavingsAccountStepUpDetails:v9 forSavingsAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (id)savingsAccountStepUpDetailsForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSavingsAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 savingsAccountStepUpDetails]);
  return v9;
}

+ (void)updateSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSavingsAccountDetailsPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithSavingsAccountStepUpDetails:v12];
  }
  else {
    id v11 =  +[SavingsAccountStepUpDetails insertSavingsAccountStepUpDetails:forSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "insertSavingsAccountStepUpDetails:forSavingsAccountDetailsPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithSavingsAccountStepUpDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForStepUpDetails:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (void)deleteSavingsAccountStepUpForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSavingsAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (id)savingsAccountStepUpDetails
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountStepUpDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForSavingsStepUpDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10020C4BC;
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

+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"details_pid",  v3));

  return v4;
}

+ (id)_commonDictionaryForStepUpDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 thresholdExceeded]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"threshold_exceeded");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 neededBy]);
  id v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"needed_by");

  return v4;
}

+ (id)_propertySettersForSavingsStepUpDetails
{
  v3[0] = @"threshold_exceeded";
  v3[1] = @"needed_by";
  v4[0] = &stru_10064D3F8;
  v4[1] = &stru_10064D418;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end