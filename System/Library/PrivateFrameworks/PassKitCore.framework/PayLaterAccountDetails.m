@interface PayLaterAccountDetails
+ (id)_commonDictionaryForPayLaterDetails:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountDetails;
+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountDetails)initWithAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amountPaid;
- (id)_currentBalance;
- (id)_nextDueAmount;
- (id)_totalFinanced;
- (id)accountDetails;
- (void)updateWitDetails:(id)a3;
@end

@implementation PayLaterAccountDetails

+ (id)databaseTable
{
  return @"persimmon";
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

- (PayLaterAccountDetails)initWithAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 payLaterDetails]);
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForPayLaterDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (id)insertOrUpdateAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v10]);

  if (v11) {
    [v11 updateWitDetails:v9];
  }
  else {
    id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithAccountDetails:forAccountPID:inDatabase:",  v9,  a4,  v8);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 payLaterDetails]);

  if (v13)
  {
    id v14 = [v11 persistentID];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 products]);
    +[PayLaterAccountProduct insertOrUpdatePayLaterAccountProducts:forPayLaterAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProduct,  "insertOrUpdatePayLaterAccountProducts:forPayLaterAccountDetailsPID:inDatabase:",  v15,  v14,  v8);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 termsDetails]);
    id v17 =  +[PayLaterAccountTermsDetails insertOrUpdatePayLaterAccountTermsDetails:forPayLaterAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountTermsDetails,  "insertOrUpdatePayLaterAccountTermsDetails:forPayLaterAccountDetailsPID:inDatabase:",  v16,  v14,  v8);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    id v19 =  +[PayLaterAccountUserInfo insertOrUpdatePayLaterAccountUserInfo:forAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfo,  "insertOrUpdatePayLaterAccountUserInfo:forAccountDetailsPID:inDatabase:",  v18,  v14,  v8);
  }

  return v11;
}

+ (void)deleteAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[PayLaterAccountProduct deletePayLaterAccountProductForPayLaterAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProduct,  "deletePayLaterAccountProductForPayLaterAccountDetailsPID:inDatabase:",  v3,  v4);
  +[PayLaterAccountTermsDetails deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountTermsDetails,  "deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:inDatabase:",  v3,  v4);
  +[PayLaterAccountUserInfo deletePayLaterAccountUserInfoForAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfo,  "deletePayLaterAccountUserInfoForAccountDetailsPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterAccountDetails;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountDetails]);
  return v9;
}

- (void)updateWitDetails:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 payLaterDetails]);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_commonDictionaryForPayLaterDetails:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForPayLaterAccountDetails
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064EB18;
  v4[1] = &stru_10064EB38;
  v3[2] = @"j";
  v3[3] = @"m";
  v4[2] = &stru_10064EB58;
  v4[3] = &stru_10064EB78;
  v3[4] = @"n";
  v3[5] = @"o";
  v4[4] = &stru_10064EB98;
  v4[5] = &stru_10064EBB8;
  v3[6] = @"p";
  v3[7] = @"q";
  v4[6] = &stru_10064EBD8;
  v4[7] = &stru_10064EBF8;
  v3[8] = @"r";
  v3[9] = @"s";
  v4[8] = &stru_10064EC18;
  v4[9] = &stru_10064EC38;
  v3[10] = @"t";
  v3[11] = @"u";
  v4[10] = &stru_10064EC58;
  v4[11] = &stru_10064EC78;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
}

- (id)accountDetails
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterAccountDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10023EC00;
  v21[3] = &unk_100638EF0;
  v21[4] = self;
  id v22 = v6;
  v23 = v3;
  id v8 = v3;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v21);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountProduct payLaterProductsForPayLaterAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProduct,  "payLaterProductsForPayLaterAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKPayLaterAccountDetails setProducts:](v8, "setProducts:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountTermsDetails payLaterAccountTermsDetailsForAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountTermsDetails,  "payLaterAccountTermsDetailsForAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKPayLaterAccountDetails setTermsDetails:](v8, "setTermsDetails:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfo payLaterAccountUserInfoForAccountDetailsPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfo,  "payLaterAccountUserInfoForAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKPayLaterAccountDetails setUserInfo:](v8, "setUserInfo:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountDetails _currentBalance](self, "_currentBalance"));
  -[PKPayLaterAccountDetails setCurrentBalance:](v8, "setCurrentBalance:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountDetails _amountPaid](self, "_amountPaid"));
  -[PKPayLaterAccountDetails setAmountPaid:](v8, "setAmountPaid:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountDetails _totalFinanced](self, "_totalFinanced"));
  -[PKPayLaterAccountDetails setTotalFinanced:](v8, "setTotalFinanced:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountDetails _nextDueAmount](self, "_nextDueAmount"));
  -[PKPayLaterAccountDetails setNextDueAmount:](v8, "setNextDueAmount:", v18);

  id v19 = [[PKAccountDetails alloc] initWithPayLaterDetails:v8];
  return v19;
}

- (id)_currentBalance
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_amountPaid
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"f"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"g"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_totalFinanced
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"h"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"i"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_nextDueAmount
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"k"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"l"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

+ (id)_commonDictionaryForPayLaterDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 createdDate]);
  uint64_t v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdatedDate]);
  BOOL v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"b");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 amount]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"d");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"e");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 amountPaid]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 amount]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"f");

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 amountPaid]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"g");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 totalFinanced]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 amount]);
  uint64_t v23 = PKCurrencyDecimalToStorageNumber(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"h");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 totalFinanced]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v26, @"i");

  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 nextDueDate]);
  v28 = (void *)_SQLValueForDate(v27);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v28, @"j");

  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 nextDueAmount]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 amount]);
  uint64_t v31 = PKCurrencyDecimalToStorageNumber(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v32, @"k");

  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 nextDueAmount]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v34, @"l");

  v35 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v35, @"m");

  v36 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedPassURL]);
  v37 = (void *)_SQLValueForURL(v36);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v37, @"n");

  v38 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedPassSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v38, @"o");

  v39 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedPassTypeIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v39, @"p");

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 cardNetwork]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v40, @"q");

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 paymentType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v41, @"t");

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 financingPlanFetchLimit]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v42, @"u");

  v43 = (void *)objc_claimAutoreleasedReturnValue([v3 availableLanguages]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v44, @"r");

  id v45 = [v3 requiresGenericMessaging];
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v45, @"s");
  return v4;
}

@end