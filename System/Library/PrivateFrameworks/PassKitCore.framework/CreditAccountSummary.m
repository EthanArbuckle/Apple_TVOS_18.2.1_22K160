@interface CreditAccountSummary
+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountSummary;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountSummary)initWithCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)creditAccountSummary;
- (void)updateWithCreditAccountSummary:(id)a3;
@end

@implementation CreditAccountSummary

+ (id)databaseTable
{
  return @"oranges";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditAccountSummary)initWithCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 creditLimit]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 setObjectOrNull:v14 forKey:@"b"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 availableCredit]);
  uint64_t v16 = PKCurrencyDecimalToStorageNumber(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v10 setObjectOrNull:v17 forKey:@"c"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 currentBalance]);
  uint64_t v19 = PKCurrencyDecimalToStorageNumber(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v10 setObjectOrNull:v20 forKey:@"d"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 adjustedBalance]);
  uint64_t v22 = PKCurrencyDecimalToStorageNumber(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v10 setObjectOrNull:v23 forKey:@"t"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 rewardsBalance]);
  uint64_t v25 = PKCurrencyDecimalToStorageNumber(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v10 setObjectOrNull:v26 forKey:@"e"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v9 remainingMinimumPayment]);
  uint64_t v28 = PKCurrencyDecimalToStorageNumber(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v10 setObjectOrNull:v29 forKey:@"j"];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v9 remainingStatementBalance]);
  uint64_t v31 = PKCurrencyDecimalToStorageNumber(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v10 setObjectOrNull:v32 forKey:@"k"];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 remainingStatementBalanceForInterestCalculation]);
  uint64_t v34 = PKCurrencyDecimalToStorageNumber(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  [v10 setObjectOrNull:v35 forKey:@"remaining_statement_balance_for_interest_calculation"];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v9 pastDueAmount]);
  uint64_t v37 = PKCurrencyDecimalToStorageNumber(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  [v10 setObjectOrNull:v38 forKey:@"p"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "autoPayEnabled"), @"f");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "requiresDebtCollectionNotices"), @"l");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "inGrace"), @"o");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "balanceStatus"), @"g");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "cyclesPastDue"), @"h");
  v39 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPaymentDate]);
  v40 = (void *)_SQLValueForDate(v39);
  [v10 setObjectOrNull:v40 forKey:@"i"];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentDueDate]);
  v42 = (void *)_SQLValueForDate(v41);
  [v10 setObjectOrNull:v42 forKey:@"q"];

  v43 = (void *)objc_claimAutoreleasedReturnValue([v9 unpostedInterest]);
  uint64_t v44 = PKCurrencyDecimalToStorageNumber(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  [v10 setObjectOrNull:v45 forKey:@"m"];

  v46 = (void *)objc_claimAutoreleasedReturnValue([v9 unpostedInterestTimestamp]);
  v47 = (void *)_SQLValueForDate(v46);
  [v10 setObjectOrNull:v47 forKey:@"n"];

  v48 = (void *)objc_claimAutoreleasedReturnValue([v9 chargeOffPreventionAmount]);
  uint64_t v49 = PKCurrencyDecimalToStorageNumber(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  [v10 setObjectOrNull:v50 forKey:@"r"];

  v51 = (void *)objc_claimAutoreleasedReturnValue([v9 pastDueAmount]);
  uint64_t v52 = PKCurrencyDecimalToStorageNumber(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  [v10 setObjectOrNull:v53 forKey:@"p"];

  v54 = (void *)objc_claimAutoreleasedReturnValue([v9 installmentBalance]);
  uint64_t v55 = PKCurrencyDecimalToStorageNumber(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  [v10 setObjectOrNull:v56 forKey:@"s"];

  v57 = (void *)objc_claimAutoreleasedReturnValue([v9 remainingMinimumPaymentExcludedFromInterestCalculation]);
  uint64_t v58 = PKCurrencyDecimalToStorageNumber(v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  [v10 setObjectOrNull:v59 forKey:@"u"];

  objc_msgSend( v10,  "setBool:forKey:",  objc_msgSend(v9, "recoveryPaymentPlansSupported"),  @"recovery_payment_plans_supported");
  v60 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  id v61 = -[SQLiteEntity persistentID](v60, "persistentID");
  v62 = (void *)objc_claimAutoreleasedReturnValue([v9 balanceSummary]);
  id v63 =  +[CreditAccountBalanceSummary insertAccountBalanceSummary:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountBalanceSummary,  "insertAccountBalanceSummary:forCreditAccountSummaryPID:inDatabase:",  v62,  v61,  v8);

  v64 = (void *)objc_claimAutoreleasedReturnValue([v9 currentStatement]);
  id v65 =  +[CreditAccountStatement insertCreditAccountStatement:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "insertCreditAccountStatement:forCreditAccountSummaryPID:inDatabase:",  v64,  v61,  v8);

  v66 = (void *)objc_claimAutoreleasedReturnValue([v9 accountUserActivity]);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v61));
  id v68 =  +[CreditAccountUserActivity insertOrUpdateCreditAccountUserActivity:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountUserActivity,  "insertOrUpdateCreditAccountUserActivity:forCreditAccountSummaryPID:inDatabase:",  v66,  v67,  v8);

  v69 = (void *)objc_claimAutoreleasedReturnValue([v9 mergeSummary]);
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v61));
  id v71 =  +[CreditAccountMergeSummary insertOrUpdateCreditAccountMergeSummary:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummary,  "insertOrUpdateCreditAccountMergeSummary:forCreditAccountSummaryPID:inDatabase:",  v69,  v70,  v8);

  return v60;
}

+ (id)insertAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountSummary:v9 forCreditAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[CreditAccountBalanceSummary deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountBalanceSummary,  "deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:inDatabase:",  v3,  v4);
  +[CreditAccountStatement deleteCreditAccountStatementForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "deleteCreditAccountStatementForCreditAccountSummaryPID:inDatabase:",  v3,  v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[CreditAccountUserActivity deleteCreditAccountUserActivityForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountUserActivity,  "deleteCreditAccountUserActivityForCreditAccountSummaryPID:inDatabase:",  v5,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[CreditAccountMergeSummary deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummary,  "deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:inDatabase:",  v6,  v4);

  v8.receiver = v2;
  v8.super_class = (Class)&OBJC_CLASS___CreditAccountSummary;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v8, "deleteFromDatabase");

  return (char)v2;
}

+ (id)creditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creditAccountSummary]);
  return v9;
}

+ (void)updateCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithCreditAccountSummary:v12];
  }
  else {
    id v11 =  +[CreditAccountSummary insertAccountSummary:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountSummary,  "insertAccountSummary:forCreditAccountDetailsPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithCreditAccountSummary:(id)a3
{
  id v4 = a3;
  id v63 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 creditLimit]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v63 setObjectOrNull:v7 forKey:@"b"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 availableCredit]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v63 setObjectOrNull:v10 forKey:@"c"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 currentBalance]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v63 setObjectOrNull:v13 forKey:@"d"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 adjustedBalance]);
  uint64_t v15 = PKCurrencyDecimalToStorageNumber(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v63 setObjectOrNull:v16 forKey:@"t"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsBalance]);
  uint64_t v18 = PKCurrencyDecimalToStorageNumber(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v63 setObjectOrNull:v19 forKey:@"e"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 remainingMinimumPayment]);
  uint64_t v21 = PKCurrencyDecimalToStorageNumber(v20);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v63 setObjectOrNull:v22 forKey:@"j"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 remainingStatementBalance]);
  uint64_t v24 = PKCurrencyDecimalToStorageNumber(v23);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v63 setObjectOrNull:v25 forKey:@"k"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 remainingStatementBalanceForInterestCalculation]);
  uint64_t v27 = PKCurrencyDecimalToStorageNumber(v26);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v63 setObjectOrNull:v28 forKey:@"remaining_statement_balance_for_interest_calculation"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v4 pastDueAmount]);
  uint64_t v30 = PKCurrencyDecimalToStorageNumber(v29);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  [v63 setObjectOrNull:v31 forKey:@"p"];

  objc_msgSend(v63, "setBool:forKey:", objc_msgSend(v4, "autoPayEnabled"), @"f");
  objc_msgSend(v63, "setBool:forKey:", objc_msgSend(v4, "requiresDebtCollectionNotices"), @"l");
  objc_msgSend(v63, "setBool:forKey:", objc_msgSend(v4, "inGrace"), @"o");
  objc_msgSend(v63, "setInteger:forKey:", objc_msgSend(v4, "balanceStatus"), @"g");
  objc_msgSend(v63, "setInteger:forKey:", objc_msgSend(v4, "cyclesPastDue"), @"h");
  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPaymentDate]);
  v33 = (void *)_SQLValueForDate(v32);
  [v63 setObjectOrNull:v33 forKey:@"i"];

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentDueDate]);
  v35 = (void *)_SQLValueForDate(v34);
  [v63 setObjectOrNull:v35 forKey:@"q"];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 unpostedInterest]);
  uint64_t v37 = PKCurrencyDecimalToStorageNumber(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  [v63 setObjectOrNull:v38 forKey:@"m"];

  v39 = (void *)objc_claimAutoreleasedReturnValue([v4 unpostedInterestTimestamp]);
  v40 = (void *)_SQLValueForDate(v39);
  [v63 setObjectOrNull:v40 forKey:@"n"];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v4 chargeOffPreventionAmount]);
  uint64_t v42 = PKCurrencyDecimalToStorageNumber(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  [v63 setObjectOrNull:v43 forKey:@"r"];

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v4 pastDueAmount]);
  uint64_t v45 = PKCurrencyDecimalToStorageNumber(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  [v63 setObjectOrNull:v46 forKey:@"p"];

  v47 = (void *)objc_claimAutoreleasedReturnValue([v4 installmentBalance]);
  uint64_t v48 = PKCurrencyDecimalToStorageNumber(v47);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  [v63 setObjectOrNull:v49 forKey:@"s"];

  v50 = (void *)objc_claimAutoreleasedReturnValue([v4 remainingMinimumPaymentExcludedFromInterestCalculation]);
  uint64_t v51 = PKCurrencyDecimalToStorageNumber(v50);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  [v63 setObjectOrNull:v52 forKey:@"u"];

  objc_msgSend( v63,  "setBool:forKey:",  objc_msgSend(v4, "recoveryPaymentPlansSupported"),  @"recovery_payment_plans_supported");
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v63);
  int64_t v53 = -[SQLiteEntity persistentID](self, "persistentID");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v4 balanceSummary]);
  +[CreditAccountBalanceSummary updateCreditAccountBalanceSummary:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountBalanceSummary,  "updateCreditAccountBalanceSummary:forCreditAccountSummaryPID:inDatabase:",  v55,  v53,  v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue([v4 currentStatement]);
  +[CreditAccountStatement updateCreditAccountStatement:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "updateCreditAccountStatement:forCreditAccountSummaryPID:inDatabase:",  v56,  v53,  v54);

  v57 = (void *)objc_claimAutoreleasedReturnValue([v4 accountUserActivity]);
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v53));
  id v59 =  +[CreditAccountUserActivity insertOrUpdateCreditAccountUserActivity:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountUserActivity,  "insertOrUpdateCreditAccountUserActivity:forCreditAccountSummaryPID:inDatabase:",  v57,  v58,  v54);

  v60 = (void *)objc_claimAutoreleasedReturnValue([v4 mergeSummary]);
  id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v53));
  id v62 =  +[CreditAccountMergeSummary insertOrUpdateCreditAccountMergeSummary:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummary,  "insertOrUpdateCreditAccountMergeSummary:forCreditAccountSummaryPID:inDatabase:",  v60,  v61,  v54);
}

+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForCreditAccountSummary
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100645978;
  v4[1] = &stru_100645998;
  v3[2] = @"d";
  v3[3] = @"t";
  v4[2] = &stru_1006459B8;
  v4[3] = &stru_1006459D8;
  v3[4] = @"e";
  v3[5] = @"k";
  v4[4] = &stru_1006459F8;
  v4[5] = &stru_100645A18;
  v3[6] = @"remaining_statement_balance_for_interest_calculation";
  v3[7] = @"j";
  v4[6] = &stru_100645A38;
  v4[7] = &stru_100645A58;
  v3[8] = @"p";
  v3[9] = @"f";
  v4[8] = &stru_100645A78;
  v4[9] = &stru_100645A98;
  v3[10] = @"l";
  v3[11] = @"g";
  v4[10] = &stru_100645AB8;
  v4[11] = &stru_100645AD8;
  v3[12] = @"h";
  v3[13] = @"i";
  v4[12] = &stru_100645AF8;
  v4[13] = &stru_100645B18;
  v3[14] = @"q";
  v3[15] = @"m";
  v4[14] = &stru_100645B38;
  v4[15] = &stru_100645B58;
  v3[16] = @"n";
  v3[17] = @"o";
  v4[16] = &stru_100645B78;
  v4[17] = &stru_100645B98;
  v3[18] = @"r";
  v3[19] = @"p";
  v4[18] = &stru_100645BB8;
  v4[19] = &stru_100645BD8;
  v3[20] = @"s";
  v3[21] = @"u";
  v4[20] = &stru_100645BF8;
  v4[21] = &stru_100645C18;
  v3[22] = @"recovery_payment_plans_supported";
  v4[22] = &stru_100645C38;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  23LL));
}

- (id)creditAccountSummary
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountSummary");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100149098;
  v20[3] = &unk_100638EF0;
  v20[4] = self;
  id v21 = v6;
  id v8 = v3;
  uint64_t v22 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v20);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountBalanceSummary creditAccountBalanceSummaryForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountBalanceSummary,  "creditAccountBalanceSummaryForCreditAccountSummaryPID:inDatabase:",  v10,  v11));
  -[PKCreditAccountSummary setBalanceSummary:](v8, "setBalanceSummary:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountStatement creditAccountStatementForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "creditAccountStatementForCreditAccountSummaryPID:inDatabase:",  v10,  v11));
  -[PKCreditAccountSummary setCurrentStatement:](v8, "setCurrentStatement:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountUserActivity creditAccountUserActivityForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountUserActivity,  "creditAccountUserActivityForCreditAccountSummaryPID:inDatabase:",  v14,  v11));
  -[PKCreditAccountSummary setAccountUserActivity:](v8, "setAccountUserActivity:", v15);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountMergeSummary creditAccountMergeSummaryForCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountMergeSummary,  "creditAccountMergeSummaryForCreditAccountSummaryPID:inDatabase:",  v16,  v11));
  -[PKCreditAccountSummary setMergeSummary:](v8, "setMergeSummary:", v17);

  uint64_t v18 = v8;
  return v18;
}

@end