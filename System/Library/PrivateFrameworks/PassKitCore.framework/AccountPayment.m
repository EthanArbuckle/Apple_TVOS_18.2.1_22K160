@interface AccountPayment
+ (id)_commonInitWithPayment:(id)a3 accountIdentifier:(id)a4;
+ (id)_paymentsFromQuery:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForFailedRecurringPaymentsWithAccountIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForScheduledPaymentsWithAccountIdentifier:(id)a3;
+ (id)_predicateForTransactionReferenceIdentifier:(id)a3;
+ (id)_predicateForTransactionServiceIdentifier:(id)a3;
+ (id)_propertySetterForFundingDetailsName;
+ (id)_propertySettersForAccountPayment;
+ (id)databaseTable;
+ (id)failedRecurringPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)insertPayment:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)insertScheduledPayment:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)paymentsForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)scheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deletePaymentWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteScheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (id)currencyAmount;
- (id)payment;
@end

@implementation AccountPayment

+ (id)paymentsForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionServiceIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsFromQuery:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"paymentDate",  0LL));
  v15[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"state",  0LL));
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingDescriptors:v12]);
  return v13;
}

+ (id)paymentsForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionReferenceIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsFromQuery:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"paymentDate",  0LL));
  v15[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"state",  0LL));
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingDescriptors:v12]);
  return v13;
}

+ (id)paymentsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsFromQuery:v8]);
  return v9;
}

+ (id)paymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsFromQuery:v8]);
  return v9;
}

+ (id)scheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduledPaymentsWithAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsFromQuery:v8]);
  return v9;
}

+ (id)failedRecurringPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFailedRecurringPaymentsWithAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsFromQuery:v8]);
  return v9;
}

+ (id)_paymentsFromQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"pid";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10010BC2C;
  v13 = &unk_100639E18;
  id v14 = v3;
  v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = -[NSMutableSet copy](v6, "copy", v10, v11, v12, v13);
  return v8;
}

+ (id)insertPayment:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonInitWithPayment:a3 accountIdentifier:a5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v11 setObject:v12 forKey:@"a"];

  id v13 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v10];
  return v13;
}

+ (id)insertScheduledPayment:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonInitWithPayment:a3 accountIdentifier:a4]);
  id v10 = [objc_alloc((Class)a1) initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)_commonInitWithPayment:(id)a3 accountIdentifier:(id)a4
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

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyAmount]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 amount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  [v7 setObjectOrNull:v14 forKey:@"c"];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyAmount]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currency]);
  [v7 setObjectOrNull:v16 forKey:@"d"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentDate]);
  v18 = (void *)_SQLValueForDate(v17);
  [v7 setObjectOrNull:v18 forKey:@"f"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentStatusDate]);
  v20 = (void *)_SQLValueForDate(v19);
  [v7 setObjectOrNull:v20 forKey:@"q"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "state"), @"h");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "statusCode"), @"k");
  objc_msgSend(v7, "setBool:forKey:", objc_msgSend(v5, "cancellable"), @"cancellable");
  v21 = (void *)objc_claimAutoreleasedReturnValue([v5 cancellationExpiryDate]);
  v22 = (void *)_SQLValueForDate(v21);
  [v7 setObjectOrNull:v22 forKey:@"cancellation_expiry_date"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 expectedCreditReleaseDate]);
  v24 = (void *)_SQLValueForDate(v23);
  [v7 setObjectOrNull:v24 forKey:@"w"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 fundingSource]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
  [v7 setObjectOrNull:v26 forKey:@"l"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v25, "type"), @"m");
  v27 = (void *)objc_claimAutoreleasedReturnValue([v25 accountSuffix]);
  [v7 setObjectOrNull:v27 forKey:@"n"];

  if ([v25 type] == (id)1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 fundingDetails]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
    [v7 setObjectOrNull:v29 forKey:@"v"];
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v5 scheduleDetails]);
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v30, "preset"), @"j");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v30, "frequency"), @"i");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v30, "scheduledDay"), @"u");
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 scheduledDate]);
  v32 = (void *)_SQLValueForDate(v31);
  [v7 setObjectOrNull:v32 forKey:@"r"];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v30 paymentTermsIdentifier]);
  [v7 setObjectOrNull:v33 forKey:@"s"];

  [v7 setObjectOrNull:v6 forKey:@"t"];
  return v7;
}

- (id)payment
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPayment);
  v4 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentFundingSource);
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentScheduleDetails);
  -[PKAccountPayment setFundingSource:](v3, "setFundingSource:", v4);
  -[PKAccountPayment setScheduleDetails:](v3, "setScheduleDetails:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPayment _propertySettersForAccountPayment]( &OBJC_CLASS___AccountPayment,  "_propertySettersForAccountPayment"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10010C3F8;
  v22[3] = &unk_100638EF0;
  id v8 = v6;
  id v23 = v8;
  v9 = v3;
  v24 = v9;
  v25 = self;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v22);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountPayment fundingSource](v9, "fundingSource"));
  id v11 = [v10 type];

  if (v11 == (id)1)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountPayment fundingSource](v9, "fundingSource"));
    [v13 setFundingDetails:v12];

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPayment _propertySetterForFundingDetailsName]( &OBJC_CLASS___AccountPayment,  "_propertySetterForFundingDetailsName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10010C454;
    v19[3] = &unk_100639EE8;
    id v20 = v14;
    v21 = v9;
    id v16 = v14;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v15, v19);
  }

  v17 = v9;

  return v17;
}

- (id)currencyAmount
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"));
    unsigned __int8 v8 = [v5 isEqualToNumber:v7];

    v9 = 0LL;
    if ((v8 & 1) == 0 && v6) {
      v9 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  v5,  v6,  0LL);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (void)deletePaymentWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteScheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduledPaymentsWithAccountIdentifier:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFailedRecurringPaymentsWithAccountIdentifier:v7]);

  v13[0] = v8;
  v13[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v11]);
  [v12 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"lychees";
}

+ (id)_predicateForTransactionServiceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));
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
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"t",  a3);
}

+ (id)_predicateForScheduledPaymentsWithAccountIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"h",  &off_10068FEA0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"a"));
  v9[0] = v3;
  v9[1] = v4;
  void v9[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 3LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));

  return v7;
}

+ (id)_predicateForFailedRecurringPaymentsWithAccountIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"h",  &off_10068FEB8));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"i",  &off_100690F98));
  v13[0] = v4;
  v13[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"a"));
  v12[0] = v3;
  v12[1] = v7;
  v12[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_propertySettersForAccountPayment
{
  v3[0] = @"b";
  v3[1] = @"e";
  v4[0] = &stru_100644748;
  v4[1] = &stru_100644768;
  v3[2] = @"p";
  v3[3] = @"f";
  v4[2] = &stru_100644788;
  v4[3] = &stru_1006447A8;
  v3[4] = @"q";
  v3[5] = @"h";
  v4[4] = &stru_1006447C8;
  v4[5] = &stru_1006447E8;
  v3[6] = @"k";
  v3[7] = @"cancellable";
  v4[6] = &stru_100644808;
  v4[7] = &stru_100644828;
  v3[8] = @"cancellation_expiry_date";
  v3[9] = @"w";
  v4[8] = &stru_100644848;
  v4[9] = &stru_100644868;
  v3[10] = @"l";
  v3[11] = @"m";
  v4[10] = &stru_100644888;
  v4[11] = &stru_1006448A8;
  v3[12] = @"n";
  v3[13] = @"i";
  v4[12] = &stru_1006448C8;
  v4[13] = &stru_1006448E8;
  v3[14] = @"u";
  v3[15] = @"j";
  v4[14] = &stru_100644908;
  v4[15] = &stru_100644928;
  v3[16] = @"r";
  v3[17] = @"s";
  v4[16] = &stru_100644948;
  v4[17] = &stru_100644968;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  18LL));
}

+ (id)_propertySetterForFundingDetailsName
{
  id v3 = @"v";
  uint64_t v4 = &stru_100644988;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end