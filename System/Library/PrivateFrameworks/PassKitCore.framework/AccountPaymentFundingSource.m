@interface AccountPaymentFundingSource
+ (BOOL)_deleteFundingSourcesWithQuery:(id)a3;
+ (BOOL)deletePaymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4;
+ (id)_fundingSourcesWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySettersForPaymentFundingSource;
+ (id)_propertyValuesForPaymentFundingSource:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePaymentFundingSources:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (id)paymentFundingSourceForAccountPID:(id)a3 identifier:(id)a4 inDatabase:(id)a5;
+ (id)paymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4;
- (AccountPaymentFundingSource)initWithPaymentFundingSource:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
- (BOOL)_deletePaymentFundingSource;
- (id)fundingSource;
- (int64_t)_type;
- (void)_insertOrUpdateFundingDetails:(id)a3;
- (void)updatePaymentFundingSource:(id)a3;
@end

@implementation AccountPaymentFundingSource

+ (id)databaseTable
{
  return @"account_payment_funding_source";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"account_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdatePaymentFundingSources:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v32;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v32 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v16]);
      id v18 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v17]);

      if (v18)
      {
        [v18 updatePaymentFundingSource:v15];
      }

      else
      {
        id v18 = [objc_alloc((Class)a1) initWithPaymentFundingSource:v15 forAccountPID:v28 inDatabase:v9];
        if (!v18) {
          continue;
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v18 persistentID]));
      -[NSMutableSet addObject:](v30, "addObject:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 fundingSource]);
      -[NSMutableArray addObject:](v10, "addObject:", v20);
    }

    id v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  }

  while (v12);
LABEL_12:

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"pid",  v30));
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v28]);
  v35[0] = v22;
  v35[1] = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v24]);
  [a1 _deleteFundingSourcesWithQuery:v25];
  if (-[NSMutableArray count](v10, "count")) {
    id v26 = -[NSMutableArray copy](v10, "copy");
  }
  else {
    id v26 = 0LL;
  }

  return v26;
}

- (AccountPaymentFundingSource)initWithPaymentFundingSource:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForPaymentFundingSource:", v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v13 setObjectOrNull:v9 forKey:@"account_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 fundingDetails]);

  -[AccountPaymentFundingSource _insertOrUpdateFundingDetails:](v15, "_insertOrUpdateFundingDetails:", v16);
  return v15;
}

- (void)updatePaymentFundingSource:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPaymentFundingSource:", v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 fundingDetails]);

  -[AccountPaymentFundingSource _insertOrUpdateFundingDetails:](self, "_insertOrUpdateFundingDetails:", v7);
}

- (void)_insertOrUpdateFundingDetails:(id)a3
{
  id v7 = a3;
  if (((unint64_t)-[AccountPaymentFundingSource _type](self, "_type") | 4) == 5)
  {
    int64_t v4 = -[SQLiteEntity persistentID](self, "persistentID");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v6 =  +[AccountPaymentFundingDetailsBankAccount insertOrUpdateFundingDetails:forAccountFundingSourcePID:inDatabase:]( &OBJC_CLASS___AccountPaymentFundingDetailsBankAccount,  "insertOrUpdateFundingDetails:forAccountFundingSourcePID:inDatabase:",  v7,  v4,  v5);
  }
}

+ (id)paymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _fundingSourcesWithQuery:v8]);
  return v9;
}

+ (id)paymentFundingSourceForAccountPID:(id)a3 identifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  v17[0] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v9]);

  v17[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fundingSource]);

  return v15;
}

+ (BOOL)deletePaymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [a1 _deleteFundingSourcesWithQuery:v8];
  return (char)v7;
}

+ (BOOL)_deleteFundingSourcesWithQuery:(id)a3
{
  id v4 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100228ACC;
  v11[3] = &unk_10063BE98;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v12 = v5;
  [v4 enumeratePersistentIDsUsingBlock:v11];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v6]);

  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_deletePaymentFundingSource
{
  if (((unint64_t)-[AccountPaymentFundingSource _type](self, "_type") | 4) == 5
    && (int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID"),
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database")),
        unsigned int v5 = +[AccountPaymentFundingDetailsBankAccount deleteFundingDetailsForAccountFundingSourcePID:inDatabase:]( &OBJC_CLASS___AccountPaymentFundingDetailsBankAccount,  "deleteFundingDetailsForAccountFundingSourcePID:inDatabase:",  v3,  v4),  v4,  !v5))
  {
    return 0;
  }

  else
  {
    return -[SQLiteEntity deleteFromDatabase](self, "deleteFromDatabase");
  }

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  a3);
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

- (id)fundingSource
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentFundingSource);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPaymentFundingSource");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100228D38;
  v16[3] = &unk_100638EF0;
  v16[4] = self;
  id v8 = v6;
  id v17 = v8;
  unsigned __int8 v9 = v3;
  id v18 = v9;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v16);

  if (((unint64_t)-[PKAccountPaymentFundingSource type](v9, "type") | 4) == 5)
  {
    int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPaymentFundingDetailsBankAccount fundingDetailsForAccountFundingSourcePID:inDatabase:]( &OBJC_CLASS___AccountPaymentFundingDetailsBankAccount,  "fundingDetailsForAccountFundingSourcePID:inDatabase:",  v10,  v11));
    -[PKAccountPaymentFundingSource setFundingDetails:](v9, "setFundingDetails:", v12);
  }

  uint64_t v13 = v18;
  v14 = v9;

  return v14;
}

+ (id)_fundingSourcesWithQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100228E5C;
  v7[3] = &unk_100643FD8;
  id v10 = a1;
  id v8 = a3;
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int8 v9 = v3;
  id v4 = v8;
  [v4 enumeratePersistentIDsUsingBlock:v7];
  if (-[NSMutableArray count](v3, "count")) {
    id v5 = -[NSMutableArray copy](v3, "copy");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (int64_t)_type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (id)_propertyValuesForPaymentFundingSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"type");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accountSuffix]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"account_suffix");

  return v4;
}

+ (id)_propertySettersForPaymentFundingSource
{
  v3[0] = @"identifier";
  v3[1] = @"type";
  v4[0] = &stru_10064D8E8;
  v4[1] = &stru_10064D908;
  v3[2] = @"account_suffix";
  v4[2] = &stru_10064D928;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end