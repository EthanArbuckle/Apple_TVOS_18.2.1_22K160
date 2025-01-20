@interface CreditInstallmentPlanLineItem
+ (id)_lineItemsWithQuery:(id)a3;
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_predicateForInstallmentPlanPaymentPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanLineItem:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5;
+ (id)lineItemForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (id)lineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteLineItemsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteLineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4;
- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5;
@end

@implementation CreditInstallmentPlanLineItem

+ (id)databaseTable
{
  return @"currant";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditInstallmentPlan, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditInstallmentPlanPayment, v4) == a3) {
    return @"b";
  }
  return 0LL;
}

- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlanLineItem:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  v15 = v14;
  -[SQLiteEntity setValue:forProperty:](v15, "setValue:forProperty:", v9, @"a");

  return v15;
}

- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForInstallmentPlanLineItem:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  v15 = v14;
  -[SQLiteEntity setValue:forProperty:](v15, "setValue:forProperty:", v9, @"b");

  return v15;
}

+ (id)lineItemForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  v14 = @"order_index";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v13 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _lineItemsWithQuery:v10]);
  return v11;
}

+ (id)lineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPaymentPID:a3]);
  v14 = @"order_index";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v13 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _lineItemsWithQuery:v10]);
  return v11;
}

+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [a1 deleteLineItemsForInstallmentPlanPID:v8 inDatabase:v9];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002BEA60;
  v16[3] = &unk_100652D38;
  id v17 = v8;
  id v18 = v9;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = v11;
  id v12 = v9;
  id v13 = v8;
  [v10 enumerateObjectsUsingBlock:v16];

  if (-[NSMutableArray count](v11, "count")) {
    id v14 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [a1 deleteLineItemsForInstallmentPlanPaymentPID:v8 inDatabase:v9];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002BEC18;
  v16[3] = &unk_100652D38;
  id v17 = v8;
  id v18 = v9;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = v11;
  id v12 = v9;
  id v13 = v8;
  [v10 enumerateObjectsUsingBlock:v16];

  if (-[NSMutableArray count](v11, "count")) {
    id v14 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (void)deleteLineItemsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteLineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPaymentPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForInstallmentPlanPaymentPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_lineItemsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002BEEE4;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableArray count](v8, "count")) {
    id v10 = -[NSMutableArray copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)_propertyValuesForInstallmentPlanLineItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 type], @"c");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 duration], @"e");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 itemDescription]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"f");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 state], @"g");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"h");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentsToDateAmount]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"i");

  id v13 = -[NSMutableDictionary copy](v4, "copy");
  return v13;
}

+ (id)_propertySetters
{
  v3[0] = @"c";
  v3[1] = @"d";
  v4[0] = &stru_100652D78;
  v4[1] = &stru_100652D98;
  v3[2] = @"e";
  v3[3] = @"f";
  v4[2] = &stru_100652DB8;
  v4[3] = &stru_100652DD8;
  v3[4] = @"g";
  v3[5] = @"h";
  v4[4] = &stru_100652DF8;
  v4[5] = &stru_100652E18;
  v3[6] = @"i";
  v4[6] = &stru_100652E38;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end