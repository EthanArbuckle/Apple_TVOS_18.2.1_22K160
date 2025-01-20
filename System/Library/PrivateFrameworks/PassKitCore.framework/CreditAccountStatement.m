@interface CreditAccountStatement
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForAccountIdentifiers:(id)a3;
+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForCreditAccountStatement;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementsForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifiers:(id)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (id)insertCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)insertCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountStatementForEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountStatementsForAccount:(id)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6;
- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5;
- (id)closingDate;
- (id)creditAccountStatement;
- (id)openingDate;
- (void)populateDictionary:(id)a3 forStatement:(id)a4;
- (void)updateWithCreditAccountStatement:(id)a3;
@end

@implementation CreditAccountStatement

+ (id)databaseTable
{
  return @"pineapples";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountSummary, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, v4) == a3) {
    return @"t";
  }
  return 0LL;
}

- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  -[CreditAccountStatement populateDictionary:forStatement:](self, "populateDictionary:forStatement:", v10, v9);
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  return v12;
}

- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"s"];

  [v13 setObjectOrNull:v11 forKey:@"t"];
  -[CreditAccountStatement populateDictionary:forStatement:](self, "populateDictionary:forStatement:", v13, v12);

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v10);
  return v15;
}

- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v11 setObjectOrNull:v9 forKey:@"t"];

  -[CreditAccountStatement populateDictionary:forStatement:](self, "populateDictionary:forStatement:", v11, v10);
  id v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);

  return v12;
}

- (void)populateDictionary:(id)a3 forStatement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v8 = (void *)_SQLValueForString(v7);
  [v6 setObject:v8 forKey:@"b"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 openingDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  [v6 setObjectOrNull:v10 forKey:@"c"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 closingDate]);
  id v12 = (void *)_SQLValueForDate(v11);
  [v6 setObjectOrNull:v12 forKey:@"d"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentDueDate]);
  v14 = (void *)_SQLValueForDate(v13);
  [v6 setObjectOrNull:v14 forKey:@"e"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyCode]);
  v16 = (void *)_SQLValueForString(v15);
  [v6 setObjectOrNull:v16 forKey:@"f"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 statementBalance]);
  uint64_t v18 = PKCurrencyDecimalToStorageNumber(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v6 setObjectOrNull:v19 forKey:@"g"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 totalBalance]);
  uint64_t v21 = PKCurrencyDecimalToStorageNumber(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v6 setObjectOrNull:v22 forKey:@"total_balance"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 minimumDue]);
  uint64_t v24 = PKCurrencyDecimalToStorageNumber(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v6 setObjectOrNull:v25 forKey:@"h"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v5 purchases]);
  uint64_t v27 = PKCurrencyDecimalToStorageNumber(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v6 setObjectOrNull:v28 forKey:@"i"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 feesCharged]);
  uint64_t v30 = PKCurrencyDecimalToStorageNumber(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  [v6 setObjectOrNull:v31 forKey:@"j"];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v5 interestCharged]);
  uint64_t v33 = PKCurrencyDecimalToStorageNumber(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  [v6 setObjectOrNull:v34 forKey:@"k"];

  v35 = (void *)objc_claimAutoreleasedReturnValue([v5 balanceTransfers]);
  uint64_t v36 = PKCurrencyDecimalToStorageNumber(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  [v6 setObjectOrNull:v37 forKey:@"l"];

  v38 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentsAndCredits]);
  uint64_t v39 = PKCurrencyDecimalToStorageNumber(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  [v6 setObjectOrNull:v40 forKey:@"m"];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 payments]);
  uint64_t v42 = PKCurrencyDecimalToStorageNumber(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  [v6 setObjectOrNull:v43 forKey:@"u"];

  v44 = (void *)objc_claimAutoreleasedReturnValue([v5 credits]);
  uint64_t v45 = PKCurrencyDecimalToStorageNumber(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  [v6 setObjectOrNull:v46 forKey:@"v"];

  v47 = (void *)objc_claimAutoreleasedReturnValue([v5 rewardsBalance]);
  uint64_t v48 = PKCurrencyDecimalToStorageNumber(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  [v6 setObjectOrNull:v49 forKey:@"n"];

  v50 = (void *)objc_claimAutoreleasedReturnValue([v5 rewardsEarned]);
  uint64_t v51 = PKCurrencyDecimalToStorageNumber(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  [v6 setObjectOrNull:v52 forKey:@"o"];

  v53 = (void *)objc_claimAutoreleasedReturnValue([v5 rewardsRedeemed]);
  uint64_t v54 = PKCurrencyDecimalToStorageNumber(v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  [v6 setObjectOrNull:v55 forKey:@"p"];

  v56 = (void *)objc_claimAutoreleasedReturnValue([v5 rewardsYTD]);
  uint64_t v57 = PKCurrencyDecimalToStorageNumber(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  [v6 setObjectOrNull:v58 forKey:@"q"];

  id v61 = (id)objc_claimAutoreleasedReturnValue([v5 rewardsLifetime]);
  uint64_t v59 = PKCurrencyDecimalToStorageNumber(v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  [v6 setObjectOrNull:v60 forKey:@"r"];
}

+ (id)insertCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountStatement:v9 forCreditAccountSummaryPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountSummaryPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)creditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creditAccountStatement]);
  return v9;
}

+ (id)insertCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 creditAccountStatementsWithIdentifier:v13 withAccountIdentifier:v11 inDatabase:v12]);

  if ([v14 count])
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      id v17 = v16;
      id v18 = 0LL;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          if (v18) {
            objc_msgSend(v21, "deleteFromDatabase", (void)v24);
          }
          else {
            id v18 = v21;
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v17);
    }

    else
    {
      id v18 = 0LL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    [v18 setValue:v22 forProperty:@"s"];

    [v18 updateWithCreditAccountStatement:v10];
  }

  else
  {
    id v18 = [objc_alloc((Class)a1) initWithCreditAccountStatement:v10 forEventPID:a4 withAccountIdentifier:v11 inDatabase:v12];
  }

  return v18;
}

+ (void)deleteCreditAccountStatementForEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v2, "valueForProperty:", @"t"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[AccountStatementMetadata deleteAccountStatementMetadataForStatementIdentifier:accountIdentifier:inDatabase:]( &OBJC_CLASS___AccountStatementMetadata,  "deleteAccountStatementMetadataForStatementIdentifier:accountIdentifier:inDatabase:",  v3,  v4,  v5);

  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___CreditAccountStatement;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

+ (id)creditAccountStatementsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v21 = @"pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100156F2C;
  id v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)creditAccountStatementsForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v21 = @"pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1001570EC;
  id v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 creditAccountStatementsWithIdentifier:v11 withAccountIdentifier:v9 inDatabase:v10]);

  if ([v12 count])
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      id v16 = 0LL;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if (v16) {
            objc_msgSend(v19, "deleteFromDatabase", (void)v21);
          }
          else {
            id v16 = v19;
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v15);
    }

    else
    {
      id v16 = 0LL;
    }

    [v16 updateWithCreditAccountStatement:v8];
  }

  else
  {
    id v16 = [objc_alloc((Class)a1) initWithCreditAccountStatement:v8 withAccountIdentifier:v9 inDatabase:v10];
  }

  return v16;
}

+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 creditAccountStatementsWithIdentifier:v9 withAccountIdentifiers:v10 inDatabase:v8]);

  return v11;
}

+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifiers:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  v28[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifiers:v9]);

  v28[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v13]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v27 = @"pid";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  __int128 v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  __int128 v23 = sub_10015755C;
  __int128 v24 = &unk_100639E18;
  id v25 = v8;
  id v26 = v15;
  id v17 = v15;
  id v18 = v8;
  [v14 enumeratePersistentIDsAndProperties:v16 usingBlock:&v21];

  id v19 = objc_msgSend(v17, "copy", v21, v22, v23, v24);
  return v19;
}

+ (id)creditAccountStatementWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deleteCreditAccountStatementsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)updateCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountSummaryPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithCreditAccountStatement:v12];
  }
  else {
    id v11 =  +[CreditAccountStatement insertCreditAccountStatement:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "insertCreditAccountStatement:forCreditAccountSummaryPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithCreditAccountStatement:(id)a3
{
  id v4 = a3;
  id v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v6 = (void *)_SQLValueForString(v5);
  [v60 setObject:v6 forKey:@"b"];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 openingDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  [v60 setObjectOrNull:v8 forKey:@"c"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 closingDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  [v60 setObjectOrNull:v10 forKey:@"d"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentDueDate]);
  id v12 = (void *)_SQLValueForDate(v11);
  [v60 setObjectOrNull:v12 forKey:@"e"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyCode]);
  id v14 = (void *)_SQLValueForString(v13);
  [v60 setObjectOrNull:v14 forKey:@"f"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 statementBalance]);
  id v16 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v15));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v60 setObjectOrNull:v17 forKey:@"g"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 totalBalance]);
  id v19 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v18));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v60 setObjectOrNull:v20 forKey:@"total_balance"];

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 minimumDue]);
  uint64_t v22 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v21));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v60 setObjectOrNull:v23 forKey:@"h"];

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v4 purchases]);
  id v25 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v24));
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v60 setObjectOrNull:v26 forKey:@"i"];

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v4 feesCharged]);
  v28 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v27));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v60 setObjectOrNull:v29 forKey:@"j"];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v4 interestCharged]);
  v31 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v60 setObjectOrNull:v32 forKey:@"k"];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v4 balanceTransfers]);
  v34 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v33));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  [v60 setObjectOrNull:v35 forKey:@"l"];

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentsAndCredits]);
  v37 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v36));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  [v60 setObjectOrNull:v38 forKey:@"m"];

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v4 payments]);
  v40 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v39));
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  [v60 setObjectOrNull:v41 forKey:@"u"];

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v4 credits]);
  v43 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v42));
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  [v60 setObjectOrNull:v44 forKey:@"v"];

  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsBalance]);
  v46 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  [v60 setObjectOrNull:v47 forKey:@"n"];

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsEarned]);
  v49 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v48));
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  [v60 setObjectOrNull:v50 forKey:@"o"];

  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsRedeemed]);
  v52 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v51));
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  [v60 setObjectOrNull:v53 forKey:@"p"];

  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsYTD]);
  v55 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v54));
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  [v60 setObjectOrNull:v56 forKey:@"q"];

  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsLifetime]);
  v58 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  PKCurrencyDecimalToStorageInteger(v57));
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  [v60 setObjectOrNull:v59 forKey:@"r"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v60);
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"s",  v3));

  return v4;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"t",  a3);
}

+ (id)_predicateForAccountIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"t",  a3);
}

+ (id)_propertySettersForCreditAccountStatement
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_1006465A8;
  v4[1] = &stru_1006465C8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_1006465E8;
  v4[3] = &stru_100646608;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100646628;
  v4[5] = &stru_100646648;
  v3[6] = @"total_balance";
  v3[7] = @"h";
  v4[6] = &stru_100646668;
  v4[7] = &stru_100646688;
  v3[8] = @"i";
  v3[9] = @"j";
  v4[8] = &stru_1006466A8;
  v4[9] = &stru_1006466C8;
  v3[10] = @"k";
  v3[11] = @"l";
  v4[10] = &stru_1006466E8;
  v4[11] = &stru_100646708;
  v3[12] = @"m";
  v3[13] = @"u";
  v4[12] = &stru_100646728;
  v4[13] = &stru_100646748;
  v3[14] = @"v";
  v3[15] = @"n";
  v4[14] = &stru_100646768;
  v4[15] = &stru_100646788;
  v3[16] = @"o";
  v3[17] = @"p";
  v4[16] = &stru_1006467A8;
  v4[17] = &stru_1006467C8;
  v3[18] = @"q";
  v3[19] = @"r";
  v4[18] = &stru_1006467E8;
  v4[19] = &stru_100646808;
  v3[20] = @"t";
  v4[20] = &stru_100646828;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  21LL));
}

- (id)creditAccountStatement
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountStatement);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountStatement");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100158698;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)openingDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)closingDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

@end