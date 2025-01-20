@interface AccountFundingSourceVerification
+ (BOOL)deleteVerificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_optionsFromString:(id)a3;
+ (id)_optionsToString:(id)a3;
+ (id)_predicateForAccountFundingDetailsPID:(int64_t)a3;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_propertyValuesForVerification:(id)a3 pendingAttemptPID:(id)a4 failedAttemptPID:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVerification:(id)a3 forAccountFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)verificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountFundingSourceVerification)initWithVerification:(id)a3 forFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_failedAttemptPID;
- (id)_pendingAttemptPID;
- (id)_propertySetters;
- (id)_setVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5;
- (id)_verification;
- (void)updateVerification:(id)a3;
@end

@implementation AccountFundingSourceVerification

+ (id)databaseTable
{
  return @"account_funding_source_verification";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountPaymentFundingDetailsBankAccount, a2) == a3) {
    return @"account_funding_details_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateVerification:(id)a3 forAccountFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountFundingDetailsPID:a4]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

    if (v11) {
      [v11 updateVerification:v8];
    }
    else {
      id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithVerification:forFundingDetailsPID:inDatabase:",  v8,  a4,  v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _verification]);
  }

  else
  {
    [a1 deleteVerificationForAccountFundingDetailsPID:a4 inDatabase:v9];
    v13 = 0LL;
  }

  return v13;
}

- (AccountFundingSourceVerification)initWithVerification:(id)a3 forFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 pendingAttempt]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[AccountFundingSourceVerification _setVerificationAttempt:forPID:inDatabase:]( self,  "_setVerificationAttempt:forPID:inDatabase:",  v10,  0LL,  v9));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 failedAttempt]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[AccountFundingSourceVerification _setVerificationAttempt:forPID:inDatabase:]( self,  "_setVerificationAttempt:forPID:inDatabase:",  v12,  0LL,  v9));

  if (!v11)
  {
    v15 = 0LL;
    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    v16 = 0LL;
    goto LABEL_6;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 persistentID]));
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v13 persistentID]));
LABEL_6:
  id v17 = objc_msgSend( (id)objc_opt_class(self, v14),  "_propertyValuesForVerification:pendingAttemptPID:failedAttemptPID:",  v8,  v15,  v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v18 setObjectOrNull:v19 forKey:@"account_funding_details_pid"];

  v20 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v18, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 recoveryActions]);
  id v22 =  +[AccountFundingSourceVerificationAction insertOrUpdateVerificationActions:forAccountFundingSourceVerificationPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAction,  "insertOrUpdateVerificationActions:forAccountFundingSourceVerificationPID:inDatabase:",  v21,  -[SQLiteEntity persistentID](v20, "persistentID"),  v9);

  return v20;
}

- (void)updateVerification:(id)a3
{
  id v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v21 pendingAttempt]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFundingSourceVerification _pendingAttemptPID](self, "_pendingAttemptPID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[AccountFundingSourceVerification _setVerificationAttempt:forPID:inDatabase:]( self,  "_setVerificationAttempt:forPID:inDatabase:",  v4,  v5,  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v21 failedAttempt]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFundingSourceVerification _failedAttemptPID](self, "_failedAttemptPID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[AccountFundingSourceVerification _setVerificationAttempt:forPID:inDatabase:]( self,  "_setVerificationAttempt:forPID:inDatabase:",  v8,  v9,  v10));

  if (!v7)
  {
    v13 = 0LL;
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0LL;
    goto LABEL_6;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v7 persistentID]));
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 persistentID]));
LABEL_6:
  id v15 = objc_msgSend( (id)objc_opt_class(self, v12),  "_propertyValuesForVerification:pendingAttemptPID:failedAttemptPID:",  v21,  v13,  v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v16);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v21 recoveryActions]);
  int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v20 =  +[AccountFundingSourceVerificationAction insertOrUpdateVerificationActions:forAccountFundingSourceVerificationPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAction,  "insertOrUpdateVerificationActions:forAccountFundingSourceVerificationPID:inDatabase:",  v17,  v18,  v19);
}

- (id)_setVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[AccountFundingSourceVerificationAttempt insertOrUpdateVerificationAttempt:forPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAttempt,  "insertOrUpdateVerificationAttempt:forPID:inDatabase:",  v7,  v8,  v9));
  }

  else
  {
    if (v8) {
      +[AccountFundingSourceVerificationAttempt deleteVerificationAttemptForPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAttempt,  "deleteVerificationAttemptForPID:inDatabase:",  v8,  v9);
    }
    v10 = 0LL;
  }

  return v10;
}

+ (id)verificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountFundingDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _verification]);
  return v9;
}

+ (BOOL)deleteVerificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountFundingDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _pendingAttemptPID]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 _failedAttemptPID]);
  id v11 = (void *)v10;
  if (!v9)
  {
    unsigned int v12 = 1;
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  unsigned int v12 = +[AccountFundingSourceVerificationAttempt deleteVerificationAttemptForPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAttempt,  "deleteVerificationAttemptForPID:inDatabase:",  v9,  v6);
  if (v11) {
LABEL_3:
  }
    v12 &= +[AccountFundingSourceVerificationAttempt deleteVerificationAttemptForPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAttempt,  "deleteVerificationAttemptForPID:inDatabase:",  v11,  v6);
LABEL_4:
  unsigned int v13 = +[AccountFundingSourceVerificationAction deleteVerificationActionsForAccountFundingSourceVerificationPID:inDatabase:]( AccountFundingSourceVerificationAction,  "deleteVerificationActionsForAccountFundingSourceVerificationPID:inDatabase:",  [v8 persistentID],  v6);
  unsigned __int8 v14 = 0;
  if (v12 && v13) {
    unsigned __int8 v14 = [v8 deleteFromDatabase];
  }

  return v14;
}

+ (id)_predicateForAccountFundingDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_funding_details_pid",  v3));

  return v4;
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

- (id)_verification
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountFundingSourceVerification);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFundingSourceVerification _propertySetters](self, "_propertySetters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002E7F40;
  v14[3] = &unk_100638EF0;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  v16 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v14);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AccountFundingSourceVerificationAction verificationActionsForFundingSourceVerificationPID:inDatabase:]( &OBJC_CLASS___AccountFundingSourceVerificationAction,  "verificationActionsForFundingSourceVerificationPID:inDatabase:",  v8,  v9));
  -[PKAccountFundingSourceVerification setRecoveryActions:](v6, "setRecoveryActions:", v10);

  id v11 = v16;
  unsigned int v12 = v6;

  return v12;
}

- (id)_pendingAttemptPID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pending_attempt_pid");
}

- (id)_failedAttemptPID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"failed_attempt_pid");
}

+ (id)_propertyValuesForVerification:(id)a3 pendingAttemptPID:(id)a4 failedAttemptPID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 status]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"status");

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 options]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _optionsToString:v13]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"options");

  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v9, @"pending_attempt_pid");
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v8, @"failed_attempt_pid");

  return v11;
}

+ (id)_optionsToString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_100654788));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);

  return v4;
}

+ (id)_optionsFromString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@","]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pk_arrayByApplyingBlock:", &stru_1006547A8));

  return v4;
}

- (id)_propertySetters
{
  v12[0] = &stru_1006547E8;
  v11[0] = @"status";
  v11[1] = @"options";
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E8338;
  v10[3] = &unk_100654810;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v12[1] = v3;
  v11[2] = @"pending_attempt_pid";
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002E83A8;
  v9[3] = &unk_100654810;
  v9[4] = self;
  v4 = objc_retainBlock(v9);
  v12[2] = v4;
  v11[3] = @"failed_attempt_pid";
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002E8434;
  v8[3] = &unk_100654810;
  v8[4] = self;
  v5 = objc_retainBlock(v8);
  v12[3] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));

  return v6;
}

@end