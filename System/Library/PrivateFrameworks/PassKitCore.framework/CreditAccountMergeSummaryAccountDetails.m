@interface CreditAccountMergeSummaryAccountDetails
+ (BOOL)deleteMergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)_accountDetailsWithQuery:(id)a3;
+ (id)_predicateForMergeSummaryPID:(id)a3;
+ (id)_propertySettersForMergeSummaryAccountDetails;
+ (id)_propertyValuesForMergeSummaryAccountDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5;
+ (id)mergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4;
- (CreditAccountMergeSummaryAccountDetails)initWithMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5;
- (void)updateWithMergeSummaryAccountDetails:(id)a3;
@end

@implementation CreditAccountMergeSummaryAccountDetails

+ (id)databaseTable
{
  return @"credit_account_merge_summary_account_details";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountMergeSummary, a2) == a3) {
    return @"credit_account_merge_summary_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v16);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend( v18,  "initWithMergeSummaryAccountDetails:forMergeSummaryPID:inDatabase:",  v17,  v9,  v10,  (void)v28);
        if (v19) {
          -[NSMutableSet addObject:](v11, "addObject:", v19);
        }

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v14);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pk_setByApplyingBlock:", &stru_1006479B0));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"account_identifier",  v20));
  v32[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMergeSummaryPID:v9]);
  v32[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v24]);
  [v25 deleteAllEntities];
  id v26 = -[NSMutableSet copy](v11, "copy");

  return v26;
}

- (CreditAccountMergeSummaryAccountDetails)initWithMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForMergeSummaryAccountDetails:", v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v13 mutableCopy];
  [v14 setObjectOrNull:v9 forKey:@"credit_account_merge_summary_pid"];

  uint64_t v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v8);
  return v15;
}

- (void)updateWithMergeSummaryAccountDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForMergeSummaryAccountDetails:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)mergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMergeSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountDetailsWithQuery:v8]);
  return v9;
}

+ (BOOL)deleteMergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMergeSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForMergeSummaryPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"credit_account_merge_summary_pid",  a3);
}

+ (id)_accountDetailsWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForMergeSummaryAccountDetails]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100179250;
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

+ (id)_propertyValuesForMergeSummaryAccountDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"account_identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ownerAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"owner_alt_dsid");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 statementBalance]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"statement_balance");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"current_balance");

  id v13 = -[NSMutableDictionary copy](v4, "copy");
  return v13;
}

+ (id)_propertySettersForMergeSummaryAccountDetails
{
  v3[0] = @"account_identifier";
  v3[1] = @"owner_alt_dsid";
  v4[0] = &stru_1006479F0;
  v4[1] = &stru_100647A10;
  v3[2] = @"statement_balance";
  v3[3] = @"current_balance";
  v4[2] = &stru_100647A30;
  v4[3] = &stru_100647A50;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end