@interface CreditAccountDetails
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountDetails;
+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardEncryptedDataForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountDetails)initWithCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountDetails;
- (void)updateWithCreditAccountDetails:(id)a3;
@end

@implementation CreditAccountDetails

+ (id)databaseTable
{
  return @"clementines";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditAccountDetails)initWithCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 creditDetails]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdatedDate]);
  v13 = (void *)_SQLValueForDate(v12);
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 createdDate]);
  v15 = (void *)_SQLValueForDate(v14);
  [v10 setObjectOrNull:v15 forKey:@"n"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 mergeDate]);
  v17 = (void *)_SQLValueForDate(v16);
  [v10 setObjectOrNull:v17 forKey:@"o"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 countryCode]);
  [v10 setObjectOrNull:v18 forKey:@"c"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyCode]);
  [v10 setObjectOrNull:v19 forKey:@"d"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 productTimeZone]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
  [v10 setObjectOrNull:v21 forKey:@"m"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "termsAcceptanceRequired"), @"f");
  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 termsURL]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
  [v10 setObjectOrNull:v23 forKey:@"h"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 termsIdentifier]);
  [v10 setObjectOrNull:v24 forKey:@"g"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassURL]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 absoluteString]);
  [v10 setObjectOrNull:v26 forKey:@"i"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassSerialNumber]);
  [v10 setObjectOrNull:v27 forKey:@"j"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassTypeIdentifier]);
  [v10 setObjectOrNull:v28 forKey:@"k"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "cardType"), @"l");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "rewardsDestination"), @"p");
  v29 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  id v30 = -[SQLiteEntity persistentID](v29, "persistentID");
  v31 = (void *)objc_claimAutoreleasedReturnValue([v9 rates]);
  id v32 =  +[CreditAccountRates insertAccountRates:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountRates,  "insertAccountRates:forCreditAccountDetailsPID:inDatabase:",  v31,  v30,  v8);

  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 accountSummary]);
  id v34 =  +[CreditAccountSummary insertAccountSummary:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountSummary,  "insertAccountSummary:forCreditAccountDetailsPID:inDatabase:",  v33,  v30,  v8);

  v35 = (void *)objc_claimAutoreleasedReturnValue([v9 virtualCards]);
  id v36 =  +[VirtualCard insertOrUpdateVirtualCards:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___VirtualCard,  "insertOrUpdateVirtualCards:forCreditAccountDetailsPID:inDatabase:",  v35,  v30,  v8);

  v37 = (void *)objc_claimAutoreleasedReturnValue([v9 installmentPlans]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v30));
  id v39 =  +[CreditInstallmentPlan insertOrUpdateInstallmentPlans:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlan,  "insertOrUpdateInstallmentPlans:forCreditAccountDetailsPID:inDatabase:",  v37,  v38,  v8);

  return v29;
}

+ (id)insertCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountDetails:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (void)deleteVirtualCardEncryptedDataForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  +[VirtualCard deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:inDatabase:]( VirtualCard,  "deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:inDatabase:",  [v8 persistentID],  v6);
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[CreditAccountSummary deleteCreditAccountSummaryForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountSummary,  "deleteCreditAccountSummaryForCreditAccountDetailsPID:inDatabase:",  v3,  v4);
  +[CreditAccountRates deleteCreditAccountRatesForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountRates,  "deleteCreditAccountRatesForCreditAccountDetailsPID:inDatabase:",  v3,  v4);
  +[VirtualCard deleteVirtualCardsForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___VirtualCard,  "deleteVirtualCardsForCreditAccountDetailsPID:inDatabase:",  v3,  v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[CreditInstallmentPlan deleteInstallmentPlansForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlan,  "deleteInstallmentPlansForCreditAccountDetailsPID:inDatabase:",  v5,  v4);

  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___CreditAccountDetails;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

+ (id)creditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountDetails]);
  return v9;
}

+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)updateCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithCreditAccountDetails:v12];
  }
  else {
    id v11 =  +[CreditAccountDetails insertCreditAccountDetails:forAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountDetails,  "insertCreditAccountDetails:forAccountPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithCreditAccountDetails:(id)a3
{
  id v31 = (id)objc_claimAutoreleasedReturnValue([a3 creditDetails]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v31 lastUpdatedDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  [v4 setObjectOrNull:v6 forKey:@"b"];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v31 createdDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  [v4 setObjectOrNull:v8 forKey:@"n"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v31 mergeDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  [v4 setObjectOrNull:v10 forKey:@"o"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v31 countryCode]);
  [v4 setObjectOrNull:v11 forKey:@"c"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v31 currencyCode]);
  [v4 setObjectOrNull:v12 forKey:@"d"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v31 productTimeZone]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  [v4 setObjectOrNull:v14 forKey:@"m"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v31, "termsAcceptanceRequired"), @"f");
  v15 = (void *)objc_claimAutoreleasedReturnValue([v31 termsURL]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 absoluteString]);
  [v4 setObjectOrNull:v16 forKey:@"h"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v31 termsIdentifier]);
  [v4 setObjectOrNull:v17 forKey:@"g"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v31 associatedPassURL]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);
  [v4 setObjectOrNull:v19 forKey:@"i"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v31 associatedPassSerialNumber]);
  [v4 setObjectOrNull:v20 forKey:@"j"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v31 associatedPassTypeIdentifier]);
  [v4 setObjectOrNull:v21 forKey:@"k"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v31, "cardType"), @"l");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v31, "rewardsDestination"), @"p");
  int64_t v22 = -[SQLiteEntity persistentID](self, "persistentID");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v31 rates]);
  +[CreditAccountRates updateCreditAccountRates:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountRates,  "updateCreditAccountRates:forCreditAccountDetailsPID:inDatabase:",  v24,  v22,  v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v31 accountSummary]);
  +[CreditAccountSummary updateCreditAccountSummary:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountSummary,  "updateCreditAccountSummary:forCreditAccountDetailsPID:inDatabase:",  v25,  v22,  v23);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v31 virtualCards]);
  id v27 =  +[VirtualCard insertOrUpdateVirtualCards:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___VirtualCard,  "insertOrUpdateVirtualCards:forCreditAccountDetailsPID:inDatabase:",  v26,  v22,  v23);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v31 installmentPlans]);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v22));
  id v30 =  +[CreditInstallmentPlan insertOrUpdateInstallmentPlans:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlan,  "insertOrUpdateInstallmentPlans:forCreditAccountDetailsPID:inDatabase:",  v28,  v29,  v23);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForCreditAccountDetails
{
  v3[0] = @"b";
  v3[1] = @"n";
  v4[0] = &stru_100657F80;
  v4[1] = &stru_100657FA0;
  v3[2] = @"o";
  v3[3] = @"c";
  v4[2] = &stru_100657FC0;
  v4[3] = &stru_100657FE0;
  v3[4] = @"d";
  v3[5] = @"m";
  v4[4] = &stru_100658000;
  v4[5] = &stru_100658020;
  v3[6] = @"f";
  v3[7] = @"h";
  v4[6] = &stru_100658040;
  v4[7] = &stru_100658060;
  v3[8] = @"g";
  v3[9] = @"i";
  v4[8] = &stru_100658080;
  v4[9] = &stru_1006580A0;
  v3[10] = @"j";
  v3[11] = @"k";
  v4[10] = &stru_1006580C0;
  v4[11] = &stru_1006580E0;
  v3[12] = @"l";
  v3[13] = @"p";
  v4[12] = &stru_100658100;
  v4[13] = &stru_100658120;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  14LL));
}

- (id)accountDetails
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10033F694;
  v19[3] = &unk_100638EF0;
  v19[4] = self;
  id v20 = v6;
  v21 = v3;
  id v8 = v3;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v19);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountRates creditAccountRatesForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountRates,  "creditAccountRatesForCreditAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKCreditAccountDetails setRates:](v8, "setRates:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountSummary creditAccountSummaryForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountSummary,  "creditAccountSummaryForCreditAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKCreditAccountDetails setAccountSummary:](v8, "setAccountSummary:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[VirtualCard virtualCardsForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___VirtualCard,  "virtualCardsForCreditAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKCreditAccountDetails setVirtualCards:](v8, "setVirtualCards:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[CreditInstallmentPlan installmentPlansForCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlan,  "installmentPlansForCreditAccountDetailsPID:inDatabase:",  v15,  v11));
  -[PKCreditAccountDetails setInstallmentPlans:](v8, "setInstallmentPlans:", v16);

  id v17 = [[PKAccountDetails alloc] initWithCreditDetails:v8];
  return v17;
}

@end