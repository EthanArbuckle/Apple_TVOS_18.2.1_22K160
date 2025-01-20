@interface AccountFundingSourceVerificationAction
+ (BOOL)deleteVerificationActionsForAccountFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForFundingSourceVerificationPID:(int64_t)a3;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForVerificationAction:(id)a3;
+ (id)_verificationActionsWithQuery:(id)a3;
+ (id)_verificationOptionsFromString:(id)a3;
+ (id)_verificationOptionsToString:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVerificationActions:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)verificationActionsForFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountFundingSourceVerificationAction)initWithVerificationAction:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_verificationAction;
@end

@implementation AccountFundingSourceVerificationAction

+ (id)databaseTable
{
  return @"account_funding_source_verification_action";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountFundingSourceVerification, a2) == a3) {
    return @"account_funding_source_verification_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateVerificationActions:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFundingSourceVerificationPID:a4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v10]);

  v22 = v11;
  [v11 deleteAllEntities];
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [objc_alloc((Class)a1) initWithVerificationAction:*(void *)(*((void *)&v23 + 1) + 8 * (void)v17) forAccountFundingSourceVerificationPID:a4 inDatabase:v9];
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _verificationAction]);
        -[NSMutableArray safelyAddObject:](v12, "safelyAddObject:", v19);

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v15);
  }

  if (-[NSMutableArray count](v12, "count")) {
    id v20 = -[NSMutableArray copy](v12, "copy");
  }
  else {
    id v20 = 0LL;
  }

  return v20;
}

- (AccountFundingSourceVerificationAction)initWithVerificationAction:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForVerificationAction:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"account_funding_source_verification_pid"];

  id v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (id)verificationActionsForFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFundingSourceVerificationPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _verificationActionsWithQuery:v8]);
  return v9;
}

+ (BOOL)deleteVerificationActionsForAccountFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFundingSourceVerificationPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForFundingSourceVerificationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_funding_source_verification_pid",  v3));

  return v4;
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

- (id)_verificationAction
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountFundingSourceVerificationAction);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10023F84C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_verificationActionsWithQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10023F970;
  v7[3] = &unk_100643FD8;
  id v10 = a1;
  id v8 = a3;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = v3;
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

+ (id)_propertyValuesForVerificationAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v5, "setObjectOrNull:forKey:", v6, @"type");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 verificationOptions]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _verificationOptionsToString:v7]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v5, "setObjectOrNull:forKey:", v8, @"verification_options");

  return v5;
}

+ (id)_verificationOptionsToString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_10064EC98));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);

  return v4;
}

+ (id)_verificationOptionsFromString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@","]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pk_arrayByApplyingBlock:", &stru_10064ECB8));

  return v4;
}

+ (id)_propertySetters
{
  v7[0] = &stru_10064ECF8;
  v6[0] = @"type";
  v6[1] = @"verification_options";
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10023FCE4;
  v5[3] = &unk_10064ED18;
  v5[4] = a1;
  v2 = objc_retainBlock(v5);
  v7[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v3;
}

@end