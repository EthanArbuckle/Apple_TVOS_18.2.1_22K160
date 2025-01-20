@interface CreditInstallmentPlanPayment
+ (id)_paymentsWithQuery:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanPayment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayments:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)paymentWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deletePaymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (CreditInstallmentPlanPayment)initWithInstallmentPlanPayment:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)payment;
- (void)updateWithPayment:(id)a3;
@end

@implementation CreditInstallmentPlanPayment

+ (id)databaseTable
{
  return @"raisin";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditInstallmentPlan, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditInstallmentPlanPayment)initWithInstallmentPlanPayment:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlanPayment:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  -[SQLiteEntity setValue:forProperty:](v14, "setValue:forProperty:", v9, @"a");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v14, "persistentID")));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 lineItems]);

  id v17 =  +[CreditInstallmentPlanLineItem insertOrUpdateLineItems:forInstallmentPlanPaymentPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "insertOrUpdateLineItems:forInstallmentPlanPaymentPID:inDatabase:",  v16,  v15,  v8);
  return v14;
}

+ (id)paymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentsWithQuery:v8]);
  return v9;
}

+ (id)paymentWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 payment]);
  return v9;
}

+ (id)insertOrUpdatePayments:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a5;
  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v16]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v17]);
        if (v18)
        {
          id v19 = v18;
          [v18 updateWithPayment:v15];
        }

        else
        {
          id v19 = [objc_alloc((Class)a1) initWithInstallmentPlanPayment:v15 forInstallmentPlanPID:v27 inDatabase:v9];
        }

        -[NSMutableSet addObject:](v29, "addObject:", v16);
        -[NSMutableSet addObject:](v10, "addObject:", v19);
      }

      id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v12);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v29));
  v34[0] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:v27]);
  v34[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v23]);
  [v24 deleteAllEntities];
  if (-[NSMutableSet count](v10, "count")) {
    id v25 = -[NSMutableSet copy](v10, "copy");
  }
  else {
    id v25 = 0LL;
  }

  return v25;
}

- (void)updateWithPayment:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForInstallmentPlanPayment:", v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 lineItems]);

  id v10 =  +[CreditInstallmentPlanLineItem insertOrUpdateLineItems:forInstallmentPlanPaymentPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "insertOrUpdateLineItems:forInstallmentPlanPaymentPID:inDatabase:",  v9,  v7,  v8);
}

- (id)payment
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "_propertySetters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlanPayment);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100004A24;
  v17[3] = &unk_100638EF0;
  v17[4] = self;
  id v7 = v4;
  id v18 = v7;
  id v8 = v5;
  id v19 = v8;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v6, v17);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CreditInstallmentPlanLineItem lineItemsForInstallmentPlanPaymentPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "lineItemsForInstallmentPlanPaymentPID:inDatabase:",  v9,  v10));
  -[PKCreditInstallmentPlanPayment setLineItems:](v8, "setLineItems:", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountStatement creditAccountStatementWithIdentifier:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "creditAccountStatementWithIdentifier:inDatabase:",  v12,  v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 creditAccountStatement]);

    -[PKCreditInstallmentPlanPayment setStatement:](v8, "setStatement:", v14);
  }

  v15 = v8;

  return v15;
}

+ (void)deletePaymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[CreditInstallmentPlanLineItem deleteLineItemsForInstallmentPlanPaymentPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "deleteLineItemsForInstallmentPlanPaymentPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___CreditInstallmentPlanPayment;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_paymentsWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_100004CD8;
  v16 = &unk_100638F18;
  id v20 = a1;
  id v17 = v5;
  id v18 = v4;
  id v8 = v6;
  id v19 = v8;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  if (-[NSMutableSet count](v8, "count", v13, v14, v15, v16)) {
    id v11 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)_propertyValuesForInstallmentPlanPayment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 statementIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 amountDue]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 amountPaid]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"f");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 dueDate]);
  v15 = (void *)_SQLValueForDate(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"g");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 statementDate]);
  id v17 = (void *)_SQLValueForDate(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"k");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 originalAmountDue]);
  uint64_t v19 = PKCurrencyDecimalToStorageNumber();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"h");

  id v21 = [v3 paymentNumber];
  if (v21) {
    -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v21, @"i");
  }
  id v22 = [v3 paymentCount];
  if (v22) {
    -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v22, @"j");
  }
  id v23 = -[NSMutableDictionary copy](v4, "copy");

  return v23;
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100638F58;
  v4[1] = &stru_100638F78;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100638F98;
  v4[3] = &stru_100638FB8;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100638FD8;
  v4[5] = &stru_100638FF8;
  v3[6] = @"k";
  v3[7] = @"h";
  v4[6] = &stru_100639018;
  v4[7] = &stru_100639038;
  v3[8] = @"i";
  v3[9] = @"j";
  v4[8] = &stru_100639058;
  v4[9] = &stru_100639078;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL));
}

@end