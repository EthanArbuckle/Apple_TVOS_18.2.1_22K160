@interface CreditInstallmentPlan
+ (id)_installmentPlansWithQuery:(id)a3;
+ (id)_predicateForCreditAccountDetailsPID:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForTransactionReferenceIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlan:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateInstallmentPlans:(id)a3 forCreditAccountDetailsPID:(id)a4 inDatabase:(id)a5;
+ (id)installmentPlansForCreditAccountDetailsPID:(id)a3 inDatabase:(id)a4;
+ (id)installmentPlansWithTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteInstallmentPlansForCreditAccountDetailsPID:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (CreditInstallmentPlan)initWithInstallmentPlan:(id)a3 forCreditAccountDetailsPID:(id)a4 inDatabase:(id)a5;
- (id)installmentPlan;
- (void)updateWithInstallmentPlan:(id)a3;
@end

@implementation CreditInstallmentPlan

+ (id)databaseTable
{
  return @"kiwi";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditInstallmentPlan)initWithInstallmentPlan:(id)a3 forCreditAccountDetailsPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlan:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  -[SQLiteEntity setValue:forProperty:](v14, "setValue:forProperty:", v9, @"a");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v14, "persistentID")));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 lineItems]);
  id v17 =  +[CreditInstallmentPlanLineItem insertOrUpdateLineItems:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "insertOrUpdateLineItems:forInstallmentPlanPID:inDatabase:",  v16,  v15,  v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 payments]);
  id v19 = [v18 count];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v10 payments]);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000764F0;
  v32[3] = &unk_10063DE20;
  v32[4] = v19;
  [v20 enumerateObjectsUsingBlock:v32];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 payments]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));
  id v23 =  +[CreditInstallmentPlanPayment insertOrUpdatePayments:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanPayment,  "insertOrUpdatePayments:forInstallmentPlanPID:inDatabase:",  v22,  v15,  v8);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 merchant]);
  id v25 =  +[InstallmentPlanMerchant insertOrUpdateMerchant:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanMerchant,  "insertOrUpdateMerchant:forInstallmentPlanPID:inDatabase:",  v24,  v15,  v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v10 product]);
  id v27 =  +[CreditInstallmentPlanProduct insertOrUpdateProduct:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProduct,  "insertOrUpdateProduct:forInstallmentPlanPID:inDatabase:",  v26,  v15,  v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
  id v29 =  +[InstallmentPlanSummary insertOrUpdateSummary:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanSummary,  "insertOrUpdateSummary:forInstallmentPlanPID:inDatabase:",  v28,  v15,  v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v10 rewards]);

  +[PaymentTransactionReward updateRewards:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionReward,  "updateRewards:forInstallmentPlanPID:inDatabase:",  v30,  v15,  v8);
  return v14;
}

+ (id)installmentPlansForCreditAccountDetailsPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _installmentPlansWithQuery:v8]);
  return v9;
}

+ (id)installmentPlansWithTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionReferenceIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _installmentPlansWithQuery:v8]);
  return v9;
}

- (id)installmentPlan
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlan);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100076904;
  v23[3] = &unk_100638EF0;
  v23[4] = self;
  id v24 = v6;
  id v8 = v3;
  id v25 = v8;
  id v22 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v23);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[CreditInstallmentPlanLineItem lineItemForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "lineItemForInstallmentPlanPID:inDatabase:",  v9,  v10));
  -[PKCreditInstallmentPlan setLineItems:](v8, "setLineItems:", v21);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[CreditInstallmentPlanPayment paymentsForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanPayment,  "paymentsForInstallmentPlanPID:inDatabase:",  v9,  v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"dueDate",  1LL));
  v26 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingDescriptors:v13]);

  -[PKCreditInstallmentPlan setPayments:](v8, "setPayments:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[InstallmentPlanMerchant merchantForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanMerchant,  "merchantForInstallmentPlanPID:inDatabase:",  v9,  v10));
  -[PKCreditInstallmentPlan setMerchant:](v8, "setMerchant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[CreditInstallmentPlanProduct productForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProduct,  "productForInstallmentPlanPID:inDatabase:",  v9,  v10));
  -[PKCreditInstallmentPlan setProduct:](v8, "setProduct:", v16);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[InstallmentPlanSummary summaryForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanSummary,  "summaryForInstallmentPlanPID:inDatabase:",  v9,  v10));
  -[PKCreditInstallmentPlan setSummary:](v8, "setSummary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionReward rewardsInDatabase:forInstallmentPlanPID:]( &OBJC_CLASS___PaymentTransactionReward,  "rewardsInDatabase:forInstallmentPlanPID:",  v10,  v9));
  -[PKCreditInstallmentPlan setRewards:](v8, "setRewards:", v18);
  id v19 = v8;

  return v19;
}

+ (id)insertOrUpdateInstallmentPlans:(id)a3 forCreditAccountDetailsPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
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
          [v18 updateWithInstallmentPlan:v15];
        }

        else
        {
          id v19 = [objc_alloc((Class)a1) initWithInstallmentPlan:v15 forCreditAccountDetailsPID:v27 inDatabase:v9];
        }

        -[NSMutableSet addObject:](v10, "addObject:", v16);
        -[NSMutableSet addObject:](v29, "addObject:", v19);
      }

      id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v12);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v10));
  v34[0] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:v27]);
  v34[1] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  id v24 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v23]);
  [v24 deleteAllEntities];
  id v25 = -[NSMutableSet copy](v29, "copy");

  return v25;
}

- (void)updateWithInstallmentPlan:(id)a3
{
  id v40 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v40 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v40 state], @"c");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v40 lastUpdated]);
  v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v40 apr]);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", PKPercentageDecimalToStorageInteger(), @"e");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v40 duration], @"f");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v40 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"g");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v40 totalAmount]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"h");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v40 totalProductAmount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"i");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v40 totalInterestAmount]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"j");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v40 periodType], @"k");
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v40 transactionReferenceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"m");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v40 accountUserAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"n");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"l"));
  LOBYTE(v18) = [v21 BOOLValue];

  if ((v18 & 1) == 0) {
    -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v40 userViewedIntroduction],  @"l");
  }
  id v22 = -[NSMutableDictionary copy](v4, "copy", v40);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v41 lineItems]);
  id v26 =  +[CreditInstallmentPlanLineItem insertOrUpdateLineItems:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "insertOrUpdateLineItems:forInstallmentPlanPID:inDatabase:",  v25,  v23,  v24);

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v41 payments]);
  id v28 = [v27 count];

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v41 payments]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000770A0;
  v42[3] = &unk_10063DE20;
  v42[4] = v28;
  [v29 enumerateObjectsUsingBlock:v42];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v41 payments]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30));
  id v32 =  +[CreditInstallmentPlanPayment insertOrUpdatePayments:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanPayment,  "insertOrUpdatePayments:forInstallmentPlanPID:inDatabase:",  v31,  v23,  v24);

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v41 merchant]);
  id v34 =  +[InstallmentPlanMerchant insertOrUpdateMerchant:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanMerchant,  "insertOrUpdateMerchant:forInstallmentPlanPID:inDatabase:",  v33,  v23,  v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v41 product]);
  id v36 =  +[CreditInstallmentPlanProduct insertOrUpdateProduct:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProduct,  "insertOrUpdateProduct:forInstallmentPlanPID:inDatabase:",  v35,  v23,  v24);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v41 summary]);
  id v38 =  +[InstallmentPlanSummary insertOrUpdateSummary:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanSummary,  "insertOrUpdateSummary:forInstallmentPlanPID:inDatabase:",  v37,  v23,  v24);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 rewards]);
  +[PaymentTransactionReward updateRewards:forInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionReward,  "updateRewards:forInstallmentPlanPID:inDatabase:",  v39,  v23,  v24);
}

+ (void)deleteInstallmentPlansForCreditAccountDetailsPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[CreditInstallmentPlanLineItem deleteLineItemsForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanLineItem,  "deleteLineItemsForInstallmentPlanPID:inDatabase:",  v3,  v4);
  +[CreditInstallmentPlanPayment deletePaymentsForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanPayment,  "deletePaymentsForInstallmentPlanPID:inDatabase:",  v3,  v4);
  +[InstallmentPlanMerchant deleteMerchantForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanMerchant,  "deleteMerchantForInstallmentPlanPID:inDatabase:",  v3,  v4);
  +[CreditInstallmentPlanProduct deleteProductForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___CreditInstallmentPlanProduct,  "deleteProductForInstallmentPlanPID:inDatabase:",  v3,  v4);
  +[InstallmentPlanSummary deleteSummaryForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___InstallmentPlanSummary,  "deleteSummaryForInstallmentPlanPID:inDatabase:",  v3,  v4);
  +[PaymentTransactionReward deleteEntitiesForInstallmentPlanPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionReward,  "deleteEntitiesForInstallmentPlanPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___CreditInstallmentPlan;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForCreditAccountDetailsPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForTransactionReferenceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"m",  a3);
}

+ (id)_installmentPlansWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1000773D8;
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

+ (id)_propertyValuesForInstallmentPlan:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 state], @"c");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);
  v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 apr]);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", PKPercentageDecimalToStorageInteger(), @"e");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 duration], @"f");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"g");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"h");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 totalProductAmount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"i");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 totalInterestAmount]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"j");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 periodType], @"k");
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 userViewedIntroduction],  @"l");
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionReferenceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"m");

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 accountUserAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"n");

  id v21 = -[NSMutableDictionary copy](v4, "copy");
  return v21;
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10063DE60;
  v4[1] = &stru_10063DE80;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10063DEA0;
  v4[3] = &stru_10063DEC0;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10063DEE0;
  v4[5] = &stru_10063DF00;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_10063DF20;
  v4[7] = &stru_10063DF40;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_10063DF60;
  v4[9] = &stru_10063DF80;
  v3[10] = @"l";
  v3[11] = @"m";
  v4[10] = &stru_10063DFA0;
  v4[11] = &stru_10063DFC0;
  v3[12] = @"n";
  v4[12] = &stru_10063DFE0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  13LL));
}

@end