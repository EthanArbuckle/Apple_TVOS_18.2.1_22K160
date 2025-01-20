@interface AccountPaymentFundingDetailsBankAccount
+ (BOOL)deleteFundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForAccountFundingSourcePID:(int64_t)a3;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForFundingDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)fundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateFundingDetails:(id)a3 forAccountFundingSourcePID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPaymentFundingDetailsBankAccount)initWithFundingDetails:(id)a3 forFundingSourcePID:(int64_t)a4 inDatabase:(id)a5;
- (id)_fundingDetails;
- (void)updateFundingDetails:(id)a3;
@end

@implementation AccountPaymentFundingDetailsBankAccount

+ (id)databaseTable
{
  return @"account_funding_details_bank_account";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountPaymentFundingSource, a2) == a3) {
    return @"account_funding_source_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateFundingDetails:(id)a3 forAccountFundingSourcePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountFundingSourcePID:a4]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

    if (v11) {
      [v11 updateFundingDetails:v8];
    }
    else {
      id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithFundingDetails:forFundingSourcePID:inDatabase:",  v8,  a4,  v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _fundingDetails]);
  }

  else
  {
    [a1 deleteFundingDetailsForAccountFundingSourcePID:a4 inDatabase:v9];
    v13 = 0LL;
  }

  return v13;
}

- (AccountPaymentFundingDetailsBankAccount)initWithFundingDetails:(id)a3 forFundingSourcePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForFundingDetails:", v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"account_funding_source_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 verificationDetails]);

  id v16 =  +[AccountFundingSourceVerification insertOrUpdateVerification:forAccountFundingDetailsPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerification,  "insertOrUpdateVerification:forAccountFundingDetailsPID:inDatabase:",  v15,  -[SQLiteEntity persistentID](v14, "persistentID"),  v8);
  return v14;
}

- (void)updateFundingDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForFundingDetails:", v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 verificationDetails]);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v10 =  +[AccountFundingSourceVerification insertOrUpdateVerification:forAccountFundingDetailsPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerification,  "insertOrUpdateVerification:forAccountFundingDetailsPID:inDatabase:",  v7,  v8,  v9);
}

+ (id)fundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountFundingSourcePID:a3]);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _fundingDetails]);
  return v9;
}

+ (BOOL)deleteFundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountFundingSourcePID:a3]);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  unsigned int v9 = +[AccountFundingSourceVerification deleteVerificationForAccountFundingDetailsPID:inDatabase:]( AccountFundingSourceVerification,  "deleteVerificationForAccountFundingDetailsPID:inDatabase:",  [v8 persistentID],  v6);
  if (v9) {
    LOBYTE(v9) = [v8 deleteFromDatabase];
  }

  return v9;
}

+ (id)_predicateForAccountFundingSourcePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_funding_source_pid",  v3));

  return v4;
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

- (id)_fundingDetails
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10031E540;
  v16[3] = &unk_100638EF0;
  v16[4] = self;
  id v17 = v6;
  int64_t v8 = v3;
  v18 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v16);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AccountFundingSourceVerification verificationForAccountFundingDetailsPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerification,  "verificationForAccountFundingDetailsPID:inDatabase:",  v10,  v11));
  -[PKAccountPaymentFundingDetailsBankAccount setVerificationDetails:](v8, "setVerificationDetails:", v12);

  v13 = v18;
  v14 = v8;

  return v14;
}

+ (id)_propertyValuesForFundingDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"account_identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 accountNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"account_number");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 routingNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"routing_number");

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"name");

  id v9 = [v3 status];
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"status");

  return v4;
}

+ (id)_propertySetters
{
  v3[0] = @"account_identifier";
  v3[1] = @"account_number";
  v4[0] = &stru_1006569B8;
  v4[1] = &stru_1006569D8;
  v3[2] = @"routing_number";
  v3[3] = @"name";
  v4[2] = &stru_1006569F8;
  v4[3] = &stru_100656A18;
  v3[4] = @"status";
  v4[4] = &stru_100656A38;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end