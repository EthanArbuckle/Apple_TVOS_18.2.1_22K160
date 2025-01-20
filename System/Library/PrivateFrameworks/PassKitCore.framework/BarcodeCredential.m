@interface BarcodeCredential
+ (BOOL)removeAllBarcodeCredentialValuesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (BOOL)removeAllBarcodeCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)_barcodeCredentialsForQuery:(id)a3;
+ (id)_predicateForBarcodeCredentialWithValue:(BOOL)a3;
+ (id)_predicateForBarcodeIdentifier:(id)a3;
+ (id)_predicateForDisplayedAfterDate:(id)a3;
+ (id)_predicateForDisplayedBarcodeCredential;
+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3;
+ (id)_predicateForUndisplayedBarcodeCredential;
+ (id)_predicateForUnexpiredBarcodeCredential;
+ (id)_propertySettersForBarcodeCredential;
+ (id)_queryForLastUsedBarcodeIdentifierForPaymentApplicationPID:(int64_t)a3 database:(id)a4;
+ (id)_queryForNumberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_queryForValidBarcodeCredeitialsWithLimit:(int64_t)a3 paymentApplicationPID:(int64_t)a4 database:(id)a5;
+ (id)anyInDatabase:(id)a3 withBarcodeIdentifier:(id)a4;
+ (id)databaseTable;
+ (id)firstValidBarcodeCredentialForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)insertBarcodeCredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (id)lastUsedBarcodeIdentifierForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (unint64_t)numberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplication:(id)a4 inDatabase:(id)a5;
+ (unint64_t)numberOfValidCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4;
- (BOOL)updateWithDisplayTimestamp:(id)a3;
- (BarcodeCredential)initWithBarcodeCredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
- (id)barcodeCredential;
@end

@implementation BarcodeCredential

+ (id)anyInDatabase:(id)a3 withBarcodeIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBarcodeIdentifier:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)firstValidBarcodeCredentialForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_queryForValidBarcodeCredeitialsWithLimit:paymentApplicationPID:database:",  1,  objc_msgSend(a3, "persistentID"),  v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[BarcodeCredential _barcodeCredentialsForQuery:]( &OBJC_CLASS___BarcodeCredential,  "_barcodeCredentialsForQuery:",  v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  return v9;
}

+ (id)lastUsedBarcodeIdentifierForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_queryForLastUsedBarcodeIdentifierForPaymentApplicationPID:database:",  objc_msgSend(a3, "persistentID"),  v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[BarcodeCredential _barcodeCredentialsForQuery:]( &OBJC_CLASS___BarcodeCredential,  "_barcodeCredentialsForQuery:",  v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:@"a"]);

  return v10;
}

+ (unint64_t)numberOfValidCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_queryForValidBarcodeCredeitialsWithLimit:paymentApplicationPID:database:",  0,  objc_msgSend(a3, "persistentID"),  v6));

  id v8 = [v7 countOfEntities];
  return (unint64_t)v8;
}

+ (unint64_t)numberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_queryForNumberOfBarcodeCredentialsDisplayedAfterDate:paymentApplicationPID:inDatabase:",  v9,  objc_msgSend(a4, "persistentID"),  v8));

  id v11 = [v10 countOfEntities];
  return (unint64_t)v11;
}

+ (BOOL)removeAllBarcodeCredentialValuesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE %@ SET %@ = NULL WHERE %@ IS NOT NULL AND %@ = ?",  v8,  @"d",  @"d",  @"e"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100397580;
  v12[3] = &unk_10063D460;
  id v10 = v6;
  id v13 = v10;
  v14 = &v15;
  sub_1002CCDBC((uint64_t)v7, v9, v12);
  LOBYTE(v8) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v8;
}

+ (BOOL)removeAllBarcodeCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM %@ WHERE %@ = ?",  v8,  @"e"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100397724;
  v12[3] = &unk_10063D460;
  id v10 = v6;
  id v13 = v10;
  v14 = &v15;
  sub_1002CCDBC((uint64_t)v7, v9, v12);
  LOBYTE(v8) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v8;
}

+ (id)insertBarcodeCredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  id v12 = 0LL;
  if (v9 && v11)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1003978C8;
    v16[3] = &unk_100640EE0;
    id v17 = v8;
    v14 = v13;
    char v18 = v14;
    id v21 = a1;
    id v19 = v9;
    id v20 = v10;
    sub_1002CCC5C((uint64_t)v20, v16);
    if (-[NSMutableArray count](v14, "count")) {
      id v12 = -[NSMutableArray copy](v14, "copy");
    }
    else {
      id v12 = 0LL;
    }
  }

  return v12;
}

- (BarcodeCredential)initWithBarcodeCredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v6 = 0LL;
  if (a3 && a4)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    v14 = (void *)_SQLValueForString(v13);
    -[NSMutableDictionary setObjectOrNull:forKey:](v12, "setObjectOrNull:forKey:", v14, @"a");

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 expirationTimestamp]);
    v16 = (void *)_SQLValueForDate(v15);
    -[NSMutableDictionary setObjectOrNull:forKey:](v12, "setObjectOrNull:forKey:", v16, @"b");

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
    id v18 = v17;
    if (!v18
      || (id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  1LL,  0LL))) == 0LL)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }

    -[NSMutableDictionary setObjectOrNull:forKey:](v12, "setObjectOrNull:forKey:", v19, @"d");
    id v20 = [v10 persistentID];

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v20));
    -[NSMutableDictionary setObjectOrNull:forKey:](v12, "setObjectOrNull:forKey:", v21, @"e");

    v22 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v9);
    self = v22;

    id v6 = self;
  }

  return v6;
}

- (id)barcodeCredential
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKBarcodeCredential);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[BarcodeCredential _propertySettersForBarcodeCredential]( &OBJC_CLASS___BarcodeCredential,  "_propertySettersForBarcodeCredential"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100397C8C;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (BOOL)updateWithDisplayTimestamp:(id)a3
{
  v4 = (void *)_SQLValueForDate(a3);
  LOBYTE(self) = -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"c");

  return (char)self;
}

+ (id)_predicateForUnexpiredBarcodeCredential
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = (void *)_SQLValueForDate(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForUndisplayedBarcodeCredential
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"c");
}

+ (id)_predicateForDisplayedBarcodeCredential
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"c");
}

+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  v3));

  return v4;
}

+ (id)_predicateForBarcodeCredentialWithValue:(BOOL)a3
{
  if (a3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"d"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"d"));
  }
  return v3;
}

+ (id)_predicateForBarcodeIdentifier:(id)a3
{
  v3 = (void *)_SQLValueForString(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForDisplayedAfterDate:(id)a3
{
  v3 = (void *)_SQLValueForDate(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanValue:",  @"c",  v3));

  return v4;
}

+ (id)_queryForValidBarcodeCredeitialsWithLimit:(int64_t)a3 paymentApplicationPID:(int64_t)a4 database:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBarcodeCredentialWithValue:1]);
  v21[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForUnexpiredBarcodeCredential]);
  v21[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForUndisplayedBarcodeCredential]);
  v21[2] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPersistentID:a4]);
  v21[3] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  v20[0] = @"b";
  v20[1] = @"a";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  v19[0] = @"ASC";
  v19[1] = @"ASC";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___BarcodeCredential,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v14,  v15,  v16,  a3));

  return v17;
}

+ (id)_queryForLastUsedBarcodeIdentifierForPaymentApplicationPID:(int64_t)a3 database:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisplayedBarcodeCredential]);
  v17[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPersistentID:a3]);
  v17[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  v16 = @"c";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  uint64_t v15 = @"DESC";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___BarcodeCredential,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v6,  v10,  v11,  v12,  1LL));

  return v13;
}

+ (id)_queryForNumberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPersistentID:a4]);
  v16[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisplayedAfterDate:v9]);

  v16[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___BarcodeCredential,  "queryWithDatabase:predicate:",  v8,  v13));
  return v14;
}

+ (id)databaseTable
{
  return @"e_mei_shan";
}

+ (id)_propertySettersForBarcodeCredential
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100659B50;
  v4[1] = &stru_100659B70;
  v3[2] = @"d";
  v4[2] = &stru_100659B90;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

+ (id)_barcodeCredentialsForQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1003985A8;
  id v10 = &unk_10063BCB0;
  id v11 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = -[NSMutableArray copy](v3, "copy", v7, v8, v9, v10);

  return v5;
}

@end