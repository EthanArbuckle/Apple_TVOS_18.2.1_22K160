@interface PayLaterAccountProduct
+ (id)_commonDictionaryForProduct:(id)a3;
+ (id)_payLaterProductsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_payLaterProductsWithQuery:(id)a3;
+ (id)_predicateForAccountDetailsPID:(int64_t)a3;
+ (id)_predicateForProductType:(unint64_t)a3;
+ (id)_propertySettersForPayLaterProductSetters;
+ (id)anyInDatabase:(id)a3 forProductType:(unint64_t)a4 accountDetailsPID:(int64_t)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)payLaterProductsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountProductForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePayLaterAccountProducts:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountProduct)initWithAccountProduct:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithProduct:(id)a3;
@end

@implementation PayLaterAccountProduct

+ (id)databaseTable
{
  return @"cucamelon";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterAccountProduct)initWithAccountProduct:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForProduct:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  id v15 = -[SQLiteEntity persistentID](v14, "persistentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 productDetails]);
  id v17 =  +[PayLaterAccountProductDetails insertOrUpdatePayLaterProductDetails:forPayLaterAccountProductPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProductDetails,  "insertOrUpdatePayLaterProductDetails:forPayLaterAccountProductPID:inDatabase:",  v16,  v15,  v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 eligibleSpend]);
  id v19 =  +[PayLaterAccountProductEligibleSpend insertOrUpdatePayLaterProductEligibleSpend:forPayLaterAccountProductPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProductEligibleSpend,  "insertOrUpdatePayLaterProductEligibleSpend:forPayLaterAccountProductPID:inDatabase:",  v18,  v15,  v8);

  return v14;
}

+ (void)insertOrUpdatePayLaterAccountProducts:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v16 = [v15 productType];
        id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 forProductType:v16 accountDetailsPID:a4]);
        if (v17)
        {
          id v18 = v17;
          [v17 updateWithProduct:v15];
        }

        else
        {
          id v18 = [objc_alloc((Class)a1) initWithAccountProduct:v15 forAccountDetailsPID:a4 inDatabase:v9];
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v16));
        -[NSMutableArray addObject:](v10, "addObject:", v19);
      }

      id v12 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v12);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v10));
  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a4]);
  v30[0] = v20;
  v30[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v23]);
  [v24 deleteAllEntities];
}

+ (void)deletePayLaterAccountProductForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[PayLaterAccountProductDetails deletePayLaterProductDetailsForPayLaterProductPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProductDetails,  "deletePayLaterProductDetailsForPayLaterProductPID:inDatabase:",  v3,  v4);
  +[PayLaterAccountProductEligibleSpend deletePayLaterProductEligibleSpendForPayLaterProductPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProductEligibleSpend,  "deletePayLaterProductEligibleSpendForPayLaterProductPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterAccountProduct;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)payLaterProductsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _payLaterProductsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)_payLaterProductsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PayLaterAccountProduct,  "queryWithDatabase:predicate:",  a3,  a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _payLaterProductsWithQuery:v5]);

  return v6;
}

+ (id)_payLaterProductsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterProductSetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_10038F7B8;
  id v16 = &unk_100638F18;
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

- (void)updateWithProduct:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForProduct:", v4);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v6);
  int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 productDetails]);
  id v10 =  +[PayLaterAccountProductDetails insertOrUpdatePayLaterProductDetails:forPayLaterAccountProductPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProductDetails,  "insertOrUpdatePayLaterProductDetails:forPayLaterAccountProductPID:inDatabase:",  v9,  v7,  v8);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 eligibleSpend]);
  id v12 =  +[PayLaterAccountProductEligibleSpend insertOrUpdatePayLaterProductEligibleSpend:forPayLaterAccountProductPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountProductEligibleSpend,  "insertOrUpdatePayLaterProductEligibleSpend:forPayLaterAccountProductPID:inDatabase:",  v11,  v7,  v8);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v13);
}

+ (id)_predicateForAccountDetailsPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForProductType:(unint64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)anyInDatabase:(id)a3 forProductType:(unint64_t)a4 accountDetailsPID:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductType:a4]);
  v15[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a5]);
  v15[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v12]);

  return v13;
}

+ (id)_propertySettersForPayLaterProductSetters
{
  int64_t v3 = @"b";
  id v4 = &stru_100659658;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

+ (id)_commonDictionaryForProduct:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = [v3 productType];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  return v4;
}

@end