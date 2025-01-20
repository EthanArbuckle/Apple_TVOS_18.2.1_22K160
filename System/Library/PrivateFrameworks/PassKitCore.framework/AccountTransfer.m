@interface AccountTransfer
+ (id)_commonInitWithTransfer:(id)a3 accountIdentifier:(id)a4;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForNoEventPID;
+ (id)_predicateForTransactionReferenceIdentifier:(id)a3;
+ (id)_predicateForTransactionServiceIdentifier:(id)a3;
+ (id)_propertySetterForFundingDetailsName;
+ (id)_propertySettersForAccountTransfer;
+ (id)_transfersFromQuery:(id)a3;
+ (id)databaseTable;
+ (id)insertTransfer:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)insertTransfer:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)transfersForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)transfersForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)transfersWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteTransferWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteTransfersWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (id)transfer;
@end

@implementation AccountTransfer

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"grapes.d"
    || v7
    && (unsigned int v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"grapes.d"),
        v9,
        v8))
  {
    [v6 addObject:@"LEFT JOIN grapes ON grapes.pid = zucchini.a"];
  }
}

+ (id)transfersForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionServiceIdentifier:a3]);
  v14 = @"grapes.d";
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v13 = @"DESC";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _transfersFromQuery:v10]);
  return v11;
}

+ (id)transfersForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionReferenceIdentifier:a3]);
  v14 = @"grapes.d";
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v13 = @"DESC";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _transfersFromQuery:v10]);
  return v11;
}

+ (id)transfersWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _transfersFromQuery:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  return v10;
}

+ (id)_transfersFromQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v13[0] = @"pid";
  v13[1] = @"grapes.d";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002265B8;
  v10[3] = &unk_100639E18;
  id v11 = v3;
  v12 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:v10];

  id v8 = -[NSMutableArray copy](v6, "copy");
  return v8;
}

+ (id)insertTransfer:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonInitWithTransfer:a3 accountIdentifier:a5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v11 setObject:v12 forKey:@"a"];

  id v13 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v10];
  return v13;
}

+ (id)insertTransfer:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonInitWithTransfer:a3 accountIdentifier:a4]);
  id v10 = [objc_alloc((Class)a1) initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)_commonInitWithTransfer:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  [v7 setObjectOrNull:v8 forKey:@"b"];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 referenceIdentifier]);
  [v7 setObjectOrNull:v9 forKey:@"e"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 clientReferenceIdentifier]);
  [v7 setObjectOrNull:v10 forKey:@"p"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyAmount]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 amount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  [v7 setObjectOrNull:v14 forKey:@"c"];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 holdAmount]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 amount]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  [v7 setObjectOrNull:v18 forKey:@"y"];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyAmount]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currency]);
  [v7 setObjectOrNull:v20 forKey:@"d"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "type"), @"g");
  v21 = (void *)objc_claimAutoreleasedReturnValue([v5 transferDate]);
  v22 = (void *)_SQLValueForDate(v21);
  [v7 setObjectOrNull:v22 forKey:@"f"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 transferStatusDate]);
  v24 = (void *)_SQLValueForDate(v23);
  [v7 setObjectOrNull:v24 forKey:@"q"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "state"), @"h");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "statusCode"), @"k");
  objc_msgSend(v7, "setBool:forKey:", objc_msgSend(v5, "cancellable"), @"w");
  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 cancellationExpiryDate]);
  v26 = (void *)_SQLValueForDate(v25);
  [v7 setObjectOrNull:v26 forKey:@"x"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v5 expectedCompletionDate]);
  v28 = (void *)_SQLValueForDate(v27);
  [v7 setObjectOrNull:v28 forKey:@"z"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 externalAccount]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
  [v7 setObjectOrNull:v30 forKey:@"l"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v29, "type"), @"m");
  v31 = (void *)objc_claimAutoreleasedReturnValue([v29 accountSuffix]);
  [v7 setObjectOrNull:v31 forKey:@"n"];

  if ([v29 type] == (id)1 || objc_msgSend(v29, "type") == (id)5)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v29 fundingDetails]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 name]);
    [v7 setObjectOrNull:v33 forKey:@"v"];
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v5 scheduleDetails]);
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v34, "frequency"), @"i");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v34, "scheduledDay"), @"u");
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 scheduledDate]);
  v36 = (void *)_SQLValueForDate(v35);
  [v7 setObjectOrNull:v36 forKey:@"r"];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v34 transferTermsIdentifier]);
  [v7 setObjectOrNull:v37 forKey:@"s"];

  [v7 setObjectOrNull:v6 forKey:@"t"];
  return v7;
}

- (id)transfer
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAccountTransfer);
  id v4 = objc_alloc_init(&OBJC_CLASS___PKAccountTransferExternalAccount);
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAccountTransferScheduleDetails);
  -[PKAccountTransfer setExternalAccount:](v3, "setExternalAccount:", v4);
  -[PKAccountTransfer setScheduleDetails:](v3, "setScheduleDetails:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AccountTransfer _propertySettersForAccountTransfer]( &OBJC_CLASS___AccountTransfer,  "_propertySettersForAccountTransfer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v8 = [v7 mutableCopy];

  id v9 = [v8 count];
  [v8 addObject:@"d"];
  id v10 = [v8 count];
  [v8 addObject:@"c"];
  id v11 = [v8 count];
  [v8 addObject:@"y"];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100226E74;
  v28[3] = &unk_10064D5A8;
  id v12 = v6;
  id v29 = v12;
  uint64_t v13 = v3;
  v30 = v13;
  id v31 = v9;
  id v32 = v10;
  id v33 = v11;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v8, v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountTransfer externalAccount](v13, "externalAccount"));
  if ([v14 type] == (id)1)
  {

LABEL_4:
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountTransfer externalAccount](v13, "externalAccount"));
    [v18 setFundingDetails:v17];

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[AccountTransfer _propertySetterForFundingDetailsName]( &OBJC_CLASS___AccountTransfer,  "_propertySetterForFundingDetailsName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allKeys]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100226FC4;
    v25[3] = &unk_100639EE8;
    id v26 = v19;
    v27 = v13;
    id v21 = v19;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v20, v25);

    goto LABEL_5;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountTransfer externalAccount](v13, "externalAccount"));
  id v16 = [v15 type];

  if (v16 == (id)5) {
    goto LABEL_4;
  }
LABEL_5:
  v22 = v30;
  v23 = v13;

  return v23;
}

+ (void)deleteTransferWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteTransfersWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNoEventPID]);
  v13[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:v7]);

  v13[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v11]);
  [v12 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"zucchini";
}

+ (id)_predicateForTransactionServiceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));
  v9[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  v3));

  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));

  return v7;
}

+ (id)_predicateForTransactionReferenceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"p",  a3);
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForNoEventPID
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"a");
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"t",  a3);
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_propertySettersForAccountTransfer
{
  v3[0] = @"b";
  v3[1] = @"e";
  v4[0] = &stru_10064D5E8;
  v4[1] = &stru_10064D608;
  v3[2] = @"p";
  v3[3] = @"g";
  v4[2] = &stru_10064D628;
  v4[3] = &stru_10064D648;
  v3[4] = @"f";
  v3[5] = @"q";
  v4[4] = &stru_10064D668;
  v4[5] = &stru_10064D688;
  v3[6] = @"h";
  v3[7] = @"k";
  v4[6] = &stru_10064D6A8;
  v4[7] = &stru_10064D6C8;
  v3[8] = @"w";
  v3[9] = @"x";
  v4[8] = &stru_10064D6E8;
  v4[9] = &stru_10064D708;
  v3[10] = @"z";
  v3[11] = @"l";
  v4[10] = &stru_10064D728;
  v4[11] = &stru_10064D748;
  v3[12] = @"m";
  v3[13] = @"n";
  v4[12] = &stru_10064D768;
  v4[13] = &stru_10064D788;
  v3[14] = @"i";
  v3[15] = @"u";
  v4[14] = &stru_10064D7A8;
  v4[15] = &stru_10064D7C8;
  v3[16] = @"r";
  v3[17] = @"s";
  v4[16] = &stru_10064D7E8;
  v4[17] = &stru_10064D808;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  18LL));
}

+ (id)_propertySetterForFundingDetailsName
{
  id v3 = @"v";
  id v4 = &stru_10064D828;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end