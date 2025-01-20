@interface CreditAccountMergeSummary
+ (BOOL)deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAccountSummaryPID:(id)a3;
+ (id)_propertySettersForCreditAccountMergeSummary;
+ (id)_propertyValuesForCreditAccountMergeSummary:(id)a3;
+ (id)anyInDatabase:(id)a3 forCreditAccountSummaryPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountMergeSummary)initWithCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (id)creditAccountMergeSummary;
- (void)updateWithCreditAccountMergeSummary:(id)a3;
@end

@implementation CreditAccountMergeSummary

+ (id)databaseTable
{
  return @"credit_account_merge_summary";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountSummary, a2) == a3) {
    return @"credit_account_summary_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 forCreditAccountSummaryPID:v9]);
    if (v11)
    {
      id v12 = v11;
      [v11 updateWithCreditAccountMergeSummary:v8];
    }

    else
    {
      id v12 = [objc_alloc((Class)a1) initWithCreditAccountMergeSummary:v8 forCreditAccountSummaryPID:v9 inDatabase:v10];
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (CreditAccountMergeSummary)initWithCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForCreditAccountMergeSummary:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 mutableCopy];

  [v14 setObjectOrNull:v10 forKey:@"credit_account_summary_pid"];
  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v9);
  v16 = v15;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v15, "persistentID")));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 accountDetails]);
    id v19 =  +[CreditAccountMergeSummaryAccountDetails insertOrUpdateMergeSummaryAccountDetails:forMergeSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummaryAccountDetails,  "insertOrUpdateMergeSummaryAccountDetails:forMergeSummaryPID:inDatabase:",  v18,  v17,  v9);
  }

  return v16;
}

- (void)updateWithCreditAccountMergeSummary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForCreditAccountMergeSummary:", v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 accountDetails]);

  id v10 =  +[CreditAccountMergeSummaryAccountDetails insertOrUpdateMergeSummaryAccountDetails:forMergeSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummaryAccountDetails,  "insertOrUpdateMergeSummaryAccountDetails:forMergeSummaryPID:inDatabase:",  v9,  v7,  v8);
}

+ (id)anyInDatabase:(id)a3 forCreditAccountSummaryPID:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountSummaryPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)creditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a4 forCreditAccountSummaryPID:a3]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 creditAccountMergeSummary]);

  return v5;
}

+ (BOOL)deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a4 forCreditAccountSummaryPID:a3]);
  unsigned __int8 v5 = [v4 deleteFromDatabase];

  return v5;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[CreditAccountMergeSummaryAccountDetails deleteMergeSummaryAccountDetailsForMergeSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummaryAccountDetails,  "deleteMergeSummaryAccountDetailsForMergeSummaryPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___CreditAccountMergeSummary;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

- (id)creditAccountMergeSummary
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountMergeSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountMergeSummary");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001CB154;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v6;
  id v8 = v3;
  v17 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v15);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountMergeSummaryAccountDetails mergeSummaryAccountDetailsForMergeSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummaryAccountDetails,  "mergeSummaryAccountDetailsForMergeSummaryPID:inDatabase:",  v10,  v11));
  -[PKCreditAccountMergeSummary setAccountDetails:](v8, "setAccountDetails:", v12);

  v13 = v8;
  return v13;
}

+ (id)_predicateForAccountSummaryPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"credit_account_summary_pid",  a3);
}

+ (id)_propertyValuesForCreditAccountMergeSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 mergeDate]);
  objc_super v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"merge_date");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 totalBalance]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"total_balance");

  id v10 = -[NSMutableDictionary copy](v4, "copy");
  return v10;
}

+ (id)_propertySettersForCreditAccountMergeSummary
{
  v3[0] = @"merge_date";
  v3[1] = @"total_balance";
  v4[0] = &stru_10064AF38;
  v4[1] = &stru_10064AF58;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end