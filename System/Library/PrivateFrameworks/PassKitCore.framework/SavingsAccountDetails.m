@interface SavingsAccountDetails
+ (id)_commonDictionaryForSavingsDetails:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForSavingsAccountDetails;
+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteSavingsAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (SavingsAccountDetails)initWithSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountDetails;
- (void)updateWithDetails:(id)a3;
@end

@implementation SavingsAccountDetails

+ (id)databaseTable
{
  return @"pomegranate";
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

- (SavingsAccountDetails)initWithSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 savingsDetails]);
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForSavingsDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  id v15 = -[SQLiteEntity persistentID](v14, "persistentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 accountSummary]);
  id v17 =  +[SavingsAccountSummary insertSavingsAccountSummary:forSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountSummary,  "insertSavingsAccountSummary:forSavingsAccountDetailsPID:inDatabase:",  v16,  v15,  v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 fccStepUpDetails]);
  if (v18) {
    id v19 =  +[SavingsAccountStepUpDetails insertSavingsAccountStepUpDetails:forSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "insertSavingsAccountStepUpDetails:forSavingsAccountDetailsPID:inDatabase:",  v18,  v15,  v8);
  }
  else {
    +[SavingsAccountStepUpDetails deleteSavingsAccountStepUpForSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "deleteSavingsAccountStepUpForSavingsAccountDetailsPID:inDatabase:",  v15,  v8);
  }

  return v14;
}

+ (id)insertOrUpdateSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWithDetails:v8];
  }
  else {
    id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithSavingsAccountDetails:forAccountPID:inDatabase:",  v8,  a4,  v9);
  }

  return v11;
}

+ (void)deleteSavingsAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
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
  +[SavingsAccountSummary deleteSavingsAccountSummaryForSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountSummary,  "deleteSavingsAccountSummaryForSavingsAccountDetailsPID:inDatabase:",  v3,  v4);
  +[SavingsAccountStepUpDetails deleteSavingsAccountStepUpForSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "deleteSavingsAccountStepUpForSavingsAccountDetailsPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___SavingsAccountDetails;
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

- (void)updateWithDetails:(id)a3
{
  id v11 = (id)objc_claimAutoreleasedReturnValue([a3 savingsDetails]);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_commonDictionaryForSavingsDetails:", v11);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 accountSummary]);
  +[SavingsAccountSummary updateSavingsAccountSummary:forSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountSummary,  "updateSavingsAccountSummary:forSavingsAccountDetailsPID:inDatabase:",  v9,  v7,  v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 fccStepUpDetails]);
  if (v10) {
    +[SavingsAccountStepUpDetails updateSavingsAccountStepUpDetails:forSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "updateSavingsAccountStepUpDetails:forSavingsAccountDetailsPID:inDatabase:",  v10,  v7,  v8);
  }
  else {
    +[SavingsAccountStepUpDetails deleteSavingsAccountStepUpForSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "deleteSavingsAccountStepUpForSavingsAccountDetailsPID:inDatabase:",  v7,  v8);
  }
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForSavingsAccountDetails
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100642B90;
  v4[1] = &stru_100642BB0;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100642BD0;
  v4[3] = &stru_100642BF0;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100642C10;
  v4[5] = &stru_100642C30;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100642C50;
  v4[7] = &stru_100642C70;
  v3[8] = @"k";
  v3[9] = @"l";
  v4[8] = &stru_100642C90;
  v4[9] = &stru_100642CB0;
  v3[10] = @"m";
  v3[11] = @"n";
  v4[10] = &stru_100642CD0;
  v4[11] = &stru_100642CF0;
  v3[12] = @"o";
  v3[13] = @"p";
  v4[12] = &stru_100642D10;
  v4[13] = &stru_100642D30;
  v3[14] = @"fcc_step_up_required";
  v4[14] = &stru_100642D50;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  15LL));
}

- (id)accountDetails
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForSavingsAccountDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E5024;
  v16[3] = &unk_100638EF0;
  v16[4] = self;
  id v17 = v6;
  v18 = v3;
  id v8 = v3;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v16);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SavingsAccountSummary savingsAccountSummaryForSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountSummary,  "savingsAccountSummaryForSavingsAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKSavingsAccountDetails setAccountSummary:](v8, "setAccountSummary:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SavingsAccountStepUpDetails savingsAccountStepUpDetailsForSavingsAccountDetailsPID:inDatabase:]( &OBJC_CLASS___SavingsAccountStepUpDetails,  "savingsAccountStepUpDetailsForSavingsAccountDetailsPID:inDatabase:",  v10,  v11));
  -[PKSavingsAccountDetails setFccStepUpDetails:](v8, "setFccStepUpDetails:", v13);

  id v14 = [[PKAccountDetails alloc] initWithSavingsDetails:v8];
  return v14;
}

+ (id)_commonDictionaryForSavingsDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdatedDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 createdDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"d");

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 productTimeZone]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"f");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 moreInfoRequired], @"g");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 fccStepUpRequired],  @"fcc_step_up_required");
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 termsAcceptanceRequired], @"h");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 termsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"i");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 privacyPolicyURL]);
  id v15 = (void *)_SQLValueForURL(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"k");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 businessChatIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"l");

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 contactWebsite]);
  v18 = (void *)_SQLValueForURL(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"m");

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 contactNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"n");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 routingNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"o");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 accountNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"p");

  return v4;
}

@end