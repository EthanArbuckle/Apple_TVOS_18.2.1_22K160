@interface SavingsAccountStatement
+ (id)_commonDictionaryForSavingsAccountStatement:(id)a3;
+ (id)_predicateForAccount:(id)a3;
+ (id)_predicateForNonNullStatementIdentifierForAccount:(id)a3;
+ (id)_predicateForNullStatementIdentifierForAccount:(id)a3;
+ (id)_predicateForStatement:(id)a3 account:(id)a4;
+ (id)_propertySettersForSavingsAccountStatement;
+ (id)_savingsAccountStatementWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5;
+ (id)_savingsAccountStatementsFromQuery:(id)a3;
+ (id)anyInDatabase:(id)a3 withStatementIdentifier:(id)a4 accountIdentifier:(id)a5;
+ (id)databaseTable;
+ (id)insertOrUpdateSavingsAccountStatement:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
+ (id)lastSavingsAccountStatementForAccount:(id)a3 inDatabase:(id)a4;
+ (id)savingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4;
+ (id)savingsStatementWithIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteSavingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountStatementsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)closingDate;
- (id)openingDate;
- (id)savingsAccountStatement;
@end

@implementation SavingsAccountStatement

+ (id)databaseTable
{
  return @"eggplant";
}

+ (id)insertOrUpdateSavingsAccountStatement:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(a1, v11), "_commonDictionaryForSavingsAccountStatement:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _savingsAccountStatementWithIdentifier:v14 account:v8 inDatabase:v9]);
  if (v15)
  {
    [v15 setValuesWithDictionary:v13];
    id v16 = v15;
  }

  else
  {
    [v13 setObjectOrNull:v8 forKey:@"n"];
    id v16 = [objc_alloc((Class)a1) initWithPropertyValues:v13 inDatabase:v9];
  }

  v17 = v16;

  return v17;
}

+ (id)lastSavingsAccountStatementForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNonNullStatementIdentifierForAccount:a3]);
  v15 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v14 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:1]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _savingsAccountStatementsFromQuery:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  return v12;
}

+ (id)savingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccount:a3]);
  v14 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v13 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _savingsAccountStatementsFromQuery:v10]);
  return v11;
}

+ (id)_savingsAccountStatementsFromQuery:(id)a3
{
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1001B2B70;
  id v10 = &unk_10063BCB0;
  id v11 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = -[NSMutableArray copy](v3, "copy", v7, v8, v9, v10);

  return v5;
}

+ (id)_savingsAccountStatementWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatement:a3 account:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)savingsStatementWithIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _savingsAccountStatementWithIdentifier:a3 account:a4 inDatabase:a5]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 savingsAccountStatement]);

  return v6;
}

+ (id)anyInDatabase:(id)a3 withStatementIdentifier:(id)a4 accountIdentifier:(id)a5
{
  return [a1 _savingsAccountStatementWithIdentifier:a4 account:a5 inDatabase:a3];
}

+ (void)deleteSavingsAccountStatementsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForNullStatementIdentifierForAccount:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteSavingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccount:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v2, "valueForProperty:", @"n"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[AccountStatementMetadata deleteAccountStatementMetadataForStatementIdentifier:accountIdentifier:inDatabase:]( &OBJC_CLASS___AccountStatementMetadata,  "deleteAccountStatementMetadataForStatementIdentifier:accountIdentifier:inDatabase:",  v3,  v4,  v5);

  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___SavingsAccountStatement;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForStatement:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"n",  a4));
  v11[0] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v5));

  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForAccount:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"n",  a3);
}

+ (id)_predicateForNullStatementIdentifierForAccount:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"n",  a3));
  v8[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"b"));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (id)_predicateForNonNullStatementIdentifierForAccount:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"n",  a3));
  v8[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"b"));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (id)_propertySettersForSavingsAccountStatement
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100649ED0;
  v4[1] = &stru_100649EF0;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100649F10;
  v4[3] = &stru_100649F30;
  v3[4] = @"o";
  v3[5] = @"f";
  v4[4] = &stru_100649F50;
  v4[5] = &stru_100649F70;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100649F90;
  v4[7] = &stru_100649FB0;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_100649FD0;
  v4[9] = &stru_100649FF0;
  v3[10] = @"l";
  v3[11] = @"p";
  v4[10] = &stru_10064A010;
  v4[11] = &stru_10064A030;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
}

- (id)savingsAccountStatement
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountStatement);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForSavingsAccountStatement");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001B3684;
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

- (id)openingDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)closingDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

+ (id)_commonDictionaryForSavingsAccountStatement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v6 = (void *)_SQLValueForString(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  id v8 = (void *)_SQLValueForString(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 openingDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"d");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 closingDate]);
  id v12 = (void *)_SQLValueForDate(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"e");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 openingBalance]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"o");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 closingBalance]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"f");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 interestEarned]);
  uint64_t v20 = PKCurrencyDecimalToStorageNumber(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"h");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 totalDeposits]);
  uint64_t v23 = PKCurrencyDecimalToStorageNumber(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"i");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 totalDailyCashDeposits]);
  uint64_t v26 = PKCurrencyDecimalToStorageNumber(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v27, @"j");

  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 totalWithdrawn]);
  uint64_t v29 = PKCurrencyDecimalToStorageNumber(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v30, @"k");

  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 apy]);
  uint64_t v32 = PKCurrencyDecimalToStorageNumber(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v33, @"l");

  id v34 = [v3 statementPeriodDays];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v34));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v35, @"p");

  return v4;
}

@end