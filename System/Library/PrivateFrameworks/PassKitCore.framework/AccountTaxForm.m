@interface AccountTaxForm
+ (id)_accountTaxFormWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5;
+ (id)_commonDictionaryForAccountTaxForm:(id)a3;
+ (id)_predicateForAccount:(id)a3;
+ (id)_predicateForNonNullTaxFormIdentifierForAccount:(id)a3;
+ (id)_predicateForNullTaxFormIdentifierForAccount:(id)a3;
+ (id)_predicateForTaxForm:(id)a3 account:(id)a4;
+ (id)_propertySettersForAccountTaxForm;
+ (id)_taxFormsFromQuery:(id)a3;
+ (id)accountTaxFormsForAccount:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountTaxForm:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
+ (id)lastAccountTaxFormForAccount:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountTaxFormsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4;
- (id)taxForm;
@end

@implementation AccountTaxForm

+ (id)databaseTable
{
  return @"potato";
}

+ (id)insertOrUpdateAccountTaxForm:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonDictionaryForAccountTaxForm:v10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountTaxFormWithIdentifier:v12 account:v8 inDatabase:v9]);
  if (v13)
  {
    [v13 setValuesWithDictionary:v11];
    id v14 = v13;
  }

  else
  {
    [v11 setObjectOrNull:v8 forKey:@"f"];
    id v14 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v9];
  }

  v15 = v14;

  return v15;
}

+ (id)lastAccountTaxFormForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNonNullTaxFormIdentifierForAccount:a3]);
  v15 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v14 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:1]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _taxFormsFromQuery:v10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);

  return v12;
}

+ (id)accountTaxFormsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccount:a3]);
  id v14 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v13 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _taxFormsFromQuery:v10]);
  return v11;
}

+ (id)_taxFormsFromQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"pid";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100235CAC;
  v13 = &unk_100639E18;
  id v14 = v3;
  v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = -[NSMutableSet copy](v6, "copy", v10, v11, v12, v13);
  return v8;
}

+ (id)_accountTaxFormWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTaxForm:a3 account:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (void)deleteAccountTaxFormsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForNullTaxFormIdentifierForAccount:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForTaxForm:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  a4));
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v5));

  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForAccount:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  a3);
}

+ (id)_predicateForNullTaxFormIdentifierForAccount:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  a3));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"b"));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (id)_predicateForNonNullTaxFormIdentifierForAccount:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  a3));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"b"));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (id)_propertySettersForAccountTaxForm
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064E578;
  v4[1] = &stru_10064E598;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10064E5B8;
  v4[3] = &stru_10064E5D8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

- (id)taxForm
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAccountTaxForm);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountTaxForm _propertySettersForAccountTaxForm]( &OBJC_CLASS___AccountTaxForm,  "_propertySettersForAccountTaxForm"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_100236368;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_commonDictionaryForAccountTaxForm:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 type], @"c");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 openingDate]);
  id v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 closingDate]);
  id v9 = (void *)_SQLValueForDate(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  return v4;
}

@end