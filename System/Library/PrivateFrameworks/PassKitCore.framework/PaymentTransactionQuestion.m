@interface PaymentTransactionQuestion
+ (id)_paymentTransactionQuestionsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentTransactionQuestionsWithQuery:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_predicateForPaymentTransactionIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_predicateForQuestionWithType:(int64_t)a3;
+ (id)_propertySettersForPaymentTransactionQuestion;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateQuestionsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePaymentTransactionQuestions:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionQuestion)initWithPaymentTransactionQuestion:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5;
- (void)updateWithPaymentTransactionQuestion:(id)a3;
@end

@implementation PaymentTransactionQuestion

- (PaymentTransactionQuestion)initWithPaymentTransactionQuestion:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"b");
  objc_msgSend(v11, "setBool:forKey:", objc_msgSend(v10, "answered"), @"d");
  objc_msgSend(v11, "setBool:forKey:", objc_msgSend(v10, "answeredOnThisDevice"), @"e");
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 expirationDate]);

  v13 = (void *)_SQLValueForDate(v12);
  [v11 setObjectOrNull:v13 forKey:@"c"];

  id v14 = [v9 persistentID];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
  [v11 setObject:v15 forKey:@"a"];

  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v16;
}

+ (id)databaseTable
{
  return @"mangos";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  id v9 = v7;
  if (v7 == @"payment_transaction.identifier"
    || v7
    && (unsigned int v8 = [@"payment_transaction.identifier" isEqualToString:v7],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN payment_transaction ON payment_transaction.pid = mangos.a"];
  }
}

- (void)updateWithPaymentTransactionQuestion:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v7, "type"), @"b");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 expirationDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  [v4 setObjectOrNull:v6 forKey:@"c"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (void)updatePaymentTransactionQuestions:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v28 = v9;
  v30 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:v9]);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForQuestionWithType:", objc_msgSend(v15, "type")));
        v39[0] = v16;
        v39[1] = v30;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
        id v19 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v18]);

        if (v19) {
          [v19 updateWithPaymentTransactionQuestion:v15];
        }
        else {
          id v19 = [objc_alloc((Class)a1) initWithPaymentTransactionQuestion:v15 paymentTransaction:v28 inDatabase:v10];
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 type]));
        -[NSMutableArray addObject:](v31, "addObject:", v20);
      }

      id v12 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v12);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v31));
  v38[0] = v21;
  v38[1] = v30;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v23]);
  if (([v24 deleteAllEntities] & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
      *(_DWORD *)buf = 138412290;
      v37 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Failed to delete obsolete payment transaction questions for %@",  buf,  0xCu);
    }
  }
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionQuestionsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionQuestionsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (void)associateQuestionsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPIDs:v8]);
  v26 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionQuestion,  "queryWithDatabase:predicate:",  v7,  v9));

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionQuestion]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:@"a"]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1003DB914;
  v31[3] = &unk_100639BF0;
  id v34 = a1;
  id v15 = v12;
  id v32 = v15;
  v16 = v11;
  __int128 v33 = v16;
  [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v31];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v17 = v16;
  id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v22]);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v17, "objectForKey:", v22));
        if ([v24 count])
        {
          id v25 = [v24 copy];
          [v23 setQuestions:v25];
        }

        else
        {
          [v23 setQuestions:0];
        }
      }

      id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    }

    while (v19);
  }
}

+ (id)_paymentTransactionQuestionsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionQuestion,  "queryWithDatabase:predicate:",  a3,  a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionQuestionsWithQuery:v5]);

  return v6;
}

+ (id)_paymentTransactionQuestionsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionQuestion]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003DBB3C;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)_predicateForQuestionWithType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction.identifier",  a3);
}

+ (id)_predicateForPaymentTransaction:(id)a3
{
  return objc_msgSend(a1, "_predicateForPaymentTransactionPID:", objc_msgSend(a3, "persistentID"));
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"a",  a3);
}

+ (id)_propertySettersForPaymentTransactionQuestion
{
  v3[0] = @"b";
  v3[1] = @"d";
  v4[0] = &stru_10065C8E0;
  v4[1] = &stru_10065C900;
  v3[2] = @"e";
  v3[3] = @"c";
  v4[2] = &stru_10065C920;
  v4[3] = &stru_10065C940;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end